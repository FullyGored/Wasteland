//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
#include "setup.sqf"
#include "mainMissions\mainMissionDefines.sqf";

if(!isServer) exitWith {};

private ["_MMarray","_lastMission","_randomIndex","_mission","_missionType","_mmCycleArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started Main Mission State"];

//Main Mission Array
// _MMarray = [
//             [mission_Heli,"mission_Heli"],
//             [mission_HeavyHeli,"mission_HeavyHeli"],
//             [mission_APC,"mission_APC"],
//             [mission_LightArmVeh,"mission_LightArmVeh"],
//             [mission_LightTank,"mission_LightTank"],
//             [mission_MBT,"mission_MBT"],
//             [mission_SupplyDrop,"mission_SupplyDrop"],
//             [mission_Outpost,"mission_Outpost"],
//             [mission_RadarTruck,"mission_RadarTruck"]];
_MMarray = [
            [mission_Heli,"mission_Heli"],
            [mission_Heli2,"mission_Heli"],
            [mission_HeavyHeli,"mission_HeavyHeli"],
            [mission_APC,"mission_APC"],
            [mission_LightArmVeh,"mission_LightArmVeh"],
            [mission_LightArmVeh2,"mission_LightArmVeh"],
            [mission_LightTank,"mission_LightTank"],
            [mission_LightTank2,"mission_LightTank"],
            [mission_MBT,"mission_MBT"],
            [mission_MBT2,"mission_MBT"]
            ];

_lastMission = "nomission";
_mmCycleArray = + _MMarray;
while {true} do
{
    //Refill cycle array if empty
    if((count _mmCycleArray) < 1) then { _mmCycleArray = + _MMarray; };

    //Select Mission using random index
    _randomIndex = (floor(random (count _mmCycleArray)));
    diag_log format["DEBUG - Main Mission random index = %1 / %2",_randomIndex, count _mmCycleArray];
    _mission = _mmCycleArray select _randomIndex select 0;
    _missionType = _mmCycleArray select _randomIndex select 1;
    //Select new mission if the same as previous
    if((str(_missionType) == _lastMission) && ((count _mmCycleArray) > 1) ) then {
        if(_randomIndex < 1) then { _randomIndex = _randomIndex + 1; } else { _randomIndex = _randomIndex - 1; };
        _mission = _mmCycleArray select _randomIndex select 0;
        _missionType = _mmCycleArray select _randomIndex select 1;
    };
    //Remove mission from cycle array
    _mmCycleArray set [_randomIndex, "REMOVETHISCRAP"];
    _mmCycleArray = _mmCycleArray - ["REMOVETHISCRAP"];

    //Spawn mission
    cancelMissionMain = false;
    _missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Main Mission: %1",_missionType];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", mainMissionDelayTime / 60, mainMissionColor, subTextColor];
    [nil,nil,rHINT,_hint] call RE;
    _lastMission = _missionType;
    waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5;
};
