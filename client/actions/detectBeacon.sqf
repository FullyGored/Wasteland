
//	@file Version: 1.0
//	@file Name: detectBeacon.sqf
//	@file Author: [FF] Redshirt_Ensign
//	@file Created: 13/03/2013 01:00
//	@file Args:

private["_nearestBeacon","_distanceToBeacon","_nearestBeaconFaction","_nearestBeaconOwnerUID","_nearestBeaconOwnerName","_nearestBeaconSide"];

_nearestBeacon = (nearestobjects [player, ["Satelit"],  750] select 0);
_distanceToBeacon = player distance _nearestBeacon;
_nearestBeaconFaction = _nearestBeacon getVariable "faction";
_nearestBeaconOwnerUID = _nearestBeacon getVariable "ownerUID";
_nearestBeaconOwnerName = _nearestBeacon getVariable "ownerName";

_nearestBeaconSide = _nearestBeaconFaction;
if(_nearestBeaconFaction == "WEST") then {_nearestBeaconSide = "Blufor"};
if(_nearestBeaconFaction == "EAST") then {_nearestBeaconSide = "Opfor"};
if(_nearestBeaconFaction == "GUER") then {_nearestBeaconSide = "Independent"};

2 cutText [format["Nearest spawn beacon is %1m away and owner is %2 (%3)", _distanceToBeacon, _nearestBeaconOwnerName, _nearestBeaconSide], "PLAIN DOWN", 2];
