"Crash" by Phil Riley

Include Data Structures by Dannii Willis.

Include Basic Screen Effects by Emily Short.
Include Inanimate Listeners by Emily Short.

Include Epistemology by Eric Eve.
Include Conversation Framework by Eric Eve.
Include Conversation Responses by Eric Eve.
Include Bulk Limiter by Eric Eve. 
Include Adaptive Hints by Eric Eve.
Include Exit Lister by Eric Eve.

Include Essentials by Philip Riley.

DEBUG is initially false.

Release along with a website.
Release along with an interpreter.
Release along with cover art.
Release along with a library card.

The story title is "Crash".
The story author is "Phil Riley".
The story genre is "Science Fiction".
The release number is 4.
The story description is "A routine maintenance job becomes a harrowing mission in deep space!"
The story creation year is 2022.

[When play begins:
	Now the command prompt is "[if current interlocutor is something](talking to [the current interlocutor]) [end if]>";
	]

Use the American dialect and the serial comma.

Book 1 - The Beginning

Explosion Happened is a truth state that varies. 

Rule for printing the banner text when Explosion Happened is false: do nothing.

To scatter belongings:
	now wallet is in Port-Side Bunks;
	now initial appearance of the wallet is "A leather wallet lies discarded on the ground.";
	now dusting device is on port-side top right bunk;
	now sonic decontaminator is in Port-Side Bunks;
	now hand-held vacuum cleaner is on port-side right bottom bunk.

Chapter 1 - (for Glulx only)

Include Real-Time Delays by Erik Temple.
Include Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name    	justification    	italic    	indentation    	first line indentation    	font weight    	color
special-style-1    	--    	--    	--    	--    	--    	"#FF0000"
special-style-2    	--    	--    	--    	--    	--    	"#00FF00"

Every turn when Explosion Happened is false and location is Crew Quarters and accessible is false:
	if debug is false:
		say ">[run paragraph on]";
		wait for any key;
	now Explosion Happened is true;
	say "BOOM -- suddenly everything goes to hell. A bulkhead seems to hurtle towards you...[line break]";
	if debug is false, wait 1500 ms before continuing;
	say "pain...";
	if debug is false, wait 1500 ms before continuing;
	say "confusion...";
	if debug is false, wait 1500 ms before continuing;
	say "[bold type]blackness...[roman type][line break]";
	if debug is false, wait 1500 ms before continuing;
	say "Somehow you're okay. Inertial dampers must have kicked in. Nevertheless, you feel like you were hit by a truck.";
	if debug is false, wait 2500 ms before continuing;
	say "But what happened?[paragraph break]";	
	if debug is false, wait 2500 ms before continuing;
	say "[banner text]";
	if debug is false, wait 3000 ms before continuing;
	now woozy is true;
	scatter belongings;
	now the player is in the port-side right bottom bunk;
	activate the Table of Beginning Hints;
	reject the player's command;	

Every turn when Explosion Happened is false and location is Crew Quarters and accessible is true:
	if debug is false:
		say ">[run paragraph on]";
		wait for any key;
	now Explosion Happened is true;
	say "BOOM -- suddenly everything goes to hell. A bulkhead seems to hurtle towards you...[line break]";
	say "pain...";
	say "confusion...";
	say "[bold type]blackness...[roman type][line break]";
	say "Somehow you're okay. Inertial dampers must have kicked in. Nevertheless, you feel like you were hit by a truck.";
	say "But what happened?[paragraph break]";	
	say "[banner text]";
	now woozy is true;
	scatter belongings;
	now the player is in the port-side right bottom bunk;
	activate the Table of Beginning Hints;
	reject the player's command;	


Chapter 2 - (for Z-Machine Only)


After reading a command when Explosion Happened is false and player's command does not include "restore" and player's command does not include "test" and player is in Crew Quarters:
	now Explosion Happened is true;
	say "BOOM -- suddenly everything goes to hell. The walls of the cabin seem to hurtle towards you...";
	say "[line break]pain...";
	say "[line break]     confusion...";
	say "[line break]            blackness...";
	say "[line break]Somehow you're okay. Inertial dampers must have kicked in. Nevertheless, you feel like you were hit by a truck.";
	say "[line break]But what happened?[paragraph break]";
	say "[red letters][banner text][default letters]";
	now woozy is true;
	scatter belongings;
	now the player is in the port-side right bottom bunk;
	reject the player's command;
	
Chapter 3 - First Moves

Woozy is a truth state that varies.
Turns woozy is a number which varies. Turns woozy is initially 0.

After reading a command when woozy is true and player's command does not include "help" and player's command does not include "test" and player's command does not include "look":
	try looking;
	reject the player's command;

Rule for printing the name of Port-Side Bunks when woozy is true:
	say "Somewhere? (Where?)[run paragraph on]";
	
Instead of looking when woozy is true and turns woozy is 0:
	think "Where am I?";
	increment turns woozy;
	
Instead of doing something other than looking when woozy is true:
	try looking instead;
	
Carry out helping when woozy is true:
	think "I'm having a bit of trouble here. Hang on, I'll get it together. Meanwhile, you could always try 'look' and see what happens.";
	stop the action;
	
Carry out helping with speech when woozy is true:
	think "I'm having a bit of trouble here. Hang on, I'll get it together. Meanwhile, you could always try 'look' and see what happens.";
	stop the action;
	
Instead of looking when woozy is true and turns woozy is 1:
	think "What? Didn't get that. My brain is spinning too much. Try again.";
	increment turns woozy;
	
Instead of looking when woozy is true and turns woozy is 2:
	say "[bold type][port-side bunks][roman type] (lying on something comfortable)[paragraph break]";
	if accessible is false:
		say "Aaa cccc mmmmmmm www aaaa'a ttt ccccccc sssss in this or the opposite-side bunk room. This one ssssss ffff in ttt ssss oo bbbbb, one on the llll aaa ooo oo ttt rrrrr, aaa dddd uu wwww mmmmmmmm ppppppppp. There is a lllll eeeeeeeee ccccccc hhhh, ssssssssss aaaaaa to the ccccccc. Ii ii cccccc.";
	otherwise:
		say "You're not sure what you're looking at.";
	say line break;
	think "Everything's a bit fuzzy.";
	increment turns woozy;
	
After printing the name of the extendable dusting device when just waking up is true:
	say " ";
	think "that's mine" inline;
	
After printing the name of the sonic decontaminator when just waking up is true:
	say " ";
	think "also mine" inline;
	
After printing the name of the vacuum cleaner when just waking up is true:
	say " ";
	think "mine again. I really took a tumble." inline;

just waking up is a truth state that varies.

Instead of looking when woozy is true and turns woozy is 3:
	now woozy is false;
	now just waking up is true;
	say "You come to your senses lying on a bunk, not quite sure how you got here. You seem to have lost your equipment.[paragraph break]";
	follow the declare everything unmentioned rule; [need this because of the lack of an intervening user command, apparently.]
	follow the room description heading rule;
	think "Okay, now things are coming into focus.";
	follow the room description body text rule;
	follow the room description paragraphs about objects rule;
	carry out the writing a paragraph about activity with the wallet;
	think "Ohh my head hurts. What the heck happened? Better get back to the station pronto.";
	now just waking up is false;
	activate table of locker hints;

	
Rule for printing a parser error when woozy is true:
	think "[one of]You're hurting my brain. Wait... who am I talking to?[or]Stop it.[or]Go away.[or]I can't understand anything.[purely at random]";


	
Book 2 - Special Rules and Definitions

Chapter 1 - Directions

Understand the command "a" as something new.

Section 1 - Nautical Directions (in place of "Section SR1/4 - Directions" in Standard Rules by Graham Nelson)

The specification of direction is "Represents a direction of movement, such
as northeast or down. They always occur in opposite, matched pairs: northeast
and southwest, for instance; down and up."

A direction can be privately-named or publicly-named. A direction is usually
publicly-named.
A direction can be marked for listing or unmarked for listing. A direction is
usually unmarked for listing.

A direction has a direction called an opposite.

Include (-
    has scenery, ! class CompassDirection,
-) when defining a direction.


[might want articles here]
The fore is a direction.
The aft is a direction.
The port is a direction.
The starboard is a direction.

[per original]
The up is a direction.
The down is a direction.
The inside is a direction.
The outside is a direction.

Fore has opposite aft. Understand "f" as fore.
Aft has opposite fore. Understand "a" as aft.
Port has opposite starboard. Understand "p" as port.
Starboard has opposite port. Understand "s" as starboard.

[per original]
Up has opposite down. Understand "u" as up.
Down has opposite up. Understand "d" as down.
Inside has opposite outside. Understand "in" as inside.
Outside has opposite inside. Understand "out" as outside.

The inside object translates into I6 as "in_obj".
The outside object translates into I6 as "out_obj".

[fore is a direction.
aft is a direction. The opposite of fore is aft. The opposite of aft is fore.

port is a direction.
starboard is a direction. The opposite of port is starboard. The opposite of starboard is port.

Understand "f" as fore. Understand "a" as aft. 
Understand "p" as port. Understand "s" as starboard. Understand "s" as starboard.

Does the player mean going south: it is very unlikely.

Index map with fore mapped as north. Index map with aft mapped as south.
Index map with port mapped as west. Index map with starboard mapped as east.

A direction can be nautical or earthbound. A direction is usually not nautical. Starboard, port, fore, aft, up, down, the inside and the outside are nautical.

Before going an earthbound direction:
	say "You must use nautical directions: fore, aft, port, starboard, up, down, inside, or outside.";
	stop the action;]
	
To say direction term for (D - a direction):
	if D is fore:
		say "forward";
	otherwise:
		say D;
	
Chapter 2 - Definitions

A thing can be undersided. A thing is usually not undersided.

A room can be pressurized or vacuum. A room is usually pressurized.
A room can be onboard or offboard. A room is usually onboard.

A thing can be flat.
A thing can be translatable. A thing has a number called a page count.

A button is a kind of thing.

A room can be familiar.

VSAC is a number that varies. VSAC is initially 0.
 
Definition: The ship is fixed if the loose circuit board is tightened and the main starboard engine is balanced, and engine output is Liquid Copernicium.
	
Chapter 3 - Relations

Blocking relates various things to one thing. The verb to block (he blocks, they block, he blocked, it is blocked by) implies the blocking relation.

Underlying relates various things to one thing. The verb to underlie means the underlying relation.
The verb to be under means the underlying relation. The verb to be beneath means the underlying relation.

[Instead of looking under a thing which is underlaid by something:	
	say "[We] [find] [the list of things which underlie the noun] and take [them].";
	now every thing which underlies the noun is carried by the player; 
	now every thing which underlies the noun does not underlie the noun. ]

The looking under action has a list of things called the things to take.

Check looking under a thing which is not undersided:
	say "There's nowhere to look under [the noun]." instead;

Carry out looking under a thing which is underlaid by something:
	now the things to take is the list of every thing which underlies the noun;
	now every thing which underlies the noun is in the location;
	now every thing which underlies the noun does not underlie the noun. 
		
Report looking under a thing when the things to take is not empty:
	say "[We] [find] [the things to take with indefinite articles] and move [them] out from under [the noun].";	
	try looking;
	stop;

The standard looking under rule is not listed in any rulebook.
The standard looking under rule is listed last in the report looking under rules.

Chapter 4 - Actions

Section 1 - Dusting

Understand the commands "clean", "dust", and "rub" as something new.

Dusting is an action applying to one thing. Understand "dust [thing]" as dusting.

Check dusting something:
	if player does not carry the extendable dusting device:
		say "[We] [cannot] [dust] without something to dust with." instead;
	if the noun is the extendable dusting device:
		say "[We] [cannot] [dust] the [extendable dusting device] itself." instead;
	if the player carries the noun:
		say "To dust that, [we] [must] [drop] [regarding the noun][it] first." instead;
	If the noun is the player:
		say "[We] [cannot] [dust] [ourselves]." instead;
	
Carry out dusting something:
	say "[We] [extend] [our] [extendable dusting device] and [regarding the player][dust] [the noun] until [it] [shine]... or at least, [look] a bit better.";
	
Section 2 - Cleaning

A thing can be a cleaner.

Cleaning it with is an action applying to two things. Understand "clean [thing] with [thing]" as cleaning it with.

Check cleaning:
	if the noun is the second noun:
		say "[We] [can't] [clean] something with [regarding the noun][themselves]." instead;
	If the second noun is not a cleaner:
		say "[The second noun] is not appropriate for cleaning things." instead;
	If the noun is not dirty:
		say "[The noun] already looks pretty clean." instead;

Check cleaning something with the extendable dusting device:
	try dusting the noun instead;
	
Section 3 - Vacuuming

Vacuuming is an action applying to one thing. Understand "Vacuum [thing]" as vacuuming.

Check vacuuming something:
	if the noun is the captain's door's slot:
		try cleaning the captain's door's slot with the vacuum cleaner instead;
	if player does not carry the vacuum cleaner:
		say "[We] [cannot] [vacuum] without something to dust with." instead;
	if the noun is the vacuum cleaner:
		say "[We] [cannot] [vacuum] the [vacuum cleaner] itself." instead;
	if the player carries the noun:
		say "To vacuum that, [we] [must] [drop] [regarding the noun][it] first." instead;
	If the noun is the player:
		say "[We] [cannot] [vacuum] [ourselves]." instead;
	
Carry out vacuuming something:
	say "[We] [vacuum] [the noun] all over. It looks nice.";
	
Section 4 - Telling About

[Understand the command "tell" as something new.]

[An object has a text called tellme.]

[Telling about is an action applying to one visible thing. Understand "tell me about [any object]" as telling about.
Inquiring about is an action applying to one topic. [Understand "tell me about [text]" as inquiring about].]

[After deciding the scope of the player while telling about a thing (called T):
	if T is familiar:
		place T in scope;]
	
[Carry out inquiring about a topic (called T):
	say "I'm sure I don't know anything about that.";]

[Carry out telling about an object (called T):
	if T is a room:
		If T is not visited and T is not familiar:
			say "I'm sure I don't know anything about that.";
		otherwise if the tellme of T is not "":
			say "[tellme of T][paragraph break]";
		otherwise:
			say "There's not much more I can tell you about [the T].";
	otherwise if T is not familiar:
		say "I'm sure I don't know anything about that.";
	otherwise If the tellme of T is not "":
		say "[tellme of T][paragraph break]";
	otherwise:
		say "There's not much more I can tell you about [the T].";]
		
[Instead of examining something when the description of the noun is "" and the tellme of the noun is not "":
	say "[tellme of the noun][paragraph break]";]
	
[Does the player mean telling about the captain's door's slot: it is very unlikely.]
	
Rule for clarifying the parser's choice when telling about: do nothing.

Chapter 5 - Verbs

To extend is a verb. To dust is a verb. To shine is a verb. To land is a verb. To clean is a verb. To vacuum is a verb.
To insert is a verb. To leave is a verb.

Chapter 6 - Self-Closing Doors
	
Door originally open is a truth state that varies.
Secret flag is a truth state that varies.

To decide whether (O - an object) is near (D - a door):
	if the front side of D is the location of O or the back side of D is the location of O:
		decide yes;
	decide no;

A self-closing door is a kind of door.
A self-closing door has a number called close countdown.

Every turn (this is the close open doors rule):
	Repeat with D running through open self-closing doors:
		If the close countdown of D > 0:
			decrement the close countdown of D;
			if the close countdown of D is 0:
				now D is closed;
				if player is near D:
					say "[The D] slides closed.";					
	
Check opening a self-closing door (called D):
	say "[We] [cannot] just open [the D] with [our] bare hands." instead;
	
Check closing a self-closing door (called D):
	say "[We] [cannot] just close [the D] with [our] bare hands." instead;

Check going through a self-closing door (called D) when D is not open:
	say "The door stays shut as you try to go through it." instead;
	
Carry out going through a self-closing door (called D) when D is open and secret flag is false:
	now door originally open is true;		
	
Carry out going through a self-closing door (called D) when D is open and secret flag is true:
	now secret flag is false;
	
Carry out going through a self-closing door (called D) when D is open:
	now D is closed;
	now the close countdown of D is 0;


Chapter 7 - Starship Doors

A starship door is a kind of self-closing door.
A starship door can be already authorized.
A starship door is scenery.
A starship door is closed.
A slot is a kind of thing. [Every starship door incorporates a card slot.] A slot is part of every starship door. A slot can be dirty.

Sliding it through is an action applying to two things. 
Understand "slide [access card] through/in [slot]" as sliding it through.
Understand "put [access card] in [starship door]" as sliding it through. 
Understand "put [access card] in [slot]" as sliding it through.
Understand "swipe [access card] through/in [slot]" as sliding it through.
Understand "unlock [starship door] with [access card]" as sliding it through (with nouns reversed).
Understand "open [starship door] with [access card]" as sliding it through (with nouns reversed).

Unreadable card exposed is a truth state that varies.

[Does the player mean sliding the military ID card through a slot which is part of a starship door:
	It is unlikely;]

Check sliding the military ID card through a starship door:
	say "You slide the [military ID card] through the slot. The door emits an unpleasant buzz." instead;
	
Check sliding the military card through a slot which is part of a starship door:
	say "You slide [the military ID card] through the slot. The door emits an unpleasant buzz." instead;

Check sliding an access card (called the card) through a starship door (called D):
	say "You slide [the card] through the slot. [run paragraph on]";
	if D incorporates a slot which is dirty:
		say "The door buzzes three times, indicating the card is unreadable.";
		if unreadable card exposed is false and the card is the maintenance crew access card:
			think "I don't understand. The card worked earlier today."; 
			now unreadable card exposed is true instead;
		otherwise:
			stop the action;
	if the card is not the matching card of D:
		say "The door emits an unpleasant buzz." instead;
	if D is open:
		say "The door is already open." instead;
	Now door originally open is false;
	
Check sliding an access card (called the card) through a slot (called S) which is part of a starship door:
	try sliding the card through a random thing incorporating S;
	
Check going through a starship door (called D) when D is not open and D is already authorized:
	now door originally open is false;
	now secret flag is true;
	now D is open;
		
Carry out sliding an access card (called the card) through a starship door (called D) when D is closed:
	now D is open;
	now the close countdown of D is 3;

Carry out going through a starship door (called D) when D is not open and D is already authorized:
	do nothing;
	now the close countdown of D is 0;
	
To say authorize (D - a starship door):
	now D is already authorized;

Report sliding an access card through a starship door (called D) when door originally open is false:
	say "[The D] slides smoothly open[if D is not already authorized]. A pleasant ping indicates it now recognizes you as authorized[authorize D][end if].";
	
Report going through a starship door (called D) when D is already authorized and door originally open is false:
	say "[The D] opens as you approach, and closes silently behind you.";
	
Report going through a starship door (called D) when D is already authorized and door originally open is true:
	say "[The D] closes silently behind you.";
	
An access card is kind of thing. A starship door has an access card called the matching card. The matching card of a starship door is usually the null card. An access card is always flat.
The null card is an access card.

Chapter 8 - Airlocks

An airlock-chamber is a kind of room. An airlock-chamber has a door called the inner-door. An airlock-chamber has a door called outer-door.

An inner airlock door is a kind of door. An inner airlock door has a room called chamber. It is closed and not openable. The description is "This is the door between the airlock chamber and the rest of the ship. It is colored yellow with red warning symbols on it."
An outer airlock door is a kind of door. An outer airlock door has a room called chamber. It is closed and not openable. The description is "This is the door between the airlock chamber and the rest of the ship. It is colored white with red warning symbols on it."
	
Check opening an inner airlock door (called D):
	say "[We] [cannot] just open [the D] with [our] bare hands." instead;
Check opening an outer airlock door (called D):
	say "[We] [cannot] just open [the D] with [our] bare hands." instead;
	
Check closing an inner airlock door (called D):
	say "[We] [cannot] just close [the D] with [our] bare hands." instead;
Check closing an outer airlock door (called D):
	say "[We] [cannot] just close [the D] with [our] bare hands." instead;

An airlock-pressurize-button is a kind of button. An airlock-pressurize-button has a room called chamber. The description is "Pressing this button will pressurize the airlock chamber."
An airlock-depressurize-button is a kind of button. An airlock-depressurize-button has a room called chamber. The description is "Pressing this button will depressurize the airlock chamber."
An inner-door-opener-button is a kind of button. An inner-door-opener-button has a room called chamber. The description is "Pressing this button will open the inner door."
An outer-door-opener-button is a kind of button. An outer-door-opener-button has a room called chamber. The description is "Pressing this button will open the outer door."

Check pressing an airlock-pressurize-button when the chamber of the noun is pressurized:
	say "You hear a buzz indicating the airlock chamber is already pressurized." instead;

Check pressing an airlock-pressurize-button when the outer-door of the chamber of the noun is open:
	say "You hear a two short buzzes indicating that the outer door of the airlock chamber is still open." instead;

Check pressing an airlock-pressurize-button when the inner-door of the chamber of the noun is open:
	say "You hear a three short buzzes indicating that the inner door of the airlock chamber is still open." instead;
	
Carry out pressing an airlock-pressurize-button:
	Now the chamber of the noun is pressurized;
	
Report pressing an airlock-pressurize-button:
	Say "You wait several seconds for the door to chime indicating that the chamber is now pressurized.";
	
Check pressing an airlock-depressurize-button when the chamber of the noun is vacuum:
	say "You hear a buzz indicating the airlock chamber is already depressurized." instead;

Check pressing an airlock-depressurize-button when the outer-door of the chamber of the noun is open:
	say "You hear a two short buzzes indicating that the outer door of the airlock chamber is still open." instead;

Check pressing an airlock-depressurize-button when the inner-door of the chamber of the noun is open:
	say "You hear a three short buzzes indicating that the inner door of the airlock chamber is still open." instead;
	
Carry out pressing an airlock-depressurize-button:
	Now the chamber of the noun is vacuum;
	
Report pressing an airlock-depressurize-button:
	Say "You wait several seconds for the chamber to depressurize. You hear a series of three beeps indicating the chamber is now in vacuum.";

Check pressing an inner-door-opener-button when the inner-door of the chamber of the noun is closed:
	If the chamber of the noun is vacuum:
		Say "You hear a buzz indicating that the airlock chamber is in vacuum." instead;
	If the outer-door of the chamber of the noun is open:
		Say "You hear a series of five short buzzes indicating that the outer door of the airlock chamber is open." instead;
	
Carry out pressing an inner-door-opener-button:
	If the inner-door of the chamber of the noun is closed:
		Now the inner-door of the chamber of the noun is open;
	otherwise:
		Now the inner-door of the chamber of the noun is closed;
	
Report pressing an inner-door-opener-button when the inner-door of the chamber of the noun is open:
	Say "The inner door of the airlock slides open.";
	
Report pressing an inner-door-opener-button when the inner-door of the chamber of the noun is closed:
	Say "The inner door of the airlock slides closed.";
	
Check pressing an outer-door-opener-button when the outer-door of the chamber of the noun is closed:
	If the chamber of the noun is pressurized:
		Say "You hear a buzz indicating that the airlock chamber is still pressurized." instead;
	If the inner-door of the chamber of the noun is open:
		Say "You hear a series of five short buzzes indicating that the inner door of the airlock chamber is open." instead;
	
Carry out pressing an outer-door-opener-button:
	If the outer-door of the chamber of the noun is closed:
		Now the outer-door of the chamber of the noun is open;
	otherwise:
		Now the outer-door of the chamber of the noun is closed;
	
Report pressing an outer-door-opener-button when the outer-door of the chamber of the noun is open:
	Say "The outer door of the airlock slides open.";
	
Report pressing an outer-door-opener-button when the outer-door of the chamber of the noun is closed:
	Say "The outer door of the airlock slides closed.";
	
