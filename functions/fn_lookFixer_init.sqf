/*
	Author: Jack "Pritchard" Viney

	Description:
	Starts the lookfixer!

	Parameter(s):
	Nothing

	Returns:
	Nothing
*/

["MouseMoving",{_this call PCT_fnc_lookfix_moving}] call CBA_fnc_addDisplayHandler;
PCT_lookFix_badDisplays = [602,160,38580];


PCT_fnc_lookfix_moving = {
	//Update the mouse delta global variables
	params ["_display", "_xPos", "_yPos"];
	PCT_lookFix_xPos = _xPos;
	PCT_lookFix_YPos = _yPos;	
};

//Personal
PCT_EH_id = addMissionEventHandler ["Draw3D", {
	if (isGamePaused) exitWith {
		[0] call PCT_fnc_lookFixer_rotate;
	};

	{ if (!isNull findDisplay _x) exitWith {
		[0] call PCT_fnc_lookFixer_rotate;
	} } forEach PCT_lookFix_badDisplays;

	//Attached to another object
	if !(isNull attachedTo player) exitWith {
		//Doesn't seem that any kind of manipulation is possible while the player is attached. Weird state to be in anyway.
		//[0, true] call PCT_fnc_lookFixer_rotate;
	};

	//Map Display doesn't work with findDisplay method :/
	if(visibleMap) exitWith {
		[0] call PCT_fnc_lookFixer_rotate;
	};
	//Other cases. Dialog catches things that findDisplay doesn't want to
	if(dialog) exitWith {
		[0] call PCT_fnc_lookFixer_rotate;
	};
	
	if(freeLook) exitWith {
		[0] call PCT_fnc_lookFixer_rotate;
	};

	//search for banned animations - right now this means ladder climbing.
	if ((animationState player find "ladder") != -1) exitWith {
		[0, true] call PCT_fnc_lookFixer_rotate;
	};
	//In a vehicle
	if (!isNull objectParent player) exitWith {
		[0, true] call PCT_fnc_lookFixer_rotate;
	};
	
	//Actually do the turning
	if(cameraView != "GUNNER") then {
		[PCT_lookfix_coef] call PCT_fnc_lookFixer_rotate;
	} else {
		[PCT_lookfix_aim_coef] call PCT_fnc_lookFixer_rotate;
	};

	//Make sure we don't keep stale data (e.g. if game is paused)
	//PCT_lookFix_xPos = 0;
	//PCT_lookFix_YPos = 0;	
}];

//Netsync test
/* addMissionEventHandler ["EachFrame", { 
	{
		_sync = _x getVariable ["PCT_sync", nil];
		
		if !(isNil "_sync") then {
		//_sync params ["_azi", "_val", "_pos", "_vel", "_vDir"];
		_sync params ["_vDir", "_vUp", "_pos"];
			//_x setDir _azi;
			_x setVectorDirAndUp [_vDir, _vUp];
			//_x setVectorUp _val;
			//_x setPos _pos;
			//_x setVelocity _vel;
		};
	} forEach allPlayers - [player]; //Exclude ourselves
}];

 */