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
			class init_lookFixer{
                postInit = 1;
            };
		};
    };
};

class Extended_PostInit_EventHandlers {
	class LF{
		init = "call PCT_fnc_init_lookFixer";
	}		
};

