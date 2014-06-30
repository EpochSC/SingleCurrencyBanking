x=floor(random 2);

if (x == 0) then {
_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;


_crate addMagazineCargoGlobal ["ItemComboLock", 2];

_crate addMagazineCargoGlobal ["MortarBucket", 20];

_crate addMagazineCargoGlobal ["CinderBlocks", 30];

_crate addMagazineCargoGlobal ["ItemTankTrap", 20];

_crate addMagazineCargoGlobal ["ItemWire", 20];

_crate addMagazineCargoGlobal ["PartGeneric", 20];

_crate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

};

if (x == 1) then {
_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

_crate addWeaponCargoGlobal ["ItemToolbox", 5];

_crate addMagazineCargoGlobal ["PartVRotor", 5];

_crate addMagazineCargoGlobal ["PartGlass", 20];

_crate addMagazineCargoGlobal ["PartEngine", 10];

_crate addMagazineCargoGlobal ["PartFueltank", 10];

_crate addMagazineCargoGlobal ["PartWheel", 10];

_crate addMagazineCargoGlobal ["PartGeneric", 10];

_crate addMagazineCargoGlobal ["ItemFuelBarrel", 20];

_crate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

};