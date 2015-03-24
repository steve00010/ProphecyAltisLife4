#include <macro.h>
/*
	File: fn_goSkyDiving.sqf
	Author: Steve - ProphecyGaming.co.uk
	Description: Sends the player sky diving 
*/

if(playerSide != civilian) exitWith { 
	hint "Get back to work, this isn't for you!";
};
if(CASH < 1000) exitWith {
	hint "You do not have $1000 to go sky-diving!";
};
if(FETCH_CONST(life_donator) < 3) exitWith { 
	hint "Sorry but you need donator level 3 to skydive :(";
};
if(backpack player != "") exitWith { 
	hint "You cannot go skydiving with a backpack on!";
};
if(currentWeapon player != "") exitWith { 
	hint "You cannot go skydiving with a weapon!";
};
private["_col","_smoke"];
hint "You've paid!";
SUB(CASH,1000);
cutText ["", "BLACK OUT", 2];
cutText ["Preparing to jump...!", "BLACK FADED"];
sleep 2;
player addBackpack "B_Parachute";
sleep 1;
cutText ["GO!! Don't forget to pull your parachute!", "BLACK FADED"];
player setPos [getPos player select 0, getPos player select 1, 800];

_col = switch (floor(random 6)) do {
	case 0: {"SmokeShell";};
	case 1: {"SmokeShellPurple";};
	case 2: {"SmokeShellRed";};
	case 3: {"SmokeShellOrange";};
	case 4: {"SmokeShellYellow";};
	case 5: {"SmokeShellGreen";};
};


cutText["","PLAIN"]; 
waitUntil {(vehicle player != player)};	
_smoke = _col createVehicle position player;
_smoke attachTo [vehicle player, [0,-0.1,1.5]]; 
sleep 2;

waitUntil {isTouchingGround player};
hint "Hope you had fun!";