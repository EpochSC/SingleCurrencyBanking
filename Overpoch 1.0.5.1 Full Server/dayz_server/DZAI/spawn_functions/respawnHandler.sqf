/*
	fnc_respawnHandler
	
	Description: Creates a queue for AI groups requiring respawn. Terminates when the queue has been processed and cleared. Queue is recreated with the first AI group KIA.
	
	Usage: [_respawnTime,_trigger,_unitGroup] spawn fnc_respawnHandler;
	
	Last updated: 7:49 PM 7/9/2013
*/
#define PROCESSING_WAIT_TIME 5

private ["_unitGroup","_respawnTime","_trigger"];

_respawnTime = _this select 0;
_trigger = _this select 1; //attached variables: _patrolDist, _gradeChances, _spawnPositions, _spawnType, _maxUnits
_unitGroup = _this select 2;

//Add group to respawn queue.
DZAI_respawnQueue set [(count DZAI_respawnQueue),[_respawnTime,_trigger,_unitGroup]];
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Added Group %1 to respawn queue. Queue position %2. (respawnHandler)",_unitGroup,(count DZAI_respawnQueue)];};

if (!isNil "DZAI_respawnActive") exitWith {};

DZAI_respawnActive = true;
sleep (DZAI_respawnTime);

while {(count DZAI_respawnQueue) > 0} do {
	//diag_log format ["DEBUG: Contents of respawn queue before cleanup stage 1: %1.",DZAI_respawnQueue];
	//Remove expired entries before proceeding.
	{
		if (isNull (_x select 2)) then {
			DZAI_respawnQueue set [_forEachIndex,objNull];
		};
	} forEach DZAI_respawnQueue;
	//diag_log format ["DEBUG: Contents of respawn queue before cleanup stage 2: %1.",DZAI_respawnQueue];
	DZAI_respawnQueue = DZAI_respawnQueue - [objNull];
	//diag_log format ["DEBUG: Contents of respawn queue after cleanup: %1.",DZAI_respawnQueue];
	
	//Begin examining queue entries.
	for "_i" from 0 to ((count DZAI_respawnQueue) - 1) do {
		private["_timeToRespawn"];
		_timeToRespawn = (DZAI_respawnQueue select _i) select 0;

		//If enough time has passed to respawn the group.
		if (time >= _timeToRespawn) then {
			private["_unitGroup","_trigger","_grpArray"];
			
			_trigger = (DZAI_respawnQueue select _i) select 1;
			_unitGroup = (DZAI_respawnQueue select _i) select 2;
			_grpArray = _trigger getVariable "GroupArray";
			
			if ((!isNull _unitGroup) && (_unitGroup in _grpArray)) then {
				private["_maxUnits","_respawn"];
				_maxUnits = _trigger getVariable "maxUnits";
				_respawn = [_unitGroup,_trigger,_maxUnits] call fnc_respawnBandits;
				if (!_respawn) then {if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: No units were respawned for group %1 at %2. Group %1 reinserted into respawn queue.",_unitGroup,(mapGridPosition _trigger)];};};
			};
			DZAI_respawnQueue set [_i,objNull];
			sleep PROCESSING_WAIT_TIME;
		};
		//Delay respawning if it is too early. If the next respawn is due in less than 5 seconds, then enforce 5 second delay.
		if (time < _timeToRespawn) exitWith {
			private["_sleepTime"];
			_sleepTime = (ceil (_timeToRespawn - time)) max PROCESSING_WAIT_TIME;
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Respawn handler is entering sleep state. Next AI group is scheduled to respawn in %1 seconds. (respawnHandler)",_sleepTime];};
			sleep _sleepTime;
		};
	};
	//Remove processed entries
	DZAI_respawnQueue = DZAI_respawnQueue - [objNull];
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: %1 groups left in respawn queue.",(count DZAI_respawnQueue)];};
};
DZAI_respawnActive = nil;
if (DZAI_debugLevel > 0) then {diag_log "DZAI Debug: Respawn queue is empty. Exiting respawn handler. (respawnHandler)";};
