if(InstantTrading) then {

private ["_qty","_buy_o_sell","_playerCash","_needed","_started","_finished","_animState","_isMedic","_abort","_removed","_tradeCounter","_traderID","_total_trades","_activatingPlayer","_finish_trade","_name","_textPart","_price","_emptySlots","_free_magazine_slots"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"] };

DZE_ActionInProgress = true;

_buy_o_sell = (_this select 3) select 4;
_activatingPlayer = player;

if(_buy_o_sell == "buy") then {
	_finish_trade = {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
		DZE_ActionInProgress = false;
		dayzTradeResult = nil;
	};

	_name = (_this select 3) select 0;
	_textPart = (_this select 3) select 6;
	_price = (_this select 3) select 3;
	_traderID = (_this select 3) select 7;
	_emptySlots = [player] call BIS_fnc_invSlotsEmpty;
	_free_magazine_slots = _emptySlots select 4;
	_tradeCounter = 0;

	if(_free_magazine_slots < 1) exitWith {
		cutText [(localize "STR_DAYZ_CODE_2"), "PLAIN DOWN"];
		DZE_ActionInProgress = false;
	};

	_playerCash = player getVariable ["cashMoney",0];
	_total_trades = floor(_playerCash / _price);

	if (_total_trades < 1) exitWith {
		_needed =  _price - _playerCash;
		cutText [format[(localize "str_epoch_player_184"),_needed,CurrencyName] , "PLAIN DOWN"];
		call _finish_trade;
	};

	if (_total_trades > _free_magazine_slots) then {
		_total_trades = _free_magazine_slots;
	};

	_abort = false;

	for "_x" from 1 to _total_trades do {
		_tradeCounter = _tradeCounter + 1;

		if(_total_trades == 1) then { 
			cutText [(localize "STR_EPOCH_PLAYER_105"), "PLAIN DOWN"]; // Starting trade, stand still to complete trade.
		} else {
			cutText [format[(localize "STR_EPOCH_PLAYER_187"),_tradeCounter,_total_trades], "PLAIN DOWN"]; // Starting trade, stand still to complete trade %1 of %2.
		};

	private["_newPosition","_finished","_oldPosition"];
    if(isNil "_oldPosition") then { _oldPosition = position player;};
    _finished = false;
    sleep 2;
    if (player distance _oldPosition <= 1) then {
        _finished = true;
    };
    if (!_finished) exitWith {
        DZE_ActionInProgress = false;
        r_autoTrade = false;
        cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
    };

		if (_finished) then {
			if (_playerCash >= _price) then {
				_playerCash = player getVariable ["cashMoney",0];
				player setVariable["cashMoney",(_playerCash - _price),true];
				player addMagazine _name;
				_abort = false;
				cutText [format["Traded %1 %2 for %3",_price,CurrencyName,_textPart], "PLAIN DOWN"];
				PVDZE_plr_Save = [player,(magazines player),true,true] ;
				publicVariableServer "PVDZE_plr_Save";
				
				if (isNil "_name") then { _name = "Unknown Item"; };
				if (isNil "inTraderCity") then {
					inTraderCity = "Unknown Trader"; 
				} else {
					if (inTraderCity == "Any") then {
						inTraderCity = "Unknown Trader"; 
					};
				};
				
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,0,_name,inTraderCity,CurrencyName,_price];
				publicVariableServer "PVDZE_obj_Trade";
			} else {
				_needed =  _price - _playerCash;
				cutText [format[(localize "str_epoch_player_184"),_needed,CurrencyName] , "PLAIN DOWN"];
				_abort = true;
			};
		};
		sleep 1;

		if(_abort) exitWith {};
	};
	DZE_ActionInProgress = false;

} else {
	_finish_trade = {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
		DZE_ActionInProgress = false;
		dayzTradeResult = nil;
	};

	_name = (_this select 3) select 1;
	_textPart = (_this select 3) select 5;
	_price = (_this select 3) select 2;
	_traderID = (_this select 3) select 7;
	_qty = {_x == _name} count magazines player;
	_removed = 0;
	_tradeCounter = 0;
	_total_trades = _qty;

	if (_total_trades < 1) exitWith {
		cutText [format["You do not have a %1", _textPart], "PLAIN DOWN"];
		call _finish_trade;
	};

	_abort = false;

	for "_x" from 1 to _total_trades do {

		_tradeCounter = _tradeCounter + 1;

		if(_total_trades == 1) then { 
			cutText [(localize "STR_EPOCH_PLAYER_105"), "PLAIN DOWN"];
		} else {
			cutText [format[(localize "STR_EPOCH_PLAYER_187"),_tradeCounter,_total_trades], "PLAIN DOWN"];
		};

		player playActionNow "Medic";

		r_interrupt = false;
		_animState = animationState player;
		r_doLoop = true;
		_started = false;
		_finished = false;

		while {r_doLoop} do {
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if (_isMedic) then {
				_started = true;
			};
			if (_started and !_isMedic) then {
				r_doLoop = false;
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false;
			};
			sleep 0.1;
		};

		r_doLoop = false;

		if (!_finished) exitWith { 
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};
			cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
		};

		if (_finished) then {
		
			_removed = ([player,_name,1] call BIS_fnc_invRemove);
			if (_removed > 0) then {
				_playerCash = player getVariable ["cashMoney",0];	
				player setVariable["cashMoney",(_playerCash + _price),true];
				cutText [format[("Traded %1 for %2 %3"),_textPart,_price,CurrencyName], "PLAIN DOWN"];
				PVDZE_plr_Save = [player,(magazines player),true,true] ;
				publicVariableServer "PVDZE_plr_Save";

				if (isNil "_name") then { _name = "Unknown Item"; };
				if (isNil "inTraderCity") then {
					inTraderCity = "Unknown Trader City"; 
				} else {
					if (inTraderCity == "Any") then {
						inTraderCity = "Unknown Trader"; 
					};
				};
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,1,_name,inTraderCity,CurrencyName,_price];
				publicVariableServer "PVDZE_obj_Trade";
			} else {
				cutText [format["Something went wrong. Could not remove %1 from inventory", _name], "PLAIN DOWN"];
				_abort = true;
			};
		};
		sleep 1;
		if(_abort) exitWith {};
	};
	DZE_ActionInProgress = false;
};

