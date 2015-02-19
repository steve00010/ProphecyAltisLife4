

if (playerSide == west) then
{
	if(uniform player == "U_Rangemaster") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\Marshall_uniform.jpg"];
	};

	if(uniform player == "U_B_CombatUniform_mcam_worn") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\senior_shirt.paa"];
	};
	
	if(uniform player == "U_B_HeliPilotCoveralls") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\pilot_uniform.jpg"];
	};
	
	if(uniform player == "U_B_CTRG_1")  then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\cop\P_Uniform_SWAT.paa"];
	};
	
	if(uniform player == "U_B_CTRG_3")  then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\cop\dea.paa"];
	};	
};

case independent:
{
	if(backpack _unit == "B_Carryall_mcamo") then {
		if (_propagate) then {
			[[_unit, "textures\uniforms\mediccarryall.paa",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
		} else {
			[_unit, "textures\uniforms\mediccarryall.paa",backpack _unit] call life_fnc_ReTexBackpack;	
		};
	};

	switch (uniform _unit) do 
	{
		case "U_B_CombatUniform_mcam_worn": 
		{
			if (_propagate) then {
				[[_unit, "textures\uniforms\medic_uniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
			} else {
				[_unit, "textures\uniforms\medic_uniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
			};
		};
	};
};

// Make Backpack invisible
if ( (playerSide == independent) or (playerSide == west) ) then
{
	if(backpack player != "") then 
	{
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};
if (playerSide == civilian) then {
	if (uniform player == "U_C_WorkerCoveralls") then {
		player setObjectTextureGlobal [0,"textures\uniforms\prisoner_uniform.jpg"];
	};
};