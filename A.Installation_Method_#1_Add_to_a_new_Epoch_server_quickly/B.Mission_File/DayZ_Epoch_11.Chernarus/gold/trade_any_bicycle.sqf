private ["_veh","_location","_part_out","_part_in","_qty_out","_qty_in","_qty","_buy_o_sell","_obj","_objectID","_objectUID","_bos","_started","_finished","_animState","_isMedic","_dir","_helipad","_removed","_damage","_tireDmg","_tires","_okToSell","_hitpoints","_needed","_activatingPlayer","_textPartIn","_textPartOut","_traderID","_playerNear"];


// DONE

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

// Test cannot lock while another player is nearby
//_playerNear = {isPlayer _x} count (player nearEntities ["CAManBase", 12]) > 1;
//if(_playerNear) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_104") , "PLAIN DOWN"];  };

// [part_out,part_in, qty_out, qty_in, loc];

_activatingPlayer = player;
// http://puu.sh/6lbnL.jpg buy

// http://puu.sh/6lbpE.jpg sell

_part_out = (_this select 3) select 0; //  Foodnutmix -------------------------ItemCopperBar (classname)
_part_in = (_this select 3) select 1; // CopperBar-----------------------------Foodnutmix (classname)
_qty_out = (_this select 3) select 2; // 1 ammount u get of item---------------1 coins u get
_qty_in = (_this select 3) select 3; // 2 amount of coins u give---------------1 food u give
_buy_o_sell = (_this select 3) select 4; // buy -------------------------------sell
_textPartIn = (_this select 3) select 5; // Coins text-------------------------Trail Mix (name
_textPartOut = (_this select 3) select 6; // Trail mix ( show name of item)----Coins
_traderID = (_this select 3) select 7; // 5868 klenn food----------------------5868
_bos = 0; // ??

//systemChat format ['_part_out = %1 , _part_in = %2 ,_qty_out = %3 , _qty_in =  %4,_buy_o_sell = $5,_textPartIn = %6, _textPartOut = %7, _qty = %8 , ',_part_out,_part_in,_qty_out,_qty_in,_buy_o_sell,_textPartIn,_textPartOut];

