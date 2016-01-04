//	@file Version: 0.1
//	@file Name: carRoofInit.sqf
//	@file Author: [FF] Redshirt Ensign
//	@file Created: 14/07/2013 23:55
//	@file Args: none

//Init for player
player setvariable ["ON_CAR_ROOF", 0, true];
player setvariable ["CAR_ROOF_DIR", 0, true];
detach player;

//Handgun Weapon
CAR_ROOF_WEAPON1 =
{
    hint "Sorry! Sidearm selection not yet available";
    true
};

//Primary Weapon
CAR_ROOF_WEAPON2 =
{
    if ( (primaryWeapon player) != "") then {
      private['_type', '_muzzles'];
      _type = primaryWeapon player;
      // check for multiple muzzles (eg: GL)
      _muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");
      if (count _muzzles > 1) then {
        player selectWeapon (_muzzles select 0);
      } else {
        player selectWeapon _type;
      };
    };
    true
};

//Secondary Weapon
CAR_ROOF_WEAPON3 =
{
    if ( (secondaryWeapon player) != "") then {
      private['_type'];
      _type = secondaryWeapon player;
      player selectWeapon _type;
    };
    true
};

//Reload Weapon
CAR_ROOF_RELOAD =
{
    reload player;
    true
};

//Jump off car
CAR_ROOF_HOME =
{
    if (speed player < 10) then {
      _roofpos = player getvariable "ON_CAR_ROOF";
      _veh = nearestObjects [player, ["Car","Motorcycle"], 5] select 0;
      _vehPosVar = format["ROOF_POS_%1", _roofpos];
      _veh setVariable[_vehPosVar,1,true];
      player setvariable ["ON_CAR_ROOF", 0, true];
      detach player;
      //JUMP
      _velocity = velocity player;
      if (SyncANIM) then {
          [nil, player, rSWITCHMOVE, "ActsPercMrunSlowWrflDf_FlipFlopPara"] call RE;
      } else {
          player switchMove "ActsPercMrunSlowWrflDf_FlipFlopPara";
      };
      player switchmove "ActsPercMrunSlowWrflDf_FlipFlopPara";
      player setvelocity [(_velocity select 0) + 2 * sin getdir player, (_velocity select 1) + 2 * cos getdir player, (_velocity select 2) + 4];
    } else {
      2 cutText ["You are driving too fast to get off the vehicle!", "PLAIN DOWN", 2];
    };
    true
};

//Get back in car
CAR_ROOF_END =
{
    if (speed player < 10) then {
      _roofpos = player getvariable "ON_CAR_ROOF";
      _veh = nearestObjects [player, ["Car","Motorcycle"], 5] select 0;
      _vehPosVar = format["ROOF_POS_%1", _roofpos];
      _veh setVariable[_vehPosVar,1,true];
      player setvariable ["ON_CAR_ROOF", 0, true];
      detach player;
      player action ["getInCargo", _veh, 0];
    } else {
      2 cutText ["You are driving too fast to get off the vehicle!", "PLAIN DOWN", 2];
    };
    true
};

//Turn Left
CAR_ROOF_LTURN =
{
    _roofdir = player getvariable "CAR_ROOF_DIR";
    if ( _roofdir > -175 ) then {
        _roofdir = _roofdir - 5;
    } else {
        _roofdir = 180;
    };
    player SetDir _roofdir;
    player setvariable ["CAR_ROOF_DIR", _roofdir, true];
    true
};

//Turn Right
CAR_ROOF_RTURN =
{
    _roofdir = player getvariable "CAR_ROOF_DIR";
    if ( _roofdir < 180 ) then {
        _roofdir = _roofdir + 5;
    } else {
        _roofdir = -175;
    };
    player SetDir _roofdir;
    player setvariable ["CAR_ROOF_DIR", _roofdir, true];
    true
};

//Face Front
CAR_ROOF_FRONT =
{
    player SetDir 0;
    player setvariable ["CAR_ROOF_DIR", 0, true];
    true
};

//Face Left
CAR_ROOF_LEFT =
{
    player SetDir -90;
    player setvariable ["CAR_ROOF_DIR", -90, true];
    true
};

//Face Right
CAR_ROOF_RIGHT =
{
    player SetDir 90;
    player setvariable ["CAR_ROOF_DIR", 90, true];
    true
};

//Face Rear
CAR_ROOF_REAR =
{
    player SetDir 180;
    player setvariable ["CAR_ROOF_DIR", 180, true];
    true
};

CAR_ROOF_KEYDOWN =
{
  private ["_dikcode"];
  _dikcode = _this select 1;
  if ( player getvariable "ON_CAR_ROOF" > 0 ) then {
      switch ( _dikcode ) do
      {
        case 2  : { call CAR_ROOF_WEAPON1 }; // DIK_1
        case 3  : { call CAR_ROOF_WEAPON2 }; // DIK_2
        case 4  : { call CAR_ROOF_WEAPON3 }; // DIK_3
        case 19  : { call CAR_ROOF_RELOAD }; // DIK_RELOAD
        case 30  : { call CAR_ROOF_LTURN };  // DIK_A
        case 32  : { call CAR_ROOF_RTURN };  // DIK_D
        case 47  : { call CAR_ROOF_HOME };   // DIK_V
        case 199 : { call CAR_ROOF_HOME };   // DIK_HOME
        case 200 : { call CAR_ROOF_FRONT };  // DIK_UP
        case 203 : { call CAR_ROOF_LEFT };   // DIK_LEFT
        case 205 : { call CAR_ROOF_RIGHT };  // DIK_RIGHT
        case 207 : { call CAR_ROOF_END };    // DIK_END
        case 208 : { call CAR_ROOF_REAR };   // DIK_DOWN
      };
  };
  false;
};

while { true } do
{
  waituntil { ! isnull finddisplay 46 };
  finddisplay 46 displayaddeventhandler ["KeyDown", "_this call CAR_ROOF_KEYDOWN"];
  waituntil { isnull finddisplay 46 };
};
