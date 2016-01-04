//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [FF] Redshirt Ensign
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\

//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
    ["AK-74","AK_74",50,25],
    ["AK-107","AK_107_kobra",75,35],
    ["AKM","AK_47_M",75,35],
    ["M16A4","m16a4",75,35],
    ["M4A1 CCO","M4A1_Aim",100,55],
    ["Sa-58 CCO","Sa58V_CCO_EP1",800,250],
    ["Sa-58V ACOG","Sa58V_RCO_EP1",1500,250],
    ["M8","m8_carbine",750,220],
    ["Mk17 CCO","SCAR_H_CQC_CCO",900,250],
    ["L110A1","BAF_L110A1_Aim",600,220],
    ["M249 SAW","M249_EP1",400,120],
    ["M249 scope","M249_m145_EP1",700,220],
    ["Mk 48 Mod 0","Mk_48",1000,300],
    ["M240","M240",1000,300],
    ["PKP","Pecheneg",700,200],
    ["AK 107 GL PSO","AK_107_GL_pso",500,755],
    ["L85A2 ACOG","BAF_L85A2_RIS_ACOG",700,235],
    ["Mk12 SPR","M4SPR",900,220],
    ["M14 AIM","M14_EP1",800,250],
    ["Mk16 EGLM RCO","SCAR_L_STD_EGLM_RCO",850,220],
    ["CZ 550 Hunting Rifle","huntingrifle",900,1000],
    ["DMR","DMR",2500,550],
    ["Mk17 Sniper","SCAR_H_LNG_Sniper",2500,233],
    ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",1500,455],
    ["KSVK","ksvk",3500,1000],
    ["Mk13","Mk13_EP1",500,200],
    ["RPG-7V","RPG7V",500,500],
    ["SMAW","SMAW",600,600],
    ["FIM-92F Stinger","Stinger",800,500],
    ["M136 Launcher","M136",2000,700],
    ["M47 Dragon","M47Launcher_EP1",3000,550],
    ["NLAW","BAF_NLAW_Launcher",7000,550]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
    ["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",10],
    ["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",10],
    ["30Rnd AK","30Rnd_545x39_AK",10],
    ["AKM Mag","30Rnd_762x39_AK47",100],
    ["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
    ["30Rnd. STANAG SD","30Rnd_556x45_StanagSD",30],
    ["30Rnd G36","30Rnd_556x45_G36",25],
    ["100Rnd MG36 C Mag","100Rnd_556x45_BetaCMag",100],
    ["SA58 Mag","30Rnd_762x39_SA58",100],
    ["FN FAL Mag.","20Rnd_762x51_FNFAL",100],
    ["200Rnd. M249 Belt","200Rnd_556x45_M249",100],
    ["100Rnd. M240","100Rnd_762x51_M240",150],
    ["PKM Mag.","100Rnd_762x54_PK",100],
    ["200Rnd. L110A1 Belt","200Rnd_556x45_L110A1",100],
    ["CZ550 Hunting Ammo","5x_22_LR_17_HMR",50],
    ["20Rnd SCAR","20Rnd_762x51_B_SCAR",100],
    ["20 Rnd M14 DMR","20Rnd_762x51_DMR",100],
    ["Mk17 Mag.","20Rnd_762x51_B_SCAR",150],
    ["Mk17 SD Mag.","20Rnd_762x51_SB_SCAR",100],
    ["10Rnd. M107","10Rnd_127x99_m107",300],
    ["5RND. KSVK","5Rnd_127x108_KSVK",200],
    ["VSS rounds, 10Rnd. Mag","10Rnd_9x39_SP5_VSS",100],
    ["M203 HE shell","1Rnd_HE_M203",100],
    ["GP25 HE shell","1Rnd_HE_GP25",100],
    ["RPG PG-7V Budget Rocket","PG7VL",100],
    ["RPG OG7 Anti-personnel","OG7",200],
    ["RPG PG-7VR Anti-armor","PG7VR",300],
    ["SMAW-HEAA Rocket","SMAW_HEAA",350],
    ["Strela Rocket","Strela",200],
    ["Stinger Rocket","Stinger",200],
    ["M57 Dragon Rocket","Dragon_EP1",350],
    ["NLAW Rocket","NLAW",450],
    ["M136 Rocket","M136",350],
    ["L109A2 Frag","BAF_L109A1_HE",100],
    ["RGO Frag Grenade","HandGrenade_East",100],
    ["M67 Frag Grenade","HandGrenade_West",100],
    ["Home Made Explosives","PMC_ied_v4",2500]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["Range Finder","Binocular_Vector",2000],
	["NV Goggles","NVGoggles",100],
	["GPS","ItemGPS", 90]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
	["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",10000,500],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",600,"Chernogorsk"],
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],			
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"],
		["Town_34",200,"NovySobor"],
		["Town_35",200,"Vyshnoye"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_38",350,"Gorka"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_45",200,"Nadezhdino"],
		["Town_46",200,"Dubrovka"]
];

