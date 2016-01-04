/*
	@file Author: [FF] Bench
	@file Version: 1.0
   	@file Date:	23/04/2013	
	@file Description: Restores object hp to full
	@file Args: [none]
*/

_object = _this select 0;

if (R3F_LOG_mutex_local_verrou) then {
	player globalChat STR_R3F_LOG_mutex_action_en_cours; // mutex locked
} else {
	_repairkits = player getVariable "repairkits";
	if (_repairkits > 0) then {
                _originalState = animationState player;
		if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
			player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		};
		sleep 3;
		//player setVariable["repairkits",_repairkits -1,false];
		_object setVariable["health",(_object getVariable "healthTotal"),true];
		_object setVariable["isCritical",false,true];
		2 cutText ["Object repaired", "PLAIN DOWN", 1];
                player switchMove _originalState;
        } else {
		2 cutText ["Repair failed: No repair kit!", "PLAIN DOWN", 1];
	};
	R3F_LOG_mutex_local_verrou = false;
};
