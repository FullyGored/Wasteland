//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_uid","_handle"];

_uid = getPlayerUID player;
if ((_uid in moderatorsFF) OR (_uid in administratorsFF) OR (_uid in serverAdministratorsFF)) then {
    if ((_uid in moderatorsFF)) then {
		execVM "client\systems\adminPanel\loadModeratorMenu.sqf";
        hint "Welcome Moderator";		
	};
    if ((_uid in administratorsFF)) then {
		[] execVM "client\systems\adminPanel\loadAdministratorMenu.sqf";
        hint "Welcome Admin";		
	};
    if ((_uid in serverAdministratorsFF)) then {
		execVM "client\systems\adminPanel\loadServerAdministratorMenu.sqf";
        hint "Welcome Owner";		
	};	
} else {
    sleep 1;
    _handle = player execVM "client\systems\adminPanel\checkAdmin2.sqf"; 
    waitUntil {scriptDone _handle};
};