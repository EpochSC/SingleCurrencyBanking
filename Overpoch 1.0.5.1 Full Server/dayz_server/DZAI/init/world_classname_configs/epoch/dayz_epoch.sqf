/*
	DayZ Epoch configuration
	
	Description: Adds DayZ Epoch-specific items to DZAI loot tables if Epoch mode is on.
	
	Last updated: 5:10 PM 9/8/2013
	
*/

DZAI_metalBars = [["ItemSilverBar",0.20],["ItemSilverBar10oz",0.10],["ItemGoldBar",0.03],["ItemGoldBar10oz",0.015]];
DZAI_metalBarNum = 2;		//Maximum number of metal bars to generate

DZAI_banditTypes = [DZAI_banditTypes,["CZ_Soldier_DES_EP1","US_Soldier_EP1","BAF_Soldier_MTP","BAF_Soldier_DDPM","BAF_Soldier_L_DDPM","Sniper1_DZ","Camo1_DZ","Rocket_DZ","Soldier1_DZ","BAF_Soldier_Officer_DDPM","BAF_Soldier_Sniper_MTP","Czech Soldier Uniform","BAF_Soldier_Sniper_MTP"]] call DZAI_append;
DZAI_edibles = [DZAI_edibles,["ItemSodaRabbit","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","FoodBioMeat","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodPumpkin","FoodSunFlowerSeed"]] call DZAI_append;
DZAI_MiscItemS = [DZAI_MiscItemS,["ItemZombieParts"]] call DZAI_append;

//Replace hatchet and matchbox items with Epoch versions.
(DZAI_tools0 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools0 select 7) set [0,"ItemMatchbox_DZE"];
(DZAI_tools1 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools1 select 7) set [0,"ItemMatchbox_DZE"];

	DZAI_Pistols0 = ["Makarov","Colt1911","revolver_EP1"]; //Weapongrade 0 pistols
	DZAI_Pistols1 = ["M9","M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; //Weapongrade 1 pistols
	DZAI_Pistols2 = ["M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; //Weapongrade 2 pistols
	DZAI_Pistols3 = ["M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; //Weapongrade 3 pistols
	DZAI_Rifles0 = ["M16A2","M4A1","MP5A5"]; //Weapongrade 0 rifles
	DZAI_Rifles1 = ["M16A2","M16A2GL","M4A1_Aim","M24","DMR_DZ","M4A1","M14_EP1","MP5A5","MP5SD","M4A3_CCO_EP1"]; //Weapongrade 1 rifles
	DZAI_Rifles2 = ["M16A2","M16A2GL","M249_DZ","M4A1_Aim","M24","DMR_DZ","M4A1","M14_EP1","M240_DZ","M4A1_AIM_SD_camo","M16A4_ACG","M4A1_HWS_GL_camo","Mk_48_DZ","M4A3_CCO_EP1"]; //Weapongrade 2 rifles
	DZAI_Rifles3 = ["M16A2GL","M249_DZ","M4A1_Aim","M24","FN_FAL","FN_FAL_ANPVS4","Mk_48_DZ","M249_DZ","BAF_L85A2_RIS_Holo","G36C","G36C_camo","G36A_camo","G36K_camo","M14_EP1","bizon_silenced","DMR_DZ"]; //Weapongrade 3 rifles
	
diag_log "DayZ Epoch loot tables loaded.";
