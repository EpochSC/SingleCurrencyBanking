/*
	DZAI Server Initialization File
	
	Description: Handles startup process for DZAI. Does not contain any values intended for modification.
	
	Last updated: 2:40 AM 8/18/2013
*/
private ["_startTime"];

if (!isServer || !isNil "DZAI_isActive") exitWith {};
DZAI_isActive = true;

#include "DZAI_version.hpp"
diag_log format ["Initializing %1 version %2",DZAI_TYPE,DZAI_VERSION];

_startTime = diag_tickTime;

//Load DZAI variables
#include "dzai_config.sqf"

//Load DZAI functions
#include "dzai_functions.sqf"

//Load DZAI classname tables
#include "world_classname_configs\default\default_classnames.sqf"

//Set internal-use variables
DZAI_weaponGrades = [0,1,2,3];								//All possible weapon grades. A "weapon grade" is a tiered classification of gear. 0: Civilian, 1: Military, 2: MilitarySpecial, 3: Heli Crash. Weapon grade also influences the general skill level of the AI unit.
DZAI_numAIUnits = 0;										//Tracks current number of currently active AI units, including dead units waiting for respawn.
DZAI_actDynTrigs = 0;										//Tracks current number of active dynamically-spawned triggers
DZAI_curDynTrigs = 0;										//Tracks current number of inactive dynamically-spawned triggers.
DZAI_actTrigs = 0;											//Tracks current number of active static triggers.	
DZAI_curHeliPatrols = 0;
DZAI_dynTriggerArray = [];									//List of all generated dynamic triggers.
DZAI_respawnQueue = [];										//Queue of AI groups that require respawning. Group ID is removed from queue after it is respawned.

//Set side relations
createcenter east;
createcenter resistance;
if (DZAI_freeForAll) then {
	//Free For All mode - All AI groups are hostile to each other.
	east setFriend [resistance, 0];
	resistance setFriend [east, 0];	
	east setFriend [east, 0];	//East is hostile to self (static and dynamic AI)
} else {
	//Normal settings - All AI groups are friendly to each other.
	east setFriend [resistance, 1];
	resistance setFriend [east, 1];	
};
east setFriend [west, 0];	
resistance setFriend [west, 0];
west setFriend [resistance, 0];
west setFriend [east, 0];

//Detect DayZ mod variant being used.
if (DZAI_modName == "") then {
	private["_modVariant"];
	_modVariant = getText (configFile >> "CfgMods" >> "DayZ" >> "dir");
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Detected mod variant %1.",_modVariant];};
	switch (_modVariant) do {
		case "@DayZ_Epoch":{
			DZAI_modName = "epoch"; 
			_nul = [] execVM '\z\addons\dayz_server\DZAI\scripts\setup_trader_areas.sqf';
		};
		case "DayzOverwatch":{DZAI_modName = "overwatch"};
		case "@DayzOverwatch":{DZAI_modName = "overwatch"};
		case "@DayZHuntingGrounds":{DZAI_modName = "huntinggrounds"};
		case "DayZLingor":{
			private["_modCheck"];
			_modCheck = getText (configFile >> "CfgMods" >> "DayZ" >> "action");
			if (_modCheck == "http://www.Skaronator.com") then {DZAI_modName = "lingorskaro"};
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Detected DayZ Lingor variant %1.",_modCheck];};
		};
	};
};

//If serverside object patch enabled, then spawn in serverside objects.
if (DZAI_objPatch) then {[] execVM '\z\addons\dayz_server\DZAI\scripts\buildingpatch_all.sqf';};

//Build DZAI weapon classname tables from CfgBuildingLoot data if DZAI_dynamicWeapons = true;
if (DZAI_dynamicWeaponList) then {[DZAI_banAIWeapons] execVM '\z\addons\dayz_server\DZAI\scripts\buildWeaponArrays.sqf';};

