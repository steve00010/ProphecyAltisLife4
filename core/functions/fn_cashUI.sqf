#include <macro.h>
[] spawn
{
	#define IDD_LIFE_MAIN_DISP 2203
	#define IDC_pbh_life_cash_TEXT 1003


	#define LIFEdisplay (GVAR_UINS ["playerHUD",displayNull]) 
	#define LIFEctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)

	disableSerialization;
	while {true} do
	{
		if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
		LIFEctrl(IDC_pbh_life_cash_TEXT) ctrlsetText format["$%1", [CASH] call life_fnc_numberText];
	};
	sleep 3.5;//save some cpu
};