/*
	Celle Classname Configuration
	
	Last updated: 11:26 AM 9/14/2013
	
*/

private ["_newItems"];

//Removed bandit skins: ["HazmatVest_Black_DZC","HazmatVest_Yellow_DZC","HazmatVest_Olive_DZC","Hazmat_Black_DZC","Hazmat_Red_DZC","Hazmat_Yellow_DZC","Hazmat_Olive_DZC","Skin_HazmatVest_Red_DZC"];
//Removed skin loot: "Skin_Hazmat_Black_DZC","Skin_Hazmat_Red_DZC","Skin_Hazmat_Yellow_DZC","Skin_Hazmat_Olive_DZC","Skin_HazmatVest_Yellow_DZC","Skin_HazmatVest_Olive_DZC"

//Remove classnames
DZAI_BanditTypes = DZAI_BanditTypes - ["Camo1_DZ","Sniper1_DZ","Bandit1_DZ"];
DZAI_Backpacks0 = DZAI_Backpacks0 - ["DZ_Czech_Vest_Puch"];
DZAI_Backpacks1 = DZAI_Backpacks1 - ["DZ_Czech_Vest_Puch"];

//Add classnames
_newItems = ["Sniper1_DZC","Sniper2_DZC","Sniper3_DZC","Clan_Officer1_DZC","Clan_Officer2_DZC","Clan_Officer3_DZC","Clan_Delta1","Clan_Delta2","Clan_Delta3_DZC","Clan_UN_Helmet_DZC","Clan_UN_Cap_DZC","Clan_GER_DZC","Clan_GER_Hvy_DZC","Clan_Terror_DZC","Clan_Terror2_DZC","Clan_nobackpack_INS1_DZC","Clan_nobackpack_INS2_DZC","Clan_nobackpack_INS3_DZC","Clan_nobackpack_suit_DZC","Snow_Trooper1_DZC","Snow_Trooper2_DZC","Soldier1_DZC","Soldier2_DZC","Soldier3_DZC","Soldier1_SF_DZC","Soldier2_SF_DZC","Soldier3_SF_DZC","BAF_Officer1_DZC","BAF_Officer2_DZC","BAF_Officer3_DZC","CZ_Officer1_DZC","CZ_Officer2_DZC","CZ_Officer3_DZC","GER_Officer1_DZC","CZ_Heavy1_DZC","CZ_Heavy2_DZC","CZ_Heavy3_DZC","BAF_Heavy1_DZC","BAF_Heavy2_DZC","BAF_Heavy3_DZC","US_Heavy1_DZC","US_Heavy2_DZC","CIV_Pilot1_DZC","US_Pilot1_DZC","CZ_Pilot1_DZC","CZ_Pilot2_DZC","CZ_Pilot3_DZC","BAF_Pilot1_DZC","BAF_Pilot2_DZC","BAF_Pilot3_DZC","Doctor_DZC","Civ_Soldier_DZC","Cameraman_DZC","EuroMan01_DZC","EuroMan02_DZC","Storm_Trooper1_DZC","Storm_Trooper2_DZC","Storm_Trooper3_DZC","Storm_Trooper4_DZC","PrivateSec1_DZC","PrivateSec2_DZC","PrivateSec3_DZC","Asano_DZC","Camo1_DZC","Camo2_DZC","Camo3_DZC","Soldier1_STD_DZC","Soldier2_STD_DZC","Soldier3_STD_DZC","Soldier1_GL_DZC","Soldier2_GL_DZC","Soldier3_GL_DZC","Soldier1_AT_DZC","Soldier2_AT_DZC","Soldier3_AT_DZC","Soldier1_SL_DZC","Soldier2_SL_DZC","Soldier3_SL_DZC"];
for "_i" from 0 to ((count _newItems) - 1) do {DZAI_BanditTypes set [(count DZAI_BanditTypes),(_newItems select _i)];};

_newItems = ["FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","ItemSodaRabbit"];
for "_i" from 0 to ((count _newItems) - 1) do {DZAI_Edibles set [(count DZAI_Edibles),(_newItems select _i)];};

diag_log "Celle classnames loaded.";
