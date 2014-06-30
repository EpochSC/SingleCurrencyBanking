/*
	DZAI Scheduler
	
	Description:
	
	Last updated: 2:21 PM 8/27/2013
*/
private ["_randomizeCount"];

diag_log "Starting DZAI Scheduler in 30 seconds.";

sleep 30;

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_aiHeliPatrols) then {
	if ((count DZAI_heliTypes) < 1) then {DZAI_heliTypes = ["UH1H_DZ"]}; 
	_nul = [] execVM '\z\addons\dayz_server\DZAI\scripts\setup_heli_patrol.sqf';
	_objectMonitor = [] call DZAI_getObjMon;
};

if (DZAI_dynAISpawns) then {
	if (!DZAI_V2dynSpawns) then {
		if (!(isNil "DZAI_newMap")) then {waitUntil {sleep 1; DZAI_locations_ready};};
		_dynTriggers = [DZAI_dynTriggersMax] execVM '\z\addons\dayz_server\DZAI\scripts\spawnTriggers_random.sqf';
		waitUntil {sleep 1; scriptDone _dynTriggers};
		_randomizeCount = ceil(0.25*DZAI_dynTriggersMax);
	} else {
		_dynManagerV2 = [] execVM '\z\addons\dayz_server\DZAI\scripts\dynamicSpawn_manager.sqf';
	};
};

sleep 3;

diag_log "DZAI Scheduler will continue tasks in 15 minutes.";
sleep 900;

while {true} do {
	if (DZAI_debugLevel > 0) then {diag_log "DZAI Scheduler is now running.";};

	//Randomize some dynamic triggers
	if (DZAI_dynAISpawns && (!DZAI_V2dynSpawns)) then {
		_dynTriggers = [_randomizeCount] spawn DZAI_randDynTriggers;
		waitUntil {sleep 1; scriptDone _dynTriggers};
		sleep 3;
	};
	
	if (DZAI_aiHeliPatrols) then {
		//Respawn any destroyed AI helicopters
		_helipatrols = [] spawn fnc_spawnHeliPatrol;
		waitUntil {sleep 1; scriptDone _helipatrols};
		sleep 3;
		//Clean up server object monitor
		_objectMonitor = _objectMonitor - [objNull];
	};

	//Clean up dead units spawned by DZAI.
	{
		private ["_deathTime"];
		_deathTime = _x getVariable "DZAI_deathTime";
		if (!isNil "_deathTime") then {
			if ((time - _deathTime) > DZAI_cleanupDelay) then {
				private ["_soundFlies"];
				_soundFlies = _x getVariable "sound_flies";
				deleteVehicle _soundFlies;
				deleteVehicle _x;
			};
		};
		sleep 0.005;
	} forEach allDead;
	
	//Wait until next cycle.
	if (DZAI_debugLevel > 0) then {diag_log "DZAI Scheduler is returning to sleeping state. Resuming in 15 minutes";};
	sleep 900;
};
