private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,100,0,20,0] call BIS_fnc_findSafePos;

_hMSG = "<t align='center' color='#52bf90' shadow='2' size='1.75'>AI Mission</t><br/><t align='center' color='#ffffff'>Bandits have discovered a weapons cache! Check your map for the location!</t>";
[nil, nil, rspawn, [_hMSG], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};if (debugMonitor) then {hint_debug_msn=true;debugMonitor=false;};hint parseText (_this select 0);sleep 5;if (hint_debug_msn) then {hint_debug_msn=false;debugMonitor=true;[] spawn fnc_debug;};}] call RE;

_sMSG1 = "RANDOM EVENT: AI Mission:";
[nil, nil, rspawn, [_sMSG1], { systemChat (_this select 0) }] call RE;
sleep 0.5;
_sMSG2 = "RANDOM EVENT: Bandits have discovered a weapons cache! Check your map for the location!";
[nil, nil, rspawn, [_sMSG2], { systemChat (_this select 0) }] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxesS.sqf";

_crate setVariable ["Mission",1,true];

_crate2 = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxesH.sqf";

_crate2 setVariable ["Mission",1,true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;

waitUntil{{isPlayer _x && _x distance _crate < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The weapons cache is under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
