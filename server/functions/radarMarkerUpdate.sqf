//	@file Version: 1.0
//	@file Name: radarMarkerUpdate.sqf
//	@file Author: [404] Costlyy, [FF] Redshirt Ensign
//	@file Created: 08/12/2012 15:19
//	@file Args: [int(key)]

if(!X_Server) exitWith {};

private["_uniqueID", "_radarStationPos", "_playerSide", "_markerState", "_playerUID", "_enemyCount", "_friendlyCount", "_currSide", "_runLoop", "_stillAlive", "_groupArray"];

_uniqueID = _this select 0;
_radarStationPos = _this select 1;
_playerSide = _this select 2;
_markerState = _this select 3;
_playerUID = _this select 4;
_groupArray = [];

// get player that is owner of radar
{
    if(getPlayerUID _x == _playerUID) then { _player = _x; };
}forEach playableUnits;

_runLoop = true;
while {_runLoop} do {
	_stillAlive = false;

        // Check if Indy Group Radar
        if(str(_playerSide) == "GUER") then {
            _groupArray = [];
            {
                _groupArray set [count _groupArray,getPlayerUID _x];
            }forEach units _player;

            // find state
            _enemyCount = 0;
            _friendlyCount = 0;
            {
              if ((isPlayer _x) AND _x distance _radarStationPos < 350) then {
                  if (getPlayerUID _x in _groupArray) then {
                      _friendlyCount = _friendlyCount + 1;
                  } else {
                      _enemyCount = _enemyCount + 1;
                  };
              };
            }forEach playableUnits;

        } else {
            // find state
            _enemyCount = 0;
            _friendlyCount = 0;
            {
              _currSide = side _x;

              if ((isPlayer _x) AND (str(_currSide) == _playerSide) AND _x distance _radarStationPos < 350) then {
                  _friendlyCount = _friendlyCount + 1;
              };
              if ((isPlayer _x) AND (str(_currSide) != _playerSide) AND _x distance _radarStationPos < 350) then {
              	_enemyCount = _enemyCount + 1;
              };
            }forEach playableUnits;
        };




    if(_friendlyCount == 0 AND _enemyCount == 0 ) then {
    	_markerState = 0; // default - nothing
    };
    if(_friendlyCount > 0) then {
    	_markerState = 1; // Friendly NO enemy
    };
    if(_enemyCount > 0) then {
    	_markerState = 2; // Enemy NO friendly
    };
    if(_enemyCount > 0 AND _friendlyCount > 0) then {
    	_markerState = 3; // Enemy AND friendly
    };

   	{
    	if(_x select 0 == _uniqueID) then {
        	_stillAlive = true;

            // delete current marker from server
            clientRadarMarkers set [_forEachIndex, "REMOVETHISCRAP"];
			clientRadarMarkers = clientRadarMarkers - ["REMOVETHISCRAP"];

            // put updated marker in with updated state
			clientRadarMarkers set [count clientRadarMarkers,[_uniqueID,_radarStationPos,_playerSide,_markerState,_playerUID]];
			publicVariable "clientRadarMarkers";
        };
    }forEach clientRadarMarkers;

	if (!_stillAlive) exitWith {_runLoop = false;};
    sleep 3;
};