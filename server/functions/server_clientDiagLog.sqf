//	@file Version: 1.0
//	@file Name: server_clientDiagLog.sqf
//	@file Author: Redshirt_Ensign
//	@file Created: 18/06/2013 23:19

if(!X_Server) exitWith {};

private["_msgData"];

_msgData = _this select 0;

diag_log format["%1",_msgData];
