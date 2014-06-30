#define WEAPON_BANNED_STRING "bin\config.bin/CfgWeapons/FakeWeapon"
#define VEHICLE_BANNED_STRING "bin\config.bin/CfgVehicles/Banned"
#define MAGAZINE_BANNED_STRING "bin\config.bin/CfgMagazines/FakeMagazine"

/*
	verifyTables script written for DZAI
	
	Description: Checks an array of arrays for classnames banned by DayZ or non-existent classnames. If any banned/invalid classnames are found, they are removed and reported into the RPT log.
	
	Last updated: 2:33 PM 7/28/2013
*/

private["_unverified","_verified","_errorFound","_weapChk","_vehChk","_magCheck","_stringArray","_startTime"];

waitUntil {!isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.

_startTime = diag_tickTime;

_stringArray = _this;
_unverified = [];
_verified = [];
_errorFound = false;

//Build array of unverified classnames
{
	_unverified set [count _unverified,missionNamespace getVariable _x];
} forEach _stringArray;

diag_log "[DZAI] DZAI is verifying all tables for banned or invalid classnames...";
{
	private["_removeArray"];
	_removeArray = [];	//Will contain all invalid classnames. Is reset for each element of _unverified cleaned.
	{
		_weapChk = format["%1",inheritsFrom (configFile >> "CfgWeapons" >> _x)];
		_vehChk = format["%1",inheritsFrom (configFile >> "CfgVehicles" >> _x)];
		_magCheck = format["%1",inheritsFrom (configFile >> "CfgMagazines" >> _x)];
		if ((_weapChk == "") && (_vehChk == "") && (_magCheck == "")) then {	//Check if classname does not exist
			diag_log format ["WARNING :: Classname %1 is invalid. Removing entry.",_x];
			_removeArray set [(count _removeArray),_x];		//Build array of invalid classnames
			if (!_errorFound) then {_errorFound = true;};
		} else {
			if ((_weapChk == WEAPON_BANNED_STRING) || (_vehChk == VEHICLE_BANNED_STRING) || (_magCheck == MAGAZINE_BANNED_STRING)) then {	//If classname exists, check if it is banned
				diag_log format ["WARNING :: Classname %1 is banned. Removing entry.",_x];
				_removeArray set [(count _removeArray),_x];		//Build array of banned classnames
				if (!_errorFound) then {_errorFound = true;};
			};
		};
	} forEach _x;
	if ((count _removeArray) > 0) then {
		diag_log format ["Removing entries: %1",_removeArray];
		_x = _x - _removeArray;				//Remove invalid classnames
	};
	_verified set [(count _verified),_x];	//Build array of verified classnames
} forEach _unverified;

if (_errorFound) then { //If a classname table requires editing, perform the required edits then report their final states.
	for "_i" from 0 to ((count _unverified) - 1) do {
		if ((count (_unverified select _i)) != (count (_verified select _i))) then {missionNamespace setVariable [_stringArray select _i,_verified select _i];	diag_log format ["Contents of %1: %2.",_stringArray select _i,missionNamespace getVariable (_stringArray select _i)];};
	};
} else {
	diag_log "[DZAI] All tables have been verified. No invalid entries found.";
};
diag_log format ["[DZAI] Table verification completed in %1 seconds.",(diag_tickTime - _startTime)];

DZAI_classnamesVerified = true;
