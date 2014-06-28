private ["_dialog"];
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
waitUntil { !dialog };