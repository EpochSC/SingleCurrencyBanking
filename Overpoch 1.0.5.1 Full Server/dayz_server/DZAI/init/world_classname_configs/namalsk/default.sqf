/*
	Namalsk Classname Configuration
	
	Last updated: 10:53 AM 9/14/2013
	
*/

private ["_newItems"];

DZAI_Backpacks1 set [count DZAI_Backpacks1,"BAF_AssaultPack_DZN"];
DZAI_Backpacks2 set [count DZAI_Backpacks2,"BAF_AssaultPack_DZN"];
DZAI_gadgets0 set [1,["NVGoggles",0.005]];	//Reduce probability of functional NVGs
DZAI_tools0 set [9,["ItemGPS",0.005]];		//Reduce probability of functional GPS
DZAI_tools0 = [DZAI_tools0,[["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]]] call DZAI_append;
DZAI_tools1 = [DZAI_tools0,[["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]]] call DZAI_append;
diag_log "Namalsk classnames loaded.";
