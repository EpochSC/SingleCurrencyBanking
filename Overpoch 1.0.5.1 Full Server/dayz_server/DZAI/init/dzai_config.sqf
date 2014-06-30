//Edits by DJ SCOTTY - Use without permission strictly prohibited
/*
	DZAI Configuration File
	
	Description: Contains all configurable settings of DZAI. Contains settings for debugging, customization of AI units, spawning, and loot.
	
	Last updated: 1:02 AM 11/4/2013
*/

diag_log "[DZAI] Reading DZAI configuration file.";

/*	DZAI Settings
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable event logging to arma2oaserver.rpt. Debug level setting. 0: Off, 1: Basic Debug, 2: Extended Debug. (Default: 0)
DZAI_debugLevel = 0;

//Enable or disable debug markers. 0: Off, 1: Basic markers (Track AI position, locate patrol waypoints, locate dynamically-spawned triggers), 2: Extended markers (Basic markers + Static trigger markers and refreshing dynamic trigger markers) (Default: 0)										
DZAI_debugMarkers = 0;	

//Frequency of server monitor update to RPT log in seconds. The monitor periodically reports number of max/current AI units and dynamically spawned triggers into RPT log. (Default: 300, 0 = Disabled)										
DZAI_monitorRate = 300;

//Enable or disable verification of classname tables used by DZAI. If invalid entries are found, they are removed and logged into the RPT log.
//If disabled, any invalid classnames will not be removed and clients may crash upon looting AI bodies with invalid items. Disable ONLY if a previous scan shows no invalid classnames (Default: true).										
DZAI_verifyTables = true;

//Enable to have server spawn in objects/buildings normally spawned clientside by DayZ's CfgTownGenerator. Prevents AI from walking/shooting through clutter and other objects. (Default: false)	
//If running DayZ Mod ("vanilla DayZ") or DayZ Overwatch, it is highly recommended to enable this option, as many added buildings are handled by the CfgTownGenerator.								
DZAI_objPatch = true;

//Minimum seconds to pass until a dead AI body can be cleaned up by DZAI's task scheduler. Affects both static and dynamic AI units (Default: 300).										
DZAI_cleanupDelay = 300;									

/*

	DZAI_modName value		Enables extra features (ie: Items, AI skins, loot rates, etc.) for...
	--------------------------------------------------------------------------------------------------------------------
	""						Automatically detect mod (can be manually specified by editing DZAI_modName below)
	"default"				Force default settings
	"2017"					DayZ 2017/Namalsk 2017	(Can't be automatically detected, must manually set DZAI_modName = "2017" to enable)
	"epoch"					DayZ Epoch 				(Automatically detected - no need to edit)
	"civilian"				DayZ Civilian 			(Can't be automatically detected, must manually set DZAI_modName = "civilian" to enable)
	"overwatch"				DayZ Overwatch 			(Automatically detected - no need to edit)
	"huntinggrounds"		DayZ Hunting Grounds 	(Automatically detected - no need to edit)
	
*/

//(Optional) In most cases it is unnecessary to edit this setting. If the wrong DayZ mod is being detected, choose the correct one from the list above. 
DZAI_modName = "epoch";


/*	AI Unit Variables
--------------------------------------------------------------------------------------------------------------------*/		

//AI weapon noise multiplier for zombie aggro purposes. No effect if DZAI_zombieEnemy is set to false. Enabling this option may impact server performance as a script is run for each AI bullet fired.
//Note: AI cannot be attacked or damaged by zombies.(Default: 0.00. Player equivalent: 1.00)		
DZAI_weaponNoise = 0.00;

//Passive zombie-to-AI aggro. If enabled, zombies will tend to be attracted to a nearby AI group leader. Less impactful on server performance than setting a value to DZAI_weaponNoise (Default: false).
DZAI_passiveAggro = false;

//Amount of time in seconds between AI ammo refresh and zombie check. Decreasing this value may impact server performance. (Default: 15)											
DZAI_refreshRate = 15;	

//Maximum distance for AI group leader to detect zombies. Increasing range beyond default may impact server performance. (Default: 200)							
DZAI_zDetectRange = 200;									

//Enable or disable AI hostility to zombies. If enabled, AI will attack zombies. (default: true)
DZAI_zombieEnemy = true;	

