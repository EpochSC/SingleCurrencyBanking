/*
	heli_despawn
	
	Description:
	
	Last updated: 4:40 PM 11/2/2013
	
*/

if (!isServer) exitWith {};

private ["_helicopter","_unitGroup","_deleteQueue","_cleanupTime","_crewCount","_killer"];

_helicopter = _this select 0;
_killer = _this select 1;
_unitGroup = _helicopter getVariable "unitGroup";
_crewCount = _helicopter getVariable ["crewCount",1];

_helicopter removeAllEventHandlers "LandedTouchDown";

{
	deleteVehicle _x;
} forEach (units _unitGroup);
sleep 0.1;
deleteGroup _unitGroup;

DZAI_curHeliPatrols = DZAI_curHeliPatrols - 1;
_deleteQueue = [_helicopter];

if (DZAI_airLootMode > 0) then {
	private ["_heliPos"];
	_heliPos = getPosATL _helicopter;
	if (!(surfaceIsWater _heliPos)) then {
		if (DZAI_airLootMode == 1) then {
			for "_i" from 1 to _crewCount do {
				private ["_dropPos","_agentType","_weapongrade","_agent","_parachute"];
				_agentType = (DZAI_BanditTypes call BIS_fnc_selectRandom2);
				_weapongrade = [DZAI_weaponGrades,DZAI_gradeChancesHeli] call fnc_selectRandomWeighted;
				_dropPos = [((_heliPos select 0) + (random 10) - (random 10)),((_heliPos select 1) + (random 10) - (random 10)),90];
				_parachute = createVehicle ["ParachuteWest", _dropPos, [], 0, "FLY"];
				_agent = createAgent [_agentType,[0,0,0],[],1,"NONE"];
				_agent moveInDriver _parachute;
				_nul = [_agent,_weapongrade] call DZAI_setupLoadout;
				_nul = [_agent,_weapongrade] spawn DZAI_addLoot;
				_agent setDamage 1;
				_agent spawn DZAI_deathFlies;
				[_deleteQueue,[_agent,(_agent getVariable ["sound_flies",objNull])]] call DZAI_append;
				if (DZAI_debugLevel > 0) then {
					diag_log format ["DZAI Debug: Spawned loot agent with weapongrade %2 at %1.",mapGridPosition _dropPos,_weapongrade];
					if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Agent %1 deployed in parachute %2. Parachute passenger is %3.",_agent,_parachute,(crew _parachute)];};
				};
				sleep 0.5;
			};
		} else {
			private ["_dropMarker","_dropTrigger","_statements"];
			
			//Create spawn area marker
			_dropMarker = createMarker [str _helicopter, _heliPos];
			_dropMarker setMarkerShape "ELLIPSE";
			_dropMarker setMarkerType "Empty";
			_dropMarker setMarkerBrush "Solid";
			_dropMarker setMarkerSize [100, 100];
			_dropMarker setMarkerAlpha 0;
			
			//Create area trigger
			_dropTrigger = createTrigger ["EmptyDetector",_heliPos];
			_dropTrigger setTriggerArea [600, 600, 0, false];
			_dropTrigger setTriggerActivation ["ANY", "PRESENT", true];
			_dropTrigger setTriggerTimeout [3, 4, 5, true];
			_dropTrigger setTriggerText (format ["Paradrop%1",mapGridPosition _helicopter]);
			_statements = format ["0 = [%1,0,100,thisTrigger,-1,'%2'] call fnc_spawnBandits_custom;",_crewCount,_dropMarker];
			_dropTrigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_statements,"0 = [thisTrigger] spawn fnc_despawnBandits;"];
			_dropTrigger setVariable ["respawn",false];
			_dropTrigger setVariable ["spawnmarker",_dropMarker];
			_dropTrigger setVariable ["permadelete",true];
			
			_nul = _dropTrigger spawn {
				private ["_timelimit","_deleteTrigger"];

				_timelimit = time +60;
				_deleteTrigger = true;
				while {(time < _timelimit) && _deleteTrigger} do {
					if ((count (_this getVariable ["GroupArray",[]])) > 0) then {_deleteTrigger = false};
					sleep 10;
				};
				if (_deleteTrigger) then {deleteVehicle _this};
			};
			
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Spawning AI paradrop at %1.",mapGridPosition _dropTrigger];};
		};
	};
};

_cleanupTime = 900;	//seconds to despawn helicopter and loot agents.
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Helicopter patrol destroyed. Cleanup in %1 seconds.",_cleanupTime];};
[_deleteQueue,_cleanupTime] spawn DZAI_deleteObject;
