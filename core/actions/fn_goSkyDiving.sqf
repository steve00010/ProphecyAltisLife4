#include <macro.h>
/*
	File: fn_goSkyDiving.sqf
	Author: Steve
	Description: Sends the player sky diving 
*/

if(CASH < 1000) exitWith {
	titleText "You do not have $1000 to go sky-diving!";
};
if(FETCH_CONST(life_donatorlevel) < 5) exitWith { 
	titleText "Sorry but you need donator level 5 to skydive :(";
};
if(backpack player != "") exitWith { 
	titleText "You cannot go skydiving with a backpack on!";
};
if(currentWeapon player != "") exitWith { 
	titleText "You cannot go skydiving with a weapon!";
};
SUB(CASH,1000);
cutText ["", "BLACK OUT", 5];
player addBackpack "B_Parachute";
sleep 3;
titleText "Preparing to jump...";
sleep 1;
titleText "GO!! Don't forget to pull your parachute!";
player setPos [getPos player select 0, getPos player select 1, 800];
cutText["","PLAIN"]; 
sleep 2;
titleText "";
waitUntil {isTouchingGround player};
titleText "Hope you had fun!";