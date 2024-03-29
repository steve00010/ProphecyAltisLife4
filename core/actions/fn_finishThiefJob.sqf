#include <macro.h>
/*
	File: fn_finishThiefJob.sqf
	Author: Steve - ProphecyGaming.co.uk
	Description: Finish the Thief Job for the player
*/
private["_nearVehicles","_nearVehicles1","_vehicle","_className"];
if(!license_civ_rebel) exitWith { hint "You need to be a rebel!";};
if(!life_carjob_taken) exitWith { hint format["You don't have a job!",life_carjob_name];};
_nearVehicles1 = [];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
	_nearVehicles1 pushBack _vehicle;
}
else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],25]; //Fetch vehicles within 25m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) != _vehOwner) exitWith
				{
					_nearVehicles1 pushBack _x;
				};
			};
		} foreach _nearVehicles;
	};
};
if(count _nearVehicles1 == 0) exitWith {titleText[format["There's nothing I want here! Bring me a %1!",life_carjob_name],"PLAIN"];};
{
	if(alive _x) then {
		_className = typeOf _x;		
		if(_className == life_carjob_type) exitWith {
			life_carjob_taken = false;
			life_carjob_type = "";
			life_carjob_name = "";
			life_carjob_finished = time;
			ADD(CASH,life_carjob_pay);
			life_carjob_pay = 0;
			titleText["Ahh man, sweeeet, heres your cash!","PLAIN"];
			deleteVehicle _x;
		}
	};
} foreach _nearVehicles1;