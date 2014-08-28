_testDebug = player getVariable["AsReMixhud", false];
systemChat format["<Zupa Says>:Debug Control"];
if (_testDebug) then {
player setVariable["AsReMixhud", false,true];
systemChat format["<Zupa Says>:Custom Player HUD is Off..."];
}
else
{
player setVariable["AsReMixhud", true,true];
systemChat format["<Zupa Says>:Custom Player HUD is On..."];
};