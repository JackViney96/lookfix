class CfgPatches {
	class lookFix {
		units[] = {}; 
		weapons[] = {}; 
        requiredAddons[] = {"Extended_EventHandlers"}; 
		requiredVersion = 0.1; 
	}; 
};

class CfgFunctions 
{	
	class PCT
	{
		tag = "PCT";
		
		class PCT_lookfix
		{
			file = "lookfix\functions";
			class lookFixer_init{};
            class lookFixer_settings{};
		};
    };
};

class Extended_PostInit_EventHandlers {
	class lookFixer_init{
		init = "call PCT_fnc_lookFixer_init";
	}		
};

class Extended_PreInit_EventHandlers {
    class lookFixer_settings {
        init = "call PCT_fnc_lookFixer_settings";
    };
};

