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

	_beg = ASLToAGL eyePos player;
	_endE = (_beg vectorAdd (eyeDirection player vectorMultiply 100));
	drawLine3D [ _beg, _endE, [0,1,0,1]];
	_endC = (_beg vectorAdd (getCameraViewDirection player vectorMultiply 100));
	drawLine3D [ _beg, _endC, [0,0,1,1]];
	_endW = (_beg vectorAdd (player weaponDirection currentWeapon player vectorMultiply 100));
	drawLine3D [_beg, _endW, [1,0,0,1]];

//Kinda decent
/* value = [(PCT_lookFix_xPos * _coef) / _zoom, -1, 1] call BIS_fnc_clamp;
value = parseNumber (value toFixed 3);
systemChat str value;

result = [vectorDir player, vectorUp player, -value] call CBA_fnc_vectRotate3D; 
 
player setVectorDir result;
PCT_lookFix_xPos = 0; */

/////
/////
/* PCT_old_xPos = _xPos;

_xPos = PCT_lookFix_xPos;

_difference = PCT_old_xPos - _xPos;

if (_difference < 0.05) then {
		_xPos = PCT_old_xPos - 0.05;
	};
	if (_difference > 0.05) then {
		_xPos = PCT_old_xPos + 0.05;
	};

value = [(_xPos * PCT_lookfix_coef), -1, 1] call BIS_fnc_clamp;
value = parseNumber (value toFixed 3);
systemChat str value;

result = [vectorDir player, vectorUp player, -value] call CBA_fnc_vectRotate3D; 
 
player setVectorDir result; */

/////

//PCT_vDir = vectorNormalized ((getCameraViewDirection player) vectorDiff (player weaponDirection currentWeapon player));
//_azi = getDir player + (PCT_lookFix_xPos * _coef) / _zoom;

//WHY DONT YOU JITTER
//PCT_vec = [(getCameraViewDirection player), (player weaponDirection currentWeapon player), 0.1] call BIS_fnc_lerpVector;

/* _vec = [vectorDir player, [0,0,1], getDir player + PCT_lookFix_xPos] call CBA_fnc_vectRotate3D;
player setVectorDir _vec; */

//[player,[0,0,_azi]] call fnc_SetPitchBankYaw;

//set the variable for network sync test
//_arr = [_azi, _val, getPos player, velocity player, vectorDir player];
//_arr = [vectorDirVisual player, vectorUpVisual player];
//player setVariable ["PCT_sync", _arr, true];



//_vec = [vectorDir player, [0,0,1], getDir player + PCT_lookFix_xPos2] call CBA_fnc_vectRotate3D;
//player setVectorDir ([(getCameraViewDirection player), _vec, 0.1] call BIS_fnc_lerpVector); 

/* azi = getDirVisual player + (PCT_lookFix_xPos * PCT_lookfix_coef);

val = 0;
if ((PCT_lookFix_xPos * PCT_lookfix_coef) > 0) then {
	val = 1;
}
else {
	val = -1;
};

result = [vectorDir player, vectorUp player, val] call CBA_fnc_vectRotate3D;
PCT_vec = [vectorDirVisual player, [sin azi, cos azi, (vectorDirVisual player select 2)], 0.5] call BIS_fnc_lerpVector;

systemChat format ["[%1] PRITCHARD: diff = %2", time, (result vectorDiff PCT_vec)];
player setDir _azi;

_vDir = vectorDirVisual player;
_orgX = _vDir select 0;
_orgY = _vDir select 1;
_orgZ = _vDir select 2;

theta = getDirVisual player + (PCT_lookFix_xPos * PCT_lookfix_coef);//-PCT_lookFix_xPos;

_newX = (_orgX * cos theta) - (_orgY * sin theta);
_newY = (_orgX * sin theta) + (_orgY * cos theta);

//PCT_vec = [getcameraviewdirection player, [_newX, _newY, _orgZ], 0.25] call BIS_fnc_lerpVector;


//PCT_vec = [vectorDirVisual player, [_newX, _newY, _orgZ], 1] call BIS_fnc_lerpVector;
//PCT_vec = (vectorDir player) vectorAdd [_newX, _newY, 0];

player setVectorDir PCT_vec; */

/* _array = eyedirection player;
_dir_degrees = (_array select 0) atan2 (_array select 1);

_theta = _dir_degrees;

_newX = (_orgX * cos _theta) - (_orgY * sin _theta);
_newY = (_orgX * sin _theta) + (_orgY * cos _theta); */

//PCT_vec = [(getCameraViewDirection player), [_newX, _newY, _orgZ], PCT_alpha] call BIS_fnc_lerpVector;

/* value = [(PCT_lookFix_xPos * _coef) / _zoom, -1, 1] call BIS_fnc_clamp;
value = parseNumber (value toFixed 3);
systemChat str value;

result = [vectorDir player, vectorUp player, -value] call CBA_fnc_vectRotate3D; 
 
player setVectorDir result;
PCT_lookFix_xPos = 0; */