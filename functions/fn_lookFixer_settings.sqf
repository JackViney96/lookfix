[
    "PCT_lookfix_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Mouse Turning Coefficient","How much mouse movement should affect the rotation of the view before reaching the edge of the deadzone."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.5, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookfix_aim_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Mouse Turning Coefficient (Aiming)","How much mouse movement should affect the rotation of the view before reaching the edge of the deadzone, while aiming."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_allow_vertical", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Allow Vertical Smoothing","Warning! This tilts your entire player model. Use at your own risk."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    true //Global setting
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_vertical_cap", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Vertical Smoothing Cap","Higher values cause more obvious issues. Try and match the setting to your deadzone size."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Aiming Deadzone Fix", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 15, 0, 0] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;