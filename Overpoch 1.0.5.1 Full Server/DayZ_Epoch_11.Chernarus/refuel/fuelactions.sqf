private ["_vehicle"];
_vehicle = objNull;
_distance = 15;
_amount= 0.02;
s_player_refuel = -1;
 
while {true} do
{
    if (!isNull player) then {
        private ["_currentVehicle", "_isNearFeed", "_countFuel"];
                _currentVehicle = vehicle player;
                _countFuel = (count ((position _currentVehicle) nearObjects ["Land_Fuel_tank_big", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_A_FuelStation_Feed", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2_EP1", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_fuel_tank_stairs", _distance]));
                _isNearFeed = _countFuel > 0;
 
        if (_vehicle != _currentVehicle) then {
            if (!isNull _vehicle) then {
                _vehicle removeAction s_player_refuel;
                _vehicle = objNull;
            };
 
            if (_currentVehicle != player && _isNearFeed && !(_currentVehicle isKindof "Bicycle")) then {  //change "Bicycle" to "Land" to allow only air vehicles to aut-refuel
                _vehicle = _currentVehicle;
 
                s_player_refuel = _vehicle addAction ["Refuel", "DamiMods\Refuel\refuel.sqf", [_amount], -1, false, true, "", "vehicle _this == _target && local _target"];
            };
        };
   
        if (!_isNearFeed) then {
            _vehicle removeAction s_player_refuel;
            _vehicle = objNull;
        };
    };
    sleep 2;
}