// Quadrant arrays for cities
cityListNW = [
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"]
];

cityListNE = [
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_34",200,"NovySobor"],
		["Town_38",350,"Gorka"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_46",200,"Dubrovka"]
];

cityListSW = [
		["Town_0",600,"Chernogorsk"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_35",200,"Vyshnoye"],
		["Town_45",200,"Nadezhdino"]
];
cityListSE = [
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"]
];

cityLocations = [];

//Random Weapon List - Change this to what you want to spawn players with.
playerWeapons = [
    "AK_107_GL_kobra",
    "AK_107_kobra",
    "AK_47_M",
    "AK_47_S",
    "AK_74",
    "AK_74_GL",
    "AK_74_GL_kobra",
    "BAF_L110A1_Aim",
    "BAF_L7A2_GPMG",
    "BAF_L85A2_RIS_ACOG",
    "BAF_L85A2_UGL_Holo",
    "BAF_L86A2_ACOG",
    "FN_FAL",
    "G36a",
    "G36_C_SD_eotech",
    "M1014",
    "M16A2",
    "M14_EP1",
    "M16A2GL",
    "m16a4",
    "M249",
    "PK",
    "RPK_74",
    "M4A1_Aim",
    "M4A1_HWS_GL",
    "M4A3_CCO_EP1",
    "M4A3_RCO_GL_EP1",
    "M4A1_RCO_GL",
    "M16A4_ACG_GL",
    "M60A4_EP1",
    "m8_carbine",
    "MG36",
    "Sa58V_EP1",
    "Sa58V_CCO_EP1",
    "Saiga12K",
    "SCAR_H_CQC_CCO",
    "SCAR_L_CQC",
    "VSS_vintorez",
    "SCAR_L_STD_Mk4CQT",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_H_CQC_CCO_SD",
    "m8_SAW",
    "m8_holo_sd",
    "m8_compact_pmc",
    "m8_compact",
    "M4A1_RCO_GL",
    "M4A1_HWS_GL_SD_Camo",
    "M249_m145_EP1",
    "huntingrifle",
    "G36K_camo",
    "G36C_camo",
    "G36A_camo",
    "FN_FAL",
    "AK_107_pso",
    "AA12_PMC"
];

banWeapons = ["Javelin","AS50","BAF_AS50_scoped","PMC_AS50_scoped","SCAR_L_STD_EGLM_TWS","m8_tws","m8_tws_sd","m107_TWS_EP1","M110_TWS_EP1","AKS_74_GOSHAWK","BAF_AS50_TWS","M249_TWS_EP1","M249_TWS_EP1","SVD_NSPU_EP1","PMC_AS50_TWS","BAF_L85A2_RIS_CWS","SCAR_H_STD_TWS_SD"];

// Add BTC Fast Roping
#include "addons\scripts\BTC_functions.sqf"
BTC_fast_rope_h = 20;
BTC_roping_choppers = ["MH60S","MH6J_EP1","UH1H_TK_GUE_EP1","Mi17_TK_EP1","UH1Y","UH60M_EP1","Ka60_GL_PMC"];

// Car Roof Vars
[] execVM "addons\scripts\carRoofVars.sqf";

//Name, Price, Vehicle
BuildStoreArray = [
	["Land_prebehlavka", 0, "Land_prebehlavka"],
	["Land_leseni2x", 0, "Land_leseni2x"],
	["Land_Misc_Scaffolding", 0, "Land_Misc_Scaffolding"],
	["Base_WarfareBBarrier10xTall", 0, "Base_WarfareBBarrier10xTall"],
	["Base_WarfareBBarrier10x", 0, "Base_WarfareBBarrier10x"],
	["Base_WarfareBBarrier5x", 0, "Base_WarfareBBarrier5x"],
	["Land_HBarrier_large", 0, "Land_HBarrier_large"],
	["Concrete_Wall_EP1", 0, "Concrete_Wall_EP1"],
	["Land_Fort_Watchtower_EP1", 0, "Land_Fort_Watchtower_EP1"],
	["Land_Fort_Watchtower", 0, "Land_Fort_Watchtower"],
	["Land_fortified_nest_small_EP1", 0, "Land_fortified_nest_small_EP1"],
	["Land_fortified_nest_big", 0, "Land_fortified_nest_big"],
	["Fort_Nest_M240", 0, "Fort_Nest_M240"],
	["WarfareBDepot", 0, "WarfareBDepot"],
	["WarfareBCamp", 0, "WarfareBCamp"],
	["Hedgehog", 0, "Hedgehog"],
	["MASH", 0, "MASH"],
	["Land_CamoNet_NATO", 0, "Land_CamoNet_NATO"],
	["Land_tent_east", 0, "Land_tent_east"],
	["RampConcrete", 0, "RampConcrete"],
	["Land_ConcreteRamp", 0, "Land_ConcreteRamp"],
	["Land_ConcreteBlock", 0, "Land_ConcreteBlock"]
];