Check pressing an airlock-depressurize-button when the location is aft airlock chamber and the player is not wearing the vac suit:
	Say "You may not be a space marine, but you know enough not to depressurize a chamber when you're not in a vac suit." instead;
	
Check pressing an airlock-depressurize-button when the location is engineering airlock chamber and the player is not wearing the vac suit:
	Say "You may not be a space marine, but you know enough not to depressurize a chamber when you're not in a vac suit." instead;
	
Check taking off the vac suit when the location is vacuum:
	Say "It is recommended to not remove the vac suit until you are in a pressurized environment." instead;
	


Chapter 9 - Equipment Cabinets

A keyhole is a kind of thing. The description is "It's a perfectly ordinary keyhole."

An equipment cabinet is a kind of container. It is scenery. It is enterable. It is closed, locked, lockable, and openable. The description is "The locker features a traditional keyhole and a card slot."

An equipment cabinet can be half-unlocked or fully-locked.
An equipment cabinet has a number called the close countdown.

A slot is part of every equipment cabinet. The slot of an equipment cabinet is fixed in place. 
A keyhole is part of every equipment cabinet.

Instead of unlocking an equipment cabinet with something when the noun is fully-locked:
	say "You are unable to turn the key.";
	
Carry out unlocking an equipment cabinet with something:
	now the close countdown of the noun is 0;
	
Understand "put [military id] in [equipment cabinet]" as sliding it through. 
Understand "put [military id] in [slot]" as sliding it through. 
Understand "slide [military id] through/in [slot]" as sliding it through. 
Understand "swipe [military id] through/in [slot]" as sliding it through. 
Understand "unlock [equipment cabinet] with [military id]" as sliding it through (with nouns reversed).
Understand "open [equipment cabinet] with [military id]" as sliding it through (with nouns reversed).

Unreadable card exposed is a truth state that varies.

Check sliding an access card through a slot (called S) which is part of an equipment cabinet (called EC):
	say "A light on the locker flashes red." instead;

Check sliding the military ID card through an equipment cabinet (called C) when C is unlocked:
	say "The door is already unlocked." instead;
	
Check sliding the military ID card through a slot (called S) which is part of an equipment cabinet (called EC):
	try sliding the military ID card through EC instead;
		
Carry out sliding the military ID card through an equipment cabinet (called C):
	now C is half-unlocked;
	now the close countdown of C is 4;

Report sliding the military ID card through an equipment cabinet:
	say "A green light by the lock starts flashing insistently.";

Every turn (this is the deactivate equipment cabinets rule):
	Repeat with D running through equipment cabinets:
		If the close countdown of D > 0:
			decrement the close countdown of D;
			if the close countdown of D is 0:
				now D is fully-locked;
				if the location of player is the location of D:
					say "[The D] stops flashing green.";

After unlocking an equipment cabinet with something:
	say "[text of the standard report unlocking rule response (A)][paragraph break]";
	try opening the noun;
	deactivate the table of locker hints;


Chapter 10 - The Status Line

Table of Fancy Status
left	central	right
" [Location]"	"[if computer-rebooting is true]REBOOTING[otherwise if emergency-protocols is true]EMERGENCY[end if]" 	"[if end-game is false][turn count - 1] [Turn][otherwise][turns left] [turn] left"
""	"[if woozy is true]Exits: ???[otherwise][exit list][end if]"	""

[Rule for constructing the status line:
     fill status bar with Table of Fancy Status;
     rule succeeds.]

When play begins:
	now status exit table is Table of Fancy Status;

Chapter 11 - Mass and Gravity

A thing has a real number called mass. The mass of a thing is usually 0.0.

Gravity is a number that varies. Gravity is initially 5.

A person has a number called weight limit. The weight limit of the player is 245.

To decide what real number is the total mass of (T - a thing):
	let TM be the mass of T;
	Repeat with X running through the things incorporated by T:
		now TM is TM plus the total mass of X;
	if T is a container:
		Repeat with X running through the things contained by T:
			now TM is TM plus the total mass of X;
	If T is a supporter:
		Repeat with X running through the things on T:
			now TM is TM plus the total mass of X;
	decide on TM;

To decide what real number is the total mass carried by (P - a person):
	let total mass be 0.0;
	Repeat with T running through the things carried by the player:
		now total mass is total mass + the total mass of T;
	Repeat with T running through the things worn by the player:
		now total mass is total mass + the total mass of T;
	decide on total mass;

Check taking a thing (called T):
	let M be the total mass carried by the player plus the total mass of T;
	let W be M * Gravity;
	if W > the weight limit of the player:
		say "You can't carry that much weight.";
		if T is the vac suit:
			tip "The vac suit is very heavy. You may need to drop most of your possessions first.";
		stop the action;
		
To set gravity to (G - a number):
	now Gravity is G;
	let M be the total mass carried by the player;
	let W be M * Gravity;
	if W > the weight limit of the player:
		Say "You're carrying too much weight. You start dropping things. [paragraph break]";
		let drop list be a list of things;
		While W > the weight limit of the player:
			let T be a random thing carried by the player;
			add T to drop list;
			now T is in location of the player;
			now M is the total mass carried by the player;
			now W is M * Gravity;
		say "[the drop list]: Dropped.";


	

Chapter 12 - Scenes

Early Game is a scene. Early Game begins when the player is on the Port-Side bottom right bunk.


Chapter 13 - Thoughts

To think (thought - a text):
	if accessible is true:
		say "You think, '[thought]'";
	otherwise:
		say "[bracket][italic type][thought][roman type][close bracket][paragraph break]";	
	
To think (thought - a text) inline:
	if accessible is true:
		say "(You think '[thought]')";
	otherwise:
		say "[bracket][italic type][thought][roman type][close bracket][run paragraph on]";	

To think thought (N - a number):
	choose the row with an index of N from the Table of Thoughts;
	if triggered entry is false or recurs entry is true:
		think thought entry;
		now triggered entry is true;	

To think thought (N - a number) inline:
	choose the row with an index of N from the Table of Thoughts;
	if triggered entry is false or recurs entry is true:
		think thought entry inline;
		now triggered entry is true;
		
To say think:
	if accessible is true:
		say "(You think '";
	otherwise:
		say "[bracket][italic type]";
	
To say think end:
	If accessible is true:
		say "')";
	otherwise:
		say "[roman type][close bracket]";
	
To say think thought (N - a number):
	think thought N inline;
	
Table of Thoughts
index (number)	recurs (truth state)	triggered (truth state)	thought (text)
1	false	false	"Standing up makes me a little dizzy, oh my."
2	false	false	"Okay now, back to the station -- let's see, I'm in [the Port-Side Bunks], so I need to go starboard and then down..." 
3	false	false	"Holy... the station -- it's gone? Where the hell am I? What am I going to do?"
4	false	false	"Must have flown up there when everything went ka-blooey."
5	false	false	"Not my kind of reading, actually, but what the heck."
6	false	false	"Whatever happened, this was part of it. It's fortunate it didn't penetrate further into the hull."
7	false	false	"My god, so glad to be back inside. I'm never going spacewalking again!"

After exiting when player is in the port-side bunks:
	think thought 1;

Every turn when player is in port-side bunks:
	think thought 2;	
	
Tipped hinting is a truth state that varies.
	
After printing the locale description when location is Crew Quarters and tipped hinting is false:
	tip "You can ask for hints at any time by typing 'hints'.";
	now tipped hinting is true;
	continue the action;

Aft entry visited is a truth state that varies.

Every turn when player is in aft entry and Explosion happened is true (this is the discover station is gone rule):
	now aft entry visited is true;
	think thought 3;
	
Every turn when the player is on starboard-side right top bunk or the player is on starboard-side left top bunk:
	think thought 4;
	
Report taking Stars Magazine:
	think thought 5 inline;

Chapter 14 - Tips

To tip (message - a text):
	if accessible is true:
		say "Tip: [message][paragraph break]";
	otherwise:
		say "[unicode 8658] [message][paragraph break]";
		
Chapter 15 - Speech Transcripts

A person has a list of texts called the speech transcript.

Chapter 16 - Miscellany

A thing can be property of the player. A thing is usually not property of the player.

To say contents of (C - a thing):
	list the contents of C, as a sentence, tersely, not listing concealed items, including contents, giving brief inventory information;

When play begins:
	Repeat with subj running through subjects:
		Now subj is in the room of stuff;

Room of Stuff is a room. "This is where we keep all our stuff.".

The Space Station Omicron-5 is a subject. [The tellme of the space station is "Space Station Omicron-5, military outpost for the Deneb system.".]
The SS Usagi is a subject. [The tellme of the SS Usagi is "The ship you're currently on."]
Captain Jane Mulgrew is a woman. 
The separatists is a subject. Understand "terrorists" as separatists.
New Da Nang is a subject.
subj-rebooting-computer is a subject. The printed name is "rebooting the computer". Understand "rebooting the/-- computer" as subj-rebooting-computer. Understand "reboot" as subj-rebooting-computer. Understand "rebooting" as subj-rebooting-computer.
Incommunicado Mode is a subject.
Access key is a subject.


Check taking a thing (called T) when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check taking a thing (called T) when the player is in something (called C) and T is not in C and T is not carried by the player:
	say "You can't reach [the T] from [the C]." instead;
	
Check looking under a thing (called T) when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check looking under a thing (called T) when the player is in something (called C) and T is not in C and T is not carried by the player:
	say "You can't reach [the T] from [the C]." instead;
	
Check opening a thing (called T) when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check opening a thing (called T) when the player is in something (called C) and T is not in C and T is not carried by the player:
	say "You can't reach [the T] from [the C]." instead;
	
Check closing a thing (called T) when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check closing a thing (called T) when the player is in something (called C) and T is not in C and T is not carried by the player: 
	say "You can't reach [the T] from [the C]." instead;
	
Check unlocking a thing (called T) with something when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check unlocking a thing (called T) with something when the player is in something (called C) and T is not in C and T is not carried by the player:
	say "You can't reach [the T] from [the C]." instead;
	
Check locking a thing (called T) with something when the player is on something (called S) and T is not on S and T is not carried by the player:
	say "You can't reach [the T] from [the S]." instead;

Check locking a thing (called T) with something when the player is in something (called C) and T is not in C and T is not carried by the player:
	say "You can't reach [the T] from [the C]." instead;
	
Definition: a thing is in vacuum if the location of it is vacuum and the location of it is a room.		

Every turn while player is in vacuum and player is not wearing the vac suit (this is the second check vacuum rule):
	if player is not in a container:
		say "You are in vacuum. We'll spare you the details, but it isn't a pretty way to go.";
		end the story saying "You have died";

Every turn while player is in vacuum and player is wearing the vac suit and the turns of air left of the vac suit is 0 (this is the third check vacuum rule):
	say "You are out of air in your vac suit. Should have paid attention to the warnings.";
	end the story saying "You have died";

Rule for deciding whether all includes things contained in something while taking: it does not.
		
The unsuccessful persuasion of inanimate objects rule is not listed in any rulebook.

Check asking something (called T) about a topic when T is not a person and T is not the ship computer and T is not the data terminal:
	say "Talking to [the T] is unlikely to prove rewarding." instead;

Check quizzing something (called T) about something when T is not a person and T is not the ship computer and T is not the data terminal:
	say "Talking to [the T] is unlikely to prove rewarding." instead;
	
Check asking the data terminal about a topic:
	say "Ask the computer instead." instead;
	
Check quizzing the data terminal about something:
	say "Ask the computer instead." instead;
	
[Help is a subject.
Instead of requesting the ship computer for help:
	try quizzing the ship computer about the ship computer;]
	
Understand "ask the/-- ship/-- computer for help" as a mistake ("Try 'computer, help' instead.").

Does the player mean asking the data terminal about a topic: 
	it is very unlikely;
	
Does the player mean quizzing the data terminal about something: 
	it is very unlikely;

Book 3 - Locations

Doors are usually scenery.

Chapter 1 - The Bridge

The Bridge is a room. "This is where the captain, navigator, and pilot all sit. Large viewscreens give a full view of the space around the ship. [view of space].

The pilot's and navigator's chairs sit before their respective consoles. The captain's chair, with command console, sits halfway between them and operations further aft."

To say view of space:
	if turns left < 10 and end game is happening:
		say "To port you can see the huge blue-white disk of Deneb. Ahead, the moon New Da Nang looms steadily larger and larger before you"; 
	otherwise:
		say "To port you can see the huge blue-white disk of Deneb. Astern you can faintly see the fading embers of what was Space Station Omicron-5";

The pilot's chair is a supporter in The Bridge. It is scenery. It is enterable. "Simple yet comforable, meant to keep a tired marine going through a long shift." Understand "pilot chair" as pilot's chair.
The navigator's chair is a supporter in The Bridge. It is scenery. It is enterable. "Simple yet comforable, meant to keep a tired marine going through a long shift." Understand "navigator chair" as navigator's chair.
The captain's chair is a supporter in the bridge. It is scenery. It is enterable. "Functional yet comfortable, it is every inch the chair of a commander. On the arm of the captain's chair is the command console, with which the captain commands the ship computer.". Understand "captain chair" as captain's chair.
The command console is a part of the captain's chair. The description is "The command console displays the red outline of a hand." Understand "captain's/captain console" as command console. 

The viewscreen is scenery in the bridge. Understand "viewscreens" as viewscreen. The description of the viewscreen is "[view of space].".

Player aware of melted helm is a truth state that varies.

To say state of pilot's access panel:
	If the pilot's access panel is closed:
		say "which is closed. A hex-shaped aperture is probably the locking mechanism";
	otherwise if protocols-activated is false:
		say "which is open, revealing a maze of wiring and circuit boards";
	otherwise:
		say "which is open, revealing a fused mass of wiring and circuit boards";	
		now player aware of melted helm is true;

To say state of navigator's access panel:
	If the pilot's access panel is closed:
		say "which is closed. A hex-shaped aperture is probably the locking mechanism";
	if the pilot's access panel is open:
		say "which is open, revealing a maze of wiring and circuit boards";
		
The loose circuit board is inside the pilot's access panel. It is scenery. "It's unremarkable, other than the fact that it seems to have come loose. It needs to be screwed back into its slot."
The loose circuit board can be tightened;
		
After closing the pilot's access panel:
	now the pilot's access panel is locked;
	continue the action;

Before tying the loose board to something:
	say	"That doesn't seem right. Try 'fix [the loose board] with <something>' instead if you're trying to fix [the loose board].";
	stop the action;
	
Check fixing the loose board with something that is not the shortened hook :
	say "I can't figure how to do that." instead;

Check fixing the loose board with the ceiling hook:
	say "The screw end of the hook is too long. You can attach the board, but you can't close the access panel." instead;
	
Carry out fixing the loose circuit board with the shortened hook:
	now the loose circuit board is tightened;
	now the shortened hook is nowhere;
	try silently closing the pilot's access panel;

Report fixing the loose circuit board with the shortened hook:
	say "Done. You tighten up the loose circuit board with the hook, and close the access panel.";

The pilot's console is a thing in the bridge. It is scenery. "The pilot's console is a sloped table covered with cryptic readouts and touch controls. In the back is an access panel [state of pilot's access panel].". Understand "pilot console" as pilot's console.
The pilot's access panel is a container which is a part of the pilot's console. It is closed, locked, and openable. It has carrying capacity 0. The pilot's access panel has matching key the hex-shaped tool. The description is "The access panel is a rectangle of the same plastic that makes up the console. There is a hex-shaped keyhole in it." Understand "pilot access/-- panel" as pilot's access panel.

The broken screw is a thing. The description is "It's an ordinary screw, except it's missing part of its length."

After opening the pilot's access panel:
	if protocols-activated is true:
		say "Opening [the pilot's access panel] reveals a fused mass of wiring and circuit boards. It's ruined beyond repair."; 
		now player aware of melted helm is true;
	otherwise:
		say "Opening [the pilot's access panel] reveals an array of wiring and circuit boards. One of the boards is loose[first time]. You soon see why as a broken screw falls out of the access panel and onto the floor[only].";
		if the broken screw is nowhere:
			now the broken screw is in the bridge;

Check inserting something into the pilot's access panel:
	say "[text of the can't insert into what's not a
	container rule response (A)][line break]" instead;

The navigator's console is a thing in the bridge. It is scenery. "The navigator's console is a sloped table covered with cryptic readouts and touch controls.". Understand "navigator console" as navigator's console.


Check inserting something into the pilot's access panel:
	say "[text of the can't insert into what's not a
	container rule response (A)][line break]" instead;

After examining the command console for the first time:
	tip "You can 'touch command console' to touch your palm to it.";

After examining the command console for the second time:
	tip "You can 'touch command console' to touch your palm to it.";
	
Instead of touching the command console:
	print "The ship computer sounds particularly stern. 'Unauthorized access attempted. This event has been logged by security.'[line break]" as ship computer near captain's chair;
	
Instead of answering the ship computer that something when location is the bridge:
	print "'Please present hand print to command console in order to activate command mode.'[line break]" as computer near captain's chair;
	
Instead of informing the ship computer about something when location is the bridge:
	print "'Please present hand print to command console in order to activate command mode.'[line break]" as computer near captain's chair;
	
Instead of telling the ship computer about something when location is the bridge:
	print "'Please present hand print to command console in order to activate command mode.'[line break]" as computer near captain's chair;

Computer-rebooting is a truth state that varies.
Emergency-protocols is a truth state that varies.

After deciding the scope of the player when location is Bridge and computer-rebooting is false:
	place Ship Computer in scope;
	
Understand "ask [something] about [any known thing]" as quizzing it about.

Check quizzing ship computer about something when location is bridge:
	print "'Information queries should be made using the Captain's Terminal in the Captain's Quarters.'[line break]" as ship computer near captain's chair instead; 

Check asking ship computer about something when location is bridge:
	print "'Information queries should be made using the Captain's Terminal in the Captain's Quarters.'[line break]" as ship computer near captain's chair instead; 
	
Rebooting is an action applying to nothing. Understand "reboot" as rebooting.

Persuasion rule when asking the ship computer to try doing something other than helping and location is bridge:
	print "'Please present hand print to command console in order to activate command mode.'[line break]" as computer near captain's chair;
	persuasion fails;

Check player rebooting:
	say "You can't reboot yourself." instead;

Reboot-countdown is a number that varies.

Repressurize countdown is a number that varies.

To evacuate air:
	say "The emergency depressurization siren sounds throughout the ship.";
	think "Nice of Mulgrew to warn me.";
	Repeat with R running through pressurized rooms:
		if R is not Aft Airlock Chamber and R is not Engineering Airlock Chamber:
			now R is vacuum;
	
Every turn while repressurize countdown > 0:
	decrement repressurize countdown;
	if repressurize countdown is 0:
		say "The depressurization siren stops.";
		repressurize;

To repressurize:
	Repeat with R running through vacuum rooms that are onboard:
		if R is not Aft Airlock Chamber and R is not Engineering Airlock Chamber:
			now R is pressurized;

End-game is a truth state that varies.

End Game is a scene. End Game begins when end-game is true.
turns left is a number that varies.

When End Game begins:
	if protocols-activated is true:
		activate the table of self-destruct hints;
		activate the table of winning hints;
		activate the table of helm hints protocols;
		activate the table of surviving self-destruction hints;
	otherwise:
		activate the table of winning hints;
		activate the table of helm hints reboot;
		activate the table of fuel injection hints;
		activate the table of starboard engine hints;
	
Every turn during end game:
	decrement turns left;
	if turns left is 0:
		crash;
	otherwise if turns left is 11:
		say "An alarm sounds and the ship's computer shouts, 'Warning, collision with New Da Nang imminent.'[line break]";
	otherwise if turns left < 11:
		say "'Impact in [turns left].'";
		
To crash:
	if location is bridge:
		say "You watch helplessly as the SS Usagi slams into the Little New York neighborhood of New Da Nang. Several acres of buildings are flattened, killing thousands of people.";
		end the story saying "You have died in ignominious failure.";
	otherwise:	
		say "You never see it happen. The SS Usagi slams into the Little New York neighborhood of New Da Nang. Several acres of buildings are flattened, killing thousands of people.";
		end the story saying "You have died in ignominious failure.";

Computer-rebooted is a truth state that varies.
Protocols-activated is a truth state that varies.
Protocols-in-progress is a truth state that varies.

Definition: the engine diagram is rebooted if computer-rebooted is true or protocols-activated is true.

Every turn while computer-rebooting is true:
	decrement reboot-countdown;
	if reboot-countdown is 0:
		now computer-rebooting is false;
		now turns left is 120;
		now end-game is true;
		now computer-rebooted is true;
		print "The ship's computer announces, 'Reboot complete.'[paragraph break]" as computer near desk;
	if the player is not wearing the vac suit or the turns of air left of the vac suit is 0:
		if reboot-countdown is 4:
			say "The air in here has gotten a bit stale.";
		if reboot-countdown is 3:
			say "You're starting to feel faint.";	
		if reboot-countdown <= 2:
			say "You pass out.[paragraph break]
			...[paragraph break]";	
			if DEBUG is false:
				tip "press any key to continue.";
				wait for any key;
			now computer-rebooting is false;
			now turns left is 100;
			now end-game is true;
			talk about cs-end-game-reboot;
			now computer-rebooted is true;
			say "When you awake, your head is throbbing and you have no idea how much time has passed.";
			think "I wonder what's going on?";
		
Persuasion rule for asking the ship computer to try rebooting:
	if logged in as arvax is false and logged in as mulgrew is false:
		print "'Authorization required.'[line break]" as ship computer near desk;
		persuasion fails;
	persuasion succeeds;

Carry out ship computer rebooting:
	Now computer-rebooting is true;
	talk about cs-end-game-reboot;
	Now reboot-countdown is 5;
	
Report ship computer rebooting:
	print "The ship's computer announces, 'Beginning reboot. Take all appropriate precautions.'[paragraph break]" as computer near desk;
	say "Red alert lights flash throughout the ship.";
	
After ship computer rebooting:
	Deactivate Table of Trust hints;
	Continue the action;
	
Invoking emergency protocols is an action applying to nothing. Understand "invoke emergency protocols" as invoking emergency protocols. Understand "emergency protocols" as invoking emergency protocols.
		
Persuasion rule for asking the ship computer to try invoking emergency protocols:
	if logged in as mulgrew is false:
		print "'Authorization required.'[line break]" as ship computer near desk;
		persuasion fails;
	persuasion succeeds;
	
Check player invoking emergency protocols:
	say "That's something you'll have to ask the computer to do." instead;
		
Carry out ship computer invoking emergency protocols:
	Now protocols-in-progress is true;
	talk about cs-end-game-protocols;
	Now reboot-countdown is 4;
	print "The ship's computer announces, 'Beginning emergency protocols. Take all appropriate precautions.'[paragraph break]" as computer near desk;
	say "Red alert lights flash throughout the ship.";
	
After ship computer invoking emergency protocols:
	Deactivate the Table of Trust Hints;
	Continue the action;

Every turn while protocols-in-progress is true:
	decrement reboot-countdown;
	if reboot-countdown is 0:
		now protocols-in-progress is false;
		now turns left is 80;
		now end-game is true;
		now protocols-activated is true;
		now loose circuit board is nowhere;
		repressurize;
		print "The ship's computer announces, 'Emergency protocols complete.'[line break]" as computer near desk;
	if reboot-countdown is 3:
		evacuate air;
		now repressurize countdown is 2;		
	

Chapter 2 - Operations

Operations is aft of the Bridge. "This is where all of the support activity for the bridge occurs. There are large consoles for environmental controls, communications, and power systems here. The bridge continues forward from here, and engineering is aft. There is a door set in the floor with a ladder leading through it. Set in the frame of the door is a blue button.".

Fore blue button is a button in operations. It is scenery. "It's a blue button."

