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
["MouseMoving",{_this call fnc_lookFixer}] call CBA_fnc_addDisplayHandler;

fnc_lookFixer = {
	params ["_display", "_xPos", "_yPos"];
	private _badDisplays = [602,160,38580];
	private _go = true;
	{ if (!isNull findDisplay _x) then {
		_go = false;
	} } forEach _badDisplays;
	//Map Display doesn't work with above method :/
	if(visibleMap) then {
		_go = false;
	};
	//Other cases. Dialog catches things that findDisplay doesn't want to
	if(dialog) then {
		_go = false;
	};
	
	if(freeLook) then {
		_go = false;
	};

	//search for banned animations - right now this means ladder climbing.
	if ((animationState player find "ladder") != -1) then {
		_go = false;
	};
	
	if (inputAction "opticsTemp" != 0) then {
		_go = false;
	};
	
	//Actually do the turning
	if( _go) then {
			_azi = getDir player;
			player setDir _azi + (_xPos / 2);
			true
	};
};