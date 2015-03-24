#include <macro.h>
/*
	File: fn_vehicleSkins.sqf
	Author: Steve - ProphecyGaming.co.uk
	
	Description:
	Checks if the skin is a donator skin
*/
private["_veh","_skin","_classname","_don"];
_veh = _this select 0;
waitUntil{!isNil {_veh getVariable "Life_VEH_color"}};
_skin = _veh getVariable "Life_VEH_color";
_classname = typeOf _veh;
_don = FETCH_CONST(life_donator);



switch (_classname) do
{
	case "C_Offroad_01_F": 
	{
		if((_skin == 9 OR _skin == 10) AND _don < 1) then {
			_newS = random 5;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 11 OR _skin == 12 OR _skin == 13) AND _don < 5) then {
			_newS = random 5;
			hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 14) AND !license_cop_dea) then {
			hint "You are not DEA, skin being set to normal police.";
			[[_veh,6],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
	case "C_SUV_01_F":
	{
		if((_skin == 3 OR _skin == 10 OR _skin == 11 OR _skin == 12 OR _skin == 13) AND _don < 3) then {
			_newS = random 2;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 6 OR _skin == 7) AND _don < 2) then {
			_newS = random 2;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
	case "C_Hatchback_01_sport_F":
	{
		if((_skin == 7 OR _skin == 8) AND _don < 2) then {
			_newS = random 5;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 9) AND _don < 3) then {
			_newS = random 5;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 10 OR _skin == 11) AND _don < 4) then {
			_newS = random 5;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
		if((_skin == 12) AND _don < 5) then {
			_newS = random 5;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
	case "B_Heli_Light_01_F":
	{
		if((_skin == 13) AND _don < 1) then {
			_newS = random 11;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
	case "O_Heli_Light_02_unarmed_F":
	{
		if((_skin == 6) AND _don < 2) then {
			_newS = random 2;
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,_newS],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
	case "I_Heli_Transport_02_F": 
	{
		if((_skin == 0 OR _skin == 2 ) AND _don < 5) then {
			 hint "Car skin has been temporarily set to a random non-donator skin.";
			[[_veh,1],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
		};
	};
};