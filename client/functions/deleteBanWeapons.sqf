
//	@file Version: 1.0
//	@file Name: deleteBanWeapons.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 2013/05/11 21:30
//	@file Args:

[] spawn  {
        while {true} do {
            if ({currentWeapon player == _x} count banWeapons > 0) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) had BANWEAPON removed - %3""}", name player, getPlayerUID player, currentWeapon player];
                player setVehicleInit _logcmd;
                processInitCommands;
                removeAllWeapons player;
                playSound "babycry_1";
            };
       	    sleep 15;
        };
};
