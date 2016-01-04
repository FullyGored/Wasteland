
//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, TAW_Tonic (original)
//	@file Created: 20/11/2012 05:19
//	@file Args:


[] spawn  {
	while{true} do
	{
		sleep 600;
		waitUntil {!respawnDialogActive};
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";}
		else
		{
		hungerLevel = hungerLevel - 10;
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";};
		switch(true) do {
			case (hungerLevel <= 10 && hungerLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now starving to death, you will slowly lose health, find something to eat quickly!", hungerLevel];};
			case (hungerLevel <= 20 && hungerLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are starting to starve, you need to find something to eat otherwise you will start to lose health!", hungerLevel];};
			case (hungerLevel <= 30 && hungerLevel >= 25): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			case (hungerLevel <= 50 && hungerLevel >= 45): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
	sleep 450;
	waitUntil {!respawnDialogActive};
	if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";}
	else
	{
		thirstLevel = thirstLevel - 10;
		if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";};
		switch(true) do {
			case (thirstLevel <= 10 && thirstLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!", thirstLevel];};
			case (thirstLevel <= 20 && thirstLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration!", thirstLevel];};
			case (thirstLevel <= 30 && thirstLevel >= 25): {hint format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", thirstLevel];};
			case (thirstLevel <= 50 && thirstLevel >= 45): {hint format["You haven't drank anything in awhile, your thirst level is %1", thirstLevel];};
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
            waitUntil { (!isNull findDisplay 50004) or (!isNull findDisplay 50006) or (!isNull findDisplay 2929) or (!isNull findDisplay 3030) or (ctrlText 1001 != "") };
            if ((!isNull findDisplay 50004) or (!isNull findDisplay 50006)) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has MOD/ADMIN PANEL open""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isNull findDisplay 2929) or (!isNull findDisplay 3030)) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has ISMENU open""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((ctrlText 1001 != "") and (ctrlText 1001 != "Gear") and (ctrlText 1001 != "Matériel") and (ctrlText 1001 != "Ausrüstung") and (ctrlText 1001 != "Equipo") and (ctrlText 1001 != "Equipaggiamento") and (ctrlText 1001 != "Výstroj") and (ctrlText 1001 != toString [1057,1085,1072,1088,1103,1078,1077,1085,1080,1077]) and (ctrlText 1001 != "Wyposażenie")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has MPMENU open - %3 %4""}", name player, getPlayerUID player, ctrlText 1001, toArray(ctrlText 1001)];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            sleep 5;
	};
};

[] spawn  {
        //_varsDumped = false;
	while{true} do
	{
            waitUntil { (!isnil "scroll_m_init_star") or (!isnil "Lystics_Code") or (!isnil "locdb") or (!isnil "locdbee") or (!isnil "shadowydebug") or (!isnil "hotkeymenu") or (!isnil "qofjqpofqsz") or (!isnil "_whorespect") or (!isNil "spi") or (!isnil "playericons") or (!isnil "xtags") or (!isnil "xtags_star_xx") or (!isnil "wpm_infiSTAR") or (!isNil "ESP_infiSTAR_chewSTAR_a2zhgdadg2iu2da") or (!isnil "infiSTAR_chewSTAR_ICONS_just_icons_icons_1337") or (!isnil "infiSTAR_chewSTAR_localpm") or (!isNil "BIS_fnc_3dCredits_n") or (!isnil "fired") or (!isnil "fired1") or (!isnil "ChangingBullets_xx") or (!isNil "playershield") or (!isnil "playershield_star") or (!isnil "playershield_wasteland_star") or (!isnil "playershield_Metallica_star") };
            if (!isnil "scroll_m_init_star") then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has ISSCROLL loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if (!isnil "Lystics_Code") then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has LYSCROLL loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "locdb") or (!isnil "locdbee") or (!isnil "shadowydebug")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has LOCDB loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if (!isnil "hotkeymenu") then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has DMHKEY loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if (!isnil "qofjqpofqsz") then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has WIGKEY loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if (!isnil "_whorespect") then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has FACTBYPASS loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "spi") or (!isnil "playericons") or (!isnil "xtags") or (!isnil "xtags_star_xx") or (!isnil "wpm_infiSTAR") or (!isNil "ESP_infiSTAR_chewSTAR_a2zhgdadg2iu2da") or (!isnil "infiSTAR_chewSTAR_ICONS_just_icons_icons_1337") or (!isnil "infiSTAR_chewSTAR_localpm") or (!isNil "BIS_fnc_3dCredits_n")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has ESP loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "fired") or (!isnil "fired1") or (!isnil "ChangingBullets_xx")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has BLTMODS loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "playershield") or (!isnil "playershield_star") or (!isnil "playershield_wasteland_star") or (!isnil "playershield_Metallica_star")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has PSHLD loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };

            //if ((!isnil "vars") and (!_varsDumped)) then {
            //    for[{_num = 0},{_num <= count(vars) - 1},{_num = _num + 1}] do {
            //        _logcmd = format["if isServer then {diag_log ""%1 (%2) VARS %3 = %4""}", name player, getPlayerUID player, _num, vars select _num];
            //        player setVehicleInit _logcmd;
            //        processInitCommands;
            //        sleep 0.1;
            //    };
            //    _varsDumped = true;
            //};
            sleep 9;
	};
};

//[] spawn  {
//        _grpiconDetected = false;
//	while{!_grpiconDetected} do
//	{
//            {
//            if ((getPlayerUID _x != "") AND (!_grpiconDetected)) then {
//                _params = getGroupIconParams group _x;
//                _color = _params select 0;
//                _text = _params select 1;
//                if ( _text != "" OR _color select 0 != 1 OR _color select 1 != 1 OR _color select 2 != 1 OR _color select 3 != 1 ) then {
//                    _logcmd = format["if isServer then {diag_log ""%1 (%2) has GRPICON params %3 %4 %5 %6 %7 %8 %9""}", name player, getPlayerUID player, _color, _params select 2, _params select 3, _params select 4, _params select 5, name _x, toArray(_text)];
//                    player setVehicleInit _logcmd; processInitCommands;
//                    _grpiconDetected = true;
//                };
//            };
//            } forEach entities "AllVehicles";
//            sleep 300;
//	};
//};

[] spawn  {
	while{true} do
	{
            waitUntil { (vehicle player != player) };
            _vcl = vehicle player;
            _nos1 = _vcl getvariable "nitro";
            _nos2 = _vcl getvariable "boost_shiftl";
            _supgrade1 = _vcl getvariable "supgrade";
            _supgrade2 = _vcl getvariable "boost_e";
            if ((!isnil "_nos1") or (!isnil "_nos2")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has VEHNOS loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "_supgrade1") or (!isnil "_supgrade2")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has VEHUPG loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            if ((!isnil "boost") or (!isnil "vspeed")) then {
                _logcmd = format["if isServer then {diag_log ""%1 (%2) has VEHSPD loaded""}", name player, getPlayerUID player];
                player setVehicleInit _logcmd;
                processInitCommands;
            };
            sleep 17;
	};
};