DZE_ActionInProgress = false;

} else {

private ["_qty","_buy_o_sell","_playerCash","_needed","_started","_finished","_animState","_isMedic","_abort","_removed","_tradeCounter","_traderID","_total_trades","_activatingPlayer","_finish_trade","_name","_textPart","_price","_emptySlots","_free_magazine_slots"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"] };

DZE_ActionInProgress = true;

_buy_o_sell = (_this select 3) select 4;
_activatingPlayer = player;

if(_buy_o_sell == "buy") then {
	_finish_trade = {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
		DZE_ActionInProgress = false;
		dayzTradeResult = nil;
	};

	_name = (_this select 3) select 0;
	_textPart = (_this select 3) select 6;
	_price = (_this select 3) select 3;
	_traderID = (_this select 3) select 7;
	_emptySlots = [player] call BIS_fnc_invSlotsEmpty;
	_free_magazine_slots = _emptySlots select 4;
	_tradeCounter = 0;

	if(_free_magazine_slots < 1) exitWith {
		cutText [(localize "STR_DAYZ_CODE_2"), "PLAIN DOWN"];
		DZE_ActionInProgress = false;
	};

	_playerCash = player getVariable ["cashMoney",0];
	_total_trades = floor(_playerCash / _price);

	if (_total_trades < 1) exitWith {
		_needed =  _price - _playerCash;
		cutText [format[(localize "str_epoch_player_184"),_needed,CurrencyName] , "PLAIN DOWN"];
		call _finish_trade;
	};

	if (_total_trades > _free_magazine_slots) then {
		_total_trades = _free_magazine_slots;
	};

	_abort = false;

	for "_x" from 1 to _total_trades do {
		_tradeCounter = _tradeCounter + 1;

		if(_total_trades == 1) then { 
			cutText [(localize "STR_EPOCH_PLAYER_105"), "PLAIN DOWN"]; // Starting trade, stand still to complete trade.
		} else {
			cutText [format[(localize "STR_EPOCH_PLAYER_187"),_tradeCounter,_total_trades], "PLAIN DOWN"]; // Starting trade, stand still to complete trade %1 of %2.
		};

		player playActionNow "Medic";

		r_interrupt = false;
		_animState = animationState player;
		r_doLoop = true;
		_started = false;
		_finished = false;

		while {r_doLoop} do {
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if (_isMedic) then {
				_started = true;
			};
			if (_started and !_isMedic) then {
				r_doLoop = false;
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false;
			};
			sleep 0.1;
		};

		r_doLoop = false;

		if (!_finished) exitWith {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};
			cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
		};

		if (_finished) then {
			if (_playerCash >= _price) then {
				_playerCash = player getVariable ["cashMoney",0];
				player setVariable["cashMoney",(_playerCash - _price),true];
				player addMagazine _name;
				_abort = false;
				cutText [format["Traded %1 %2 for %3",_price,CurrencyName,_textPart], "PLAIN DOWN"];
				PVDZE_plr_Save = [player,(magazines player),true,true] ;
				publicVariableServer "PVDZE_plr_Save";
				
				if (isNil "_name") then { _name = "Unknown Item"; };
				if (isNil "inTraderCity") then {
					inTraderCity = "Unknown Trader"; 
				} else {
					if (inTraderCity == "Any") then {
						inTraderCity = "Unknown Trader"; 
					};
				};
				
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,0,_name,inTraderCity,CurrencyName,_price];
				publicVariableServer "PVDZE_obj_Trade";
			} else {
				_needed =  _price - _playerCash;
				cutText [format[(localize "str_epoch_player_184"),_needed,CurrencyName] , "PLAIN DOWN"];
				_abort = true;
			};
		};
		sleep 1;

		if(_abort) exitWith {};
	};
	DZE_ActionInProgress = false;

} else {
	_finish_trade = {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
		DZE_ActionInProgress = false;
		dayzTradeResult = nil;
	};

	_name = (_this select 3) select 1;
	_textPart = (_this select 3) select 5;
	_price = (_this select 3) select 2;
	_traderID = (_this select 3) select 7;
	_qty = {_x == _name} count magazines player;
	_removed = 0;
	_tradeCounter = 0;
	_total_trades = _qty;

	if (_total_trades < 1) exitWith {
		cutText [format["You do not have a %1", _textPart], "PLAIN DOWN"];
		call _finish_trade;
	};

	_abort = false;

	for "_x" from 1 to _total_trades do {

		_tradeCounter = _tradeCounter + 1;

		if(_total_trades == 1) then { 
			cutText [(localize "STR_EPOCH_PLAYER_105"), "PLAIN DOWN"];
		} else {
			cutText [format[(localize "STR_EPOCH_PLAYER_187"),_tradeCounter,_total_trades], "PLAIN DOWN"];
		};

		player playActionNow "Medic";

		r_interrupt = false;
		_animState = animationState player;
		r_doLoop = true;
		_started = false;
		_finished = false;

		while {r_doLoop} do {
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if (_isMedic) then {
				_started = true;
			};
			if (_started and !_isMedic) then {
				r_doLoop = false;
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false;
			};
			sleep 0.1;
		};

		r_doLoop = false;

		if (!_finished) exitWith { 
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};
			cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
		};

		if (_finished) then {
		
			_removed = ([player,_name,1] call BIS_fnc_invRemove);
			if (_removed > 0) then {
				_playerCash = player getVariable ["cashMoney",0];	
				player setVariable["cashMoney",(_playerCash + _price),true];
				cutText [format[("Traded %1 for %2 %3"),_textPart,_price,CurrencyName], "PLAIN DOWN"];
				PVDZE_plr_Save = [player,(magazines player),true,true] ;
				publicVariableServer "PVDZE_plr_Save";

				if (isNil "_name") then { _name = "Unknown Item"; };
				if (isNil "inTraderCity") then {
					inTraderCity = "Unknown Trader City"; 
				} else {
					if (inTraderCity == "Any") then {
						inTraderCity = "Unknown Trader"; 
					};
				};
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,1,_name,inTraderCity,CurrencyName,_price];
				publicVariableServer "PVDZE_obj_Trade";
			} else {
				cutText [format["Something went wrong. Could not remove %1 from inventory", _name], "PLAIN DOWN"];
				_abort = true;
			};
		};
		sleep 1;
		if(_abort) exitWith {};
	};
	DZE_ActionInProgress = false;
};

DZE_ActionInProgress = false;

};