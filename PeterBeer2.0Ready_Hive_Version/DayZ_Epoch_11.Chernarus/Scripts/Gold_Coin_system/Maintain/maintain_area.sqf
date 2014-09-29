private ["_newWealth","_missing","_missingQty","_proceed","_itemIn","_countIn","_target","_objectClasses","_range","_objects","_requirements","_count","_cost","_option"];

if (DZE_ActionInProgress) exitWith { cutText [(localize "STR_EPOCH_ACTIONS_2") , "PLAIN DOWN"]; };

DZE_ActionInProgress = true;

player removeAction s_player_maintain_area;
s_player_maintain_area = 1;
player removeAction s_player_maintain_area_preview;
s_player_maintain_area_preview = 1;

_target = cursorTarget;
_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange;
_objects = nearestObjects [_target, _objectClasses, _range];
_objects_filtered = [];

{
    if (damage _x >= DZE_DamageBeforeMaint) then {
        _objects_filtered set [count _objects_filtered, _x];
   };
} count _objects;

_objects = _objects_filtered;
_count = count _objects;

if (_count == 0) exitWith {
	cutText [format[(localize "STR_EPOCH_ACTIONS_22"), _count], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
};

_requirements = [];

switch true do {
	case (_count <= 10): {_requirements = [[CurrencyName,100]]};
	case (_count <= 20): {_requirements = [[CurrencyName,300]]};
	case (_count <= 35): {_requirements = [[CurrencyName,400]]};
	case (_count <= 50): {_requirements = [[CurrencyName,500]]};
	case (_count <= 75): {_requirements = [[CurrencyName,900]]};
	case (_count <= 100): {_requirements = [[CurrencyName,1000]]};
	case (_count <= 175): {_requirements = [[CurrencyName,2000]]};
	case (_count <= 250): {_requirements = [[CurrencyName,3000]]};
	case (_count <= 325): {_requirements = [[CurrencyName,4000]]};
	case (_count <= 400): {_requirements = [[CurrencyName,5000]]};
	case (_count <= 475): {_requirements = [[CurrencyName,6000]]};
	case (_count <= 550): {_requirements = [[CurrencyName,7000]]};
	case (_count <= 625): {_requirements = [[CurrencyName,8000]]};
	case (_count > 625):  {_requirements = [[CurrencyName,9000]]};
};

_option = _this select 3;

switch _option do {

	case "maintain": {

		_wealth = player getVariable["cashMoney",0];
		_missing = "";
		_missingQty = 0;
		_proceed = true;

		{
			_itemIn = _x select 0;
			_countIn = _x select 1;
			if (_wealth < _countIn) exitWith { _missing = _itemIn; _missingQty = (_countIn - _wealth); _proceed = false; };
		} count _requirements;

		if (_proceed) then {

			_newWealth = (_wealth - _countIn);

			player playActionNow "Medic";
			[player,_range,true,(getPosATL player)] spawn player_alertZombies;

			player setVariable["cashMoney",_newWealth,true];

			PVDZE_plr_Save = [player,(magazines player),true,true];
			publicVariableServer "PVDZE_plr_Save";

			PVDZE_maintainArea = [player,1,_target];
			publicVariableServer "PVDZE_maintainArea";

			cutText [format[(localize "STR_EPOCH_ACTIONS_4"), _count], "PLAIN DOWN", 5];	

		} else {

			cutText [format[(localize "STR_EPOCH_ACTIONS_6"), _missingQty, CurrencyName], "PLAIN DOWN"];

		};
	};
	
	case "preview": {

		_cost = "";

		{
			_itemIn = _x select 0;
			_countIn = _x select 1;
			if (_cost != "") then {
				_cost = _cost + " and ";
			};
			_cost = _cost + (str(_countIn) + " " + CurrencyName);
		} count _requirements;

		cutText [format[(localize "STR_EPOCH_ACTIONS_7"), _count, _cost], "PLAIN DOWN"];

	};
};

DZE_ActionInProgress = false;
s_player_maintain_area = -1;
s_player_maintain_area_preview = -1;