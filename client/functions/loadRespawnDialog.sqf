//	@file Version: 2.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [FF] Redshirt_Ensign
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412
#define respawn_BlockedSpawns_Text 3413

waitUntil{!isnil "bis_fnc_init"};
disableSerialization;

private["_pos", "_rad", "_name", "_enemyCount", "_friendlyCount", "_friendlyTowns", "_side", "_dynamicControlsArray", "_dynamicControlsIndex", "_groupArray", "_text", "_players", "_playerArray"];

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;
_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;
_blockedSpawns_Text = _display displayCtrl respawn_BlockedSpawns_Text;

if(playerSide in [west]) then {_side = "Blufor"};
if(playerSide in [east]) then {_side = "Opfor"};
if(str(playerSide) == "GUER") then {_side = "Independent"};
_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);
respawnDialogActive = true;

_dynamicControlsArray = [
    [respawn_Town_Button0,respawn_PlayersInTown_Text0],
    [respawn_Town_Button1,respawn_PlayersInTown_Text1],
    [respawn_Town_Button2,respawn_PlayersInTown_Text2],
    [respawn_Town_Button3,respawn_PlayersInTown_Text3],
    [respawn_Town_Button4,respawn_PlayersInTown_Text4]];

{
    _button = _display displayCtrl (_x select 0);
    _button ctrlSetText format[""];
    _button ctrlShow false;
}foreach _dynamicControlsArray;