//Enable or disable "Free For All" mode. If FFA mode is enabled, all AI groups will be hostile to each other. (default: false)
//Exceptions: AI units of the same group, AI air patrols, and custom-spawn AI will not attack each other.
//Warning: This option will affect ALL AI spawned, including those spawned from other addons that include AI.
DZAI_freeForAll = false;


/*	AI Spawning Settings (Static AI spawns)
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable static AI spawns. If enabled, AI spawn points will be generated in cities, towns, and other predefined areas. Does not affect custom-defined spawns (Default: true).
DZAI_staticAI = true;

//Set minimum and maximum wait time in seconds to respawn an AI group after all units have been killed. Applies to both static AI and custom spawned AI (Default: Min 300, Max 600).									
DZAI_respawnTimeMin = 600;
DZAI_respawnTimeMax = 900;

//Time to allow spawned AI units to exist in seconds before being despawned when no players are present in a trigger area. Applies to both static AI and custom spawned AI (Default: 120)										
DZAI_despawnWait = 120;										


/*	Dynamic AI Spawning Settings
--------------------------------------------------------------------------------------------------------------------*/		

//Enable or disable dynamic AI spawns. If enabled, AI spawn locations will be randomly placed around the map. (Default: true)									
DZAI_dynAISpawns = false;

//Enable or disable V2 dynamic AI spawns. (Default: true)
//If true: New system - With V2 dynamic AI spawns, dynamic triggers are not scattered around the map. Instead, a number of random players are chosen and dynamic triggers are placed directly on their positions.
//If false: Old system - Dynamic triggers are spawned randomly around the map and periodically relocated. NOTE: This version of dynamic spawns is scheduled to be removed in DZAI 1.9.0.
//Note: The following settings will have no effect if DZAI_V2dynSpawns is true: DZAI_dynTriggersMax, DZAI_dynBlacklist. DZAI_dynAISpawns must be set true for this option to take effect.
DZAI_V2dynSpawns = true;

//(Optional) Leave as nil to have DZAI spawn a predetermined number of dynamic triggers. Can be edited to specify max number of dynamic triggers to spawn. (Default: nil)
DZAI_dynTriggersMax = nil;

//Time to wait before deleting bodies of AI units spawned from dynamic triggers. (Default: 300)									
DZAI_dynRemoveDeadWait = 300;

//Time to wait before despawning all AI units in dynamic trigger area when no players are present, and delay time before force-despawning trigger area after all spawned units have been killed. (Default: 120)
DZAI_dynDespawnWait = 120;

//List of marker-defined areas where dynamic AI spawns should NOT be created. These markers may be of any shape (rectangular or circular).
//Markers can be defined in /world_map_configs/custom_markers/cust_markers_(mapname).sqf (Default: [])
//Note: This has no effect if DZAI_V2dynSpawns is set 'true'.
DZAI_dynBlacklist = [];									


/*	AI Air Vehicle patrol settings
//Note: As of DZAI 1.8.0, users of the missionfile version of DZAI are able to use air vehicle patrols without editing the server_cleanup.fsm.
--------------------------------------------------------------------------------------------------------------------*/		

//Enable or disable AI air vehicle patrols. (Default: false)
DZAI_aiHeliPatrols = false;		

//Maximum number of active AI air vehicle patrols. (Default: 0).							
DZAI_maxHeliPatrols = 1;

//Classnames of air vehicles types to use. Valid vehicle types: Helicopters and Planes (Default: "UH1H_DZ").
//Air vehicles that are normally unarmed may have weapons added by DZAI (see "DZAI_airWeapons" setting below).								
DZAI_heliTypes = ["UH1H_DZ"];	

//Specify vehicle weapon for air vehicles that are unarmed by default. DZAI will arm these air vehicles with the specified weapons upon spawning each vehicle.
//NOTE: These classnames are not verified by DZAI - it is the user's responsibility to make sure they are valid and unbanned.
//Format: Each row containing a vehicle classname will be equipped with the weapon from the corresponding row in weapon classnames section. Ammo will be automatically assigned.
DZAI_airWeapons = [
	[
		//Air vehicle classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
		"AN2_DZ",
		"AH6X_DZ"
	]
	,
	[
		//Corresponding weapon classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
		"M240_veh",
		"M134"
	]
];

