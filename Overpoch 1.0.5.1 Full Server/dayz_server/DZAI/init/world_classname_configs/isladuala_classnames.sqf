/*
	Isla Duala Classname Configuration
	
	Last updated: 11:16 AM 9/14/2013
	
*/

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case default 
	{
		#include "isladuala\default.sqf"
	};
};