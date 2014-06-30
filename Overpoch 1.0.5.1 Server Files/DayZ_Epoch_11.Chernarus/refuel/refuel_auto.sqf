//By DJ SCOTTY - Use without permission strictly prohibited
_vehicle= _this select 0;
_configVeh = 	configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity = 	getNumber(_configVeh >> "fuelCapacity");
player playActionNow "Medic";
_dis=40;
_sfx = "refuel";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
sleep 6;
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
dayzSetFuel = [_vehicle,_capacity];
dayzSetFuel spawn local_setFuel;
publicVariable "dayzSetFuel";
cutText ["Your Vehicle has been refueled.", "PLAIN DOWN"];