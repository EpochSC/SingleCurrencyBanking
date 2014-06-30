/*
	DZAI Dynamic Spawn Manager
	
	Last updated: 1:59 AM 11/9/2013
*/

diag_log "Starting DZAI Dynamic Spawn Manager in 5 minutes.";
sleep 300;
diag_log "DZAI V2 Dynamic Spawn Manager started.";

_playerUIDs = [];		//Array of all collected playerUIDs
_timestamps = [];		//Array of timestamps for each corresponding playerUID

_spawnThreshold = 3;	//Current number of dynamic spawns must fall below this number before more can be created.
_spawnMax = 5;			//Maximum number of players to select each cycle. If number of online players is less than _spawnMax, all online players will be selected.
_sleepDelay = 480;		//Frequency of each cycle
_sleepVary = 240;		//Cycle frequency variance.

while {true} do {
	if ((count DZAI_dynTriggerArray) < _spawnThreshold) then {
		_allPlayers = [];		//Do not edit
		if (DZAI_debugLevel > 0) then {diag_log "DZAI Debug: Preparing to spawn dynamic triggers...";};
		{
			if (isPlayer _x) then {
				_allPlayers set [count _allPlayers,_x];
				_playerUID = getPlayerUID _x;
				if (!(_playerUID in _playerUIDs)) then {
					_index = (count _playerUIDs);
					_playerUIDs set [_index,_playerUID];
					_timestamps set [_index,time];
				};
				//diag_log format ["DZAI Debug: Found a player at %1 (%2).",mapGridPosition _x,name _x];
			};
			sleep 0.05;
		} forEach playableUnits;

		sleep 3;
		
		for "_i" from 1 to ((ceil (0.25 * (count _allPlayers))) min _spawnMax) do {
			_player = _allPlayers call BIS_fnc_selectRandom2;
			_index = _playerUIDs find (getPlayerUID _player);
			_lastSpawned = _timestamps select _index;
			_spawnChance = ((time - _lastSpawned) / (_sleepDelay*3));
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Player %1 has %2 probability of generating dynamic spawn.",name _player,_spawnChance];};
			if ((random 1) < (_spawnChance min 0.9)) then {
				_playerPos = getPosATL _player;
				_isLandUnit = if (((vehicle _player) isKindOf "Man") or ((vehicle _player) isKindOf "Land")) then {true} else {false};
				_onLand = if (surfaceIsWater _playerPos) then {false} else {true};
				_noNearbySpawns = if (({(_playerPos distance _x) < (2*(DZAI_dynTriggerRadius - (DZAI_dynTriggerRadius*DZAI_dynOverlap)))} count DZAI_dynTriggerArray) == 0) then {true} else {false};
				_noNearbyTowns = if ((count nearestLocations [_playerPos,["NameCityCapital","NameCity","NameVillage"],500]) == 0) then {true} else {false};
				_notInDebug = if ((_playerPos distance getMarkerpos "respawn_west") > 2000) then {true} else {false};
				_noPlotpole = if ((count (_playerPos nearObjects ["Plastic_Pole_EP1_DZ",100])) == 0) then {true} else {false};
				if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Player %1 - isLandUnit: %2, onLand: %3, noNearbySpawns: %4, noNearbyTowns: %5, notInDebug: %6, noPlotpole: %7.",name _player,_isLandUnit,_onLand,_noNearbySpawns,_noNearbyTowns,_notInDebug,_noPlotPole]};
				if (_isLandUnit && _onLand && _noNearbySpawns && _noNearbyTowns && _noPlotpole && _notInDebug) then {
					_timestamps set [_index,time];
					_trigger = createTrigger ["EmptyDetector",getPosATL _player];
					_trigger setTriggerArea [DZAI_dynTriggerRadius, DZAI_dynTriggerRadius, 0, false];
					_trigger setTriggerActivation ["ANY", "PRESENT", true];
					_trigger setTriggerTimeout [3, 3, 3, true];
					_trigger setTriggerText "V2 Dynamic Trigger";
					_trigger setVariable ["targetplayer",_player];
					_trigActStatements = format ["0 = [225,thisTrigger,%1] call fnc_spawnBandits_dynamic;",_spawnChance];
					_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigActStatements, "[thisTrigger] spawn fnc_despawnBandits_dynamic;"];
					if (DZAI_debugMarkers > 0) then {
						private ["_markername","_marker"];
						_markername = format["trigger_%1",_trigger];
						_marker = createMarker[_markername,(getPosATL _trigger)];
						_marker setMarkerShape "ELLIPSE";
						_marker setMarkerType "Flag";
						_marker setMarkerBrush "SOLID";
						_marker setMarkerSize [DZAI_dynTriggerRadius, DZAI_dynTriggerRadius];
						_marker setMarkerAlpha 0;
					};
					if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created dynamic trigger at %1.",(mapGridPosition _trigger)];};
					DZAI_curDynTrigs = DZAI_curDynTrigs + 1;
					DZAI_dynTriggerArray set [count DZAI_dynTriggerArray,_trigger];
				};
			};
			_allPlayers = _allPlayers - [_player];
			sleep 5;
		};
	};
	
	_nextSpawn = _sleepDelay + random(_sleepVary);
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Sleeping for %1 seconds.",_nextSpawn];};
	sleep (_nextSpawn);
};
