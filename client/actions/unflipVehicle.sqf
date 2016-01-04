
//	@file Version: 1.0
//	@file Name: unflipVehicle.sqf
//	@file Author: [FF] Redshirt_Ensign (inspired by Norrin)
//	@file Created: 12/02/2013 15:00
//	@file Args:

_flippedVehicle = nearestObjects [player, ["Car","Motorcycle","Tank"], 10] select 0;
_distanceToVehicle = player distance _flippedVehicle;

if (_distanceToVehicle < 5) then {
    2 cutText [format["TOO CLOSE! Please step back another %1m or you might be crushed by vehicle!", 5 - _distanceToVehicle], "PLAIN DOWN", 2];
} else {
    _vehdir = getDir _flippedVehicle;
    _vehpos = getPos _flippedVehicle;
    _flippedVehicle setDir _vehdir;
    _flippedVehicle setVectorUp [0,0,0];
    _flippedVehicle setPos _vehpos;
    _flippedVehicle setvelocity [0,0,1];
    _flippedVehicle setDir _vehdir;
    2 cutText ["HOORAY! You have righted the overturned vehicle.", "PLAIN DOWN", 2];
}
