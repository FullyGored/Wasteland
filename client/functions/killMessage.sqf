/*
 Based on gn1ps Post in the 404 Forums
 http://www.404games.co.uk/forum/index.php?/topic/2496-custom-death-messages/
 And Vibas serverside killmessage script.

 Edited by KiloSwiss
 All errors in this script are produced by me, don't blame anyone else for this! =)

 Known issues:
 Kills with Mines, Satchelcharges, etc. will display the players actual weapon he's holding in his hand(s) and not the mine/satchel.
 Killing respawning players will only announce the killers name, same for kills over a distance of 3000 meters (might be an issue with mines).
 This will also show incredible long sniper kills with almost impossible weapons if someone is killed with a mine and distance is between 1500 and 3000m
*/

_player = _this select 0;
_killer = _this select 1;
	
_distance = _killer distance _player;
_distance = floor(_distance);

// if (_distance > 3000) exitWith {	//Killed while respawning (or when driving over a mine and the killer is over 3km away)
// _killerName = name _killer;
// 	if (isNull _killerName) then {
// 	[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
// 	} else {
// 	[player, nil, rGlobalChat, format["got killed by «%1»",name _killer]] call RE;
// 	};
// };

//_distance = format["%1",round(_distance)];
switch (true) do {
	case (_distance < 100) : {	// Close range kills
	_distance = format[" from close range"];};

	case (_distance > 100 && _distance < 700) : { //Show no distance
	_distance = format[""];};

	case (_distance > 700 && _distance < 1000) : {	//Long distance kills
	_distance = format[" over long range"];};

	case (_distance > 1000 && _distance < 3000) : { //Show the distance in meters only for really remarkable long shots
	_distance = format[" from far (%1 meters)",_distance];};

	default {};
};

// Define the name for killer and his weapon
_killerName = name _killer;
_killerWep = currentWeapon _killer;
_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
_weaponName = format["%1",getText(_weaponName >> "displayName")];
_killerWep = format[" with «%1»",_weaponName];


// if (_killerName == "ERROR: NO UNIT") exitWith { // Drive a car into a wall/rock etc. or drive over a mine
// [player, nil, rGlobalChat, format["should learn how to drive"]] call RE;
// };
// if (_weaponName == "HORN") exitWith { // Same as before, but different (suitable for passengers)
// [player, nil, rGlobalChat, format["died in a tragic car accident"]] call RE;
// };

// if (side _killer == Civilian) exitWith {
// 	if (_player == _killer) then { // Respawn suicide or killed by a explosion of a vehicle
// 	[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
// 	} else { //AI Kill (not always AI so I removed the "AI" from the killmessage)
// 	[player, nil, rGlobalChat, format["killed by «%1»%2%3",name _killer,_distance,_killerWep]] call RE;
// 	};
// };

// if(_player == _killer) then { //Suicide - Might be obsolete since respawning suicide get's catched in the "Civilian" section
// [player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
// } else { //Normal kill - Player kills Player with a weapon
// [player, nil, rGlobalChat, format["got killed by «%1»%2%3",name _killer,_distance,_killerWep]] call RE;
// };

if ((_player != _killer) && (isPlayer _killer)) then {
[player, nil, rGlobalChat, format["got killed by «%1»%2%3",name _killer,_distance,_killerWep]] call RE;
};