The equipment trunk is a container in Operations. The equipment trunk blocks the Fore/Aft Door. It is closed, locked, and lockable. "A large equipment trunk lies on the Fore/Aft door, blocking it." The mass of the equipment trunk is 150. The bulk of the equipment trunk is 101. The description is "It's a large black trunk with an electronic lock. You need the correct code to open it."

The environmental console is a thing in Operations. It is scenery. The description is "[The environmental console] contains the controls that deal with the comfort of the occupants, including temperature, pressure, and gravity. [description of the gravity control]".

The communications console is a thing in Operations. It is scenery. The description is "[The communications console] is used for all communications, including long-range subspace and short-range radio communications.". Understand "comms" as the communications console.

The power systems console is a thing in Operations. It is scenery. The description is "[The power systems console] controls the power for the entire craft allowing, for instance, for power to be rerouted away from non-essential systems and to more essential systems such as life support or defensive systems."

Instead of examining fore/aft door when location is operations:
	say "[description of fore/aft door] Set in the frame of the door is a blue button."

Section 1 - Environmental Console

The gravity control is a part of the environmental console. The description is "The gravity dial is set to [gravity].". Understand "gravity/-- dial" as gravity control.

The block setting it to rule is not listed in the check setting it to rulebook.

Check setting the gravity control to a topic:
	let S be 0;
	if the topic understood matches “[number]”:
		now S is the number understood;
	if S < 1 or S > 20:
		say "You can only set gravity to an integer between 1 and 20." instead;
	continue the action;
	
Check setting something to a topic when the noun is not the gravity control:
	say "[We] [can't set] [regarding the noun][those] to anything." instead;
	
Carry out setting the gravity control to a topic:
	set gravity to the number understood;
	
Report setting the gravity control to a topic:
	say "You dial the gravity to [gravity].";
	
Section 2 - Communications Console

Deneb III Naval Command is a room. "This is a dummy description.".

Master Sergeant R Mu Arvax is a man. The printed name is "[if arvax is familiar]Master Sergeant R. Mu Arvax[otherwise]caller[end if]". He is in Deneb III Naval Command. He is improper-named.

Last-turn-count-remote-speech-printed is a number that varies;

To decide what text is the direction description of (dir - a direction):
	if dir is fore: 
		decide on "forward of here";
	if dir is aft:
		decide on "aft of here";
	if dir is up:
		decide on "above";

To print (speech text - a text) as (speaker - a thing) near (locale - a thing) with transcript (T - a truth state):
	let X be number of moves from the location to the location of the locale, using even locked doors;	
	let ST be the substituted form of speech text;	
	if locale is in the location:
		say ST;
	otherwise if X is 1 and last-turn-count-remote-speech-printed is not turn count:
		let BR be best route from the location to the location of the locale, using even locked doors;
		say "You [if the location is galley]faintly [end if]hear someone speaking [the direction description of BR].";
		now last-turn-count-remote-speech-printed is turn count;
	Now the last utterance of the speaker is ST;	
	if T is true and speaker is a person:
		Add ST to the speech transcript of the speaker;	

To print (speech text - a text) as (speaker - a thing) near (locale - a thing):
	if speaker is not a person:
		print speech text as speaker near locale with transcript false;
	otherwise:
		print speech text as speaker near locale with transcript true;

After deciding the scope of the player when location is Operations:
	choose the row with conv-state of current conversation state from the Table of People in Scope;
	if arvax in scope entry is true:
		place arvax in scope;
	if mulgrew in scope entry is true:
		place mulgrew in scope;
	
Instead of examining Master Sergeant R Mu Arvax:
	Say "[The Master Sergeant Arvax] is not here.";
	
Instead of examining Captain Mulgrew:
	Say "[Captain Mulgrew] is not here.";

Before doing something to Arvax:	
	if "[action name part of current action]" is "asking it about":
		continue the action;		
	if "[action name part of current action]" is "answering it that":
		continue the action;		
	if "[action name part of current action]" is "informing it that":
		continue the action;				
	if "[action name part of current action]" is "telling it about":
		continue the action;		
	if the action requires a touchable noun and the noun is arvax:
		say "You can't touch [the arvax].";
		stop the action;
	if the action requires a touchable second noun and the second noun is arvax:
		say "You can't reach [the arvax].";
		stop the action;

Before doing something to Captain Mulgrew:	
	if "[action name part of current action]" is "asking it about":
		continue the action;		
	if "[action name part of current action]" is "answering it that":
		continue the action;		
	if "[action name part of current action]" is "informing it that":
		continue the action;				
	if "[action name part of current action]" is "telling it about":
		continue the action;		
	if the action requires a touchable noun and the noun is Captain Mulgrew:
		say "You can't touch [Captain Mulgrew].";
		stop the action;
	if the action requires a touchable second noun and the second noun is Captain Mulgrew:
		say "You can't reach [Captain Mulgrew].";
		stop the action;
	
Table of People in Scope
conv-state (conversation state)	arvax in scope (truth state)	mulgrew in scope (truth state)
null state	false	false
making contact	true	false
establishing the situation	true	false
waiting for yes	true	false
mulgrew breaks in	false	true
asking mulgrew questions	true	true
cs-end-game-reboot	true	false
cs-end-game-protocols	true	false


[see Arvax communications section elsewhere]

Section 3 - The Equipment Trunk

A thing can be pushable. The equipment trunk is pushable.

Check pushing the equipment trunk:
	[If the mass of the equipment trunk * Gravity > the weight limit of the player:
		Say "[The equipment trunk] [are] too heavy for [us] to move." instead;]
	If the equipment trunk is not blocking the fore/aft door:
		Say "[The equipment trunk] [are] already out of the way." instead;
	continue the action;

Check pushing something which is not pushable:
	Say "There's no point to pushing the [the noun] around." instead;
	
Check pushing something which is not touchable:
	Say "You can't touch [the noun]." instead;

Carry out pushing the equipment trunk when the equipment trunk is blocking the fore/aft door: 
	now the equipment trunk is not blocking the fore/aft door.

Report pushing the equipment trunk when the equipment trunk was blocking the fore/aft door:
	say "You clear the door.";
	now equipment trunk is handled;
	stop;

Chapter 3 - Engineering

Engineering Deck is aft of Operations. "The engineering crew is responsible for keeping the physical ship operating. They are in charge of every physical aspect of the ship, from the engines to hull integrity to the life support system. 

The engineering deck consists of a large console giving a comprehensive view of the physical status of the ship. There is an airlock to starboard. The operations deck continues forward from here, and there are other exits to aft and port.

Near the console is a large cabinet with a card slot. [if the engineering cabinet is open]It is open.[otherwise]It is closed.[end if]

On your right is a control panel for the airlock. It consists of a green button to pressurize the airlock chamber, a yellow button to depressurize it, a red button to open and close the inner airlock door, and a blue button to open and close the outer airlock door.";

Understand "put [engineering access card] in [engineering cabinet]" as sliding it through. 
Understand "put [engineering access card] in [slot]" as sliding it through. 
Understand "slide [engineering access card] through/in [slot]" as sliding it through. 
Understand "swipe [engineering access card] through/in [slot]" as sliding it through. 

The engineering cabinet is a container in engineering deck. It is scenery. It is closed, openable, and locked. "About six feet high, four feet wide, and two feet deep, this is a bright yellow container affixed to the port bulkhead. There is a card slot on the right side about four feet high."
The engineering cabinet slot is a slot which is part of the engineering cabinet. The description is "A typical card slot, not unlike those found in other parts of this ship."

The engineering console is scenery in engineering deck. "This stuff is absolutely incomprehensible to the layman. Dials, gauges, readouts, and touchscreens of every conceivable variety cover the console."

There is a hex-shaped tool in the engineering cabinet. Understand "hex tool" as the hex-shaped tool. 

The description of the hex-shaped tool is "It's got a long handle like a screwdriver, but the end is a hexagon with some complex-looking ridges on it.".

Instead of sliding the engineering access card through the engineering cabinet slot:
	Now the engineering cabinet is unlocked;
	Now the engineering cabinet is open;
	say "[We] slide the [engineering access card] through the slot and the [engineering cabinet] swings open, revealing [contents of the engineering cabinet].";
	
The suit recharging station is here. It is an enterable supporter. "A device labeled 'Suit Recharging Station' is here. It is shaped like a chair with nozzles protruding from either arm." The description is "It looks like a person might sit in it."

Instead of entering the suit recharging station when the player is not wearing the vac suit:
	say "You sit in the suit recharger, but nothing happens. You stand up again.";

Instead of entering the suit recharging station when the player is wearing the vac suit:
	if turns of air left of the vac suit < 50:
		say "The nozzles on either side of the chair connect with the suit. After a few moments, the machine emits a pleasant 'ping', the nozzles retract, and you stand up.";
		now turns of air left of the vac suit is 50;
		deactivate the table of recharge hints;
	otherwise:
		say "The nozzles on either side of the chair connect with the suit. Apparently, the suit is already full, for the machine immediately emits a pleasant 'ping' and the nozzles retract. You stand up.";
	
After going to Engineering Deck for the first time:
	activate the table of recharge hints;
	continue the action;
	
After printing the locale description of the Engineering Deck:
	think thought 7; 
		

Chapter 4 - Engineering Airlock

The Engineering Airlock Chamber is an airlock-chamber.

The engineering airlock inner door is an inner airlock door. It is starboard of Engineering Deck and port of Engineering Airlock Chamber. The chamber of engineering airlock inner door is engineering airlock chamber. The engineering airlock inner door is not scenery.
The engineering airlock outer door is an outer airlock door. It is outside from Engineering Airlock Chamber and inside from Spacewalk 3. The chamber of engineering airlock outer door is Aft Airlock Chamber. The engineering airlock outer door is not scenery.

Engineering Red Interior Button is an inner-door-opener-button in Engineering. It is scenery. The printed name is "red button". The chamber of the Engineering red interior button is Engineering airlock chamber.
Engineering Blue Interior Button is an outer-door-opener-button in Engineering. It is scenery. The printed name is "blue button". The chamber of the Engineering blue interior button is Engineering airlock chamber.
Engineering Green Interior Button is an Airlock-Pressurize-Button in Engineering. It is scenery. The printed name is "green button". The chamber of the Engineering Green Interior Button is Engineering Airlock Chamber.
Engineering Yellow Interior Button is an Airlock-Depressurize-Button in Engineering. It is scenery. The printed name is "yellow button". The chamber of the Engineering Yellow Interior Button is Engineering Airlock Chamber.

The inner-door of the Engineering airlock chamber is Engineering airlock inner door.
The outer-door of the Engineering airlock chamber is Engineering airlock outer door.

Rule for writing a paragraph about the Engineering Airlock Inner Door:
	say "[The Engineering airlock inner door] [are] [if closed]closed[otherwise]open[end if].";

Rule for writing a paragraph about the Engineering Airlock outer Door:
	say "[The Engineering airlock outer door] [are] [if closed]closed[otherwise]open[end if].";


Section 1 - Engineering Airlock Chamber

To say exit description for engineering airlock chamber:
	If engineering airlock inner door is open:
		Say ". You can go to port into the ship";
	Otherwise if engineering airlock outer door is open:
		Say ". You can go out of the airlock into space";
	Otherwise:
		Say ". Both doors are closed; you'll have to open one to leave the airlock";

The description of Engineering Airlock Chamber is "You are in the Engineering airlock chamber. You're one door away from the great void of space[exit description for engineering airlock chamber]. 

On your right is a control panel for the airlock. It consists of a green button to pressurize the airlock chamber, a yellow button to depressurize it, a red button to open and close the inner airlock door, and a blue button to open and close the outer airlock door."

Engineering Red Chamber Button is an inner-door-opener-button in Engineering Airlock Chamber. It is scenery. The printed name is "red button". The chamber of the Engineering red chamber button is Engineering airlock chamber.
Engineering Blue Chamber Button is an outer-door-opener-button in Engineering Airlock Chamber. It is scenery. The printed name is "blue button". The chamber of the Engineering blue chamber button is Engineering airlock chamber.
Engineering Green Chamber Button is an Airlock-Pressurize-Button in Engineering Airlock Chamber. It is scenery. The printed name is "green button". The chamber of the Engineering Green Chamber Button is Engineering Airlock Chamber.
Engineering Yellow Chamber Button is an Airlock-Depressurize-Button in Engineering Airlock Chamber. It is scenery. The printed name is "yellow button". The chamber of the Engineering Yellow Chamber Button is Engineering Airlock Chamber.
	
Instead of going outside when location is the engineering airlock chamber and the engineering airlock inner door is open:
	try going port;

Instead of going inside when location is engineering and engineering airlock inner door is open:
	try going starboard;

Chapter 5 - Engine Room and Engine Chambers

The Engine Room is aft of the Engineering Deck.

The description of Engine Room is "Though no engines are actually in this room, it is where the combustion process is controlled. Monitoring electronics and controls cover the walls. A wide doorway opens forward to the Engineering Deck, and small portals to port and starboard provide access to the two engine chambers. The main engine, which drives the two side engines, is beyond the aft wall.

There is a large diagram of the fuel injection process on the aft wall. There is a large button below the diagram labeled 'Test'.";

The engine diagram is in the Engine Room. It is scenery. The description is "This is a diagram of the fuel injection process for the main engine. Printed above it is the label 'Delphi Engine Controls Aleph-Null'. Below that is a representation of the various inputs and the products created during the fuel injection process. Each input has a touch-sensitive surface which can be used to alter the diagram's settings."

The test button is a button in the engine room. It is scenery. "A square, red button with large capital letters saying 'TEST'."

Test sequence countdown is a number that varies;

Instead of pressing the test button when the engine diagram is not rebooted:
	say "Nothing happens.";

Instead of pressing the test button:
	if test sequence countdown is not 0:
		say "There is already a test sequence in progress.";
	otherwise:
		say "A voice says 'Fuel test sequence beginning...'";
		now test sequence countdown is 11;
		now destruct in progress is true;

To end game suicide:
	say "The Void Matter is injected into the main engine, causing an explosion that rips the ship apart. You are never aware of this, however, as you are instantly vaporized. If you had been aware, you would certainly have been pleased to know that your death saved the people of New Da Nang.";
	end the story saying "You have died nobly.";

Every turn while test sequence countdown > 0:
	decrement test sequence countdown;
	say "'[test sequence countdown]'[paragraph break]";
	if test sequence countdown is 0:
		if ship is in self-destruct mode:
			end game suicide;
		otherwise if engine output is Liquid Copernicium:
			say "A voice says 'Fuel test sequence successful.'";
		otherwise:
			say "A voice says 'Fuel test sequence failed.'";

Section 1 - Engine Puzzle

A substance is a kind of thing. A substance has a text called symbol. A substance can be inputtable.
An input is kind of thing.

Injection Recipes is a map of any to substance that varies.
Engine Inputs is a map of input to substance that varies.

product-1 is a substance that varies.
product-2 is a substance that varies.
product-3 is a substance that varies.

To decide what substance is engine output:
	decide on product-3;

To say first input:
	if get key input 1 of Engine Inputs is some let X be the value:
		say symbol of X;
	otherwise: 
		say symbol of Empty-space;

To say second input:
	if get key input 2 of Engine Inputs is some let X be the value:
		say symbol of X;
	otherwise: 
		say symbol of Empty-space;

To say third input:
	if get key input 3 of Engine Inputs is some let X be the value:
		say symbol of X;
	otherwise: 
		say symbol of Empty-space;

To say fourth input:
	if get key input 4 of Engine Inputs is some let X be the value:
		say symbol of X;
	otherwise: 
		say symbol of Empty-space;
	
To say first product:
	say symbol of product-1;
	
To say second product:
	say symbol of product-2;
	
To say third product:
	say symbol of product-3;

To decide what substance is injection of (s1 - a substance) into (s2 - a substance):
	let reagents be s1 and s2 as a couple;
	if get key reagents of Injection Recipes is some let X be the value:
		decide on X;
	decide on Empty-space;
	
To decide what substance is the injection of (i1 - an input) into (i2 - an input):
	if get key i1 of Engine Inputs is some let X be the value:
		If get key i2 of Engine Inputs is some let Y be the value:
			Decide on injection of X into Y;
	decide on Empty-space;

To decide what substance is the injection of (i1 - an input) into (s1 - a substance):
	if get key i1 of Engine Inputs is some let X be the value:
		Decide on injection of X into s1;
	Decide on Empty-space;

To calculate products:
	now product-1 is the injection of input 2 into input 1;
	now product-2 is the injection of input 3 into product-1;
	now product-3 is the injection of input 4 into product-2;
	
diagram tipped is a truth state that varies.

To say fuel pipeline description:
	if engine output is Liquid Copernicium:
		say "FUEL INJECTION SPECIFICATION VALID";
	otherwise if engine output is Void Matter:
		say "WARNING: DANGEROUS INJECTION PRODUCT";
	otherwise:
		say "FUEL INJECTION SPECIFICATION INCOMPLETE";
		
Instead of examining engine diagram when engine diagram is not rebooted:
	say "The diagram screen is black.";

Instead of examining engine diagram when accessible is false and engine diagram is rebooted:
	now Anti-Helium is familiar;
	now Liquid Copernicium is familiar;
	now Oganesson is familiar;
	now Red Matter is familiar;
	now Tachyon Crystals is familiar;
	now Unobtainium is familiar;
	now Void Matter is familiar;
	now Delphi Engine Controls Aleph-Null is familiar;
	say description of the engine diagram;
	say line break;         
	calculate products;
	say fixed letter spacing;
	say line break;
	say "       Input: 2 [second input]  3 [third input]  4 [fourth input][line break]";
	say "                ||    ||    ||[line break]";
	say "             ===vv====vv====vv===[line break]";
	say "Input 1:     [first input] >> [first product] >> [second product] >> [third product]  Output[line break]";
	say "             ====================[paragraph break]";
	say "        [fuel pipeline description][paragraph break]";
	say "Key:    --   empty input or output[line break]";
	say "        AH   Anti-Helium[line break]";
	say "        LC   Liquid Copernicium*[line break]";
	say "        Og   Oganesson[line break]";
	say "        RM   Red Matter            [line break]";
	say "        TC   Tachyon Crystals[line break]";
	say "        Un   Unobtainium[line break]";
	say "        VM   Void Matter*[line break]";
	say line break;
	say "        * this substance can only be produced, not input.";
	say variable letter spacing;
	if diagram tipped is false:
		say line break;
		tip "Use 'substance > input' to set each input. For instance, 'Un > 3' sets input 3 to Unobtainium. You may also use 'set <input> to <substance>' for the same effect. Use 'disconnect <input>' to disconnect an input.";
		now diagram tipped is true;
		
To decide what substance is first input value:
	if get key input 1 of Engine Inputs is some let X be the value:
		decide on X;
	decide on empty-space;
		
To decide what substance is second input value:
	if get key input 2 of Engine Inputs is some let X be the value:
		decide on X;
	decide on empty-space;
		
To decide what substance is third input value:
	if get key input 3 of Engine Inputs is some let X be the value:
		decide on X;
	decide on empty-space;
		
To decide what substance is fourth input value:
	if get key input 4 of Engine Inputs is some let X be the value:
		decide on X;
	decide on empty-space;
	
To say first input no-ascii:
	let input-1 be first input value;
	if input-1 is empty-space:
		say "unset";
	otherwise:
		say input-1;
	
To say second input no-ascii:
	let input-2 be second input value;
	if input-2 is empty-space:
		say "unset";
	otherwise:
		say input-2;
	
To say third input no-ascii:
	let input-3 be third input value;
	if input-3 is empty-space:
		say "unset";
	otherwise:
		say input-3;
	
To say fourth input no-ascii:
	let input-4 be fourth input value;
	if input-4 is empty-space:
		say "unset";
	otherwise:
		say input-4;
	
Definition: A substance is set if it is not empty-space.
Definition: A substance is unset if it is empty-space.

Instead of examining engine diagram when accessible is true and engine diagram is rebooted:
	now Anti-Helium is familiar;
	now Liquid Copernicium is familiar;
	now Oganesson is familiar;
	now Red Matter is familiar;
	now Tachyon Crystals is familiar;
	now Unobtainium is familiar;
	now Void Matter is familiar;
	now Delphi Engine Controls Aleph-Null is familiar;
	say description of the engine diagram;
	say line break;         
	calculate products;
	say line break;
	say "Input 1 is [first input no-ascii]. [run paragraph on]";
	let input-1 be first input value;
	let input-2 be second input value;
	if input-1 is set and input-2 is set:
		say "Input 2 is [second input no-ascii], which is injected into the first input, producing ";
		if product-1 is set:
			say "[product-1]. [run paragraph on]";
		otherwise:
			say "nothing. [run paragraph on]";
	otherwise if input-1 is set:
		say "Input 2 is unset, so there is no product resulting from inputs 1 and 2. [run paragraph on]";
	otherwise if input-2 is set:
		say "Input 2 is [second input no-ascii]. [run paragraph on]";
	otherwise:
		say "Neither is Input 2 set. [run paragraph on]";
	let input-3 be third input value;
	if product-1 is set and input-3 is set:
		Say "Input 3 is [third input no-ascii], which is injected into the [product-1], producing ";
		if product-2 is set:
			say "[product-2]. [run paragraph on]";
		otherwise:
			say "nothing. [run paragraph on]";
	otherwise if product-1 is set:
		say "Input 3 is unset, so there is no product resulting from the [product-1] produced in the previous step. [run paragraph on]";
	otherwise if input-3 is set:
		say "Input 3 is [third input no-ascii]. [run paragraph on]";
	otherwise:
		say "Input 3 isn't set. [run paragraph on]";
	let input-4 be fourth input value;
	if product-2 is set and input-4 is set:
		Say "Input 3 is [fourth input no-ascii], which is injected into the [product-2], producing ";
		if product-3 is set:
			say "[product-3]. [run paragraph on]";
		otherwise:
			say "nothing. [run paragraph on]";
	otherwise if product-2 is set:
		say "Input 4 is unset, so there is no product resulting from the [product-2] produced in the previous step.";
	otherwise if input-4 is set:
		say "Input 4 is [fourth input no-ascii].";
	otherwise:
		say "Input 4 isn't set.";
	if product-3 is set:
		say "The final product of the injection process is [product-3].";
	if diagram tipped is false:
		say line break;
		tip "Use 'substance > input' to set each input. For instance, 'Un > 3' sets input 3 to Unobtainium. You may also use 'set <input> to <substance>' for the same effect. Use 'disconnect <input>' to disconnect an input.";
		now diagram tipped is true;
	
	

Empty-space is a substance. The symbol is "--". 
Void Matter is a substance. The symbol is "VM". Understand "VM" as Void Matter.
Oganesson is a substance. The symbol is "Og". Understand "Og" as Oganesson. Oganesson is inputtable.
Unobtainium is a substance. The symbol is "Un". Understand "Un" as Unobtainium. Unobtainium is inputtable.
Red Matter is a substance. The symbol is "RM". Understand "RM" as Red Matter. Red Matter is inputtable.
Liquid Copernicium is a substance. The symbol is "LC". Understand "LC" as Liquid Copernicium.
Anti-Helium is a substance. The symbol is "AH". Understand "AH" as Anti-Helium. Anti-Helium is inputtable.
Tachyon Crystals is a substance. The symbol is "TC". Understand "TC" as a Tachyon Crystals. Tachyon Crystals are inputtable.

To (s1 - a substance) injected into (s2 - a substance) creates (product - a substance):
	let reagents be s1 and s2 as a couple;
	set key reagents of Injection Recipes to product;
	
Input 1 is an input. Input 2 is an input. Input 3 is an input. Input 4 is an input.	
Inputting it into is an action applying to two visible things. Understand "[any substance] > [any input]" as Inputting it into. Understand "Join [any substance] to [any input]" as Inputting it into.

