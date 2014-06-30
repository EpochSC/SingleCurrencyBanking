//By DJ SCOTTY - Use without permission strictly prohibited
/*
	Chernarus static/dynamic trigger configuration 
	
	Last updated: 12:06 AM 8/20/2013
	
*/

#include "spawn_markers\markers_chernarus.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [7021.9126, 8964.8379];
	"DZAI_centerMarker" setMarkerSize [5500, 5500];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 15;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {

	_this = createTrigger ["EmptyDetector", [13910.908, 2789.0437, 0.00022506714]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13603.21, 3136.8044, -0.00029945374]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13694.786, 3026.1367, 4.9591064e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13260.966, 3150.9619, 9.9182129e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty4";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13366.161, 3357.5593, -0.00037384033]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty5";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13609.124, 3288.6401, 0.00012207031]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty6";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13949.342, 2990.4536, -0.00082015991]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty7";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13500.014, 2851.6113, -0.00011634827]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty8";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
	_this = createTrigger ["EmptyDetector", [13701.264, 2902.6355]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty9";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [4,3,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	
};

/*
	Custom Marker Requirements:
	
	1. Marker shape must be Ellipse (Could be rectangular but the function will consider the marker as elliptical regardless)
	2. Marker should have identical x and y dimensions. If they are different, the smaller dimension will be used instead.
		
	The area covered by the marker will be used as the patrol and spawning area.
	
	Example Marker:
	
	_this = createMarker ["dzaicustomspawntest", [6650.9883, 9411.541, -6.1035156e-005]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [200, 200];
	_marker_15 = _this;
	
	Note: This marker will be used in the example further below.
*/

//----------------------------Add your custom markers here----------------------------


//----------------------------End of custom markers----------------------------

/*
	DZAI_spawn format: [marker,number of AI to spawn,equip type (0-3)] call DZAI_spawn;
	
	Example: Using the above example marker to create a custom spawn area, an example would be:
	
	["dzaicustomspawntest",2,1] call DZAI_spawn; (to use default trigger activation timeout of 9/12/15 seconds [minimum, average, maximum])
	
	OR 
	
	["dzaicustomspawntest",2,1,[5,10,15]] call DZAI_spawn; (to use specified trigger activation timeouts. Do not forget the extra square brackets needed!)
	
	Explanation of DZAI_spawn:
	
	[
		"dzaicustomspawntest",	//This is the marker name to be used as the patrol and spawning area.
		2, 						//This trigger will spawn a group of 2 AI units.
		1,						//AI spawned by this trigger will have Equip Type level 1 (see below for explanation of Equip Type)
		[5,10,15]				//(OPTIONAL) - Custom trigger activation timeouts (minimum, average, maximum)
	] call DZAI_spawn;
	
	Equip Type explanation:
	
	0: Approx 40% of maximum AI skill potential - weapon from Farm/Residential loot class.
	1: Approx 55% of maximum AI skill potential - weapon from Farm/Residential/Military loot class.
	2: Approx 70% of maximum AI skill potential - weapon from Farm/Residential/Military/MilitarySpecial/HeliCrash loot class
	3: Approx 80% of maximum AI skill potential - weapon from Military/MilitarySpecial/HeliCrash loot class 
	
	Note: This trigger will create 2 respawning AI units with weapons from DayZ's farm, residential, or military loot table.
	
*/

//----------------------------Add your custom spawn definitions here----------------------------


//----------------------------End of custom spawn definitions----------------------------

diag_log "Chernarus map configuration loaded.";
