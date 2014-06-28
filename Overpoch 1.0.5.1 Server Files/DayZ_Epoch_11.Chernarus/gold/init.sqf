BankDialogTransferAmount 		= 13000;
BankDialogPlayerBalance 		= 13001;
BankDialogBankBalance 			= 13002;

SCTraderDialogCatList 			= 32000;
SCTraderDialogItemList 			= 32001;
SCTraderDialogBuyPrice 			= 32002;
SCTraderDialogSellPrice 		= 32003;

GivePlayerDialogTransferAmount 	= 14000;
GivePlayerDialogPlayerBalance 	= 14001;

BankDialogUpdateAmounts = {
	ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['headShots', 0]), "Coins"]];
	ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['bank', 0]), "Coins"]];
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['headShots', 0]), "Coins"]];
	ctrlSetText [14003, format["%1", (name cursorTarget)]];
};

BankDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = parseNumber (_this select 0);	
	_bank = player getVariable ["bank", 0];
	_wealth = player getVariable["headShots",0];
	
	if (_amount < 1 or _amount > _bank) exitWith {
		cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"];
	};
	player setVariable["headShots",(_wealth + _amount),true];
	player setVariable["bank",(_bank - _amount),true];
	player setVariable ["bankchanged",1,true];
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	cutText [format["You have withdrawn %1 %2.", _amount, "Coins"], "PLAIN DOWN"];
};

BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["bank", 0];
	_wealth = player getVariable["headShots",0];
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not deposit more than you have.", "PLAIN DOWN"];
	};
	
	player setVariable["headShots",(_wealth - _amount),true];
	player setVariable["bank",(_bank + _amount),true];
	player setVariable ["bankchanged",1,true];
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	
	cutText [format["You have deposited %1 %2.", _amount, "Coins"], "PLAIN DOWN"];
};
/*	
SCTraderDialogLoadItemList = {
	private ["_index", "_trader_id", "_activatingPlayer"];
	SCTraderItemList = [];
	_index = _this select 0;

	if (_index < 0 or SCTraderCurrentCatIndex == _index) exitWith {};
	SCTraderCurrentCatIndex = _index;

	_trader_id = SCTraderCatList select _index;
	_activatingPlayer = player;

	lbClear SCTraderDialogItemList;
	ctrlSetText [SCTraderDialogBuyPrice, ""];
	ctrlSetText [SCTraderDialogSellPrice, ""];

	lbAdd [SCTraderDialogItemList, "Loading items..."];

	PVDZE_plr_TradeMenuResult = call compile format["ServerTcache_%1;",_trader_id];

	lbClear SCTraderDialogItemList;
	_item_list = [];
	{
		private ["_header", "_item", "_name", "_type", "_textPart", "_qty", "_buy", "_bqty", "_bname", "_btype", "_btextCurrency", "_sell", "_sqty", "_sname", "_stype", "_stextCurrency", "_order", "_order", "_afile", "_File", "_count", "_bag", "_bagclass", "_index", "_image"];
		_header = _x select 0; // "TRD"
		_item = _x select 1;
		_name = _item select 0;
		_type = _item select 1;
		switch (true) do { 
			case (_type == 1): { 
				_type = "CfgMagazines";
			}; 
			case (_type == 2): { 
				_type = "CfgVehicles";
			}; 
			case (_type == 3): { 
				_type = "CfgWeapons";
			}; 
		}; 
		// Display Name of item
		_textPart =	getText(configFile >> _type >> _name >> "displayName");

		// Total in stock
		_qty = _x select 2;

		// Buy Price
		_buy = _x select 3;	

		// Sell Price
		_sell = _x select 4;

		// Menu sort order
		_order = _x select 5;

		// Action file to use for trade
		_afile = _x select 7;
		
		_count = 0;
		if(_type == "CfgVehicles") then {
			if (_afile == "trade_backpacks") then {
				_bag = unitBackpack player;
				_bagclass = typeOf _bag;
				if(_name == _bagclass) then {
					_count = 1;
				};
			} else {
				_count = {(typeOf _x) == _name} count (nearestObjects [player, [_name], 20]);
			}
		};

		if(_type == "CfgMagazines") then {
			_count = {_x == _name} count magazines player;
		};

		if(_type == "CfgWeapons") then {
			_count = {_x == _name} count weapons player;
		};

		_index = lbAdd [SCTraderDialogItemList, format["%1 (%2)", _textPart, _name]];

		if (_count > 0) then {
			lbSetColor [SCTraderDialogItemList, _index, [0, 1, 0, 1]];
		};

		_image = getText(configFile >> _type >> _name >> "picture");
		lbSetPicture [SCTraderDialogItemList, _index, _image];

		_item_list set [count _item_list, [
			_name,
			_textPart,
			_buy,
			_sell,
			_header,
			_afile,
			_type
		]];
	} forEach PVDZE_plr_TradeMenuResult;
	SCTraderItemList = _item_list;
};

SCTraderDialogShowPrices = {
	private ["_index", "_item", "_descriptionShort", "_image"];
	_index = _this select 0;
	if (_index < 0) exitWith {};
	while {count SCTraderItemList < 1} do { sleep 1; };
	_item = SCTraderItemList select _index;
	_descriptionShort =	getText(configFile >> (_item select 6) >> (_item select 0) >> "descriptionShort");
	_image = getText(configFile >> (_item select 6) >> (_item select 0) >> "picture");
	ctrlSetText [SCTraderDialogBuyPrice, format["%1 %2", _item select 2, EpochCurrency]];
	ctrlSetText [SCTraderDialogSellPrice, format["%1 %2", _item select 3, EpochCurrency]];
};

SCTraderDialogBuy = {
	private ["_index", "_item", "_data", "_file"];
	_index = _this select 0;
	if (_index < 0) exitWith {
		cutText ["Trading canceled." , "PLAIN DOWN"];
	};
	_item = SCTraderItemList select _index;
	_data = [_item select 0, _item select 1, _item select 2, _item select 4];
	_file = format["money\dayz_code\actions\%1_buy.sqf", (_item select 5)];
	_data execVM _file;
	SCTraderItemList = [];
};

SCTraderDialogSell = {
	private ["_index", "_item", "_data", "_file"];
	_index = _this select 0;
	if (_index < 0) exitWith {
		cutText ["Trading canceled." , "PLAIN DOWN"];
	};
	_item = SCTraderItemList select _index;
	_data = [_item select 0, _item select 1, _item select 3, _item select 4];
	_file = format["money\dayz_code\actions\%1_sell.sqf", (_item select 5)];
	_data execVM _file;
	SCTraderItemList = [];
};
*/
GivePlayerAmount = {
	private ["_amount","_target","_wealth"];
	_amount = parseNumber (_this select 0);
	_target = cursorTarget;
	_wealth = player getVariable["headShots",0];
	_twealth = _target getVariable["headShots",0];
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
	};
	
	player setVariable["headShots",_wealth - _amount, true];
	_target setVariable["headShots",_twealth + _amount, true];
	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_plr_Save = [_target,(magazines _target),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	cutText [format["You gave %1 %2.", _amount, "Coins"], "PLAIN DOWN"];
};