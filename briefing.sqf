waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					The official change log can be found on the BIS forums (search Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Custom Change Log",
				"
				1. BASIC SERVER RULES

					ALL RULES ARE SUBJECT TO CHANGE AT ANY TIME
					No attempting to find cracks within the rules or using excuses to operate within them. Use common sense.
					Do not play Altis Life if you are not prepared to lose things from time to time, people make mistakes, this is also a game, try to remember that when talking to a player.
					All Admin Decisions / Judgements / Punishments are final. If you disagree with the outcome, you must contest this using the official ban appeal procedure, A server founder can over-ride any Admin decision at any time.
					This is a role-play server. You must role-play. Failing to do so is a serious offence and will most likely result in your removal from server. Using bare minimal RP to justify anything is not allowed. This includes the classic 2 seconds to put hands on head or die - This may lead to removal from server depending on administrative judgement.
					Use respectable names.
					No voice over side chat/police squad chat.
					No RDM/VDM. Ever. Just because someone RDMed you does not mean you can RDM them back. 2 wrongs do not make a right and if you seek revenge you may be subject to punishment also. If you are the victim of this you must report it.
					Combat logging is never allowed. If you disconnect whilst in the middle of a fire-fight/restrained/in active RP it will be considered combat logging. If you genuinely D/C, you must make every effort to get back to the area as soon as possible and tell the person you was RPing with. If you die, you must wait until you re-spawn before disconnecting. If a kidney is removed from you for a genuine role play reason. You MUST NOT Re-spawn/kill yourself. You must make every attempt to get a kidney back. Failure to do so is also considered combat logging
					Killing a police Negotiator during negotiations is not allowed.
					You are considered in a critically injured state until you actually re-spawn.
					When claiming a vehicle it will only be storable in your garage once the server is restarted
					Police Lights and Sirens are not always an Initiation of Role-play, For Example: If the FED Reserve is being robbed and Police are responding to it with lights on, this does not give you the right to shoot on site unless you are involved with the FED. Police Lights and Sirens are only an Initiation of Role-Play if you are directly involved with the incident.

					2. RANDOM DEATHMATCHING & VEHICLE DEATHMATCHING

					Random Death-match (RDM) is defined as:

					Killing anyone in a safe zone
					Killing anyone without a role-play cause or initiation
					Bare minimum RP.
					Cops / Civilians and Rebels can only engage in a shoot-out if there are reasons relating to a Role-play situation.
					Shooting a player without giving reasonable time to follow demands is considered RDM.
					Vehicle Death-match (VDM) is defined as:

					Destroying your vehicle or anyone else's intentionally.
					Crashing into another vehicle.
					Running over people.
					The only time you may ever run over someone is if someone stands in your vehicles way for trolling reasons. In this case, you must stop, sound your horn, ask them to move, and if they continue to refuse you may then slowly move forward. Once you have done all you can to request they move, it is up to the civilian on the road to get out of the way.
					3. SAFE ZONE RULES

					List of current safe-zones:

					Police HQs.
					Hospitals
					Any area with a Green Square Marker
					Rebel base.
					Rules of the safe-zone

					If you leave a vehicle in a safe zone it can be stolen or reclaimed by the player you stole it from, hide it properly / claim it or chop shop it.
					If you come across a vehicle that was stolen from you in your current life (as per NLR) which is in a safe zone, you have the right to attempt to reclaim it by peaceful means. Only vehicles which previously belonged to you can be stolen in a safe-zone. To ensure a peaceful resolution it is sometimes best to contact an Admin.
					No one is to kill anyone inside the safe-zones.
					You are not allowed to Rob or Steal in a Safe-Zone.
					No trolling in the safe-zones. This includes but is not limited to playing music, spam talking and pushing people away from vendors.
					No knocking people out.
					No driving about like an idiot.
					Police may at times arrest those in a safe-zone who are wanted or seen to be committing crimes.
					There will be no shooting in or shooting out of any safe zone. If role-play is initiated outside a safe-zone and you run to one to avoid the role-play, you are breaking rules.
					You may not camp or loiter outside a safe-zone either.
					4. THE NEW LIFE RULE (NLR)

					Civilian New Life Rule

					If you are killed you must wait 15 minutes before returning to the scene of your death.
					If you die during role-play your past crimes are forgotten, but you also cannot seek revenge.
					If you are RDM'd, it is not a new life.
					If you are VDM'd, it is not a new life.
					If you manually re-spawn, it is not a new life.
					If you die in a main city, you may not re-spawn inside that city. If you die outside of a city, you must keep 1km clear of that area.
					Police New Life Rule

					If you are killed you must wait 15 minutes before returning to the scene of your death with more than 6 cops on
					If you are killed you must wait 5 minutes before returning to the scene of your death with less than 6 cops on
					If you are RDM'd, it is not a new life
					If you are VDM'd, it is not a new life
					If you manually re-spawn, it is not a new life
					5. ROADBLOCKS/WAR/HOSTAGE/FED RULES/TERRITORY

					Roadblocks

					There are 2 fortified roadblocks on the map. Although they are technically police checkpoints, they can be used when unmanned by the police. If you decide to take over one of these checkpoints, you must initiate RP. You may enforce road tolls/taxes, however if someone pays the charge you place on it, then you must let them pass. Don\'t be an asshole, if someone decides to pay, let them pay and allow them to be on their way.	If you take a check point, you may not just shoot someone randomly from within it. Likewise, if you see someone manning the checkpoint, you may not shoot at them while they are inside it without initiating RP. If police are manning the checkpoint and you enter it/ are seen to be avoiding it, They are within right to search you, your vehicle and also check your licenses.
					Declaring War

					You may declare war on the government institution of Altis which is represented by the police. To do so, you need to have a valid reason that has actually occurred. Using reasons such as \"High Taxes\" are invalid because you are not actually taxed. Things like Police corruption and police brutality are reasons, only however if you or your affiliates have suffered police brutality or feel a victim from an action caused by police corruption.
					War is not a reason to shoot unarmed civilians or medics, is it not to be used as a free for all.
					If you die in a war, you do not return to the city until the war is over.
					When declaring war, you must state your intentions on side chat, text your intentions via police message and have a minimum of 6 people to declare war.
					After declaring war, you must wait 10 minutes. This is to allow police forces to prepare and to allow civilians to get to safety.
					You may not declare war with no intention to do so. This means that you may not use a deceleration of war as a distraction for you to do the fed etc.
					War can only be declared once in each town every server restart
					You may not rob the federal reserve whilst war has been declared and vice versa
					Gangs must give a minimum of 5 minutes notice to the police or the gang who's territory they are attacking
					You are not allowed to persistently camp a Gangs territory.You may loiter in the area for a minimum of 10 minutes without RP or Combat before you must leave the area entirely.
					At least 5 cops must be on-line to declare war
					Hostage Rules

					If the demands are reached, you must release the hostage and not harm the hostage further.
					You must not harm the police negotiator, however he can be taken hostage in an extreme situation.
					You must keep in mind that while taking/being taken hostage may be a good RP event, the player being held will be unable to do anything and after a while this may lead to an unpleasant gaming experience. After 30 minutes, provided the hostage is going to go offline, he or she may request to leave.
					You must not make unreasonable demands. Below is a list in what can be paid out for hostages.
					Taking a civilian hostage and telling them to give you money from their ATM is classed as RDM
					Killing a civilian who is complying with your demands is RDM

					Civilian: $25,000 - $50,000
					Marshall: $35,000 - $60,000
					Corporal: $40,000 - $65,000
					Sergeant: $45,000 - $70,000
					Lieutenant: $55,000 - $80,000
					Captain: $65,000 - $90,000
					Chief: $80,000 - $125,000
					Total Maximum payout (For multiple hostages) : $300,000
					Fed reserve Rules

					A minimum of 6 cops must be on-line to do rob the Federal Reserve
					Robbing the fed when not enough cops on to open the vault is considered bug abusing and could result in a ban
					Shoot on sight is allowed from rebels on cops and vice versa, only within the compound.
					If you die at the federal reserve as a civ/rebel you may not return for that restart duration
					6. AVIATION RULES

					Civilian Aviation

					When a properly declared attack is under-way, the attackers may hover in a helicopter, as they are attacking something, but only in the immediate area
					Repeatedly flying over areas with police to annoy them will be considered  trolling. Trolling is against the server rules.
					Excessive flybys in any situation will not be allowed. It causes lag on other players and disrupts game-play.
					Intentionally causing a collision with a helicopter into anything; i.e. other helicopters, vehicles, buildings, will be treated as VDM
					Flying below 250m over the city constantly. Once is illegal, more than that you risk crashing into the city, thus against server rules
					Police Aviation

					No helicopter can land within city limits without authorization from the highest ranking officer on-line
					Unless you have completed pilot training, you may not fly without authorisation from the highest rank on-line.
					Helicopters cannot fly below 250m over the city or safe zone without authorization
					Helicopters cannot hover over the city. Cops may only hover over the city if there is an active police operation going on
					7. COMMUNICATION RULES

					In game text/phone/voice rules.

					No voice on side.
					No spamming of any kind.
					Always be respectful.
					No playing music.
					If you intend on killing someone, you must interact vocally with them. Initiating RP with the intent of killing someone must not be done on the phone.
					No excessive abuse. Semi-violent RP is okay within reason, blatantly abusing someone is not.
					Team-speak rules

					Team-speak channels are split up into areas for a reason. Cops must be in the cop channels at all times.
					Be respectful.
					No channel hopping.
					No spamming of links in channels.
					No linking offensive material.
					Civilians cannot be in any cop channels on team-speak
					8. FERES ARENA

					Feres Arena is a sectioned off free fire zone. You may kill or be killed within the walls limits.
					RDM/VDM does not apply here.
					You may not shoot out of the arena / shoot into the arena from the outside.
					During certain events, this zone will be closed to the public.
					During certain events, admins will spawn special weapons into the game for use in the arena only. This equipment must be checked out upon leaving. Also, attempting to smuggle this equipment out of the arena will result in a ban.
					9. REBEL RULES:

					If you are wearing rebel clothing in Kavala / Pyrgos only, police have the right to shoot (but not kill) and detain on sight.
					In Athira / Sofia you have the right to be there whilst wearing rebel clothing but you may be moved on at police officers discretion. However you must not have any illegal weaponry on show. If you do police may arrest you. Make sure it is hidden (In your backpack etc)
					If you purchase a rebel license you will only be able to spawn at rebel outpost and houses you have purchased
					Despite being rebels, members must still adhere to all other server and role-play rules
					Rebels are NOT allowed to shoot civilians or Police officers on sight. This is still considered RDM and the Rebel licence does not exclude you from this. Role Play MUST always be undertaken, either via Direct Comms or via SMS
					Rebel territory belongs to the rebels. Police are allowed to enter and all rules/law still apply. However police will be shot on sight if they enter the boundaries displayed on the map
					No form of Kill on Sight is allowed. Role-play must always be attempted first. Do yourself a favour and send a message, shouting at a player 100m away will not be accepted
					Robbing a gas station with the sole intent of luring cops in to kill them is counted as RDM along with "robbing" the station from several hundred meters away
					The rebel off-road is a rental only vehicle. If the police impound it, it will not return to your garage. Cops may destroy vehicles at the higher ranking officers discretion.
					10. ARC Rules

					When you load into ARC you need to purchase a license, this is your operator license and gives you the right to carry your weapon in towns and cities and drive ARC vehicles, you will also need to buy a Silver and Crystal License to manufacture ARC materials , if you are found to be using these things without the license you can be jailed by the police and your contract revoked.
					If we are fired upon at any time, we have the right to defend ourselves, but we cannot shoot first, Or Commit any Crimes.
					We are a Logistics Company and that is our Primary concern, we only assist the Police when asked directly to do so by them contacting us on our messaging service. We do not take the Law into our own hands.
					We are provided weapons to defend ourselves. And they are to be used as defence only, we are allowed to carry our weapons in any area of Altis as long as they are on our backs and the safety is on and we hold the ARC License.
					We are provided with uniforms and marked vehicles. And we are only allowed to be on active duty while in these vehicles or wearing our uniform (Please remember to sync data, no excuses for not).
					As a Member of ARC it is your responsibility to aid the citizens of Altis by using the equipment available to you, this means you are required to tow vehicles, repair vehicles and provide security at ARC and Heritage sites.
					You can request Wanted lists from the Police and pursue criminals at the will of the Police, failure to notify the Police before Hunting a wanted Criminal can result in your contract being revoked.
					If you detain a criminal or kill a wanted criminal it is to be reported to the Police immediately, so any wanted level obtained on yourself can be validated and pardoned, you will need to provide evidence of your actions.
					Anyone that is not ARC who is found in the Wildlife Grounds, Silver mine or Crystal mine, Heritage sites (this includes Kavala Castle) is considered to be Trespassing, it is your job to move them on and if they do not comply you can detain them and deliver them to the Police.
					11. POLICE RULES:

					Core Rules
					ROLEPLAY!
					Not in any case will you break role-play, you also should not be acting as an Admin or Moderator. Deal with people breaking the LAW not the RULES.
					Example for not role-playing: Put your hands up we have guns pointed at you then turn around and start spraying everyone down. Act like you would in real life. Rambo is not real.
					Be reasonable. Always listen to things being said to you. Sending someone to jail will most likely cost them a lot of money and potentially their rebel license.
					Any police officer is to follow orders from higher ranking officers at all times. Police Hierarchy must be uphold at all times.When not agreeing with the officer in charge, first do it, talk and question afterwards.
					Police officers are to always wear their proper Gear given to them by ranking up. Wearing gear not suited for your rank is strictly prohibited. Higher ranked gear is only allowed when issued to you by a higher ranking officer as a reward.
					Police officers always need probable cause to pull over, question or restrain a citizen. Example for probable cause: See a truck driving from the weed fields, you can pull them over to search their truck for drugs.
					All active cops must be in TeamSpeak within the police channels.
					Police can call on the assistance of the Logistics Company ARC and the Armed Hellcat if they feel overwhelmed, if Rebels are using an Armed Off-road or if they have major Air superiority that ground units can not deal with, The Hellcat can be flown at any time of the day but the weapons should only ever be used in extreme circumstances or if Ordered by a Captain or above.
					Police may raid the houses within a town as long as they provide at least 5 minutes warning to the respective Player.
					The following speeds are to be enforced by the Altis Police Force for the absolute safety of the citizens of Kavala and all travelling beyond the city.

					Inside major cities:
					Small roads: 50km/h
					Main roads: 65km/h

					Outside major cities:
					Small roads: 80km/h
					Main roads: 110km/h
					Role-play
					As a member of the Prophecy Gaming Police Department you will try to uphold the law to the best of your abilities. Do not use your position as a cop to deal with server rules and issues. If in any case you break any server rules yourself, you will be dealt accordingly like every other player on the server. If you see any player breaking server rules, you will have to come up with proof like every other player on the server.

					Use your position as a cop to set the good example for everyone on the Prophecy Gaming 
					server. Always role-play, and never abuse your position of power.

					Interaction and Arresting Citizens
					All interaction with any kind of citizen will always go by PGPD RP rules.
					If any citizen breaks any law they will be held responsible and dealt with accordingly.

					Dealing with law breaking citizen:
					Tell them to stop what they are doing. Give them the opportunity to surrender peacefully.
					If they are unwilling to comply, you are allowed to use necessary force to bring them in.
					Clearly tell them what & why you’re doing and what will happen next.
					Vehicle Traffic law & Summary Offences:
					When a Vehicle Traffic law has been broken or a Summary Offence has been committed, issue the suspect the appropriate ticket and give them opportunity to pay. If they refuse 2x you can send them to jail. Clearly tell them why they are being sent to jail.

					Indictable Offense:
					Once arrested they will be taken to a Police HQ for processing. After committing a Felony the criminal will be sent to jail. Jail time will depend on the height of the bounty.
					$0 (no bounty) = 15minutes in jail
					$1 - $24.999 = 20minutes in jail
					$25.000 - $49.999 = 25minutes in jail
					$50.000 and higher = 30minutes in jail
					Paying a ticket will set the bounty price to $0, paying actually decreases your jail time! Give them the opportunity to request Coffee and Donuts before sending them off to jail (no 
					need to offer). For roleplay purposes ticket prices can be negotiable, going to jail however is not negotiable.

					Tickets & Bounty’s
					All tickets paid after any crime will go directly into the bank account of the officer dealing with the case. All bounty prices will be added to the bank account of the officer who sends he criminal to jail. For every crime Ticket & Bounty prices are the same.

					Reviving
					Police officers can revive another officer once every 15 minutes, the same as medic rules. Seriously injured criminals can be revived in order to arrest them. Cops however are not medics and will not travel across the map to provide medical assistance.

					Impounding Vehicles
					Any vehicle that appears to be left behind can be impounded by the police. Whether or not the vehicle should be impounded is judged by the highest ranking officer on scene.
					- Do not impound any vehicles while active roleplay is initiated.
					Vehicles used in criminal activities can be destroyed at the discretion of the highest ranking police officer on at the time.

					Team-speak
					You do not mute your speaker on Team-speak. When clear comms are needed let everyone know! You do mute your microphone when speaking in game. This can easily be done in the 
					Team-speak settings: SETTING > OPTION > HOTKEYS > Set:
					CAPSLOCK (down) - MUTE MICROPHONE
					CAPSLOCK (up) - UNMUTE MICROPHONE
					12. MEDIC RULES:

					You may only revive a player once in a 15 minute time scale
					You cannot pick up or wear any equipment that is not available to you in the medic store. This includes weaponry/clothing etc
					You must be in the medic teamspeak channel at all times
					Cops should be revived before rebels. Although you are not to take sides, you must allow police to restore order to an area. Reviving rebels while in a fire fight cops would not help and as such, during an active fire-fight you should see police permission before entering an active combat zone.
					You may not give out information such as enemy position to other players. Doing this will be seen as meta gaming and may result in your removal from the server.
					12. FAQ

					What can I be banned for?

					Prophecy gaming staff members may issue out bans for the following reasons.
					Hacking / Cheating / Exploiting / Glitching / Duping
					RDM & VDM
					EMS are NOT to be killed, attacked or taken hostage without RP reason.
					Racism (We operate a zero tolerance policy on racism and racial slurs)
					Abuse
					Trolling
					Collective Admin Discretion
				"
		]
	];


	
