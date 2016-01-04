//	@file Version: 1.0
//	@file Name: createCQMissionLocation.sqf
//	@file Author: [404] Deadbeat, [FF] Redshirt Ensign
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_GotLoc","_randomIndex","_selectedMarker","_returnData"];

_GotLoc = false;
while {!_GotLoc} do 
{
	_randomIndex = random (count CQMissionSpawnMarkers - 1);

	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!((CQMissionSpawnMarkers select _randomIndex) select 1)) then
	{
            _selectedMarker = CQMissionSpawnMarkers select _randomIndex select 0;
            _randomPos = getMarkerPos _selectedMarker;
            _returnData = [_randomPos,_randomIndex];
            CQMissionSpawnMarkers select _randomIndex set[1, true];
            _GotLoc = true;
	};
};
_returnData