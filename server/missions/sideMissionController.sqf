//	@file Version: 1.0
//	@file Name: sideMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "setup.sqf"
#include "sideMissions\sideMissionDefines.sqf";

private ["_SMarray","_lastMission","_randomIndex","_mission","_missionType","_smCycleArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started Side Mission State"];

//Side Mission Array
_SMarray = [
            [mission_AirWreck,"mission_AirWreck"],
            [mission_WepCache,"mission_WepCache"],
            [mission_ReconVeh,"mission_ReconVeh"],
            [mission_Truck,"mission_Truck"]];

_lastMission = "nomission";
_smCycleArray = + _SMarray;
while {true} do
{
    //Refill cycle array if empty
    if((count _smCycleArray) < 1) then { _smCycleArray = + _SMarray; };

    //Select Mission using random index
    _randomIndex = (floor(random (count _smCycleArray)));
    diag_log format["DEBUG - Side Mission random index = %1 / %2",_randomIndex, count _smCycleArray];
    _mission = _smCycleArray select _randomIndex select 0;
    _missionType = _smCycleArray select _randomIndex select 1;
    //Select new mission if the same as previous
    if((str(_missionType) == _lastMission) && ((count _smCycleArray) > 1) ) then {
        if(_randomIndex < 1) then { _randomIndex = _randomIndex + 1; } else { _randomIndex = _randomIndex - 1; };
        _mission = _smCycleArray select _randomIndex select 0;
        _missionType = _smCycleArray select _randomIndex select 1;
    };
    //Remove mission from cycle array
    _smCycleArray set [_randomIndex, "REMOVETHISCRAP"];
    _smCycleArray = _smCycleArray - ["REMOVETHISCRAP"];

    //Spawn mission
    cancelMissionSide = false;
    _missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Side Mission: %1",_missionType];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", sideMissionDelayTime / 60, sideMissionColor, subTextColor];
    [nil,nil,rHINT,_hint] call RE;
    _lastMission = _missionType;
    waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5;
};
