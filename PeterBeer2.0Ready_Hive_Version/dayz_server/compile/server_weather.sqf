private ["_weather","_windX","_windY","_weatherOptions","_numWeatherOptions","_forcastTime"];

_weatherOptions =
[   
	[0, 0, 4, 0],		
	[0.1, 0.1, 5, 0.1],        
    [0.3, 0.2,	6, 0.2],           
	[0.4, 0.3,	7, 0.3],           
	[0.5, 0.4,	8, 0.4],           
	[0.5, 0.5,	9, 0.5],           
	[0.6, 0.4,	10, 0.6],           
	[0.7, 0.3,	11, 0.7],           
	[0.8, 0.2,	12, 0.8],           
	[0.9, 0.1,	13, 0.9],           
	[1, 1, 15, 1]
];

_numWeatherOptions = count _weatherOptions;
_forcastTime = 300;

if (isNil "WeatherForcast" && isNil "WeatherForcastTime") then {
	WeatherForcast = floor(random(_numWeatherOptions));
	WeatherForcastTime = diag_tickTime;
} else {
	if (WeatherForcastTime >= _forcastTime) then {
		WeatherForcast = floor(random(_numWeatherOptions));
		WeatherForcastTime = diag_tickTime;
	};
};

if (isNil "CurrentWeatherOption") then {
	CurrentWeatherOption = WeatherForcast;
} else {
	if(CurrentWeatherOption < WeatherForcast) then {
		CurrentWeatherOption = ((CurrentWeatherOption + 1) min _numWeatherOptions);
	} else {
		if (CurrentWeatherOption != WeatherForcast && WeatherForcastTime >= _forcastTime) then {
			CurrentWeatherOption = ((CurrentWeatherOption - 1) max 0) ;
		};
	};
};

_weather = _weatherOptions select CurrentWeatherOption;
_windX = floor(random(_weather select 2));
_windY = (_weather select 2) - _windX;
_weather set [2,[_windX,_windY]];

diag_log format["Weather %1", _weather];
 
PVDZE_plr_SetWeather = _weather;

publicVariable "PVDZE_plr_SetWeather";