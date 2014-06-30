erStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_169 = _this;

	//end of triggers
};

#include "custom_markers\cust_markers_sara.sqf"
#include "custom_spawns\cust_spawns_sara.sqf"

diag_log "Sahrani static/dynamic trigger configuration loaded.";
/*
	Takistan static/dynamic trigger configuration 
	
	Last updated: 11:58 PM 6/6/2013
	
*/

#include "spawn_markers\markers_takistan.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [6368.2764, 6624.2744];
	"DZAI_centerMarker" setMarkerSize [6000, 6000];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 16;};
};
		
if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {
//begin triggers

	_this = createTrigger ["EmptyDetector", [1999.8049, 333.89359, 0.68896484]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Landay";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [3599.5557, 1262.9868, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ahmaday";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_2 = _this;

	_this = createTrigger ["EmptyDetector", [4440.0664, 667.60712]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ChakChak";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_4 = _this;

	_this = createTrigger ["EmptyDetector", [3752.6982, 4460.8936]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sakhe";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_6 = _this;

	_this = createTrigger ["EmptyDetector", [3284.1165, 3675.4705]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sakhe2";
	_this setTrig