_groupArray = [];
_friendlyTowns = [];
_blockedSpawnsArray = [];
showBeacons = false;
while {respawnDialogActive} do
{
    _timeText = [time/60/60] call BIS_fnc_timeToString;
    _missionUptimeText ctrlSetText format["Mission Uptime: %1", _timeText];
    _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
    _blockedSpawnsArray = [];

    if(_side != "Independent") then
    {
        // Towns
        if(!showBeacons) then {
            {
                _pos = getMarkerPos (_x select 0);
                _name = _x select 2;
                _rad = _x select 1;
                _playerArray = [];

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(side _x == playerSide AND alive _x) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                            _playerArray set [count _playerArray, name _x];
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    }; 
                }forEach playableUnits;  

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, [_name, _playerArray]];
                };
                if((_friendlyCount > 0) AND (_enemyCount > 0)) then
                {
                    _blockedSpawnsArray set [count _blockedSpawnsArray, _name];
                    _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
                };

                _friendlyCount = 0;
                _enemyCount = 0; 
                
            }forEach cityList;

            {
                _button = _display displayCtrl (_x select 0);
                _text = _display displayCtrl (_x select 1);
                
                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                	// Set the button details
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex select 0;
                    _button ctrlSetText	format["%1",_name]; 
                    // Set the players in town text details
                    _text ctrlShow true;
                    _players = _friendlyTowns select _forEachIndex select 1;
                    _text ctrlSetText format["%1",_players]; 
                } else {
                    _name = "";
                    // reset button text and disable
                    _button ctrlSetText _name;
                    _button ctrlShow false; 
                    // reset players text and disable
                    _text ctrlSetText _name;
                    _text ctrlShow false; 
                };          
            }forEach _dynamicControlsArray;
            
            _friendlyTowns = [];    
            
        } else { //Beacons
            _enemyCount = 0;
            _dynamicControlsIndex = 0;
            {
                _button = _display displayCtrl (_x select 0);
                _text = _display displayCtrl (_x select 1);

                _button ctrlSetText format[""];
                _button ctrlShow false;
                _text ctrlSetText format[""];
                _text ctrlShow false;

            }foreach _dynamicControlsArray;

            {
                if(_side == "Blufor") then {
                    _pos = (pvar_beaconListBlu select _forEachIndex) select 1;
                    _name = (pvar_beaconListBlu select _forEachIndex) select 0;
                    _rad = (pvar_beaconListBlu select _forEachIndex) select 2;

                    {
                        if((getPos _x distance _pos) < _rad) then
                        {
                            _onTeam = str(side _x) in ["EAST","GUER"];
                            if(_onTeam) then {
                                if(!(side _x == playerSide)) then
                                {
                                    _enemyCount = _enemyCount + 1;
                                };
                            };
                        };
                    }forEach playableUnits;

                    if(_enemyCount == 0) then {
                        _button = _display displayCtrl (_dynamicControlsArray select _dynamicControlsIndex select 0);
                        _button ctrlShow true;
                        _button ctrlSetText	format["%1",_name];
                        _dynamicControlsIndex = _dynamicControlsIndex + 1;
                    } else {
                        _blockedSpawnsArray set [count _blockedSpawnsArray, _name];
                        _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
                    };
                };
                _enemyCount = 0;
            }forEach pvar_beaconListBlu;

            {
                if(_side == "Opfor") then {
                    _pos = (pvar_beaconListRed select _forEachIndex) select 1;
                    _name = (pvar_beaconListRed select _forEachIndex) select 0;
                    _rad = (pvar_beaconListRed select _forEachIndex) select 2;

                    {
                        if((getPos _x distance _pos) < _rad) then
                        {
                            _onTeam = str(side _x) in ["WEST","GUER"];
                            if(_onTeam) then {
                                if(!(side _x == playerSide)) then
                                {
                                    _enemyCount = _enemyCount + 1;
                                };
                            };
                        };
                    }forEach playableUnits;

                    if(_enemyCount == 0) then {
                        _button = _display displayCtrl (_dynamicControlsArray select _dynamicControlsIndex select 0);
                        _button ctrlShow true;
                        _button ctrlSetText	format["%1",_name];
                        _dynamicControlsIndex = _dynamicControlsIndex + 1;
                    } else {
                        _blockedSpawnsArray set [count _blockedSpawnsArray, _name];
                        _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
                    };
                };
                _enemyCount = 0;
            }forEach pvar_beaconListRed;
        };
    };
    
    if((count units group player > 1) AND (_side == "Independent")) then
    {
        _groupArray = [];
        {
            _groupArray set [count _groupArray,getPlayerUID _x];
        }forEach units player;

        //Towns
    	if(!showBeacons) then
        {
       	    {
                _pos = getMarkerPos (_x select 0);
                _name = _x select 2;
                _rad = _x select 1;
                _playerArray = [];

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(getPlayerUID _x in _groupArray) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                            _playerArray set [count _playerArray, name _x];
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    };
                }forEach playableUnits;

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, [_name, _playerArray]];
                };
                if((_friendlyCount > 0) AND (_enemyCount > 0)) then
                {
                    _blockedSpawnsArray set [count _blockedSpawnsArray, _name];
                    _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
                };

                _friendlyCount = 0;
                _enemyCount = 0;
            }forEach cityList;

            {
                _button = _display displayCtrl (_x select 0);
                _text = _display displayCtrl (_x select 1);

                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                	// Set the button details
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex select 0;
                    _button ctrlSetText	format["%1",_name];
                    // Set the players in town text details
                    _text ctrlShow true;
                    _players = _friendlyTowns select _forEachIndex select 1;
                    _text ctrlSetText format["%1",_players];
                } else {
                    _name = "";
                    // reset button text and disable
                    _button ctrlSetText _name;
                    _button ctrlShow false;
                    // reset players text and disable
                    _text ctrlSetText _name;
                    _text ctrlShow false; 
                };
            }forEach _dynamicControlsArray;

            _friendlyTowns = [];

        } else { //Beacons
            _enemyCount = 0;
            _dynamicControlsIndex = 0;
            {
                _button = _display displayCtrl (_x select 0);
                _text = _display displayCtrl (_x select 1);

                _button ctrlSetText format[""];
                _button ctrlShow false;
                _text ctrlSetText format[""];
                _text ctrlShow false;

            }foreach _dynamicControlsArray;

            {
                _pos = (pvar_beaconListInd select _forEachIndex) select 1;
                _name = (pvar_beaconListInd select _forEachIndex) select 0;
                _rad = (pvar_beaconListInd select _forEachIndex) select 2;
                _beaconOwnerUID = (pvar_beaconListInd select _forEachIndex) select 3;

                if(_beaconOwnerUID in _groupArray) then {

                    {
                        if((getPos _x distance _pos) < _rad) then
                        {
                            if(!(getPlayerUID _x in _groupArray)) then
                            {
                                _enemyCount = _enemyCount + 1;
                            };
                        };
                    }forEach playableUnits;

                    if(_enemyCount == 0) then {
                        _button = _display displayCtrl (_dynamicControlsArray select _dynamicControlsIndex select 0);
                        _button ctrlShow true;
                        _button ctrlSetText	format["%1",_name];
                        _dynamicControlsIndex = _dynamicControlsIndex + 1;
                    } else {
                        _blockedSpawnsArray set [count _blockedSpawnsArray, _name];
                        _blockedSpawns_Text ctrlSetText format["%1", _blockedSpawnsArray];
                    };

                };
                _enemyCount = 0;
            }forEach pvar_beaconListInd;

        };
    };
    sleep 0.5;
};