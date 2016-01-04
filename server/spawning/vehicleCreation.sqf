
//	@file Version: 1.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, [FF] Redshirt Ensign
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_marker","_cartype","_car","_carRoofPositions","_carRoofOffsets","_carRoofCmd","_num","_tipped","_carpos","_type","_townpos"];
_type = _this select 1;
_pos = _this select 0;

//Create Civilian Vehicle
if (_type == 0) then {
    //Car Initilization, Pick Car Type.
    _cartype = civilianVehicles select (random (count civilianVehicles - 1));
    _car = createVehicle [_cartype,_pos,[], 20,"None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
    _car setVariable["ROOF_POSITIONS",0,true];
    _carRoofCmd = "";
    {
        if (_x select 0 == _cartype) then {
            _carRoofPositions = _x select 1;
            _car setVariable["ROOF_POSITIONS",_carRoofPositions,true];
            private ["_i","_tmpCmd","_tmpPosVar"];
            for "_i" from 1 to _carRoofPositions do {
                _tmpPosVar = format["ROOF_POS_%1", _i];
                _car setVariable[_tmpPosVar,1,true];
                _tmpCmd = format ["%1 this addaction [""Get on Roof (position %2)"",""addons\scripts\carRoofAction.sqf"",[%3,""%4""],0,false,false,"""","" _target getVariable 'ROOF_POSITIONS' > 0 AND _target getVariable 'ROOF_POS_%5' > 0 AND _this distance _target <= 4 AND speed _target < 10""];",_carRoofCmd,_i,_i,_cartype,_i];
                _carRoofCmd = _tmpCmd;
            };
            //diag_log format["DEBUG - %1 set with %2 roof positions",_cartype, _carRoofPositions];
        };
    } foreach carRoofVars;
    _initCmd = format["nul=[this, 30, 3600, 0, false] execVM 'addons\scripts\vehicle.sqf'; [this] execVM 'addons\scripts\vehicleLock.sqf'; %1",_carRoofCmd];
    _car setVehicleInit _initCmd;
    processInitCommands;
    _car setVariable["spawnpos",_pos,true];

    //Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

    //Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    _car setVelocity [0,0,1];
    [_car] call randomWeapons;

    //Disable Thermals (if any)
    _car disableTIEquipment true;

    //Set original posistion then add to vehicle array
    _car setVariable["notahackedvehicle",1,true];
};

//Create Military Vehicle
if (_type == 1) then {
    //Car Initilization, Pick Car Type.
    _cartype = militaryVehicles select (random (count militaryVehicles - 1));
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
    _car setVariable["ROOF_POSITIONS",0,true];
    _carRoofCmd = "";
    {
        if (_x select 0 == _cartype) then {
            _carRoofPositions = _x select 1;
            _car setVariable["ROOF_POSITIONS",_carRoofPositions,true];
            private ["_i","_tmpCmd","_tmpPosVar"];
            for "_i" from 1 to _carRoofPositions do {
                _tmpPosVar = format["ROOF_POS_%1", _i];
                _car setVariable[_tmpPosVar,1,true];
                _tmpCmd = format ["%1 this addaction [""Get on Roof (position %2)"",""addons\scripts\carRoofAction.sqf"",[%3,""%4""],0,false,false,"""","" _target getVariable 'ROOF_POSITIONS' > 0 AND _target getVariable 'ROOF_POS_%5' > 0 AND _this distance _target <= 4 AND speed _target < 10""];",_carRoofCmd,_i,_i,_cartype,_i];
                _carRoofCmd = _tmpCmd;
            };
            //diag_log format["DEBUG - %1 set with %2 roof positions",_cartype, _carRoofPositions];
        };
    } foreach carRoofVars;
    _initCmd = format["nul=[this, 30, 3600, 0, false] execVM 'addons\scripts\vehicle.sqf'; [this] execVM 'addons\scripts\vehicleLock.sqf'; %1",_carRoofCmd];
    _car setVehicleInit _initCmd;
    processInitCommands;
    _car setVariable["spawnpos",_pos,true];

    //Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

    //Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    _car setVelocity [0,0,1];
    [_car] call randomWeapons;

    //Disable Thermals (if any)
    _car disableTIEquipment true;

    //Set authenticity
    _car setVariable["notahackedvehicle",1,true];
};

//Create Armed Military Vehicle
if (_type == 2) then {
    //Car Initilization, Pick Car Type.
    _cartype = armedMilitaryVehicles select (random (count armedMilitaryVehicles - 1));
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
    _car setVehicleInit "nul=[this, 30, 0, 0, false] execVM 'addons\scripts\vehicle.sqf'; [this] execVM 'addons\scripts\vehicleLock.sqf';";
    processInitCommands;
    _car setVariable["spawnpos",_pos,true];

    //Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

    //Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    _car setVehicleAmmo (random 0.90);
    _car setVelocity [0,0,1];
    [_car] call randomWeapons;

    //Disable Thermals (if any)
    _car disableTIEquipment true;

    //Set original posistion then add to vehicle array
    _car setVariable["notahackedvehicle",1,true];
};
