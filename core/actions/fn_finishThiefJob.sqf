#include <macro.h>
/*
	File: fn_finishThiefJob.sqf
	Author: Steve - ProphecyGaming.co.uk
	Description: Finish the Thief Job for the player
*/

if(!license_civ_reb) exitWith { hint "You need to be a rebel!";};
if(!carjob_taken) exitWith { hint format["You don't have a job!",carjob_name];};

if(vehicle player != player) then
{
	_vehicle = vehicle player;
	_nearVehicles1 pushBack _vehicle;
}
else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Truck"],25]; //Fetch vehicles within 25m.
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
if(count _nearVehicles1 == 0) exitWith {titleText[format["There's nothing I want here! Bring me a %1!",carjob_name],"PLAIN"];};
{
	if(alive _x) then {
		_className = typeOf _x;		
		if(_className == carjob_type) exitWith {
			carjob_taken = false;
			carjob_type = "";
			carjob_name = "";
			ADD(CASH,carjob_pay);
			carjob_pay = 0;
			titleText["Ahh man, sweeeet, heres your cash!","PLAIN"];
		}
	};
} foreach _nearVehicles1;