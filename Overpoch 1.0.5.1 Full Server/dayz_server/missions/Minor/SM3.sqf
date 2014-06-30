private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\Missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";

_coords =  [getMarkerPos "center",0,5000,10,0,20,0] call BIS_fnc_findSafePos;

_hMSG = "<t align='center' color='#52bf90' shadow='2' size='1.75'>AI Mission</t><br/><t align='center' color='#ffffff'>A group of bandits have set up a stash house! Check your map for the location!</t>";
[nil, nil, rspawn, [_hMSG], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};if (debugMonitor) then {hint_debug_msn=true;debugMonitor=false;};hint parseText (_this select 0);sleep 5;if (hint_debug_msn) then {hint_debug_msn=false;debugMonitor=true;[] spawn fnc_debug;};}] call RE;

_sMSG1 = "RANDOM EVENT: AI Mission:";
[nil, nil, rspawn, [_sMSG1], { systemChat (_this select 0) }] call RE;
sleep 0.5;
_sMSG2 = "RANDOM EVENT: A group of bandits have set up a stash house! Check your map for the location!!";
[nil, nil, rspawn, [_sMSG2], { systemChat (_this select 0) }] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["Land_HouseV_1I3",[(_coords select 0) +2, (_coords select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_hut06",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["Land_hut06",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_baserunover setVariable ["Mission",1,true];
_baserunover2 setVariable ["Mission",1,true];
_baserunover3 setVariable ["Mission",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";

_crate setVariable ["Mission",1,true];

[[(_coords select 0) - 20, (_coords select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 3;
[[(_coords select 0) + 20, (_coords select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 3;


waitUntil{{isPlayer _x && _x distance _baserunover < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The stash house is under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
