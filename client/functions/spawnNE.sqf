//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [DI] Dammit, [FF] Redshirt Ensign
//	@file Created: 28/11/2012 05:19
//	@file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos","_availableLoc","_groupMembers","_friendlyCount","_enemyCount","_marker","_rad","_name"];

_availableLoc = [];
_groupMembers = [];
_friendlyCount = 0;
_enemyCount = 0;

if(str(playerSide) != "GUER") then
{
      {
          _marker = _x select 0;
          _pos = getMarkerPos _marker;
          _rad = _x select 1;
          _name = _x select 2;

          {
              if((getPos _x distance _pos) < _rad) then
              {
                  if(side _x == playerSide AND alive _x) then
                  {
                      _friendlyCount = _friendlyCount + 1;
                  }else{
                      _enemyCount = _enemyCount + 1;
                  };
              };
          }forEach playableUnits;

          if(_enemyCount == 0) then
          {
              _availableLoc set [count _availableLoc, [_marker, _rad, _name]];
          };
          _friendlyCount = 0;
          _enemyCount = 0;

      }forEach cityListNE;

} else {
      {
          _groupMembers set [count _groupMembers,getPlayerUID _x];
      }forEach units player;

      {
          _marker = _x select 0;
          _pos = getMarkerPos _marker;
          _rad = _x select 1;
          _name = _x select 2;

          {
              if((getPos _x distance _pos) < _rad) then
              {
                  if(getPlayerUID _x in _groupMembers) then
                  {
                      _friendlyCount = _friendlyCount + 1;
                  }else{
                      _enemyCount = _enemyCount + 1;
                  };
              };
          }forEach playableUnits;

          if(_enemyCount == 0) then
          {
              _availableLoc set [count _availableLoc, [_marker, _rad, _name]];
          };
          _friendlyCount = 0;
          _enemyCount = 0;

      }forEach cityListNE;

};

if((count _availableLoc) == 0) then
{
      // NO AVAILABLE TOWNS IN THAT REGION
      titleText ["No available towns in that region. Random spawn selected.","PLAIN",0];
      execVM "client\functions\spawnRandom.sqf";

} else {

      _randomLoc = _availableLoc select (random (count _availableLoc - 1));

      _pos = getMarkerPos (_randomLoc select 0);
      _pos = [_pos,1,(_randomLoc select 1),1,0,0,0] call BIS_fnc_findSafePos;
      //_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
      player setPos _pos;

      respawnDialogActive = false;
      closeDialog 0;

      _mins = floor(60 * (daytime - floor(daytime)));
      _townName = _randomLoc select 2;
      ["NORTHEAST",_townName] execVM "client\functions\logSpawn.sqf";
      [
      	"404 Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
      ] spawn BIS_fnc_infoText;

};