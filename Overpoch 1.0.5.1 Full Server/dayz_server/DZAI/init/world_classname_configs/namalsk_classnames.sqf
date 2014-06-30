/*
	Namalsk Classname Configuration
	
	Last updated: 1:14 PM 6/3/2013
	
*/

private ["_modname","_newItems"];
_modname = toLower format ["%1",DZAI_modName];

//Setting common between Namalsk and Namalsk 2017
DZAI_invmedicals = 1; 	//Number of selections of medical items (Inventory)
DZAI_invedibles = 1;	//Number of selections of edible items (Inventory)
DZAI_bpmedicals = 1; 	//Number of selections of medical items (Backpack)
DZAI_bpedibles = 0;		//Number of selections of edible items (Backpack)

DZAI_BanditTypes = DZAI_BanditTypes + ["CamoWinterW_DZN", "CamoWinter_DZN", "Sniper1W_DZN"];
if (DZAI_tempNVGs) then {DZAI_tempNVGs = false};	//Disable temporary NVG chance for DayZ Namalsk.

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case "2017":
	{
		#include "namalsk\namalsk2017.sqf"
	};
	case default 
	{
		#include "namalsk\default.sqf"
	};
};
