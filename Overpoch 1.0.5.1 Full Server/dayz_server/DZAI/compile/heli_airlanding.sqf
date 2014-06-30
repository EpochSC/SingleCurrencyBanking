/*
		DZAI_airLanding
		
		Description: Called when AI air vehicle performs a landing. Converts onboard AI crew into static-type units.
		
        Usage: [_helicopter] call DZAI_airLanding;
		
		Last updated: 11:52 PM 11/19/2013
*/

private ["_helicopter","_trigger","_heliPos","_weapongrade","_unitsAlive","_unitGroup"];
_helicopter = _this select 0;

_helicopter removeAllEventHandlers "Killed";
_helicopter addEventHandler ["GetIn",{
	if (isPlayer (_this select 2)) then {
		(_this select 2) action ["getOut",(_this select 0)]; 
		0 = [nil,(_this select 2),"loc",rTITLETEXT,"Players are not permitted to enter AI vehicles!","PLAIN DOWN",5] call RE;
	};
}];
//_helicopter lock true;
_unitGroup = _helicopter getVariable ["unitGroup",grpNull];

_heliPos = getPosATL _helicopter;

_weapongrade = [DZAI_weaponGrades,DZAI_gradeChancesHeli] call fnc_selectRandomWeighted;

//Convert helicrew units to ground units
{
	if (alive _x) then {
		_x setVariable ["unconscious",false];
		_x setVariable ["unithealth",[12000,0,0]];
		unassignVehicle _x;
		0 = [_x, _weapongrade] call DZAI_setupLoadout;
		0 = [_x, _weapongrade] call DZAI_setSkills;
		0 = [_x, _weapongrade] spawn DZAI_autoRearm_unit;
	};
} forEach (units _unitGroup);

{
	deleteWaypoint _x;
} forEach (waypoints _unitGroup);

0 = [_unitGroup,_heliPos,100,DZAI_debugMarkers] spawn DZAI_BIN_taskPatrol;
_unitsAlive = {alive _x} count (units _unitGroup);
_unitGroup allowFleeing 0;

//Create area trigger
_trigger = createTrigger ["EmptyDetector",_heliPos];
_trigger setTriggerArea [600, 600, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerTimeout [15, 15, 15, true];
_trigger setTriggerText (format ["HeliLandingArea_%1",mapGridPosition _helicopter]);
_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;","","0 = [thisTrigger] spawn fnc_despawnBandits;"];
0 = [_trigger,[_unitGroup],100,DZAI_gradeChancesHeli,[],[_unitsAlive,0]] call DZAI_setTrigVars;
_trigger setVariable ["respawn",false];
_trigger setVariable ["permadelete",true];

_unitGroup setVariable ["unitType","static"];
_unitGroup setVariable ["trigger",_trigger];
_unitGroup setVariable ["groupSize",_unitsAlive];

[_helicopter,900] spawn DZAI_deleteObject;
DZAI_curHeliPatrols = DZAI_curHeliPatrols - 1;
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: AI helicrew %1 landed at %2.",_unitGroup,mapGridPosition _trigger];};
