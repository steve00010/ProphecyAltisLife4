

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
		player setObjectTextureGlobal [0,"textures\uniforms\pilot_uniform.paa"];
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

if (playerSide == independent) then
{
	if((backpack player) == "B_Carryall_mcamo") then {
		
		(unitBackpack player) setObjectTextureGlobal [0,"textures\uniforms\mediccarryall.paa"];
	};

	if(uniform player == "U_B_CombatUniform_mcam_worn") then
	{
		player setObjectTextureGlobal [0,"textures\uniforms\nhsuniform.paa"];
	};
	
};

if (playerSide == east) then
{
	if(uniform player == "U_B_CombatUniform_mcam_worn") then {
		player setObjectTextureGlobal [0,"textures\uniforms\arcsenior.paa"];
	};	
		
	if((backpack player) == "B_Carryall_mcamo") then {
		
		(unitBackpack player) setObjectTextureGlobal [0,"textures\uniforms\arccarryall.paa"];
	};
};	

// Make Backpack invisible
if (playerSide == west) then
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
	if(uniform player == "U_C_Poloshirt_blue") then {
		if(call life_donator > 0) then {
			player setObjectTextureGlobal [0,"textures\uniforms\PG1.paa"];
		};
	};
	if(uniform player == "U_C_Poloshirt_burgundy") then {
			player setObjectTextureGlobal [0,"textures\uniforms\PG.paa"];
	};
	if(uniform player == "U_C_Poloshirt_salmon") then {
		if(call life_donator > 0) then {
			player setObjectTextureGlobal [0,"textures\uniforms\msi.paa"];
		};
	};
	if(uniform player == "U_C_Poloshirt_redwhite") then {
		if(call life_donator > 0) then {	
			player setObjectTextureGlobal [0,"textures\uniforms\ironman.paa"];		
			
		};
	};
	if(uniform player == "U_C_Poloshirt_stripped") then {
		if(call life_donator > 0) then {
			player setObjectTextureGlobal [0,"textures\uniforms\hfh.paa"];
		};
	};
};