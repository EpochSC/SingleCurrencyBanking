/*
	For DayZ Epoch only - Spawns server-side plot poles at all trader locations to prevent DZAI from spawning dynamic AI. (V2dynSpawns version only).
*/

_trader_markers = switch (toLower format ["%1",worldName]) do {
	case "chernarus": {["Tradercitystary","wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Klen","BoatDealerEast","TradercityBash","HeroTrader"]};
	case "takistan": {["tradercitykush","Trader_City_Nur","Trader_City_Garm","Wholesaler","Wholesaler_1","Airplane Dealer","BanditTrader","BlackMarketVendor"]};
	case "isladuala": {["Trader City Camara","st_3","st_4","st_3_1","st_3_1_1","st_3_1_1_1","st_3_2","st_3_2_1","st_3_2_2","st_3_2_3","st_3_2_3_1"]};
	case "tavi": {["ArmedChoppers","HighEndWeaponsAmmo","UnarmedChopperF","BoatVendor1","Wholesaler1","HeroVendor","ArmedVehicles","Doctor2","PlaneVendor","VehiclePartsVendors","GeneralSupplies","GeneralSupplies1","Doctor3","BanditWeaponAmmo","Armed Boats","BanditChoppersRepair","GeneralSupplies3","Wholesaler2","RepairShop"]};
	case "namalsk": {["GerneralPartsSupplies","WholesalerNorth","Doctor","HighEndWeaponsAmmo","HeroVendor","VehicleFriendly","NeutralVendors","WholesalerSouth","LowEndWeaponsAmmo","BoatVendor","Bandit Trader","PlaneVendor"]};
	case "panthera2": {["AirVehiclesF","WholesalerWest","HeroVehicles","NeutralAirVehicles","Boats","NeutralTraders","NeutralTraderCity2","WholesaleSouth","PlanicaTraders","IslandVehiclePartsVendors"]};
	case "sara": {["Tradercitycorazol","wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Ixel","BoatDealerEast","TradercityBag","HeroTrader"]};
	case "FDF_Isle1_a": {["wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Jesco","TradercityBash","HeroTrader"]};
	case "fapovo": {["BanditTrader","AirVehicleUnarmed","TraderCity1","TraderCity2","Wholesaler","BanditVendor","HeroVendor","BoatVendor"]};
	case "Shapur_BAF": {["Safe Zone","test"]};
	case "zargabad": {["HeroCamp","BanditCamp"]};
	case "dingor": {["RaceTrack","RepairGuy","PlaneVendor","Wholesale","HighWeapons/ammo","Parts","Choppers","lowEndCars","LowEndWeapons","HighEndCars","MedicalandBags","Wholesaler","BagsNFood","Wholesalers","DirtTrackVendor","OffRoad4x4","BoatVendor","BoatVendor1","BoatVendor2","BagVendor1","BagVendor2","Doctor2","BanditTrader","HeroTrader"]};
	case "lingor": {["RaceTrack","RepairGuy","PlaneVendor","Wholesale","HighWeapons/ammo","Parts","Choppers","lowEndCars","LowEndWeapons","HighEndCars","MedicalandBags","Wholesaler","BagsNFood","Wholesalers","DirtTrackVendor","OffRoad4x4","BoatVendor","BoatVendor1","BoatVendor2","BagVendor1","BagVendor2","Doctor2","BanditTrader","HeroTrader"]};
	case default {[]};
};

for "_i" from 0 to ((count _trader_markers) - 1) do {
	_polePos = (getMarkerPos (_trader_markers select _i));
	if (((_polePos select 0) != 0) && ((_polePos select 1) != 0)) then {
		_polePos set [2,0];
		_pole = "Plastic_Pole_EP1_DZ" createVehicleLocal _polePos;
		_pole setPosATL _polePos;
		_pole allowDamage false;
		_pole enableSimulation false;
	};
	sleep 0.01;
};
