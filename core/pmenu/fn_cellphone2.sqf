/*
File: fn_cellphone2.sqf
Author: Timo
 
Description:
With no radio cant use Cellphone
*/
 
 
if("ItemRadio" in assignedItems player) then {
createDialog "Life_cell_phone"; 
}else{
hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>No CellPhone</t><br/><br/>
<t size='0.90 'font='puristaLight' align='left'>You must have a Smartphone (Radio) to send a message . You can buy a Smartphone in the General store</t><br/>"];
};