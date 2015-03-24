#include <macro.h>
/*
	File: fn_xpHandler.sqf
	Author: Steve - ProphecyGaming.co.uk	
	Description:
		Loads the player xp bar at the bottom of the screen.
*/

private ["_xp","_setup"];

if((_this select 0) == 0) then {
	life_xpneeded = 20*life_level*sqrt(life_level);
	player SVAR ["level",life_level,true];
} else {
	_xp = _this select 0;
	ADD(life_xp,_xp);
	if(life_xp >= life_xpneeded) then {
		life_xp = 0;
		life_level = life_level+1;
		life_xpneeded = 20*life_level*sqrt(life_level);
		hint format["Congrats you leveled up! Your new level is now %1!",life_level];
		player say3D "lvlup";
		player SVAR ["level",life_level,true];
	};
	if(life_xp < 0) then {
		life_xp = 0;
	};
};

