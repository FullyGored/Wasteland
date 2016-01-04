
//	@file Version: 1.0
//	@file Name: objectCreation.sqf
//	@file Author: [404] Deadbeat, [FF] Bench
//	@file Created: 20/04/2013
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype select 0,_objPos,[], 50,"None"]; 

if(_Objtype select 0 == "Land_Barrel_water") then
{
    _obj setVariable["water",20,true];
};

if(_Objtype select 0 == "Land_stand_small_EP1") then
{
    _obj setVariable["food",20,true];
};

// Object Health system init
_obj setVariable["health",if(_Objtype select 1 == 0)then{30}else{_Objtype select 1},true];
_obj setVariable["healthTotal",if(_Objtype select 1 == 0)then{30}else{_Objtype select 1},true];
_obj setVariable["isCritical",false,true];
_obj setVariable["isExplosiveImmune",_Objtype select 2,true];
_obj setVariable["isBallisticImmune",_Objtype select 2,true];
_obj setVariable["spawnpos",_objPos,true];
_obj setVariable["respawn",true,true];
_obj addEventHandler ["HandleDamage",{ [_this select 0,_this select 2,_this select 4] call onObjectHit }];

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
