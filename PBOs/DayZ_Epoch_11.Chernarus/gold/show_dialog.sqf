private ["_trader_data", "_dialog"];

if (DZE_ActionInProgress) exitWith {
	cutText ["Trading already in progress." , "PLAIN DOWN"];
};

_trader_data = (_this select 3) + [MetalTradeMenuTID];

_dialog = createdialog "SCTraderDialog";
lbClear SCTraderDialogCatList;
lbClear SCTraderDialogItemList;

SCTraderCurrentCatIndex = -1;
SCTraderItemList = [];
SCTraderCatList = [];

{
	private ["_index", "_x"];
	_index = lbAdd [SCTraderDialogCatList, _x select 0];
	SCTraderCatList set [count SCTraderCatList, _x select 1];
} forEach _trader_data;
waitUntil { !dialog };