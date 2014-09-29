private ["_guaranteedLoot","_randomizedLoot","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_fadeFire","_crashModel","_lootTable","_crashName","_spawnRoll","_position","_crash","_config","_hasAdjustment","_newHeight","_adjustedPos","_num","_itemTypes","_index","_weights","_cntWeights","_nearby","_itemType","_needsrelocated","_istoomany"];

_guaranteedLoot = 3;
_randomizedLoot = 4;
_spawnChance =  0.50;
_spawnMarker = 'center';
_spawnRadius = HeliCrashArea;
_spawnFire = true;
_fadeFire = false;
_spawnRoll = random 1;

if (_spawnRoll <= _spawnChance) then {

	_crashModel = ["UH60Wreck_DZ","UH1Wreck_DZ","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ","Mass_grave_DZ"] call BIS_fnc_selectRandom;

	if(_crashModel == "Mass_grave_DZ") then {
		_lootTable = "MassGrave";
	} else {
		_lootTable = "HeliCrash";
	};

	_crashName	= getText (configFile >> "CfgVehicles" >> _crashModel >> "displayName");
	_needsrelocated = true;

	while {_needsrelocated} do {
		_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
		_istoomany = _position nearObjects ["AllVehicles",10];
		if((count _istoomany) == 0) then { _needsrelocated = false; };
	};

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
	_num = round(random _randomizedLoot) + _guaranteedLoot;

	if(_crashModel == "Mass_grave_DZ") then {
		_spawnFire = false;
		_num = _num * 2;
	};

	if (_spawnFire) then {
		PVDZE_obj_Fire = [_crash,2,time,false,_fadeFire];
		publicVariable "PVDZE_obj_Fire";
		_crash setvariable ["fadeFire",_fadeFire,true];
	};

  	if (DZE_MissionLootTable) then {
		_itemTypes = [] + getArray (missionConfigFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");
	} else {
		_itemTypes = [] + getArray (configFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");
	};

	_CBLBase = dayz_CBLBase find (toLower(_lootTable));
	_weights = dayz_CBLChances select _CBLBase;
	_cntWeights = count _weights;

	for "_x" from 1 to _num do {
		_index1 = floor(random _cntWeights);
		_index2 = _weights select _index1;
		_itemType = _itemTypes select _index2;
		[_itemType select 0, _itemType select 1, _position, 5] call spawn_loot;
	};

	_nearby = _position nearObjects ["ReammoBox", sizeOf(_crashModel)];

	{
		_x setVariable ["permaLoot",true];
	} count _nearBy;
};