/*
	fnc_createGroup
	
	Description: Spawns a group of AI units. Used for spawning of DZAI's static, dynamic, and custom AI units.
	
	_totalAI = Number of AI units to spawn in the group
	_unitGroup: Group to spawn AI unit.
	_spawnPos: Position to create AI unit.
	_trigger: The trigger object responsible for spawning the AI unit.
	_weapongrade: weapongrade to be used for generating equipment. Influences weapon quality and skill level.
	
	Last updated: 6:08 PM 11/1/2013
	
*/
private ["_totalAI","_spawnPos","_unitGroup","_trigger","_attempts","_baseDist","_dummy","_weapongrade"];
if (!isServer) exitWith {};
	
_totalAI = _this select 0;
_unitGroup = if (isNull (_this select 1)) then {createGroup (call DZAI_getFreeSide)} else {_this select 1};
_spawnPos = _this select 2;
_trigger = _this select 3;
_weapongrade = _this select 4;

_pos = [];
_attempts = 0;
_baseDist = 100;

while {((count _pos) < 1)&&(_attempts < 3)} do {
	_pos = _spawnPos findEmptyPosition [0.5,_baseDist,"Land_Ind_BoardsPack2"];
	if ((count _pos) > 1) then {
		_pos = _pos isFlatEmpty [0,0,0.75,5,0,false,ObjNull];
	};
	_baseDist = (_baseDist + 75);	_attempts = (_attempts + 1);
};

if ((count _pos) < 1) then {
	_pos = [_spawnPos,0,100,0.5,0,2000,0] call BIS_fnc_findSafePos;
	if ((_pos distance _spawnPos) > 200) then {_pos = _spawnPos;};
	_attempts = (_attempts + 1);
};

_pos set [2,0];

if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Found spawn position at %3 meters away at position %1 after %2 attempts.",_pos,_attempts,(_pos distance _spawnPos)]};

for "_i" from 1 to _totalAI do {
	private ["_type","_unit","_name"];
	_type = DZAI_BanditTypes call BIS_fnc_selectRandom2;								// Select skin of AI unit
	_unit = _unitGroup createUnit [_type, _pos, [], 0, "FORM"];							// Spawn the AI unit
	_unit setPosATL _pos;
	[_unit] joinSilent _unitGroup;														// Add AI unit to group

	_name = (name _unit);
	_unit setIdentity _name;	
	_unit setVariable ["bodyName",_name];												// Set unit body name
	_unit setVariable ["unithealth",[12000,0,0]];										// Set unit health (blood, hands health, legs health)
	_unit setVariable ["unconscious",false];											// Set unit consciousness

	if (DZAI_zAggro) then {
		_unit addEventHandler ["Fired", {_this spawn ai_fired;}];};						// Unit firing causes zombie aggro in the area, like player.
	if (DZAI_taserAI) then {
		_unit addEventHandler ["HandleDamage",{_this call DDOPP_taser_handleHit;_this call DZAI_AI_handledamage;}];
	} else {
		_unit addEventHandler ["HandleDamage",{_this call DZAI_AI_handledamage;}];};

	0 = [_unit, _weapongrade] call DZAI_setupLoadout;									// Assign unit loadout
	0 = [_unit, _weapongrade] call DZAI_setSkills;										// Set AI skill
	0 = [_unit, _weapongrade] spawn DZAI_autoRearm_unit;
	if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Spawned AI Type %1 with weapongrade %2 for group %3 (fnc_createGroup).",_type,_weapongrade,_unitGroup];};
};

//Delete dummy if it exists, and clear group's "dummy" variable.
_dummy = _unitGroup getVariable "dummyUnit";
if (!isNil "_dummy") then {
	[_dummy] joinSilent grpNull;
	deleteVehicle _dummy;
	_unitGroup setVariable ["dummyUnit",nil];
	if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Deleted 1 dummy AI unit for group %1. (fnc_createGroup)",_unitGroup];};
};

_unitGroup selectLeader ((units _unitGroup) select 0);
_unitGroup setVariable ["trigger",_trigger];
_unitGroup setVariable ["groupSize",_totalAI];

_unitGroup
