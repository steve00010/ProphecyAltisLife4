/*
	File: fn_arcMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks arcs on the map for other arcs. Only initializes when the actual map is open.
*/
private["_markers","_arcs"];
_markers = [];
_arcs = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == east) then {_arcs pushBack _x;}} foreach playableUnits; //Fetch list of arcs
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";//u can find other colours here https://community.bistudio.com/wiki/setMarkerColor
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _arcs;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_arcs = [];
};