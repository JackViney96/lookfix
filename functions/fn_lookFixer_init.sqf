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
PCT_lookFix_badAnimations = ["ladder", "mrun", "meva"];

PCT_fnc_lookfix_moving = {
	//Update the mouse delta global variables
	params ["_display", "_xPos", "_yPos"];
	PCT_lookFix_xPos = _xPos;
	PCT_lookFix_YPos = _yPos;	
};

//Personal
PCT_EH_id = addMissionEventHandler ["EachFrame", {
	if (isGamePaused) exitWith {
		[0] call PCT_fnc_lookfixer_type;
	};

	{ if (!isNull findDisplay _x) exitWith {
		[0] call PCT_fnc_lookfixer_type;
	} } forEach PCT_lookFix_badDisplays;

	//Attached to another object
	if !(isNull attachedTo player) exitWith {
		//Doesn't seem that any kind of manipulation is possible while the player is attached. Weird state to be in anyway.
		//[0, true] call PCT_lookfix_function;
	};

	//Map Display doesn't work with findDisplay method :/
	if(visibleMap) exitWith {
		[0] call PCT_fnc_lookfixer_type;
	};
	//Other cases. Dialog catches things that findDisplay doesn't want to
	if(dialog) exitWith {
		[0] call PCT_fnc_lookfixer_type;
	};


	//TODO: removeme
	if(freeLook) exitWith {
		[0] call PCT_fnc_lookfixer_type;
	};

	//TODO: Parachute exception

	//search for banned animations - right now this means ladder climbing.
	_animationCheck = {
			if ((animationState player find _x) != -1) exitWith {true};
	} forEach PCT_lookfix_badAnimations;
	if (_animationCheck) exitWith {
		[0, true] call PCT_fnc_lookfixer_type;
	};
	
	//In a vehicle
	if (!isNull objectParent player) exitWith {
		[0, true] call PCT_fnc_lookfixer_type;
	};
	
	//Actually do the turning
	if(cameraView != "GUNNER") then {
		[PCT_lookfix_coef] call PCT_fnc_lookfixer_type;
	} else {
		[PCT_lookfix_aim_coef] call PCT_fnc_lookfixer_type;
	};

	if (PCT_lookFix_RTZ) then {
	if ((cameraView isequalto "GUNNER")) then {
		if (PCT_lookFix_vertical_angle < 0) then { 
			PCT_lookFix_vertical_angle = PCT_lookFix_vertical_angle + abs(PCT_lookFix_vertical_angle * PCT_lookfix_RTZ_constant); 
		}; 
		if (PCT_lookFix_vertical_angle > 0) then { 
			PCT_lookFix_vertical_angle = PCT_lookFix_vertical_angle - abs(PCT_lookFix_vertical_angle * PCT_lookfix_RTZ_constant);
		}; 
	};
};

	//Make sure we don't keep stale data (e.g. if game is paused)
	PCT_lookFix_xPos = 0;
	PCT_lookFix_YPos = 0;	
}];
