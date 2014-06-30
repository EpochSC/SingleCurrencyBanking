private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords =  [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;

_hMSG = "<t align='center' color='#52bf90' shadow='2' size='1.75'>Loot Mission</t><br/><t align='center' color='#ffffff'>A Humvee has crashed! Check your map for the location!</t>";
[nil, nil, rspawn, [_hMSG], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};if (debugMonitor) then {hint_debug_msn=true;debugMonitor=false;};hint parseText (_this select 0);sleep 5;if (hint_debug_msn) then {hint_debug_msn=false;debugMonitor=true;[] spawn fnc_debug;};}] call RE;

_sMSG1 = "RANDOM EVENT: Loot Mission:";
[nil, nil, rspawn, [_sMSG1], { systemChat (_this select 0) }] call RE;
sleep 0.5;
_sMSG2 = "RANDOM EVENT: A Military Humvee has crashed! Check your map for the location!";
[nil, nil, rspawn, [_sMSG2], { systemChat (_this select 0) }] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_humveecrash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];
_humveecrash setVariable ["Mission",1,true];

_crate3 = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\missions\misc\fillBoxesS.sqf";
_crate3 setVariable ["Mission",1,true];

[_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 1;
[_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 1;

waitUntil{{isPlayer _x && _x distance _humveecrash < 5  } count playableunits > 0}; 

_hMSG = "<t align='center' color='#52bf90' shadow='2' size='1.75'>Mission Success</t><br/><t align='center' color='#ffffff'>The crash site has been secured by survivors!</t>";
[nil, nil, rspawn, [_hMSG], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};if (debugMonitor) then {hint_debug_msn=true;debugMonitor=false;};hint parseText (_this select 0);sleep 5;if (hint_debug_msn) then {hint_debug_msn=false;debugMonitor=true;[] spawn fnc_debug;};}] call RE;

_sMSG1 = "RANDOM EVENT: Mission success! The crash site has been secured by survivors!";
[nil, nil, rspawn, [_sMSG1], { systemChat (_this select 0) }] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
