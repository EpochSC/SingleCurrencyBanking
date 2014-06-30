/*
	fnc_dynAIDeath
	
	Description: Begins force despawn for dynamic AI when the entire group has been killed.
	
	Usage:
	
	Last Updated: 3:05 PM 6/24/2013
*/

private ["_victim","_unitsAlive","_trigger","_unitGroup","_dummy"];

_victim = _this select 0;
_unitGroup = _this select 1;

_trigger = _unitGroup getVariable "trigger";
_unitsAlive = {alive _x} count (units _unitGroup);

//If all units in the group have died, create dummy AI unit to preserve group, then begin force despawn process.
if (_unitsAlive == 0) then {
	if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: All units in group %1 are dead. Spawning temporary dummy unit for group. (fnc_dynAIDeath).",_unitGroup];};

	_dummy = _unitGroup createUnit ["Survivor1_DZ",[0,0,0],[],0,"FORM"];
	[_dummy] joinSilent _unitGroup;
	_dummy setVehicleInit "this hideObject true;this allowDamage false;this enableSimulation false;"; processInitCommands;
	_dummy disableAI "FSM";
	_dummy disableAI "ANIM";
	_dummy disableAI "MOVE";
	_dummy disableAI "TARGET";
	_dummy disableAI "AUTOTARGET";
	
	if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: All groups spawned by trigger %1 are dead. Starting force respawn. (fnc_dynAIDeath).",_trigger];};
	_trigger setVariable ["forceDespawn",true];
	[_trigger] spawn fnc_despawnBandits_dynamic;	//force despawning even if players are present in trigger area.
};

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: AI group %1 killed, %2 units left alive in group. (fnc_dynAIDeath).",_unitGroup,_unitsAlive];};

sleep 3;
_victim enableSimulation false;
