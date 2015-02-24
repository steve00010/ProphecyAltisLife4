/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_commandKey","_pushToTalkKeyArray","_pushToTalkDirectKeyArray""_CommandMode"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
_commandKey = actionKeys "TacticalView" select 0;

_pushToTalkKeyArray = actionKeys "PushToTalk";
_pushToTalkDirectKeyArray = actionKeys "PushToTalkDirect";
_pushToTalkSideKeyArray = actionKeys "PushToTalkSide";
_allTalkKeys = _pushToTalkKeyArray + _pushToTalkDirectKeyArray + _pushToTalkSideKeyArray;

_CommandMode = actionKeys "forceCommandingMode";

//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D
_isTalkKeys = ( _code in _allTalkKeys );

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])} ) exitWith {
true;
};



if(life_action_inUse && !(_isTalkKeys)) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith 
{
	Diag_log "Custom User Key 10 Pressed";
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then 
	{
		Diag_log "No Action in use. Continue with ActionKeyHandler";
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};
	
	case _commandKey:
	{
		hint "You are not allowed to use Tactical View";
		_handled = true;
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	/*
	case _pushToTalkKey;
	case _pushToTalkKey2:
	{
		_chan = "";
		disableSerialization;
		//waitUntil { !isNull (findDisplay 24) };
		_chan = ctrlText ((findDisplay 63) displayCtrl 101);
		if (_chan == "Side Channel") then 
		{
			[] spawn life_fnc_PunishSideChat;
			hint "You cannot use voice in Side Chat"; 
			_handled = true; 
		};
	};*/
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !(player getVariable "restrained") && speed cursorTarget < 1) then
		{
			Diag_log "Restrain Progressing to fnc_restrainAction";
			[] call life_fnc_restrainAction;
		}
		else
		{
			// Temp logging for restrain issue
			if (playerSide == west) then
			{
				// Log if west only
				Diag_log format["Restrain Log : Speed of target (%1) , Distance to target (%2) , Is restrained already? (%3) , Are you restrained (%4) , Is target being escorted? (%5)",speed cursorTarget, cursorTarget distance player, cursorTarget getVariable "restrained", player getVariable "restrained", cursorTarget getVariable "Escorting"];
				
			};
		};
		
		
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,west]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && (cursorTarget getVariable "surrender") && !(cursorTarget getVariable "restrained") && !(player getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		
		if(_ctrlKey) then {_handled = true;};
		if (_ctrlKey) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
		if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
		{
		[cursorTarget] spawn life_fnc_knockoutAction;
		if("ItemRadio" in assignedItems cursorTarget) then {
			cursorTarget removeweapon "ItemRadio";
			hint "The cellphone of the person was placed on the ground.";
			_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);}
			else { hint "The person that you knock out have no cellphone!"};
			};
		};
	};
	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in life_sirenLightsVehicles) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_sirenLights;
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case 33:
    {   if (_shift) then
        {
            if(playerSide == west && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren2_active = true;
                    sleep 4.7;
                    life_siren2_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
                if((_veh getVariable "siren2")) then
                {
                    titleText ["Yelp Off","PLAIN"];
                    _veh setVariable["siren2",false,true];
                }
                     else
                {
                    titleText ["Yelp On","PLAIN"];
                    _veh setVariable["siren2",true,true];
                    [[_veh],"life_fnc_copSiren2",nil,true] spawn life_fnc_MP;
                };
            };
        };

        if (!_shift) then
        {
            if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirens Off","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirens On","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
					//[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
					};	
                };
            };                                            
        };
    };
	
	// Q Key options for Pickaxe
	case 184: 
	{
		if((!life_action_inUse) && (vehicle player == player) ) then
		{
			{
				_str = [_x] call life_fnc_varToStr;
				_val = missionNameSpace getVariable _x;
				if(_val > 0 ) then
				{
					if( _str == "Pickaxe" || _str == "pickaxe" ) then
					{
						[] spawn life_fnc_pickAxeUse;
					};
				};
			} foreach life_inv_items;
		}
	};
	
	// O, police gate opener
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
		
		/* if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && (cursorTarget getVariable "surrender") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		}; */
	};
	
	case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F"])) then
		//if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_MRAP_01_hmg_F"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };
	
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint "You are not near a door!"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat "You have locked that door.";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat "You have unlocked that door.";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat "You have unlocked your vehicle.";
						player say3D "vehicle_lock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat "You have locked your vehicle.";
						player say3D "vehicle_lock";
					};
				};
			};
		};
	};

	default
	{
		// Push To Talk Direct
		if ( _code in _pushToTalkDirectKeyArray ) then
		{
			_Talking = player getVariable["Talking", false ];
			if ( !(_Talking) ) then
			{
				player setVariable["Talking", true, true];
			};
		};
		
		if ( _code in _pushToTalkSideKeyArray ) then
		{
			hint "You cannot use voice in Side Chat"; 
			_handled = true; 
		};
		
		// Push to Talk 
		if ( _code in _pushToTalkKeyArray ) then
		{
			_chan = "";
			disableSerialization;
			//waitUntil { !isNull (findDisplay 24) };
			_chan = ctrlText ((findDisplay 63) displayCtrl 101);
			if ( ( _chan == localize "str_channel_direct" ) OR ( _chan == "Direct communication" ) ) then 
			{
				_Talking = player getVariable["Talking", false ];
				if ( !(_Talking) ) then
				{
					player setVariable["Talking", true, true];
				};
			};
			
			if ( ( _chan == localize "str_channel_side" ) OR ( _chan == "Side Channel" ) ) then 
			{
				[] spawn life_fnc_PunishSideChat;
				hint "You cannot use voice in Side Chat"; 
				_handled = true; 
			};
		};

		if ( _code in _CommandMode ) then
		{
			hint "You cannot use Command Mode"; 
			_handled = true; 
		};
		
	};
};

_handled;