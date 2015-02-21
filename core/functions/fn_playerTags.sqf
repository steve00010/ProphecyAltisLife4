#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];

SUB(_units,[player]);

{
	private "_text";
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x GVAR "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x GVAR ["realname",name _x])];};
								//Dead Players _x GVAR ["realname",name _x]
				case (!alive _x): {
					_text = format["<t color='#000000'>%1</t>", _name];
				};
				case (!isNil {(_x GVAR "rank")}): {
					format["<img image='%1' size='1'></img> %2",
					switch ((_x GVAR "rank")) do {
						case 2: {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa",format["Marshall %1", _x GVAR ["realname",name _x]]}; 
						case 3: {"\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa",format["Corporal %1", _x GVAR ["realname",name _x]]};
						case 4: {"\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa",format["Sergeant %1", _x GVAR ["realname",name _x]]};
						case 5: {"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa",format["Lieutenant %1", _x GVAR ["realname",name _x]]};
						case 6: {"\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa",format["Captain %1", _x GVAR ["realname",name _x]]};
						case 7: {"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa",format["Chief %1", _x GVAR ["realname",name _x]]};
						case 8: {"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa",format["Chief %1", _x GVAR ["realname",name _x]]};
						default {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa",format["Cadet %1", _x GVAR ["realname",name _x]]};
					}]};
				case ((!isNil {_x GVAR "name"} && playerSide == independent)): {
					format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x GVAR ["name","Unknown Player"]];
				};
				//Medics
				case(_x getVariable["medlevel", 0] > 0): {
					_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa";
					_name = format["Medic %1",name _x];
					_text = format["<img image='%2' size='1'></img><t color='#FF0000'> %1</t>", _name, _icon];
				};
				
				default {
					if(!isNil {(group _x) GVAR "gang_name"}) then {
						format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
					} else {
						_x GVAR ["realname",name _x];
					};
				};
			};
			if(_x getVariable ["speaking",false]) then {_text = "[Talking...] " + _text};
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;