private ["_guaranteedLoot","_randomizedLoot","_spawnChance","_spawnMarker","_spawnRadius","_crashModel","_lootTable","_spawnRoll","_position","_crash","_config","_num","_itemTypes","_index","_weights","_cntWeights","_nearby","_itemType","_needsrelocated","_istoomany"];

_guaranteedLoot = 4;
_randomizedLoot = 8;
_spawnChance =  0.50;
_spawnMarker = 'center';
_spawnRadius = (HeliCrashArea/2);
_spawnRoll = random 1;

if (_spawnRoll <= _spawnChance) then {

	_crashModel = "Supply_Crate_DZE";
	_lootTable = "SupplyDrop";
	_needsrelocated = true;

	while {_needsrelocated} do {
		_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
		_istoomany = _position nearObjects ["AllVehicles",10];
		if((count _istoomany) == 0) then { _needsrelocated = false; };
	};

	_crash = createVehicle [_crashModel,_position, [], 0, "CAN_COLLIDE"];
	_crash setDir round(random 360);
	_crash setPos _position;
	_crash enableSimulation false;
    _num = (round(random _randomizedLoot)) + _guaranteedLoot;
	
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