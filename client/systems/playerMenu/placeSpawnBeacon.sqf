
//	@file Version: 1.1
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy, [FF] Redshirt_Ensign
//	@file Created: 7/12/2012 23:30
//	@file Args:

// PRECONDITION: Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_stringEscapePercent","_totalDuration","_lockDuration","_iteration","_iterationPercentage","_playerPos","_failSafePos","_safePos","_placedBeacon", "_lockDuration", "_beaconOwner", "_placedBeaconPos", "_playerSide", "_playerUID", "_activeBeacon"];

// Get Player Location
_playerPos = getPosATL player;

// PRECONDITION: Check that a player is not currently a car (driving)
if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

// PRECONDITION: Check that a player is not currently over water (sea)
if(surfaceIsWater [_playerPos select 0, _playerPos select 1]) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconOverWater";
};

// PRECONDITION: Check that a player is not too close to a town spawn
_closeTowns = 0;
_closeTownsNames = [];
{
    _pos = getMarkerPos (_x select 0);
    _rad = _x select 1;
    _name = _x select 2;
    _blockRad = _rad + 500;

    if((_playerPos distance _pos) < _blockRad) then
        {
        _closeTowns = _closeTowns + 1;
        _closeTownsNames set [count _closeTownsNames, _name];
        };
}forEach cityList;
if(_closeTowns > 0) exitWith {
	player globalChat format [localize "STR_WL_Errors_BeaconTooClose",_closeTownsNames];
};

_stringEscapePercent = "%"; // Required to get the % sign into a formatted string.
_totalDuration = 30; // This will NOT be easy >:)
_lockDuration = _totalDuration;
_iteration = 0;
_beaconOwner = name vehicle player;
_playerSide = str(playerSide);
_playerUID = getPlayerUID player;
_activeBeacon = false;

// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (BLU).
{
	if(str(_playerUID) == str(_x select 3)) then {
    	_activeBeacon = true;
    };

}forEach pvar_beaconListBlu;
// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (RED).
{
    if(str(_playerUID) == str(_x select 3)) then {
    	_activeBeacon = true;
    };
}forEach pvar_beaconListRed;
// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (IND).
{
    if(str(_playerUID) == str(_x select 3)) then {
    	_activeBeacon = true;
    };
}forEach pvar_beaconListInd;

//Dropped in favour of just replacing previous beacon
// Due to the 'Undefined behaviour' of exitWith inside loops, this is the workaround.
//if (_activeBeacon) exitWith {
//	player globalChat localize "STR_WL_Errors_BeaconActive";
//};

// Remove active beacon so you can deploy new
if (_activeBeacon) then {
        hint "Deactivating existing active spawn beacon.";
        [_playerUID] execVM "client\functions\cleanBeaconArrays.sqf";
};

player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...

mutexScriptInProgress = true;

for "_iteration" from 1 to _lockDuration do {

	if(vehicle player != player) exitWith {
		player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        player action ["eject", vehicle player];
	};  
    
    if (doCancelAction) exitWith {// Player selected "cancel action".
    	2 cutText ["", "PLAIN DOWN", 1];
        doCancelAction = false;
    	mutexScriptInProgress = false;
	}; 
    
    if (!(alive player)) exitWith {// If the player dies, revert state.
		2 cutText ["Place spawn beacon interrupted...", "PLAIN DOWN", 1];
    	mutexScriptInProgress = false;
	};	
    		    
	if(player distance _currObject > 5) exitWith { // If the player dies, revert state.
		2 cutText ["Place spawn beacon interrupted...", "PLAIN DOWN", 1];
		mutexScriptInProgress = false;
	};                  
                                                        	    
	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the placement.
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};
    	    
	_lockDuration = _lockDuration - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);
					    
	2 cutText [format["Placing spawn beacon %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
	sleep 1;
					    
	if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that place has completed.
		sleep 1;
		2 cutText ["", "PLAIN DOWN", 1];
				            
		player setVariable["spawnBeacon",0,true];

                _failSafePos = [_playerPos select 0, _playerPos select 1, 10];
                _safePos = [[_playerPos select 0, _playerPos select 1, 0], 0, 10, 0.5, 0, 80 * (pi / 180), 0, [], [_failSafePos]] call BIS_fnc_findSafePos;
		_placedBeacon = "Satelit" createVehicle (position player); _placedBeacon setPos _safePos;
		_placedBeacon addEventHandler["handleDamage", {false}];
		_placedBeacon setVariable["R3F_LOG_disabled", true];
		_placedBeacon setVariable["faction",_playerSide,true];
	    _placedBeacon setVariable["ownerName",_beaconOwner,true];
	    _placedBeacon setVariable["ownerUID",_playerUID,true];
            _placedBeacon enableSimulation false;
	    _placedBeaconPos = getPos _placedBeacon;
	   
	    if(_playerSide == "WEST") then {
	    	pvar_beaconListBlu set [count pvar_beaconListBlu,[_beaconOwner, _placedBeaconPos, 500, _playerUID]];
	    	publicVariable "pvar_beaconListBlu";
	    };

	    if(_playerSide == "EAST") then {
	    	pvar_beaconListRed set [count pvar_beaconListRed,[_beaconOwner, _placedBeaconPos, 500, _playerUID]];
	    	publicVariable "pvar_beaconListRed";
	    };

	    if(_playerSide == "GUER") then {
	    	pvar_beaconListInd set [count pvar_beaconListInd,[_beaconOwner, _placedBeaconPos, 500, _playerUID]];
	    	publicVariable "pvar_beaconListInd";
	    };

		mutexScriptInProgress = false;
	};
};

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.