//Create reference marker for dynamic triggers and set default values. These values are modified on a per-map basis.
if (DZAI_aiHeliPatrols or DZAI_dynAISpawns) then {
	DZAI_centerMarker = createMarker ["DZAI_centerMarker", (getMarkerPos 'center')];
	DZAI_centerMarker setMarkerShape "ELLIPSE";
	DZAI_centerMarker setMarkerType "Empty";
	DZAI_centerMarker setMarkerBrush "Solid";
	DZAI_centerMarker setMarkerAlpha 0;
	DZAI_dynTriggerRadius = 600;
	DZAI_dynOverlap = 0.15;
};

private["_worldname"];
_worldname=toLower format ["%1",worldName];
diag_log format["[DZAI] Server is running map %1. Loading static trigger and classname configs.",_worldname];

//Load map-specific configuration file. Config files contain trigger/marker information, addition and removal of items/skins, and/or other variable customizations.
//Classname files will overwrite basic settings specified in base_classnames.sqf
if (_worldname in ["chernarus","utes","zargabad","fallujah","takistan","tavi","lingor","namalsk","mbg_celle2","oring","panthera2","isladuala","sara","trinity"]) then {
	call compile preprocessFileLineNumbers format ["\z\addons\dayz_server\DZAI\init\world_classname_configs\%1_classnames.sqf",_worldname];
	[] execVM format ["\z\addons\dayz_server\DZAI\init\world_map_configs\world_%1.sqf",_worldname];
} else {
	"DZAI_centerMarker" setMarkerSize [7000, 7000];
	if (DZAI_modName == "epoch") then {
		#include "world_classname_configs\epoch\dayz_epoch.sqf"
		_nul = [] execVM '\z\addons\dayz_server\DZAI\scripts\setup_trader_areas.sqf';
	};
	DZAI_newMap = true;
	diag_log "[DZAI] Unrecognized worldname found. Generating settings for new map...";
};

//Build map location list. If using an unknown map, DZAI will automatically generate basic static triggers at cities and towns.
[] execVM '\z\addons\dayz_server\DZAI\scripts\setup_locations.sqf';

//Initialize AI settings
if (DZAI_zombieEnemy) then {diag_log "[DZAI] AI to zombie hostility is enabled.";
	if (DZAI_weaponNoise > 0) then {DZAI_zAggro = true; diag_log "[DZAI] Zombie hostility to AI is enabled.";} else {DZAI_zAggro = false;diag_log "[DZAI] Zombie hostility to AI is disabled.";};
} else {diag_log "[DZAI] AI to zombie hostility is disabled.";};
if (isNil "DDOPP_taser_handleHit") then {DZAI_taserAI = false;} else {DZAI_taserAI = true;diag_log "[DZAI] DDOPP Taser Mod detected.";};

if (DZAI_verifyTables) then {["DZAI_Rifles0","DZAI_Rifles1","DZAI_Rifles2","DZAI_Rifles3","DZAI_Pistols0","DZAI_Pistols1","DZAI_Pistols2","DZAI_Pistols3","DZAI_Backpacks0","DZAI_Backpacks1","DZAI_Backpacks2","DZAI_Backpacks3","DZAI_Edibles","DZAI_Medicals1","DZAI_Medicals2","DZAI_MiscItemS","DZAI_MiscItemL","DZAI_BanditTypes","DZAI_heliTypes"] execVM "\z\addons\dayz_server\DZAI\scripts\verifyTables.sqf";};
[] execVM '\z\addons\dayz_server\DZAI\scripts\DZAI_scheduler.sqf';
if (DZAI_monitorRate > 0) then {[] execVM '\z\addons\dayz_server\DZAI\scripts\DZAI_monitor.sqf';};
diag_log format ["[DZAI] DZAI loaded with settings: Debug Level: %1. DebugMarkers: %2. ModName: %3. DZAI_dynamicWeaponList: %4. VerifyTables: %5.",DZAI_debugLevel,DZAI_debugMarkers,DZAI_modName,DZAI_dynamicWeaponList,DZAI_verifyTables];
diag_log format ["[DZAI] DZAI loading completed in %1 seconds.",(diag_tickTime - _startTime)];
