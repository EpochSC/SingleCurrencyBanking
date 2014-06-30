x=floor(random 3);

if (x == 0) then {
_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;


_crate3 addWeaponCargoGlobal ["M9SD", 5];

_crate3 addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 20];


_crate3 addWeaponCargoGlobal ["M8_sharpshooter", 1];

_crate3 addWeaponCargoGlobal ["DMR", 1];

_crate3 addWeaponCargoGlobal ["M40A3", 1];


_crate3 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

_crate3 addMagazineCargoGlobal ["Skin_Sniper1_DZ", 3];


_crate3 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 5];

_crate3 addMagazineCargoGlobal ["20Rnd_762x51_DMR", 10];

};

if (x == 1) then {
_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;


_crate3 addWeaponCargoGlobal ["MakarovSD", 5];

_crate3 addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 20];


_crate3 addWeaponCargoGlobal ["AK_107_pso", 1];

_crate3 addWeaponCargoGlobal ["SVD_CAMO", 1];

_crate3 addWeaponCargoGlobal ["SVD", 1];


_crate3 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

_crate3 addMagazineCargoGlobal ["Skin_Sniper1_DZ", 3];


_crate3 addMagazineCargoGlobal ["10Rnd_762x54_SVD", 16];

_crate3 addMagazineCargoGlobal ["30Rnd_762x39_AK47", 5];

};

if (x == 2) then {
_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;


_crate3 addWeaponCargoGlobal ["UZI_EP1", 5];

_crate3 addMagazineCargoGlobal ["30Rnd_9x19_UZI", 10];


_crate3 addWeaponCargoGlobal ["M4SPR", 1];

_crate3 addWeaponCargoGlobal ["SCAR_H_LNG_Sniper", 1];

_crate3 addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD", 1];


_crate3 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

_crate3 addMagazineCargoGlobal ["Skin_Sniper1_DZ", 3];


_crate3 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 5];

_crate3 addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 8];

_crate3 addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", 8];

};