[After deciding the scope of the player:
	place the room of stuff in scope;]
	
Check inputting a substance into an input when engine diagram is not rebooted:
	say "The engine diagram is not on." instead;
	
Check inputting a substance into an input when engine diagram is rebooted:
	if noun is not inputtable:
		say "There is no input for that substance." instead;
	
Carry out inputting a substance (called S) into an input (called I) when engine diagram is rebooted:
	set key I of Engine Inputs to S;

After inputting when engine diagram is rebooted:
	try examining engine diagram;
	
Understand "set [any input] to [any substance]" as inputting it into (with nouns reversed).
	
Disconnecting is an action applying to one visible thing. Understand "disconnect [any input]" as disconnecting.
	
Check disconnecting an input when engine diagram is not rebooted:
	say "The engine diagram is not on." instead;
		
Check disconnecting an input (called I) when engine diagram is rebooted (this is the don't allow disconnecting unconnected inputs rule):
	If get key I of Engine Inputs is some let X be the value:
		if X is Empty-space:
			say "That input isn't connected to anything." (A) instead;
	otherwise:
		say "That input isn't connected to anything." (B) instead;
	
Carry out disconnecting an input (called I) when engine diagram is rebooted:
	set key I of Engine Inputs to Empty-space;
		
After disconnecting when engine diagram is rebooted:
	say "You disconnect the input.";
	try examining engine diagram;

When play begins:
	Let Injection Recipes be a map of any to substance;
	Let Inputs be a map of inputs to substance;
	[recipes]
	Oganesson injected into Red Matter creates Liquid Copernicium;
	Anti-Helium injected into Oganesson creates Unobtainium;
	Anti-Helium injected into Red Matter creates Tachyon Crystals;
	Tachyon Crystals injected into Unobtainium creates Red Matter;
	Tachyon Crystals injected into Tachyon Crystals creates Void Matter;

Section 2 - Engine Chambers

Port Engine Chamber is port of Engine Room. "This is where the the combustion of the main engine is converted into forward thrust. The engine, ten feet in diameter, is quiet now, and you'd prefer not to be here when it is on.".

The main port engine is a thing in the port engine chamber. It is scenery.

Starboard Engine Chamber is starboard of Engine Room. "This is where the the combustion of the main engine is converted into forward thrust. The engine, ten feet in diameter, is quiet now, and you'd prefer not to be here when it is on.".

The starboard balance is a real number that varies. The starboard balance is initially -4.0.
The left mass is a real number that varies.
The right mass is a real number that varies.

The main starboard engine is a thing in the starboard engine chamber. It is fixed in place.
The bias of the starboard engine is always -4.0. 
The left mount is a supporter which is part of the main starboard engine. The description is "This is one the large clamps that holds the engine in place."
The right mount is a supporter which is part of the main starboard engine. The description is "This is one the large clamps that holds the engine in place."

To update the balance:
	let b be the bias of the starboard engine;
	let L be 0.0;
	let R be 0.0;
	Repeat with W running through things supported by the left mount:
		now b is b + the mass of W;
		now L is L + the mass of W;
	Repeat with W running through things supported by the right right:
		now b is b - the mass of W;
		now R is R + the mass of W;
	now the starboard balance is b;
	now the left mass is L;
	now the right mass is R;

Definition: The main starboard engine is balanced if the starboard balance is 0.	

To describe the main starboard engine:
	Update the balance;
	If the left mount holds nothing and the right mount holds nothing:
		Say "The engine is tilting to the right, just a few millimeters.";
		Tip "You can say 'put 9kg on right' or 'put 15kg on left'.";
	otherwise:
		Say "The left mount of the engine holds: [the list of things supported by the left mount], for a mass of [left mass]kg.";
		Say "The right mount of the engine holds: [the list of things supported by the right mount], for a mass of [right mass]kg.";
		if the starboard balance is 0:
			say "The engine is balanced!";
		otherwise if the starboard balance < 0: 
			say "The engine is tilting to the right.";
		otherwise:
			say "The engine is tilting to the left.";
			
Instead of examining the main starboard engine:
	describe the main starboard engine;
	
Rule for writing a paragraph about the main starboard engine (this is the describe the engine rule):
	describe the main starboard engine;
	now the main starboard engine is mentioned;
			
Report putting something on the left mount:
	say "[text of the standard report putting rule response (A)][paragraph break]";
	describe the main starboard engine;
	stop;
		
Report putting something on the right mount:
	say "[text of the standard report putting rule response (A)][paragraph break]";
	describe the main starboard engine;
	stop;
		
After removing something from the left mount:
	say "[text of the standard report taking rule response (A)][paragraph break]";
	describe the main starboard engine;
		
After removing something from the right mount:
	say "[text of the standard report taking rule response (A)][paragraph break]";
	describe the main starboard engine;


Chapter 6 - Machine Shop

The Machine Shop is port of Engineering Deck. "Any ship needs parts manufactured, repaired, or otherwise machined. This is where it happens. Among the various pieces of equipment is a large laser table saw.".

The laser table saw is in the machine shop. It is scenery. "The laser saw has a guard under which you can pass thin items to be cut by the automatically-activated laser."	

Slicing it with is an action applying to two things. Understand "cut [something] with [something]" as slicing it with. Understand "slice [something] with [something]" as slicing it with. Understand "prune [something] with [something]" as slicing it with. Understand "chop [something] with [something]" as slicing it with.

The block cutting rule response (A) is "You need to specify what to cut [the noun] with.";

Check slicing something with something:
	if the second noun is not the laser saw:
		say "[We] [can't] cut with that." instead;
	if the second noun is not the ceiling hook:
		say "It is probably best that [we] [leave] [the noun] intact.";

The shortened hook is a thing. The description is "The screw end of the ceiling hook is now about one third as long as it was.".	

Instead of slicing the ceiling hook with the laser saw:
	now the ceiling hook is nowhere;
	now the player carries the shortened hook;
	say "You run the screw end of the ceiling hook through the laser, cutting off about two thirds of its length.".

Chapter 7 - The Fore/Aft Door and The Galley

The Fore/Aft Door is a door. It is up from The Galley and down from Operations. It is closed. The description is "The fore/aft door is a square hatch, separating Operations Deck from the Galley. It is made of a strong black plastic/metal alloy."

The galley's blue button is a button. [It is scenery. It is in The Galley.]

The ceiling hook is a thing. The description is "The ceiling hook has a very long, pointy screw end."

The skillet is a thing. The mass is 1.5. Understand "pot/pan" as skillet. The description is "A very nice 9[quotation mark] non-stick skillet."

The pots are a thing in the galley. They are undescribed. Understand "pots/pans/pot/pan/skillet" as pots. The description is "There are several pots and pans here, including one really nice skillet."

Instead of taking the pots when the skillet is nowhere:
	Now the skillet is in the galley;
	try taking the skillet;
	if player carries the skillet and the hook has not been handled:
		say "Apparently one of the hooks is loose. You jostle it while taking the skillet, and it falls out of the ceiling to the floor.";
		Now the initial appearance of the hook is "A ceiling hook lies on the floor here.";
		Now the ceiling hook is in the galley;
		Now the pots are scenery;
	otherwise:
		now the skillet is nowhere;
		
The galley ceiling is scenery in the galley. The printed name is "ceiling". "[if skillet is nowhere][text of the don't worry about a dummy-backdrop rule response (A)][otherwise]There's a little hole in the ceiling where a ceiling hook used to be.[end if]";

Check taking the pots:
	say "You have no need of any further cookware." instead;

The description of the Galley is "This narrow space is barely enough room for two Marines to prepare and eat a meal. There is a counter with two stools, a microwave oven, and a large closet here. Pots and pans hang from hooks in the ceiling. A ladder leads up through the fore/aft door, and you can leave aft.

On the starboard wall is a panel on which is a blue button. Tacked to the panel is the operator's manual for the fore/aft door.".

The counter is a supporter in the Galley. It is scenery. "A standard kitchen counter."

The stool is a supporter in the Galley. It is scenery. It is enterable. "Three tall bar-type stools surrounding the counter."
Understand "stools" as the stool.

The microwave oven is a container in the Galley. It is scenery. It is openable and closed. "You're supposed to be cleaning this microwave, but here you are. The microwave [if microwave oven is open]open[otherwise]closed[end if]."

The closet is a container in the Galley. It is scenery. It is closed and openable. "A closet with a folding door, set into the bulkhead."

An MRE is a kind of thing. An MRE is edible. The description is "A regulation Meal Ready-to-Eat. One perk of not going on missions is you don't have to eat these things." The indefinite article is "an". The mass of an MRE is 0.5.
10 MREs is in the closet. 

eaten already is a truth state that varies.

Check eating an MRE:
	if eaten already is true:
		say "You couldn't stomach another MRE." instead;
		
Carry out eating an MRE:
	now eaten already is true;
	
Report eating an MRE:
	say "You eat the MRE. Although it has the advantage of being self-heating, it is unfortunately thoroughly uninspired cuisine.";
	stop the action;

Traveled Fore Aft is a truth state that varies.

Instead of opening the Fore/Aft Door:
	say "You can't open that with your bare hands.";

Check pressing galley's blue button when something blocks the Fore/Aft Door:
	say "A loud buzzer sounds and a red light flashes on the door, which stays resolutely shut." instead;

Check pressing the fore blue button when something blocks the Fore/Aft Door:
	say "A loud buzzer sounds and a red light flashes on the door, which stays resolutely shut." instead;
	
Carry out pressing galley's blue button:
	now the Fore/Aft Door is open;
Carry out pressing the fore blue button:
	now the Fore/Aft Door is open;
	
Report pressing galley's blue button when the Fore/Aft Door was closed:
	say "The door slides open.";
Report pressing the fore blue button when the Fore/Aft Door was closed:
	say "The door slides open.";
	
Check pressing galley's blue button when the Fore/Aft Door is open:
	say "The door is already open.";
Check pressing the fore blue button when the Fore/Aft Door is open:
	say "The door is already open.";
	
After going through the fore/aft door:
	now traveled fore aft is true;
	continue the action;			
		
The control panel is thing in the galley. It is scenery. "The control panel features a prominent blue button for opening the door above. The door operations manual dangles on a chain from the panel."
The galley's blue button is part of the control panel. The description is "It's a button. It's blue."
The door operations manual is a thing in the galley. It is scenery. 

The description of the door operations manual is "Most of the manual is concerned with the technical details of the door, such as installation, maintainance, and repair. There is a small section towards the end detailing its safety features; for example: 'To prevent injury, the Portmaster V S-65 will not open when it senses weight pressing upon it from above. In this case, an audible signal and a red warning light will indicate that an obstruction exists.'";

Does the player mean opening the door operations manual: it is very unlikely.

Instead of taking the manual:
	say "It is chained securely to the control panel. Best leave it.";

Chapter 8 - Crew Quarters
	
Crew Quarters is aft of Galley. "This is a busy junction when the ship is populated. To port and starboard are the crew bunks, aft is the door to the captain's quarters, and fore is the galley. A ladder leads down to the aft airlock.";

Chapter 9 - Port-Side Bunks

Section 1 - The Room

To say state and contents of (C - a container):
	if C is closed:
		say "[regarding C][They] [are] closed";
	otherwise:
		say "[regarding C][They] [are] open and [if C contains nothing]empty[otherwise][contain] [contents of C][end if]";

Does the player mean getting off something:
	if the player is not on the noun:
		it is very unlikely;

Port-Side Bunks is port of Crew Quarters. "All crew members who aren't the captain sleep in this or the opposite-side bunk room. This one sleeps four in two sets of bunks, one on the left and one on the right, all done up with military precision. There is a large locker here, stretching almost to the ceiling. [state and contents of port-side locker]. The sole exit is to starboard.

[if the player is on the top left bunk]Someone has taped a family photo to the wall here.[otherwise if looked at family photo is false]Something is affixed to the wall by the top left bunk.[otherwise]A family photo is taped to the wall by the top left bunk.[end if]".

looked at family photo is a truth state that varies.

After entering port-side top left bunk for the first time: [when looked at family photo is false:]
	say "Someone has taped a family photo to the wall here.";
	now looked at family photo is true;

The family photo is scenery. It is on port-side top left bunk. The description is "[if the player is on the top left bunk]Three children, a mother and father, and an old grandfather, under the glare of what you'd guess is Pollux.[otherwise]It's too far away to make out properly.[end if]"

Instead of taking the family photo:
	say "You can hardly think of a reason to so callously steal someone's memories of home.";

The wallet is a container. It contains a military ID card. It is closed and openable. The wallet is on the port-side left bottom bunk. "A leather wallet lies on the left bottom bunk." The description of the wallet is "A rather nice black leather wallet with the monogram 'XM'.".

The military id card is flat.

The description of the military ID card is "The card belongs to one Xavier Marshall, PFC.".

the port-side left bottom bunk is a supporter in Port-Side Bunks. It is scenery. It is enterable. The printed name is "left bottom bunk".  The description is "One of a number of perfect regulation bunks."

the port-side left top bunk is a supporter in Port-Side Bunks. It is scenery. It is enterable. The printed name is "the left top bunk". "One of a number of perfect regulation bunks."

the port-side right bottom bunk is a supporter in Port-Side Bunks. It is scenery. It is enterable. The printed name is "right bottom bunk". "One of a number of perfect regulation bunks."

the port-side right top bunk is a supporter in Port-Side Bunks. It is scenery. It is enterable. The printed name is "right top bunk". "One of a number of perfect regulation bunks."

the port-side left bottom bunk and the port-side right bottom bunk are undersided.

Understand "bed" as Port-Side left bottom bunk.
Understand "bed" as Port-Side right bottom bunk.
Understand "bed" as Port-Side left top bunk.
Understand "bed" as Port-Side right top bunk.

For printing a locale paragraph about Port-Side Left Top Bunk:
	continue the activity;

For printing a locale paragraph about Port-Side Right Top Bunk:
	continue the activity;

Does the player mean looking under the Port-Side left top bunk:
	It is very unlikely.
	
Does the player mean looking under the Port-Side right top bunk:
	It is very unlikely.
	
The port-side equipment locker is an equipment cabinet in the Port-Side Bunks.  It is scenery. It is enterable. [It is closed, locked, and openable. ] The description is "The locker features a traditional keyhole and a card slot."

The description of the port-side equipment locker's slot is "It is a typical card slot, as you might find on a starship door.".


Section 2 - The Vac Suit

The vac suit is wearable. It is in the Port-Side Equipment locker. The vac suit has a number called turns of air left. The turns of air left is 15. The vac suit is addressable. The mass of the vac suit is 47.

After reading a command:
	if "[the player's command]" is "suit, help" or "[the player's command]" is "vac suit, help":
		if the vac suit is not activated:
			say "You must activate the vac suit before asking for help.";
		otherwise:
			say "'The following commands are available:
			[line break][line break]
			- suit, activation code <code>[line break]
			- suit, mag boots on[line break]
			- suit, mag boots off[line break]
			- suit, report status'[line break]
			";
		reject the player's command;

The description of the vac suit is "A puffy white suit with an attached helmet and magnetic boots."

The vac suit can be activated. The vac suit can be mag boots activated.

Check wearing the military sanitation uniform when the player is wearing the vac suit:
	say "(first removing [the vac suit])[command clarification break]";
	silently try taking off the vac suit;

After wearing the vac suit for the first time:
	activate the table of vac suit activation hints;
	continue the action;

Before wearing the vac suit:
	if the player is wearing the military sanitation uniform:
		say "(first removing [the military sanitation uniform])[command clarification break]";
		silently try taking off the military sanitation uniform;

Every turn when the player is in vacuum and the player is wearing the vac suit (this is the first check vacuum rule):
	if the vac suit is not activated:
		say "The vac suit has failed to pressurize. You stumble and flail, unable to do anything to save yourself. What a shame.";
		end the story saying "You have suffocated" instead;
	if the turns of air left of the vac suit > 0:
		decrement the turns of air left of the vac suit;
		if the turns of air left of the vac suit > 5: 
			say "Your vac suit pings gently to indicate you have expended a unit of air.";
		otherwise if the turns of air left of the vac suit > 0: 
			say "A stern voice in your helmet intones 'Air levels critical. Seek a pressurized location immediately.'[line break]";
		otherwise If the turns of air left of the vac suit is 0:
			say "An alarm sounds and a voice says 'Air expended' on repeat.";

Activating suit is an action applying to one number. Understand "activation code [number]" as activating suit.
The taking off action has a truth state called originally activated.
 
Carry out taking off the vac suit:
	Now originally activated is whether or not suit is activated;
	Now suit is not activated;
	Now suit is not mag boots activated;

Report taking off the vac suit when originally activated is true:
	Say "The suit says, 'Suit deactivated,' when you take it off.";
	stop the action;	

Persuasion rule for asking vac suit to try doing something other than reporting status when the player is not wearing the vac suit:
	say "[We] must be wearing [the vac suit] in order to control it.";
	persuasion fails;

Persuasion rule for asking vac suit to try activating suit: 
	If player is wearing the vac suit:
		persuasion succeeds;	

Carry out vac suit activating suit when number understood is VSAC:
	Now vac suit is activated;	

Report vac suit activating suit when number understood is VSAC:
	Say "A pleasant voice says, 'Suit activated.'[paragraph break]";

After vac suit activating suit when number understood is VSAC:
	deactivate table of vac suit activation hints;
	continue the action;
	
Instead of answering the vac suit that:
	say "The vac suit only has a limited number of commands it understands. That's not one of them.";

Report vac suit activating suit when number understood is not VSAC:
	say "[The vac suit] buzzes once to indicate it has rejected your request.";

Check activating suit:
	Say "[text of parser error internal rule response (A)][paragraph break]";

Check activating mag boots:
	Say "[text of parser error internal rule response (A)][paragraph break]";
	
Check deactivating mag boots:
	Say "[text of parser error internal rule response (A)][paragraph break]";
	
Check reporting status:
	Say "[text of parser error internal rule response (A)][paragraph break]";

Activating mag boots is an action applying to nothing. Understand "mag boots on" as activating mag boots.
Deactivating mag boots is an action applying to nothing. Understand "mag boots off" as deactivating mag boots.

Persuasion rule for asking vac suit to try activating mag boots:
	if player is wearing the vac suit:
		persuasion succeeds;
	make no decision;
	
Persuasion rule for asking vac suit to try deactivating mag boots:
	if player is wearing the vac suit:
		persuasion succeeds;
	make no decision;

Carry out vac suit activating mag boots when vac suit is activated:
	Now vac suit is mag boots activated;
	
Report vac suit activating mag boots when suit is activated:
	Say "A pleasant voice says, 'Mag boots activated.'[paragraph break]";
	
Report vac suit activating mag boots when suit is not activated:
	say "[The vac suit] buzzes once to indicate it has rejected your request.";

Carry out vac suit deactivating mag boots when vac suit is activated:
	Now vac suit is not mag boots activated;
	
Report vac suit deactivating mag boots when suit is activated:
	Say "A pleasant voice says, 'Mag boots deactivated.'[paragraph break]";
	
Report vac suit deactivating mag boots when suit is not activated:
	say "[The vac suit] buzzes once to indicate it has rejected your request.";
	
Report going from a room (called R) to a room (called R2) when player is wearing the vac suit and the vac suit is mag boots activated and R is onboard and R2 is onboard:
	Say "You slowly clomp [direction term for the noun] in your mag boots.";
	
Reporting status is an action applying to nothing. Understand "report status" as reporting status. Understand "status report" as reporting status. Understand "status" as reporting status. Understand "report" as reporting status.
	
Persuasion rule for asking vac suit to try reporting status:
	persuasion succeeds;
	
Check player reporting status:
	Say "That's a command for a vac suit, not for a person." instead;
	
Report vac suit reporting status:
	If the vac suit is not activated:
		Say "'Suit deactivated.'[line break]";
	otherwise:
		Say "'Suit activated[if vac suit is mag boots activated]. Mag boots activated[otherwise]. Mag boots deactivated[end if]. Oxygen level at [turns of air left of the vac suit] units.'[line break]";
	

Section 3 - The Black Trunk

[THESE RULES ARE FOR THE BLACK TRUNK, which is both a supporter and a container.]

The black trunk is a supporter. It is enterable. It is under port-side right bottom bunk. It is portable. The description is "This is a large, plain black trunk with steel trim. It latches shut, but doesn't have a locking mechanism.". The mass is 3. Understand "chest" as the black trunk.
The black trunk's inside is a container. The printed name is "black trunk". It is part of the black trunk.  It is openable and closed. The description is "This is a large, plain black trunk with steel trim. It latches shut, but doesn't have a locking mechanism.".


Before entering the black trunk:
	if the black trunk's inside is open:
		say "(first closing the black trunk)[command clarification break]";
		silently try closing the black trunk's inside;
	continue the action.
	
Rule for listing contents of the black trunk:
	if something is on the black trunk:
		continue the activity;
	otherwise:
		carry out the listing contents activity with the black trunk's inside;

To write after entry for (O - object):
      (- WriteAfterEntry( {O} ); -).

To write after entry for (O - object) with depth (D - a number):
      (- WriteAfterEntry( {O}, {D} ); -).

Rule for printing room description details for the black trunk when nothing is on the black trunk:
      write after entry for the black trunk's inside.

Rule for printing inventory details for the black trunk:	
	if black trunk's inside is closed:
		say " (closed)";
	otherwise if black trunk's inside is open and black trunk's inside contains nothing:
		say " (open but empty)";
	otherwise:		
		write after entry for the black trunk's inside with depth 0;
	
Understand "trunk" as the black trunk's inside.

Does the player mean removing from the black trunk when the black trunk's inside is open:
	It is very unlikely.
	
Does the player mean removing from the black trunk when the black trunk's inside is closed:
	It is very likely.

Rule for clarifying the parser's choice of the black trunk: do nothing.
Rule for clarifying the parser's choice of the black trunk's inside: do nothing.
	
Before taking the black trunk when something is on the trunk and the player is not on the trunk:
	say "(first taking [the list of things that are on the black trunk])[command clarification break]";
	Repeat with X running through the list of things that are on the black trunk:
		silently try taking X;
	continue the action;

Instead of opening the black trunk when the player is on the black trunk:
	say "You'll have to get off the black trunk first.";
	
Instead of opening the black trunk when something (called T) is on the black trunk and T is not the player:
	say "(first taking [the list of things that are on the black trunk])[command clarification break]";
	Repeat with X running through the list of things that are on the black trunk:
		silently try taking X;
	continue the action;
 
Instead of opening the black trunk:
	try opening the black trunk's inside;
	
Instead of closing the black trunk:
	try closing the black trunk's inside;
	
Instead of inserting a thing (called T) into the black trunk:
	try inserting T into the black trunk's inside;
	
Instead of putting something (called T) on the black trunk when the black trunk's inside is open:
	say "(first closing the black trunk)[command clarification break]";
	silently try closing the black trunk's inside;
	continue the action;
	
Instead of examining the black trunk:
	if something is on the black trunk:
		continue the action;
	otherwise:
		try examining the black trunk's inside;
	
Instead of searching the black trunk:
	if something is on the black trunk:
		continue the action;
	otherwise:
		try searching the black trunk's inside;
		
[END BLACK TRUNK]


Chapter 10 - Starboard-Side Bunks

Starboard-Side Bunks is starboard of Crew Quarters. "All crew members who aren't the captain sleep in this or the opposite-side bunk room. This one sleeps four in two sets of bunks, one on the left and one on the right, all done up with military precision. There is a large locker here, stretching almost to the ceiling. [state and contents of starboard-side locker]. The sole exit is to port.";

the starboard-side left bottom bunk is a supporter in Starboard-Side Bunks. It is scenery. The printed name is "left bottom bunk". It is enterable. "One of a number of perfect regulation bunks."

the starboard-side left top bunk is a supporter in Starboard-Side Bunks. It is scenery. The printed name is "left top bunk". It is enterable. "One of a number of perfect regulation bunks."

the starboard-side right bottom bunk is a supporter in Starboard-Side Bunks. It is scenery. The printed name is "right bottom bunk". It is enterable. "One of a number of perfect regulation bunks."

the starboard-side right top bunk is a supporter in Starboard-Side Bunks. It is scenery. The printed name is "right top bunk". It is enterable. "One of a number of perfect regulation bunks."

The starboard-side left bottom bunk and the starboard-side right bottom bunk are undersided.

Understand "bed" as Starboard-Side left bottom bunk.
Understand "bed" as Starboard-Side right bottom bunk.
Understand "bed" as Starboard-Side left top bunk.
Understand "bed" as Starboard-Side right top bunk.

A copy of Stars Magazine is a thing in Starboard-Side Bunks. "[A copy of stars magazine] is just peeking from underneath the [Starboard-Side Left Bottom Bunk]."; 

[Stars Magazine has tellme "Stars Magazine has a galaxy-wide distribution of over 100 billion, in over 30 languages.".]

The description of Stars Magazine is "The cover features a picture of a Space Marine spacewalking in a vac suit. You page through the inside, but it's all in a language you don't recognize.". Stars Magazine is translatable. It is flat. It has page count 9.

To say expose EAC:
	now the ID card is nowhere;
	now the Engineering Access Card is in Starboard-Side Bunks.
	
Carry out taking the Engineering Access Card:
	now the ID card is nowhere;

The Engineering Access Card is an access card. "What you thought was an ID card lies on the floor. Now that you're closer to it, though, you can see the words 'Engineering Access Card'[expose EAC] written on it.".

The description is "A yellow card with someone's photo on it. It says 'Engineering Access Card'."

Carry out entering the left top bunk when the Engineering Access Card is nowhere (this is the see the id from left bunk rule):
	now the id card is in Starboard-Side Bunks;
	activate the table of ID Hints;

Report entering the left top bunk when the Engineering Access Card is nowhere:
	say "[text of the standard report entering rule response (A)][paragraph break]";
	say "From this height you can see something that looks like a yellow ID card on top of the equipment locker.";
	stop;

Carry out entering the right top bunk when the Engineering Access Card is nowhere (this is the see the id from right bunk rule):
	now the id card is in Starboard-Side Bunks;
	activate the table of ID Hints;
	
Report entering the right top bunk when the Engineering Access Card is nowhere:
	say "[text of the standard report entering rule response (A)][paragraph break]";
	say "From this height you can see something that looks like a yellow ID card on top of the equipment locker.";
	stop;

Carry out entering the black trunk when the Engineering Access Card is nowhere and location is Starboard-side bunks (this is the see the id from the trunk rule):
	now the id card is in Starboard-Side Bunks;
	activate the table of ID Hints;

Report entering the black trunk when the Engineering Access Card is nowhere and location is Starboard-side bunks:
	say "[text of the standard report entering rule response (A)][paragraph break]";
	say "From this height you can see something that looks like a yellow ID card on top of the equipment locker.";
	stop;
	
The yellow ID card is a thing. It is undescribed.  [this is a bogus thing]
The description is "As best as you can tell from this distance, it's some kind of military ID."

Instead of taking the yellow ID card:
	if the Engineering Access Card is nowhere:
		say "[We] [can't] reach [the yellow id card] from here.";
	otherwise:
		say "[text of the parser error internal rule response (E)][paragraph break]";
	
The starboard-side equipment locker is an equipment cabinet in the Starboard-Side Bunks. It is scenery. It is enterable. It is closed and openable and locked.

The description of the starboard-side equipment locker's slot is "It is a typical card slot, as you might find on a starship door.".

The beacon is in the starboard-side equipment locker. The description is "A device for broadcasting the location of an object in space."

Instead of dusting the Starboard-Side locker when the Engineering Access Card is nowhere and the yellow ID card is in the Starboard-Side Bunks:
	if player is on Starboard-Side left top bunk or player is on Starboard-Side right top bunk:
		say "The bunks are just a little too far away from the locker.";
	otherwise If player is on black trunk:
		say "[We] [extend] [the extendable dusting device] and [regarding the player][push] [the id card] off of [the Starboard-Side locker]. [It] [land] on the floor.";
		now the Engineering Access Card is in Starboard-Side Bunks;
		deactivate the table of ID Hints;		
	otherwise:
		say "You dust the locker to a nice polish, but you're not tall enough to dust the top.";

Instead of dusting the yellow ID card:	
	if player is on Starboard-Side left top bunk or player is on Starboard-Side right top bunk:
		say "The bunks are just a little too far away from the locker.";
	otherwise If player is on black trunk:
		say "[We] [extend] [the extendable dusting device] and [regarding the player][push] [the id card] off of [the Starboard-Side locker]. [It] [land] on the floor.";
		now the Engineering Access Card is in Starboard-Side Bunks;
		deactivate the table of ID Hints;	
	otherwise:
		say "You can't see the yellow ID card from here.";

 
Chapter 11 - Captain's Quarters

Section 1 - The Door

The Captain's door is a starship door. It is aft of Crew Quarters and fore of Captain's Quarters. The description is "[The captain's door] is a conventional, self-opening starship door. It is painted in the traditional red of a starship captain. It features a slot through which you may slide the appropriate access card.".

The Captain's door has matching card the maintenance crew access card.

The Captain's door's slot is dirty. The description is "[if the captain's door's slot is dirty][We] [see] a substantial buildup of dust inside [the captain's door's slot][otherwise][The captain's door's slot] looks nice and clean[end if].".

Report cleaning the captain's door's slot with the dusting device:
	say "[The captain's door's slot] is too narrow for the duster to get in there.";
	
Check dusting the captain's door's slot when the player carries the dusting device:
	say "[The captain's door's slot] is too narrow for the duster to get in there." instead;
	
Report cleaning the captain's door's slot with the sonic decontaminator:
	say "[The sonic decontaminator] is for chemical and biological hazards, not for dust.";

Carry out cleaning the captain's door's slot with the vacuum cleaner:
	Now the captain's door's slot is not dirty;
	
Report cleaning the captain's door's slot with the vacuum cleaner:
	say "[We] [vacuum] the slot for a few seconds. That should do it.";	
	
Report vacuuming the captain's door's slot:
	say "[We] [vacuum] the slot for a few seconds. That should do it.";	
	
Section 2 - The Room

The description of the captain's quarters is "Neat and spartan, this cabin is the very model of a small fighting ship's captain's quarters. An impeccably organized desk is against one wall, while a typically spotless bed sits beneath a portrait of this very ship. There is a data terminal on the desk. [if all of the weights are in captain's quarters]Against a third wall is the captain's one indulgence: a set of free weights neatly put away in racks.[end if] You can exit to fore."

