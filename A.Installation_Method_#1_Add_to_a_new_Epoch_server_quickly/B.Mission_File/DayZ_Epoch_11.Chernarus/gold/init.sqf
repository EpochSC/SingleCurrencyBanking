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
	ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['headShots', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['bank', 0] call BIS_fnc_numberText), CurrencyName]];
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['headShots', 0] call BIS_fnc_numberText), CurrencyName]];
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
	player setVariable ["moneychanged",1,true];	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
};

BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["bank", 0];
	_wealth = player getVariable["headShots",0];
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not deposit more than you have.", "PLAIN DOWN"];
	};

	if(   LimitOnBank  && ((_bank + _amount ) >  MaxBankMoney)) then{
	
	if(   (getPlayerUID player in DonatorListZupa )  && ((_bank + _amount ) <  MaxDonatorBankMoney)) then{ 
	
					player setVariable["headShots",(_wealth - _amount),true];
					player setVariable["bank",(_bank + _amount),true];
					player setVariable ["bankchanged",1,true];
					player setVariable ["moneychanged",1,true];	
					PVDZE_plr_Save = [player,(magazines player),true,true] ;
					publicVariableServer "PVDZE_plr_Save";				
					cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];			
	}else{
	cutText [format["You can only have a max of %1 %3, donators %2", [MaxBankMoney] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
	};
	}else{	
	player setVariable["headShots",(_wealth - _amount),true];
	player setVariable["bank",(_bank + _amount),true];
	player setVariable ["bankchanged",1,true];
	player setVariable ["moneychanged",1,true];	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";	
	cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
	};
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
	
	player setVariable ["moneychanged",1,true];	

	cutText [format["You gave %1 %2.", _amount, CurrencyName], "PLAIN DOWN"];
};