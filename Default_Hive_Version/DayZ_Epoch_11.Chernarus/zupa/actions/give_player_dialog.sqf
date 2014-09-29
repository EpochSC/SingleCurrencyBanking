private ["_dialog"];

SC_GiveTarget = _this select 3;
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
waitUntil { !dialog };