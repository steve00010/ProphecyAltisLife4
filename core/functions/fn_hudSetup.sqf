#include <macro.h>
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_alpha","_version","_p","_pg"];
disableSerialization;
_alpha = CONTROL(46,1001);
_version = CONTROL(46,1000);

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		_ca = CASH;
		_xp = life_xp;

		waitUntil {((damage player) != _dam) OR ((CASH) != _ca) OR ((life_xp) != _xp)};
		[] call life_fnc_hudUpdate;
	};
};