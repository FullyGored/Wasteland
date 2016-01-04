//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos"];

_randomLoc = cityList select (random (count cityList - 1));
_chute = ["ACE_ParachutePack", "ACE_ParachuteRoundPack"] call BIS_fnc_selectRandom;
_player addweapon _chute;
_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,1,(_randomLoc select 1),1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPos _pos;
		    
    2 cutText ["Use MOUSEWHEEL to open Your parachute! Opening your chute below 150 altitude is not advised!", "PLAIN DOWN", 2];
	player setPos [_pos select 0, _pos select 1, 2000]; // Stop the player appearing on the ground for a split second before the HALO
[player, 2000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";  
respawnDialogActive = false;
closeDialog 0;

while {((getposATL player)select 2) > 1} do
{
hintsilent format ["Altimeter: %1", round (getPosATL player select 2)];
};
if (((getposATL player)select 2) < 1) then
{
hintsilent "";
};

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"Face First Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;