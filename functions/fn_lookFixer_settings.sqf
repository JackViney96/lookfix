[
    "PCT_lookfix_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Mouse Turning Coefficient", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.5, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookfix_aim_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Mouse Turning Coefficient (Aiming)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;