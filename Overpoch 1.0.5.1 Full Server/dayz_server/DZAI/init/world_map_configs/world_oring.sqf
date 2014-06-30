/*
	Oring static/dynamic trigger configuration 
	
	Last updated: 11:57 PM 6/6/2013
	
*/

#include "spawn_markers\markers_oring.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [5191.1069, 5409.1938];
	"DZAI_centerMarker" setMarkerSize [4750, 4750];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 15;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {
	//begin triggers
	_this = createTrigger ["EmptyDetector", [2109.7009, 3037.5085, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Trinidad";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [4255.7202, 1848.056, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Harfleur";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_4 = _this;

	_this = createTrigger ["EmptyDetector", [903.17896, 1973.7341, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ferme Dumahis";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_6 = _this;

	_this = createTrigger ["EmptyDetector", [1793.7174, 7077.8032, 3.687088]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Loring";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,175,thisTrigger,[],3] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_8 = _this;

	_this = createTrigger ["EmptyDetector", [1615.6993, 7398.9482, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Loring AF";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,200,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_10 = _this;

	_this = createTrigger ["EmptyDetector", [3322.5818, 7188.7842, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ZICampoVallone";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_12 = _this;

	_this = createTrigger ["EmptyDetector", [4954.312, 7560.8706]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Honfleur";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_14 = _this;

	_this = createTrigger ["EmptyDetector", [7214.5273, 6882.5146, 3.8146973e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paradisio";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_18 = _this;

	_this = createTrigger ["EmptyDetector", [7854.2119, 7714.7266, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bigels";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_20 = _this;

	_this = createTrigger ["EmptyDetector", [8095.9414, 6379.80his setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Khushab";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_12 = _this;

	_this = createTrigger ["EmptyDetector", [1475.2213, 3576.6296, 5.2146301]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Shukurkalay";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_14 = _this;

	_this = createTrigger ["EmptyDetector", [548.4129, 2759.2986]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Chaman";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_16 = _this;

	_this = createTrigger ["EmptyDetector", [1009.7563, 3189.5881, 1.3997345]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Chaman2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_18 = _this;

	_this = createTrigger ["EmptyDetector", [2005.9639, 7654.5181]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Mulladost";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_20 = _this;

	_this = createTrigger ["EmptyDetector", [3662.0393, 8584.4795]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gospandi";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_22 = _this;

	_this = createTrigger ["EmptyDetector", [4497.4453, 9376.4346, 4.9902496]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lalezar";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_26 = _this;

	_this = createTrigger ["EmptyDetector", [3025.105, 9925.2148, -3.8146973e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nagara";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_28 = _this;

	_this = createTrigger ["EmptyDetector", [4191.394, 10836.333, 1.1444092e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nagara OilfieldEast";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_30 = _this;

	_this = createTrigger ["EmptyDetector", [4165.9824, 11759.761, 3.8146973e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Shamali";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_32 = _this;

	_this = createTrigger ["EmptyDetector", [5799.0752, 11206.194, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rasman Military1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,250,thisTrigger,[],3,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_34 = _this;

	_this = createTrigger ["EmptyDetector", [6288.9844, 11246.689, -7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rasman";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,250,thisTrigger,[],2,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_36 = _this;

	_this = createTrigger ["EmptyDetector", [6045.0684, 11653.766, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rasman Military2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],3,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_38 = _this;

	_this = createTrigger ["EmptyDetector", [6842.2051, 12252.953, 1.1444092e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Safid Ab";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_40 = _this;

	_this = createTrigger ["EmptyDetector", [6037.6655, 10469.76, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rasman South";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_42 = _this;

	_this = createTrigger ["EmptyDetector", [5741.624, 9899.874, 6.8212051]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rasman-Bastam";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_44 = _this;

	_this = createTrigger ["EmptyDetector", [5602.1592, 9325.6768, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bastam North";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_46 = _this;

	_this = createTrigger ["EmptyDetector", [5640.9932, 8909.7793, -1.5258789e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bastam";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,150,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_48 = _this;

	_this = createTrigger ["EmptyDetector", [6788.7056, 8918.7549, -7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bastam East";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_50 = _this;

	_this = createTrigger ["EmptyDetector", [9167.0332, 6688.6724]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Garmarud";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_54 = _this;

	_this = createTrigger ["EmptyDetector", [10846.38, 6323.3657]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Garmsar";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_56 = _this;

	_this = createTrigger ["EmptyDetector", [10432.103, 6378.3984]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "GarmsarMilitary";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,175,thisTrigger,[],3] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_60 = _this;

	_this = createTrigger ["EmptyDetector", [11830.018, 2589.0579, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Hazar Bagh";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_62 = _this;

	_this = createTrigger ["EmptyDetector", [10974.319, 2452.8206]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTi