class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		/*
		class life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.92; h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.92; h = 0.6 - (22 / 250);
		};
		*/
		class backgroundpic: Life_RscPicture
		{
			idc = -1;
			text = "images\skullbg.paa";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.1; y = 0.14;
			w = 0.92; h = (1 / 25);
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
			x = 0.3625; 
			y = 0.10;
			w = 0.55; 
			h = 0.04;
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.373; 
			y = 0.16;
			w = 0.55;
			h = 0.62;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.075; y = 0.22;
			w = 0.2625;
			h = 0.7;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0.4, 0, 0, 0.7};
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.373;
			y = 0.82;
			w = 0.55;
			h = 0.04;
		};
	};
};