//	@file Version: 2.0
//	@file Name: staticHeliSpawning.sqf
//	@file Author: [404] Costlyy, Redshirt_Ensign
//	@file Created: 12/06/2013 21:00
//	@file Description: Random static helis
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_randomIndex","_selectedMarker","_position","_dir"];
_counter = 0;

while {_counter < 4} do // 4 helis spawn at the beginning (with 4 respawns on them)
{
    _randomIndex = floor (random (count HeliSpawnMarkers - 1));
    _selectedMarker = (HeliSpawnMarkers select _randomIndex) select 0;
    if (currentStaticHelis find _selectedMarker == -1) then {
        _position = (HeliSpawnMarkers select _randomIndex) select 1;
        _dir = (HeliSpawnMarkers select _randomIndex) select 2;
        //[_position, _dir, 4] call staticHeliCreation;
        [0, _position, 4] call staticHeliCreation;
        currentStaticHelis set [count currentStaticHelis, _selectedMarker];
        _counter = _counter + 1;
        diag_log format["DEBUG - Static heli spawned at %1",_position];
    };

};

diag_log format["WASTELAND SERVER - %1 Static helis Spawned",_counter];