//Selects what action to take when an AI air vehicle is destroyed (Default: 2):
//0: Do nothing, 1: Dead lootable units are dropped out by parachute, 2: Live, highly-skilled, well-equipped units are dropped out by parachute.
DZAI_airLootMode = 1;		


/*	Extra AI Settings
--------------------------------------------------------------------------------------------------------------------*/

//If enabled, AI group will attempt to track down player responsible for killing a group member. Players with radios will be given text warnings if they are being pursued (Default: true)
DZAI_findKiller = true;	

//If normal probability check for spawning NVGs fails, then give AI temporary NVGs only if they are spawned with weapongrade 1 or higher (applies only during nighttime hours). Temporary NVGs are unlootable and will be removed at death (Default: false).									
DZAI_tempNVGs = false;	

//Amount of humanity to reward player for killing an AI unit (Default: 0)									
DZAI_humanityGain = 20;										

//If enabled, players with radios will be given text warnings if they are being pursued by AI groups. Text warnings include distance of pursuing AI group (Default: true)
DZAI_radioMsgs = true;


/*	Dynamic weapon list settings
--------------------------------------------------------------------------------------------------------------------*/

//True: Dynamically generate AI weapon list from CfgBuildingLoot. False: Use preset weapon list located in world_classname_configs/default/default_classnames.sqf. (Default: true).
//Highly recommended to enable DZAI_verifyTables if this option is set to false. 
DZAI_dynamicWeaponList = false;

//(Only if DZAI_dynamicWeaponList = true) List of classnames of weapons that AI should never use. By default, AI may carry any lootable weapon. Example: DZAI_banAIWeapons = ["BAF_AS50_scoped"]; will remove the M107 and AS50 from AI weapon tables if dynamic weapon list is enabled.								
//Note: It is recommended to add all melee weapon classnames into this list as AI have issues using melee weapons. 
//All melee weapons and crossbows present in DayZ 1.7.7.1 have been pre-banned ("Crossbow_DZ","Crossbow","MeleeHatchet","MeleeCrowbar","MeleeMachete","MeleeBaseball","MeleeBaseBallBat","MeleeBaseBallBatBarbed","MeleeBaseBallBatNails")
DZAI_banAIWeapons = ["AK_107_PSO","Pecheneg_DZ","Remington870_lamp","AK_74","AKS_74_kobra","AKS_74_U","AK_47_M","M1014","Sa61_EP1","Sa58P_EP1","Sa58V_EP1","Sa58V_RCO_EP1","Sa58V_CCO_EP1"];										


/*	AI loot quantity settings
--------------------------------------------------------------------------------------------------------------------*/

//Number of selections of medical items (Inventory)
DZAI_invmedicals = 1;

//Number of selections of edible items (Inventory) 										
DZAI_invedibles = 1;	

//Number of selections of medical items (Backpack)									
DZAI_bpmedicals = 1; 	

//Number of selections of edible items (Backpack)									
DZAI_bpedibles = 1;	

//Maximum number of items to select from DZAI_MiscItemS table.										
DZAI_numMiscItemS = 2;						

//Maximum number of items to select from DZAI_MiscItemL table.				
DZAI_numMiscItemL = 1;										


/*	AI loot probability settings
--------------------------------------------------------------------------------------------------------------------*/

//Chance to add each medical item.
DZAI_chanceMedicals = 0.70;	

//Chance to add each edible item.								
DZAI_chanceEdibles = 0.85;

//Chance to add random item from DZAI_MiscItemS table.									
DZAI_chanceMiscItemS = 0.60;

//Chance to add random item from DZAI_MiscItemL table.								
DZAI_chanceMiscItemL = 0.15;								


/*AI weapon/skill probabilities (gradeChances should add up to 1.00) - [Civilian, Military, MilitarySpecial, HeliCrash] - Note: AI with higher grade weaponry will also have higher skill settings.
--------------------------------------------------------------------------------------------------------------------*/

//equipType = 0 - most AI will have basic pistols or rifles, and occasionally common military weapons.
DZAI_gradeChances0 = [0.10,0.80,0.10,0.00];	

