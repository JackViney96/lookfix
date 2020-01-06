/*
	Author: Jack "Pritchard" Viney

	Description:
	Called every frame to rotate the character. 
	Very, very hacky. Sorry, BI!

	Parameter(s):
	_coef: The movement coefficient that the user can set in the addon options.
	_reset: used when the player's angle needs to be reset (climbed a ladder, etc)

	Returns:
	Nothing
*/
params [["_coef", 0], ["_reset", false]];
_zoom = call CBA_fnc_getFov select 1;

if (isNil "PCT_lookFix_vertical_angle") then {
	PCT_lookFix_vertical_angle = 0;
};

if (PCT_LookFix_allow_vertical) then {
	//Vertical delta
	PCT_lookFix_vertical_angle = PCT_lookFix_vertical_angle - (PCT_lookFix_YPos * _coef) / _zoom;

	//Vertical cap
	if (PCT_lookFix_vertical_angle < -PCT_lookFix_vertical_cap) then {
		PCT_lookFix_vertical_angle = -PCT_lookFix_vertical_cap;
	};
	if (PCT_lookFix_vertical_angle > PCT_lookFix_vertical_cap) then {
		PCT_lookFix_vertical_angle = PCT_lookFix_vertical_cap;
	};

	//Reset player angle 
	if (_reset) then {
		PCT_lookFix_vertical_angle = 0;
	};
};

_azi = getDirVisual player + (PCT_lookFix_xPos * _coef) / _zoom;
_y = _azi; _p = PCT_lookFix_vertical_angle; _r = 0;
if (isNil "_p") then {
	_p = 0;
};
if (isNil "_y") then {
	_y = getDirVisual player;
};
_vUp = [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D;

player setDir _azi;
player setVectorUp _vUp;

//set the variable for network sync test
//_arr = [_azi, _val, getPos player, velocity player, vectorDir player];
_arr = [vectorDirVisual player, vectorUpVisual player];
player setVariable ["PCT_sync", _arr, true];