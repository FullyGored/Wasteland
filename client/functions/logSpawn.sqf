//	@file Version: 1.0
//	@file Name: logSpawn.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 12/04/2013
//	@file Args:

_playerName = name player;
_playerUID = getPlayerUID player;
_playerSide = playerSide;
_spawnType = _this select 0;
_spawnName = _this select 1;
_spawnPos = getPosATL player;

diag_log_msg = format["%1 (%2 %3) has %4 spawned at %5 %6",_playerName,_playerUID,_playerSide,_spawnType,_spawnName,_spawnPos];
pvar_clientDiagLog = [diag_log_msg];
publicVariableServer "pvar_clientDiagLog";
