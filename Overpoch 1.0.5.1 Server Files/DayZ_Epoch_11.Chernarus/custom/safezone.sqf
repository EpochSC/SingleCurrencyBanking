if (isServer) exitWith {
	"PVOZ_EPOCH_SAFEZONE" addPublicVariableEventHandler {
		_msg = _this select 1;
		_msg = str(_msg);
		if (isServer) then {
			[nil, nil, rspawn, [_msg], {systemChat (_this select 0);}] call RE;
		};
	};
};
[] spawn {
	waitUntil {(!isNil "zupa_ANTIRUN")};
	if (isNil "inSafezone") then {inSafezone = false;};
	while {true} do {
		waitUntil {sleep 1;(inSafeZone)};
		zupa_szCHK = false;
		canbuild = false;
		SZ_SkTyp = typeOf player;
		_txt = "You have entered a safezone! Running people over, stealing, or griefing within safezones shall result in a ban! YOU HAVE BEEN WARNED!";
		systemChat ("SAFE-ZONE: "+str _txt+"");
		cutText [_txt,"PLAIN DOWN"];
		["Safe Zone"] spawn bis_fnc_infotext;
		[] spawn zupa_ANTIRUN;
		[] spawn zupa_ZSHIELD;
		[] spawn zupa_ANTITHEFT;
		[] spawn zupa_PP;
		waitUntil {sleep 1;((!inSafeZone)||(typeOf player != SZ_SkTyp))};
		if (inSafeZone) then {
			if (typeOf player != SZ_SkTyp) then {
				[] spawn {
					inSafeZone = false;
					_txt = "Skin change detected! Toggling safezone protection...";
					systemChat ("SAFE-ZONE: "+str _txt+"");
					waitUntil {zupa_szCHK};
					inSafeZone = true;
				};
			};
		};
		waitUntil {sleep 1;(!inSafeZone)};
		canbuild = true;
		zupa_szCHK = true;
		systemChat ("SAFE-ZONE: You have left a safezone!");
		systemChat ("SAFE-ZONE: Safe-zone hit/kill protection will stay on for 5-10 seconds to prevent safezone snipers... TAKE COVER!");
		sleep (5 + floor(random 5));
		[] spawn zupa_DPP;
		if (inSafeZone) then {_txt = "It appears you have re-entered a safezone. Reenabling protection...";} else {_txt = "Safe-zone hit/kill protection has been disabled!";};
		systemChat ("SAFE-ZONE: "+str _txt+"");
	};
};
zupa_DPP = {
	player removeEventHandler ["Fired", 	SafeZone_FIRED];
	player removeEventHandler ["Hit", 		SafeZone_HIT];
	player removeEventHandler ["Killed", 	SafeZone_KILLED];
	fnc_usec_unconscious 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player_death 			= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_death.sqf";
	player_zombieCheck 		= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
};
zupa_PP = {
	_txt = "Infantry protection loaded.";
	systemChat ("SAFE-ZONE: "+str _txt+"");
	SafeZone_FIRED  = player addEventHandler ["Fired",	{call zupa_pfired}];
	SafeZone_HIT    = player addEventHandler ["Hit",	{call zupa_phit}];
	SafeZone_KILLED = player addEventHandler ["Killed",	{call zupa_pkill}];
	fnc_usec_unconscious 	= {};
	player_death 			= {};
	player_zombieCheck 		= {};
	fnc_usec_damageHandler 	= {};
};
zupa_pfired = {
	nearestObject [(_this select 0),(_this select 4)] setPos[0,0,0];
	cutText ["You are not allowed to shoot in safezones","PLAIN DOWN"];
};
zupa_pkill = {
	_killer = (_this select 1);
	_nKill = name _killer;
	if (_nKill != name player) then {
		_locKILL = mapGridPosition getPos _killer;
		_attker setHit["Body",1];
		_txt = ""+name player+" was killed by "+str _nKill+" in a safezone! The killer is @ "+str _locKILL+".";
		_sMSG = "SAFE-ZONE: "+str _txt+"";
		
		PVOZ_EPOCH_SAFEZONE = [_sMSG];
		publicVariableServer "PVOZ_EPOCH_SAFEZONE";
		
		_msg = "You were killed by "+str _nKill+"";
		systemChat (str _msg);
	};
};
zupa_phit = {
	_attker = (_this select 1);
	_nAttkr = name _attker;
	if (_nAttkr != name player) then {
		_locATTK = mapGridPosition getPos _attker;
		_attker setHit["Body",1];
		
		_txt = ""+name player+" was shot by "+str _nAttkr+" in a safezone! The attacker is @ "+str _locATTK+".";
		_sMSG = "SAFE-ZONE: "+str _txt+"";
		PVOZ_EPOCH_SAFEZONE = [_sMSG];
		publicVariableServer "PVOZ_EPOCH_SAFEZONE";
		
		_msg = "You were shot by "+str _nAttkr+"";
		systemChat (str _msg);
	};
};
ANTI_THEFT = {
	player action ["GEAR",objNull];
	_txt = 'You can not access backpacks while too close to a player!';
	systemChat ('SAFEZONE: '+str _txt+'');
	cutText [_txt,'PLAIN DOWN'];
	sleep 1;
	_txt = 'You are only allowed to access your friends backpacks!';
	systemChat ('SAFEZONE: '+str _txt+'');
	cutText [_txt,'PLAIN DOWN'];
};
zupa_ZSHIELD = {
	if (isNil 'no_zombies_loop') then {
		while {true} do {
			if (!inSafeZone) exitWith {no_zombies_loop = nil;};
			no_zombies_loop = true;
			_pos = getPos (vehicle player);
			_zombies = _pos nearEntities ["zZombie_Base",50];
			{deletevehicle _x;} forEach _zombies;
			sleep 1;
		};
	};
};
zupa_ANTITHEFT = {
	if (isNil 'anti_theft_loop') then {
		waitUntil {sleep 1;((vehicle player == player)||(!inSafeZone))};
		if (!inSafeZone) exitWith {};
		while {true} do {
			_player = (vehicle player);
			_target = (cursorTarget);
			anti_theft_loop = true;
			if (!inSafeZone) exitWith {};
			if (isNil 'BP_FIX') then {BP_FIX=false;};
			if ((vehicle player == player)) then {
				_playerNear = (({isPlayer _x} count (position player nearObjects ['CAManBase',4])) > 1);
				if (_playerNear) then {
					if (isNull (findDisplay 106)) then {if (BP_FIX) then {BP_FIX = false;};} else {
						
						_playerID = _player getVariable ['CharacterID', '0'];
						_sFriends = _player getVariable ['friendlies', []];
						_Targetid = _target getVariable ['CharacterID', '0'];
						_tFriends = _target getVariable ['friendlies', []];
						_tFriendt = _target getVariable ['friendlyTo', []];
						_isFriend = ((_Targetid in _sFriends)&&(_playerID in _tFriends));
						_isVehcle = ((_target isKindOf 'LandVehicle')||(_target isKindOf 'Ship'));
						_isNear = (_target distance _player < 4);
						if ((_isVehcle)&&(_isNear)||(_isFriend)&&(_isNear)) exitWith {
							if ((_isFriend)&&!(_playerID in _tFriendt)) then {
								BP_FIX = true;
								[] spawn ANTI_THEFT;
							};
						};
						if (!BP_FIX) then {
							[] spawn ANTI_THEFT;
							BP_FIX = true;
						};
					};
				};
			};
			sleep 0.1;
		};
		anti_theft_loop = nil;
	};
};
zupa_ANTIRUN = {
	if (isNil 'vehicle_protection_loop') then {
		waitUntil {sleep 1;(vehicle player != player)||(!inSafeZone)};
		if (!inSafeZone) exitWith {};
		systemChat ("SAFE-ZONE: Vehicle protection loaded.");
		while {true} do {
			if ((vehicle player == player)||(!inSafeZone)) exitWith {};
			vehicle_protection_loop = true;
			_norun = {isPlayer _x} count (getpos (vehicle player) nearEntities [["CAManBase"], 5]);
			if (_norun > 0) then {
				_veh = (vehicle player);
				cutText ['Can not drive, '+(str _norun)+' players within 5m! Reverse or be BANNED','PLAIN'];
				_veh setVelocity [0,0,0];
				sleep 0.5;
			};
			sleep 0.1;
		};
	};
};