if(_buy_o_sell == "buy") then {
	//_qty = {_x == _part_in} count magazines player;	
	_qty = player getVariable ["headShots",0]; // get your money variable	
	
	
} else {
	_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_vehicle];
	_qty = count _obj; // aantal fietsen
	_bos = 1; // bos 1 bij sell 0 by buy?
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"]; //start trading blabla
	 
	[1,1] call dayz_HungerThirst;
	// force animation 
	player playActionNow "Medic"; // do some silly things with your hands

	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;
	
	while {r_doLoop} do { 
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};
	r_doLoop = false;

	if (!_finished) exitWith { 
		r_interrupt = false;
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
	};

	if (_finished) then { // serious stuff

		// Double check for items
		if(_buy_o_sell == "buy") then {
			//_qty = {_x == _part_in} count magazines player;			
			_qty = player getVariable ["headShots",0]; // get your money variable
		
		} else {
			_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_vehicle];
			_qty = count _obj;
		};

		if (_qty >= _qty_in) then {

			//["PVDZE_obj_Trade",[_activatingPlayer,_traderID,_bos]] call callRpcProcedure;
			if (isNil "_obj") then { _obj = "Unknown Vehicle" };
			if (isNil "inTraderCity") then { inTraderCity = "Unknown Trader City" };
			PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_obj,inTraderCity,CurrencyName,_qty_in];
			publicVariableServer  "PVDZE_obj_Trade";
	
			//diag_log format["DEBUG Starting to wait for answer: %1", PVDZE_obj_Trade];

			waitUntil {!isNil "dayzTradeResult"};

			//diag_log format["DEBUG Complete Trade: %1", dayzTradeResult];

			if(dayzTradeResult == "PASS") then {

				if(_buy_o_sell == "buy") then {	
									
					_oudaantal = player getVariable ["headShots",0];
					_qtychange = _oudaantal - _qty_in;
					_oudEC = player getVariable ["extra_coins",0];
					_verschil = _oudEC + _qty_in;
									
					player setVariable ["extra_coins", _verschil , true];
					player setVariable ["headShots", _qtychange , true];
					player setVariable ["moneychanged",1,true];	
					_newM = player getVariable ["headShots",0];
					//_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
					
					_removed = _qty - _newM; // 
					
						systemChat format ['Payed %1 %3. %2 incoming!',_removed,_part_out, CurrencyName];
				
					if(_removed == _qty_in) then {
					
										
						_dir = round(random 360);

						_helipad = nearestObjects [player, ["HeliHCivil","HeliHempty"], 100];
						if(count _helipad > 0) then {
							_location = (getPosATL (_helipad select 0));
						} else {
							_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos;
						};
	
						//place vehicle spawn marker (local)
						_veh = createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0, "CAN_COLLIDE"];

						_location = (getPosATL _veh);

						//["PVDZE_veh_Publish",[_veh,[_dir,_location],_part_out,false,_keySelected]] call callRpcProcedure;
						PVDZE_veh_Publish2 = [_veh,[_dir,_location],_part_out,true,dayz_characterID,_activatingPlayer];
						publicVariableServer  "PVDZE_veh_Publish2";

						player reveal _veh;
						
						cutText [format[(localize "str_epoch_player_180"),_qty_in,_textPartIn,_textPartOut], "PLAIN DOWN"];
					};
					
				} else {
					
					_obj = _obj select 0;

					//check to make sure vehicle has no more than 75% average tire damage
					_hitpoints = _obj call vehicle_getHitpoints;
					_okToSell = true;

					// count parts
					_tires = 0; 

					// total damage 
					_tireDmg = 0;

					_damage = 0;
					{					
						if(["Wheel",_x,false] call fnc_inString) then {		
							_damage = [_obj,_x] call object_getHit;
							_tireDmg = _tireDmg + _damage;
							_tires = _tires + 1;
						};
					} forEach _hitpoints;

					// find average tire damage
					if(_tireDmg > 0 and _tires > 0) then {
						if((_tireDmg / _tires) > 0.75) then {
							_okToSell = false;
						};
					};
					if(local _obj) then {

						if(_okToSell) then {

							if(!isNull _obj and alive _obj) then {
							
								//for "_x" from 1 to _qty_out do {
								//	player addMagazine _part_out;
								//};
								
								_myMoney = player getVariable ["headShots",0];							
								_myMoney = _myMoney + _qty_out;								
								player setVariable ["headShots", _myMoney , true];
								player setVariable ["moneychanged",1,true];	
								

								_objectID 	= _obj getVariable ["ObjectID","0"];
								_objectUID	= _obj getVariable ["ObjectUID","0"];

								PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
								publicVariableServer "PVDZE_obj_Delete";

								deleteVehicle _obj; 

								cutText [format[(localize "str_epoch_player_181"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
							};
						} else {
							cutText [format[(localize "str_epoch_player_182"),_textPartIn] , "PLAIN DOWN"];
						};
					} else {
						cutText [(localize "str_epoch_player_245"), "PLAIN DOWN"];
					};
				};
	
				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;

			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};

} else {
	_needed =  _qty_in - _qty;
	if(_buy_o_sell == "buy") then {
		cutText [format["You need %1 %2",_needed,_textPartIn] , "PLAIN DOWN"]; // edited so it says, You need 5000 coins or you need 1 engine.
	} else {
		cutText [format[(localize "str_epoch_player_185"),_textPartIn] , "PLAIN DOWN"];
	};	
};

DZE_ActionInProgress = false;

_cid =	player getVariable ["CharacterID","0"];
_headShotsZupa = player getVariable ["headShots",0];
_key = format["CHILD:999:UPDATE `character_data` SET `HeadshotsZ` = %1 WHERE `CharacterID` = %2:[0]:",_headShotsZupa,_cid];
_result = _key call server_hiveReadWrite;

//systemChat format ['Script succesfully %1', "ended"];
