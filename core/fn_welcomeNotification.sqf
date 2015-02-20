/*
	File: fn_welcomeNotification.sqf
	by BB-MaTriX
	Description:
	Called upon first spawn selection and welcomes our player.
*/

private["_display","_rules"];

["images\introvid.ogv"] spawn BIS_fnc_titlecard;
createDialog "life_vidintro";
disableSerialization;
_di = findDisplay 230222;
_text = _di displayCtrl 2302;
[_text] spawn {
	disableSerialization;
	_text1 = _this select 0;
	while{(isNil "BIS_fnc_titlecard_finished")} do {
		_text1 ctrlSetStructuredText parseText "<t color='#0099FF' size='2'>Loading character information from the Server</t>";
		sleep 7;
		_text1 ctrlSetStructuredText parseText "<t color='#0099FF' size='2'>Loading character information from the Server</t><br /><br /><br /><t color='#D60D0D' size='2'>Initialising load...</t>";
		sleep 4;
_text1 ctrlSetStructuredText parseText "";
	};
	if(!(isNil "BIS_fnc_titlecard_finished")) exitWith {};
	
};

waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
closeDialog 0;
titleText ["", "BLACK FADED", 0];


createDialog "life_server_rules";

_display = findDisplay 2300;
noesckey = (findDisplay 2300) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 
_rules = _display displayCtrl 2302;
_news = _display displayCtrl 2303;


_message = "";
_message = _message + "<t align='center' size='2' shadow='1' color='#0099FF'>Prophecy Gaming </t><br /><br />";
_message = _message + format["Welcome <t color='#0099FF'>%1</t> to <a href='http://ProphecyGaming.co.uk' color='#0033CC'>Prophecy Gaming Altis Life</a>!<br /><br />",name player];
_message = _message + "We are a serious Roleplay server and require you to read and accept the rules found at<a href='http://Propechygaming.co.uk/rules' color='#0033CC'> www.propechygaming.co.uk/rules</a> otherwise you will not be able to join or will end up banned!<br /><br />";
_message = _message + "We are here to make sure you have a good time so feel free to explore the server and website to find all our features!<br /><br />";
_message = _message + "Contact an Admin or Community Suport member for assistance at any time should you need it!<br /><br /><br />";
_message = _message + "But most of all have fun!";
_rules ctrlSetStructuredText parseText format["%1",_message];




_news ctrlSetStructuredText parseText format["
<br/><t size='1.1' color='#0099FF'>  Useful Info%1</t><br/><br/>
<t size='0.8px'>- Be sure to put your money into your bank to keep it safe</t><br/>
<t size='0.8px'>- Guides and updates can be found on our website, <a href='http://ProphecyGaming.co.uk' color='#0033CC'>Prophecy Gaming</a></t><br/>
<t size='0.8px'>- Enter your player id (not name) on our members section to get info about your character.</t><br/>
<t size='0.8px'>- Press Y to access your player interaction menu.</t><br/>
<t size='0.8px'>- We have a top 10 bounty list on our webpage.</t><br/>
<t size='0.8px'>- Gangs are permanent, that's why they cost so much.</t><br/>
<t size='0.8px'>- We have drug addiction and you can be breathalysed.</t><br/>
<t size='0.8px'>- Join our community, we are always looking for new players.</t><br/>
<t size='0.8px'>- Please report any bugs on our forums.</t><br/>
<br/><br/><t size='0.7px'>   Have fun playing!</t>
",":"];