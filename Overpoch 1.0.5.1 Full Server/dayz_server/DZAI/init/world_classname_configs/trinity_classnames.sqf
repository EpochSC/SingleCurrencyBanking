/*
	Trinity Island Classname Configuration
	
	Last updated: 7:45 PM 8/28/2013
	
*/

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case default 
	{
		#include "trinity\default.sqf"
	};
};
