BankDialogTransferAmount = 13000;
BankDialogPlayerBalance = 13001;
BankDialogBankBalance = 13002;
SCTraderDialogCatList = 32000;
SCTraderDialogItemList = 32001;
SCTraderDialogBuyPrice = 32002;
SCTraderDialogSellPrice = 32003;
GivePlayerDialogTransferAmount = 14000;
GivePlayerDialogPlayerBalance = 14001;

BankDialogUpdateAmounts = {
	ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['bankMoney', 0] call BIS_fnc_numberText), CurrencyName]];
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [14003, format["%1", (name cursorTarget)]];
};

BankDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);	
	_bank = player getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];

	if (_amount < 1 or _amount > _bank) exitWith {
		cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"];
	};

	player setVariable["cashMoney",(_wealth + _amount),true];
	player setVariable["bankMoney",(_bank - _amount),true];

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";

	cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
};

BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];
	
	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];
	
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not deposit more than you have.", "PLAIN DOWN"];
	};

	PVDZE_account_Doublecheck = [player];
	publicVariableServer "PVDZE_account_Doublecheck";

	if( LimitOnBank && ((_bank + _amount ) >  MaxBankMoney)) then{
		if((getPlayerUID player in DonatorBank)  && ((_bank + _amount ) <  MaxDonatorBankMoney)) then{ 
			player setVariable["cashMoney",(_wealth - _amount),true];
			player setVariable["bankMoney",(_bank + _amount),true];		
			cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];			
		}else{
			cutText [format["You can only have a max of %1 %3, donators %2", [MaxBankMoney] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
		};
	}else{	
		player setVariable["cashMoney",(_wealth - _amount),true];
		player setVariable["bankMoney",(_bank + _amount),true];
		cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
	};
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";
};

GivePlayerAmount = {
	private ["_amount","_target","_wealth"];
	
	_amount = parseNumber (_this select 0);
	_target = cursorTarget;
	_wealth = player getVariable["cashMoney",0];
	_twealth = _target getVariable["cashMoney",0];
	_isMan = _target in playableUnits;

	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
    };

	if (!_isMan) exitWith {
		cutText ["You can only give money to a player", "PLAIN DOWN"];
	};

	player setVariable["cashMoney",_wealth - _amount, true];

	_target setVariable["cashMoney",_twealth + _amount, true];

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_plr_Save = [_target,(magazines _target),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	cutText [format["You gave %1 %2.", _amount, CurrencyName], "PLAIN DOWN"];
};