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