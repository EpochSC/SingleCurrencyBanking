private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5600,100,0,20,0] call BIS_fnc_findSafePos;

_hMSG = "<t align='center' color='#52bf90' shadow='2' size='1.75'>AI Mission</t><br/><t align='center' color='#ffffff'>Zupa his Heavy Industrial Delivery has crashed, Watch out for his guards..! Check your map for the location!</t>";
[nil, nil, rspawn, [_hMSG], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};if (debugMonitor) then {hint_debug_msn=true;debugMonitor=false;};hint parseText (_this select 0);sleep 5;if (hint_debug_msn) then {hint_debug_msn=false;debugMonitor=true;[] spawn fnc_debug;};}] call RE;

_sMSG1 = "RANDOM EVENT: AI Mission:";
[nil, nil, rspawn, [_sMSG1], { systemChat (_this select 0) }] call RE;
sleep 0.5;
_sMSG2 = "RANDOM EVENT: Zupa his major industrial delivery has crashed, Watch out for his guards..! Check your map for the location!";
[nil, nil, rspawn, [_sMSG2], { systemChat (_this select 0) }] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_c130wreck = createVehicle ["UH1Wreck_DZ",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];
_c130wreck setVariable ["Mission",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxesI.sqf";

_crate setVariable ["Mission",1,true];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxesI.sqf";
_crate2 setVariable ["Mission",1,true];

waitUntil{{isPlayer _x && _x distance _c130wreck < 5 } count playableunits > 0}; 

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


[nil,nil,rTitleText,"Zupa his Guards have been defeated! Industrial loot for everyone!", "PLAIN",6] call RE;
SM1 = 1;


[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";