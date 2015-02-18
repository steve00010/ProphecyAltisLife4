StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "nosidechat.sqf";
[] execVM "scripts\zlt_fastrope.sqf";
[] spawn life_fnc_autoSave;

StartProgress = true;
