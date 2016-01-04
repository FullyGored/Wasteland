//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [FF] Redshirt_Ensign
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_failSafePos","_pos","_markerName","_marker","_hint","_safePos","_boxes", "_nerfBoxes", "_currBox"];

_counter = 0;
_failSafePos = [7069.23,7701.35,0.00143433];

_nerfBoxes = ["basicUS","basicUS2","basicRU","basicRU2","basicGER","basicPMC","basicSpecial","basicSpecial2","basicSpecial3"];

for "_i" from 0 to 770 step 25 do
{
	_pos = getMarkerPos format ["Spawn_%1", _i];
    _currBox = _nerfBoxes select (random (count _nerfBoxes - 1));
    _safePos = [_pos, 25, 50, 1, 0, 60 * (pi / 180), 0, [], [_failSafePos]] call BIS_fnc_findSafePos;
    [_currBox, _safePos] execVM "server\spawning\boxCreation.sqf";
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];