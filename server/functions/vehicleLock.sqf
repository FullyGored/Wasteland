//	@file Version: 0.5
//	@file Name: vehicleLock.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 14/06/2013 23:55
//	@file Args: object class

if(!X_Server) exitWith {};

// Define variables
_vehicle = _this select 0;

_vehicle addEventHandler ["GetIn",
{
    private ["_veh", "_pos", "_unit", "_crew", "_aliveCrew", "_isFriendly", "_crewMember", "_groupArray"];
    _veh = _this select 0;
    _pos = _this select 1;
    _unit = _this select 2;
    if (str(side _unit) == "GUER") then {
        _crew = crew _veh;
        {
            if ((alive _x) AND (_unit != _x) AND (group _unit != group _x)) then {
                _unit action ["Eject", _veh];
                [nil,_x,"loc", rTITLETEXT, format["%1 has been EJECTED from your vehicle because not in your group",name _unit], "PLAIN", 0] call RE;
                [nil,_unit,"loc", rTITLETEXT, format["You have been EJECTED from vehicle because not in group with %1",name _x], "PLAIN", 0] call RE;
                diag_log format["VEHICLELOCK: Player %1 (%2) ejected from vehicle because not in group with %3 (%4)", name _unit, getPlayerUID _unit, name _x, getPlayerUID _x];
                exit;
            };
        }forEach crew _veh;
    };
}];
