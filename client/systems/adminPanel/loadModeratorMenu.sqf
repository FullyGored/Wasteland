//	@file Version: 1.0
//	@file Name: loadModeratorMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define modMenu_option 50005
disableSerialization;

private ["_start","_panelOptions","_displayMod","_modSelect"];
_uid = getPlayerUID player;
if ((_uid in moderatorsFF) OR (_uid in administratorsFF) OR (_uid in serverAdministratorsFF)) then {
	_start = createDialog "ModMenu";
	
	_displayMod = uiNamespace getVariable "ModMenu";
	_modSelect = _displayMod displayCtrl modMenu_option;
	
	_panelOptions = ["Player Menu",
					"Vehicle Management"
	];
	
	{
		_modSelect lbAdd _x;
	} forEach _panelOptions;
} else {
  exit;  
};