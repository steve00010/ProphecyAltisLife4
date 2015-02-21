/*
	File: fn_prisonbreak.sqf
	Author: Herman "Mordin" Othelius
*/
private["_unit","_obj","_handle"];
_unit = lbData[8101,(lbCurSel 8101)];
_obj = objNull;
{
	_temp = format["%1", _x];
	if(_temp == _unit) exitWith {
		_obj = _x;
	};
} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],25]; 
// 15 = distance from jail_marker
// this adds all the prisoners around the jail_marker within 15 meters



[_obj] spawn life_fnc_progressBar;