//	@file Version: 1.1
//	@file Name: BTC_functions.sqf
//	@file Author: =BTC= (Black Templars), adpated by Redshirt Ensign
//	@file Created: 14/07/2013 23:55
//	@file Args: object class

BTC_deploy_rope =
{
	hint "Rope deployed";
	_veh = vehicle player;
	_veh setVariable ["BTC_rope",1,true];
	if (BTC_AI_fast_rope_on_deploy == 1) then {_fast_rope = [_veh] spawn BTC_AI_fast_rope};
	WaitUntil {!Alive _veh || !Alive player || (((getPos player) select 2) > BTC_fast_rope_h) || format ["%1",_veh getVariable "BTC_rope"] != "1"};
        if (format ["%1",_veh getVariable "BTC_rope"] == "1") then { hint "Rope cut"; };
	_veh setVariable ["BTC_rope",0,true];
};
BTC_cut_rope =
{
	hint "Rope cut";
	_veh = vehicle player;
	_veh setVariable ["BTC_rope",0,true];
};
BTC_fast_rope =
{
	hint "Fast roping";
	_unit = player;
	_veh = vehicle _unit;
	_unit action ["EJECT",_veh];
	_unit setPos (_veh modelToWorld [2,1,-2]);
	unassignVehicle _unit;
	_unit switchMove "LadderRifleStatic";
	_unit setDir (getDir _veh - 90);
	WaitUntil {!Alive _unit || (((getPos _unit) select 2) < 1.5)};
	if (Alive _unit && (((getPos _veh) select 2) < BTC_fast_rope_h) && speed _veh < 5) then
	{
		_unit setVelocity [0,0,0];
		_unit playMove "LadderRifleDownOff";
		if !(isPlayer _unit) then {_unit move [((getPos _unit) select 0) + 3,((getPos _unit) select 1) + 3,0];};
		if((currentWeapon _unit) in ["M9", "M9SD", "Colt1911", "Makarov", "MakarovSD", "Sa61_EP1", "UZI_EP1", "UZI_SD_EP1", "revolver_EP1", "revolver_gold_EP1", "glock17_EP1"])
		    then {_unit playMove "PistolMagazineReloadStand";};
	};
	if (((getPos _veh) select 2) > BTC_fast_rope_h) then {hint "Chopper has flown off! The rope has been cut!";};
};
