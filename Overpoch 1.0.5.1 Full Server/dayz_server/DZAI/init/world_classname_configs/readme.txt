Explanation for world_classname_configs directory
-----------------------------------

Config files are organized into different folders on a per-map basis with the exception of DayZ Epoch, which is located in its own "epoch" folder.

Do not edit the <mapname>_classnames.sqf files! They are only used to direct DZAI to the correct config file.

Inside each mapname folder, there is a default.sqf file. This config file is read if other mods for the map aren't detected.

Example: If running vanilla DayZ, /Chernarus/default.sqf will be read. If running DayZ Overwatch, /Chernarus/dayz_overwatch will be read instead.