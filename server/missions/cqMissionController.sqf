//	@file Version: 1.0
//	@file Name: cqMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [FF] Redshirt Ensign
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "setup.sqf"
#include "cqMissions\cqMissionDefines.sqf";

private ["_CMarray","_lastMission","_randomIndex","_mission","_missionType","_cmCycleArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started CQ Mission State"];

//CQ Mission Array
_CMarray = [
            [mission_CQCWepCache,"mission_CQCWepCache"],
            [mission_CQCWepCache,"mission_CQCWepCache2"],
            [mission_AMSWepCache,"mission_AMSWepCache"],
            [mission_SniperWepCache,"mission_SniperWepCache"],
            [mission_StaticWepCache,"mission_StaticWepCache"],
            [mission_StaticWepCache,"mission_StaticWepCache2"]
           ];

_lastMission = "nomission";
_cmCycleArray = + _CMarray;
while {true} do
{
    //Refill cycle array if empty
    if((count _cmCycleArray) < 1) then { _cmCycleArray = + _CMarray; };

    //Select Mission using random index
    _randomIndex = (floor(random (count _cmCycleArray)));
    diag_log format["DEBUG - CQ Mission random index = %1 / %2",_randomIndex, count _cmCycleArray];
    _mission = _cmCycleArray select _randomIndex select 0;
    _missionType = _cmCycleArray select _randomIndex select 1;
    //Select new mission if the same as previous
    if((str(_missionType) == _lastMission) && ((count _cmCycleArray) > 1) ) then {
        if(_randomIndex < 1) then { _randomIndex = _randomIndex + 1; } else { _randomIndex = _randomIndex - 1; };
        _mission = _cmCycleArray select _randomIndex select 0;
        _missionType = _cmCycleArray select _randomIndex select 1;
    };
    //Remove mission from cycle array
    _cmCycleArray set [_randomIndex, "REMOVETHISCRAP"];
    _cmCycleArray = _cmCycleArray - ["REMOVETHISCRAP"];

    cancelMissionCQ = false;
    _missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New CQ Mission: %1",_missionType];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Close Quarters Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", cqMissionDelayTime / 60, cqMissionColor, subTextColor];
    [nil,nil,rHINT,_hint] call RE;
    _lastMission = _missionType;
    waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5;
};