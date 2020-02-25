[
    "PCT_lookFix_function", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    ["Method","Select different models of functionality to suit preference. See Steam Workshop page for caveats."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Behaviour"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[-1, 0, 1], ["Disabled","Classic", "Vector-based"], 2]
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_freelook", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Freelook Trick","Make sure to set up your controls correctly and have a coefficient set for aiming. Helps to center the weapon when aiming down sights."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Behaviour"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false
] call CBA_fnc_addSetting;

[
    "PCT_lookfix_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Mouse Turning Coefficient","How much mouse movement should affect the rotation of the view before reaching the edge of the deadzone."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Strength"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.5, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookfix_aim_coef", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Mouse Turning Coefficient (Aiming)","How much mouse movement should affect the rotation of the view before reaching the edge of the deadzone, while aiming."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Strength"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_allow_vertical", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Allow Vertical Smoothing","Warning! This tilts your entire player model. Use at your own risk."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Vertical Smoothing"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_vertical_cap", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Vertical Smoothing Cap","Higher values cause more obvious issues. Try and match the setting to your deadzone size."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Vertical Smoothing"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 15, 0, 0] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

[
    "PCT_lookFix_RTZ", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Return to Zero","Corrects for misaligned weapon visuals when aiming down sights."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Vertical Smoothing"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true
] call CBA_fnc_addSetting;

[
    "PCT_lookfix_RTZ_constant", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Return To Zero Rate","How quickly to bring the weapon back into alignment."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Aiming Deadzone Fix", "Vertical Smoothing"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.01, 0.5, 0.1, 2] // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_fnc_addSetting;

