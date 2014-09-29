private ["_position","_num","_config","_itemType","_weights","_index","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_crashName","_nearby","_itemTypes","_cntWeights","_fadeFire"];

_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_frequency	= _this select 2;
_variance	= _this select 3;
_spawnChance	= _this select 4;
_spawnMarker	= _this select 5;
_spawnRadius	= _this select 6;
_spawnFire	= _this select 7;
_fadeFire	= _this select 8;

diag_log("CRASHSPAWNER: Starting spawn logic for Crash Spawner");

while {1 == 1} do {

	private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];

    _timeAdjust = round((random(_variance * 2)) - _variance);
	_timeToSpawn = time + _frequency + _timeAdjust;
	_crashModel = ["UH60Wreck_DZ","UH1Wreck_DZ","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ","Mass_grave_DZ"] call BIS_fnc_selectRandom;

	if(_crashModel == "Mass_grave_DZ") then {
		_lootTable = "MassGrave";
	} else {
		_lootTable = ["Military","HeliCrash","MilitarySpecial"] call BIS_fnc_selectRandom;
	};

	_crashName	= getText (configFile >> "CfgVehicles" >> _crashModel >> "displayName");

	diag_log(format["CRASHSPAWNER: %1%2 chance to spawn '%3' with loot table '%4' in %5 seconds", round(_spawnChance * 100), '%', _crashName, _lootTable, _timeToSpawn]);

	while {time < _timeToSpawn} do {
		sleep 5;
	};

	_spawnRoll = random 1;

	if (_spawnRoll <= _spawnChance) then {

		_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

		diag_log(format["CRASHSPAWNER: Spawning '%1' with loot table '%2' NOW! (%3) at: %4", _crashName, _lootTable, time, str(_position)]);

		_crash = createVehicle [_crashModel,_position, [], 0, "CAN_COLLIDE"];
		_crash setDir round(random 360);
		_config = configFile >> "CfgVehicles" >> _crashModel >> "heightAdjustment";
		_hasAdjustment =  isNumber(_config);
		_newHeight = 0;

		if (_hasAdjustment) then {
			_newHeight = getNumber(_config);
		};

		_adjustedPos = [(_position select 0), (_position select 1), _newHeight];
		_crash setPos _adjustedPos;

		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_crash];

		_crash setVariable ["ObjectID","1",true];
		_crash enableSimulation false;
        _num = (round(random _randomizedLoot)) + _guaranteedLoot;

		if(_crashModel == "Mass_grave_DZ") then {
			_spawnFire = false;
			_num = _num * 2;
		};

		if (_spawnFire) then {
			PVDZE_obj_Fire = [_crash,2,time,false,_fadeFire];
			publicVariable "PVDZE_obj_Fire";
			_crash setvariable ["fadeFire",_fadeFire,true];
		};

		_config = configFile >> "CfgBuildingLoot" >> _lootTable;

		if (DZE_MissionLootTable) then {
			_config = missionConfigFile >> "CfgBuildingLoot" >> _lootTable;
		};

		_itemTypes = [] + getArray (_config >> "itemType");
		_index = dayz_CBLBase find toLower(_lootTable);
		_weights = dayz_CBLChances select _index;
		_cntWeights = count _weights;

		for "_x" from 1 to _num do {

			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_itemType = _itemTypes select _index;

			[_itemType select 0, _itemType select 1, _position, 5] call spawn_loot;

			diag_log(format["CRASHSPAWNER: Loot spawn at '%1' with loot table '%2'", _crashName, _lootTable]);

			_nearby = _position nearObjects ["ReammoBox", sizeOf(_crashModel)];

			{
				_x setVariable ["permaLoot",true];
			} count _nearBy;
		};
	};
};