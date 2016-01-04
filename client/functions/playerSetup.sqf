
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat (with mods by gn1p to stop spawn cash abuse)
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

//Get Random Gun From playerWeapons Array.
_weapon = playerWeapons select (random (count playerWeapons - 1));
_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;
_player addMagazine _mag;
_player addMagazine _mag;
_player addWeapon _weapon;
// check for multiple muzzles (eg: GL)
_muzzles = getArray(configFile >> "cfgWeapons" >> _weapon >> "muzzles");
if (count _muzzles > 1) then {
  _player selectWeapon (_muzzles select 0);
} else {
  _player selectWeapon _weapon;
};

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["cmoney",1000,false];
_player setVariable["canfood",2,false];
_player setVariable["medkits",0,false];
_player setVariable["water",2,false];
_player setVariable["fuel",1,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 1, false];
_player setVariable["fuelEmpty", 0, false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];
_player setVariable["ShowNameAllies", false];

//THANKS to gn1p for this
//Spawn without money, an MP5 and 1food&drink if your life is shorter than 3 minutes and the server has been running longer than 10 minutes
if(((time - respawnMoment) < 180) && (time > 600)) then {
    _player setVariable["cmoney",0,false];
    _player setVariable["canfood",1,false];
    _player setVariable["water",1,false];
    removeAllWeapons _player;
    _player addMagazine "30Rnd_9x19_MP5";
    _player addMagazine "30Rnd_9x19_MP5";
    _player addWeapon "MP5A5";
    _player selectWeapon "MP5A5";
};
respawnMoment = time;

[] execVM "client\functions\playerActions.sqf";
[] execVM "client\functions\blockView.sqf";
[] execVM "client\functions\blockThermal.sqf";

//CarRoof status reset
player setvariable ["ON_CAR_ROOF", 0, true];
player setvariable ["CAR_ROOF_DIR", 0, true];
detach player;

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;
