/*
	@file Author: [FF] Bench
	@file Version: 1.0
   	@file Date:	20/04/2013	
	@file Description: Checks an objects hp
	@file Args: [none]
*/
_object = _this select 0;

if (R3F_LOG_mutex_local_verrou) then {
	player globalChat STR_R3F_LOG_mutex_action_en_cours; // mutex locked
} else {

	_health = _object getVariable "health";
	_healthTotal = _object getVariable "healthTotal";
	_healthPercent = 100; // default value
	
	if(_healthTotal > 0) then {
		_healthPercent = (_health / _healthTotal) * 100;
		_message = format ["This objects health is at %1 percent",round (_healthPercent)];
		player globalChat _message;
	}
	else { // possibly an object which has no hp (smoke and mirrors in that case)
			_message = format ["This objects health is at 100 percent"];
			player globalChat _message;
	};
	
	R3F_LOG_mutex_local_verrou = false;
};





