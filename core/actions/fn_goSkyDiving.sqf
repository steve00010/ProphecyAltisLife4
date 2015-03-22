#include <macro.h>
/*
	File: fn_goSkyDiving.sqf
	Author: Steve
	Description: Sends the player sky diving 
*/

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
hint "You've paid!";
SUB(CASH,1000);
cutText ["", "BLACK OUT", 2];
cutText ["Preparing to jump...!", "BLACK FADED"];
sleep 2;
player addBackpack "B_Parachute";
sleep 1;
cutText ["GO!! Don't forget to pull your parachute!", "BLACK FADED"];
player setPos [getPos player select 0, getPos player select 1, 800];
cutText["","PLAIN"]; 
sleep 2;

waitUntil {isTouchingGround player};
hint "Hope you had fun!";