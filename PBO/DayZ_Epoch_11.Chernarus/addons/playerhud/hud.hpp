/*
	AsReMix Player HUD File - Zupa Single Currency Edit - Lots of thanks to AsRemix.
*/

#define hud_status_idc 4900


class AsReMixhud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "AsReMixhud";
	onLoad = "uiNamespace setVariable ['AsReMixhud', _this select 0]";
	
	class controlsBackground {

		class AsReMixhud_Status:Hw_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
    x = safezoneX + (safezoneW -0.35) ;
	y = safezoneY + 0.10 * safezoneW;
			w = 0.35; h = 0.35;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};

	};
};
