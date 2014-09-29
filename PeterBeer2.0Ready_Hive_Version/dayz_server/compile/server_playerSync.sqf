private ["_empty","_name","_playerwasNearby","_character","_magazines","_force","_characterID","_charPos","_isInVehicle","_timeSince","_humanity","_debug","_distance","_isNewMed","_isNewPos","_isNewGear","_playerPos","_playerGear","_playerBackp","_medical","_distanceFoot","_lastPos","_backpack","_kills","_killsB","_killsH","_headShots","_lastTime","_timeGross","_timeLeft","_currentWpn","_currentAnim","_config","_onLadder","_isTerminal","_currentModel","_modelChk","_muzzles","_temp","_currentState","_array","_key","_pos","_forceGear","_friendlies"];

_character = _this select 0;
_magazines = _this select 1;
_forceGear = _this select 3;
_force = true;
_playerwasNearby = false;

if ((count _this) > 4) then {
	_playerwasNearby =	_this select 4;
};

if (isNull _character) exitWith {
	diag_log ("Player is Null FAILED: Exiting, player sync: " + str(_character));
};

_characterID = _character getVariable ["CharacterID","0"];
_charPos = getPosATL _character;
_isInVehicle = vehicle _character != _character;
_timeSince = 0;
_humanity = 0;
_name = if (alive _character) then { name _character; } else { "Dead Player"; };

if (_character isKindOf "Animal") exitWith {
	diag_log ("ERROR: Cannot Sync Character " + (_name) + " is an Animal class");
};

if (isnil "_characterID") exitWith {
	diag_log ("ERROR: Cannot Sync Character " + (_name) + " has nil characterID");	
};

if (_characterID == "0") exitWith {
	diag_log ("ERROR: Cannot Sync Character " + (_name) + " as no characterID");
};

private["_debug","_distance"];

_debug = getMarkerpos "respawn_west";
_distance = _debug distance _charPos;

if (_distance < 2000) exitWith { 
	diag_log format["ERROR: server_playerSync: Cannot Sync Player %1 [%2]. Position in debug! %3",_name,_characterID,_charPos];
};

_isNewMed = _character getVariable["medForceUpdate",false];
_isNewPos = _character getVariable["posForceUpdate",false];
_isNewGear = (count _magazines) > 0;

if (_characterID != "0") then {

	_playerPos = [];
	_playerGear = [];
	_playerBackp = [];
	_medical = [];
	_distanceFoot = 0;

	if (_isNewPos || _force) then {

		if (((_charPos select 0) == 0) && ((_charPos select 1) == 0)) then {

		} else {

			_playerPos = [round(direction _character),_charPos];
			_lastPos = _character getVariable["lastPos",_charPos];

			if (count _lastPos > 2 && count _charPos > 2) then {
				if (!_isInVehicle) then {
					_distanceFoot = round(_charPos distance _lastPos);
				};
				_character setVariable["lastPos",_charPos];
			};

			if (count _charPos < 3) then {
				_playerPos =	[];
			};
		};
		_character setVariable ["posForceUpdate",false,true];
	};

	if (_isNewGear || _forceGear) then {

		_playerGear = [weapons _character,_magazines];
		_backpack = unitBackpack _character;

		if(_playerwasNearby) then {
			_empty = [[],[]];
			_playerBackp = [typeOf _backpack,_empty,_empty];
		} else {
			_playerBackp = [typeOf _backpack,getWeaponCargo _backpack,getMagazineCargo _backpack];
		};
	};

	if (_isNewMed || _force) then {

		if (!(_character getVariable["USEC_isDead",false])) then {
			_medical = _character call player_sumMedical;
		};
		_character setVariable ["medForceUpdate",false,true];
	};
	
	if (_characterID != "0") then {		

		_kills = ["zombieKills",_character] call server_getDiff;
		_killsB = ["banditKills",_character] call server_getDiff;
		_killsH = ["humanKills",_character] call server_getDiff;
		_headShots = ["headShots",_character] call server_getDiff;
		_humanity = ["humanity",_character] call server_getDiff2;
		_cashMoney = ["cashMoney",_character] call server_getDiff2;
		_character addScore _kills;		
		_lastTime = _character getVariable["lastTime",time];
		_timeGross = (time - _lastTime);
		_timeSince = floor(_timeGross / 60);
		_timeLeft = (_timeGross - (_timeSince * 60));
		_currentWpn = currentMuzzle _character;
		_currentAnim = animationState _character;
		_config = configFile >> "CfgMovesMaleSdr" >> "States" >> _currentAnim;
		_onLadder = (getNumber (_config >> "onLadder")) == 1;
		_isTerminal = (getNumber (_config >> "terminal")) == 1;
		_currentModel = typeOf _character;
		_modelChk = _character getVariable ["model_CHK",""];

		if (_currentModel == _modelChk) then {
			_currentModel = "";
		} else {
			_currentModel = _currentModel;
			_character setVariable ["model_CHK",typeOf _character];
		};

		if (_onLadder || _isInVehicle || _isTerminal) then {

			_currentAnim = "";

			if ((count _playerPos > 0) && !_isTerminal) then {
				_charPos set [2,0];
				_playerPos set[1,_charPos];					
			};
		};

		if (_isInVehicle) then {
			_currentWpn = "";
		} else {
			if ( typeName(_currentWpn) == "STRING" ) then {
				_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
				if (count _muzzles > 1) then {
					_currentWpn = currentMuzzle _character;
				};	
			} else {
				_currentWpn = "";
			};
		};

		_temp = round(_character getVariable ["temperature",100]);
		_currentState = [_currentWpn,_currentAnim,_temp];

		if(DZE_FriendlySaving) then {
			_friendlies =  [];
			_currentState set [(count _currentState),_friendlies];
		};

		if (count _playerPos > 0) then {
			_array = [];
			{
				if (_x > dayz_minpos && _x < dayz_maxpos) then {
					_array set [count _array,_x];
				};
			} count (_playerPos select 1);
			_playerPos set [1,_array];
		};

		if (!isNull _character) then {
			if (alive _character) then {
				_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,_kills,_headShots,_distanceFoot,_timeSince,_currentState,_killsH,_killsB,_currentModel,_humanity,_cashMoney];
				_key call server_hiveWrite;							
			};
		};

		if (vehicle _character != _character) then {
			if (!(vehicle _character in needUpdate_objects)) then {
				needUpdate_objects set [count needUpdate_objects, vehicle _character];
			};
		};

		_pos = _this select 0;

		{
			[_x, "gear"] call server_updateObject;
		} count nearestObjects [_pos, dayz_updateObjects, 10];

		if (_timeSince > 0) then {
			_character setVariable ["lastTime",(time - _timeLeft)];
		};
	};
};