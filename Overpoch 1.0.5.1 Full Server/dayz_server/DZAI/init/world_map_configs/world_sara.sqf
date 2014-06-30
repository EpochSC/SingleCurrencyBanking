 15, 20, true];
	_this setTriggerText "Novi Dor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_38 = _this;

	_this = createTrigger ["EmptyDetector", [10553.928, 6644.4155]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Komarovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_40 = _this;

	_this = createTrigger ["EmptyDetector", [13353.063, 8663.6504]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Chertova Styena";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,125,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_42 = _this;

	_this = createTrigger ["EmptyDetector", [15166.025, 7882.5688, 0.0070037842]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Boye";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_44 = _this;

	_this = createTrigger ["EmptyDetector", [15558.876, 8494.04, 0.0070037842]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Postoyna";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_46 = _this;

	_this = createTrigger ["EmptyDetector", [16540.574, 8242.8887, 0.0070037842]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kopech";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_48 = _this;

	_this = createTrigger ["EmptyDetector", [17309.504, 7487.4419, 0.0070037842]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Byelov";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,225,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_50 = _this;

	_this = createTrigger ["EmptyDetector", [16243.915, 7409.8955, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Krushevich";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_52 = _this;

	_this = createTrigger ["EmptyDetector", [17607.768, 6319.5176, 3.035965]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Stari Sad";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_54 = _this;

	_this = createTrigger ["EmptyDetector", [16785.719, 6279.2632]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Stare Pole Military Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_56 = _this;

	_this = createTrigger ["EmptyDetector", [17178.059, 5636.2168, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nizhina Military Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_58 = _this;

	_this = createTrigger ["EmptyDetector", [15411.401, 9192.4111]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Slovany";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_60 = _this;

	_this = createTrigger ["EmptyDetector", [15581.011, 9501.9443, 12.227304]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dyelnica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_62 = _this;

	_this = createTrigger ["EmptyDetector", [15041.86, 9504.9785]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sabina";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_64 = _this;

	_this = createTrigger ["EmptyDetector", [14699.001, 9733.9551]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Podgorica";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_66 = _this;

	_this = createTrigger ["EmptyDetector", [14565.152, 10315.566]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sabina NW";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_68 = _this;

	_this = createTrigger ["EmptyDetector", [15288.469, 10002.771, 0.36575985]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Uyezd";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_70 = _this;

	_this = createTrigger ["EmptyDetector", [16553.207, 9717.3398, 3.4304581]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Swamp";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_72 = _this;

	_this = createTrigger ["EmptyDetector", [16682.039, 10491.062]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Airport Dubovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_74 = _this;

	_this = createTrigger ["EmptyDetector", [16264.657, 10039.261, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Swamp Military Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_76 = _this;

	_this = createTrigger ["EmptyDetector", [16299.946, 10543.948, 6.0764122]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dubovo Hotel";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_78 = _this;

	_this = createTrigger ["EmptyDetector", [14384.788, 11321.178]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Novy Bor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_80 = _this;

	_this = createTrigger ["EmptyDetector", [14022.118, 12230.344]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Solibor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_82 = _this;

	_this = createTrigger ["EmptyDetector", [12669.788, 11850.409]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Etanovsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_84 = _this;

	_this = createTrigger ["EmptyDetector", [12647.921, 12185.382]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Etanovsk N";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_86 = _this;

	_this = createTrigger ["EmptyDetector", [12489.873, 13687.467]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Doriyanov";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_88 = _this;

	_this = createTrigger ["EmptyDetector", [13687.382, 13561.73]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vinograd";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_90 = _this;

	_this = createTrigger ["EmptyDetector", [12782.429, 14425.008]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Chrveni Gradok";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_92 = _this;

	_this = createTrigger ["EmptyDetector", [12551.948, 15040.908]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nina";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_94 = _this;

	_this = createTrigger ["EmptyDetector", [12973.898, 15009.991]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kustik";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_96 = _this;

	_this = createTrigger ["EmptyDetector", [12257.277, 15375.631]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zelenogorod";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_98 = _this;

	_this = createTrigger ["EmptyDetector", [11665.791, 14927.813]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bori";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_100 = _this;

	_this = createTrigger ["EmptyDetector", [11286.337, 15285.716, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Stari Grad";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_102 = _this;

	_this = createTrigger ["EmptyDetector", [11741.102, 15547.986]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dubravka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],2,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_104 = _this;

	_this = createTrigger ["EmptyDetector", [11267.508, 15808.808]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vishkov";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_106 = _this;

	_this = createTrigger ["EmptyDetector", [10442.477, 16961.795, 1.7702827]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Krakov";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_108 = _this;

	_this = createTrigger ["EmptyDetector", [10137.112, 19032.467]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Yaroslav";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,250,thisTrigger,[],2,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_110 = _this;

	_this = createTrigger ["EmptyDetector", [10958.767, 18733.195]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ekaterinburg";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_112 = _this;

	_this = createTrigger ["EmptyDetector", [8858.2344, 19440.977, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kameni";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_114 = _this;

	_this = createTrigger ["EmptyDetector", [8137.5273, 21314.248, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Helfenburg";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_116 = _this;

	_this = createTrigger ["EmptyDetector", [14682.983, 18566.318, 5.151721]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dalnogorsk Docks";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_120 = _this;

	_this = createTrigger ["EmptyDetector", [15013.731, 18175.184]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dalnogorsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_122 = _this;

	_this = createTrigger ["EmptyDetector", [15460.476, 16249.696, 0.0069999695]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sevastopol";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,250,thisTrigger,[],1,2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_124 = _this;

	_this = createTrigger ["EmptyDetector", [15128.147, 14856.958, 0.10200119]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gorka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_126 = _this;

	_this = createTrigger ["EmptyDetector", [15057.672, 15907.486]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sevastopol Mil Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_128 = _this;

	_this = createTrigger ["EmptyDetector", [16450.443, 14297.641, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Martin Mil Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_130 = _this;

	_this = createTrigger ["EmptyDetector", [16848.723, 14094.778, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Padynya";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_132 = _this;

	_this = createTrigger ["EmptyDetector", [16173.891, 13632.278]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Martin";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_134 = _this;

	_this = createTrigger ["EmptyDetector", [15601.142, 13334.228]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Church of St Ivan";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_136 = _this;

	_this = createTrigger ["EmptyDetector", [16876.166, 12693.863, 0.071762085]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Molotovsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_138 = _this;

	_this = createTrigger ["EmptyDetector", [17310.246, 13042.589]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Molotovski Zlaiv";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,150,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_140 = _this;

	_this = createTrigger ["EmptyDetector", [16260.256, 11591.832, 0.42528534]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "DZAI Trigger";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_142 = _this;

	_this = createTrigger ["EmptyDetector", [8186.0859, 4996.0801]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Treshnyovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_144 = _this;

	_this = createTrigger ["EmptyDetector", [8496.291, 5617.8115, 9.3921585]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Polyanka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_147 = _this;

	_this = createTrigger ["EmptyDetector", [10257.061, 18503.709]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Jaroslavski Airport";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,250,thisTrigger,[],2] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_150 = _this;

	_this = createTrigger ["EmptyDetector", [13478.163, 19380.889, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Khotanovsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,175,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_152 = _this;

	_this = createTrigger ["EmptyDetector", [7846.5747, 4316.5571, 18.379284]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Branibor2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,275,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_154 = _this;

	_this = createTrigger ["EmptyDetector", [7634.6709, 4093.155]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Branibor3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,275,thisTrigger,[],1] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_157 = _this;

	//end of triggers
};

#include "custom_markers\cust_markers_tavi.sqf"
#include "custom_spawns\cust_spawns_tavi.sqf"

diag_log "Taviana static/dynamic trigger configuration loaded.";
/*
	Trinity Island static/dynamic trigger configuration 
	
	Last updated: 11:44 AM 6/7/2013
	
*/

#include "spawn_markers\markers_trinity.sqf"	//Load manual spawn point definitions file.
#include "spawn_areas\areas_trinity.sqf"		//Load spawn area definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [7183.8403, 7067.4727];
	"DZAI_centerMarker" setMarkerSize [5250, 5250];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 10;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {

	//begin triggers
	["DZAI_StansfieldAirport",[2,2],[],2] call DZAI_static_spawn;
	["DZAI_FarmArea",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea1",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea2",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_Edan"] call DZAI_static_spawn;
	["DZAI_Barracks1",[2,1]] call DZAI_static_spawn;
	["DZAI_ChapelHill",[0,1]] call DZAI_static_spawn;
	["DZAI_SarasotaS"] call DZAI_static_spawn;
	["DZAI_Sarasota"] call DZAI_static_spawn;
	["DZAI_CoastalHouse",[0,1]] call DZAI_static_spawn;
	["DZAI_Rivlin",[2,2]] call DZAI_static_spawn;
	["DZAI_RivlinChurch"] call DZAI_static_spawn;
	["DZAI_MilBase",[1,1],[],3] call DZAI_static_spawn;
	["DZAI_Ellesmere"] call DZAI_static_spawn;
	["DZAI_Bree",[1,2]] call DZAI_static_spawn;
	["DZAI_Helm",[1,2]] call DZAI_static_spawn;
	["DZAI_HelmE"] call DZAI_static_spawn;
	["DZAI_MilBase2"] call DZAI_static_spawn;
	["DZAI_MilBase3"] call DZAI_static_spawn;
	["DZAI_Abbeyfield",[2,1]] call DZAI_static_spawn;
	["DZAI_StFrances"] call DZAI_static_spawn;
	["DZAI_StFrancesW",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Contra",[2,1]] call DZAI_static_spawn;
	["DZAI_ContraNW"] call DZAI_static_spawn;
	["DZAI_Richmond",[2,1]] call DZAI_static_spawn;
	["DZAI_Totley",[1,2],[],1,2] call DZAI_static_spawn;
	["DZAI_Koul"] call DZAI_static_spawn;
	["DZAI_DurrasHights"] call DZAI_static_spawn;
	["DZAI_LodgeMoor"] call DZAI_static_spawn;
	["DZAI_MilBase4",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_MilBase5"] call DZAI_static_spawn;
	["DZAI_Deepcut",[2,2]] call DZAI_static_spawn;
	["DZAI_FarmArea2"] call DZAI_static_spawn;
	["DZAI_LibertyAirport",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_Maine",[1,2]] call DZAI_static_spawn;
	["DZAI_Eastwick"] call DZAI_static_spawn;
	["DZAI_HessIsland",[0,2]] call DZAI_static_spawn;
	["DZAI_StattonPort"] call DZAI_static_spawn;
	["DZAI_HarleyW"] call DZAI_static_spawn;
	["DZAI_Harley"] call DZAI_static_spawn;
	["DZAI_MilBarracks",[2,2],[],3] call DZAI_static_spawn;
	["DZAI_Yale",[2,1]] call DZAI_static_spawn;
	["DZAI_YaleS",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Madison"] call DZAI_static_spawn;
	["DZAI_MilBase6"] call DZAI_static_spawn;
	["DZAI_Lavayette"] call DZAI_static_spawn;
	["DZAI_TimberlandN",[2,1]] call DZAI_static_spawn;
	["DZAI_MilBase7"] call DZAI_static_spawn;
	["DZAI_TimberlandIndustrial"] call DZAI_static_spawn;
	//end of triggers
};

#include "custom_markers\cust_markers_trinity.sqf"
#include "custom_spawns\cust_spawns_trinity.sqf"

diag_log "Trinity Island/dynamic trigger configuration loaded.";
/*
	Utes static/dynamic trigger configuration 
	
	Last updated: 11:44 AM 6/7/2013
	
*/

#include "spawn_markers\markers_utes.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [3519.8037, 3703.0649];
	"DZAI_centerMarker" setMarkerSize [1000, 1000];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTrig