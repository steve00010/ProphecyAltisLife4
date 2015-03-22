#include <macro.h>
/*
	File: fn_getThiefJob.sqf
	Author: Steve - ProphecyGaming.co.uk
	Description: Gives a Thief Job for the player
*/

if(!license_civ_reb) exitWith { hint "You need to be a rebel!";};
if(carjob_taken) exitWith { hint format["You already have a job! Bring me a %1!",carjob_name];};
_cartype = random 3;
switch (_cartype) do
{
	case 0:
	{
		carjob_taken = true;
		carjob_type = "C_Offroad_01_F";
		carjob_name = "Bitchin Offroad";
		_pay = (random 3) + 2)*10000;
		carjob_pay = _pay;
		titleText[format["Bring me a %2 and ill pay yah $%1!",_pay,carjob_name],"PLAIN"];
	}
	case 1: {
		carjob_taken = true;
		carjob_type = "C_SUV_01_F";
		carjob_name = "Slammin SUV";
		_pay = (random 3) + 2)*10000;
		carjob_pay = _pay;
		titleText[format["Bring me a %2 and ill pay yah $%1!",_pay,carjob_name],"PLAIN"];	
	}
	case 2: {
		carjob_taken = true;
		carjob_type = "C_Hatchback_01_sport_F";
		carjob_name = "Beasty Hatchback Sport";
		_pay = (random 4) + 3)*10000;
		carjob_pay = _pay;
		titleText[format["Bring me a %2 and ill pay yah $%1!",_pay,carjob_name],"PLAIN"];	
	}
	case 3: {
		carjob_taken = true;
		carjob_type = "B_Heli_Light_01_F";
		carjob_name = "Gorgeous Hummingbird";
		_pay = (random 8) + 5)*10000;
		carjob_pay = _pay;
		titleText[format["Bring me a %2 and ill pay yah $%1!",_pay,carjob_name],"PLAIN"];	
	}
}