The captain's bed is a supporter in the captain's quarters. It is enterable. It is scenery. It is undersided. "The captain's bed is like all the others on the ship: faultlessly neat"

The captain's desk is a supporter in the captain's quarters. It is scenery. The description is "The Captain's desk is a simple institutional metal desk with a single drawer[state and contents of desk drawer]. There is a data terminal on the desk.".

The desk drawer is a container. It is part of the captain's desk. It is openable and closed. The description is "The Captain's desk is a simple institutional metal desk with a single drawer[state and contents of desk drawer]. There is a data terminal on the desk."

The portrait of the ship is scenery in captain's quarters. "The SS Usagi looks ungainly, as a vessel that travels in vacuum typically does, but it's truly a beautiful ship."

Instead of entering the captain's desk:
	say "Stop messing around.";

Section 3 - data terminal
	
Tipped computer is a truth state that varies.

After printing the locale description when location is Captain's Quarters and tipped computer is false:
	tip "You may talk to the ship computer through the data terminal. You might try 'computer, help' to get help on talking to the computer.";
	now tipped computer is true;
	continue the action;
	
A data terminal state is a kind of object.
dt-lock-screen is a data terminal state.
dt-home-screen is a data terminal state. 
dt-displaying-subject is a data terminal state.
dt-displaying-help is a data terminal state.

The data terminal has a data terminal state called the state. The state of the data terminal is dt-lock-screen.

dt-subject-nothing is a thing.
The data terminal has a thing called the dt-subject. The dt-subject of the data terminal is dt-subject-nothing.

Logged in as Arvax is truth state that varies.
Logged in as Mulgrew is truth state that varies.

Printing data terminal description for something is an activity on data terminal states.

Rule for printing data terminal description for dt-lock-screen:
	say "[The data terminal] displays the message 'Basic access available. State security code for privileged access.'";

Rule for printing data terminal description for dt-home-screen:
	say "[The data terminal] displays the logo of the space marines.";
	
Rule for printing data terminal description for dt-displaying-subject when logged in as Arvax is false and computer-rebooting is false:
	choose the row with a dt-subject of the dt-subject of the data terminal in the Table of data terminal Subjects;
	say "[The data terminal] displays a screen of text:[paragraph break]'[dt-text-mulgrew entry]'";
	
Rule for printing data terminal description for dt-displaying-subject when logged in as Arvax is true and computer-rebooting is false:
	choose the row with a dt-subject of the dt-subject of the data terminal in the Table of data terminal Subjects;
	if there is a dt-text-arvax entry:
		say "[The data terminal] displays a screen of text:[paragraph break]'[dt-text-arvax entry]'";
	otherwise:
		say "[The data terminal] displays a screen of text:[paragraph break]'[dt-text-mulgrew entry]'";
		
Rule for printing data terminal description when computer-rebooting is true:
	say "[The data terminal] displays a progress bar, and nothing else.";	

To say data terminal screen:
	carry out the printing data terminal description activity with the state of the data terminal;

The data terminal is a thing on the captain's desk. It is scenery. The description is "[data terminal screen][run paragraph on]".
The data terminal can be terminal-unlocked.


After deciding the scope of the player when the location is the captain's quarters:
	place ship computer in scope;
		
After quizzing ship computer about arvax when location is captain's quarters:
	print "'Displaying personnel data on [Arvax].'[paragraph break]" as computer near desk;	
	now the state of the data terminal is dt-displaying-subject;
	now the dt-subject of the data terminal is Arvax;
	silently try examining the terminal;

After quizzing ship computer about something when location is captain's quarters and logged in as Arvax is false:	
	if there is a dt-subject of the second noun in the Table of data terminal Subjects:
		choose the row with dt-subject of second noun in the Table of data terminal Subjects;
		if the dt-text-mulgrew entry is "":
			print "'Information on [second noun] is restricted.'[line break]" as computer near desk;
		otherwise: 
			print "'Displaying available information on [the second noun].'[paragraph break]" as computer near desk;
			now the state of the data terminal is dt-displaying-subject;
			now the dt-subject of the data terminal is the second noun;
			now the second noun is familiar;			
			silently try examining the terminal;
	otherwise:
		print "'I'm unable to give you any information about [the second noun].'[line break]" as computer near desk;
		
After quizzing ship computer about something when location is captain's quarters and logged in as Arvax is true:
	if there is a dt-subject of the second noun in the Table of data terminal Subjects:
		print "'Displaying available information on [the second noun].'[paragraph break]" as computer near desk;
		now the state of the data terminal is dt-displaying-subject;
		now the dt-subject of the data terminal is the second noun;
		now the second noun is familiar;
		silently try examining the terminal;
	otherwise:
		print "'I'm unable to give you any information about [the second noun].'[line break]" as computer near desk;

After asking ship computer about a topic when location is captain's quarters:
	print "'I'm unable to give you any information about [topic understood].'[line break]" as computer near desk;
		
Instead of quizzing ship computer about ship computer when location is captain's quarters:
	print "'This is the ship computer of the SS Usagi. For a list of helpful commands and topics, please consult the terminal.'[line break]" as computer near desk;
	now the state of the data terminal is dt-displaying-help;
	silently try examining the terminal;
	
Instead of quizzing ship computer about ship computer when location is not captain's quarters:
	print "'Please consult the captain's data terminal if you are in need of help.'[line break]" as computer near captain's chair;
	
Arvax's security code is a number that varies.
Mulgrew's security code is a number that varies.
Hacking is an action applying to one topic. Understand "access code [text]" as hacking.
After the ship computer hacking a topic:
	if the topic understood is "0":
		print "'Access denied.'[line break]" as computer near terminal;
	otherwise if "[Arvax's security code]" is the topic understood:
		print "'Welcome, [Arvax]. Logging you in.'[line break]" as computer near desk;
		now Logged in as Arvax is true;
		now Logged in as Mulgrew is false;
		now the state of the data terminal is dt-home-screen;
		Now the data terminal is terminal-unlocked;
		Silently try examining the data terminal;
	otherwise if "[Mulgrew's security code]" is the topic understood:
		print "'Welcome, [captain mulgrew]. Logging you in.'[line break]" as computer near desk;
		now Logged in as Arvax is false;
		now Logged in as Mulgrew is true;
		now the state of the data terminal is dt-home-screen;
		Now the data terminal is terminal-unlocked;
		Silently try examining the data terminal;
	otherwise:
		print "'Access denied.'[line break]" as computer near desk;
		
Persuasion rule for asking the ship computer to try hacking:
	persuasion succeeds;
			
Instead of asking ship computer about "help":	
	try quizzing the ship computer about ship computer instead;
	
After reading a command:
	if "[the player's command]" is "computer, help":
		change the text of the player's command to "ask ship computer about ship computer";
	
Rule for printing data terminal description for dt-displaying-help:
	say "[line break]'Helpful commands:
[line break][line break]
- ask computer about <subject>[line break]
- computer, emergency protocols: activates the ship's emergency protocols[line break]
- computer, reboot[line break]
- computer, access code <code>";

Understand "ask terminal about [text]" as a mistake ("Ask the ship computer instead.").


	
To say familiarize (T - a thing):
	now T is familiar;
	
Deneb System is a subject. Deneb IV is a subject. Deneb II is a subject.  Deneb sector is a subject.
The Space Marines are a subject. The 95th Sanitation Division is a subject.
Operation Dalmatian is a subject. It is not familiar.
Delphi Engine Controls Aleph-Null is a subject. It is not familiar.
Luna Spacewerks Parsec VI is a subject. It is not familiar. Understand "drive" as Luna Spacewerks Parsec VI.
Element Copernicium is a subject. It is not familiar.
Substance Injection is a subject. It is not familiar.
Delphi Engine Controls LLC is a subject. It is not familiar.
Orion Marine Academy is a subject. It is not familiar.
Deneb III planet is a subject. It is not familiar.
Space Authority is a subject.
The Space Force is a subject.
Pollux is a subject.
Explosion is a subject.
Location of the ship is a subject.
	
Table of data terminal Subjects
dt-subject (a thing)	dt-text-mulgrew (a text)	dt-text-arvax (a text)
Arvax	"Classified personnel data on [Arvax]: Master Sergeant Arvax has had a distinguished career in the Space Marines, but has come under scrutiny in recent years for alleged sympathies with separatist factions on Deneb IV. Military Intelligence has so far declined to move on Arvax, but urges commanding officers to exercise discretion in their dealings with him, and to remain vigilant for any suspicious behavior."	"Classified personnel data on [Arvax]: Master Sergeant Arvax has had a distinguished career in the Space Marines, with a top-secret deployment with Military Intelligence. He is currently posing as a separatist sympathizer on Deneb IV."
SS Usagi	"The SS Usagi is a light frigate in the Deneb system, with a crew of nine including the captain. It is currently helmed by Captain Jane Mulgrew.[familiarize Captain Jane Mulgrew] The ship's main drive is a Luna Spacewerks Parsec VI.[familiarize Luna Spacewerks Parsec VI]"	--
Captain Jane Mulgrew	"Captain Mulgrew is one of the most decorated captains in the Deneb sector.[familiarize Deneb sector] She was the second-youngest graduate of the Orion Marine Academy[familiarize Orion Marine Academy]. She received command of the SS Usagi[familiarize SS Usagi] after successfully leading the retaking of the capital of Pollux VI from Irion invaders from the moon of Pollux III."	--
Deneb System	"One of the most remote systems from Earth, it is not surprising that it would be troubled by separatist violence. There are sizable human populations on Deneb II[familiarize Deneb II] and Deneb IV[familiarize Deneb IV], as well as on the moon New Da Nang[familiarize New Da Nang]. There is also a small military settlement on Deneb III[familiarize Deneb III planet]."	--
Deneb IV	"Deneb IV, founded by anti-corporate ideologues who split off from Deneb II, has from the start had a popular separatist movement.[familiarize Deneb II]"	--
Operation Dalmatian  	""	"Operation Dalmatian is a top secret operation to infiltrate the Deneb IV separatist movement. The primary operative is [Arvax], who has been playing double agent to ingratiate himself with the terrorist leadership. Among other successes, he has confirmed that as many as three Space Marine captains are compromised by the separatists, although he has not been able to positively identify these captains."
Deneb II	"Once the jewel of Deneb sector and a paradise of natural splendor, over the last two centuries Deneb II has succumbed to creeping corporatization. The resulting degrading of the ecosphere is a primary reason for the exodus to Deneb IV and the separatist movement which has followed."
subj-rebooting-computer	"Rebooting the ship's computer during a mission is a risky operation that should only be attempted when absolutely necessary. It can be accomplished from the captain's data terminal. Due to the risk of short-term shutdown of critical systems during a reboot, vac suits should always be worn during the operation."
Deneb III planet	"A small rocky planet without atmosphere used as a Space Marines outpost."
Space Station Omicron-5	"The Deneb system outpost of the Space Authority."
Delphi Engine Controls Aleph-Null	"The Aleph-Null, by Delphi Engine Controls LLC[familiarize Delphi Engine Controls LLC], is a starship engine fuel injection process controller. It allows the mixture of up to five fuel components to create an energized product suitable for powering a starship drive. The Aleph-Null works by the method of substance injection[familiarize substance injection]."
Substance Injection	"A process by which one substance is 'injected' into another to create a product substance. This is an asymmetric operation, in that injecting substance A into substance B generally yields a different result than injecting substance B into substance A. Note that most injection combinations result in no product substance, as the resulting matter decays too rapidly to capture."	--
Luna Spacewerks Parsec VI	"The Luna Spacewerks Parsec VI is a starship engine used mainly by the Space Authority to drive light frigate class vessels. It is powered by Liquid Copernicium[familiarize Liquid Copernicium]."	--
Liquid Copernicium	"Liquid Copernicium is the liquid form of the element Copernicium[familiarize Copernicium]. It is a common starship fuel. It can be created by injecting Oganesson[familiarize Oganesson] into Red Matter[familiarize Red Matter]."	--
Element Copernicium	"Copernicium is an element with atomic number 112. It has symbol [bold type]Cn[roman type]. Its liquid form[familiarize liquid copernicium] is a common starship fuel. The melting point of Copernicium is 15 ºC, and its boiling point is 73 ºC."
Anti-Helium	"Anti-Helium is the anti-matter equivalent of Helium, possessing two positrons and two antiprotons. It is most notably used in the creation of Unobtainium[familiarize unobtainium] and Tachyon Crystals[familiarize tachyon crystals]."
Oganesson	"Oganesson is an element with atomic number 118. It is often used to create Liquid Copernicium[familiarize liquid copernicium]."
Red Matter	"Red Matter is an unstable, possibly impossible substance created by injecting Tachyon Crystals[familiarize Tachyon Crystals] into Unobtainium[familiarize unobtainium]."
Tachyon Crystals	"Rather than containing or being formed of tachyons, tachyon crystals get their name from their use in detecting tachyons, due to their negative refractive index. The typical method of creating tachyon crystals is injecting Anti-Helium[familiarize anti-helium] into Red Matter[familiarize red matter]. Tachyon Crystals can be used in the creation of Void Matter[familiarize void matter]."
Unobtainium	"Unobtanium can only be acquired by the injection of Anti-Helium[familiarize anti-helium] into Oganesson[familiarize oganesson], hence its legendary reputation for being difficult to obtain."
Void Matter	"Void Matter is essentially vacuum condensed into matter, according to the most comprehensible description we could find. It is an extremely unstable substance, and tends to explode catastrophically in the presence of high levels of energy. It can be created by injecting one source of tachyon crystals into another source of tachyon crystals[familiarize tachyon crystals]."
Delphi Engine Controls LLC	"Delphi Engine Controls LLC is an engine parts manufacturer based on Tethys, moon of Saturn."
Space Authority	"The Space Authority is the governing body of most human-controlled space. Its military is known as the Space Force. The Space Authority is a socialist society with a representative democracy."
The Space Force	"The Space Force is the military arm of The Space Authority."
Pollux	"Pollux is the brightest star in the Earth constellation of Gemini."
Fuel Injection	"Starship fuel injection is the process of 'injecting' one substance into another, creating a third substance at a higher energy level. See 'Substance Injection'[familiarize substance injection]."
Explosion	"There seems to have been some sort of explosion on Space Station Omicron-5 that ejected the SS Usagi from dock."
Galactic Translator	"A galactic translator functions according to Dr. P. Lismer's Theory of Universal Semantics. Most models are operated by inserting a thin object (such as a piece of paper) into the device."
Beacon	"A radio beacon broadcasts a radio signal on a dedicated frequency which by Space Authority regulations is continuously monitored by any space vessel."
Location of the ship	"[if computer-rebooted is true]We are currently on a collision course with the moon New Da Nang[otherwise]Unable to access navigation system. Please reboot the computer[end if]."

Does the player mean quizzing the computer about SS Usagi:
	It is very likely.
	
Does the player mean quizzing the computer about the portrait of the ship:
	It is unlikely.

persuasion rule for asking the computer to try doing something when the location is not the bridge and the location is not the captain's quarters:
	say "The ship computer cannot be accessed from here.";
	persuasion fails;

Instead of informing the ship computer about something:
	say "You can ask the ship computer about things, but you can't tell it anything.";
	
Instead of telling the ship computer about a topic:
	say "You can ask the ship computer about things, but you can't tell it anything.";
	
Instead of asking the computer about a topic when the location is not the bridge and the location is not captain's quarters:
	say "The ship computer cannot be accessed from here.";
	
Instead of quizzing the computer about something when the location is not the bridge and the location is not captain's quarters:
	say "The ship computer cannot be accessed from here.";
	
Instead of telling the computer about a topic when the location is not the bridge and the location is not captain's quarters:
	say "The ship computer cannot be accessed from here.";
	
Instead of informing the computer about something when the location is not the bridge and the location is not captain's quarters:
	say "The ship computer cannot be accessed from here.";

Instead of examining ship computer:
	say "The computer is an ambient presence. It's not actually in this room.";

Before doing something to the ship computer:	
	if "[action name part of current action]" is "asking it about":
		continue the action;		
	if "[action name part of current action]" is "answering it that":
		continue the action;		
	if "[action name part of current action]" is "informing it that":
		continue the action;				
	if "[action name part of current action]" is "telling it about":
		continue the action;		
	if the action requires a touchable noun and the noun is the ship computer:
		say "You can't touch [the ship computer].";
		stop the action;
	if the action requires a touchable second noun and the second noun is the ship computer:
		say "You can't reach [the ship computer].";
		stop the action;



Section 4 - The Desk

To say state and contents of desk drawer:
	If drawer is closed:
		say " which is closed";
	otherwise if something is in the drawer:
		say " which is open, revealing [a list of things in the drawer]";
	otherwise:
		say " which is open and empty";		


After printing the locale description for captain's quarters when the desk drawer is open:
	if something is in the drawer:
		Say "The desk drawer is open, revealing [a list of things in the drawer].";
	otherwise:
		say "The desk drawer is open and empty.";
		
Instead of searching the desk when the drawer is closed:
	Try opening the drawer;
		
Instead of searching the desk:
	Try searching the drawer;