//equipType = 1 - most AI will have common rifles, many will have common military weapons. Very rarely, AI will spawn with high-grade military or helicrash weapons.				
DZAI_gradeChances1 = [0.00,0.79,0.20,0.01];	

//equipType = 2 - most AI carry military weapons, and occasionally high-grade military weapons.				
DZAI_gradeChances2 = [0.00,0.65,0.30,0.05];

//equipType = 3 - All AI will carry at least a military-grade weapon. Many will be carrying high-grade military weapons.					
DZAI_gradeChances3 = [0.00,0.00,0.80,0.20];

//Weapongrade chances for AI spawned from dynamic triggers.				
DZAI_gradeChancesDyn = [0.00,0.88,0.09,0.03];				

//Weapongrade chances for dead AI ejected from destroyed helicopter patrols.					
DZAI_gradeChancesHeli = [0.00,0.00,0.70,0.30];	

/*
	AI skill settings

	NOTE: The AI skill levels are not linear 0-3. The skill gap between 1-2 is higher than 0-1 and 2-3.
	
	0-1: Low to medium-skilled AI. Most common type of AI encountered. Intended to challenge players.
	2-3: High-skilled AI. Uncommon/rare type of AI found in places with military loot. Intended to kill players.
	HeliCrew: Maximum-skilled AI. Skills are intended to be extremely high as helicopters patrol alone and carry high-value loot.
*/

//AI skill settings level 0 (Skill, Minimum skill, Maximum bonus amount).
DZAI_skill0 = [	
	["aimingAccuracy",0.35,0.20],
	["aimingShake",0.85,0.10],
	["aimingSpeed",0.70,0.15],
	["endurance",0.60,0.20],
	["spotDistance",0.60,0.10],
	["spotTime",0.75,0.10],
	["courage",0.65,0.10],
	["reloadSpeed",0.70,0.10],
	["commanding",0.50,0.10],
	["general",0.50,0.10]
];

//AI skill settings level 1 (Skill, Minimum skill, Maximum bonus amount).
DZAI_skill1 = [	
	["aimingAccuracy",0.40,0.20],
	["aimingShake",0.85,0.10],
	["aimingSpeed",0.75,0.15],
	["endurance",0.65,0.20],
	["spotDistance",0.65,0.10],
	["spotTime",0.70,0.10],
	["courage",0.70,0.10],
	["reloadSpeed",0.75,0.10],
	["commanding",0.60,0.10],
	["general",0.60,0.10]
];

//AI skill settings level 2 (Skill, Minimum skill, Maximum bonus amount).
DZAI_skill2 = [	
	["aimingAccuracy",0.45,0.20],
	["aimingShake",0.85,0.10],
	["aimingSpeed",0.80,0.15],
	["endurance",0.70,0.20],
	["spotDistance",0.70,0.10],
	["spotTime",0.75,0.10],
	["courage",0.75,0.10],
	["reloadSpeed",0.80,0.10],
	["commanding",0.75,0.10],
	["general",0.75,0.10]
];

//AI skill settings level 3 (Skill, Minimum skill, Maximum bonus amount).
DZAI_skill3 = [	
	["aimingAccuracy",0.60,0.15],
	["aimingShake",0.85,0.15],
	["aimingSpeed",0.85,0.15],
	["endurance",0.80,0.20],
	["spotDistance",0.90,0.10],
	["spotTime",0.90,0.10],
	["courage",0.90,0.10],
	["reloadSpeed",0.90,0.10],
	["commanding",0.90,0.10],
	["general",0.90,0.10]
];

//AI skill settings level 4 (Skill, Minimum skill, Maximum bonus amount).
DZAI_heliCrewSkills = [	
	["aimingAccuracy",0.45,0.10],
	["aimingShake",0.85,0.10],
	["aimingSpeed",0.85,0.10],
	["endurance",0.60,0.20],
	["spotDistance",0.90,0.10],
	["spotTime",0.90,0.10],
	["courage",0.90,0.10],
	["reloadSpeed",0.90,0.10],
	["commanding",0.90,0.10],
	["general",0.90,0.10]
];


//NOTHING TO EDIT BEYOND THIS POINT

//Load custom DZAI settings file.
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\DZAI_settings_override.sqf";

diag_log "[DZAI] DZAI Variables loaded.";
