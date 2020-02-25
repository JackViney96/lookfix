/*
Jack "Pritchard" Viney

A simple shim to let the user choose which method of lookfix they want.
*/

params [["_coef", 0], ["_reset", false]];
switch (PCT_lookfix_function) do {
	case 0: {[_coef, _reset] call PCT_fnc_lookFixer_rotate_dir;};
	case 1: {[_coef, _reset] call PCT_fnc_lookFixer_rotate_vector;};
	default {[0, true] call PCT_fnc_lookFixer_rotate_vector;}; //Disable
};