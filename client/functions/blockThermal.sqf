//	@file Version: 1.0
//	@file Name: blockThermal.sqf
//	@file Author: [TOGFF] Redshirt Ensign
//	@file Created: 08/07/13
//	@file Args:
//	@file Thanks: Arigato - keypress EH functionality derived from his Jumper script

// BLACK_SCREEN = {
// 	titleText ["THERMAL OPTICS ARE DISABLED ON THIS SERVER!\n\n You will be ejected from this vehicle (once it stops moving)...","black"];
//         sleep 5;
// 	waituntil { (speed (vehicle player)) <= 5 };
// 	player action ["Eject", vehicle player];
//         titleFadeOut 5;
// };

NV_KEYDOWN =
{
  private ["_dikcode","_vehicle"];
  _dikcode = _this select 1;
  if (_dikCode in (actionKeys "NightVision")) then {
    if (vehicle player != player) then {
      _vehicle = vehicle player;
      _vehicle disableTIEquipment true;
      if ((commander _vehicle == player) OR (gunner _vehicle == player)) then {
        titleText ["THERMAL OPTICS ARE DISABLED ON THIS SERVER!","PLAIN"];
      };
    };
  };
};

while { true } do
{
  waituntil { ! isnull finddisplay 46 };
  finddisplay 46 displayaddeventhandler ["KeyDown", "_this call NV_KEYDOWN"];
  waituntil { isnull finddisplay 46 };
};
