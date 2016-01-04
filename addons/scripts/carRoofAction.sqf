//	@file Version: 0.1
//	@file Name: carRoofAction.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 14/07/2013 23:55
//	@file Args:[,,,int (action), array (offset)]

private["_params","_roofpos","_cartype","_carRoofOffsets","_offset","_veh","_vehPosVar"];
_params = _this select 3;
_roofpos = _params select 0;
_cartype = _params select 1;
_offset = [0,0,0];

{
    if (_x select 0 == _cartype) then {
        _carRoofOffsets = _x select 2;
        _offset = _carRoofOffsets select (_roofpos - 1);
    };
} foreach carRoofVars;

if ( vehicle player != player) then {
    _veh = vehicle player;
    player action ["Eject", _veh];
} else {
    _veh = nearestObjects [player, [_cartype], 5] select 0;
};

player attachTo [_veh,_offset];

_vehPosVar = format["ROOF_POS_%1", _roofpos];
_veh setVariable[_vehPosVar,0,true];
player setvariable ["ON_CAR_ROOF", _roofpos, true];
player setvariable ["CAR_ROOF_DIR", 0, true];

[player,_veh,_vehPosVar] spawn  {
    private["_player","_veh","_vehPosVar"];
    _player = _this select 0;
    _veh = _this select 1;
    _vehPosVar = _this select 2;
    waitUntil { !(alive _player) OR (_veh getVariable _vehPosVar > 0) };
    if (!(alive _player)) then { _veh setVariable[_vehPosVar,1,true]; };
};

sleep 0.5;
player switchMove "AidlPknlMstpSrasWrflDnon0S";

2 cutText ["You are riding on the vehicle. Press HOME key to jump off. Press END key to get back into car. Press 2 or 3 for Primary/Secondary weapon. Use freelook to move aim when on gun sights. Arrow keys to quick turn.", "PLAIN DOWN", 2];
