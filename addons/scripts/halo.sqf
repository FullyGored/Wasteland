//	@file Version: 1.0
//	@file Name: halo.sqf
//	@file Author: [MBS/OCUK] marker
//	@file Created: 17/04/2013
//	@file Args:

player action [ "eject", vehicle player];
 
titleCut ["", "BLACK FADED", 100];
sleep 0.5;
titleCut ["", "BLACK IN", 2];
player spawn bis_fnc_halo;
player setvelocity [0,120*0.8,0];
player setdir random 360;
 
while {((getposATL player)select 2) > 5} do
{
hintsilent format ["Altimeter : %1", round (getPosATL player select 2)];
};
if (((getposATL player)select 2) < 5) then
{
hintsilent "";
};
