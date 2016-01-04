//	@file Version: 1.0
//	@file Name: createMissionVehicle.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_vehicleClass","_randomPos","_fuel","_ammo","_damage","_state","_veh"];

_vehicleClass = _this select 0;
_randomPos = _this select 1;
_fuel = _this select 2;
_ammo = _this select 3;
_damage = _this select 4;
_state = _this select 5;

_veh = createVehicle [_vehicleClass,_randomPos,[], 0, _state];
if (_veh isKindOf "Helicopter") then {
    if (_vehicleClass in BTC_roping_choppers) then {
        _veh setVehicleInit "[this] execVM 'addons\scripts\vehicleLock.sqf'; this addAction [""HALO Jump"",""addons\scripts\halo.sqf"",[],1,false,true,"""","" _this in _target ""]; this setVariable [""BTC_rope"",0,true]; this addaction [""Deploy rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_deploy_rope],1,false,false,"""","" _this == driver _target AND _target getVariable 'BTC_rope' != 1 AND ((getPos _target) select 2) < BTC_fast_rope_h AND speed _target < 2 ""]; this addaction [""Cut rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_cut_rope],1,false,false,"""","" _this == driver _target AND _target getVariable 'BTC_rope' == 1 ""]; this addaction [""Fast rope"",""addons\scripts\BTC_addAction.sqf"",[[],BTC_fast_rope],1,false,false,"""","" _this in _target AND _this != driver _target AND _target getVariable 'BTC_rope' == 1 ""];";
    } else {
        _veh setVehicleInit "[this] execVM 'addons\scripts\vehicleLock.sqf'; this addAction [""HALO Jump"",""addons\scripts\halo.sqf"",[],1,false,true,"""","" _this in _target ""];";
    };
} else {
    _veh setVehicleInit "[this] execVM 'addons\scripts\vehicleLock.sqf'";
};
processInitCommands;
_veh setFuel _fuel;
_veh setVehicleAmmo _ammo;
_veh setdamage _damage;
_veh disableTIEquipment true;

_veh setVehicleLock "LOCKED";
_veh setVariable["notahackedvehicle",1,true];
_veh setVariable ["R3F_LOG_disabled", true, true];

clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

_veh