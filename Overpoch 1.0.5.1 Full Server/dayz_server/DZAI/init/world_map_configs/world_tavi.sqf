20, true];
	_this setTriggerText "MrzliStudenec";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_62 = _this;

	_this = createTrigger ["EmptyDetector", [8392.4355, 3147.1743, 5.815485]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zelezniki";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_64 = _this;

	_this = createTrigger ["EmptyDetector", [8599.7998, 4254.0479]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kamna Gorica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_66 = _this;

	_this = createTrigger ["EmptyDetector", [7865.2095, 1427.2308]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "New Skooma";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,165,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_68 = _this;

	_this = createTrigger ["EmptyDetector", [7818.9136, 1951.8015]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Smugglers Den";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_70 = _this;

	_this = createTrigger ["EmptyDetector", [5574.4717, 6388.4761]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gozd Mar.";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_72 = _this;

	_this = createTrigger ["EmptyDetector", [8456.0684, 2174.2231]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Unnamed Military";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,150,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_74 = _this;

	_this = createTrigger ["EmptyDetector", [2350.344, 4189.5439]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zaga-Srpenica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_77 = _this;

	_this = createTrigger ["EmptyDetector", [6914.355, 4137.5229]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Koprivnik-Gorjuse-Nomenj";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_80 = _this;

	_this = createTrigger ["EmptyDetector", [7196.7983, 3137.9199]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sorica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_82 = _this;

	_this = createTrigger ["EmptyDetector", [7222.1123, 1481.817, 4.7683716e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rockburn";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_84 = _this;

	_this = createTrigger ["EmptyDetector", [6918.874, 782.67761, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Asaband Army Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_87 = _this;

	_this = createTrigger ["EmptyDetector", [4807.9546, 1799.9658]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Taff Grove";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_90 = _this;

	_this = createTrigger ["EmptyDetector", [4782.7339, 1617.6208]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ramon's Villa";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_93 = _this;

	_this = createTrigger ["EmptyDetector", [4987.9629, 1665.6824]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ramon's Villa 2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_96 = _this;

	_this = createTrigger ["EmptyDetector", [5837.4697, 2345.4644]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Koritnica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,125,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_99 = _this;

	_this = createTrigger ["EmptyDetector", [4828.8105, 2199.0718]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Modrej-MostnaSoci-Baca";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,125,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_102 = _this;

	_this = createTrigger ["EmptyDetector", [3146.4441, 6214.7422, 0.45965576]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Riofreddo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_108 = _this;

	_this = createTrigger ["EmptyDetector", [4768.561, 6838.5864, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Podkoren-KranjskaGora";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_114 = _this;

	_this = createTrigger ["EmptyDetector", [8608.5, 4952.2651]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Begunje";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_118 = _this;

	//end of triggers
};

#include "custom_markers\cust_markers_panthera2.sqf"
#include "custom_spawns\cust_spawns_panthera2.sqf"

diag_log "Panthera static/dynamic trigger configuration loaded.";
/*
	Sahrani static/dynamic trigger configuration 
	
	Last updated: 11:57 PM 6/6/2013
	
*/

#include "spawn_markers\markers_sara.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [12693.104, 11544.386, 0.036790848];
	"DZAI_centerMarker" setMarkerSize [6250, 6250];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 15;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {
	//begin triggers
	_this = createTrigger ["EmptyDetector", [9567.4844, 9819.4053, 0.00024414063]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso Military Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,150,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [9836.3662, 9964.916, 0.080734253]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso Military Base 2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_2 = _this;

	_this = createTrigger ["EmptyDetector", [10556.573, 9628.2139]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso North";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_5 = _this;

	_this = createTrigger ["EmptyDetector", [10657.162, 9098.8779, 0.036804199]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso South";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_8 = _this;

	_this = createTrigger ["EmptyDetector", [10292.688, 9383.8066]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso West";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_11 = _this;

	_this = createTrigger ["EmptyDetector", [10748.605, 9488.3633, 6.7463531]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso East";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_15 = _this;

	_this = createTrigger ["EmptyDetector", [11562.466, 9200.8262]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Paraiso South";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_18 = _this;

	_this = createTrigger ["EmptyDetector", [11186.234, 8862.3135]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bonanza";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_20 = _this;

	_this = createTrigger ["EmptyDetector", [10151.598, 8410.0957, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pesto";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_23 = _this;

	_this = createTrigger ["EmptyDetector", [9784.5107, 8696.3291, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Yoro";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_26 = _this;

	_this = createTrigger ["EmptyDetector", [9157.2334, 8319.3779, 0.036804199]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Somato";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_29 = _this;

	_this = createTrigger ["EmptyDetector", [8217.6494, 9031.8418]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Chantico";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_31 = _this;

	_this = createTrigger ["EmptyDetector", [8065.3569, 9300.1055, 6.7385035]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Balmopan";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,2,175,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_34 = _this;

	_this = createTrigger ["EmptyDetector", [8308.2803, 9548.1729, 4.2521825]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Playa de Palomas";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,2,150,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_37 = _this;

	_this = createTrigger ["EmptyDetector", [7423.0586, 8711.1533, 4.7683716e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cedras";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,150,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_40 = _this;

	_this = createTrigger ["EmptyDetector", [8884.1748, 7772.5942]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gulan";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,2,150,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_43 = _this;

	_this = createTrigger ["EmptyDetector", [8134.5352, 7818.9639, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gulan West Military";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_46 = _this;

	_this = createTrigger ["EmptyDetector", [6885.5239, 8090.2144]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Estrella";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,150,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_49 = _this;

	_this = createTrigger ["EmptyDetector", [12352.392, 7259.4155]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "OretgoN";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_52 = _this;

	_this = createTrigger ["EmptyDetector", [12267.043, 7086.6909, 6.721674]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ortego W";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_56 = _this;

	_this = createTrigger ["EmptyDetector", [12499.284, 7094.917, 15.620382]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ortego E";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_58 = _this;

	_this = createTrigger ["EmptyDetector", [12392.56, 8487.3535, 3.5483532]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "OretgoN";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_61 = _this;

	_this = createTrigger ["EmptyDetector", [13236.584, 6909.2681, 0.10199928]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Geraldo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_64 = _this;

	_this = createTrigger ["EmptyDetector", [10292.604, 7294.0884, 17.75]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vallejo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_67 = _this;

	_this = createTrigger ["EmptyDetector", [7660.1509, 6418.7959, -4.7683716e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Arcadia";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,185,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_70 = _this;

	_this = createTrigger ["EmptyDetector", [9348.5732, 5948.7441, 8.5356789]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cayo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,185,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_73 = _this;

	_this = createTrigger ["EmptyDetector", [9305.9141, 5226.0352]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Tiberia";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,130,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_76 = _this;

	_this = createTrigger ["EmptyDetector", [10764.443, 4986.6172, 0.10199928]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Iguana";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,130,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_79 = _this;

	_this = createTrigger ["EmptyDetector", [10583.896, 4708.0063]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Iguana S";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,125,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_82 = _this;

	_this = createTrigger ["EmptyDetector", [11282.022, 5287.4814]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Parato";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,130,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_85 = _this;

	_this = createTrigger ["EmptyDetector", [11333.451, 5865.9644, 1.9073486e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolores S";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_88 = _this;

	_this = createTrigger ["EmptyDetector", [11597.621, 5836.9849]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolores SE";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_91 = _this;

	_this = createTrigger ["EmptyDetector", [11515.357, 6209.0894, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolores N";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_94 = _this;

	_this = createTrigger ["EmptyDetector", [11237.285, 6124.4678, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolores W";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_97 = _this;

	_this = createTrigger ["EmptyDetector", [12968.272, 8848.2959, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,2,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_103 = _this;

	_this = createTrigger ["EmptyDetector", [13305.436, 8848.2959, 7.512887]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_105 = _this;

	_this = createTrigger ["EmptyDetector", [13605.523, 9058.1143, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_107 = _this;

	_this = createTrigger ["EmptyDetector", [14299.234, 9441.1152, 0.00024795532]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_109 = _this;

	_this = createTrigger ["EmptyDetector", [14461.982, 8517.3066, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_111 = _this;

	_this = createTrigger ["EmptyDetector", [16535.064, 9339.3643]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_113 = _this;

	_this = createTrigger ["EmptyDetector", [14476.567, 10791.867, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_115 = _this;

	_this = createTrigger ["EmptyDetector", [17759.131, 12396.316, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_117 = _this;

	_this = createTrigger ["EmptyDetector", [14118.253, 12510.203]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,2,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_119 = _this;

	_this = createTrigger ["EmptyDetector", [13194.992, 11317.268, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_121 = _this;

	_this = createTrigger ["EmptyDetector", [17289.807, 14199.624]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,150,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_123 = _this;

	_this = createTrigger ["EmptyDetector", [19173.025, 13964.805]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,175,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_125 = _this;

	_this = createTrigger ["EmptyDetector", [11955.264, 15329.761]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pesadas";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,2,125,thisTrigger,[],3] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_127 = _this;

	_this = createTrigger ["EmptyDetector", [12550.743, 14988.896]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_129 = _this;

	_this = createTrigger ["EmptyDetector", [7736.0464, 15805.851, 0.00024795532]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_131 = _this;

	_this = createTrigger ["EmptyDetector", [8166.4893, 17013.783]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,90,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_133 = _this;

	_this = createTrigger ["EmptyDetector", [12160.592, 17656.854]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_135 = _this;

	_this = createTrigger ["EmptyDetector", [15399.514, 13750.813, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_137 = _this;

	_this = createTrigger ["EmptyDetector", [4896.603, 15654.142, -3.0517578e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_139 = _this;

	_this = createTrigger ["EmptyDetector", [4469.1465, 15512.637, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_141 = _this;

	_this = createTrigger ["EmptyDetector", [14214.354, 11860.975, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_143 = _this;

	_this = createTrigger ["EmptyDetector", [13774.11, 11517.231, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_145 = _this;

	_this = createTrigger ["EmptyDetector", [17560.428, 9583.8975, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Default";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,125,thisTrigger,[],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_147 = _this;

	_this = createT