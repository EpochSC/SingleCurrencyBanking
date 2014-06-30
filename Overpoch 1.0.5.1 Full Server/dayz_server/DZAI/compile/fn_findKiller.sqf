/*
	fn_findKiller
	
	Description: If an AI unit is killed, surviving members of their group will aggressively pursue the killer for a set amount of time. After this amount of time has passed, the group will return to their patrol state.
	
	Last updated: 8:41 PM 11/17/2013
*/
private ["_killerPos","_unitGroup","_victim","_killer","_trigger","_detectRange","_chaseDist","_canRadio"];

_victim = _this select 0;
_killer = _this select 1;
_unitGroup = _this select 2;

_groupSize = _unitGroup getVariable ["groupSize",0];
if (_groupSize == 0) exitWith {if (DZAI_debugLevel > 0) then {diag_log "DZAI Debug: All units in group are dead. (fn_findKiller)";};};

//If group is already pursuing player and target player has killed another group member, then extend pursuit time.
if (((_unitGroup getVariable ["pursuitTime",0]) > 0)&&((_unitGroup getVariable ["targetKiller",objNull]) == _killer)) exitWith {
	_unitGroup setVariable ["pursuitTime",((_unitGroup getVariable ["pursuitTime",0]) + 20)];
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Pursuit time +20 sec for Group %1 (Target: %2) to %3 seconds (fn_findKiller).",_unitGroup,name _killer,_unitGroup getVariable ["pursuitTime",0]]};
};

//Reveal killer to AI group and order units to target and fire.
_unitGroup reveal [(vehicle _killer),4];
(units _unitGroup) doTarget (vehicle _killer);
(units _unitGroup) doFire (vehicle _killer);

_trigger = (group _victim) getVariable ["trigger",_victim];

//Calculate detection range. (Also used as chase distance)
_detectRange = 400;
	
if (((_victim distance _killer) < _detectRange) && (_killer isKindOf "Man")) then {
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Group %1 has entered pursuit state. Target: %2. (fn_findKiller)",_unitGroup,_killer];};

	//Calculate maximum pursuit range, using victim's location as origin.
	_chaseDist = _detectRange;
	
	//Temporarily cancel patrol state.
	_unitGroup lockWP true;
	
	//Set pursuit timer
	_unitGroup setVariable ["pursuitTime",time+180];
	_unitGroup setVariable ["targetKiller",_killer];
	
	//Check if we can send player radio messages (prevent message flooding).
	_canRadio = if ((_killer getVariable ["canRadio",true]) && DZAI_radioMsgs) then {
		_killer setVariable ["canRadio",false];
		true
	} else {
		false
	};
	
	//Begin pursuit state.
	while {(time < (_unitGroup getVariable ["pursuitTime",0])) && (alive _killer) && ((_unitGroup getVariable ["groupSize",0]) > 0) && !(isNull _killer) && ((_trigger distance _killer) < _chaseDist) && (((vehicle _killer) isKindOf "Man") or ((vehicle _killer) isKindOf "Motorcycle"))} do {
		_killerPos = getPosATL _killer;
		(units _unitGroup) doMove _killerPos;
		{if (alive _x) then {_x moveTo _killerPos;/*diag_log "AI unit in pursuit.";*/};} forEach (units _unitGroup);
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: AI group %3 in pursuit state. Time: %1/%2.",time,(_unitGroup getVariable ["pursuitTime",0]),_unitGroup];};
		if ((_killer hasWeapon "ItemRadio") && _canRadio) then {
			private ["_radioText"];
			_radioText = format ["[RADIO] You are being pursued by a bandit group. (Distance: %1m)",round(_killer distance (leader _unitGroup))];
			[nil,_killer,"loc",rTITLETEXT,_radioText,"PLAIN DOWN",5] call RE;
		};
		sleep 15;
	};

	//End of pursuit state. Re-enable patrol state.
	_unitGroup setVariable ["pursuitTime",0];
	_unitGroup setVariable ["targetKiller",objNull];
	_unitGroup lockWP false;
	_unitGroup setCurrentWaypoint ((waypoints _unitGroup) call BIS_fnc_selectRandom2);
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Pursuit state ended for group %1. Returning to patrol state. (fn_findKiller)",_unitGroup];};
	
	sleep 5;
	if ((_killer hasWeapon "ItemRadio") && _canRadio) then {
		[nil,_killer,"loc",rTITLETEXT,"[RADIO] You have evaded the bandit pursuit.","PLAIN DOWN",5] call RE;
	};
	_killer setVariable ["canRadio",nil];
};

_unitGroup setBehaviour "COMBAT";
