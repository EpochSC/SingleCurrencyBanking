/*
		DZAI_unitDeath
		
		Description: Called when AI unit blood level drops below zero to process unit death.
		
        Usage: [_unit,_killer] call DZAI_unitDeath;
		
		Last updated: 11:51 PM 11/19/2013
*/

private["_victim","_killer","_unitGroup","_unitType"];
_victim = _this select 0;
_killer = _this select 1;

if (_victim getVariable ["deathhandled",false]) exitWith {};
_victim setVariable ["deathhandled",true];
_victim setDamage 1;
_victim removeAllEventHandlers "HandleDamage";

_unitGroup = (group _victim);
_unitType = _unitGroup getVariable ["unitType",""];
switch (_unitType) do {
	case "static":
	{
		[_victim,_unitGroup] spawn DZAI_AI_killed_static;
	};
	case "dynamic":
	{
		[_victim,_unitGroup] spawn DZAI_AI_killed_dynamic;
	};
	case "air": 
	{
		_victim setVariable ["DZAI_deathTime",time];
		_victim removeWeapon "NVGoggles";
		_victim enableSimulation false;
	};
	case default {
		if (DZAI_debugMarkers > 0) then {
			if (({alive _x} count (units _unitGroup)) == 0) then {
				{
					deleteMarker (str _x);
				} forEach (waypoints _unitGroup);
			};
		};
	};
};

if (_unitType in ["static","dynamic"]) then {
	0 = [_victim,_killer,_unitGroup] call DZAI_AI_killed_all;
};
//diag_log format ["DEBUG :: AI %1 (Group %2) killed by %3",_victim,_unitGroup,_killer];

true
