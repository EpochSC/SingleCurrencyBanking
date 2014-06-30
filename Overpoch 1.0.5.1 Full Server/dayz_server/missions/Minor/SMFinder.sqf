//By Craig
//Choses the next sidemission
if(!isServer) exitWith {};
private ["_numb","_element","_num","_firstRun"];

if(isNil {ReAccur}) then { ReAccur = ["SM1","SM2","SM3","SM4","SM5","SM6"];};
if(isNil {SMCarray2}) then { SMCarray2 = [];};
if (count SMarray2 == 0) then
{
_element = ReAccur call BIS_fnc_selectRandom;
} else {
_numb = count SMarray2;
_num = floor (random _numb);
_element = SMarray2 select _num;
_Earray = [_element];
};

[] execVM format ["\z\addons\dayz_server\missions\minor\%1.sqf",_element];
