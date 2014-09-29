private ["_activatingPlayer","_isOK","_object","_worldspace","_location","_dir","_class","_uid","_key","_keySelected","_characterID","_donotusekey"];

_object = _this select 0;
_worldspace = _this select 1;
_class = _this select 2;
_donotusekey = _this select 3;
_keySelected = _this select 4;
_activatingPlayer = _this select 5;
_characterID = _keySelected;
_isOK = isClass(configFile >> "CfgVehicles" >> _class);

if(!_isOK || isNull _object) exitWith { diag_log ("HIVE-pv3: Vehicle does not exist: "+ str(_class)); };

diag_log ("PUBLISH: Attempt " + str(_object));

_dir = _worldspace select 0;
_location = _worldspace select 1;
_uid = _worldspace call dayz_objectUID3;
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];

diag_log ("HIVE: WRITE: "+ str(_key)); 

_key call server_hiveWrite;

[_object,_uid,_characterID,_class,_dir,_location,_donotusekey,_activatingPlayer] spawn {

   private ["_object","_uid","_characterID","_done","_retry","_key","_result","_outcome","_oid","_class","_location","_donotusekey","_activatingPlayer","_countr","_objectID","_objectUID","_dir","_newobject","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty"];

   _object = _this select 0;
   _objectID 	= _object getVariable ["ObjectID","0"];
   _objectUID	= _object getVariable ["ObjectUID","0"];
   _uid = _this select 1;
   _characterID = _this select 2;
   _class = _this select 3;
   _dir = _this select 4;
   _location = getPosATL _object;
   _donotusekey = _this select 6;
   _activatingPlayer = _this select 7;
   _done = false;
   _retry = 0;

    while {_retry < 10} do {

		sleep 1;
		_key = format["CHILD:388:%1:",_uid];
		diag_log ("HIVE: WRITE: "+ str(_key));
		_result = _key call server_hiveReadWrite;
		_outcome = _result select 0;
		if (_outcome == "PASS") then {
			_oid = _result select 1;
			diag_log("CUSTOM: Selected " + str(_oid));
			_done = true;
			_retry = 100;
		} else {
			diag_log("CUSTOM: trying again to get id for: " + str(_uid));
			_done = false;
			_retry = _retry + 1;
		};
	};

	if(!_done) exitWith { diag_log("CUSTOM: failed to get id for : " + str(_uid)); };

	_weapons = getWeaponCargo _object;
	_magazines = getMagazineCargo _object;
	_backpacks = getBackpackCargo _object;

	clearWeaponCargoGlobal  _object;
	clearMagazineCargoGlobal  _object;
	clearBackpackCargoGlobal _object;

	deleteVehicle _object;

	_newobject = createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];

	[_objectID,_objectUID,_activatingPlayer] call server_deleteObj;

	_object = _newobject;
	_object setDir _dir;
	_object setPosATL _location;
	_objWpnTypes = _weapons select 0;
	_objWpnQty = _weapons select 1;
	_countr = 0;

	{
		_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} count _objWpnTypes;
	
	_objWpnTypes = _magazines select 0;
	_objWpnQty = _magazines select 1;
	_countr = 0;

	{
		_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} count _objWpnTypes;

	_objWpnTypes = _backpacks select 0;
	_objWpnQty = _backpacks select 1;
	_countr = 0;

	{
		_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} count _objWpnTypes;

	_object setVariable ["ObjectID", _oid, true];
	_object setVariable ["lastUpdate",time];
	_object setVariable ["CharacterID", _characterID, true];

	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];

	_object call fnc_veh_ResetEH;

	PVDZE_veh_Init = _object;

	publicVariable "PVDZE_veh_Init";

	diag_log ("PUBLISH: " + str(_activatingPlayer) + " Upgraded " + (_class) + " with ID " + str(_uid));

};