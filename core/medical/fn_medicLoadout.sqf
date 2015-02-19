/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

["U_B_CombatUniform_mcam_worn",true] call life_fnc_handleItem;
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemGPS";
player assignItem "ItemGPS";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
[player, true] call life_fnc_HandleUniforms; 
[] call life_fnc_saveGear;