#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_vdFoot = viewDistance;
life_vdCar = viewDistance;
life_vdAir = viewDistance;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false; 
life_markers = false;
life_drug_level = 0;
life_used_drug = [0,0,0];
life_drug_withdrawl = false;
life_addiction = [0,0,0];
life_cocaine_effect = false;
life_fatigue = 0.4; //Set the max fatigue limit (50%)
life_request_timer = false;
life_drink = 0;
life_smartphoneTarget = ObjNull;

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = LIFE_SETTINGS(getNumber,"total_maxWeightT");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

life_istazed = false;
life_vehicles = [];
life_nlrtimer_stop = false;
life_nlrtimer_running = false;

//CUSTOM
life_xp = 0;
life_level = 1;
life_xpneeded = 1;

life_god = false;
life_frozen = false; 
life_markers = false;
life_drug_level = 0;
life_used_drug = [0,0,0];
life_drug_withdrawl = false;
life_addiction = [0,0,0];
life_cocaine_effect = false;
life_isdowned = false;
buy_array=[];
sell_array=[];
life_carjob_taken = false;
life_carjob_type = "";
life_carjob_name = "";
life_carjob_pay = 0;
life_carjob_finished = -3600;

switch (playerSide) do {
	case west: {
		BANK = 500000; //Starting Bank Money
		life_paycheck = 800; //Paycheck Amount
	};
	
	case civilian: {
		BANK = 500000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
	
	case independent: {
		BANK = 500000;
		life_paycheck = 800;
	};	
	
    case east: {
		life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 800; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));