Instead of opening the desk:
	Try opening the drawer instead;
	
Instead of closing the desk:
	Try closing the drawer instead;
	
Instead of removing something from the desk:
	try removing the noun from the drawer instead;
	
Does the player mean removing from the captain's desk:
	It is very unlikely;
	
Does the player mean inserting into the captain's desk:
	It is very unlikely;

The steel key is in the drawer. The steel key unlocks the port-side equipment locker. The steel key unlocks the starboard-side equipment locker. The description is "A shiny steel key".

The galactic translator is a container which is in the drawer. The printed name is "strange gadget". Understand "strange / gadget" as galactic translator.

Carry out taking the galactic translator (this is the activate translator hints rule):
	activate Table of Translator Hints;

A weight is a kind of thing.
A 9kg weight, a 15kg weight, a 29kg weight, a 32kg weight and a 50kg weight are weights in captain's quarters.
The mass of the 9kg weight is 9. The description is "A typical, round, black weight, with raised characters '9kg' on it."
The mass of the 15kg weight is 15. The description is "A typical, round, black weight, with raised characters '15kg' on it."
The mass of the 29kg weight is 29. The description is "A typical, round, black weight, with raised characters '29kg' on it."
The mass of the 32kg weight is 32. The description is "A typical, round, black weight, with raised characters '32kg' on it."
The mass of the 50kg weight is 50. The description is "A typical, round, black weight, with raised characters '50kg' on it."

after going to captain's quarters for the first time:
	activate table of weight hints;
	activate table of computer hints;
	continue the action;

after taking the 50kg weight:
	deactivate table of weight hints;
	continue the action;

Section 5 - The Galactic Translator

The description of the galactic translator is "[The galactic translator] is a large flat rectangle about three inches thick. The top is mostly taken up by a screen, except for two buttons, left and right. There is a long thin opening about the width of a piece of paper on the side, with a small button next to it.".

A left button, a right button, and a small button are buttons which are parts of the galactic translator.
The left button has description "This button is a left-pointing arrow."
The right button has description "This button is a right-pointing arrow."
The small button has description "A small, round, white button."
The galactic translator has a number called the page. 
The galactic translator has a carrying capacity 1.

Check inserting something into the galactic translator:
	If the noun is not flat:
		say "[The noun][if plural-named] don't[otherwise] doesn't[end if] fit in [the galactic translator]." instead;

Report inserting something into the galactic translator:
	If the noun is not translatable:
		say "[We] [insert] [the noun] into [the galactic translator], but nothing happens.";
		stop the action;
	otherwise:
		say "[We] [insert] [the noun] into [the galactic translator], and the screen lights up. It looks like [the noun], only translated into Standard Galactic.";
		Now the printed name of the galactic translator is "galactic translator";
		Now the page of the galactic translator is 0;
		try examining the galactic translator;
		stop the action;

After inserting the magazine into the galactic translator:
	deactivate the table of translator hints;
	continue the action;
		
Learned about Separatists is a truth state that varies.

To say activation code:
	If VSAC is 0:
		let X be a random number between 100000 and 999999;
		now VSAC is X;
	say VSAC;

To say activation code or not:
	If VSAC is 0:
		say "You have no idea what the activation code is. There's gotta be a way to figure it out";
	otherwise:
		say "The activation code is [VSAC]";

[The tellme of the vac suit activation code is "[activation code or not]."]

Carry out examining the galactic translator:
	If something (called T) is in the galactic translator:
		if T is not translatable:
			Say "The screen of [the galactic translator] is lit up, but the image of [the T] is no different from what you'd normally see.";
		if T is Stars Magazine:
			let P be the page of the galactic translator;
			if P is 0:
				say "The cover of Stars Magazine teases an issue full of Space Authority news exclusives, celebrity gossip, and useful space safety tips. It features a picture of a Space Marine spacewalking in a vac suit.";
			otherwise if P is 1:
				say "Page [P] of Stars Magazine is a discussion of the political status of the separatist movement on Deneb IV. [if Learned about Separatists is false]Booring[otherwise]How unexpectedly relevant[end if].";
			otherwise If P is 2:
				say "Page [P] of Stars Magazine follows the career of pop star Piscea Lycana. Not what you need to know about right now.";
			otherwise If P is 3:
				say "Page [P] of Stars Magazine compares several models of personal ground-to-orbit vehicles. If only they'd come down in price...";
			otherwise If P is 4: 
				say "Page [P] of Stars Magazine is the astrology section. Apparently this month you will face an unanticipated challenge.";
			otherwise if P is 6:
				say "Page [P] of Stars Magazine is a tutorial in vac suit operation for the non-technical. It details all kinds of important aspects of the suit, including:
				[line break][line break]
				  - The help command 'Suit, help'[line break]
				  - How to take the suit on and off.[line break]
				  - How to activate the suit: 'Suit, activation code <code>'[line break]
				  - The automatic pressurization system.[line break]
				  - How to operate the mag boots: 'Suit, mag boots on', 'Suit, mag boots off'.[line break]
				  - Monitoring suit status: 'Suit, report status'.[line break]
				  - How to look good while wearing the vac suit.
				
				The article strongly emphasizes that a typical vac suit does not contain a propulsion system, so care must be taken not to be spun off into deep space.
				
				Someone has scribbled [activation code] in the margin of the page.";
			otherwise:
				Say "Page [P] doesn't contain much of interest, just gossip and the occasional lifestyle piece.";
		say "[line break][The galactic translator] boasts a left button, a right button, and a small button next to a thin slot.";
		stop the action;
	continue the action;

Check examining Stars Magazine when Stars Magazine is in the galactic translator:
	Try examining the galactic translator instead;

Check pressing the left button when the list of translatable things in the galactic translator is empty:
	say "[The galactic translator] emits a short beep." instead;

Check pressing the right button when the list of translatable things in the galactic translator is empty:
	say "[The galactic translator] emits a short beep." instead;
			 
Check pressing the left button when a translatable thing is in the galactic translator:
	if the page of the galactic translator is 0:
		say "[The galactic translator] emits a short beep." instead;
			 
Check pressing the right button when a translatable thing (called T) is in the galactic translator:
	if the page of the galactic translator is the page count of T:
		say "[The galactic translator] emits a short beep." instead;
		
Carry out pressing the left button:
	Decrement the page of the galactic translator;
	
Report pressing the left button:
	Say "[The galactic translator] flips back a page.";
	Try examining the galactic translator;
		
Carry out pressing the right button:
	Increment the page of the galactic translator;
	
Report pressing the right button:
	Say "[The galactic translator] flips forward a page.";
	Try examining the galactic translator;
	
Check pressing the small button when nothing is in the galactic translator:
	say "[The galactic translator] emits a short beep." instead;

The galactic translator has an object called the former contents.

Carry out pressing the small button:
	If something (called T) is in the galactic translator:
		now T is carried by the player;
		now the former contents of the galactic translator is T;
		
Report pressing the small button:
	Say "[The galactic translator] ejects [the former contents of the galactic translator]. You take [them].";
	

Chapter 12 - Aft Airlock

Section 1 - Aft Entry 

The Aft Airlock Chamber is an airlock-chamber. It is familiar.

Aft Entry is down from Crew Quarters. "You are forward from the aft airlock, inside the ship. [if explosion happened is true]Outside is empty space where you're used to seeing the station gangway. Far off you see the luminous embers of what might have been an explosion.[otherwise]Beyond the airlock is the station gangway.[end if]

On your right is a control panel for the airlock. It consists of a green button to pressurize the airlock chamber, a yellow button to depressurize it, a red button to open and close the inner airlock door, and a blue button to open and close the outer airlock door.

The airlock is aft of here, and a ladder leads up to the ship proper.".

The aft airlock inner door is an inner airlock door. It is aft of Aft Entry and fore of Aft Airlock Chamber. The chamber of aft airlock inner door is aft airlock chamber. The aft airlock inner door is not scenery.
The aft airlock outer door is an outer airlock door. It is outside from Aft Airlock Chamber and inside from Spacewalk 1. The chamber of aft airlock outer door is aft airlock chamber. The aft airlock outer door is not scenery.

Aft Red Interior Button is an inner-door-opener-button in Aft Entry. It is scenery. The printed name is "red button". The chamber of the aft red interior button is aft airlock chamber.
Aft Blue Interior Button is an outer-door-opener-button in Aft Entry. It is scenery. The printed name is "blue button". The chamber of the aft blue interior button is aft airlock chamber.
Aft Green Interior Button is an Airlock-Pressurize-Button in Aft Entry. It is scenery. The printed name is "green button". The chamber of the Aft Green Interior Button is Aft Airlock Chamber.
Aft Yellow Interior Button is an Airlock-Depressurize-Button in Aft Entry. It is scenery. The printed name is "yellow button". The chamber of the Aft Yellow Interior Button is Aft Airlock Chamber.

The inner-door of the aft airlock chamber is aft airlock inner door.
The outer-door of the aft airlock chamber is aft airlock outer door.

Rule for writing a paragraph about the Aft Airlock Inner Door:
	say "[The aft airlock inner door] [are] [if closed]closed[otherwise]open[end if].";

Rule for writing a paragraph about the Aft Airlock outer Door:
	say "[The aft airlock outer door] [are] [if closed]closed[otherwise]open[end if].";


Section 2 - Aft Airlock Chamber

To say exit description for aft airlock chamber:
	If aft airlock inner door is open:
		Say ". You can go forward into the ship";
	Otherwise if aft airlock outer door is open:
		Say ". You can go out of the airlock into space";
	Otherwise:
		Say ". Both doors are closed; you'll have to open one to leave the airlock";

The description of Aft Airlock Chamber is "You are in the aft airlock chamber. You're one door away from the great void of space[exit description for aft airlock chamber].

On your right is a control panel for the airlock. It consists of a green button to pressurize the airlock chamber, a yellow button to depressurize it, a red button to open and close the inner airlock door, and a blue button to open and close the outer airlock door."

Aft Red Chamber Button is an inner-door-opener-button in Aft Airlock Chamber. It is scenery. The printed name is "red button". The chamber of the aft red chamber button is aft airlock chamber.
Aft Blue Chamber Button is an outer-door-opener-button in Aft Airlock Chamber. It is scenery. The printed name is "blue button". The chamber of the aft blue chamber button is aft airlock chamber.
Aft Green Chamber Button is an Airlock-Pressurize-Button in Aft Airlock Chamber. It is scenery. The printed name is "green button". The chamber of the Aft Green Chamber Button is Aft Airlock Chamber.
Aft Yellow Chamber Button is an Airlock-Depressurize-Button in Aft Airlock Chamber. It is scenery. The printed name is "yellow button". The chamber of the Aft Yellow Chamber Button is Aft Airlock Chamber.

After going to the aft airlock chamber for the first time:
	activate the table of vacuum hints;
	continue the action;	

After going to the engineering airlock chamber for the first time:
	deactivate the table of vacuum hints;
	continue the action;
	
Instead of going outside when location is the aft airlock chamber and the aft airlock inner door is open:
	try going fore;

Instead of going inside when location is aft entry and aft airlock inner door is open:
	try going aft;

Chapter 13 - Spacewalk

The the you-can-also-see rule response (F) is " [if location is offboard]floating [end if]here".

The printed name of Spacewalk 1 is "Outside the Aft Airlock". The description of Spacewalk 1 is "[if vac suit is not mag boots activated]You are floating in the blackness of space outside of the aft airlock.[otherwise]You are standing on the hull of the ship, outside the aft airlock, secured by your vac suit's mag boots.[end if] Most of the hull is taken up by the protrusions of various machinery, antennae, radio dishes, and heat sinks. There is a clear path to fore among the obstructions.".

The printed name of Spacewalk 2 is "Hull of the Usagi". The description of Spacewalk 2 is "Here the path runs aft to the aft airlock and starboard to the engineering airlock. [if broke debris is false]Your path to starboard is blocked by a piece of debris lodged in the hull. [think thought 6] It's going to be tough to get over; it doesn't look magnetic, so you'll have to do it without the help of your mag boots.[otherwise]Where there used to be a large embedded chunk of debris blocking the path, now there is a scattering of rubble.[end if]";

The large piece of debris is a thing in Spacewalk 2. It is scenery. The description is "This approximately 4' diameter chunk of debris seems to be made up of plastic and other non-metallic materials. It must have been travelling at quite a speed to embed itself in the hull like it did.".

The small piece of debris is a thing in Spacewalk 2. "It looks like you could break off a small piece of debris." The description is "It seems like a chunk of what might have been terracotta tile before it was blown up.";

Instead of attacking or taking the small piece of debris when the small piece of debris is not handled: 
	say "You break off a piece of the debris.";
	now the player carries the small piece of debris;
	
Breaking off is an action applying to one thing. Understand "break off [the small piece of debris]" as breaking off.

Check breaking off the small piece of debris:
	if location is spacewalk 2 and the small piece of debris is handled:
		say "There are no more easy pieces to break off." instead;
	otherwise if the location is not spacewalk 2:
		say "There is nothing here to break off." instead;

Carry out breaking off the small piece of debris:
	now the player carries the small piece of debris;
	
Report breaking off the small piece of debris:
	Say "You break off a piece of the debris.";

Broke debris is a truth state that varies.
Got Past Debris is truth state that varies.
Floating is a truth state that varies.
Instead of going starboard from Spacewalk 2 when Got Past Debris is false and floating is false:
	say "You attempt to climb over the debris. Just when you think you're over, your foot catches, and you lose your hold. The result: you're floating about a foot from the hull, unable to make contact with your mag boots to pull yourself down. You're barely moving relative to the hull, but you're stuck here. The bright side? You broke down the debris enough that it's no longer a barrier.[paragraph break]";
	think "Okay, stay calm. Don't freak out.";
	Now floating is true;
	Now broke debris is true;
	Now room modifier is "floating";
	Now the large piece of debris is nowhere;
	if the small piece of debris is not handled:
		now the small piece of debris is nowhere;
	activate the table of floating hints;
	try looking;
	
Instead of going when floating is true:
	say "Floating as you are, you can't move in any direction.";
	
Instead of jumping when floating is true and the location is an offboard room:
	say "You can't jump when you're not standing on anything.";
	
Instead of throwing something when floating is true and suit is mag boots activated:
	Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you're attached to the hull again.[paragraph break]";
	Think "Oh thank god! I thought I was a goner.";
	now floating is false;
	Now room modifier is "";
	Now got past debris is true;
	now the noun is nowhere;
	deactivate the table of floating hints;
	try looking;
	
Instead of throwing something when floating is true and suit is not mag boots activated:
	if player carries the beacon:
		if ship is in self-destruct mode:
			Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Moments later the ship detonates, but you are far too close. You are vaporized in a wave of roaring Void Matter.";
			end the story saying "You have died saving New Da Nang.";
		otherwise:
			Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
			end the story saying "You have saved yourself in a disgraceful act of cowardice.";
	otherwise:
		Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. It's a long and lonely way to die.";
		end the story saying "You have died.";

The printed name of Spacewalk 3 is "Outside the Engineering Airlock".

Spacewalk 2 is fore from Spacewalk 1.

Spacewalk 3 is starboard from Spacewalk 2. "[if vac suit is not mag boots activated]You are floating in the blackness of space outside the engineering airlock.[otherwise]You are standing on the hull of the ship, outside the engineering airlock, secured by your vac suit's mag boots.[end if] Most of the hull is taken up by the protrusions of various machinery, antennae, radio dishes, and heat sinks. There is a clear path to port among the obstructions.";

The engineering airlock black button is a button in spacewalk 3. It is fixed in place. The description is "It's a button. It's colored black. It's on the airlock door. Guess what it does."

Rule for writing a paragraph about the engineering airlock black button:
	Say "There is a black button on the airlock door.";

[Instead of examining the engineering airlock outer door:
	Say "Upon examining [the engineering airlock outer door] closely, you discover a concealed compartment that pops open at a touch, revealing a black button.";
	Now the engineering airlock black button is in spacewalk 3.]
	
Instead of pressing the engineering airlock black button when the engineering airlock outer door is closed:
	now the engineering airlock outer door is open;
	now the engineering airlock chamber is vacuum;
	say "The engineering airlock door opens.";
	
Instead of pressing the engineering airlock black button when the engineering airlock outer door is open:
	now the engineering airlock outer door is closed;
	say "The engineering airlock door closes.";
	
The aft airlock black button is a button. It is fixed in place. The description is "It's a black button."

Rule for writing a paragraph about the aft airlock black button:
	Say "There is a black button on the airlock door.";

Instead of examining the aft airlock outer door:
	Say "Upon examining [the engineering airlock outer door] closely, you discover a concealed compartment that pops open at a touch, revealing a black button.";
	Now the aft airlock black button is in spacewalk 1.
	
Instead of pressing the aft airlock black button when the aft airlock outer door is closed:
	now the aft airlock outer door is open;
	now the aft airlock chamber is vacuum;
	say "The aft airlock door opens.";
	
Instead of pressing the aft airlock black button when the aft airlock outer door is open:
	now the aft airlock outer door is closed;
	say "The aft airlock door closes.";

Spacewalk 1 is vacuum. Spacewalk 2 is vacuum. Spacewalk 3 is vacuum.
Spacewalk 1 is offboard. Spacewalk 2 is offboard. Spacewalk 3 is offboard.

Deep Space is outside from Spacewalk 1 and outside from Spacewalk 2 and outside from Spacewalk 3. "If you're here, you're already dead.".

Instead of going outside when location is an offboard room and destruct in progress is false:
	if player carries the beacon:
		Say "You propel yourself away from the ship. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
		end the story saying "You have saved yourself in a disgraceful act of cowardice.";
	otherwise:
		Say "You propel yourself away from the ship, realizing too late you have no way to get back. You drift through the blackness of space until your air runs out and you suffocate.";
		end the story saying "You have died";
	
Instead of going outside when location is an offboard room and destruct in progress is true:
	end game destruct;
	
To end game destruct:
	if player carries the beacon:
		say "You propel yourself away from the ship, away from the explosion that follows moments later. You switch on your beacon. Hours later, after you'd given up hope, a ship of the Space Marines finds you and brings you home. You are sorry you couldn't save the SS Usagi, but for your part in saving the people of New Da Nang, you receive a medal for meritorious service and are promoted to Lance Corporal.";
		End the story saying "You saved New Da Nang, but lost the ship.";
	otherwise:
		say "You propel yourself away from the ship, away from the explosion that follows moments later. However, in the blackness of space, there is no way anyone will find you. You float until you run out of air and suffocate.";
		End the story saying "You died saving New Da Nang.";

Instead of jumping when location is an offboard room:
	if vac suit is mag boots activated:
		Say "You can't even begin to jump in these mag boots.";
	otherwise if destruct in progress is true:
		end game destruct;
	otherwise:
		Say "You propel yourself away from the ship, realizing too late you have no way to get back. You drift through the blackness of space until your air runs out and you suffocate.";
		end the story saying "You have died";
	
After going to a room (called R2) when player is wearing vac suit and the vac suit is not mag boots activated and R2 is offboard:
	if destruct in progress is true:
		end game destruct;
	otherwise:
		Say "You take a step on the hull of the ship, and keep going, and going... Should have turned those mag boots on.";	
		think "Oops.";
		End the story saying "You float forever in the vastness of space"; 
		
test spacewalk with "random/f/u/s/z/z/z/get up/take all/s/d/u/p/take wallet/s/clean slot with vacuum/slide card through slot/a/open desk/take all from drawer/f/s/take magazine/put magazine in strange gadget/press right button/press right button/press right button/press right button/press right button/press right button/p/p/open wallet/put military id in slot/unlock locker with key/open locker/take vac suit/drop all/take vac suit/remove uniform/drop it/take vac suit/wear it/take wallet/take id from wallet/suit, activation code 1/s/d/press red button/a/press red button/press yellow button/press blue button/suit, mag boots on/out/f";
	
[test segment1 with "random/f/u/s/z/z/z/get up/take all/s/d/u/p/take wallet/s/clean slot with vacuum/slide card through slot/a/open desk/take all from drawer/f/s/take magazine/put magazine in strange device/press right button/press right button/press right button/press right button/press right button/press right button/p/p/open wallet/put military id in slot/unlock locker with key/open locker/take vac suit/drop all/take vac suit/remove uniform/drop it/take vac suit/wear it/take wallet/take id from wallet/suit, activation code 1/s/d/press red button/a/press red button/press yellow button/press blue button/suit, mag boots on/out/f/s/throw wallet/s/press button/in/press blue button/press green button/remove suit/press red button/p/f/hello/tell caller about me/push trunk/press button/yes/hello/ask mulgrew about arvax/d/a/p/look under right bottom bunk/drop suit/take trunk and duster/s/s/drop trunk/stand on trunk/clean locker with duster/get off/take card/p/a";

test win with "test segment1/computer, access code 2/computer, emergency protocols/computer, reboot/f/f/u/hello/a/a/x diagram/Og > 1/AH > 2/TC > 3/Og > 4/f/slide engineering card through slot/take tool/f/f/open pilot's access panel with tool/open it/a/d/take pot/take hook/u/a/p/cut hook with saw/s/f/f/fix board with hook/a/set gravity control to 1/d/a/a/take weights/f/f/u/a/a/s/put 29kg on right/put 32kg on right/put 50kg on left/put 15kg on left/p/f/f/ask arvax about ss usagi".

test proto with "test segment1/computer, access code 3/computer, emergency protocols/z".

test proto2 with "test segment1/f/p/take suit/wear suit/s/f/u/a/sit in station/f/d/a/a/computer, access code 3/suit, activation code 1/computer, emergency protocols/f/f/u/hello/ask arvax about ss usagi".

test suicide with "test proto2/a/a/TC > 4/AH > 3/TC > 2/Un > 1/press button".

test suicide1 with "test suicide/f/s/press red button/press yellow button/out".

test suicide2 with "test suicide/z/z/z/z/z/z/z/z/z/z".]

Chapter 14 - Space Station

Space Station Gangway is a room. "This is the pressurized bridge from Space Station Omicron-5 to the SS Usagi. Behind you the safety of home, before you the promise of adventure... cleaning up after space marines. Such is the lot of the 95th Sanitation Division. Not what you dreamed of when you enlisted. 

As is usual, the crew is all off the ship while you board to clean it. You usually have a partner, but today Private 'Chubby' Franks has the flu, so it's your job alone.

To the fore is the aft airlock of the Usagi, beckoning you in.

[think]Better get a move on, I guess[think end][if accessible is false], you think.[end if]";

Room of subjects is fore of space station gangway. 

After looking while location is Space Station Gangway:
	tip "[if accessible is false]Tip: [end if]Type 'help' to learn about this game, and interactive fiction in general.";

Instead of doing something other than going or looking or taking inventory when location is Space Station Gangway:
	say "You have a job to do. No messing around.";

Instead of going fore when the location is the space station gangway:
	Say "You pass through the aft airlock and into the ship, closing the airlock doors behind you."; 
	now player is in aft entry;

Instead of going inside when the location is the space station gangway:
	try going fore;
	
mistakes in aft entry is a number that varies.
	
