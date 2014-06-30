/*
	spawnBandits_dynamic

	Usage: Called by an activated dynamic trigger when a player unit enters the trigger area.
	
	Description: Spawns a group of AI units some distance from a dynamically-spawned trigger. These units do not respawn after death.
	
	Last updated: 1:59 AM 11/9/2013
*/

private ["_patrolDist","_trigger","_totalAI","_unitGroup","_targetPlayer","_playerPos","_playerDir","_playerCount","_spawnPos","_startTime","_baseDist","_distVariance","_dirVariance","_spawnChance","_vehPlayer"];
if (!isServer) exitWith {};

_patrolDist = _this select 0;
_trigger = _this select 1;
_spawnChance = _this select 2;

if (count (_trigger getVariable ["GroupArray",[]]) > 0) exitWith {if (DZAI_debugLevel > 0) then {diag_log "DZAI Debug: Active groups found. Exiting spawn script (spawnBandits_dynamic)";};};	

_startTime = diag_tickTime;

_targetPlayer = _trigger getVariable ["targetplayer",objNull];
if (isNull _targetPlayer) exitWith {
	DZAI_dynTriggerArray = DZAI_dynTriggerArray - [_trigger];
	DZAI_actDynTrigs = DZAI_actDynTrigs - 1;
	DZAI_curDynTrigs = DZAI_curDynTrigs - 1;
	if (DZAI_debugMarkers > 0) then {deleteMarker format["trigger_%1",_trigger]};

	deleteVehicle _trigger;
};

/*
	< 33% spawn chance = 1 unit + possibility of 1 more unit. (2 units max)
	33% - 66% spawn chance = 1 unit + possibility of 2 more units. (3 units max)
	> 66% spawn chance = 2 units + possibility of 1 more unit. (3 units max)
*/
_totalAI = switch (true) do {
	case (_spawnChance <= 0.33): {1 + floor(random 2)};
	case ((_spawnChance > 0.33)&&(_spawnChance <= 0.66)): {1 + floor(random 3)};
	case (_spawnChance > 0.66): {2 + floor(random 2)};
};

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Processed dynamic trigger spawn data in %1 seconds (spawnBandits_dynamic).",(diag_tickTime - _startTime)];};

_startTime = diag_tickTime;
_baseDist = 200;
_distVariance = 50;

_vehPlayer = vehicle _targetPlayer;
if (_vehPlayer isKindOf "Man") then {
	_dirVariance = if ((random 1) < 0.85) then {100} else {157.5};
} else {
	_dirVariance = if ((random 1) < 0.85) then {67.5} else {135};
	_baseDist = _baseDist - 25;
};

_playerPos = getPosATL _vehPlayer;
_playerDir = getDir _vehPlayer;

if (DZAI_debugMarkers > 0) then {
	private["_marker"];
	_marker = format["trigger_%1",_trigger];
	//_marker setMarkerPos _playerPos;
	_marker setMarkerColor "ColorOrange";
	_marker setMarkerAlpha 0.9;				//Dark orange: Activated trigger
};

//Spawn units
_spawnPos = [_playerPos,(_baseDist + random (_distVariance)),[(_playerDir-_dirVariance),(_playerDir+_dirVariance)],false] call SHK_pos;
_weapongrade = [DZAI_weaponGrades,DZAI_gradeChancesDyn] call fnc_selectRandomWeighted;
_unitGroup = [_totalAI,grpNull,_spawnPos,_trigger,_weapongrade] call DZAI_setup_AI;

//Set group variables
_unitGroup setVariable ["unitType","dynamic"];
_unitGroup setBehaviour "AWARE";
_unitGroup setCombatMode "RED";
_unitGroup setSpeedMode "FULL";
_unitGroup allowFleeing 0;
	
//Reveal target player and nearby players to AI.
_unitGroup setFormDir ([(leader _unitGroup),_vehPlayer] call BIS_fnc_dirTo);
_unitGroup reveal [_vehPlayer,4];
(units _unitGroup) doTarget _vehPlayer;
(units _unitGroup) doFire _vehPlayer;

//Update AI count
DZAI_numAIUnits = DZAI_numAIUnits + _totalAI;
if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Group %1 has group size %2.",_unitGroup,_totalAI];};

0 = [_unitGroup,_spawnPos,_patrolDist,_targetPlayer,getPosATL _trigger] spawn DZAI_dyn_huntPlayer;

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Spawned 1 new AI groups of %1 units each in %2 seconds at %3 (spawnBandits_dynamic).",_totalAI,(diag_tickTime - _startTime),(mapGridPosition _trigger)];};

0 = [_trigger,[_unitGroup]] call DZAI_setTrigVars;

true
