/*
	Sahrani Classname Configuration
	
	Last updated: 1:14 PM 6/3/2013
	
*/

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case default 
	{
		#include "sahrani\default.sqf"
	};
};
