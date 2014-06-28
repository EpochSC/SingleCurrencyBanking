waitUntil{initialized};
//Only create these if they aren't already
createCenter east;
createCenter resistance;
//Survivors 
WEST setFriend [RESISTANCE,0];
WEST setFriend [EAST,0];
//AI Units
EAST setFriend [RESISTANCE,0];
EAST setFriend [WEST,0];
EAST setFriend [CIVILIAN,0];//AI Units attack zeds
CIVILIAN setFriend [EAST,0];//Zeds attack AI units
//Unused
RESISTANCE setFriend [WEST,0];
RESISTANCE setFriend [EAST,0];
