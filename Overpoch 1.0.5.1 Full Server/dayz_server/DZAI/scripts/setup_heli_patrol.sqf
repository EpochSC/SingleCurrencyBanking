
waitUntil {sleep 1; !isNil "DZAI_locations_ready"};

_helipatrols = [] spawn fnc_spawnHeliPatrol;
