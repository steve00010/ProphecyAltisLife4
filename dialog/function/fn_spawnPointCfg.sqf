/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_5","Sofia HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_1_1","Training Center","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
	
	case civilian:
	{
		
		//if have Arc license, only spawn here
		if(license_civ_arc && playerSide == civilian) then {
		_return = [
					["adac_headquarters","Arc H.Q","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_5","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]

				];
		};
		
		//if have reb license, only spawn here
		if(license_civ_rebel && playerSide == civilian) then {
		_return = [
					["reb_spawn_2","Rebel Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["reb_spawn_1","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["reb_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				];
		};
		
		//if no rebel license, than can spawn normal loc
		
		if(!license_civ_rebel && playerSide == civilian) then {
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_5","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	    };	
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;