Check going aft when location is aft entry and Explosion happened is false (this is the don't leave at the beginning of the story rule):
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in aft entry;
	if mistakes in aft entry is 3:
		say line break;
		tip "Try going up: enter 'u'.";
	stop the action;
	
Instead of going outside when location is Aft Entry and explosion happened is false:
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in aft entry;
	if mistakes in aft entry is 3:
		say line break;
		tip "Try going up: enter 'u'.";
	stop the action;
	
Instead of doing something other than going or looking or taking inventory when location is Aft Entry and explosion happened is false:
	say "Time's a-wasting, best get going.";
	increment mistakes in aft entry;
	if mistakes in aft entry is 3:
		say line break;
		tip "Try going up: enter 'u'.";
	
Instead of going nowhere when location is Aft Entry and explosion happened is false:
	tip "Try going up: enter 'u'.";

Book 4 - The Player

The player is in Space Station Gangway. The description is "[If the player is wearing the military sanitation uniform][We] [look] fantastic in [our] [military sanitation uniform][otherwise if the player is wearing the vac suit][The vac suit] doesn't really suit [us][otherwise][We] [look] great, no matter [we] [wear] (or don't, as it were)[end if].".

The maintenance crew access card is an access card. [The tellme is "This card will get you through any doors you need to get through so you can do your job.".] The description is "It says in big friendly letters, 'Maintenance Access Card', alongside a photo of [yourself].".

The player is carrying a sonic decontaminator, a hand-held micro-compressing vacuum cleaner, the maintenance crew access card, and an extendable dusting device.
The player is wearing a military sanitation uniform. The description of the military sanitation uniform is "With its bright yellow and green patch, this uniform certainly makes a bold fashion statement.".
Understand "duster" as the extendable dusting device.
The extendable dusting device is a cleaner. The description is "The duster is a short device which extends to be a long one, sporting a cylindrical halo of electrostatic material at its end."
The hand-held micro-compressing vacuum cleaner is a cleaner. The description is "It's a small hand-held vacuum cleaner. It compresses dust and dirt into a tiny cube."
The sonic decontaminator is a cleaner. The description is "[The sonic decontaminator] is the latest in portable sanitation technology, destroying 99% of toxins of chemical or biological origin with the power of sound."
The sonic decontaminator, hand-held vacuum cleaner, maintenance crew access card, dusting device, and military sanitation uniform are property of the player.

Book 5 - Masses of Things

The mass of the wallet is 0.5.
The mass of the photo is 0.1.
The mass of the ID card is 0.1.
The mass of the copy of stars magazine is 0.5.
The mass of the steel key is 0.2.
The mass of the galactic translator is 2.
The mass of the maintenance crew access card is 0.1.
The mass of the sonic decontaminator is 2.
The mass of the hand-held vacuum cleaner is 3.
The mass of the extendable dusting device is 1.5.
The mass of the military sanitation uniform is 4.

Book 6 - Special Looking Behavior

Rule for printing the name of a room (called R):
	say "[printed name of R]";
	let L be a list of texts;
	if R is vacuum, add "vacuum" to L;
	if room modifier is not "":
		add room modifier to L;
	if number of entries in L is 1:
		say " ([entry 1 of L])";
	otherwise if number of entries in L is 2:
		say " ([entry 1 of L], [entry 2 of L])";

Room modifier is a text that varies.

Book 7 - Talking to Arvax
	
Before answering someone that:
	say "I'm not sure what you're trying to say. I might just not recognize the words you're using." instead;
	
Before asking Arvax about "himself":
	try quizzing arvax about arvax instead;
	
Before asking Captain Mulgrew about "herself":
	try quizzing Captain Mulgrew about Captain Mulgrew instead;

Before asking someone about a topic:
	say "'I'm afraid I don't know anything about that.'";
	reset turns in state instead;
	
Before telling someone about a topic:
	say "'I'm afraid I don't know anything about that.'";
	reset turns in state instead;
	
Check showing something to Arvax:
	say "[The arvax] is on the radio. [They] can't see you." instead;
	
Check showing something to captain mulgrew:
	say "[The captain mulgrew] is on the radio. [They] can't see you." instead;

reaching inside for The Room of Stuff (this is the reaching inside the room of stuff rule):
	rule succeeds;

identity of the player is a fact.
	
The ship computer is a thing in the room of stuff. Understand "system" as the ship computer. Ship Computer is addressable. It is familiar.

Understand "ship" as the SS Usagi.

Chapter 1 - States

Understand "caller" as Arvax.

A conversation state is a kind of object.
A conversation state has a text called reminder text.
A conversation state has a person called primary driver.

Turns in state is a number that varies.

null state is a conversation state.
making contact is a conversation state. The reminder text is "You might try saying hello.". The primary driver is Arvax.
establishing the situation is a conversation state. The reminder text is "[the arvax] is waiting for you to tell him something about yourself.". The primary driver is Arvax.
waiting for yes is a conversation state. The reminder text is "[the arvax] wants to know if you're up to the task.". The primary driver is Arvax.
mulgrew breaks in is a conversation state. The primary driver is Captain Mulgrew.
cs-end-game-reboot is a conversation state. The primary driver is Arvax.
cs-end-game-protocols is a conversation state. The primary driver is Arvax.

The current conversation state is a conversation state that varies.
The current conversation state is making contact.

To decide whether talking about (CS - a conversation state):
	decide on whether or not the current conversation state is CS;

To talk about (CS - a conversation state):
	now the current conversation state is CS;
	now turns in state is 0;		
		
Asking for attention by something is an activity on people. 	

To reset turns in state:
	now turns in state is 0;
	
This is the reset turns in state rule:
	reset turns in state;
	
The reset turns in state rule is listed first in the report asking it about rules. 
The reset turns in state rule is listed first in the report quizzing it about rules. 
The reset turns in state rule is listed first in the report telling it about rules. 
The reset turns in state rule is listed first in the report informing it about rules. 
The reset turns in state rule is listed first in the report requesting it for rules. 
The reset turns in state rule is listed first in the report imploring it for rules. 
The reset turns in state rule is listed first in the report giving it to rules. 
The reset turns in state rule is listed first in the report showing it to rules. 
The reset turns in state rule is listed first in the report saying yes rules. 
The reset turns in state rule is listed first in the report saying no rules. 
The reset turns in state rule is listed first in the report saying sorry rules.
The reset turns in state rule is listed first in the report answering it that rules.

block answering rule response (A) is "'I'm afraid I don't know anything about that.'".
block informing rule response (A) is "'I'm afraid I don't know anything about that.'".
block quizzing rule response (A) is "'I'm afraid I don't know anything about that.'".
block telling rule response (A) is "'I'm afraid I don't know anything about that.'".
block asking rule response (A) is "'I'm afraid I don't know anything about that.'".

Report imploring someone for something (this is the block imploring rule):
	say "[There] [are] no reply." (A).
	
Section 1 - Making Contact

Before doing something to Arvax when talking about making contact:
	if action name part of the current action is not the saying hello to action:
		say "[text of parser error internal rule response (E)][line break]";
		stop;

After saying hello to Arvax when talking about making contact:
	say "You call out 'Yes! I'm here! I'm here! What's going on?'[paragraph break]";
	talk about establishing the situation;
	print "[The Arvax] responds, 'Ahoy there, SS Usagi, good to hear from you. Seems like you're a bit out of sorts, and we'd like to help you out. But before we get into that, who am I speaking to? Tell me about yourself.'[line break]" as arvax near communications console;
	
Section 2 - Establishing the Situation

Response of Arvax when told about the player and talking about establishing the situation:
	if Arvax knows identity of the player:
		say "[We] already told [the Arvax] about [ourselves].";
	otherwise:
		say "You tell [the arvax] that you're a ship cleaner of the 95th Sanitation Division.[paragraph break]";
		now arvax is familiar; 
		now arvax knows identity of the player;
		now arvax is proper-named;
		print "'Alright then, Captain Clean, I'll fill you in. Space Station Omicron-5 was bombed by separatists from Deneb IV. By some miracle the Usagi was spared the worst of the blast; you were thrown clear of the station. Only problem is now you're hurtling towards New Da Nang, a heavily-populated moon of Deneb II. An impact there would kill not only you but potentially thousands of people more.[paragraph break]
		   'So we've got some work to do. I'm [arvax]. I'm going to try and help you get this ship under control again. First we have to establish, though, what the ship is currently doing. Normally, I'd be able to tap into the ship diagnostics and controls from here on Deneb III, but something seems to have gone wrong. So I'm going to need your help. Are you up to the task?'[paragraph break]" as arvax near communications console;
		think "Captain Clean, guy thinks he's funny.";
		now learned about separatists is true;
		talk about waiting for yes;

To reply to yes:
	talk about mulgrew breaks in;
	activate the Table of Trust Hints;
	print "'Great, great. Now let's get to work.[paragraph break]
	'The first thing I need you to do is reboot the system, using the captain's data terminal. Once you do that, hopefully I'll be able to access ship controls. You'll have to use my security code: say [']computer, access code [Arvax's code]['] and then...'[paragraph break]" as arvax near communications console;
	say "[The Arvax]'s voice breaks up and another voice comes over comms. [run paragraph on]";
	print "'SS Usagi, this is Captain Jane Mulgrew, please come in. Repeat, this is Captain Mulgrew of the SS Usagi, Usagi come in.'[paragraph break]" as Jane Mulgrew near communications console;
	think "Somebody else?";
	now the data terminal is familiar;	

Response of Arvax when saying yes and talking about waiting for yes:
	reply to yes;
	
Response of Arvax when saying no and talking about waiting for yes:
	say "'Come now, surely there's no reason for such a negative attitude?'";

Speech Help Tipped is truth state that varies.	

For asking for attention by Arvax while current conversation state is making contact:
	print "A man's voice comes over comms: '[one of]SS Usagi, come in! Is anyone there?[or]If there's anyone on the Usagi, please respond![or]Usagi, are you there?[or]Come in, Usagi, Come in, Usagi.[purely at random]'[paragraph break]" as arvax near communications console;
	if location is Operations and Speech Help Tipped is false:
		think "Finally, another person! I'm saved!";
		tip "By the way... you can get help about speaking to other characters by typing 'help speech'.";
		now speech help tipped is true;
	make no decision;
	
For asking for attention by Arvax while current conversation state is establishing the situation:
	print "'[one of]You still there?'[or]Come in Usagi!'[or]If you're there, just tell me a little bit about yourself.'[or]Usagi, come in!'[purely at random][line break]" as arvax near communications console;
	make no decision;
	
For asking for attention by arvax when the primary driver of the current conversation state is Arvax and location is operations (this is the Arvax reminder text rule):
	if turns in state > 3 and the reminder text of current conversation state is not "" and the remainder after dividing turns in state by 4 is 0:
		tip "[the reminder text of current conversation state]";
	make no decision;
	
For asking for attention by Captain Mulgrew when the primary driver of the current conversation state is Captain Mulgrew and location is operations (this is the Captain Mulgrew reminder text rule):
	if turns in state >= 3 and the reminder text of current conversation state is not "" and the remainder after dividing turns in state by 4 is 0:
		tip "[the reminder text of current conversation state]";
	make no decision;

The Arvax reminder text rule is listed last in the for asking for attention by rules.
The Captain Mulgrew reminder text rule is listed last in the for asking for attention by rules.
the for asking for attention by rules have default no outcome.

For Asking for attention by Arvax while current conversation state is waiting for yes:
	print "'[one of]Well, Captain Clean?[or]Yes or no?[or]C'mon, you can do this.[purely at random]'[line break]" as arvax near communications console;
	make no decision;
	
For Asking for attention by Arvax when current conversation state is asking mulgrew questions:
	print "[Arvax]: ''Hey, friend, we need to reboot the computer soon before it's too late.'[line break]" as Arvax near communications console;

System rebooted is a truth state that varies.

Response of Arvax when asked-or-told about the vac suit:
	print "'There's a refill station in the Engineering deck. Should be simple enough to operate.[run paragraph on][if system rebooted is false] There's a chance of a short outage in the environmental system during a system reboot. Better get that suit refilled first.'[end if][line break]" as Arvax near communications console;
	reset turns in state;

Every turn when not talking about asking mulgrew questions:
	if turns in state > 0 and the remainder after dividing turns in state by 2 is 0:		
		Carry out the asking for attention by activity with Arvax;
	if turns in state > 0 and the remainder after dividing turns in state by 2 is 0:		
		Carry out the asking for attention by activity with Captain Mulgrew;
	increment turns in state;

Every turn when talking about asking mulgrew questions:
	if turns in state > 0 and the remainder after dividing turns in state by 4 is 0:		
		Carry out the asking for attention by activity with Arvax;
	if turns in state > 0 and the remainder after dividing turns in state by 4 is 2:		
		Carry out the asking for attention by activity with Captain Mulgrew;
	increment turns in state;

Book 8 - Mulgrew

Asking Mulgrew Questions is a conversation state. The primary driver is Captain Mulgrew.

Mulgrew Breaks In has reminder text "Captain Mulgrew is waiting for you to respond.";

For asking for attention by Captain Mulgrew when current conversation state is mulgrew breaks in:
	print "Captain Mulgrew: '[one of]Hello, Usagi![or]Come in, Usagi![or]Anyone there, Usagi?[or]We hear you, Usagi, please respond.[purely at random]'[paragraph break]" as Captain Mulgrew near communications console;	

Before doing something to Captain Mulgrew when talking about mulgrew breaks in:
	if action name part of the current action is not the saying hello to action:
		say "[text of parser error internal rule response (E)][line break]";
		stop;
	
After saying hello to Captain Mulgrew when talking about mulgrew breaks in:
	print "Captain Mulgrew responds, 'Hello there, Usagi. That's my ship you've got there. Be careful with her.
	
	'We've been listening in and we've heard your communications with Arvax. He had us jammed for a while, but we managed to break through and here we are. Now it's very important that you understand this: Arvax is not your friend. His allegiances lie with Deneb IV, not with the Space Authority. He would like nothing more than to see this ship wipe out a few neighborhoods on New Da Nang.
	
	'So what we need you to do is deny Arvax by shutting down any access to the ship's controls from the outside by invoking the emergency protocols. That will put the ship in a state where we can board and take control of the ship. What do you say? Do you have any questions?'[paragraph break]" as Captain Mulgrew near communications console;
	say "[Arvax]'s voice comes back over the radio: ";
	print "'You there still, Usagi? I think I lost you for a second.'[line break]" as Arvax near communications console;
	say line break;
	think "Oh no, how am I going to tell whom to trust?";
	Now Captain Mulgrew is familiar;
	Now emergency protocols is familiar;
	Now the current conversation state is Asking Mulgrew Questions;
	reset turns in state;

The reminder text of asking mulgrew questions is "Captain Mulgrew is waiting for you to agree, or ask further questions.";	

For asking for attention by Captain Mulgrew while current conversation state is asking mulgrew questions:
	print "Captain Mulgrew: '[one of]Did I lose you, Usagi?[or]Any questions?[or]Calling the SS Usagi...[or]What'll it be, Usagi?[purely at random]'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about Captain Mulgrew:
	print "'I'm Captain Jane Mulgrew of the SS Usagi. I've been around the Deneb system for a long time, and I know it like the back of my hand. I've dealt with the separatists before, and I've seen enough to know just how cutthroat they are. I won't hesitate to protect the people of the Space Authority from such terrorists.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about SS Usagi:
	print "'Finest fighting ship in the system. Proud to captain her.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about Arvax:
	print "'Arvax is a traitor pure and simple. If you haven't yet, consult his file through my data terminal in my quarters.'[line break]" as Captain Mulgrew near communications console;
	Now the data terminal is familiar;
	
Response of Captain Mulgrew when asked about separatists:
	print "'There's no room for shades of grey with them. Wipe them all out.'[line break]" as captain mulgrew near communications console;
	
Response of Captain Mulgrew when asked about Deneb IV:
	print "'Beautiful planet, held hostage by those terrorist maniacs.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about computer:
	print "'You won't have much use for it up on the bridge because you lack the command codes, but the data terminal in my quarters should be useful.'[line break]" as Captain Mulgrew near communications console;
	Now the data terminal is familiar;	
	
Response of Captain Mulgrew when asked about Da Nang:
	print "'I'm not sure why they couldn't have just used a normal name, like New New Jersey or something, but still, you'd hate to see anything happen to the place.'[line break]" as Captain Mulgrew near communications console;

Emergency protocols is a subject. It is not familiar.	

Response of Captain Mulgrew when asked about subj-rebooting-computer:
	print "'Don't be too hasty to reboot the computer. Once that's done, Arvax can get control of the ship and we won't be able to get it back. We need to activate the ship's emergency protocols. The computer will reboot itself if necessary.'[line break]" as Captain Mulgrew near communications console;
	Now emergency protocols is familiar;
	
Response of Captain Mulgrew when asked about emergency protocols:
	print "'To prevent Arvax from seizing control of the ship remotely, we need to put the ship in a mode where it ignores all data communications. Voice radio will still be able to get through, but communications with the computer from outside will cease.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when told about Arvax:
	print "'Yes, I know, we've heard you. I'll reiterate my warning about Arvax: his loyalties lie with Deneb IV, not the Space Authority.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked-or-told about vac suit:
	print "'Shouldn't need it.'[line break]" as Captain Mulgrew near communications console;
	
mulgrew's-code is a subject. It is not familiar.
security code is a subject.
	
To say Mulgrew's code:
	if Mulgrew's security code is 0:
		now mulgrew's security code is a random number between 10000 and 99999;
	If mulgrew's security code is arvax's security code:
		now mulgrew's security code is arvax's security code - 1;
	say "[mulgrew's security code]";
	
To say Arvax's code:
	if Arvax's security code is 0:
		now Arvax's security code is a random number between 10000 and 99999;
	say "[arvax's security code]";

Response of Captain Mulgrew when asked about the data terminal:
	print "'Ah yes, I suppose you'll need access to that. It's in my quarters. Just say: [']Computer, access code [Mulgrew's code]['].'[line break]" as captain mulgrew near communications console;
	now mulgrew's-code is familiar;
	
Response when saying yes and current conversation state is asking mulgrew questions:
	say "what?";
	
Section 1 - Revenge of Arvax
	
Response of Arvax when asked about Da Nang:
	print "'Never been there, and I'll never get the chance if we don't act fast.'[line break]" as Captain Mulgrew near communications console;
	
Response of Arvax when asked about SS Usagi:
	print "'Great ship. I hope we can save her. And you.'[line break]" as Arvax near communications console;

Response of Arvax when asked-or-told about Captain Mulgrew and talking about asking mulgrew questions:
	print "'Let me guess. She told you I'm a separatist stooge, right? I guess it's time to blow my cover. I've been cultivating that image for several years now to infiltrate Deneb IV. Here. Look up 'Operation Dalmatian' in Mulgrew's data terminal.'[line break]" as Arvax near communications console;	
	Now operation dalmatian is familiar;	
	Now the data terminal is familiar;
	
Response of Arvax when asked-or-told about Captain Mulgrew and talking about cs-end-game-protocols:
	print "'Seems like she was one of the bad ones. I was suspicious when I learned she had escaped the space station explosion.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about Captain Mulgrew and talking about cs-end-game-reboot:
	print "'Wonder where she went? It suspicious that she disappeared after you didn't follow orders.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about Operation Dalmatian:
	print "'Read about it on the captain's data terminal.'[line break]" as Arvax near communications console; 
	
Response of Captain Mulgrew when asked about Operation Dalmatian and talking about asking mulgrew questions:
	print "'Never heard of it. No doubt another of Arvax's lies.'[line break]" as Captain Mulgrew near communications console;

Response of Arvax when asked-or-told about the data terminal:
	print "'It's in the captain's quarters. You'll need my security code: [arvax's security code].'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about the security code:
	print "'It's [arvax's security code].'[line break]" as Arvax near communications console;
	
Response of Captain Mulgrew when asked about the security code and talking about asking mulgrew questions:
	if mulgrew's-code is familiar:
		print "'It's [mulgrew's security code].'[line break]" as captain mulgrew near communications console;
	otherwise:
		print "'If you need to know, I'll tell you.'[line break]" as captain mulgrew near communications console;

Response of Arvax when asked about subj-rebooting-computer and talking about asking mulgrew questions:
	print "'Before rebooting, make sure your vac suit is full and on. Life support can go out during a reboot.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about emergency protocols and talking about asking mulgrew questions:
	print "'I can't tell you for sure what those might be, but often they have to do with expelling a hostile presence from the ship. Be careful. I'm beginning to wonder... I know there are captains compromised by the separatists, but I don't know who they are. Beware of trusting anyone too far.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about Arvax:
	print "'I'm just an old Marine trying to do his duty.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about Deneb IV:
	print "'What a sad story. The founders were thoroughly admirable idealists whose vision has now been corrupted by power-hungry extremists.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about separatists:
	print "'Merely killing terrorists won't gain the Space Authority sympathy on Deneb IV. We need to be friends to the people there, who are just as threatened by the separatists as we are.'[line break]" as Arvax near communications console;
	
Section 2 - Arvax End Game - Reboot

To win the game:
	say "[line break]Arvax continues, 'Diverting SS Usagi to Deneb III. Rendezvous with retrieval crew in approximately twenty-eight minutes.
	
	'Captain Clean, this couldn't have happened without you. You deserve to be a hero on New Da Nang, but unfortunately we need to keep
	this incident secret, as will no doubt be emphasized at your debriefing.
	
	'You are to be especially commended for your judgment in determining the correct course of action when presented with a difficult
	choice. We have determined that Captain Mulgrew has been working with the separatists and was at the center of the Omicron-5 bombing.
	She has been apprehended and will face the most severe justice permitted by the Space Authority.
	
	'Now, soldier, time to relax. The crew will be there soon to pick you up.'
	
	You stroll to the bridge where you take a seat in the captain's chair and reflect on your accomplishment. When you get to the Deneb III space
	platform, you are whisked off for a series of debriefings and meetings.
	
	At the end of the day, you can barely sleep, as the newest member of the 95th Sanitation Division Special Maintenance Force. Adventure at last!";
	End the story finally saying "You have saved New Da Nang, the SS Usagi, and yourself!";
	
To decide whether problems exist:
	decide on whether or not ship is not fixed.
	
To say problems description:
	let num-problems be 0;
	let problems be a list of texts;
	if the loose circuit board is not tightened:
		add "the helm is not responding to any commands" to problems;
		increment num-problems;
	if the starboard balance is not 0:
		add "there is some physical issue with the starboard engine" to problems;
		increment num-problems;
	if the engine output is not Liquid Copernicium:
		add "the fuel injection specification for the main engine is incorrect" to problems;
		increment num-problems;
	if num-problems is 1:
		say "I'm trying to divert the ship from its collision course with New Da Nang, but there's a problem: [problems]";
	otherwise:
		say "I'm trying to divert the ship from its collision course with New Da Nang, but there are some problems: [problems]";

After saying hello to Arvax when talking about cs-end-game-reboot:
	print "'You're back! Great job rebooting the computer -- I'm getting telemetry now.[line break]" as Arvax near communications console;
	try quizzing arvax about usagi;
	reset turns in state;

To decide whether ship is in self-destruct mode:
	decide on whether or not engine output is Void Matter;
	
Response of Arvax when asked-or-told about usagi and talking about cs-end-game-reboot:
	if turns left < 20 and problems exist:
		print "[line break]'I'm sorry... you're going to have to destroy the ship. We're out of time.'[line break]" as Arvax near communications console;
		rule succeeds;
	if problems exist:
		print "'[problems description].'[line break]" as Arvax near communications console;
	otherwise if ship is in self-destruct mode:
		print "'Friend, if I were to start the main engine with the fuel injection you've specified, the ship would explode. Are you sure there is no other option to save the people of New Da Nang?'" as Arvax near communications console;
		tip "If you really want to blow up the ship, enter 'Arvax, self-destruct' to start the countdown from 10, or press the test button in the engine room.";
	otherwise:
		print "'Looks like the ship is ready to fly!'[line break]" as Arvax near communications console;
		win the game;
		
Self-destructing is an action applying to nothing. Understand "self-destruct" as self-destructing.

Persuasion rule when asking Arvax to try self-destructing:
	if ship is in self-destruct mode:
		persuasion succeeds;
	print "'The fuel specification is not correctly configured for self-destruction.'[line break]" as Arvax near communications console;
	persuasion fails;
	
Destruct in progress is a truth state that varies.
Destruct countdown is a number that varies.

Carry out Arvax self-destructing:
	Now destruct in progress is true;
	Now destruct countdown is 10;
	
The helm is a subject.
Response of Arvax when asked-or-told about helm and talking about cs-end-game-reboot:
	print "'You'll need to investigate yourself. The problem should be somewhere on the bridge.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about main starboard engine and talking about cs-end-game-reboot:
	print "'It seems like it's out of balance. The engines must be very precisely balanced. Go take a look.'[line break]" as Arvax near communications console;
	
Fuel injection specification is a subject.
Response of Arvax when asked-or-told about fuel injection specification and talking about cs-end-game-reboot:
	print "'This may be tricky. Take a look around the engine room.'[line break]" as Arvax near communications console;

For asking for attention by Arvax while talking about cs-end-game-reboot:
	print "[Arvax]: 'You there, Usagi? We don't have much time.'[line break]" as Arvax near communications console;
	

Section 3 - Arvax End Game - Protocols
	
Response of Arvax when asked-or-told about helm and talking about cs-end-game-protocols:
	print "'You'll need to investigate yourself. The problem should be somewhere on the bridge.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about main starboard engine and talking about cs-end-game-reboot:
	print "'Until we get the helm sorted out, don't bother.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about fuel injection specification and talking about cs-end-game-reboot:
	print "'Until we get the helm sorted out, don't bother.'[line break]" as Arvax near communications console;

For asking for attention by Arvax while talking about cs-end-game-protocols:
	print "[Arvax]: 'You there, Usagi? We don't have much time.'[line break]" as Arvax near communications console;
	
cs-end-game-protocols-said-hello is a truth state that varies.

After saying hello to Arvax when talking about cs-end-game-protocols and cs-end-game-protocols-said-hello is false:
	print "'Finally! Where've you been? I'm sad to see you invoked Mulgrew's emergency protocols, but that's water under the bridge. Now we need to try to salvage the situation.'[line break]" as Arvax near communications console;
	now cs-end-game-protocols-said-hello is true;
	reset turns in state;
	try quizzing arvax about ss usagi;
	
After saying hello to Arvax when talking about cs-end-game-protocols:
	print "'No time for that! What are we going to do?'" as Arvax near communications console;
	
Response of Arvax when asked-or-told about usagi and talking about cs-end-game-protocols:
	if turns left < 20:
		print "[line break]'I'm sorry... you're going to have to destroy the ship. We're out of time.'[line break]" as Arvax near communications console;
		rule succeeds;
	if player aware of melted helm is true:
		print "'I'm sorry, I don't think the helm can be fixed -- not with the time you have left.[line break]'" as Arvax near communications console;
	otherwise:
		print "'[problems description]. [paragraph break]'To be honest, friend, the readouts I'm seeing about the state of helm control are dire. I'm not sure it can be fixed.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about the pilot's access panel and player aware of melted helm is true and talking about cs-end-game-protocols:
	print "'Dammit! ... I'm sorry, I don't think that can be fixed -- not with the time you have left.'" as Arvax near communications console;
	
Response of Arvax when asked-or-told about helm and player aware of melted helm is true and talking about cs-end-game-protocols:
	print "'Dammit! ... I'm sorry, I don't think that can be fixed -- not with the time you have left.'" as Arvax near communications console;
 
Book 9 - Special Actions

Understand "tell [something addressable] about [any known thing]" as informing it about.

Looking up is an action applying to one thing. Understand "lookup [any familiar thing]" as looking up.

Instead of looking up something:
	try quizzing ship computer about the noun;

Pressing is an action applying to one thing. Understand "press [button]" as pressing.

Understand the command "throw" as something new.

Throwing is an action applying to one thing. Understand "throw [something]" as throwing.

Carry out throwing something:
	try dropping the noun;

A thing has a text called last utterance. A thing has a thing called the voice locale.
The voice locale of arvax is the communications console.
The voice locale of mulgrew is the communications console.
Repeating is an action applying to nothing. Understand "repeat" as repeating.
Repeating all is an action applying to nothing. Understand "repeat all" as repeating all.

Check the player repeating:
	say "You can ask another player to repeat what they said, but you can't do it yourself." instead;

Check the player repeating all:
	say "You can ask another player to repeat what they said, but you can't do it yourself." instead;
	
Persuasion rule when asking the actor to try repeating and the actor is not a person and the actor is not addressable:
	say "[The actor] can't speak.";
	persuasion fails;
	
Persuasion rule when asking the actor to try repeating all and the actor is not a person and the actor is not addressable:
	say "[The actor] can't speak.";
	persuasion fails;
	
Persuasion rule when asking the actor to try repeating and the last utterance of the actor is "":
	say "[The actor] has nothing to repeat.";
	persuasion fails;
	
Persuasion rule when asking the actor to try repeating all and the actor is a person and the number of entries of the speech transcript of the actor is 0:
	say "[The actor] has nothing to repeat.";
	persuasion fails;
	
Persuasion rule when asking the actor to try repeating and the last utterance of the actor is not  "":
	persuasion succeeds;
	
Persuasion rule when asking the actor to try repeating all and the actor is a person and the number of entries of the speech transcript of the actor is not 0:
	persuasion succeeds;
	
Persuasion rule when asking the actor to try repeating all and the actor is not a person:
	say "You cannot ask [the actor] to repeat all.";
	persuasion fails;
	
Carry out an actor repeating:
	say "[the actor] said: ";
	say italic type;
	say the last utterance of the actor;
	say roman type;
	reset turns in state;
	
Carry out an actor repeating all:
	repeat with T running through the speech transcript of the actor:
		say "[the actor] said: ";
		say italic type;
		say T;
		say roman type;
		say line break;
	reset turns in state;
	
Fixing it with is an action applying to two things. Understand "Fix [something] with [something]" as fixing it with. Understand "Repair [something] with [something]" as fixing it with.

Accessible is a truth state that varies. 
Making accessible is an action out of world. Understand "accessible on" as making accessible.
Making inaccessible is an action out of world. Understand "accessible off" as making inaccessible.

Carry out making accessible:
	Now accessible is true;
	
Report making accessible:
	Say "Accessibility on.";
	
Carry out making inaccessible:
	Now accessible is false;
	Say "Accessibility off.";
	
Asking about accessibility is a truth state that varies. Asking about accessibility is initially true;

When play begins:
	Say "Would you like to use accessibility features like no ASCII art? (enter 'y' for yes)";

After reading a command when asking about accessibility is true:
	let the answer be the player's command;
	if the answer matches the regular expression "^y|^Y":
		now accessible is true;
	otherwise:
		now accessible is false;
	now asking about accessibility is false;
	try looking instead;
	
Instead of looking when asking about accessibility is true: do nothing.

Rule for printing the banner text when asking about accessibility is true: do nothing.

Rule for constructing the status line when asking about accessibility is true: do nothing.
	
[Querying adjectives of is an action applying to one visible thing. Understand "What describes [any thing]" as querying adjectives of. ]

[Carry out an actor querying adjectives of a thing (called T):
	if T admits no adjectives:
		say "I can't think of any adjectives to use with [the T].";
	otherwise:
		say "[The T] allows the adjective[if the number of entries of the list of adjectives admitted by T > 1]s[end if] [list of adjectives admitted by T].";]

Chapter 1 - Help


Helping with speech is an action out of world. Understand "help speech" as helping with speech.

Carry out helping:
	say "Welcome to [the story title] by [the story author]. There are a few things about this game you may want to be aware of.
	
	Text adventures (also known as interactive fiction) have a number of conventions and common commands. Some are:
	
	Move by entering the direction you want to travel. You can use abbreviations, such as 'n' for 'north' and 'u' for 'up'.
	[line break][line break]
	- look (or l): prints a description of your surroundings.[line break]
	- take <something>: moves something from your surroundings to your person.[line break]
	- drop <something>: opposite of take.[line break]
	- sit on <something>, get up: what they sound like.[line break]
	- examine <something> (or x): get a more detailed description (sometimes) of something.[line break]
	- unlock <something> with <something>, open <something>[line break]
	- press <a button>[line break]
	- inventory (or i): list what the player is carrying.[line break]
	- wait (or z): pass one turn doing nothing.[line break]
	
	If there's something else you'd like to try, type it in and see what happens!
	
	You can ask for hints at any time by typing 'hints'. Note that the available hints will vary from time to time, and there may not be any hints available when you ask.
	
	There are a few ways in which this game differs from many text adventures:
	
	First, we use nautical directions: fore, aft, port, starboard, up, down, in, and out. ('f', 'a', 'p', 's', 'u', 'd', 'in', and 'out')
		
	[italic type]Fore[roman type] is the direction towards the front of the ship, that is, the usual direction of travel. [italic type]Aft[roman type] is the opposite of fore. [italic type]Port[roman type] is the direction to your left when you're facing fore. [Italic type]Starboard[roman type] is the opposite of port. You can remember port from starboard by remembering that 'port' and 'left' have the same number of letters.
	
	[Italic type]Up[roman type] and [italic type]down[roman type] are relative to the shipboard artificial gravity. This gravity doesn't extend beyond the hull. Instead, outside we have the radial directions [italic type]in[roman type] (toward the center of mass of the ship) and [italic type]out[roman type] (away from the center of mass).
	
	Second, two new commands: 
	[line break][line break]
	- clean <something> or dust <something>: you're a cleaner, you need to be able to clean.[line break]
	- slide <something> through <a card slot>: some of the doors in the game require access cards.
	
	To turn on accessibility features, use 'accessible on'. To turn them off again, use 'accessible off'.
	
	You can also get help talking to other characters (and some devices) with 'help speech'.[line break]
	[if accessible is false][line break]And finally, [think]text that looks like this[think end] is the main character's, i.e., your, thoughts.[end if]";
	
Carry out helping with speech:
	say "There are a few commands that allow you to talk to other characters you meet. These are:
	[line break][line break]
	- hello: to start talking to someone.[line break]
	- ask <someone> about <something>: ask the character to tell you what it knows about a thing.[line break]
	- goodbye: to stop talking to someone.[line break]
	- tell <someone> about <something>: tell the character what you know about a thing.[line break]
	- yes[line break]
	- no
	
	Note: you cannot talk or ask about a subject with which you are unfamiliar. Thus you cannot get an answer to 'ask Frank about Sophie' unless you are aware of Sophie's existence.
	
	To ask a person or thing to do something use the following pattern: '<name>, <action>', for instance, 'computer, help.'
	
	One useful command is '<name>, repeat', which will cause the named person or thing to repeat the last thing they said, if anything.";	
	
Book 10 - Hints

Table of Potential Hints (continued)
title	subtable
"How do I avoid being thrown about?"	Table of Beginning Hints
"How do I reach the yellow ID card?"	Table of ID Hints
"How do I use the strange gadget?"	Table of Translator Hints
"How do I open the equipment lockers?"	Table of Locker Hints
"How do I activate the vac suit?"	Table of Vac Suit Activation Hints
"Can I move the 50kg weight?"	Table of Weight Hints
"Why do I die when I try to go outside?"	Table of vacuum hints
"Help! I'm floating!"	Table of floating hints
"How do I recharge the vac suit's air?"	Table of recharge hints
"Whom should I trust, Arvax or Mulgrew?"	Table of Trust hints
"How do I use the ship computer?"	Table of Computer hints
"How do I destroy the ship?"	Table of Self-destruct hints
"How do I save the ship?"	Table of winning hints
"What's wrong with the helm?"	Table of Helm Hints Reboot
"What's wrong with the helm?"	Table of Helm Hints Protocols
"How do I set the fuel injection?"	Table of Fuel Injection Hints
"How do I align the starboard engine?"	Table of Starboard Engine Hints
"Can I survive blowing up the ship?"	Table of Surviving Self-destruction Hints

Table of Beginning Hints
hint	used (a number)
"Have you tried not boarding the ship?"	
"Try doing something different once you're on the ship."
"Just don't type anything."
"You can't."

Table of ID Hints
hint	used (a number)
"Try just taking it from the upper bunks."	
"You'll have to get closer."		
"Is there something you can stand on?"	
"You'll have to move it from somewhere else."	
"But you'll have to find it first."	
"Try looking under the port-side right bottom bunk."	

Table of Translator Hints
hint	used (a number)
"Have you tried examining it?"	
"What do the buttons do?"	
"Hmm, they didn't do much, did they? But did you notice there's a slot?"	
"Can you think of anything to put in the slot?"	
"It would have to be pretty thin."	
"Just try some things, already!"	
"Okay, okay, try the magazine!"

Table of Locker Hints
hint	used (a number)
"You need two things for each."	
"Notice that each locker has a slot and a keyhole."	
"So you need a card and a key."	
"The card you need is not the one that gets you into the captain's quarters."	
"The key you need is hidden inside something else."	
"The card is inside the wallet."	
"The key is in the captain's desk."	
"Use the card first, then the key immediately after."

Table of Vac Suit Activation Hints
hint	used (a number)
"Somewhere you can find instructions for using the vac suit."	
"Have you found any reading material?"	
"Perhaps you can find a copy of Rosetta Stone® somewhere."	
"Or, perhaps not. But maybe there's something that can translate the magazine for you."	
"Check the captain's quarters."	
"How about the [galactic translator]?"

Table of Weight Hints
hint	used (a number)
"Yes."		
"Weight equals mass times the acceleration of gravity."	
"Crazy idea, but could you perhaps manipulate gravity?"	
"Well, the ship uses artificial gravity anyway..."	
"There is a gravity control on the environmental console in operations."	

Table of Vacuum Hints
hint	used (a number)
"First, you need a vac suit."	
"Second, you need to activate the vac suit."	
"Third, you need to activate your mag boots before leaving the airlock."	

Table of Floating Hints
hint	used (a number)
"You can't just float back to the ship."	
"You need Newton's Third Law."	
"'For every action, there is an equal and opposite reaction.'"	
"If you want to go [italic type]toward[roman type] the ship, something else needs to go [italic type]away[roman type] from the ship."	
"How about throwing something?"	
"Throwing something you won't need again, that is."	
"Maybe the wallet (once you've taken the ID card out of it)."

Table of Recharge Hints
hint	used (a number)	
"There's a vac suit recharging station just sitting in engineering deck!"	

Table of Trust Hints
hint	used (a number)
"Ooh... that's a hard one."	
"You could compare their answers to questions."	
"You could verify their answers with the ship computer."	
"Is either of them particularly concerned or unconcerned about your well-being?"	
"Why wasn't Mulgrew killed on Space Station Omicron-5?"

Table of Computer Hints
hint	used (a number)	
"You must use it from the data terminal on the captain's desk, in her quarters."	
"Try 'computer, help' for further instructions."	
"Some information and operations are only accessible when you have the right access codes. Get them from Arvax and/or Mulgrew."		


Table of Self-destruct Hints
hint	used (a number)
"The ship self-destruct sequence is guarded by hand-print access through the captain's command console on the bridge. There's no way you can get past that."	
"You can make the ship blow up by feeding the wrong fuel into the main engine."	
"Check out the engine diagram in the engine room."	
"The engine will explode if you supply it with Void Matter."	
"You can consult the ship's computer to learn about Void Matter and how you can create it and other substances."	
"You can create void matter by setting Input 1 to Unobtainium, Input 2 to Tachyon Crystals, Input 3 to Anti-Helium, and Input 4 to Tachyon Crystals."	
"Press the test button to start the countdown to destroy the ship."	



Table of Winning Hints
hint	used (a number)
"To save the ship, first you need to reboot it."	
"If you invoke the emergency protocols, you cannot save the ship, only destroy it."	
"As Arvax will tell you, there are three things you must do:"	
"Fix the helm."	
"Set the correct fuel injection configuration."	
"Correct the starboard engine."	
"Each of these have their own hints."

Table of Helm Hints Reboot
hint	used (a number)
"You'll have to go look."	
"More precisely, you'll have to look inside the pilot's console access panel."	
"Okay, that's not so bad. Is there something you could use to replace a screw?"	
"You might go get yourself a skillet."	
"Oops, it's a little long. Can you make it shorter?"	
"How about cutting it? Is there a cutting device around?"	
"Look in the machine shop."	

Table of Helm Hints Protocols
hint	used (a number)
"You'll have to go look"	
"Oh that looks bad. Go talk to Arvax about it."	
"Okay, face it, you're not going to be able to fix the helm."	

Table of Fuel Injection Hints
hint	used (a number)
"Take a look at the engine diagram in the engine room."	
"Read about the SS Usagi's engine using the data terminal."	
"You should be able to find a description of the fuel you need to make."	
"Setting the inputs correctly on the diagram will create that fuel."	
"The ship computer can tell you how to create all of the different substances, which can help you make Liquid Copernicium, the correct fuel."	
"Set Input 1 to Oganesson, Input 2 to Anti-Helium, Input 3 to Tachyon Crystals, and Input 4 to Oganesson."	

Table of Starboard Engine Hints
hint	used (a number)
"The starboard engine has been put out of balance by just a hair. We need to fix that."	
"To do that we need to put a little more mass on the right side than on the left side."	
"Have you seen something around the ship with mass we know?"	
"Yes! The weights!"	
"You can use combinations of weights to measure how much mass you need to add to the right side to balance the engine."	
"Then you need to figure how to make that difference in mass out of the weights you have."	
"Put the 50kg and 15kg weights on the left mount, and put the 32kg and 29kg weights on the right mount. You don't need the 9kg weight."	

Table of Surviving Self-destruction Hints
hint	used (a number)
"I would suggest getting off the ship before it explodes."	
"Well, you need the vac suit, and it needs to be recharged."	
"You also need some way for people to find you floating in space."	
"Look for the beacon in the starboard-side locker."	


Book 11 - Useless things

A dummy is a kind of thing. A dummy is scenery.
A dummy-backdrop is a kind of backdrop.

The room ceiling is a dummy-backdrop. The printed name is "ceiling".
The wall is a dummy-backdrop.

When play begins:
	move the wall backdrop to all onboard rooms;
	move the ceiling backdrop to all onboard rooms which are not the galley;

Instead of doing something to a dummy (this is the don't worry about a dummy rule):
	say "You really don't need to worry about [the noun]." (A);

Instead of doing something to a dummy-backdrop (this is the don't worry about a dummy-backdrop rule):
	say "You really don't need to worry about [the noun]." (A);
	
Book 12 - Going the wrong way

Deep Space is not apparent.

Instead of going nowhere:
	Say "[list the exits]";

Book 13 - Some rule reordering

The first check vacuum rule is listed last in the every turn rulebook.
The second check vacuum rule is listed last in the every turn rulebook.
The third check vacuum rule is listed last in the every turn rulebook.

Book 14 - Not for Release

DEBUG is true.

[Include Property Checking by Emily Short.]


When play begins:
	if DEBUG is true:
		Now VSAC is 1;
		Now Arvax's security code is 2;
		Now Mulgrew's security code is 3;
		
After printing the locale description when location is Space Station Gangway:
	Tip "For help with testing, enter 'help test'.";

Clearing the door is an action applying to nothing. Understand "clear door" as clearing the door. 

Carry out clearing the door:
	now the equipment trunk does not block the fore/aft door.
	
Setting gravity to is an action applying to one number. Understand "set gravity to [number]" as setting gravity to.

Carry out setting gravity to a number (called N):
	set gravity to N;
	
Report setting gravity to:
	Say "You got it. Physics has been changed at your whim.";
	
Activating the suit is an action applying to nothing. Understand "activate suit" as activating the suit.

Carry out activating the suit:
	say "BOOM activated.";
	Now the vac suit is activated;
	
Massing is an action out of world. Understand "mass" as massing.

Carry out massing:
	say "[total mass carried by the player]";

Making familiar is an action applying to one visible thing. Understand "familiar [any thing]" as making familiar.
Carry out making familiar a thing:
	now the noun is familiar;
	
After deciding the scope of the player when making familiar a thing:
	place the noun in scope;

Understand "* [text]" as a mistake ("Noted.")

exposing hints is an action out of world. Understand "show all hints" as exposing hints.

show all hints is a truth state that varies.

Carry out exposing hints:
	now show all hints is true;

a hint activation rule:
	if show all hints is true:
		activate Table of Beginning Hints;
		activate Table of ID Hints;
		activate Table of Translator Hints;
		activate Table of Locker Hints;
		activate Table of Vac Suit Activation Hints;
		activate Table of Weight Hints;
		activate Table of vacuum hints;
		activate Table of floating hints;
		activate Table of recharge hints;
		activate Table of Trust hints;
		activate Table of Computer hints;
		activate Table of Self-destruct hints;
		activate Table of winning hints;
		activate Table of Helm Hints Reboot;
		activate Table of Helm Hints Protocols;
		activate Table of Fuel Injection Hints;
		activate Table of Starboard Engine Hints;
		activate Table of Surviving Self-destruction Hints;
		
forcing reboot is an action out of world. Understand "rebooted" as forcing reboot.

Carry out forcing reboot:
	now everything carried by the player is in operations;
	now the player is wearing the vac suit;
	now turns of air left of the vac suit is 50;
	now the equipment trunk does not block the fore/aft door;
	now the player is in the captain's quarters;
	now logged in as arvax is true;
	now arvax is familiar;
	now the captain's door is already authorized;
	now explosion happened is true;
	now the fore/aft door is open;
	now arvax is proper-named;
	now the current conversation state is cs-end-game-reboot;
	now turns left is 120;
	now mulgrew is familiar;
	now end-game is true;
	now computer-rebooted is true;
	
forcing protocols is an action out of world. Understand "protocols" as forcing protocols.

Carry out forcing protocols:
	now everything carried by the player is in operations;
	now the player is wearing the vac suit;
	now turns of air left of the vac suit is 50;
	now the equipment trunk does not block the fore/aft door;
	now the player is in the captain's quarters;
	now logged in as mulgrew is true;
	now the captain's door is already authorized;
	now explosion happened is true;
	now the fore/aft door is open;
	now arvax is familiar;
	now arvax is proper-named;
	now the current conversation state is cs-end-game-protocols;
	now turns left is 80;
	now mulgrew is familiar;
	now protocols-activated is true;
	now loose circuit board is nowhere;
	now end-game is true;
	
extending time is an action out of world. Understand "more time" as extending time.

Check extending time:
	if end game is not happening:
		say "This command only works during the end game; i.e., after you've rebooted the computer or invoked the emergency protocols." instead;

Carry out extending time:
	now turns left is turns left + 50;
	
Report extending time:
	say "Turns left: [turns left].";
	
Helping with test is an action out of world. Understand "help test" as helping with test.

Carry out helping with test:
	say "Useful commands to help with testing:
	
	First, use '* <note>' to leave a note for the author in the transcript.
	
	You can use the following testing commands listed in Writing In Inform:
	[line break][line break]
	- SHOWME <something> - prints info about a thing or place; this can help you locate something you've lost.[line break]
	- PURLOIN <something> - move something to your inventory
	
	Some commands special to this game:
	[line break][line break]
	- activate suit - magically activate the vac suit without doing the real work[line break]
	- familiar <something> - magically learn about a thing so that you can talk to people about it; normally you can't talk about something you're not familiar with[line break]
	- show all hints - allow access to all hints, before they'd ordinarily become available

	There are a few commands that are spoilers in and of themselves. To see them, enter 'help test spoilers'. It's probably inadvisable to look at them until you've gone really deep into the game.";
	
Helping with test spoilers is an action out of world. Understand "help test spoilers" as helping with test spoilers.

Carry out helping with test spoilers:
	say "Useful commands to help with testing that might spoil the game:
	[line break][line break]
	- clear door - remove the obstruction from the fore/aft door[line break]
	- rebooted - jump to the end game, having rebooted the computer[line break]
	- protocols - jump to the end game, having invoked the emergency protocols[line break]
	- more time - add 50 turns to the time limit during the end game[line break]
	";
	