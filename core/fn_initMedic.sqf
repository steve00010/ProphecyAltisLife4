#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};
player setVariable["medlevel",(FETCH_CONST(life_medicLevel)),true];

[] spawn life_fnc_welcomeNotification;
waitUntil{!isNull (findDisplay 2300)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 2300)}; //Wait for the welcome to be done.

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.