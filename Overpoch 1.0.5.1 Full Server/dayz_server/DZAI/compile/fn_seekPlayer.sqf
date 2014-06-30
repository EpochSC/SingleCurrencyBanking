/*
	DZAI_dyn_huntPlayer
	
	Description: Used for dynamically spawned AI. Creates a MOVE waypoint directing AI to a random player's position, then uses BIN_taskPatrol to create a circular patrol path around player's position.
	
	Last updated: 8:41 PM 11/17/2013
*/

private ["_unitGroup","_spawnPos","_waypoint","_patrolDist","_statement","_targetPlayer","_triggerPos","_canRadio"];

_unitGroup = _this select 0;
_spawnPos = _this select 1;
_patrolDist = _this select 2;
_targetPlayer = _this select 3;
_triggerPos = _this select 4;

deleteWaypoint [_unitGroup,0];

//_statement = format ["deleteWaypoint[(group this),0]; 0 = [(group this),%1,%2,%3] spawn fnc_BIN_taskPatrol;",_spawnPos,_patrolDist,DZAI_debugMarkers];
_waypoint = _unitGroup addWaypoint [_spawnPos,0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 30;
_waypoint setWaypointTimeout [5,5,5];
_waypoint setWaypointStatements ["true","group this setCurrentWaypoint [group this,0]"];
_unitGroup setCurrentWaypoint _waypoint;

//Check if we can send player radio messages (prevent message flooding).
_canRadio = if ((_targetPlayer getVariable ["canRadio",true]) && DZAI_radioMsgs) then {
	_targetPlayer setVariable ["canRadio",false];
	true
} else {
	false
};
	
if ((_targetPlayer hasWeapon "ItemRadio") && _canRadio) then {
	[nil,_targetPlayer,"loc",rTITLETEXT,"[RADIO] A bandit group is preparing an ambush...","PLAIN DOWN",5] call RE;
};

sleep 15;

//Begin hunting phase
while {(alive _targetPlayer) && !(isNull _targetPlayer) && (((vehicle _targetPlayer) isKindOf "Man") or ((vehicle _targetPlayer) isKindOf "Motorcycle")) && ((_targetPlayer distance _spawnPos) < 450) && ((_unitGroup getVariable ["groupSize",0]) > 0)} do {
	if !(_unitGroup getVariable ["inPursuit",false]) then {
		_waypoint setWPPos getPosATL _targetPlayer;
		_unitGroup setCurrentWaypoint _waypoint;
		_unitGroup setFormDir ([(leader _unitGroup),_targetPlayer] call BIS_fnc_dirTo);
		(units _unitGroup) doTarget _targetPlayer;
		if (((leader _unitGroup) distance _targetPlayer) > 100) then {
			(units _unitGroup) doFire _targetPlayer;//Issue fire order if player is far away
		} else {
			{_x suppressFor 10} forEach (units _unitGroup);//Issue suppressive fire order if player is close by
		};
		//Warn player of AI bandit presence if they have a radio.
		if ((_targetPlayer hasWeapon "ItemRadio" ) && _canRadio) then {
			private ["_radioText"];
			_radioText = format ["[RADIO] You are being followed by a bandit group. (Distance: %1m)",round(_targetPlayer distance (leader _unitGroup))];
			[nil,_targetPlayer,"loc",rTITLETEXT,_radioText,"PLAIN DOWN",5] call RE;
		};
	};
	sleep 30;
};

if ((_unitGroup getVariable ["groupSize",0]) < 1) exitWith {};

if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Group %1 has exited hunting phase. Moving to patrol phase. (fn_seekPlayer)",_unitGroup];};

//Begin patrol phase
_waypoint setWaypointStatements ["true","if ((random 1) < 0.50) then { group this setCurrentWaypoint [(group this), (floor (random (count (waypoints (group this)))))];};"];
//_patrolCenter = if (!(isNull _targetPlayer)) then {getPosATL _targetPlayer} else {getPosATL (leader _unitGroup)};
0 = [_unitGroup,_triggerPos,_patrolDist,DZAI_debugMarkers] spawn DZAI_BIN_taskPatrol;

sleep 5;
if ((_targetPlayer hasWeapon "ItemRadio") && _canRadio && !(_unitGroup getVariable ["inPursuit",false])) then {
	[nil,_targetPlayer,"loc",rTITLETEXT,"[RADIO] You have successfully evaded the pursuing bandits.","PLAIN DOWN",5] call RE;
};

_targetPlayer setVariable ["canRadio",nil];
	
true
