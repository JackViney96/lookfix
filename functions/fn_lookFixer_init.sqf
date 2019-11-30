scriptName "init_lookFixer";
/*
	Author: Jack "Pritchard" Viney

	Description:
	Starts the lookfixer!

	Parameter(s):
	Nothing

	Returns:
	Nothing
*/
["MouseMoving",{_this call PCT_fnc_lookFixer}] call CBA_fnc_addDisplayHandler;
["KeyDown", {_this call PCT_fnc_lfKeyDown}] call CBA_fnc_addDisplayHandler;
["KeyUp", {_this call PCT_fnc_lfKeyUp}] call CBA_fnc_addDisplayHandler;

lookfix_toggle = true;
lookfix_keyUp = true;
lookfix_keys = [];
lookfix_keys append (actionKeys "optics");

PCT_fnc_lfKeyDown = {
	params ["_displayorcontrol", "_dikCode", "_shift", "_ctrl", "_alt"];
	if (!_shift && !_ctrl && !_alt) then {
		if (_dikCode in lookfix_keys) then {
			if (lookfix_keyUp) then {
				lookfix_keyUp = false;
				if (lookfix_toggle) then {
					lookfix_toggle = false;
				}
				else {
					lookfix_toggle = true;
				}
			};
		};
	};
};

PCT_fnc_lfKeyUp = {
	params ["_displayorcontrol", "_dikCode", "_shift", "_ctrl", "_alt"];
	if (!_shift && !_ctrl && !_alt) then {
		if (_dikCode in lookfix_keys) then {
			if (!lookfix_keyUp) then {
				lookfix_keyUp = true;
			};
		};
	};
};

PCT_fnc_lookFixer = {
	params ["_display", "_xPos", "_yPos"];
	private _badDisplays = [602,160,38580];

	{ if (!isNull findDisplay _x) exitWith {} } forEach _badDisplays;
	//Map Display doesn't work with above method :/
	if(visibleMap) exitWith {};
	//Other cases. Dialog catches things that findDisplay doesn't want to
	if(dialog) exitWith {};
	
	if(freeLook) exitWith {};

	//search for banned animations - right now this means ladder climbing.
	if ((animationState player find "ladder") != -1) exitWith {};
	
	if (inputAction "opticsTemp" != 0) exitWith {
		_zoom = call CBA_fnc_getFov select 1;
		_azi = getDir player;
		player setDir _azi + (_xPos * PCT_lookfix_aim_coef) / _zoom;
	};

	//Actually do the turning
	if(lookfix_toggle) then {
		_azi = getDir player;
		player setDir _azi + (_xPos * PCT_lookfix_coef);
	} else {
		_zoom = call CBA_fnc_getFov select 1;
		_azi = getDir player;
		player setDir _azi + (_xPos * PCT_lookfix_aim_coef) / _zoom;
	};
};