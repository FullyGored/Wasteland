//	@file Version: 2.0
//	@file Name: BTC_fast_rope.sqf
//	@file Author: =BTC= (Black Templars) revision by [FF] Redshirt Ensign
//	@file Created: 14/07/2013 23:55
//	@file Args: object class

private ["_veh", "_unit"];

	hint "Fast roping";
	_unit = player;
	_veh = vehicle _unit;
	_unit action ["EJECT",_veh];
	_unit setPos (_veh modelToWorld [2,1,-2]);
	unassignVehicle _unit;
	_unit switchMove "LadderRifleStatic";
	_unit setDir (getDir _veh - 90);
	WaitUntil {!Alive _unit || (((getPos _unit) select 2) < 1.5)};
	if (Alive _unit && (((getPos _veh) select 2) < 20) && speed _veh < 5) then
	{
		_unit setVelocity [0,0,0];
		_unit playMove "LadderRifleDownOff";
		if !(isPlayer _unit) then {_unit move [((getPos _unit) select 0) + 3,((getPos _unit) select 1) + 3,0];};
		if((currentWeapon _unit) in ["M9", "M9SD", "Colt1911", "Makarov", "MakarovSD", "Sa61_EP1", "UZI_EP1", "UZI_SD_EP1", "revolver_EP1", "revolver_gold_EP1", "glock17_EP1"])
		    then {_unit playMove "PistolMagazineReloadStand";};
	};
	if (((getPos _veh) select 2) > 20) then {hint "Chopper has flown off! The rope has been cut!";};
