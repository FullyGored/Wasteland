//	@file Version: 0.1
//	@file Name: onObjectHit.sqf
//	@file Author: [FF] Bench
//	@file Created: 05/04/2013 21:19
//	@file Args: object, damage taken

// TODO: break this out into separate script file

private ["_currentObj", "_damageTaken", "_damageAmmo", "_health", "_healthTotal", "_isCritical", "_isBallisticImmune", "_isExplosiveImmune", "_currentHealth", "_damageAmmoArray", "_temp", "_count", "_damageAmmoFirstLetters", "_damageType"];

// Declare variables
_currentObj = _this select 0;
_damageTaken = _this select 1;
_damageAmmo = _this select 2;

_health = _currentObj getVariable "health";
_healthTotal = _currentObj getVariable "healthTotal";
_isCritical = _currentObj getVariable "isCritical";
_isBallisticImmune = _currentObj getVariable "isBallisticImmune";
_isExplosiveImmune = _currentObj getVariable "isExplosiveImmune";
_currentHealth = _health - _damageTaken*100;

//to find out damage type im going to take the first two letters of the damageAmmo class name and compare it to arrays in serverVars.sqf
_damageAmmoArray = toArray _damageAmmo;
_temp = [];
_count = 0;
{
	if(_count < 2) then {
		_temp = _temp + [_x];
		_count = _count + 1;
	};
} forEach _damageAmmoArray;
_damageAmmoFirstLetters = toString _temp;
	
_damageType = "other"; // set damagetype to default

if(_damageAmmoFirstLetters in ammoDamageTypeExplosive) then 
{	
	_damageType = "explosive";
};

if(_damageAmmoFirstLetters in ammoDamageTypeBallistic) then 
{	
	_damageType = "ballistic";
};

// check immunities
//&& (!isNull (_damageAmmoClass)
if(((_damageType == "ballistic") && (!_isBallisticImmune)) || ((_damageType == "explosive") && (!_isExplosiveImmune)) || (_damageType == "other") && (_damageAmmo != "")) then { //dont allow phantom damage
	if(_currentHealth > 0) then { // if still alive
		if(_currentHealth < _healthTotal * 0.25) then { // check if object is in execute range
			if(!_isCritical) then {
				_currentObj setVariable["isCritical",true,true];
				[_currentObj,10,time,false,false] spawn BIS_Effects_Burn;
			};
		};
	_currentObj setVariable["health",_health - _damageTaken * 100,true];
	} else {
                private ["_spawnpos", "_respawn", "_debris", "_newpos"];
                _spawnpos = _currentObj getVariable "spawnpos";
                _respawn = _currentObj getVariable "respawn";
		diag_log format ["ObjectDestroyed: _damageTaken=%1, _damageAmmoClass=%2, _health=%3, _currentObj=%4",_damageTaken * 100,_damageAmmo,_health,_currentObj];
		_debris = "HelicopterExploSmall" createVehicle[getPos _currentObj select 0, getPos _currentObj select 1, -20]; // leaves a mark on the ground, small blast radius
		_debris allowDamage false; //bug where object is removed and you shoot the debris causing an explosion on yourself?
		deleteVehicle _currentObj;
                if(_respawn) then {
                    //create a new object to replace the dead one (10 random attempts to find empty spawn marker)
                    _newpos = [_spawnpos, 41, 60, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
                    diag_log format ["ObjectSpawn: _newpos=%1, _spawnpos=%2",_newpos,_spawnpos];
                    [_newpos] call objectCreation;
		};
	};
};
