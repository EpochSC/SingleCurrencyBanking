/*
	Reads from CfgWorlds config and extracts information about city/town names, positions, and types.
	If an unrecognized map is detected, this script will automatically create static triggers where needed.
	
	Last updated: 1:39 AM 9/29/2013
*/

private ["_location","_cfgWorldName","_startTime","_locCount"];

DZAI_locations = [];
_startTime = diag_tickTime;
_allPlaces = [];
_locCount = 0;
_cfgWorldName = configFile >> "CfgWorlds" >> worldName >> "Names";
//diag_log format ["DEBUG :: Counted %1 location names.",(count _cfgWorldName)];

if (isNil "DZAI_newMap") then {
	for "_i" from 0 to ((count _cfgWorldName) -1) do {
		_allPlaces set [(count _allPlaces),configName (_cfgWorldName select _i)];
		//diag_log format ["DEBUG :: Added location %1 to allPlaces array.",configName (_cfgWorldName select _i)];
	};

	{
		private ["_placeType"];
		_placeType = getText (_cfgWorldName >> _x >> "type");
		if (_placeType in ["NameCityCapital","NameCity","NameVillage","NameLocal"]) then {
			private ["_placeName","_placePos"];
			_placeName = getText (_cfgWorldName >> _x >> "name");
			_placePos = [] + getArray (_cfgWorldName >> _x >> "position");
			DZAI_locations set [(count DZAI_locations),[_placeName,_placePos,_placeType,objNull]];	//Location Name, Position, Type, Dynamic Trigger object (objNull if none).
			_locCount = _locCount + 1;
			//diag_log format ["DEBUG :: Found a location at %1 (%2, %3).",_placeName,_placeType,_placePos];
		};
	} forEach _allPlaces;
} else {
	for "_i" from 0 to ((count _cfgWorldName) -1) do {
			_allPlaces set [(count _allPlaces),configName (_cfgWorldName select _i)];
			//diag_log format ["DEBUG :: Added location %1 to allPlaces array.",configName (_cfgWorldName select _i)];
		};

		{
			private ["_placeType"];
			_placeType = getText (_cfgWorldName >> _x >> "type");
			if (_placeType in ["NameCityCapital","NameCity","NameVillage","NameLocal"]) then {
				private ["_placeName","_placePos"];
				_placeName = getText (_cfgWorldName >> _x >> "name");
				_placePos = [] + getArray (_cfgWorldName >> _x >> "position");
				if (DZAI_staticAI) then {
					if (_placeType != "NameLocal") then {
						private["_trigger","_statements","_aiCount","_equipType","_patrolRad"];
						_trigger = createTrigger ["EmptyDetector", _placePos];
						_trigger setTriggerArea [600, 600, 0, false];
						_trigger setTriggerActivation ["ANY", "PRESENT", true];
						_trigger setTriggerTimeout [10, 15, 20, true];
						_trigger setTriggerText _placeName;
						switch (_placeType) do {
							case "NameCityCapital":
							{
								_aiCount = [2,1];
								_equipType = 2;
								_patrolRad = 200;
							};
							case "NameCity":
							{
								_aiCount = [1,2];
								_equipType = 1;
								_patrolRad = 175;
							};
							case "NameVillage":
							{
								_aiCount = [0,2];
								_equipType = 0;
								_patrolRad = 150;
							};
						};
						_statements = format ["0 = [%1,%2,%3,thisTrigger,[],%4] call fnc_spawnBandits;",_aiCount select 0,_aiCount select 1,_patrolRad,_equipType];
						_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;", _statements, "0 = [thisTrigger] spawn fnc_despawnBandits;"];
					};
				};
				DZAI_locations set [(count DZAI_locations),[_placeName,_placePos,_placeType]];	//Location Name, Position, Type
				_locCount = _locCount + 1;
				if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Created a static spawn at %1 (%2).",_placeName,_placeType];};
			};
			sleep 0.01;
		} forEach _allPlaces;
		if ((DZAI_dynAISpawns)&&(isNil "DZAI_dynTriggersMax")&&(!DZAI_V2dynSpawns)) then {
			DZAI_dynTriggersMax = ceil (0.2*_locCount);
		};
};
DZAI_locations_ready = true;

diag_log format ["[DZAI] %1 locations gathered in %2 seconds.",_locCount,(diag_tickTime - _startTime)];
