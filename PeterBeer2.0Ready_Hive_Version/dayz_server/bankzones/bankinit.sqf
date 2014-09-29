execVM "\z\addons\dayz_server\bankzones\banks.sqf";

"PVDZE_bank_Save" addPublicVariableEventHandler {

	_playerObj = ((_this select 1) select 0);
	_playerID = getPlayerUID _playerObj;
	_bankMoney = _playerObj getVariable ["bankMoney",0];

	if(_playerID != "") then {
		_key = format["CHILD:299:%1:%2:",_playerID,_bankMoney];
		_key call server_hiveReadWrite;
	};
};

"PVDZE_account_Doublecheck" addPublicVariableEventHandler {

	_playerObj = ((_this select 1) select 0);
	_playerID = getPlayerUID _playerObj;
	_playerName = name _playerObj;
	_doLoop = 0;

	while {_doLoop < 3} do {
		_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
		_primary = _key call server_hiveReadWrite;
		if (count _primary > 0) then {
			if ((_primary select 0) != "ERROR") then {
				_doLoop = 9;
			};
		};
		_doLoop = _doLoop + 1;
	};
};