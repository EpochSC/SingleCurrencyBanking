/*
  @file Version: 1D
	@file name: core\misc\fnc_hTime.sqf
	@file Author: TAW_Tonic
	@file edit: 9/13/2012
	@file description: Returns a mid-high integer
*/

private["_time","_val","_return","_rand","_bool","_tar"];
_tar = _this select 0;
_val = _this select 1;

_rand  = round(random _tar);
_bool = true;

while {_bool} do
{
	if(_rand < _val) then {_rand  = round(random _tar);} else {_bool = false;};
};

_return = _rand;
_return;

