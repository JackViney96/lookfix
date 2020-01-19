/*
Jack "Pritchard" Viney

A simple shim to let the user choose which method of lookfix they want.
*/

params [["_coef", 0], ["_reset", false]];
switch (PCT_lookfix_function) do {
	case "PCT_fnc_lookFixer_rotate_vector": {[_coef, _reset] call PCT_fnc_lookFixer_rotate_vector;};
	case "PCT_fnc_lookFixer_rotate_freelook": {[_coef, _reset] call PCT_fnc_lookFixer_rotate_freelook;};
	case "PCT_fnc_lookFixer_rotate_weapon": {[_coef, _reset] call PCT_fnc_lookFixer_rotate_weapon;};
	case "PCT_fnc_lookFixer_rotate_dir": {[_coef, _reset] call PCT_fnc_lookFixer_rotate_dir;};
	default {PCT_lookFix_vertical_angle = 0;}; //Disable
};