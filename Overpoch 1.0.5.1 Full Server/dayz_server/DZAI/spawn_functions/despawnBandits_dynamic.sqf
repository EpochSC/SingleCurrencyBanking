/*
	despawnBandits_dynamic

	Description: Deletes all AI units spawned by a trigger once all players leave the trigger area, then moves the trigger to a random location. Adapted from Sarge AI.
	
	Usage: Called by a dynamic trigger when all players have left the trigger area, or if all AI units spawned by the trigger have been killed.

	Last updated: 3:26 PM 6/26/2013
	
*/
#include "\z\addons\dayz_server\DZAI\init\dyn_trigger_configs\dyn_trigger_defs.hpp"

private ["_trigger","_grpArray","_isCleaning","_grpCount","_waitTime","_newPos","_forceDespawn","_attempts","_oldPos"];
if (!isServer) exitWith {};										//Execute script only on server.

_trigger = _this select 0;										//Get the trigger object

_grpArray = _trigger getVariable ["GroupArray",[]];				//Find the groups spawned by the trigger. Or set an empty group array if none are found.
_isCleaning = _trigger getVariable ["isCleaning",nil];			//Find whether or not the trigger has been marked for cleanup, otherwise assume a cleanup has already happened.
_forceDespawn = _trigger getVariable ["forceDespawn",false];	//Check whether to run despawn script even if players are present in the trigger area.
if (isNil "_forceDespawn") then {_forceDespawn = false;};

if (_forceDespawn) then {
	_waitTime = DZAI_dynRemoveDeadWait;	//Longer sleep if despawning due to all units killed to allow for looting.
} else {
	_waitTime = DZAI_dynDespawnWait;	//Shorter sleep if despawning due to no player presence.
};

_grpCount = count _grpArray;

if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: _grpArray is %1. _isCleaning is %2.",_grpArray,_isCleaning];};
if ((_grpCount == 0) && (isNil "_isCleaning")) exitWith {if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: Trigger's _grpCount is zero and _isCleaning is nil. (Nothing to despawn).";};};
if ((_grpCount == 0) || (_isCleaning)) exitWith {if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: Trigger's group array is empty, or a despawn script is already running. Exiting despawn script.";};};				//Exit script if the trigger hasn't spawned any AI units, or if a despawn script is already running for the trigger.

_trigger setVariable["isCleaning",true,false];			//Mark the trigger as being in a cleanup state so that subsequent requests to despawn for the same trigger will not run.
if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: No players remain in trigger area. Deleting spawned AI in %1 seconds.",_waitTime];};
if (DZAI_debugMarkers > 0) then {
	private["_marker"];
	_marker = format["trigger_%1",_trigger];
	_marker setMarkerColor "ColorGreenAlpha";
	_marker setMarkerAlpha 0.7;							//Light green: Active trigger awaiting despawn.
};
sleep _waitTime;								//Wait some time before deleting units. (amount of time to allow units to exist when the trigger area has no players)

if ((triggerActivated _trigger) && (!_forceDespawn)) exitWith {
	if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: A player has entered the trigger area. Cancelling despawn script.";}; //Exit script if trigger has been reactivated since _waitTime seconds has passed.
	_trigger setVariable ["isCleaning",false,false];	//Allow next despawn request.
	if (DZAI_debugMarkers > 0) then {
		private["_marker"];
		_marker = format["trigger_%1",_trigger];
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerAlpha 0.9;						//Reset trigger indicator color to Active.
	};
};			

{
	if (DZAI_debugMarkers > 0) then {
		{
			deleteMarker (str _x);
		} forEach (waypoints _x);
		sleep 0.1;
	};
	DZAI_numAIUnits = DZAI_numAIUnits - (_x getVariable ["groupSize",0]);	//Update active AI count
	{deleteVehicle _x} forEach (units _x);							//Delete live units
	sleep 0.5;
	deleteGroup _x;													//Delete the group after its units are deleted.
	sleep 0.1;
} forEach _grpArray;

//Restore original trigger statements
_trigger setTriggerStatements [DYNTRIG_STATEMENTS_INACTIVE];
_oldPos = mapGridPosition _trigger;

//Relocate trigger
_newPos = _trigger call DZAI_relocDynTrigger;

if (DZAI_debugMarkers > 0) then {
	private["_marker"];
	_marker = format["trigger_%1",_trigger];
	_marker setMarkerPos _newPos;
	_marker setMarkerColor "ColorYellow";			//Reset trigger indicator to Ready.
	_marker setMarkerAlpha 0.8;
};

//Clean up trigger variables
if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: Relocating dynamic trigger.";};
_trigger setVariable ["GroupArray",[],false];
_trigger setVariable ["isCleaning",nil,false];
_trigger setVariable ["patrolDist",nil,false];
_trigger setVariable ["gradeChances",nil,false];
_trigger setVariable ["forceDespawn",nil,false];

DZAI_actDynTrigs = (DZAI_actDynTrigs - 1);
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Despawned AI in dynamic trigger area at %1. Trigger relocated to %2.",_oldPos,(mapGridPosition _trigger)];};

true
