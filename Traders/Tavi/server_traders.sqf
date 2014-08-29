/*

	CUSTOM TRADERS FOR TAVIANA EPOCH
	(Credits: DayZ Epoch Devs for their original traders.)
	AUTHOR: AVendettaForYou
	Date: 12/11/2013

*/

serverTraders = [
"GUE_Worker2",
"Soldier_Sniper_KSVK_PMC",
"Soldier_GL_PMC",
"GUE_Soldier_Pilot",
"GUE_Woodlander3",
"Worker4",
"Reynolds_PMC",
"Soldier_Sniper_PMC",
"GUE_Soldier_3",
"RU_Doctor",
"Doctor",
"UN_CDF_Soldier_Pilot_EP1",
"RU_Worker4",
"RU_Woodlander4",
"Citizen3",
"RU_Damsel5",
"Dr_Hladik_EP1",
"GUE_Commander",
"GUE_Soldier_CO",
"Profiteer2_EP1",
"RU_Farmwife5",
"GUE_Woodlander1",
"RU_Worker1",
"GUE_Soldier_2"];

/*---------------------------------------------------------------------------
			HERO VENDORS
---------------------------------------------------------------------------*/

//COMBINATION VENDOR
menu_Soldier_Sniper_PMC = [
	[["Ammunition",478],["Clothes",575],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477],["Money",700]],
	[],
	"hero"
];
//SUPPLIES
menu_GUE_Woodlander3 = [
	[["Building Supplies",508],["Toolbelt Items",510],["Vehicle Parts",509],["Money",700]],
	[],
	"neutral"
];
//MEDICAL
menu_RU_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
//FOOD & DRINK
menu_RU_Damsel5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579]],
	[["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Copper Bar",101]],
	"neutral"
];

/*---------------------------------------------------------------------------
			BANDIT VENDORS
---------------------------------------------------------------------------*/

//COMBINATION VENDOR
menu_GUE_Woodlander1 = [
[["Ammunition",478],["Clothes",575],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477],["Money",700]],
	[],
	"hostile"
];
//SUPPLIES
menu_RU_Worker1 = [
	[["Building Supplies",508],["Toolbelt Items",510],["Vehicle Parts",509],["Money",700]],
	[],
	"neutral"
];
//MEDICAl
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
//FOOD & DRINK
menu_RU_Farmwife5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579]],
	[["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Copper Bar",101]],
	"neutral"
];

/*---------------------------------------------------------------------------
			NEUTRAL VENDORS
---------------------------------------------------------------------------*/

//MEDICAL
menu_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
//SUPPLIES
menu_RU_Worker4 = [
	[["Building Supplies",508],["Toolbelt Items",510],["Vehicle Parts",509],["Money",700]],
	[],
	"neutral"
];
//WEAPONS
menu_Soldier_Sniper_KSVK_PMC = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642],["Overwatch VIL",1002],["Overwatch TAR",1003],["Overwatch Sniper",1011],["Overwatch SCAR",1004],["Overwatch sidearm",1001],["Overwatch MAS",1007],["Overwatch HK417",1009],["Overwatch HK416",1008],["Overwatch G3",1006],["Overwatch DMR",1010],["Overwatch ACR",1005]],
	[],
	"neutral"
];
//AMMUNITION
menu_Soldier_GL_PMC = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612],["Overwatch Pistol Ammo",1012],["Overwatch Gun Ammo",1013]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_Citizen3 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579]],
	[["ItemCopperBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Copper Bar",101]],
	"neutral"
];


/*---------------------------------------------------------------------------
			NEUTRAL VEHICLE VENDORS
---------------------------------------------------------------------------*/

menu_GUE_Soldier_3 = [
	[["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591],["Overwatch SP-Car",1015],["Overwatch S-Car",1016]],
	[],
	"neutral"
];
menu_RU_Woodlander4 = [
	[["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591],["Overwatch SP-Car",1015],["Overwatch S-Car",1016]],
	[],
	"neutral"
];
menu_Worker4 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_Profiteer2_EP1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_GUE_Soldier_Pilot = [
	[["Airplanes",517],["Helicopter Unarmed",519],["Overwatch Camel",1014]],
	[],
	"neutral"
];
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[["Airplanes",517],["Helicopter Unarmed",519],["Overwatch Camel",1014]],
	[],
	"neutral"
];

/*---------------------------------------------------------------------------
			FRIENDLY VENDORS
---------------------------------------------------------------------------*/

//WEAPONS
menu_GUE_Commander = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642],["Overwatch VIL",1002],["Overwatch TAR",1003],["Overwatch Sniper",1011],["Overwatch SCAR",1004],["Overwatch sidearm",1001],["Overwatch MAS",1007],["Overwatch HK417",1009],["Overwatch HK416",1008],["Overwatch G3",1006],["Overwatch DMR",1010],["Overwatch ACR",1005]],
	[],
	"neutral"
];
//AMMUNITION
menu_GUE_Soldier_CO = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612],["Overwatch Pistol Ammo",1012],["Overwatch Gun Ammo",1013]],
	[],
	"neutral"
];
//HELICOPTERS
menu_GUE_Worker2 = [
	[["Helicopter Unarmed",519]],
	[],
	"neutral"
];

/*---------------------------------------------------------------------------
			WHOLESALE VENDORS
---------------------------------------------------------------------------*/

//EAST BRIDGE
menu_GUE_Soldier_2 = [
	[["Wholesale",636]],
	[],
	"neutral"
];
//WEST BRIDGE
menu_Reynolds_PMC = [
	[["Wholesale",636]],
	[],
	"neutral"
];
