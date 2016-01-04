//	@file Version: 1.0
//	@file Name: staticHeliCreation.sqf
//	@file Author: [404] Costlyy, [FF] Redshirt Ensign
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};

private["_spawnPos", "_respawns", "_spawnType", "_currHeli", "_initCmd"];

_isWreck = _this select 0;
_spawnPos = _this select 1;
_respawns = _this select 2;

if (_isWreck == 0) then {
	//diag_log "Spawning heli complete...";
	_spawnType = staticHeliList select (random (count staticHeliList - 1));
	_currHeli = createVehicle [_spawnType,_spawnPos,[], 50,"None"];
        _initCmd = format["nul=[this, 300, 0, %1, false] execVM 'addons\scripts\heli.sqf'; [this] execVM 'addons\scripts\vehicleLock.sqf'; this addAction [""HALO Jump"",""addons\scripts\halo.sqf"",[],1,false,true,"""","" _this in _target ""]; this setVariable [""BTC_rope"",0,true]; this addaction [""Deploy rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_deploy_rope],1,false,false,"""","" _this == driver _target AND _target getVariable 'BTC_rope' != 1 AND ((getPos _target) select 2) < BTC_fast_rope_h AND speed _target < 2 ""]; this addaction [""Cut rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_cut_rope],1,false,false,"""","" _this == driver _target AND _target getVariable 'BTC_rope' == 1 ""]; this addaction [""Fast rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_fast_rope],1,false,false,"""","" _this in _target AND _this != driver _target AND _target getVariable 'BTC_rope' == 1 ""];",_respawns];
        _currHeli setVehicleInit _initCmd;
        processInitCommands;

	_currHeli setpos [getpos _currHeli select 0,getpos _currHeli select 1,0];

	clearMagazineCargoGlobal _currHeli;
	clearWeaponCargoGlobal _currHeli;
	_currHeli disableTIEquipment true;

	//Set original status to stop ner-do-wells
	_currHeli setVariable["notahackedvehicle",1,true];
} else {
	//diag_log "Spawning heli wreck...";
	_spawnType = staticHeliList select (random (count staticHeliList - 1));
	_currHeli = createVehicle [_spawnType,_spawnPos,[], 50,"None"]; 
	
	_currHeli setpos [getpos _currHeli select 0,getpos _currHeli select 1,0];
	
	clearMagazineCargoGlobal _currHeli;
	clearWeaponCargoGlobal _currHeli;
	_currHeli disableTIEquipment true;
	
	//Set original status to stop ner-do-wells
	_currHeli setVariable["notahackedvehicle",1,true];
    
    _currHeli setDamage 1; // Destroy this heli on the spot so it looks like a realistic crash.
};