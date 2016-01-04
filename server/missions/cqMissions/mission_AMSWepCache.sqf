//	@file Version: 1.0
//	@file Name: mission_AMSWepCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, Redshirt_Ensign
//	@file Created: 08/12/2012 15:19
//	@file Args:
#include "setup.sqf"
#include "cqMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_box","_box2","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "AMS_WeaponCache_Marker";
_missionType = "AMS Weapons Stash";
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

diag_log format["WASTELAND SERVER - CQ Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createCQMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - CQ Mission Waiting to run: %1",_missionType];
[cqMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - CQ Mission Resumed: %1",_missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

_box = createVehicle ["RUOrdnanceBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box,"mission_AMS_Weapons"] call fn_refillbox;

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Close Quarters Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>An Anti-Material weapons stash has been reported near the marker</t>", _missionType,  cqMissionColor, subTextColor];
[nil,nil,rHINT,_hint] call RE;

CivGrpC = createGroup civilian;
[CivGrpC,_randomPos] spawn createSmallGroupCQ;

diag_log format["WASTELAND SERVER - CQ Mission Waiting to be Finished: %1",_missionType];
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif
waitUntil
{
    sleep 1; 
	_playerPresent = false;
	#ifdef __A2NET__
	_currTime = floor(netTime);
	#else
    _currTime = floor(time);
	#endif
    if(_currTime - _startTime >= cqMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _box <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpC);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box) == 1) OR (cancelMissionCQ)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    {deleteVehicle _x;}forEach units CivGrpC;
    deleteGroup CivGrpC;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>Objective failed, better luck next time</t>", _missionType, failMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - CQ Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteGroup CivGrpC;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The Anti-Material weapons have been secured</t>", _missionType, successMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - CQ Mission Success: %1",_missionType];
};

//Reset Mission Spot.
CQMissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;