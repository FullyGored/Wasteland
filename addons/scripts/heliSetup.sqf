//	@file Version: 0.5
//	@file Name: heliSetup.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 14/07/2013 23:55
//	@file Args: object class

if(!X_Client) exitWith {};

// Add BTC Fast Roping
#include "BTC_functions.sqf"
//_btc_setup_counter = 0;
BTC_fast_rope_h = 20;
BTC_roping_chopper = ["MH60S","MH6J_EP1","UH1H_TK_GUE_EP1","Mi17_TK_EP1","UH1Y","UH60M_EP1","Ka60_GL_PMC"];
// {
//         _btc_setup_counter = _btc_setup_counter + 1;
//         _x setVariable ["BTC_rope",0,true];
// 	_ropedeployID = _x addaction [("<t color=""#ED2744"">") + ("Deploy rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[],BTC_deploy_rope],1,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"];
// 	_ropecutID = _x addaction [("<t color=""#ED2744"">") + ("Cut rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
// 	_fastropeID  = _x addaction [("<t color=""#ED2744"">") + ("Fast rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[player],BTC_fast_rope],7,true,false,"","player in (crew _target) && player != driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
// } foreach (nearestObjects [player, BTC_roping_chopper, 50000]);
// 
// diag_log_msg = format["HELISETUP: BTC Fast Ropes added to %1 choppers", _btc_setup_counter];
// pvar_clientDiagLog = [diag_log_msg];
// publicVariableServer "pvar_clientDiagLog";
// 
// "pvar_heliSetup" addPublicVariableEventHandler {
//     _heli = _this select 1;
//     _heli setVariable ["BTC_rope",0,true];
//     _ropedeployID = _heli addaction [("<t color=""#ED2744"">") + ("Deploy rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[],BTC_deploy_rope],1,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"];
//     _ropecutID = _heli addaction [("<t color=""#ED2744"">") + ("Cut rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
//     _fastropeID  = _heli addaction [("<t color=""#ED2744"">") + ("Fast rope") + "</t>","addons\scripts\BTC_addAction.sqf",[[player],BTC_fast_rope],7,true,false,"","player in (crew _target) && player != driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
//     diag_log_msg = format["HELISETUP: BTC Fast Ropes added to %1", _heli];
//     pvar_clientDiagLog = [diag_log_msg];
//     publicVariableServer "pvar_clientDiagLog";
// };
