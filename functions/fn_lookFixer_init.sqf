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
PCT_lookFix_badAnimations = ["ladder", "mrun", "meva", "par"];

PCT_fnc_lookfix_moving = {
	//Update the mouse delta global variables
	params ["_display", "_xPos", "_yPos"];
	PCT_lookFix_xPos = _xPos;
	PCT_lookFix_YPos = _yPos;	
};

//Personal
PCT_lookFix_id = addMissionEventHandler ["EachFrame", {
	//So we can still 'exitWith' even when we're in a nested scope
	scopeName "PCT_lookfix_main";

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
	if (PCT_lookFix_freelook) then {	
		if(freeLook) then {
			if !(cameraView isequalto "GUNNER") then {
				call PCT_fnc_lookfixer_RTZ;
				[0] call PCT_fnc_lookfixer_type;
				//Need to use breakOut due to nesting?
				breakOut "PCT_lookfix_main";
			};
		};
		//Else, do nothing!
	}
	else {
		if(freeLook) then {
			call PCT_fnc_lookfixer_RTZ;
			[0] call PCT_fnc_lookfixer_type;
			breakOut "PCT_lookfix_main";
		};
	};

	//TODO: Parachute exception

	//search for banned animations
	_animationCheck = {
			if ((animationState player find _x) != -1) exitWith {true};
	} forEach PCT_lookfix_badAnimations;
	if (_animationCheck) exitWith {
		call PCT_fnc_lookfixer_RTZ;
		[0] call PCT_fnc_lookfixer_type;		
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
			call PCT_fnc_lookfixer_RTZ;
		};
	};

	//Make sure we don't keep stale data (e.g. if game is paused)
	PCT_lookFix_xPos = 0;
	PCT_lookFix_YPos = 0;	
}];
