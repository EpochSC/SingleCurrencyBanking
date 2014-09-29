#define hud_status_idc 4900

class HW_RscText_Zupa {
	idc = -1;
	type = 0;
	style = 0x02;
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.023;
	colorBackground[] = { 1, 1, 1, 0.3 };
	colorText[] = { 0, 0, 0, 1 };
	x = 0.8;
	y = 0.1;
	w = 0.2;
	h = 0.05;
};


class AsReMixhud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "AsReMixhud";
	onLoad = "uiNamespace setVariable ['AsReMixhud', _this select 0]";

	class controlsBackground {

		class AsReMixhud_Status:HW_RscText_Zupa
		{
			idc = hud_status_idc;
			type = 13;
			size = 0.040;
            x = safezoneX + (safezoneW -0.35);
        	y = safezoneY + 0.05 * safezoneW;
			w = 0.35; h = 0.60;
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