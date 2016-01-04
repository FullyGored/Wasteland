//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
if (!isServer) exitWith {};
private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch(_selectedBox) do {
    case "mission_Mid_BAF": { // Broad selection of mid-high tier weapons 
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;

        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",1];
        _currBox addWeaponCargoGlobal ["SVD_CAMO",2];
        _currBox addWeaponCargoGlobal ["M14_EP1",2];
        _currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",2];
        _currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",1];
        _currBox addWeaponCargoGlobal ["m240_scoped_EP1",2];
        _currBox addWeaponCargoGlobal ["M249_m145_EP1",2];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG",10];
        _currBox addWeaponCargoGlobal ["FN_FAL_ANPVS4",1];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_SUSAT",10];
        _currBox addWeaponCargoGlobal ["M9SD",2];

        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",95];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",10];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",24];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",20];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",8];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",4];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",5];
        _currBox addMagazineCargoGlobal ["HandGrenade",4];
        _currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",5];
        _currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",8];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",10];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",15];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",8];
    };
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;

	// Add new weapons before ammunition
	_currBox addWeaponCargoGlobal ["RPG7V",3];
	_currBox addWeaponCargoGlobal ["SMAW",2];
	_currBox addWeaponCargoGlobal ["M32_EP1",3];
	_currBox addWeaponCargoGlobal ["Stinger",2];
	
	// Add ammunition
	_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",25];
	_currBox addMagazineCargoGlobal ["PG7V",12];
	_currBox addMagazineCargoGlobal ["SMAW_HEAA",10];
        _currBox addMagazineCargoGlobal ["Stinger",10];
	_currBox addMagazineCargoGlobal ["SMAW_HEAA",10];
	_currBox addMagazineCargoGlobal ["HandGrenade",10];
	_currBox addMagazineCargoGlobal ["Mine",4];
    _currBox addMagazineCargoGlobal ["PipeBomb",4];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M107",1];
        _currBox addWeaponCargoGlobal ["DMR",1];
        _currBox addWeaponCargoGlobal ["M110_NVG_EP1",1];
        _currBox addWeaponCargoGlobal ["m240_scoped_EP1",1];
        _currBox addWeaponCargoGlobal ["M40A3",1];
        _currBox addWeaponCargoGlobal ["Mk_48_DES_EP1",1];
        _currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper",1];
        _currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",1];
        _currBox addWeaponCargoGlobal ["M4A1_Aim",4];
	_currBox addWeaponCargoGlobal ["Binocular_Vector",1];
        // Add ammunition
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",10];
        _currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",30];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",12];
        _currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",8];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",16];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",15];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",15];
    };
     case "mission_Side_RUSpecial": { // Used in the weapon cache side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["Binocular_Vector",3];
        _currBox addWeaponCargoGlobal ["KSVK",1];
        _currBox addWeaponCargoGlobal ["Pecheneg",1];
        _currBox addWeaponCargoGlobal ["PK",1];
        _currBox addWeaponCargoGlobal ["Sa58V_RCO_EP1",5];
        _currBox addWeaponCargoGlobal ["SVD_des_EP1",1];
        _currBox addWeaponCargoGlobal ["VSS_vintorez",2];
        _currBox addWeaponCargoGlobal ["AK_107_kobra",4];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["5Rnd_127x108_KSVK",20];
        _currBox addMagazineCargoGlobal ["100Rnd_762x54_PK",15];
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_SA58",20];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",20];
        _currBox addMagazineCargoGlobal ["20Rnd_9x39_SP5_VSS",20];
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",16];
    };
     case "mission_CQC_Weapons": { // Used in the weapon stash CQ mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_NLAW_Launcher",1];
        _currBox addWeaponCargoGlobal ["Stinger",1];
        _currBox addWeaponCargoGlobal ["UZI_SD_EP1",10];
        _currBox addWeaponCargoGlobal ["AA12_PMC",5];
        _currBox addWeaponCargoGlobal ["Mk13_EP1",2];
        _currBox addWeaponCargoGlobal ["Mk_48",1];
        _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO",2];
        _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD",2];
        _currBox addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo",4];
        _currBox addWeaponCargoGlobal ["Binocular_Vector",2];
        _currBox addWeaponCargoGlobal ["RPG7V",2];

        // Add ammunition
        _currBox addMagazineCargoGlobal ["NLAW",2];
        _currBox addMagazineCargoGlobal ["Stinger",3];
        _currBox addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD",90];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_HE",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",40];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",40];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",20];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR",20];
        _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",20];
        _currBox addMagazineCargoGlobal ["BAF_ied_v2",10];
        _currBox addMagazineCargoGlobal ["PG7VR",12];
    };
	case "mission_Sniper_Weapons": { // Used in the SNIPER stash CQ mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M24_des_EP1",1];
        _currBox addWeaponCargoGlobal ["ksvk",1];
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped_W",1];
        _currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD",1];
        _currBox addWeaponCargoGlobal ["UZI_SD_EP1",10];
        _currBox addWeaponCargoGlobal ["Binocular_Vector",3];

        // Add ammunition
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",2];
        _currBox addMagazineCargoGlobal ["5Rnd_127x108_KSVK",2];
        _currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",3];
        _currBox addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD",90];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR",10];
        _currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",3];
        _currBox addMagazineCargoGlobal ["BAF_ied_v2",1];
    };
	case "mission_AMS_Weapons": { // Used in the Anti Material Supplies CQ mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["m107",2];
        _currBox addWeaponCargoGlobal ["M60A4_EP1",2];
        _currBox addWeaponCargoGlobal ["M32_EP1",2];
        _currBox addWeaponCargoGlobal ["AA12_PMC",2];
        _currBox addWeaponCargoGlobal ["BAF_NLAW_Launcher",1];
        _currBox addWeaponCargoGlobal ["UZI_SD_EP1",10];
        _currBox addWeaponCargoGlobal ["RPG7V",2];


        // Add ammunition
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",8];
        _currBox addMagazineCargoGlobal ["6Rnd_HE_M203",10];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_HE",18];
        _currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",6];
        _currBox addMagazineCargoGlobal ["NLAW",3];
        _currBox addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD",90];
        _currBox addMagazineCargoGlobal ["BAF_ied_v2",10];
        _currBox addMagazineCargoGlobal ["PG7VR",3];
    };

};