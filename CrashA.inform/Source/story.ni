"Crash" by Phil Riley

Include Adaptive Hints by Eric Eve.
Include Conversation Framework by Eric Eve.
Include Conversation Responses by Eric Eve.
Include Epistemology by Eric Eve.
Include Exit Lister by Eric Eve.

Include Basic Screen Effects by Emily Short.
Include Inanimate Listeners by Emily Short.

Include Data Structures by Dannii Willis.
Include Nautical Directions by Philip Riley.

Use the serial comma and the American dialect.
Use scoring. The maximum score is 10.

Release along with cover art ("A cartoon spaceship.").
Release along with a website.
Release along with an interpreter.
Release along with a file of "Illustrated Walkthrough" called "crash.pdf".

The story title is "Crash".
The story author is "Phil Riley".
The story headline is "An Interactive Disaster".
The story genre is "Science Fiction".
The release number is 15.
The story creation year is 2022.

DEBUG is a truth state that varies. DEBUG is initially false.

Book 1 - Early declarations for compile reasons

A substance is a kind of thing. 
Fuel injection specification is a subject. The description is "subject".

The Room of Stuff is a room.

Logged in as Arvax is truth state that varies.
Logged in as Mulgrew is truth state that varies.

Gravity is a number that varies. Gravity is initially 5.

A thing can be readable.

A room can be onboard or offboard. A room is usually onboard. 
The Room of Stuff is offboard.

Master Sergeant R Mu Arvax is a man. The printed name is "[if arvax is familiar]Master Sergeant R. Mu Arvax[otherwise]caller[end if]". He is improper-named.

Captain Jane Mulgrew is a woman. 

ShowPrePostReportStack is always false.

Chapter 1 - Stolen from Essentials

A fact is a kind of thing. A fact is seen.
Knowledge relates various people to various things. The verb to know (he knows, they know, he knew, it is known) implies the knowledge relation.

Helping is an action out of world. Understand "help" as helping.

Book 2 - Playability

Chapter 1 - Accessibility

Accessible is a truth state that varies. 
Making accessible is an action out of world. Understand "accessible on" as making accessible.
Making inaccessible is an action out of world. Understand "accessible off" as making inaccessible.

Carry out making accessible:
	Now accessible is true;
	Say "Accessibility on.";
	
Carry out making inaccessible:
	Now accessible is false;
	Say "Accessibility off.";
	
Asking about accessibility is a truth state that varies. Asking about accessibility is initially true;

When play begins:
	if DEBUG is false:
		Say "Would you like to turn on accessibility features like no ASCII art and no special characters? (enter 'A' to turn on accessibility features, 'N' to turn them off)";
	otherwise:
		now asking about accessibility is false;

After reading a command when asking about accessibility is true:
	let the answer be the player's command;
	if the answer matches "A/yes/y/accessible/on":
		say "Accessibility on.";
		now accessible is true;
	otherwise if the answer matches "no/n/off":
		say "Accessibility off.";
		now accessible is false;
	otherwise: 
		say "Sorry, I don't understand.";
		reject the player's command;
	now asking about accessibility is false;
	try looking instead;	
	
Instead of looking when asking about accessibility is true: do nothing.

Rule for printing the banner text when asking about accessibility is true: do nothing.

Rule for constructing the status line when asking about accessibility is true: do nothing.

Chapter 2 - Tips

To tip (message - a text):
	if accessible is true:
		say "Tip: [message][paragraph break]";
	otherwise:
		say "[unicode 8658] [message][paragraph break]";
		
Chapter 3 - The Status Line

computer-rebooting is a truth state that varies.
emergency-protocols is a truth state that varies.
end-game is a truth state that varies.
turns left is a number that varies. 
woozy is a truth state that varies.
last-moves is a truth state that varies.

To say middle-top-status:
	if player is in vacuum:
		let VS be a random vac suit worn by the player;
		say "[remaining air of VS] units of air left";
	otherwise:
		say "[if computer-rebooting is true]REBOOTING[otherwise if protocols-in-progress is true]EMERGENCY[end if]";

Table of Fancy Status
left	central	right
" [Location]"	 "[middle-top-status]"	"[if last-moves is false and protocols-activated is false][turn count - 1] [Turn][otherwise][turns left] [turn] left"
" [exit list]"	""	"Score: [score]/[maximum score]"

[Rule for constructing the status line:
     fill status bar with Table of Fancy Status;
     rule succeeds.]

When play begins:
	now status exit table is Table of Fancy Status;
	
Chapter 4 - Error messages

The parser error internal rule response (R) is "I'm not sure what you're trying to say. I might just not recognize the words you're using.".

Book 3 - Going the wrong way

[Deep Space is not apparent.]

Instead of going nowhere:
	Say "[list the exits]";
	
Book 4 - Pre- and Post-Reporting

[Allow printing messages before and after the standard reporting stage for each action. Allows phrases invoked from the carry out stage to print messages in the correct order.]

Pre-report text stack is a list of lists of texts that varies.
Post-report text stack is a list of lists of texts that varies.

This is the reset report text rule:
	now Action-is-out-of-world is true;
	remove pre-report text stack from pre-report text stack;
	remove post-report text stack from post-report text stack;
	
The reset report text rule is listed first in the turn sequence rules.

This is the add report stack entry rule:
	If showprepostreportstack is true:
		say "1 ([current action]) -- [pre-report text stack], [post-report text stack]";
	add {{}} at entry 1 in pre-report text stack;
	add {{}} at entry 1 in post-report text stack;
	If showprepostreportstack is true:
		say " >>> [pre-report text stack], [post-report text stack].";
		say "length [number of entries of pre-report text stack]";

[The add report stack entry rule is listed first in the specific action-processing rules.]
The add report stack entry rule is listed before the describe room gone into rule in the report going rules.
The add report stack entry rule is listed before the describe room stood up into rule in the report getting off rules.

Action-is-out-of-world is a truth state that varies.

Before:
	now Action-is-out-of-world is false;
	If showprepostreportstack is true:
		say "1 ([current action]) -- [pre-report text stack], [post-report text stack]";
	add {{}} at entry 1 in pre-report text stack;
	add {{}} at entry 1 in post-report text stack;
	If showprepostreportstack is true:
		say " >>> [pre-report text stack], [post-report text stack].";
		say "length [number of entries of pre-report text stack]";
	continue the action;
	
 
To pre-report (T - a text):	
	if number of entries of pre-report text stack is not 0:
		If showprepostreportstack is true:
			say "2 -- [pre-report text stack]";
		add T to entry 1 of pre-report text stack;
		If showprepostreportstack is true:
			say " >>> [pre-report text stack]";
	
To post-report (T - a text):
	if number of entries of post-report text stack is not 0:		
		If showprepostreportstack is true:
			say "3 -- [post-report text stack]";
		add T to entry 1 of post-report text stack;
		If showprepostreportstack is true:
			say " >>> [post-report text stack]";
	
This is the pre-report rule:
	if Action-is-out-of-world is true or current action is switching the story transcript on or current action is asking for hints:
		make no decision;
	if number of entries of pre-report text stack is not 0:
		If showprepostreportstack is true:
			say "4 -- [pre-report text stack]";
		let pre-report text be entry 1 of pre-report text stack;
		remove entry 1 from pre-report text stack;
		repeat with T running through pre-report text:
			say "[T][paragraph break]";
		If showprepostreportstack is true:
			say " >>> [pre-report text stack].";
	
This is the post-report rule:
	if Action-is-out-of-world is true or current action is switching the story transcript on or current action is asking for hints:
		make no decision;
	while number of entries of post-report text stack is not 0:
		If showprepostreportstack is true:
			say "5 -- [post-report text stack]";
		let post-report text be entry 1 of post-report text stack;
		remove entry 1 from post-report text stack;
		repeat with T running through post-report text:
			say "[T][paragraph break]";
		If showprepostreportstack is true:
			say " >>> [post-report text stack].";
		
The pre-report rule is listed after the after stage rule in the specific action-processing rules.
The post-report rule is listed before the every turn stage rule in the turn sequence rules. 

This is the new instead stage rule:
	follow the instead rules;
	if rule failed:
		follow the pre-report rule;
		follow the post-report rule;
		rule fails;
	otherwise if rule succeeded:
		rule succeeds;
		
The new instead stage rule is listed instead of the instead stage rule in the action-processing rules.

Book 5 - Special Looking Behavior

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

Book 6 - Game Mechanics

Chapter 1 - Final Question Options

To write out accomplishments:
	repeat with TD running through the dones of the to-do list:
		say "- [description of TD][line break]";
	say line break;

Rule for printing the player's obituary (this is the score breakdown rule):
	say line break;
	if final result is win:
		say "For your heroism in the face of almost certain death, we award you one point each for:[line break]";
		write out accomplishments;
		say "Additionally! We hereby award you one point for saving the SS Usagi, another point for saving yourself, and finally one more point for saving the moon New Da Nang! Congratulations!";
	if final result is pointless death:
		say "Your death was completely pointless and preventable";
		if score is 0:
			say ", and you scored no points. Sigh...";
		otherwise:
			say ". All the same we grudgingly award you one point each for what you did accomplish, which was:[line break]";
			write out accomplishments;
	if final result is crash:
		say "Well, you crashed into New Da Nang, saving neither yourself, the ship, nor the moon";
		if score is 0:
			say ". Additionally, you did nothing else of note. How did you accomplish that?";
		otherwise:
			say ". All the same, you did earn some points, namely one point each for:[line break]";
			write out accomplishments;
	if final result is noble suicide:
		say "Well done! You made the ultimate sacrifice so that others might live. First, we award you one point each for:[line break]";
		write out accomplishments;
		say "We also award you one point for saving New Da Nang. Congratulations!";
	if final result is cowardice:
		say "You get nothing! You lose! Good day, sir!";
	if final result is lost the ship:
		say "Hooray for saving New Da Nang! The Space Marine leadership is less happy about losing the SS Usagi. But here's your score breakdown. You get one point each for:[line break]";
		write out accomplishments;
		say "You also get a point for saving yourself, and a point for saving New Da Nang! Congratulations!"
		
The score breakdown rule is listed last in the for printing the player's obituary rules.

[Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see SCORING details"	false	"scoring"	show scoring details rule	--]

a game result is a kind of object.
win is a game result. 
pointless death is a game result.
crash is a game result.
noble suicide is a game result.
cowardice is a game result.
lost the ship is a game result.

The final result is a game result that varies.
	

Chapter 2 - Thinking

To think (thought - a text):
	if accessible is true:
		say "You think, '[thought]'[paragraph break]";
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
2	false	false	"Okay now, back to the station -- let's see, I'm in [the Port-Side Crew Quarters], so I need to go starboard and then down..." 
3	false	false	"Holy... the station -- it's gone? Where the hell am I? What am I going to do?"
4	false	false	"Must have flown up there when everything went ka-blooey."
5	false	false	"Not my kind of reading, actually, but what the heck."
6	false	false	"Whatever happened, this was part of it. It's fortunate it didn't penetrate further into the hull."
7	false	false	"My god, so glad to be back inside. I'm never going spacewalking again!"
8	false	false	"Dang. I really thought that would work."
9	false	false	"That's weird. It should at least make a buzz."
10	false	false	"I never thought it would come to this, eavesdropping on someone's personal thoughts."
11	false	false	"My god..."
12	false	false	"Almost bumped my head."
13	false	false	"Who designed this thing?"
14	false	false	"Or so you say."
15	false	false	"Nice chair."
16	false	false	"Cute dog."
17	false	false	"I always wanted one of these."
18	false	false	"What? No feelies?"



Chapter 3 - Speaking

A person has a text called last utterance.
A person has a list of texts called the speech transcript.
The shipboard computer has a list of texts called the speech transcript.

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
[		say "You [if the location is galley and the midship door is closed]faintly [end if]hear someone speaking [the direction description of BR].";]
		now last-turn-count-remote-speech-printed is turn count;
	Now the last utterance of the speaker is ST;	
	if T is true and speaker is a person:
		Add ST to the speech transcript of the speaker;	

To print (speech text - a text) as (speaker - a thing) near (locale - a thing):
	if speaker is not a person:
		print speech text as speaker near locale with transcript false;
	otherwise:
		print speech text as speaker near locale with transcript true;
	
	
Chapter 4 - Relations

A thing can be undersided. A thing is usually not undersided.
	
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

[Chapter 4 - Mass and Gravity

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
		say "[the drop list]: Dropped.";]


Book 7 - Things

A vac suit is a kind of wearable thing. The initial appearance is "A vac suit is here, lying prone as if it were some malformed yellow person knocked unconscious by the shaking of the ship."

A vac suit has a number called remaining air. The remaining air is usually 15.

Understand "vacuum" as a vac suit. The description of a vac suit is "A puffy yellow suit with an attached helmet and magnetic boots. The gloves are misshapen things, optimized for carrying weaponry, not precision work. There is a nozzle on the front through which air can be recharged or vented. Lights indicate the boots are currently [if switched on]on.[otherwise]off.[end if] A gauge indicates the suit has [remaining air] units of air left." 

Tipped venting is a truth state that varies.

Instead of examining a vac suit (called VS):
	let MB be a random magnetic boots which are part of VS;
	say "A puffy yellow suit with an attached helmet and magnetic boots. The gloves are misshapen things, optimized for carrying weaponry, not precision work. There is a nozzle on the front through which air can be recharged or vented. Lights indicate the boots are currently [if MB is switched on]on[otherwise]off[end if]. A gauge indicates the suit has [remaining air of VS] units of air left.";
	think thought 17;
	if VS is the current stuck thing of the chewing gum:
		say "There is some chewing gum stuck to the vac suit.";
	if tipped venting is false:
		tip "You can vent air by using 'vent suit.'";
		now tipped venting is true;

Vacuum-suit is a subject. It is privately-named. The description is "subject". Understand "vac", "vacuum" and "suit" as vacuum-suit.
Does the player mean wearing vacuum-suit: It is very unlikely.

A helmet is a kind of thing.
Every vac suit incorporates a helmet. The description of a helmet is "A big transparent fish bowl."
Magnetic boots are a kind of device. Understand "mag" and "magboots" as Magnetic boots.
The description of magnetic boots is "Big boots with a thick sole. Lights indicate these boots are currently [if switched on]on.[otherwise]off.[end if]".
Magnetic boots are part of every vac suit. 
Gloves are a kind of thing. The description is "Rather than being optimized for manual dexterity, these gloves are shaped to more easily wield a laser rifle.".
Gloves are a part of every vac suit.
A nozzle is a kind of thing. A nozzle is a part of every vac suit. The description is "This is useful for venting air from the suit.".
An air gauge is a kind of thing. An air gauge is a part of every vac suit. 

Instead of examining an air gauge which is part of a vac suit (called VS):
	say "The gauge indicates the suit has [remaining air of VS] units of air left.".

The examine devices rule does nothing when the noun is magnetic boots.

A crew chair is a kind of enterable supporter. It is scenery. The description is "dummy description".

Instead of examining a crew chair:
	say "An ergonomically-countoured swivel chair designed for hours of stressful work.";
	think thought 15;

A button is a kind of thing. It is usually scenery.

Doors are usually scenery.

Chapter 1 - Chewing Gum

The chewing gum is a thing. it is edible. it is improper-named. The indefinite article is "some".

Carry out examining the chewing gum when the gum is stuck to the repair corps uniform and the player is wearing the repair corps uniform and player is wearing a vac suit:
	say "You know it's on the repair corps uniform, but you can't see it with the vac suit over it.";
	rule succeeds;

Carry out examining the chewing gum:
	if the chewing gum is currently chewed:
		if boarding the ship is happening:
			say "It still tastes pretty good.";
		otherwise:
			say "It's lost most of its taste.";
	otherwise:
		say "It's a used wad of pink chewing gum. It used to taste like grape, but now it tastes of nothing";
		if the current stuck thing of the chewing gum is not the player:
			say ". It's stuck to [the current stuck thing of the chewing gum]";
		say ".";
	rule succeeds;

Chewing Gum can be currently chewed.

Rule for printing the name of chewing gum when chewing gum is not currently chewed and the current stuck thing of the chewing gum is the player:
	say "used chewing gum";

Rule for printing inventory details for chewing gum when chewing gum is currently chewed:
	say " (being chewed)[line break]";
	
Masticating is an action applying to one thing. Understand "chew [something]" as masticating. Understand "put [chewing gum] in mouth" as masticating.

Check masticating the chewing gum when the current stuck thing of the chewing gum is not the player:
	say "You can't chew the gum when it's stuck to [the current stuck thing of the chewing gum]." instead;

Check masticating something when the noun is not edible:
	say "That's really not something to chew." instead;
	
Check masticating the chewing gum when the current stuck thing of the chewing gum is the player and the the player does not carry the chewing gum:
	say "(first taking the chewing gum)";
	silently try taking the chewing gum;
	if the player does not carry the chewing gum:
		rule fails;

Check masticating something when the noun is edible and the noun is not chewing gum:
	try eating the noun instead;	

Check masticating something when the noun is currently chewed:
	say "You're already chewing that." instead;
	
Check masticating something when gum dirty is true:
	think "Eww. That gum has gotten gross. No way." instead;

Check masticating something (this is the can't chew two things at once rule):
	Let X be a random thing that is currently chewed;
	if X is not nothing:
		say "You are already chewing [the X]." instead;
	
Carry out masticating chewing gum:
	now chewing gum is currently chewed;
	
Report masticating chewing gum:
	say "You put the chewing gum in your mouth.";

The can't chew two things at once rule is listed first in the check masticating rules.

Demasticating is an action applying to one thing. Understand "spit [something]", "spit out [something]", "spit [something] out", "stop chewing [something]", and "remove [something] from mouth" as demasticating.

Instead of taking chewing gum when the chewing gum is currently chewed:
	try demasticating the chewing gum instead.
	
Instead of inserting the chewing gum into something when the gum is currently chewed:
	say "(first spitting out the gum)[command clarification break]";
	silently try demasticating the gum;
	if the gum is currently chewed:
		rule fails;
	try inserting the chewing gum into the second noun;
	
Check demasticating something when the noun is not currently chewed:
	say "You're not chewing [the noun]." instead;
	
Carry out demasticating something:
	now the noun is not currently chewed;
	
Report demasticating something:	
	say "You take [the noun] out of your mouth.";
	
Instead of eating the chewing gum:
	try masticating the chewing gum;
	
Check dropping the chewing gum:
	think "I'd rather not step in it." instead;
	
Understand "swallow [chewing gum]" as a mistake ("Don't you know that if you swallow gum it will stay in your stomach forever?")

Instead of doing something other than masticating or examining to the chewing gum during boarding the ship:
	think "The gum's still got flavor. I don't want to spit it out yet.";
	
Instead of removing the chewing gum from something when gum is stuck to the second noun:
	try taking the chewing gum;
	
Report waiting when the chewing gum is currently chewed and the location is not in-planetfall:
	say "Chew, chew, chew...";
	rule succeeds;

Section 1 - Sticking gum to things

gum dirty is a truth state that varies.

[Sticking to relates one thing to one thing. The verb to stick to implies the sticking to relation.]

To decide whether the chewing gum sticks to (T - a thing):
	if T is the player:
		decide no;
	decide on whether or not the current stuck thing of the chewing gum is T;

After looking when the chewing gum is stuck to something and the current stuck thing of the chewing gum is in the location:
	let CST be the current stuck thing of the chewing gum;
	if CST is unmentioned or CST is scenery:
		say "Some chewing gum is stuck to [the current stuck thing of the chewing gum].";

Definition: The chewing gum is stuck to something if the current stuck thing of the chewing gum is not the player.

Chewing gum has a thing called current stuck thing.

Sticking it to is an action applying to two things. Understand "stick [something] to [something]" as sticking it to.

After deciding the scope of the player when the current stuck thing of the chewing gum is not the player:
	if the location of the current stuck thing of the chewing gum is the location of the player:
		place the chewing gum in scope;

Instead of putting chewing gum on something: 
	try sticking chewing gum to the second noun;
	
Check sticking something to something:
	[if the second noun is not carried by the player and the second noun is not worn by the player:		
		say "You can stick the gum to your own possessions, but please don't start sticking it everywhere!" instead;]
	if the second noun is a backdrop:
		say "You can't stick anything to that." instead;
	if the second noun is the chewing gum:
		if the noun is not the chewing gum:
			try sticking the second noun to the noun instead;
		say "You can't stick the chewing gum to itself." instead;
	if the second noun is the player:
		think "Eww, no! I don't want gum stuck to me!" instead;
	if the noun is the sticky note:
		say "The sticky note seems to have lost its stick." instead;
	if the noun is not the chewing gum:
		say "[The noun] is not sticky enough." instead;
	if the current stuck thing of the chewing gum is not the player:
		say "(first removing the chewing gum from [the current stuck thing of the chewing gum])[command clarification break]";
		now the current stuck thing of the chewing gum is the player;
	otherwise if the chewing gum is currently chewed:
		say "(first spitting out the chewing gum)[command clarification break]";
		now the chewing gum is not currently chewed;

Carry out sticking something to something[ when the second noun is carried by the player or the second noun is worn by the player]:
	now the current stuck thing of the chewing gum is the second noun;
	if the second noun is not enclosed by the player:
		now gum dirty is true;
	now the chewing gum is in the room of stuff;

Report sticking the chewing gum to something:
	say "You stick the chewing gum to [the second noun].";

Every turn:
	if a random chance of 1 in 3 succeeds:
		if the player encloses the chewing gum and the chewing gum is not currently chewed:
			if the current stuck thing of the chewing gum is the player:
				let x be a thing;
				if the chewing gum is carried by the player:
					now X is a random thing carried by the player;
				otherwise:
					now X is a random thing contained in the holder of the chewing gum;
				if X is something and X is not the chewing gum:
					now the current stuck thing of the chewing gum is X;
					now the chewing gum is in the room of stuff;
					say "The chewing gum has become stuck to [the X].";

After printing inventory details for something (called T) when T is not the chewing gum and T is the current stuck thing of the chewing gum:
	say " with chewing gum stuck to [regarding T][them]";
	
After printing room description details for something (called T) when T is not the chewing gum and T is the current stuck thing of the chewing gum:
	say " with chewing gum stuck to [regarding T][them]";
	
Definition: The gum is uniform-stuck if the chewing gum sticks to the repair corps uniform or the chewing gum sticks to the engineering uniform.
	
Instead of taking chewing gum when the chewing gum is stuck to something and the gum is not currently chewed and the gum is not uniform-stuck:
	if the player carries the chewing gum:
		say "[text of the can't take what's already taken rule response (A)]";
		rule fails;
	say "You unstick the chewing gum from [the current stuck thing of the chewing gum].";
	now the chewing gum is carried by the player;
	now the current stuck thing of the chewing gum is the player;
	
Instead of taking chewing gum when the chewing gum is stuck to something and the gum is not currently chewed and the gum is uniform-stuck and the player is not wearing a vac suit:
	say "You unstick the chewing gum from [the current stuck thing of the chewing gum].";
	now the chewing gum is carried by the player;
	now the current stuck thing of the chewing gum is the player;
	
Understand "remove [chewing gum] from [something]" as a mistake ("Try 'take chewing gum' instead.").

After examining something when the noun is the current stuck thing of the chewing gum and the noun is not the player and examine text printed is true:
	say "Some chewing gum is stuck to [the noun].";
	
For printing a locale paragraph about a thing (called the item)
	(this is the new use initial appearance in room descriptions rule):
	if the item is not mentioned:
		if the item provides the property initial appearance and the
			item is not handled and the initial appearance of the item is
			not "":
			increase the locale paragraph count by 1;
			say "[initial appearance of the item]";
			if the current stuck thing of the chewing gum is the item:
				say " [regarding the item][They] [have] chewing gum stuck to [them].";
			say "[paragraph break]";
			if a locale-supportable thing is on the item:
				repeat with possibility running through things on the item:
					now the possibility is marked for listing;
					if the possibility is mentioned:
						now the possibility is not marked for listing;
				say "On [the item] " (A);
				list the contents of the item, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
			now the item is mentioned;
	continue the activity.

This is the describe chewing gum stuck to unmentioned things rule:
	let CST be the current stuck thing of the chewing gum;
	if the location of CST is the location and CST is unmentioned and the player does not enclose the CST:
		say "[The CST] [have] chewing gum stuck to [them].";

The describe chewing gum stuck to unmentioned things rule is listed last in the carry out looking rules.
	
The new use initial appearance in room descriptions rule is listed instead of the use initial appearance in room descriptions rule in the for printing a locale paragraph about rules.

Carry out examining when gum is stuck to the noun (this is the new examine undescribed things rule):	
	if examine text printed is false:
		say "[The noun] [have] chewing gum stuck to [them]." (A).
		
The new examine undescribed things rule is listed after the examine undescribed things rule in the carry out examining rules.
		
The examine undescribed things rule does nothing when gum is stuck to the noun.

Section 2 - Blowing Bubbles

Blowing bubbles is an action applying to nothing. Understand "blow a/-- bubble/bubbles" as blowing bubbles.

Check blowing bubbles:
	If the chewing gum is not currently chewed:
		say "You're not chewing the gum." instead;
		
Report blowing bubbles:
	say "You blow a nice big bubble. What fun.";
	
Chapter 2 - The Toolbox

Instead of dropping the toolbox:
	think "No. That's my life right there.";
	
Instead of throwing the toolbox:
	think "No. That's my life right there.";
	
Instead of inserting the toolbox into something:
	think "No. That's my life right there.";;
	
Instead of putting the toolbox on something:
	think "No. That's my life right there.";
	
Instead of opening the toolbox:
	say "You'll open it if you need it.";

Chapter 3 - The To-do list

The To-do list is carried by the player. Understand "todo" as To-do list.

A to-do item is a kind of object. A to-do item has a table name called the associated hints. A to-do item has a text called the description.
fix the microwave is a to-do item. The associated hints is table of microwave hints. The description is "fixing the microwave oven".
fix the cabinet is a to-do item. The associated hints is table of cabinet hints. The description is "fixing the equipment cabinet in the starboard-side crew quarters".
fix the door is a to-do item. The printed name is "fix the captain's door". The associated hints is table of captain door hints. The description is "fixing the captain's door".
fix the storage unit is a to-do item. The associated hints is table of fix unit hints. The description is "fixing the storage unit in the port-side crew quarters".
fix the airlock door is a to-do item. The associated hints is table of airlock door hints. The description is "fixing the aft airlock door".
adjust fuel injection specification is a to-do item. The associated hints is table of fuel injection hints. The description is "adjusting the fuel injection specification correctly".
fix the engine is a to-do item. The associated hints is table of engine hints. The description is "fixing the fusion engine".

The To-Do list has a list of objects called the to-dos. The printed name is "To-Do list".
The To-Do list has a list of objects called the dones. 

When play begins:
	Add fix the microwave;
	Add fix the cabinet;
		
The description of the to-do list is "[if the number of entries of the to-dos of the to-do list > 0]You have the following items on your to-do list: [The to-dos of the to-do list]. [end if][if the number of entries of the dones of the to-do list > 0]You have finished the following: [The dones of the to-do list].[end if]";

To add (item - a to-do item):
	if item is not listed in the to-dos of the to-do list:
		Add item to the to-dos of the to-do list;
		post-report "You add an item ('[item]') to your to-do list.";
		activate the associated hints of item;
	
To tick off (item - a to-do item):
	deactivate the associated hints of item;
	if item is listed in the to-dos of the to-do list:
		Increment score;
		Remove item from the to-dos of the to-do list;
		Add item to the dones of the to-do list;
		post-report "You cross out an item ('[item]') on your to-do list.";
	otherwise if item is not listed in the dones of the to-do list:
		increment score;
		post-report "It seems you completed something ('[item]') that wasn't on your to-do list. You note it down.";
		add item to the dones of the to-do list;
	
The to-do list is readable. The readable text is "[description of the to-do list]";

Instead of dropping the to-do list:
	say "You need that to write on.";
	
Instead of throwing the to-do list:
	say "You need that to write on.";
	
Instead of inserting the to-do list into something:
	say "You need that to write on.";
	
Instead of putting the to-do list on something:
	say "You need that to write on.";
	
    
Chapter 4 - Self-Closing Doors
	
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
	say "The door stays shut as you try to go through it.";
	think thought 12 instead;
	
Carry out going through a self-closing door (called D) when D is open and secret flag is false:
	now door originally open is true;		
	
Carry out going through a self-closing door (called D) when D is open and secret flag is true:
	now secret flag is false;
	
Carry out going through a self-closing door (called D) when D is open:
	now D is closed;
	now the close countdown of D is 0;


Chapter 5 - Starship Doors

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

Check sliding an access card (called the card) through a starship door (called D):
	say "You slide [the card] through the slot. [run paragraph on]";
	If D is broken:
		continue the action;
	if the card is not the matching card of D:
		say "The door emits an unpleasant buzz." instead;
	if D is open:
		say "The door is already open." instead;
	Now door originally open is false;
	
Instead of sliding an access card through a starship door when the aft access panel is open:
	say "The door won't function until the panel is closed.";
	think thought 13;

Carry out sliding an access card through a starship door (called D) when D is broken:
	add Fix the Door;
	
Report sliding an access card through a starship door (called D) when D is broken:
	say "Nothing happens.";
	think thought 9;
	
Check sliding an access card (called the card) through a slot (called S) which is part of a starship door:
	try sliding the card through a random thing incorporating S;
	
Check going through a starship door (called D) when D is not open and D is already authorized:
	now door originally open is false;
	now secret flag is true;
	now D is open;
		
Carry out sliding an access card (called the card) through a starship door (called D) when D is closed and D is not broken:
	now D is open;
	now the close countdown of D is 3;

Carry out going through a starship door (called D) when D is not open and D is already authorized:
	do nothing;
	now the close countdown of D is 0;
	
To say authorize (D - a starship door):
	now D is already authorized;

Report sliding an access card through a starship door (called D) when door originally open is false and D is not broken:
	say "[The D] slides smoothly open[if D is not already authorized]. A pleasant ping indicates it now recognizes you as authorized[authorize D][end if].";
	
Report going through a starship door (called D) when D is already authorized and door originally open is false:
	say "[The D] opens as you approach, and closes silently behind you.";
	
Report going through a starship door (called D) when D is already authorized and door originally open is true:
	say "[The D] closes silently behind you.";
	
An access card is kind of thing. A starship door has an access card called the matching card. The matching card of a starship door is usually the null card. 
The null card is an access card. The description is "dummy description".

Chapter 6 - The Black Trunk

[THESE RULES ARE FOR THE BLACK TRUNK, which is both a supporter and a container.]

The black trunk is a supporter. It is enterable. It is under starboard-side bottom bunk. It is portable. The description is "This is a large, plain black trunk with steel trim. It latches shut, but doesn't have a locking mechanism.". [The mass is 3. ]Understand "chest" as the black trunk.
The black trunk's inside is a container. It is privately-named. The printed name is "black trunk". It is part of the black trunk.  It is openable and closed. The description is "This is a large, plain black trunk with steel trim. It latches shut, but doesn't have a locking mechanism.".

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
	write after entry for the black trunk's inside;
	
Understand "black" and "trunk" as the black trunk's inside.

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
	if T is enclosed by the trunk:
		carry out the implicitly taking activity with the noun;
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

Section 1 - I6 Fuckery to make the black trunk work in inventory when open and containing something

Include (-

! ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
! ListWriter.i6t: Write After Entry (modified)
! ==== ==== ==== ==== ==== ==== ==== ==== ==== ====

[ WriteAfterEntry o depth
    p recurse_flag parenth_flag eldest_child child_count combo act_flag; ! MODIFIED

    inventory_stage = 2;
    if (c_style & PARTINV_BIT) {
        BeginActivity(PRINTING_ROOM_DESC_DETAILS_ACT, o);
        if (ForActivity(PRINTING_ROOM_DESC_DETAILS_ACT, o) == false) {
		    combo = 0;
		    if (o has light && location hasnt light) combo=combo+1;
		    if (o has container && o hasnt open)     combo=combo+2;
		    if ((o has container && (o has open || o has transparent))
			    && (child(o)==0))                    combo=combo+4;
		    if (combo) LIST_WRITER_INTERNAL_RM('A'); ! space and open bracket
		    switch (combo) {
			    1: LIST_WRITER_INTERNAL_RM('D', o);
			    2: LIST_WRITER_INTERNAL_RM('E', o);
			    3: LIST_WRITER_INTERNAL_RM('H', o);
			    4: LIST_WRITER_INTERNAL_RM('F', o);
			    5: LIST_WRITER_INTERNAL_RM('I', o);
			    6: LIST_WRITER_INTERNAL_RM('G', o);
			    7: LIST_WRITER_INTERNAL_RM('J', o);
		    }
		    if (combo) LIST_WRITER_INTERNAL_RM('B'); ! close bracket
	    }
        EndActivity(PRINTING_ROOM_DESC_DETAILS_ACT, o);
    }   ! end of PARTINV_BIT processing

    if (c_style & FULLINV_BIT) {
        BeginActivity(PRINTING_INVENTORY_DETAILS_ACT, o);
        if ((act_flag = ForActivity(PRINTING_INVENTORY_DETAILS_ACT, o)) == false) { ! MODIFIED
		    if (o has light && o has worn) { LIST_WRITER_INTERNAL_RM('A'); LIST_WRITER_INTERNAL_RM('K', o);  parenth_flag = true; }
		    else {
			    if (o has light)           { LIST_WRITER_INTERNAL_RM('A'); LIST_WRITER_INTERNAL_RM('D', o);  parenth_flag = true; }
			    if (o has worn)            { LIST_WRITER_INTERNAL_RM('A'); LIST_WRITER_INTERNAL_RM('L', o); parenth_flag = true; }
		    }
    
		    if (o has container)
			    if (o has openable) {
				    if (parenth_flag) {
					    #Ifdef SERIAL_COMMA; print ","; #Endif;
					    LIST_WRITER_INTERNAL_RM('C');
				    } else            LIST_WRITER_INTERNAL_RM('A', o);
				    if (o has open)
					    if (child(o)) LIST_WRITER_INTERNAL_RM('M', o);
					    else          LIST_WRITER_INTERNAL_RM('N', o);
				    else
					    if (o has lockable && o has locked) LIST_WRITER_INTERNAL_RM('P', o);
					    else                                LIST_WRITER_INTERNAL_RM('O', o);
				    parenth_flag = true;
			    }
			    else
				    if (child(o)==0 && o has transparent)
					    if (parenth_flag) { LIST_WRITER_INTERNAL_RM('C'); LIST_WRITER_INTERNAL_RM('F'); }
					    else              { LIST_WRITER_INTERNAL_RM('A'); LIST_WRITER_INTERNAL_RM('F'); LIST_WRITER_INTERNAL_RM('B'); }
    
		    if (parenth_flag) LIST_WRITER_INTERNAL_RM('B');
	    }
        EndActivity(PRINTING_INVENTORY_DETAILS_ACT, o);
    }   ! end of FULLINV_BIT processing

    if (act_flag) rtrue;  ! ADDED

    child_count = 0;
    eldest_child = nothing;
    objectloop (p in o)
	    if ((c_style & CONCEAL_BIT == 0) || (ConcealedFromLists(p) == false))
		    if (p has list_filter_permits) {
			    child_count++;
			    if (eldest_child == nothing) eldest_child = p;
		    }

    if (child_count && (c_style & ALWAYS_BIT)) {
        if (c_style & ENGLISH_BIT) { print " "; LIST_WRITER_INTERNAL_RM('Q', o); print " "; }
        recurse_flag = true;
    }
    
    if (child_count && (c_style & RECURSE_BIT)) {
        if (o has supporter) {
            if (c_style & ENGLISH_BIT) {
                if (c_style & TERSE_BIT) {
                	LIST_WRITER_INTERNAL_RM('A', o);
                	LIST_WRITER_INTERNAL_RM('R', o);
                } else LIST_WRITER_INTERNAL_RM('S', o);
            }
            recurse_flag = true;
        }
        if (o has container && (o has open || o has transparent)) {
            if (c_style & ENGLISH_BIT) {
                if (c_style & TERSE_BIT) {
                	LIST_WRITER_INTERNAL_RM('A', o);
                	LIST_WRITER_INTERNAL_RM('T', o);
                } else LIST_WRITER_INTERNAL_RM('U', o);
            }
            recurse_flag = true;
        }
    }

    if (recurse_flag && (c_style & ENGLISH_BIT)) {
    	SetLWI(child_count, -1, eldest_child);
    	LIST_WRITER_INTERNAL_RM('V', o); print " ";
    }

    if (c_style & NEWLINE_BIT) new_line;

    if (recurse_flag) {
        o = child(o);
        @push lt_value; @push listing_together; @push listing_size;
        @push c_iterator;
        c_iterator = ObjectTreeIterator;
        lt_value = EMPTY_TEXT_VALUE; listing_together = 0; listing_size = 0;
        WriteListR(o, depth+1, true);
        @pull c_iterator;
        @pull listing_size; @pull listing_together; @pull lt_value;
        if (c_style & TERSE_BIT) LIST_WRITER_INTERNAL_RM('B');
    }
];

-) instead of "Write After Entry" in "ListWriter.i6t".


Chapter 7 - The Box and The Bear

The new optical sensor is a thing. The description is "The optical sensor is a small component with a two-pronged connector on the back and a blue metallic circle on the other."

The present is a thing contained in the black trunk's inside. The description is "This is a box wrapped in paper obviously intended for a child. Written on the outside is the message 'To Mitchell, Happy Second Birthday! Love, Uncle Fred'"

Bertie the Bear is a thing. The printed name is "Bertie the Bear™". The description is "Bertie the Bear™ is a massively popular toy. It accepts voice commands, and its eyes, actually advanced optical sensors, can differentiate between individuals.[if the eyes are nowhere] This bear seems to be missing his eyes.[otherwise] This bear's blindly staring eyes are unnerving.[end if]".
The eyes are parts of Bertie the Bear. The description of the eyes is "They're well disguised, but the eyes are clearly top-of-the-line optical sensors that you might see in more serious uses, such as in facial recognition devices.". Understand "optical" and "sensors", "sensor", "eye" as the eyes.

Instead of taking off the eyes:
	try taking the eyes instead;

Instead of taking the eyes:
	now the eyes are nowhere;
	now the player carries the new optical sensor;
	think "Am I really going to do this? Yes, yes, I am, apparently.";
	say "You grasp one of the eyes and give it a tug, first softly then harder. Eventually it gives and you extract the eye from the bear. Upon examination you discover that the eye is in fact an optical sensor in camouflage. It looks like you didn't pull it carefully enough, however, because the connector at the end has been damaged.
	
	You try again more carefully with the second eye, and manage to produce an undamaged optical sensor.";
	
Instead of removing the eyes from bertie the bear:
	try taking the eyes;

The wrapping paper is a thing. The indefinite article is "some". The description is "The paper, which is adorned with cartoon animals in primary colors prancing around the words 'Happy Birthday', is ripped beyond repair."
The cardboard box is a container. The description is "A plain cardboard box, big enough to hold Bertie the Bear™."

Instead of opening the present:
	think "I'll go to hell for this, but here goes...";
	say "You rip off the wrapping paper and open the box. Inside is a stuffed bear you recognize as Bertie the Bear™. You discard the paper and box.";
	now the present is nowhere;
	now the player carries Bertie the Bear;
	now the wrapping paper is in the location;
	now the cardboard box is in the location;
	
Chapter 8 - Hooks and Tethers

A tether-kind is a kind of thing.
The EVA transport line is a tether-kind. The description is "see carry out examining the EVA transport line".

Understand "tether", "rope", "cable" as EVA transport line.

Carry out examining the EVA transport line:
	let AC be the attachment count;
	if AC is 0:
		say "The EVA transport line is a strong rope, maybe 16 meters long. It has a hook at either end. One extends the line between two or more points, and then transits the payload along it.";
	otherwise:
		if location is spacewalk 1:
			follow the spacewalk 1 EVA transport line description rule;
		otherwise if location is spacewalk 2:
			follow the spacewalk 2 EVA transport line description rule;
		otherwise if location is spacewalk 3:
			follow the spacewalk 3 EVA transport line description rule;
	rule succeeds;

A hook is a kind of thing. It is privately-named and scenery. The printed name is "hook". Understand "hook" as a hook.
A hook can be tethered. A hook is usually not tethered.

To decide whether (R - a room) is room-tethered:
	if R encloses a hook (called H) and H is tethered:
		decide yes;
	if R encloses the EVA transport line and attachment count > 1:
		decide yes;
	decide no;

To decide what number is the attachment count:
	decide on the number of entries in the list of hooks which are tethered;

The description of a hook is "A post extends from the hull here, with a heavyweight snap hook on the end[if tethered]. The EVA transport line is attached to the hook[otherwise]. The hook is unattached[end if].". Understand "post" as a hook.

check an actor tying something to something (this is the new block tying rule):
	if the noun is not the EVA transport line or the second noun is not a hook:
		if the actor is the player:
			say "[We] [would achieve] nothing by this." (A);
		stop the action;
	if second noun is tethered:
		if the actor is the player:
			say "The EVA transport line is already attached to [the second noun].";
		stop the action;			

The new block tying rule is listed instead of the block tying rule in the check tying it to rules.		

Instead of tying a hook to the EVA transport line:
	try tying the second noun to the noun;

check tying the EVA transport line to hook 2 when the attachment count is 0:
	say "You can't attach the EVA transport line to this hook until you've attached one of the other hooks." instead;

check tying the EVA transport line to hook 1 when the attachment count is 1:
	say "You can't attach the EVA transport line to this hook until you've attached the middle hook." instead;

check tying the EVA transport line to hook 3 when the attachment count is 1:
	say "You can't attach the EVA transport line to this hook until you've attached the middle hook." instead;
	

carry out tying the EVA transport line to a hook:
	now second noun is tethered;
	if the attachment count is 3:
		now the EVA transport line is in the room of stuff;
	
report tying the EVA transport line to a hook:
	if attachment count is 3:
		say "You make the final attachment, letting go of the EVA transport line.";
		think "Three! That was a bit of work. Hope it's useful.";
	otherwise:
		say "You attach the EVA transport line to the hook.";
		let X be "[attachment count in words]";
		think "[X in title case]...";
	
Before going to aft-airlock-room when player encloses the EVA transport line and the attachment count is 1:
	if a random tethered hook is hook 3:
		say "The EVA transport line can't reach any farther. You leave it behind.";
	otherwise:
		say "There's no reason to bring the EVA transport line inside. You leave it behind.";
	now the EVA transport line is in spacewalk 1;
	
Before going to engineering airlock when player encloses the EVA transport line and the attachment count is 1:
	if a random tethered hook is hook 1:
		say "The EVA transport line can't reach any farther. You leave it behind.";
	otherwise:
		say "There's no reason to bring the EVA transport line inside. You leave it behind.";
	now the EVA transport line is in spacewalk 3;

Rule for writing a paragraph about the EVA transport line when the attachment count > 0:
	now the EVA transport line is mentioned;
	
After deciding the scope of the player when the location is offboard:
	if location is spacewalk 1 and hook 1 is tethered:
		place the EVA transport line in scope;
	if location is spacewalk 2 and hook 2 is tethered:
		place the EVA transport line in scope;
	if location is spacewalk 3 and hook 3 is tethered:
		place the EVA transport line in scope;	
		
reaching inside for an offboard room (this is the reaching inside spacewalk rule):
	rule succeeds;	
	
To decide whether local hook is tethered:
	if location is spacewalk 1 and hook 1 is tethered:
		decide yes;
	if location is spacewalk 2 and hook 2 is tethered:
		decide yes;
	if location is spacewalk 3 and hook 3 is tethered:
		decide yes;
	decide no;
				
Instead of taking the EVA transport line when local hook is tethered and the EVA transport line is not in the location:
	say "The EVA transport line is attached here. Best leave it where it is.";

After looking when the location is spacewalk 1:
	follow the spacewalk 1 EVA transport line description rule;
	
This is the spacewalk 1 EVA transport line description rule:	
	say run paragraph on;
	let AC be the attachment count;
	if AC is 3:
		say "The EVA transport line is attached to the hook, and from there runs forward.";
		make no decision;
	if AC is 2:
		if hook 1 is tethered:
			if the player encloses the EVA transport line:
				say "The EVA transport line is attached to the hook, and from there runs forward, but then back to you, as you're still holding the end.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The EVA transport line is attached to the hook, and from there runs forward, but then back here, where the end floats loose.";
				make no decision;
			otherwise:
				say "The EVA transport line is attached to the hook, and from there runs forward.";			
				make no decision;
		otherwise:
			if the player encloses the EVA transport line:
				say "You're holding one end of the EVA transport line, which runs forward from here.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The loose end of the EVA transport line floats here. The rest of it runs forward.";
				make no decision;
	if AC is 1:
		if hook 1 is tethered:
			if the player encloses the EVA transport line:
				say "The EVA transport line is attached to the hook. You hold the other end in a loose coil.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The EVA transport line is attached to the hook. The other end floats in a loose coil nearby.";
				make no decision;
			otherwise:
				say "The EVA transport line is attached to the hook, and from there runs forward.";
				make no decision;
		otherwise:
			if the player encloses the EVA transport line:
				say "You're holding one end of the EVA transport line. From here it runs forward.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "One end of the EVA transport line floats here, while the rest runs forward.";
				make no decision;
	if AC is 0:
		if the EVA transport line is in the location:
			say "The EVA transport line floats in a loose coil here.";
			make no decision;

After looking when the location is spacewalk 2:
	follow the spacewalk 2 EVA transport line description rule;
 
This is the spacewalk 2 EVA transport line description rule:
	let AC be the attachment count;
	if AC is 3:
		say "The EVA transport line is attached to the hook, and extends aft and starboard from here.";
		make no decision;
	if AC is 2:
		if hook 1 is tethered:
			if the player encloses the EVA transport line:
				say "You are holding one end of the EVA transport line, which is attached to the hook here, and then runs aft.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 2:
				say "One end of the EVA transport line floats here. The remainder is attached to the hook and then runs aft.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 1:
				say "The EVA transport line is hooked here, and both ends run aft.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 3:
				say "The EVA transport line is attached to the hook, and extends aft and starboard.";
				make no decision;
		otherwise if hook 3 is tethered:
			if the player encloses the EVA transport line:
				say "You are holding one end of the EVA transport line in a loose coil. The EVA transport line is then attached to the hook here, after which it runs starboard.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 2:
				say "One end of the EVA transport line floats here. The remainder is attached to the hook and then runs starboard.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 3:
				say "The EVA transport line is hooked here, then both ends run starboard.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 1:
				say "The EVA transport line is attached to the hook, and extends aft and starboard.";
				make no decision;
	if AC is 1:
		if hook 1 is tethered:
			if the player encloses the EVA transport line:
				say "You are holding one end of the EVA transport line, which runs aft from here.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 2:
				say "One end of the EVA transport line floats loose here, while the other end runs aft.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 3:
				say "The EVA transport line runs past here, aft to starboard, bypassing the hook. It floats loosely instead of tautly.";
				make no decision;
		otherwise if hook 3 is tethered:
			if the player encloses the EVA transport line:
				say "You are holding one end of the EVA transport line, which runs starboard from here.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 2:
				say "One end of the EVA transport line floats loose here, while the other end runs starboard.";
				make no decision;
			otherwise if the EVA transport line is in spacewalk 1:
				say "The EVA transport line runs past here, aft to starboard, bypassing the hook. It floats loosely instead of tautly.";
				make no decision;
	if AC is 0:
		if the EVA transport line is in spacewalk 2:
			say "The EVA transport line floats in a loose coil here.";
			make no decision;

After looking when the location is spacewalk 3:
	follow the spacewalk 3 EVA transport line description rule;
	
This is the spacewalk 3 EVA transport line description rule:
	let AC be the attachment count;
	if AC is 3:
		say "The EVA transport line is attached to the hook, and from there runs to port.";
		make no decision;
	if AC is 2:
		if hook 3 is tethered:
			if the player encloses the EVA transport line:
				say "The EVA transport line is attached to the hook, and from there runs to port, but then back to you, as you're still holding the end.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The EVA transport line is attached to the hook, and from there runs to port, but then back here, where the end floats loose.";
				make no decision;
			otherwise:
				say "The EVA transport line is attached to the hook, and from there runs to port.";			
				make no decision;
		otherwise:
			if the player encloses the EVA transport line:
				say "You're holding one end of the EVA transport line, which runs to port from here.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The loose end of the EVA transport line floats here. The rest of it runs to port.";
				make no decision;
	if AC is 1:
		if hook 3 is tethered:
			if the player encloses the EVA transport line:
				say "The EVA transport line is attached to the hook. You hold the other end in a loose coil.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "The EVA transport line is attached to the hook. The other end floats in a loose coil nearby.";
				make no decision;
			otherwise:
				say "The EVA transport line is attached to the hook, and from there runs to port.";
				make no decision;
		otherwise:
			if the player encloses the EVA transport line:
				say "You're holding one end of the EVA transport line. From here it runs to port.";
				make no decision;
			otherwise if the EVA transport line is in the location:
				say "One end of the EVA transport line floats here, while the rest runs to port.";
				make no decision;
	if AC is 0:
		if the EVA transport line is in the location:
			say "The EVA transport line floats in a loose coil here.";
			make no decision;
		
Chapter 9 - Engine Stabilizer

The brand-new JL-758 is in the Staging Area. Understand "engine", "hunk", "metal", "JL", "new", "part" and "stabilizer" as brand-new JL-758. "What looks like part of an engine is stowed in a corner."

The electrical contacts are part of the brand-new JL-758. They are plural-named. The description of the electrical contacts is "It looks like the JL-758 is meant to be put under something, so that it makes contact with some other device.".

The openings are part of the brand-new JL-758. They are plural-named. The description of the openings is "A thick cord is threaded through the openings.".

The description of the brand-new JL-758 is "This is a wide, low, trapezoidal hunk of metal bearing the marking JL-758 on one side. Numerous electrical contacts dot the upper surface. Someone has threaded a thick cord with clips on both ends through some openings on the top and side.".

The woven cord is part of the brand-new JL-758. The description is "It looks like this is meant to attach [the jl-758] to something.". Understand "rope", "clips", "clip" as the woven cord.

The brand-new JL-758 is pushable between rooms. 

Instead of taking the brand-new JL-758:
	say "That's far too heavy";
	if gravity < 5:
		say ", in any gravity";
	say ".";
	
Instead of tying the EVA transport line to the cord:
	say "The hook on the EVA transport line won't attach securely to the clips on the cord. This is probably not where you want to attach the EVA transport line. On the other hand, the clips [italic type]will[roman type] slide along the EVA transport line smoothly."

Instead of tying the EVA transport line to the brand-new JL-758:
	say "The hook on the EVA transport line won't attach securely to the clips on the cord. This is probably not where you want to attach the EVA transport line. On the other hand, the clips [italic type]will[roman type] slide along the EVA transport line smoothly."
	
Instead of pushing the brand-new JL-758 to a direction when gravity > 1:
	say "That's too heavy to push.";

Instead of pushing the brand-new JL-758 to outside when the location is aft-airlock-room and the attachment count < 3 and attachment count > 0:
	say "I wouldn't do that before the EVA transport line is fully attached.";

Instead of pushing the brand-new JL-758 to aft when the location is aft-airlock-room and the attachment count < 3 and attachment count > 0:
	say "I wouldn't do that before the EVA transport line is fully attached.";

Instead of pushing the brand-new JL-758 to outside when the location is aft-airlock-room and attachment count is 0:
	say "I wouldn't do that. The JL-758 is likely to float away and you won't be able to stop it.";

Instead of pushing the brand-new JL-758 to aft when the location is aft-airlock-room and attachment count is 0:
	say "I wouldn't do that. The JL-758 is likely to float away and you won't be able to stop it.";

Before pushing the brand-new JL-758 to outside when the location is aft-airlock-room and the attachment count is 3:
	say "You clip the JL-758 to the EVA transport line.";

Before pushing the brand-new JL-758 to aft when the location is aft-airlock-room and the attachment count is 3:
	say "You clip the JL-758 to the EVA transport line.";
	
Before pushing the brand-new JL-758 to inside when the location is spacewalk 1:
	say "You unclip the JL-758 from the EVA transport line.";

Before pushing the brand-new JL-758 to outside when the location is Engineering Airlock and the attachment count is 3:
	say "You clip the JL-758 to the EVA transport line.";
	
Before pushing the brand-new JL-758 to inside when the location is spacewalk 3:
	say "You unclip the JL-758 from the EVA transport line.";

Rule for writing a paragraph about the brand-new JL-758 when the location is offboard:
	say "The JL-758 is floating here, clipped to the EVA transport line.";
	
Chapter 10 - Some trivia about clothing

Check taking off the engineering uniform when the player is wearing the engineering uniform and the player is wearing a vac suit:
	say "You can't remove the uniform until you remove the vac suit on top of it." instead;

Check taking off the repair corps uniform when the player is wearing the repair corps uniform and the player is wearing a vac suit:
	say "You can't remove the uniform until you remove the vac suit on top of it." instead;
	
Check examining the engineering uniform when the player is wearing the engineering uniform and the player is wearing a vac suit:
	say "You can't see the uniform when you're wearing the vac suit on top of it." instead;
	
Check examining the repair corps uniform when the player is wearing the repair corps uniform and the player is wearing a vac suit:
	say "You can't see the uniform when you're wearing the vac suit on top of it." instead;
	
Check taking the gum when the current stuck thing of the chewing gum is the engineering uniform and the player is wearing the engineering uniform and the player is wearing a vac suit:
	say "You can't reach the gum with the vac suit on top of the uniform." instead;
	
Check taking the gum when the current stuck thing of the chewing gum is the repair corps uniform and the player is wearing the repair corps uniform and the player is wearing a vac suit:
	say "You can't reach the gum with the vac suit on top of your uniform." instead;
				
Chapter 11 - Useless things

The interior is a region.

A dummy is a kind of thing. A dummy is scenery.
A dummy-backdrop is a kind of backdrop.

The room ceiling is a dummy-backdrop. The printed name is "ceiling". It is in the interior. The description is "dummy description".
The wall is a dummy-backdrop. It is in the interior. The description is "dummy description". Understand "walls" and "bulkhead" as the wall.

Instead of doing something to a dummy (this is the don't worry about a dummy rule):
	say "You really don't need to worry about [the noun]." (A);

Instead of doing something to a dummy-backdrop (this is the don't worry about a dummy-backdrop rule):
	say "You really don't need to worry about [the noun]." (A);

Book 8 - Actions

Understand "hear" as listening.

Understand "search under [something]" as looking under.
	
Instead of listening when the player is in the Galley:
	say "You can hear someone talking above you, but their gender is unclear. They're talking in short bursts with pauses between them, and no one seems to be answering.";
	
Instead of listening when the player is in the Bridge:
	say "You can hear someone talking aft from here, but their gender is unclear. They're talking in short bursts with pauses between them, and no one seems to be answering.";
	
Instead of listening when the player is in the Engineering:
	say "You can hear someone talking forward from here, but their gender is unclear. They're talking in short bursts with pauses between them, and no one seems to be answering.";
	
Instead of going down when player is on something:
	try exiting;
	
Understand "off" as exiting when the player is on something.

Understand "take out [something] from [something]" as removing it from.
Understand "take out [something]" as removing it from.

Rule for supplying a missing second noun while removing:
	if the noun is the old fuse:
		if the aft access panel is touchable:
			now the second noun is the aft access panel;

Chapter 1 - Typing

A thing can be typable.

Typing it on is an action applying to one topic and one thing. Understand "type [text] on/into [something]" as typing it on. Understand "press [text] on [something]" and "key [text] on [something]" as typing it on. Understand "enter [text] on/into [something]" as typing it on.

Understand "enter [text]" and "type [text]" and "press [text]" and "key [text]" and "enter [text]" as typing it on.

Rule for supplying a missing second noun while typing:
	if the port-side storage unit is in the location:
		now the second noun is the port keypad;
	otherwise if the starboard-side storage unit is in the location:
		now the second noun is the starboard keypad;

Contentlessly typing on is an action applying to one thing. Understand "type on/into [something]" and "press [something]" as contentlessly typing on.

Check typing a topic on something when the second noun is not typable:
	say "You can't type on [the second noun]." instead;

Check contentlessly typing on something when the noun is not typable:
	say "You can't type on [the noun]." instead;
	
Report contentlessly typing on something:
	say "You poke a few keys at random. Nothing happens.";

Chapter 2 - Screwing

A thing can be screwable. A thing can be screwed or unscrewed. A thing is usually screwed.

Understand the command "screw" as something new. Understand the command "unscrew" as something new.

Screwing is an action applying to one thing. Understand "screw [something]" as screwing. Understand "fasten [something]" as screwing. Understand "close [something]" as screwing.

Check screwing a screwable thing (this is the basic screw check rule):
	if the second noun is screwed:
		say "[The second noun] is already screwed." instead;
	
Check screwing something which is not screwable:
	say "There's nowhere on [the second noun] to put a screw.";

Unscrewing is an action applying to one thing. Understand "unscrew [something]" as unscrewing.

Check unscrewing a screwable thing:
	if the noun is unscrewed:
		say "[The noun] is already unscrewed." instead;
		
Check unscrewing something when the noun is not screwable:
	say "[The noun] cannot be unscrewed." instead;
		
Carry out unscrewing something:
	now the noun is unscrewed;
	
Report unscrewing something:
	say "You unscrew [the noun].";

Chapter 3 - Pressing
	
Pressing is an action applying to one thing. Understand "press [button]" as pressing.

Report pressing a button:
	say "Nothing happens.";

Chapter 4 - Reading

A thing is usually not readable.
A thing has a text called the readable text.

Understand the command "read" as something new.

Reading is an action applying to one thing. Understand "read [something]" as reading.

Check reading something when the noun is not readable:
	say "There is nothing to read on [the noun]." instead;
	
Carry out reading something:
	say the readable text of the noun;
	say paragraph break;

Chapter 5 - Throwing

Understand the command "throw" as something new.

Throwing is an action applying to one thing. Understand "throw [something]" as throwing.

Carry out throwing something:
	try dropping the noun;

Chapter 6 - Venting the Suit

venting is an action applying to nothing. Understand "vent the/-- vac/-- suit" or "vent air" as venting. Understand "expel air" as venting.

To decide whether suit is empty:
	if the player is not wearing a vac suit:
		decide no;
	let VS be a random vac suit worn by the player;
	if the remaining air of VS is 0:
		decide yes;
	decide no;

check venting when the player is not wearing a vac suit:
	say "You're not wearing a vac suit!" instead;
	
check venting when the player is wearing a vac suit and suit is empty:
	say "There is no air left in the suit to vent." instead;
	
carry out venting:
	let VS be a random vac suit worn by the player;
	decrement the remaining air of VS;
	
report venting:
	say "You let a unit of air out of the suit.";
	
Chapter 7 - Turning over

A thing can be flippable. A thing is usually not flippable.

turning over is an action applying to one thing. Understand "turn over [something]", "turn [something] over", "flip over [something]", or "flip [something] over" as turning over.

Check turning over something when the noun is not flippable and the noun is not fixed in place:
	say "There's no point in flipping that over." instead;

Check turning over something when the noun is fixed in place and the noun is not the suit locker 2:
	say text of the can't turn what's fixed in place rule response (A);
	say line break instead;
	
Report turning over something:
	say "You flip [the noun] over. Nothing much happens.";
	
Chapter 8 - Pushing it to

[The default implementation sucks.]

Check pushing something to (this is the new standard pushing in directions rule):
	continue the action;
	
push successful is a truth state that varies.

Carry out pushing something to:
	silently try the actor going the second noun;
	if the rule succeeded:
		now push successful is true;
		now the noun is in the location;
		now the noun is handled;
	otherwise:
		now push successful is false;
		rule fails;

After pushing something to (this is the new report pushing rule):
	if push successful is true:
		say "You push [the noun] to [the location].";
		continue the action;

After pushing something to (this is the look after pushing rule):
	if push successful is true:
		try looking;
		continue the action;
	
The new standard pushing in directions rule is listed instead of the standard pushing in directions rule in the check pushing it to rules.
The block pushing in directions rule is not listed in any rulebook.

The new report pushing rule is listed first in the after rules.
The look after pushing rule is listed last in the after rules.

Chapter 9 - Repeating

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
	
Persuasion rule when asking the actor to try repeating all and the number of entries of the speech transcript of the actor is 0:
	say "[The actor] has nothing to repeat.";
	persuasion fails;
	
Persuasion rule when asking the actor to try repeating and the last utterance of the actor is not  "":
	persuasion succeeds;
	
Persuasion rule when asking the actor to try repeating all and (the actor is a person or the actor is shipboard computer) and the number of entries of the speech transcript of the actor is not 0:
	persuasion succeeds;
	
[Persuasion rule when asking the actor to try repeating all and the actor is not a person:
	say "You cannot ask [the actor] to repeat all.";
	persuasion fails;]
	
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
	
Chapter 10 - Wrapping

Wrapping it with is an action applying to one touchable thing and one carried thing. Understand "wrap [something] in/with [something preferably held]" as wrapping it with.
Understand "wrap [something preferably held] around [something]" as wrapping it with (with nouns reversed).

Taping is an action applying to one thing. Understand "tape [something]" and "insulate [something]" as taping.

Check wrapping something with something when the noun is not the wires or the second noun is not the electrical tape:
	say "That would achieve nothing." instead;
	think thought 14;

Check taping something when the noun is not the wires:
	say "That would achieve nothing." instead;
	think thought 14;
	
Chapter 11 - Fixing

Fixing is an action applying to one thing. Understand "fix [something]" and "repair [something]" as fixing.

Check fixing something (this is the block fixing rule):
	say "This is a hard one. You'll have to be more specific about how you do that." instead;
	
Chapter 12 - Playing

Played Planetfall already is a truth state that varies.

Playing it on is an action applying to two things. Understand "play [something] on/with [something]" and "play [something]" as playing it on.

Check playing something on something (this is the can only play games rule):
	if the noun is not the copy of Planetfall:
		say "[The noun] is not a game." instead;
		
Check playing something on something (this is the can only play games on game machines rule):
	if the second noun is not Universal Game Emulator:
		say "[The second noun] cannot play games.";

Check playing the copy of Planetfall on the Universal Game Emulator when played planetfall already is true:
	think "No, I have more important things to do than playing that again." instead;
		
Carry out playing the copy of Planetfall on the Universal Game Emulator:
	now played planetfall already is true;
	start playing planetfall;
	
Rule for supplying a missing second noun while playing copy of Planetfall on:
	if the Universal Game Emulator is touchable:
		say "(on the Universal Game Emulator)[command clarification break]";
		now the second noun is the Universal Game Emulator;
	otherwise:
		say "You have nothing to play that on.";
		rule fails;

Book 9 - The Player

The player is in Space Station Gangway.

The player carries chewing gum. The description of the chewing gum is "It's a used wad of pink chewing gum. It used to taste like grape, but now it tastes of nothing."
The chewing gum is currently chewed.

The repair corps uniform is wearable. The description is "dummy description".
The player wears the repair corps uniform.

The repair corps patch is a part of the repair corps uniform. The description is "The patch shows a hammer and a wrench, crossed.".

Carry out examining the repair corps uniform:
	say "The repair corps uniform is a smart hunter green color, with a patch featuring a hammer and a wrench, crossed";
	if the gum is stuck to the repair corps uniform:
		say ". It would look impressive if it weren't for the chewing gum stuck to it";
	say ".";
	rule succeeds;

The toolbox is a thing. Understand "tools", "box", "tool" as toolbox.
The player carries the toolbox. The description of the toolbox is "Your toolbox holds wrenches, screwdrivers, pliers, and an assortment of various fasteners."

The screwdriver is a part of the toolbox. Understand "screwdrivers" as the screwdriver. 

The wrench is a part of the toolbox. Understand "wrenches" as the wrench.

The pliers are a part of the toolbox. They are plural-named.

The fasteners are a part of the toolbox. They are plural-named. Understand "screws", "bolts" as the fasteners.

A tool-thing is a kind of thing. The screwdriver, wrench, pliers, and fasteners are tool-things.
	
Instead of taking a tool-thing:
	say "You'll take [regarding the noun][them] out when you need [them].";
	
Instead of examining a tool-thing:
	say "All of your tools are top quality.";

[The toolbox contains a wrench, a flat blade screwdriver, a microwave heating element, and a box of assorted fasteners. ]
[The description is "Your toolbox is a black metal box with a lid. It is [if toolbox is closed]closed[otherwise]open[end if].";]

[The description of the wrench is "A standard adjustable wrench."
The description of the flat blade screwdriver is "A standard flat blade screwdriver.".]

[The description of the microwave heating element is "[if the microwave oven is broken]You've brought this along in case it's the component you need to fix the microwave oven.[otherwise]You brought this along in case it was the component you needed to fix the microwave oven. Turned out not to be the case, but that's fine.[end if]"]

[The box of assorted fasteners is a container. It is closed and openable. The description is "It's a small plastic box perfect for holding screws and the like."

The box of assorted fasteners contains a small bolt, a medium bolt, a large bolt, a tiny screw, a small screw, a medium screw, and a large screw.
The small bolt, medium bolt, and large bolt are bolts.
The tiny screw, small screw, medium screw, and large screw are screws.

The description of the small bolt is "This a pretty ordinary small bolt."
The description of the medium bolt is "This a pretty ordinary medium bolt."
The description of the large bolt is "This a pretty ordinary large bolt."
The description of the tiny screw is "This a pretty ordinary tiny screw, of the sort you might use for electronic appliances."
The description of the small screw is "This a pretty ordinary small screw."
The description of the medium screw is "This a pretty ordinary medium screw."
The description of the large screw is "This a pretty ordinary large screw."]

[The carrying capacity of the player is 10.]

To decide whether gum is stuck to (T - an object):
	if current stuck thing of the chewing gum is T:
		decide yes;
	decide no;
	
The description of the player is "see instead of examining".


Instead of examining the player:
	If the player wears a vac suit: 
		say "Not much to see other than the vac suit[if current stuck thing of the chewing gum is a vac suit]. Oh, and the chewing gum stuck to it[end if].";
	otherwise if the player wears the engineering uniform:
		say "It's against regulations to wear someone else's uniform[if the current stuck thing of the chewing gum is the engineering uniform], or to stick gum to it, for that matter[end if].[run paragraph on]";
		if the player wears the slippers:
			say " And I gotta say, the slippers look silly with the uniform[if the current stuck thing of the chewing gum is the slippers], especially with that gum stuck to them[end if].";
		say paragraph break;
	otherwise if the player wears the repair corps uniform:
		say "Nice uniform";
		if the player wears the slippers:
			say ", even with the slippers";
			if gum is stuck to slippers:
				say ", which look even sillier with that gum stuck to them";
		if gum is stuck to repair corps uniform:
			say ", but you should get the gum off of it";
		say ".";					
	otherwise:
		let slippers description be "The slippers are nice, though[if the current stuck thing of the chewing gum is the slippers], even with that gum stuck to them[end if]";
		say "You're wearing nothing but your underwear. Aren't you cold[run paragraph on][if the player wears the slippers]? [slippers description].[otherwise]?[end if][paragraph break]";
		

Chapter 1 - Wearing things

Check wearing the engineering uniform when the player wears a vac suit:
	say "You can't put a uniform on over a vac suit. Try the other way around." instead;

Check wearing the repair corps uniform when the player wears a vac suit:
	say "You can't put a uniform on over a vac suit. Try the other way around." instead;
	
Check wearing the engineering uniform when the player wears the repair corps uniform:
	say "(removing the repair corps uniform first)";
	try taking off the repair corps uniform;
	
Check wearing the repair corps uniform when the player wears the engineering uniform:
	say "(removing the engineering uniform first)";
	try taking off the engineering uniform;

Book 10 - People

The Navigator is a person. It is neuter. The description is "dummy description".

The Pilot is a person. It is neuter. The description is "dummy description".

Before answering someone that:
	say "I'm not sure what you're trying to say. I might just not recognize the words you're using." instead;
	
Before asking Arvax about "himself":
	try quizzing arvax about arvax instead;
	
Before asking Captain Mulgrew about "herself":
	try quizzing Captain Mulgrew about Captain Mulgrew instead;

Instead of asking someone about a topic when end game is not happening:
	say "'I'm afraid I don't have anything to say about that.'";
	reset turns in state instead;
	
Before telling someone about a topic:
	say "'I'm afraid I don't have anything to say about that.'";
	reset turns in state instead;
	
Check showing something to Arvax:
	say "[The arvax] is on the radio. [They] can't see you." instead;
	
Check showing something to captain mulgrew:
	say "[The captain mulgrew] is on the radio. [They] can't see you." instead;
	
Check giving something to Arvax:
	say "[The arvax] is on the radio. You can't give [them] anything." instead;
	
Check giving something to captain mulgrew:
	say "[The captain mulgrew] is on the radio. You can't give [them] anything." instead;

reaching inside for The Room of Stuff (this is the reaching inside the room of stuff rule):
	rule succeeds;
	
reaching inside for Deneb III Naval Command: rule succeeds;
	
The shipboard computer is a thing in the room of stuff. Understand "system" as the shipboard computer. shipboard computer is addressable. It is familiar. The description is "dummy description".

Understand "ship" as the SS Usagi.

Chapter 1 - States

Understand "caller" and "man" as Arvax.

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

block answering rule response (A) is "'I'm afraid I don't have anything to say about that.'".
block informing rule response (A) is "'I'm afraid I don't have anything to say about that.'".
block quizzing rule response (A) is "'I'm afraid I don't have anything to say about that.'".
block telling rule response (A) is "'I'm afraid I don't have anything to say about that.'".
block asking rule response (A) is "'I'm afraid I don't have anything to say about that.'".

Report imploring someone for something (this is the block imploring rule):
	say "[There] [are] no reply." (A).
	
Section 1 - Making Contact

[Instead of doing something other than saying hello to Arvax when talking about making contact:
	if action name part of the current action is not the saying hello to action:
		say action name part of the current action;
		say "[text of parser error internal rule response (E)][line break]";
		stop;]
	
		
Before quizzing arvax about something when talking about making contact (this is the say hello before quizzing rule):
	say "You should say hello first." instead;
		
Before informing arvax about something when talking about making contact (this is the say hello before informing rule):
	say "You should say hello first." instead;
		
Before asking arvax about something when talking about making contact (this is the say hello before asking rule):
	say "You should say hello first." instead;
		
Before telling arvax about something when talking about making contact (this is the say hello before telling rule):
	say "You should say hello first." instead;
	
[the say hello before quizzing rule is listed first in the check quizzing it about rules.
the say hello before informing rule is listed first in the check informing it about rules.
the say hello before asking rule is listed first in the check asking it about rules.
the say hello before telling rule is listed first in the check telling it about rules.]

Identity of the player is a fact. The description is "fact".

After saying hello to Arvax when talking about making contact:
	say "You call out 'Yes! I'm here! I'm here! What's going on?'[paragraph break]";
	talk about establishing the situation;
	print "[The Arvax] responds, 'Ahoy there, SS Usagi, good to hear from you. Seems like you're a bit out of sorts, and we'd like to help you out. But before we get into that, who am I speaking to? Tell me about yourself.'[paragraph break]" as arvax near communications console;
	say "You tell [the arvax] that you're from the repair corps.[paragraph break]";
	now arvax is familiar; 
	now arvax knows identity of the player;
	now arvax is proper-named;
	print "'Alright then, Sergeant Screwdriver, I'll fill you in. Space Station Omicron-5 was bombed by separatists from Deneb IV. By some miracle the Usagi was spared the worst of the blast; you were thrown clear of the station. Only problem is now you're hurtling towards New Da Nang, a heavily-populated moon of Deneb II. An impact there would kill not only you but potentially thousands of people more.[paragraph break]
	   'So we've got some work to do. I'm [arvax]. I'm going to try and help you get this ship under control again. First we have to establish, though, what the ship is currently doing. Normally, I'd be able to tap into the ship diagnostics and controls from here on Deneb III, but something seems to have gone wrong. So I'm going to need your help. Are you up to the task?'[paragraph break]" as arvax near communications console;
	think "Sergeant Screwdriver, guy thinks he's funny.";
	say "'Yes sir!' you proclaim, despite his lame joke.[paragraph break]"; 
	talk about mulgrew breaks in;
	activate the Table of Trust Hints;
	print "'Great, great. Now let's get to work.[paragraph break]
	'The first thing I need you to do is reboot the system, using the computer. Once you do that, hopefully I'll be able to access ship controls. You'll have to use my access code: say [']compu--'[paragraph break]" as arvax near communications console;
	say "[The Arvax]'s voice breaks up and another voice comes over comms. [run paragraph on]";
	print "'SS Usagi, this is Captain Jane Mulgrew, please come in. Repeat, this is Captain Mulgrew of the SS Usagi, Usagi come in.'[paragraph break]" as Jane Mulgrew near communications console;
	think "Somebody else?";
	
Response of Arvax when saying no and talking about waiting for yes:
	say "'Come now, surely there's no reason for such a negative attitude?'";

Speech Help Tipped is truth state that varies.	

For asking for attention by Arvax while current conversation state is making contact:
	print "A man's voice comes over comms: '[one of]SS Usagi, come in! Is anyone there?[or]If there's anyone on the Usagi, please respond![or]Usagi, are you there?[or]Come in, Usagi, Come in, Usagi.[purely at random]'[paragraph break]" as arvax near communications console with transcript false;
	if location is Operations and Speech Help Tipped is false:
		think "Finally, another person! I'm saved!";
		tip "By the way... you can get help about speaking to other characters by typing 'help speech'.";
		now speech help tipped is true;
	make no decision;
	
For asking for attention by Arvax while current conversation state is establishing the situation:
	print "'[one of]You still there?'[or]Come in Usagi!'[or]If you're there, just tell me a little bit about yourself.'[or]Usagi, come in!'[purely at random][line break]" as arvax near communications console with transcript false;
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
	print "'[one of]Well, Sergeant Screwdriver?[or]Yes or no?[or]C'mon, you can do this.[purely at random]'[line break]" as arvax near communications console with transcript false;
	make no decision;
	
For Asking for attention by Arvax when current conversation state is asking mulgrew questions:
	print "[Arvax]: 'Hey, friend, we need to reboot the computer soon before it's too late.'[line break]" as Arvax near communications console with transcript false;

System rebooted is a truth state that varies.

After informing Arvax about a vac suit:
	print "'There's a chance of a short outage in the environmental system during a system reboot. Better get that suit refilled first.'[line break]" as Arvax near communications console;
	reset turns in state;

After quizzing Arvax about a vac suit:
	print "'There's a chance of a short outage in the environmental system during a system reboot. Better get that suit refilled first.'[line break]" as Arvax near communications console;
	reset turns in state;

Every turn when (not talking about asking mulgrew questions) and computer-rebooting is false and protocols-in-progress is false and last-moves is false:	
	if turns in state > 0 and the remainder after dividing turns in state by 2 is 0:		
		Carry out the asking for attention by activity with Arvax;
	if turns in state > 0 and the remainder after dividing turns in state by 2 is 0:		
		Carry out the asking for attention by activity with Captain Mulgrew;
	increment turns in state;

Every turn when talking about asking mulgrew questions and computer-rebooting is false and protocols-in-progress is false:
	if turns in state > 0 and the remainder after dividing turns in state by 4 is 0:		
		Carry out the asking for attention by activity with Arvax;
	if turns in state > 0 and the remainder after dividing turns in state by 4 is 2:		
		Carry out the asking for attention by activity with Captain Mulgrew;
	increment turns in state;
	
Asking Mulgrew Questions is a conversation state. The primary driver is Captain Mulgrew.

Mulgrew Breaks In has reminder text "Captain Mulgrew is waiting for you to respond.";

For asking for attention by Captain Mulgrew when current conversation state is mulgrew breaks in:
	print "Captain Mulgrew: '[one of]Hello, Usagi![or]Come in, Usagi![or]Anyone there, Usagi?[or]We hear you, Usagi, please respond.[purely at random]'[paragraph break]" as Captain Mulgrew near communications console with transcript false;	

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
	think "Oh no, who should I trust?";
	Now Captain Mulgrew is familiar;
	Now emergency protocols is familiar;
	Now the current conversation state is Asking Mulgrew Questions;
	reset turns in state;

The reminder text of asking mulgrew questions is "Captain Mulgrew is waiting for you to agree, or ask further questions.";	

For asking for attention by Captain Mulgrew while current conversation state is asking mulgrew questions:
	print "Captain Mulgrew: '[one of]Did I lose you, Usagi?[or]Any questions?[or]Calling the SS Usagi...[or]What'll it be, Usagi?[purely at random]'[line break]" as Captain Mulgrew near communications console with transcript false;
	
Response of Captain Mulgrew when asked about Captain Mulgrew:
	print "'I'm Captain Jane Mulgrew of the SS Usagi. I've been around the Deneb system for a long time, and I know it like the back of my hand. I've dealt with the separatists before, and I've seen enough to know just how cutthroat they are. I won't hesitate to protect the people of the Space Authority from such terrorists.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about SS Usagi:
	print "'Finest fighting ship in the system. Proud to captain her.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about Arvax:
	print "'Arvax is a traitor pure and simple. If you haven't yet, consult his file through through the ship computer.'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when asked about separatists:
	print "'There's no room for shades of grey with them. Wipe them all out.'[line break]" as captain mulgrew near communications console;
	
Response of Captain Mulgrew when asked about Deneb IV:
	print "'Beautiful planet, held hostage by those terrorist maniacs.'[line break]" as Captain Mulgrew near communications console;
	
[Response of Captain Mulgrew when asked about computer:
	print "'You won't be able to access ship functions, but the rest of its capabilities will likely prove invaluable.'[line break]" as Captain Mulgrew near communications console;]
		
Response of Captain Mulgrew when asked about Da Nang:
	print "'I'm not sure why they couldn't have just used a normal name, like New New Jersey or something, but still, you'd hate to see anything happen to the place.'[line break]" as Captain Mulgrew near communications console;

Emergency protocols is a subject. It is not familiar. The description is "subject".	

Response of Captain Mulgrew when asked about subj-rebooting-computer:
	print "'Don't be too hasty to reboot the computer. Once that's done, Arvax can get control of the ship and we won't be able to get it back. We need to activate the ship's emergency protocols. The computer will reboot itself if necessary.'[line break]" as Captain Mulgrew near communications console;
	Now emergency protocols is familiar;
	
Response of Captain Mulgrew when asked about emergency protocols:
	print "'To prevent Arvax from seizing control of the ship remotely, we need to put the ship in a mode where it ignores all data communications. Voice radio will still be able to get through, but communications with the computer from outside will cease. You'll need to use my access code: say [']computer, access code [Mulgrew code]['].'[line break]" as Captain Mulgrew near communications console;
	
Response of Captain Mulgrew when told about Arvax:
	print "'Yes, I know, we've heard you. I'll reiterate my warning about Arvax: his loyalties lie with Deneb IV, not the Space Authority.'[line break]" as Captain Mulgrew near communications console;
	
After informing Captain Mulgrew about a vac suit:
	print "'Shouldn't need it.'[line break]" as Captain Mulgrew near communications console;
	
After quizzing Captain Mulgrew about a vac suit:
	print "'Shouldn't need it.'[line break]" as Captain Mulgrew near communications console;

mulgrew-is-angry is a truth state that varies.	

Response of Captain Mulgrew when asked-or-told about Captain's Affair:
	print "'Lies. Filthy lies. I don't know what you're talking about. And reading my private journal! What kind of person are you?'[paragraph break]" as Captain Mulgrew near communications console;
	now mulgrew-is-angry is true;
	say "Captain Mulgrew cuts the connection.";

Response of Captain Mulgrew when asked-or-told about the captain's journal and the captain's affair is familiar:
	print "'Lies. Filthy lies. I don't know what you're talking about. And reading my private journal! What kind of person are you?'[paragraph break]" as Captain Mulgrew near communications console;
	now mulgrew-is-angry is true;
	say "Captain Mulgrew cuts the connection.";
	
mulgrew's-code is a subject. It is not familiar. The description is "subject".
security code is a subject. The description is "subject". understand "access", "password" as security code.
	
To say Mulgrew code:
	if Mulgrew's security code is 0:
		now mulgrew's security code is a random number between 10000 and 99999;
	If mulgrew's security code is arvax's security code:
		now mulgrew's security code is arvax's security code - 1;
	say "[mulgrew's security code]";
To say Arvax code:
	if Arvax's security code is 0:
		now Arvax's security code is a random number between 10000 and 99999;
	say "[arvax's security code]";

Response of Captain Mulgrew when asked about the computer:
	print "'Ah yes, I suppose you'll need privileged access. Just say: [']computer, access code [Mulgrew code]['].'[line break]" as captain mulgrew near communications console;
	now mulgrew's-code is familiar;
	
Response of Arvax when asked about security code:
	print "'Just say [']Computer, access code [Arvax code]['].'[line break]" as arvax near communications console;
	
Response when saying yes and current conversation state is not waiting for yes:
	say "I'm not sure what question you're answering.";
	
Response when saying no and current conversation state is not waiting for yes:
	say "I'm not sure what question you're answering.";
	
Section 3 - Revenge of Arvax

Number of arvax interactions is a number that varies.

After quizzing arvax about something (this is the you're tired rule):
	increment number of arvax interactions;
	if number of arvax interactions is 4 and gravity > 1 and protocols-activated is false:
		say "'Hey, you sound tired. If you need a rest, lower the gravity setting. You should find it in the operations deck somewhere.'";
	continue the action;
	
The you're tired rule is listed last in the after rulebook.

After informing arvax about something:
	increment number of arvax interactions;
	if number of arvax interactions is 4:
		say "'Hey, you sound tired. If you need a rest, lower the gravity setting. You should find it in the operations deck somewhere.'";
	continue the action;
	
After quizzing or informing Arvax about a room:
	say "'I'm afraid I don't have anything to say about that.'[line break]";

A thing can be endgame-relevant.
The fusion engine, the ss usagi, fuel injection specification, engine status, brand-new JL-758 are endgame-relevant.
Destroying the ship is endgame-relevant.

[check asking Arvax about something during end game (this is the divert end game asking rule):
	say "'We don't have time for that!'";
	try quizzing arvax about the ss usagi instead;]

[check quizzing Arvax about something when the second noun is not endgame-relevant during end game (this is the divert end game quizzing rule):
	say "'We don't have time for that!";
	try quizzing arvax about the ss usagi instead;]

[check telling Arvax about something during end game (this is the divert end game telling rule):
	say "'We don't have time for that!";
	try quizzing arvax about the ss usagi instead;]

[check informing Arvax about something during end game (this is the divert end game informing rule):
	say "'We don't have time for that!";
	try quizzing arvax about the ss usagi instead;]
	
[The divert end game conversation rule is listed first in the before rules.
]
Response of Arvax when asked-or-told about Captain's Affair:
	print "'Oh, Captain no... We must act fast if we're going to stop her from claiming even more lives.'[line break]" as Arvax near communications console;
	now Arvax knows Captain's Affair;

Response of Arvax when asked-or-told about Captain's journal and the captain's affair is familiar:
	print "'Oh, Captain no... We must act fast if we're going to stop her from claiming even more lives.'[line break]" as Arvax near communications console;
	now Arvax knows Captain's Affair;

Response of Arvax when asked about Da Nang:
	print "'Never been there, and I'll never get the chance if we don't act fast.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about SS Usagi:
	print "'Great ship. I hope we can save her. And you.'[line break]" as Arvax near communications console;

Response of Arvax when asked-or-told about Captain Mulgrew and talking about asking mulgrew questions:
	if arvax knows captain's affair:
		print "'I knew there was at least one captain working with the separatists, but I hadn't guessed that it was Mulgrew. Wow...'[line break]" as Arvax near communications console;
	otherwise:
		print "'Let me guess. She told you I'm a separatist stooge, right? I guess it's time to blow my cover. I've been cultivating that image for several years now to infiltrate Deneb IV. Here. Enter my access code: [']computer, access code [Arvax code]['] and look up [']Operation Dalmatian['].'[line break]" as Arvax near communications console;	
		Now operation dalmatian is familiar;	
	
Response of Arvax when asked-or-told about Captain Mulgrew and talking about cs-end-game-protocols:
	if Captain's Affair is not familiar:
		print "'Seems like she was one of the bad ones. I was suspicious when I learned she had escaped the space station explosion.'[line break]" as Arvax near communications console;
	otherwise:
		print "'Blackmail or not, she's a villain through-and-through.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about destroying the ship and talking about cs-end-game-protocols:
	say "I don't know much about it, but I imagine it can be done by setting the fuel mix right... well, wrong, I guess.";
	
Response of Arvax when asked-or-told about Captain Mulgrew and talking about cs-end-game-reboot:
	if Captain's Affair is not familiar:
		print "'Wonder where she went? It's suspicious that she disappeared after you didn't follow orders.'[line break]" as Arvax near communications console;
	otherwise:
		print "'Blackmail or not, she's a villain through-and-through.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about Operation Dalmatian:
	print "'Ask the computer.'[line break]" as Arvax near communications console; 
	
Response of Captain Mulgrew when asked-or-told about Operation Dalmatian and talking about asking mulgrew questions:
	print "'Never heard of it. No doubt another of Arvax's lies.'[line break]" as Captain Mulgrew near communications console;

Response of Arvax when asked-or-told about the computer and talking about asking mulgrew questions:
	print "'You'll need my access code: [Arvax code].'[line break]" as Arvax near communications console;

Response of Arvax when asked-or-told about the computer:
	print "'Invaluable resource. Take advantage of it.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked about the security code:
	print "'It's [Arvax code].'[line break]" as Arvax near communications console;
	
Response of Captain Mulgrew when asked about the security code and talking about asking mulgrew questions:
	print "'It's [Mulgrew code].'[line break]" as captain mulgrew near communications console;

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
	
Section 4 - Arvax End Game - Reboot

To decide whether problems exist:
	if engine output is Liquid Copernicium and the fusion engine is not broken:
		decide no;
	decide yes;
	
To say problems description:
	let num-problems be 0;
	let problems be a list of texts;
	if protocols-activated is true:
		add "the helm is not responding to any commands" to problems;
		increment num-problems;
	if the fusion engine is broken:
		add "there is some physical issue with the engine" to problems;
		increment num-problems;
	if the engine output is not Liquid Copernicium:
		add "the fuel injection specification for the fusion engine is incorrect" to problems;
		increment num-problems;
	if num-problems is 1:
		say "I'm trying to divert the ship from its collision course with New Da Nang, but there's a problem: [problems]";
	otherwise:
		say "I'm trying to divert the ship from its collision course with New Da Nang, but there are some problems: [problems]";

After saying hello to Arvax when talking about cs-end-game-reboot:
	print "'You're back! Great job rebooting the computer -- I'm getting telemetry now.'[line break]" as Arvax near communications console;
	report on ship;
	reset turns in state;

To decide whether ship is in self-destruct mode:
	decide on whether or not engine output is Void Matter;
	
After going to operations deck when talking about cs-end-game-reboot and current interlocutor is arvax:
	reset turns in state;
	report on ship;
	continue the action;
	
Response of Arvax when asked-or-told about usagi and talking about cs-end-game-reboot:
	report on ship;
	
To report on ship:
	[say "'The only thing we have time to focus on is the ship![paragraph break]";]
	if turns left < 20 and problems exist:
		print "[line break]'I'm sorry... you're going to have to destroy the ship. We're out of time.'[line break]" as Arvax near communications console;
		rule succeeds;
	if problems exist:		
		If the engine output is not Liquid Copernicium:
			add Adjust fuel injection specification;
		if the fusion engine is broken:
			add fix the engine;
		print "'[problems description].'[paragraph break]" as Arvax near communications console;
	otherwise if ship is in self-destruct mode:
		print "'Friend, if I were to start the fusion engine with the fuel injection you've specified, the ship would explode. Are you sure there is no other option to save the people of New Da Nang?'" as Arvax near communications console;
		tip "If you really want to blow up the ship, enter 'Arvax, self-destruct' to start the countdown from 10, or press the test button in the engine room.";
	otherwise if last-moves is false:
		print "'Looks like the ship is ready to fly! Quick! I've set up evasive maneuvers but the command needs to be given from the bridge! Get to the bridge and use the command console! Say [']computer, execute[']'[line break]" as Arvax near communications console;
		now last-moves is true;
		now turns left is 10;
		think "Not much time!";
	otherwise: 
		print "'Hurry! Get to the bridge!'" as Arvax near communications console;
		
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
	Now test sequence countdown is 11;
	
	
[Response of Arvax when asked-or-told about main starboard engine and talking about cs-end-game-reboot:
	print "'It seems like it's out of balance. The engines must be very precisely balanced. Go take a look.'[line break]" as Arvax near communications console;]
	
Fuel injection specification is a subject. The description is "subject".
[Response of Arvax when asked-or-told about fuel injection specification and talking about cs-end-game-reboot:
	print "'This may be tricky. Take a look around the engine room.'[line break]" as Arvax near communications console;]

For asking for attention by Arvax while talking about cs-end-game-reboot and computer-rebooting is false:
	print "[Arvax]: 'You there, Usagi? We don't have much time.'[line break]" as Arvax near communications console with transcript false;
	

Section 5 - Arvax End Game - Protocols

Yelled about protocols is a truth state that varies.

Instead speaking, conversing, or implicit-conversing when the location is vacuum:
	say "You can't talk to anyone right now, since the room is in vacuum.";
	
Response of Arvax when asked-or-told about helm and talking about cs-end-game-protocols:
	print "'You'll need to investigate yourself. The problem should be somewhere on the bridge.'[line break]" as Arvax near communications console;
	
Response of Arvax when asked-or-told about fuel injection specification and talking about cs-end-game-protocols:
	print "'Until we get the helm sorted out, don't bother.'[line break]" as Arvax near communications console;

For asking for attention by Arvax while talking about cs-end-game-protocols:
	print "[Arvax]: 'You there, Usagi? We don't have much time.'[line break]" as Arvax near communications console with transcript false;
	
cs-end-game-protocols-said-hello is a truth state that varies.

After saying hello to Arvax when talking about cs-end-game-protocols and cs-end-game-protocols-said-hello is false:
	print "'Finally! Where've you been? I'm sad to see you invoked Mulgrew's emergency protocols, but that's water under the bridge. Now we need to try to salvage the situation.'[paragraph break]" as Arvax near communications console;
	now cs-end-game-protocols-said-hello is true;
	report on ship-protocols;
	reset turns in state;
	
After saying hello to Arvax when talking about cs-end-game-protocols:
	print "'No time for that! What are we going to do?'" as Arvax near communications console;
	
After going to Operations Deck when talking about cs-end-game-protocols and current interlocutor is arvax:
	report on ship-protocols;
	reset turns in state;
	continue the action;
	
Response of Arvax when asked-or-told about usagi and talking about cs-end-game-protocols:
	report on ship-protocols;

To report on ship-protocols:
	if turns left < 20:
		print "[line break]'I'm sorry... you're going to have to destroy the ship. We're out of time.'[line break]" as Arvax near communications console;
		think "Oh god, this is it.";
		rule succeeds;
	if player aware of melted helm is true:
		print "'I'm sorry, I don't think the helm can be fixed -- not with the time you have left. You're going to have to destroy the ship.'[line break]" as Arvax near communications console;
		think "Oh god, this is it.";
	otherwise:
		print "'[problems description]. [paragraph break]'To be honest, friend, the readouts I'm seeing about the state of helm control are dire. I'm not sure it can be fixed.'[line break]" as Arvax near communications console;

arvax aware of melted helm is a truth state that varies.	

Response of Arvax when asked-or-told about the helm access panel and player aware of melted helm is true and talking about cs-end-game-protocols:
	print "'Dammit! ... I'm sorry, I don't think that can be fixed -- not with the time you have left.'[line break]" as Arvax near communications console;
	now arvax aware of melted helm is true;
	
Response of Arvax when asked-or-told about helm and talking about cs-end-game-protocols and player aware of melted helm is true :
	print "'Dammit! ... I'm sorry, I don't think that can be fixed -- not with the time you have left.'[line break]" as Arvax near communications console;
	now arvax aware of melted helm is true;
	
Section 6 - More things about the ship

Response of Arvax when asked-or-told about the engine status:
	report on engine;
	
Response of Arvax when asked-or-told about the fusion engine:
	report on engine;

To report on engine:
	if computer-rebooted is false and protocols-activated is false:
		say "'I can't get any readings until you reboot the system.'[line break]";
	otherwise if ship is in self-destruct mode:
		print "'Friend, if I were to start the fusion engine with the fuel injection you've specified, the ship would explode. Are you sure there is no other option to save the people of New Da Nang?'[paragraph break]" as Arvax near communications console;
		tip "If you really want to blow up the ship, enter 'Arvax, self-destruct' to start the countdown from 10, or press the test button in the engine room.";
	otherwise if protocols-activated is true:
		say "'It's probably the engine stabilizer that's broken, but that doesn't matter without helm control";
		if arvax aware of melted helm is false:
			say ". Go check on the helm -- the big table in the bridge.'";
		otherwise:
			say ". Even if you fix the engine we won't be able to fly. You're going to have to destroy the ship.'";
	otherwise if fusion engine is broken:
		say "'It looks like you need to replace the engine stabilizer. It's the kind of thing you might have on board.'[line break]";
	otherwise:
		say "'I'm seeing the engine fully online";
		if engine output is Liquid Copernicium:
			say ".'[line break]";
			try quizzing arvax about the ss usagi;
		otherwise:
			say ". Now you need to get the fuel specification right.'[line break]";
			add adjust fuel injection specification;

Response of Arvax when asked-or-told about the fuel injection specification:
	if engine output is Liquid Copernicium:
		say "'It looks like you've set the fuel injection correctly.'[line break]";
		if not problems exist:
			try quizzing arvax about the ss usagi;
	otherwise if engine output is Void Matter:
		if protocols-activated is true:
			say "'You've set the fuel injection to destroy the ship. I think you may be right.'[line break]";
		otherwise:
			say "'You've set the fuel injection to destroy the ship! Change it now before anything happens!'[line break]";
	otherwise:
		say "'You need to set it to produce the correct output. The computer may be able to help you. I'm no engine specialist.'[line break]";
	

Section 7 - A few more things

Does the player mean quizzing arvax about the fusion engine:
	It is very likely;

Book 11 - The Computer

After deciding the scope of the player (this is the computer is everywhere rule):
	Place shipboard computer in scope;

Understand "ask the/-- ship/-- computer for help" as a mistake ("Try 'computer, help' instead.").
			
Instead of asking shipboard computer about "help":	
	try quizzing the shipboard computer about shipboard computer instead;
	
After reading a command:
	if "[the player's command]" is "computer, help":
		change the text of the player's command to "ask shipboard computer about shipboard computer";

Instead of quizzing the shipboard computer about something when the location is offboard (this is the can't quiz the computer off the ship rule):
	say "You can only talk to the computer on board the ship." (A);
	
Instead of informing the shipboard computer about something when the location is offboard:
	say "[text of the can't quiz the computer off the ship rule response (A)][line break]";
	
Instead of asking the shipboard computer about something when the location is offboard:
	say "[text of the can't quiz the computer off the ship rule response (A)][line break]";
	
Instead of telling the shipboard computer about something when the location is offboard:
	say "[text of the can't quiz the computer off the ship rule response (A)][line break]";
	
Instead of telling the shipboard computer about something (this is the can't tell the computer rule):
	say "You can ask the computer about things, but you can't tell it about things." (A);
	
Instead of informing the shipboard computer about something:
	say "[text of the can't tell the computer rule response (A)][line break]";

After quizzing the shipboard computer about shipboard computer:
	say "[line break][fixed letter spacing]Helpful commands:
[line break][line break]
- ask computer about <subject>[line break]
- computer, emergency protocols: activates the ship's emergency protocols (needs authorization)[line break]
- computer, reboot: restarts all ship functions (needs authorization)[line break]
- computer, access code <code>: authorizes user[variable letter spacing][line break]";
	now emergency protocols are familiar;

After asking shipboard computer about a topic:
	print "I'm unable to give you any information about [topic understood].[line break]" as computer near player;

After quizzing shipboard computer about an object when logged in as Arvax is false and the second noun is not the shipboard computer:
	if there is a dt-subject of the second noun in the Table of computer Subjects:
		choose the row with dt-subject of second noun in the Table of computer Subjects;
		if the dt-text-mulgrew entry is "":
			print "Information on [second noun] is restricted.[line break]" as computer near player;
		otherwise: 		
			print "[dt-text-mulgrew entry][line break]" as computer near player;
			if the second noun provides the property familiar:
				now the second noun is familiar;
	otherwise:
		print "I'm unable to give you any information about [the second noun].[line break]" as computer near player;
		
After quizzing shipboard computer about an object when logged in as Arvax is true and the second noun is not the shipboard computer:
	if there is a dt-subject of the second noun in the Table of computer Subjects:
		choose the row with dt-subject of second noun in the Table of computer Subjects;
		if there is no dt-text-arvax entry or the dt-text-arvax entry is "":
			print "[dt-text-mulgrew entry][line break]" as computer near player;
		otherwise: 
			print "[dt-text-arvax entry][line break]" as computer near player;
			if the second noun provides the property familiar:
				now the second noun is familiar;
	otherwise:
		print "I'm unable to give you any information about [the second noun].[line break]" as computer near player;
		
Arvax's security code is a number that varies.
Mulgrew's security code is a number that varies.
Hacking is an action applying to one topic. Understand "access code [text]" and "password [text]" and "passcode [text]" as hacking.
After the shipboard computer hacking a topic:
	if the topic understood is "0":
		print "Access denied.[line break]" as computer near player;
	otherwise if "[Arvax's security code]" is the topic understood:
		print "Welcome, [Arvax]. Logging you in.[line break]" as computer near player;
		now Logged in as Arvax is true;
		now Logged in as Mulgrew is false;
	otherwise if "[Mulgrew's security code]" is the topic understood:
		print "Welcome, [captain mulgrew]. Logging you in.[line break]" as computer near player;
		now Logged in as Arvax is false;
		now Logged in as Mulgrew is true;
	otherwise:
		print "Access denied.[line break]" as computer near player;
		
Instead of the player hacking a topic:
	say "I don't get it. What are you trying to log in to?";
		
Persuasion rule for asking the shipboard computer to try hacking:
	persuasion succeeds;

Chapter 1 - Data

To say familiarize (T - a thing):
	now T is familiar;

Deneb System is a subject. The description is "subject".
Deneb IV is a subject. The description is "subject".
Deneb II is a subject. The description is "subject".
Deneb sector is a subject. The description is "subject".
The Space Marines are a subject. The description is "subject".
Operation Dalmatian is a subject. It is not familiar. The description is "subject". Understand "dalmation" as Operation Dalmatian.
Delphi Engine Controls Aleph-Null is a subject. It is not familiar. The description is "subject". Understand "aleph" and "null" as Delphi Engine Controls Aleph-Null.
Luna Spacewerks Parsec VI is a subject. It is not familiar. The description is "subject". Understand "drive" as Luna Spacewerks Parsec VI.
Luna Spacewerks is a subject. The description is "subject". It is not familiar.
Element Copernicium is a subject. The description is "subject". It is not familiar.
Substance Injection is a subject. The description is "subject". It is not familiar.
Delphi Engine Controls LLC is a subject. The description is "subject". It is not familiar.
Orion Marine Academy is a subject. The description is "subject". It is not familiar.
Deneb III planet is a subject. The description is "subject". It is not familiar.
Space Authority is a subject. The description is "subject".
The Space Force is a subject. The description is "subject".
Pollux star is a subject. The description is "subject".
[Explosion is a subject. It is not familiar. The description is "subject".]
Location of the ship is a subject. The description is "subject". Understand "navigation", "navigate", "course", "trajectory" as location of the ship.
Captain Jane Mulgrew is a woman. The description is "dummy description".
The Deneb separatists is a subject. The description is "subject". Understand "terrorists", "rebels" as Deneb separatists.
New Da Nang is a subject. The description is "subject".
Access key is a subject. The description is "subject".
The Sun is a subject. The description is "subject". Understand "Sol" as the Sun. Understand "solar system" as the sun.
Earth is a subject. The description is "subject".
The moon is a subject. The description is "subject". Understand "Luna" as the moon.
Mercury is a subject. The description is "subject".
Venus is a subject. The description is "subject".
Mars is a subject. The description is "subject".
Jupiter is a subject. The description is "subject".
Europa is a subject. The description is "subject".
Saturn is a subject. The description is "subject".
Tethys is a subject. The description is "subject".
Uranus is a subject. The description is "subject".
Neptune is a subject. The description is "subject".
Pluto is a subject. The description is "subject".
Cygnus is a subject. The description is "subject".
Milky Way is a subject. The description is "subject".
Life support is a subject. The description is "subject".
Hull Integrity is a subject. The description is "subject".
Pollux III is a subject. The description is "subject".
Pollux VI is a subject. The description is "subject".
Irion is a subject. The description is "subject". Understand "Irion invaders" as Irion.
Engine status is a subject. The description is "subject". Understand "drive" as engine status.
Gravity-subject is a subject. It is privately-named. The description is "subject". The printed name is "gravity". Understand "gravity" as gravity-subject.
Corporal Delores Franck is a subject. It is unfamiliar.
Gunnery Sergeant Somchai Khotpanya is a subject. It is unfamiliar.
Private First Class Friedrich Jäger is a subject. It is unfamiliar.
Private Akin Abimbola is a subject. It is unfamiliar.
Destroying the ship is a subject. Understand "destruction", "destruct", "self-destruct", "scuttle", "scuttling", "blowing up" as destroying the ship;

subj-rebooting-computer is a subject. The description is "subject". Understand "reboot/rebooting/restart/restarting computer/--" as subj-rebooting-computer.

Table of Computer Subjects
dt-subject (a thing)	dt-text-mulgrew (a text)	dt-text-arvax (a text)
Arvax	"Classified personnel data on [Arvax]: Master Sergeant Arvax has had a distinguished career in the Space Marines, but has come under scrutiny in recent years for alleged sympathies with separatist factions on Deneb IV. Military Intelligence has so far declined to move on Arvax, but urges commanding officers to exercise discretion in their dealings with him, and to remain vigilant for any suspicious behavior."	"Classified personnel data on [Arvax]: Master Sergeant Arvax has had a distinguished career in the Space Marines, with a top-secret deployment with Military Intelligence. He is currently posing as a separatist sympathizer on Deneb IV."
SS Usagi	"The SS Usagi is a light frigate in the Deneb system, with a crew of five including the captain. It is currently helmed by Captain Jane Mulgrew.[familiarize Captain Jane Mulgrew] The ship's main drive is a Luna Spacewerks Parsec VI.[familiarize Luna Spacewerks Parsec VI][familiarize Luna Spacewerks]"	--
Captain Jane Mulgrew	"Captain Mulgrew is one of the most decorated captains in the Deneb sector.[familiarize Deneb sector] She was the second-youngest graduate of the Orion Marine Academy[familiarize Orion Marine Academy]. She received command of the SS Usagi[familiarize SS Usagi] after successfully leading the retaking of the capital of Pollux VI from Irion invaders from the moon of Pollux III."	--
Deneb System	"The planetary system orbiting the star Deneb consists of seven planets, of which the second and fourth are suitable for large-scale settlement, though they are not habitable without artificial intervention. There are sizable human populations on Deneb II[familiarize Deneb II] and Deneb IV[familiarize Deneb IV], as well as on the moon New Da Nang[familiarize New Da Nang]. There is also a small military settlement on Deneb III[familiarize Deneb III planet]."	--
Deneb IV	"Deneb IV, founded by anti-corporate ideologues who split off from Deneb II, has from the start had a popular separatist movement.[familiarize Deneb II]"	--
Operation Dalmatian  	""	"Operation Dalmatian is a top secret operation to infiltrate the Deneb IV separatist movement. The primary operative is [Arvax], who has been playing double agent to ingratiate himself with the terrorist leadership. Among other successes, he has confirmed that as many as three Space Marine captains are compromised by the separatists, although he has not been able to positively identify these captains."
Deneb II	"Once the jewel of Deneb sector and a paradise of natural splendor, over the last two centuries Deneb II has succumbed to creeping corporatization. The resulting degrading of the ecosphere is a primary reason for the exodus to Deneb IV and the separatist movement which has followed."
subj-rebooting-computer	"Rebooting the ship's computer during a mission is a risky operation that should only be attempted when absolutely necessary. It can be accomplished the ship computer given the necessary authorization. Due to the risk of short-term shutdown of critical systems during a reboot, vac suits should always be worn during the operation."
Deneb III planet	"A small rocky planet without atmosphere used as a Space Marines outpost."
Space Station Omicron-5	"Space Station Omicron-5 is the the Deneb system outpost of the Space Authority. It is one of the largest space stations of the Space Authority."
Delphi Engine Controls Aleph-Null	"The Aleph-Null, by Delphi Engine Controls LLC[familiarize Delphi Engine Controls LLC], is a starship engine fuel injection process controller. It allows the mixture of up to five fuel components to create an energized product suitable for powering a starship drive. The Aleph-Null works by the method of substance injection[familiarize substance injection]."
Substance Injection	"A process by which one substance is 'injected' into another to create a product substance. This is an asymmetric operation, in that injecting substance A into substance B generally yields a different result than injecting substance B into substance A. Note that most injection combinations result in no product substance, as the resulting matter decays too rapidly to capture."	--
Luna Spacewerks Parsec VI	"The Luna Spacewerks Parsec VI is a starship engine used mainly by the Space Authority to drive light frigate class vessels. It is powered by Liquid Copernicium[familiarize Liquid Copernicium]."	--
Liquid Copernicium	"Liquid Copernicium is the liquid form of the element Copernicium[familiarize Copernicium]. It is a common starship fuel. It can be created by injecting Oganesson[familiarize Oganesson] into Red Matter[familiarize Red Matter]."	--
Element Copernicium	"Copernicium is an element with atomic number 112. It has symbol [bold type]Cn[roman type]. Its liquid form[familiarize liquid copernicium] is a common starship fuel. The melting point of Copernicium is 15 ºC, and its boiling point is 73 ºC."
Anti-Helium	"Anti-Helium is the anti-matter equivalent of Helium, possessing two positrons and two antiprotons. It is most notably used in the creation of Unobtainium[familiarize unobtainium] and Tachyon Crystals[familiarize tachyon crystals]."
Oganesson	"Oganesson is an element with atomic number 118. It is often used to create Liquid Copernicium[familiarize liquid copernicium]."
Red Matter	"Red Matter is an unstable, possibly impossible substance created by injecting Tachyon Crystals[familiarize Tachyon Crystals] into Unobtainium[familiarize unobtainium]."
Tachyon Crystals	"Rather than containing or being formed of tachyons, tachyon crystals get their name from their use in detecting tachyons, due to their negative refractive index. The typical method of creating tachyon crystals is injecting Anti-Helium[familiarize anti-helium] into Red Matter[familiarize red matter]. Tachyon Crystals can be used in the creation of Void Matter[familiarize void matter]."
Unobtainium	"Unobtainium can only be acquired by the injection of Anti-Helium[familiarize anti-helium] into Oganesson[familiarize oganesson], hence its legendary reputation for being difficult to obtain."
Void Matter	"Void Matter is essentially vacuum condensed into matter, according to the most comprehensible description we could find. It is an extremely unstable substance, and tends to explode catastrophically in the presence of high levels of energy. It can be created by injecting one source of tachyon crystals into another source of tachyon crystals[familiarize tachyon crystals]."
Delphi Engine Controls LLC	"Delphi Engine Controls LLC is an engine parts manufacturer based on Tethys, moon of Saturn."
Space Authority	"The Space Authority is the governing body of most human-controlled space. Its military is known as the Space Force. The Space Authority is a socialist society with a representative democracy."
The Space Force	"The Space Force is the military arm of The Space Authority."
Pollux star	"Pollux is the brightest star in the Earth constellation of Gemini."
Fuel Injection	"Starship fuel injection is the process of 'injecting' one substance into another, creating a third substance at a higher energy level. See 'Substance Injection'[familiarize substance injection]."
Explosion	"There seems to have been some sort of explosion on Space Station Omicron-5 that ejected the SS Usagi from dock."
Beacon	"A radio beacon broadcasts a radio signal on a dedicated frequency which by Space Authority regulations is continuously monitored by all space vessels."
Location of the ship	"[if computer-rebooted is true]We are currently on a collision course with the moon New Da Nang[otherwise]Unable to access navigation system. Please reboot the computer[end if]."
Gangway	"An inflatable gangway is standard equipment at space stations when docking ships."
Aft Airlock	"The aft airlock of the SS Usagi is a standard class B starship airlock, featuring auto-pressurization and auto-depressurization."
Engineering Airlock	"The engineering airlock of the SS Usagi is a standard class B starship airlock, featuring auto-pressurization and auto-depressurization."
Staging Area	"The staging area of the SS Usagi is where crew members prepare for missions. It is normally stocked with a full complement of vacuum suits and an array of offensive weaponry."
Access Panel	"Typically, starship doors have access panels. The contents of such access panels may vary from one model to another."
Chewing Gum	"Chewing gum is expressly forbidden on all Space Authority vessels."
Gangway-backdrop	"A gangway is an inflatable bridge used to transfer people and equipment to and from space vessels."
Orion Marine Academy	"Orion Marine Academy, located in the Betelgeuse system, is generally considered the second-most prestigious military academy after the original Space Authority Academy on Earth."
The Sun	"Sol, the home star of the human race, has eight planets: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, and Neptune. Sol also has numerous dwarf planets, of which the best known is Pluto, once classified as a planet."
Earth	"The home planet of the human race, third planet from the star Sol. It is one of only a handful of habitable planets discovered by the human race."
Mercury	"The first planet from Sol, its high temperatures make it hostile to all life."
Venus	"The second planet from Sol, its atmosphere of carbon dioxide and sulfuric acid makes it uninhabitable, even if it wasn't the hottest planet in the Sol system."
Mars	"The so-called 'red planet', Mars is the fourth planet of the Sol system. Humans have inhabited Mars since the late twenty-first century, making it the second extraterrestrial human habitation, after the Moon."
Jupiter	"The fifth and largest planet in the solar system, Jupiter is a gas giant. Humans have inhabited its sixth moon, Europa, since the mid-twenty-second century."
Europa	"The first trans-Martian colony was established on Europa in 2165 CE."
Saturn	"The second-largest planet in the solar system, and the sixth from the sun, Saturn is known for its impressive rings and many moons."
Tethys	"The fifteenth moon of Saturn, it is made primarily of water ice with a small fraction of rock."
Uranus	"The seventh planet from the sun, Uranus is an ice giant."
Neptune	"The eighth and last planet from the sun, Neptune is an ice giant."
Pluto	"Once considered the ninth planet, Pluto is now considered a dwarf planet. Along with many of the trans-Neptunian dwarf planets, Pluto is part of the solar system's defensive 'early warning' system, with a listening post on its largest moon, Charon."
Emergency Protocols	"It is standard practice for a ship's captain to establish a set of emergency actions to be used in the event the ship is compromised. Typically such 'emergency protocols' include measures to incapacitate, eject, or kill intruders, as well as to render the ship unusable by such invaders."
Space Marines	"The Space Marines is an arm of the Space Force."
Deneb Separatists	"Anti-corporate ideologues advocating for Deneb IV's independence from the Space Authority."
New Da Nang	"New Da Nang is a moon of Deneb II. It is the home of famous composer Orenascopol Thrax."
The Moon	"The moon of Earth, often called simply 'The Moon', is famously the first extraterrestrial body inhabited by humans."
Bertie the Bear	"Bertie the Bear™ is a children's toy sold by Interstellar Kids Incorporated. It is notable for its superior optical recognition."	--
Deneb sector	"The portion of space containing the stars Deneb, XB-546J, GF-195A, and numerous other minor stars."
Vacuum-suit	"A vacuum suit is required equipment for EVAs (extra-vehicular activities). The vacuum suits on board the SS Usagi are model V13 manufactured by Polaris Equipment Corp. They feature automated pressurization and depressurization, as well as manually-activated magnetic boots. The V13 is rated as medium in terms of air capacity."
JL-758	"The JL-758 is a widely-used model of engine stabilizer produced by Luna Spacewerks."
laser rifle	"The Syrinx 52-K is a laser rifle widely used on Space Marine vessels."
air scrubber intake	"An air scrubber is a vital part of any shipboard air supply. The scrubber removes biological and other particles from the air before it is recycled."
To-Do list	"Every well-organized individual can benefit from an up-to-date to-do list."
navigator	"The navigator's primary responsibility is to be aware of ship position at all times. Responsibilities include planning the journey, advising the ship's captain of estimated timing to destinations while en route, and ensuring hazards are avoided."
pilot	"The pilot's responsibilities include transporting passengers and cargo, determining the safest routes, analyzing flight plans and space conditions, calculating fuel, and inspecting operation systems and navigation equipment."
Deneb Star	"Deneb is a blue-white supergiant located 2,615 light-years from Earth. When seen from Earth, it appears in the constellation of [familiarize Cygnus]Cygnus."
Environmental console	"The environmental console contains the controls that deal with the comfort of the ship's occupants, including temperature, pressure, and gravity. It should be noted that the gravity control is not a toy and should only be adjusted away from Earth normal when absolutely necessary."
Communications console	"The communications console is used for all communications, including long-range subspace and short-range radio communications."
Power systems console	"The power systems console controls the power for the entire craft allowing, for instance, for power to be rerouted away from non-essential systems and to more essential systems such as life support or defensive systems."
Engine diagram	"The Delphi Engine Controls Aleph-Null is a fuel injection controller. It controls the process by which different substances are combined to produce the desired fuel. Since many fuels, such as Liquid Copernicium[familiarize Liquid Copernicium], have short half-lives, they must be produced shortly before use. Hence the necessity of the fuel injection controller."
Luna Spacewerks	"A ship propulsion manufacturer on Earth's moon."
Midship door	"Many small fighting ships have a midship door, designed to slow the spread of fires, protect against ship-wide depressurization, and to defend against boarders."
Cygnus	"As seen from Earth, Cygnus is a northern constellation on the plane of the [familiarize Milky Way]Milky Way. It derives its name from the Latinized Greek word for swan."
Milky Way	"The Milky Way is the galaxy that includes the Solar System, and the systems of Deneb and Pollux, for instance."
Life Support	"Life support systems are all functioning satisfactorily."
Fusion Engine	"The SS Usagi employs a Luna Spacewerks Parsec VI[familiarize Luna Spacewerks Parsec VI]. [if fusion engine is broken]The shipboard engine is currently non-functional. It needs a replacement JL-758 engine stabilizer.[otherwise]The shipboard engine is functioning normally.[end if]"
Hull Integrity	"Despite the recent battering from the destruction of Space Station Omicron-5, hull integrity remains at 90%."
Pollux III	"Pollux III, now uninhabitable due to intense radiation, was once the home of the Irion race, who now live on the single moon of Pollux III."
Irion	"A sentient race of silicon-based insectoids originally from Pollux III. Their homeworld was destroyed in an industrial accident, leaving only the Irion who had settled on their planet's moon."
Pollux VI	"A human-settled planet which is contested by the Irion."
Engine status	"The SS Usagi employs a Luna Spacewerks Parsec VI[familiarize Luna Spacewerks Parsec VI]. [if fusion engine is broken]The shipboard engine is currently non-functional. It needs a replacement JL-758 engine stabilizer.[otherwise]The shipboard engine is functioning normally.[end if]"
Gravity-subject	"The gravity is currently set to [gravity]."
Corporal Delores Franck	"Corporal Delores Franck is deployed on the SS Usagi. For further information, contact the Enlistment Office on Space Station Omicron-5."
Gunnery Sergeant Somchai Khotpanya	"Gunnery Sergeant Somchai Khotpanya is deployed on the SS Usagi. For further information, contact the Enlistment Office on Space Station Omicron-5."
Private First Class Friedrich Jäger	"Private First Class Friedrich Jäger is deployed on the SS Usagi. For further information, contact the Enlistment Office on Space Station Omicron-5."
Private Akin Abimbola	"Private Akin Abimbola is deployed on the SS Usagi. For further information, contact the Enlistment Office on Space Station Omicron-5."
Captain's journal	"Information on the captain's journal is unavailable to protect the captain's privacy."
EVA transport line	"An EVA transport line is used to transport a heavy or unwieldy object during EVAs. The line is extended between mooring hooks on the hull, and the object to be transported is hooked to the line."
Destroying the ship	"Information on self-destruct methods is not available."
copy of Planetfall	"Planetfall is a beloved classic of interactive science fiction from the 20th century."
Ensign First Class Blather	"A total megakrip!"

[Does the player mean quizzing computer about an object (called Obj) when there is a dt-subject of Obj in the Table of computer Subjects:
	say ">>>> [Obj].";
	It is very likely;

Does the player mean quizzing computer about an object (called Obj) when there is no dt-subject of Obj in the Table of computer Subjects:
	say ">>> [Obj].";
	It is very unlikely;]

Book 12 - Speaking to People and Things

Understand "ask [someone] about [any known thing]" as quizzing it about.
Understand "ask [someone] about [any room]" as quizzing it about.
Understand "tell [something addressable] about [any known thing]" as informing it about.
Understand "ask [shipboard computer] about [any mutually known thing]" as quizzing it about.
Understand "ask [shipboard computer] about [any room]" as quizzing it about.
Understand "ask [shipboard computer] about [shipboard computer]" as quizzing it about.

Definition: a thing is mutually known if it is known and there is a dt-subject of it in the Table of computer Subjects.
		
The unsuccessful persuasion of inanimate objects rule is not listed in any rulebook.

Check asking something (called T) about a topic when T is not a person and T is not the shipboard computer:
	say "Talking to [the T] is unlikely to prove rewarding." instead;

Check quizzing something (called T) about something when T is not a person and T is not the shipboard computer:
	say "Talking to [the T] is unlikely to prove rewarding." instead;

Section 1 - Backdrops

The Gangway-backdrop is a backdrop. The printed name is "gangway". "The gangway between the space station and the SS Usagi is an inflated tube between two airlocks. Beyond its walls is the vastness of space."
The Gangway-backdrop is in Space Station Gangway, Aft-Airlock-Room, and Staging Area.
Understand "pressurized" and "bridge" and "gangway" as gangway-backdrop.

The Space Station Omicron-5 is a backdrop. "Space Station Omicron-5 is a huge spindle-shaped structure, spinning eternally to generate the coriolis force that simulates gravity."
The Space Station Omicron-5 is in Space Station Gangway, Aft-Airlock-Room, and Staging Area.

The SS Usagi is a backdrop. "[If location is space station gangway]The SS Usagi looks ungainly, as a vessel that travels in vacuum typically does, but it's truly a beautiful ship. The aft airlock faces you.[otherwise if location is onboard and boarding the ship is not happening]The SS Usagi is quiet, its engines still, even as it hurtles through space.[otherwise if location is onboard]The SS Usagi is quiet except for the hum of its life support system.[otherwise]As an out-of-atmosphere vessel, The SS Usagi has a hull dotted with the many devices and machines that keep the ship running.[end if]". Understand "ship" and "spaceship" and "starship" as SS Usagi. Understand "hull" as SS Usagi when the location is offboard and the location is not Space Station Gangway.

When play begins:
	move the SS Usagi backdrop to all rooms;

To say describe moon:
	say "FOO";
	
deep space is a backdrop. "[if crashing is not happening]The blue-white disk of the supergiant Deneb looms largest in your view, but even it is just a small spot in the deep blackness of space.[otherwise][describe moon][end if]". Deep Space is in Space Station Gangway, Spacewalk 1, Spacewalk 2, Spacewalk 3, and Bridge.

Deneb Star is a backdrop. The printed name is "Deneb (star)". Deneb Star is in Space Station Gangway, Spacewalk 1, Spacewalk 2, Spacewalk 3, and Bridge. "Deneb is a blue-white spot off the port side of the ship.";

Aft Airlock is a backdrop. Aft Airlock is in Space Station Gangway, Aft-Airlock-Room, Staging Area, and Spacewalk 1. The description of Aft Airlock is "[if location is space station gangway]The aft airlock is to fore. The door is open, expecting you to come in.[otherwise if location is aft-airlock-room]The airlock is the last defense against the great uncaring vacuum of outer space.[otherwise if location is spacewalk 1][think]God, I wish I was in there.[think end][end if]". Understand "windows" as aft airlock.

Book 13 - The Map

Space Station Gangway is a room. 

"This is the pressurized bridge from Space Station Omicron-5 to the SS Usagi. Behind you is the familiar bulk of the huge station, largest outpost of the Space Authority in Deneb Sector.
Before you is the aft airlock of the Usagi, beckoning you in.[first time]

[think]Better get a move on[think end][if accessible is false], you think.[end if][only]";

Room of Stuff is fore of Space Station Gangway. "dummy description"

The Bridge is a room. "This is where the captain, navigator, and pilot all sit. Large viewscreens give a full view of the space around the ship. [view of space]
[line break]The pilot's and navigator's chairs sit before their respective consoles. The captain's chair, with command console, sits halfway between them and operations further aft.

You hear someone speaking aft of here."

Understand "helm" as The Bridge.

To say view of space:
	if last-moves is true:
		say "To port you can see the blue-white disk of Deneb. Ahead, the moon New Da Nang looms steadily larger and larger before you."; 
	otherwise:
		say "To port you can see the blue-white disk of Deneb. Astern you can faintly see the fading embers of what was Space Station Omicron-5.";

Operations Deck is aft of Bridge. "This is where all of the support activity for the bridge occurs. There are large consoles for environmental controls (which include gravity, temperature, and pressure), communications, and power systems here. The bridge continues forward from here, and engineering is aft. There is a door set in the floor with a ladder leading through it. Set in the frame of the door is a blue button.".

Engineering Deck is aft of Operations Deck. "The engineering crew is responsible for keeping the physical ship operating. They are in charge of every physical aspect of the ship, from the engines to hull integrity to the life support system. 

The engineering deck consists of a large console giving a comprehensive view of the physical status of the ship. There is an airlock to starboard. The operations deck continues forward from here, and there are other exits to aft and port.

You hear someone speaking to fore."

[Near the console is a large cabinet with a card slot. [if the engineering cabinet is open]It is open.[otherwise]It is closed.[end if]]

Engineering Airlock is starboard of Engineering Deck. Engineering Airlock is outside of Engineering Deck. 
"You are in the engineering airlock. Outside, the space to starboard looks so empty and peaceful it's hard to imagine the awful sight astern.".

Machine Room is port of Engineering Deck.
"The machine room is where the physical work of Engineering takes place; for instance, machining new parts. There is a large counter lined with drawers here, as well as numerous saws, drills, and other pieces of equipment. You can leave to starboard."

Engine Room is aft of Engineering Deck.

Midship Door is a door. It is below Operations Deck. It is closed. The description is "The midship door is a square horizontal hatch, separating Operations Deck from the Galley. It is made of a strong black plastic/metal alloy."

Galley is below Midship Door. "This narrow space is barely enough room for two Marines to prepare and eat a meal. There is a counter with a drawer, and two stools, a microwave oven, and a large closet here. Pots and pans hang from hooks in the ceiling. A ladder leads up through the midship door, and you can leave aft.

On the starboard wall is a panel on which is a blue button. Tacked to the panel is the operator's manual for the midship door.

[if midship door is closed]You faintly hear someone speaking above.[otherwise]You hear someone speaking above.[end if]".

Junction is aft of Galley. "This is a busy place when the ship is populated. To port and starboard are the crew quarters, aft is the closed door to the captain's private quarters, and fore is the galley. A ladder leads down to the staging area."

The Captain's Door is a starship door. It is aft of Junction and fore of Captain's Quarters.

To say contents of (C - a thing):
	list the contents of C, as a sentence, tersely, not listing concealed items, including contents, giving brief inventory information;

To say state and contents of (C - a container):
	if C is closed:
		say "closed";
	otherwise:
		say "open and [if C contains nothing]empty[otherwise][contain] [contents of C][end if]";

Port-Side Crew Quarters are port of Junction. "All crew members who aren't the captain sleep in this or the opposite-side bunk room. This one sleeps two in a bunk bed, done up with military precision. There is a large cabinet here, stretching almost to the ceiling. It is [state and contents of port-side equipment cabinet]. Mounted in the wall is a crew personal storage unit. The sole exit is to starboard."

Starboard-Side Crew Quarters are starboard of Junction. "All crew members who aren't the captain sleep in this or the opposite-side bunk room. This one sleeps two in a bunk bed, done up with military precision. There is a large cabinet here, stretching almost to the ceiling. It is [state and contents of starboard-side equipment cabinet]. Mounted in the wall is a crew personal storage unit. The sole exit is to port."

To say open state of (C - a container):
	say "[if C is open]an open[otherwise]a closed[end if]";

To say suit locker description:
	say "An equipment locker is sprawled across the room";
	if suit locker 2 is door-side down:
		say ", with its door to the ground.";
	otherwise:
		say ". It has been turned door-side up. It is [state and contents of suit locker 2].";

Staging Area is below Junction.
"This is the staging area of the ship, where marines prepare for missions. It is adjacent to the aft airlock. [if explosion happened is false]It houses a number of vac suits in [open state of suit locker 1] locker, and various munitions in locked compartments set into the walls. [otherwise]Locked compartments set into the walls hold various munitions. [end if]A ladder leads up into the rest of the ship.[if explosion happened is true]
[paragraph break][suit locker description][end if]
[line break][if explosion happened is false]Through the airlock windows you can see the gangway to Space Station Omicron-5.[otherwise]Through the airlock windows you see the blank space left by the destruction of Space Station Omicron-5.[end if]".

To say computer hints on:
	activate table of computer hints;
	
Aft-Airlock-Room is aft of Staging Area. Aft-Airlock-Room is outside from Staging Area.
"[computer hints on]You are in the aft airlock[if explosion happened is false]. Outside is the gangway back to Space Station Omicron-5. Forward leads into the ship[otherwise]. Outside is the blackness of space, speckled with the dying embers of what was once Space Station Omicron-5. Forward leads into the ship[end if].[first time]

A pleasant androgynous voice says, '[fixed letter spacing]Welcome to the SS Usagi. This is the shipboard computer. Please feel free to call upon me for any information you may need. Use the command [']computer, help['] for more information.[variable letter spacing]'[only]"

Spacewalk 1 is outside from Aft-Airlock-Room. Spacewalk 1 is aft from Aft-Airlock-Room.

Spacewalk 2 is fore of Spacewalk 1.

Spacewalk 3 is starboard of Spacewalk 2.

Engineering Airlock is inside from Spacewalk 3.

Chapter 1 - Definitions

Section 1 - Vacuum

A room can be pressurized or vacuum. A room is usually pressurized.
	
Definition: a thing is in vacuum if the location of it is vacuum and the location of it is a room.

Every turn while player is in vacuum and player is not wearing a vac suit (this is the second check vacuum rule):
	if player is not in a container:
		say "You are in vacuum. We'll spare you the details, but it isn't a pretty way to go.";
		now the final result is pointless death;
		end the story saying "You have died";

Every turn while player is in vacuum and player is wearing a vac suit (called VS) and the remaining air of VS is 0 (this is the third check vacuum rule):
	say "You are out of air in your vac suit. Should have paid attention to the warnings.";
	now the final result is pointless death;
	end the story saying "You have died";

Check taking off the vac suit when the location is vacuum:
	Say "It is recommended to not remove the vac suit until you are in a pressurized environment." instead;
	
Every turn when the player is in vacuum and the player is wearing something (called VS) and VS is a vac suit (this is the first check vacuum rule):
	if the remaining air of VS > 0:
		decrement the remaining air of VS;
		if the remaining air of VS > 5: 
			say "Your vac suit pings gently to indicate you have expended a unit of air.";
		otherwise if the remaining air of VS > 0: 
			say "A stern voice in your helmet intones 'Air levels critical. Seek a pressurized location immediately.'[line break]";
		otherwise If the remaining air of VS is 0:
			say "An alarm sounds and a voice says 'Air expended' on repeat.";

boots originally on is a truth state that varies.

Carry out taking off a vac suit:
	let MB be random magnetic boots which are part of the noun;
	now boots originally on is whether or not MB are switched on;
	Now MB are switched off;
	
Report taking off a vac suit when boots originally on is true (this is the report switching off the boots rule):
	say "The boots are now switched off.";
	
the report switching off the boots rule is listed last in the report taking off rules.

Chapter 2 - Details

Section 1 - Space Station Gangway

The Space Station Gangway is offboard.

After looking while location is Space Station Gangway for the second time:
	tip "[if accessible is false]Tip: [end if]Type 'help' to learn about this game, and interactive fiction in general.";

Instead of going fore when the location is the space station gangway:
	Say "You pass into the aft airlock, the outer door closing behind you."; 
	now player is in Aft-Airlock-Room;
	
Instead of going inside when the location is the space station gangway:
	try going fore;
	
Instead of dropping something when location is space station gangway:
	say "You can't just go dropping stuff everywhere.";

Section 2 - Bridge

After deciding the scope of the player when location is the bridge:
	Place Captain Mulgrew in scope;
	Place Pilot in scope;
	Place navigator in scope;
	
Instead of doing something to Captain Mulgrew when location is the bridge:
	Say "When I say that 'the captain, navigator, and pilot all sit' here, I don't mean they're actually here right now.";
	
Instead of doing something to the pilot when location is the bridge:
	Say "When I say that 'the captain, navigator, and pilot all sit' here, I don't mean they're actually here right now.";
	
Instead of doing something to the navigator when location is the bridge:
	Say "When I say that 'the captain, navigator, and pilot all sit' here, I don't mean they're actually here right now.";

The viewscreen is a thing in Bridge. It is scenery. "[view of space][run paragraph on]". Understand "viewscreens" and "screen" and "screens" as viewscreen.

The pilot's chair and the navigator's chair are crew chairs in the bridge.
Understand "pilot chair/--" as pilot's chair. Understand "navigator chair/--" as navigator's chair.

The captain's chair is a supporter in the bridge. It is scenery. It is enterable. "Functional yet comfortable, it is every inch the chair of a commander. On the arm of the captain's chair is the command console, with which the captain commands the shipboard computer.". Understand "captain chair" as captain's chair.
The command console is a part of the captain's chair. The description is "The command console displays the red outline of a hand." Understand "captain's/captain console" as command console. 

After examining the command console for the first time:
	tip "You can 'touch command console' to touch your palm to it.";

After examining the command console for the second time:
	tip "You can 'touch command console' to touch your palm to it.";
	
Instead of touching the command console:
	print "Unauthorized access attempted. This event has been logged by security.[line break]" as shipboard computer near captain's chair;
	
Instead of answering the shipboard computer that something when location is the bridge:
	print "Please present hand print to command console in order to activate command mode.[line break]" as computer near captain's chair;
	
Instead of informing the shipboard computer about something when location is the bridge:
	print "Please present hand print to command console in order to activate command mode.[line break]" as computer near captain's chair;
	
Instead of telling the shipboard computer about something when location is the bridge:
	print "Please present hand print to command console in order to activate command mode.[line break]" as computer near captain's chair;

Player aware of melted helm is a truth state that varies

The access panel keyhole is part of the helm access panel. It is scenery. "It's a small hex-shaped hole."

To say state of helm access panel:
	If the helm access panel is closed:
		say "which is closed. A hex-shaped aperture is probably the locking mechanism";
	otherwise if protocols-activated is false:
		say "which is open, revealing a maze of wiring and circuit boards";
	otherwise:
		say "which is open, revealing a fused mass of wiring and circuit boards";	
		now player aware of melted helm is true;
		
After closing the helm access panel:
	now the helm access panel is locked;
	continue the action;
	
Instead of inserting the hex-shaped tool into the access panel keyhole:
	try unlocking the helm access panel with the hex-shaped tool;

The helm table is a thing in the bridge. It is scenery. "The helm is a sloped table covered with cryptic readouts and touch controls. In the back is an access panel [state of helm access panel].". Understand "sloped/-- table", "cryptic/-- readouts", "touch/-- controls" as the helm.
The helm access panel is a container which is a part of the helm table. It is closed, locked, and openable. It has carrying capacity 0. The helm access panel has matching key the hex-shaped tool. The description is "The access panel is a rectangle of the same plastic that makes up the rest of the table. There is a hex-shaped keyhole in it." Understand "helm/-- access/-- panel" as helm access panel.

The helm wiring is scenery in the helm access panel. It is privately-named. The printed name is "wiring". Understand "wiring" and "circuit" and "circuits" and "boards" as the helm wiring. The description of the helm wiring is "[if protocols-activated is true]It's ruined.[otherwise]There's a lot of it.[end if]";

The aperture is a part of the helm access panel. Understand "hole", "keyhole", "lock" as aperture.

Instead of inserting the hex-shaped tool into the aperture:
	try unlocking the helm access panel with the hex-shaped tool;
	
Instead of inserting the hex-shaped tool into the helm access panel:
	try unlocking the helm access panel with the hex-shaped tool;

Instead of examining the helm access panel:
	if the helm access panel is closed:
		say "The access panel is a rectangle of the same plastic that makes up the console. There is a hex-shaped keyhole in it.";
	otherwise if protocols-activated is true:
		say "Inside the access panel, the wires and circuits are a melted mess.";
	otherwise:
		say "Inside the panel is a maze of wiring and circuit boards.";

After opening the helm access panel:
	if protocols-activated is true:
		say "Opening [the helm access panel] reveals a fused mass of wiring and circuit boards. It's ruined beyond repair."; 
		now player aware of melted helm is true;
	otherwise:
		say "Opening [the helm access panel] reveals an array of wiring and circuit boards.";

Check inserting something into the helm access panel:
	say "[text of the can't insert into what's not a
	container rule response (A)][line break]" instead;

After examining the command console for the first time:
	tip "You can 'touch command console' to touch your palm to it.";

After examining the command console for the second time:
	tip "You can 'touch command console' to touch your palm to it.";
	
Computer-rebooting is a truth state that varies.
Emergency-protocols is a truth state that varies.

After deciding the scope of the player when location is Bridge and computer-rebooting is false:
	place shipboard computer in scope;
	
Rebooting is an action applying to nothing. Understand "reboot" as rebooting.

Persuasion rule when asking the shipboard computer to try doing something other than helping and location is bridge and command mode activated is false:
	print "Please present hand print to command console in order to activate command mode.[line break]" as computer near captain's chair;
	persuasion fails;

Check player rebooting:
	say "You can't reboot yourself." instead;

Reboot-countdown is a number that varies.

Repressurize countdown is a number that varies.

To evacuate air:
	say "The emergency depressurization siren sounds throughout the ship.";
	think "Nice of Mulgrew to warn me.";
	Repeat with R running through pressurized rooms:
		now R is vacuum;
	
Every turn while repressurize countdown > 0:
	decrement repressurize countdown;
	if repressurize countdown is 0:
		say "The depressurization siren stops.";
		repressurize;

To repressurize:
	Repeat with R running through vacuum rooms that are onboard:
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
		activate the table of fuel injection hints;
		activate the table of engine hints;
		activate the table of moving engine hints;
		
	
Every turn when last-moves is true or protocols-activated is true:
	decrement turns left;
	if turns left is 0:
		crash;
	otherwise if turns left < 11:		
		print "Impact in [turns left]." as computer near player;
		say line break;
		
To crash:
	if location is bridge:
		say "You watch helplessly as the SS Usagi slams into the Little New York neighborhood of New Da Nang. Several acres of buildings are flattened, killing thousands of people.";
		now the final result is crash;
		end the story saying "You have died in ignominious failure.";
	otherwise:	
		say "You never see it happen. The SS Usagi slams into the Little New York neighborhood of New Da Nang. Several acres of buildings are flattened, killing thousands of people.";
		now the final result is crash;
		end the story saying "You have died in ignominious failure.";

Computer-rebooted is a truth state that varies.
Protocols-activated is a truth state that varies.
Protocols-in-progress is a truth state that varies.

Every turn while computer-rebooting is true:
	decrement reboot-countdown;
	if reboot-countdown is 0:
		now computer-rebooting is false;
		now turns left is 120;
		now end-game is true;
		now computer-rebooted is true;
		now the current interlocutor is nothing;
		print "Reboot complete.[line break]" as computer near player;
	if the player is not wearing a vac suit:
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
			now the current interlocutor is nothing;
			say "When you awake, your head is throbbing and you have no idea how much time has passed.";
			think "I wonder what's going on?";
		
Persuasion rule for asking the shipboard computer to try rebooting:
	if logged in as arvax is false and logged in as mulgrew is false:
		print "Authorization required.[line break]" as shipboard computer near player;
		persuasion fails;
	persuasion succeeds;

Carry out shipboard computer rebooting:
	Now computer-rebooting is true;
	talk about cs-end-game-reboot;
	Now reboot-countdown is 5;
	
Report shipboard computer rebooting:
	print "Beginning reboot. Take all appropriate precautions.[paragraph break]" as computer near player;
	say "Red alert lights flash throughout the ship.";
	
After shipboard computer rebooting:
	Deactivate Table of Trust hints;
	Continue the action;
	
Invoking emergency protocols is an action applying to nothing. Understand "invoke emergency protocols" as invoking emergency protocols. Understand "emergency protocols" as invoking emergency protocols.
		
Persuasion rule for asking the shipboard computer to try invoking emergency protocols:
	if logged in as mulgrew is false:
		print "Authorization required.[line break]" as shipboard computer near player;
		persuasion fails;
	persuasion succeeds;
	
Check player invoking emergency protocols:
	say "That's something you'll have to ask the computer to do." instead;
		
Carry out shipboard computer invoking emergency protocols:
	Now protocols-in-progress is true;
	Now reboot-countdown is 4;
	print "Beginning emergency protocols. Take all appropriate precautions.[paragraph break]" as computer near player;
	say "Red alert lights flash throughout the ship.";
	
After shipboard computer invoking emergency protocols:
	Deactivate the Table of Trust Hints;
	Continue the action;

Every turn while protocols-in-progress is true:
	decrement reboot-countdown;
	if reboot-countdown is 0:
		now protocols-in-progress is false;
		now turns left is 60;
		now end-game is true;
		now protocols-activated is true;
		talk about cs-end-game-protocols;
		repressurize;
		now current interlocutor is nothing;
		print "Emergency protocols complete.[line break]" as computer near player;
		print "Approaching New Da Nang. Beginning emergency countdown at [turns left].[line break]" as computer near player;
	if reboot-countdown is 3:
		evacuate air;
		now repressurize countdown is 2;	

Section 3 - Operations Deck

After going to operations deck for the first time:
	deactivate table of midship door hints;
	continue the action;

Fore blue button is a button in operations. It is scenery. "It's a blue button."

The equipment trunk is a container in Operations. The equipment trunk blocks the Midship Door. It is closed, locked, and lockable. "A large equipment trunk lies on the midship door, blocking it." [The mass of the equipment trunk is 150.] The description is "It's a large black trunk with an electronic lock. You need the correct code to open it."

Check taking the equipment trunk when gravity > 1:
	say "The trunk is far too heavy to lift by yourself." instead;
	
Check taking the equipment trunk when gravity is 1:
	say "You could probably lift the trunk in this low gravity, if it weren't so cumbersome." instead;

instead of doing something other than pushing to the equipment trunk for the third time:
	say "Really, the equipment trunk isn't important to the story. But by all means, continue to fiddle with it.";

The environmental console is a thing in Operations. It is scenery. The description is "[The environmental console] contains the controls that deal with the comfort of the occupants, including temperature, pressure, and gravity. [description of the gravity control]".

Understand "environmental/environment control/controls" and "environment" as environmental console.
Understand "enviro" as environmental console.

Does the player mean doing something to the Universal Game Emulator when the location is Operations Deck:
	It is very unlikely.

The temperature control is a thing in Operations. It is scenery. The description is "It's a comfortable 295 degrees Kelvin."
The pressure control is a thing in Operations. It is scenery. The description is "The pressure is right in the middle of safe territory at 30 inHg."

The communications console is a thing in Operations. It is scenery. The description is "[The communications console] is used for all communications, including long-range subspace and short-range radio communications.". Understand "comms" as the communications console.

Carry out examining communications console:
	say "[The communications console] is used for all communications, including long-range subspace and short-range radio communications. A readout displays the connections on each channel: '";
	choose the row with conv-state of current conversation state from the Table of People in Scope;
	if arvax in scope entry is true:
		say "channel 1 -- Deneb III Marine Command, ";
	otherwise:
		say "channel 1 -- No Connection, ";
	if mulgrew in scope entry is true and mulgrew-is-angry is false:
		say "channel 2 -- Unknown Caller, ";
	otherwise:
		say "channel 2 -- No Connection, ";
	say "channel 3 -- No Connection.'";
	rule succeeds;

The power systems console is a thing in Operations. It is scenery. The description is "[The power systems console] controls the power for the entire craft allowing, for instance, for power to be rerouted away from non-essential systems and to more essential systems such as life support or defensive systems."

Instead of examining midship door when location is operations:
	say "[description of midship door] Set in the frame of the door is a blue button."
	
The gravity control is a part of the environmental console. The description is "The gravity dial can be set from 1 to 10. It is set to [gravity].". Understand "gravity/-- dial" as gravity control.

The block setting it to rule is not listed in the check setting it to rulebook.

Check setting the gravity control to a topic:
	let S be 0;
	if the topic understood matches “[number]”:
		now S is the number understood;
	if S < 1 or S > 10:
		say "You can only set gravity to an integer between 1 and 10." instead;
	continue the action;
	
Report jumping when gravity < 4:
	say "Whee! You can jump high in this lower gravity." instead;
	
Check setting something to a topic when the noun is not the gravity control:
	say "[We] [can't set] [regarding the noun][those] to anything." instead;
	
Carry out setting the gravity control to a topic:
	now gravity is the number understood;
	
Report setting the gravity control to a topic:
	say "You dial the gravity to [gravity].";
	
Deneb III Naval Command is a room. "This is a dummy description.".

Master Sergeant R Mu Arvax is a man. The printed name is "[if arvax is familiar]Master Sergeant R. Mu Arvax[otherwise]caller[end if]". He is in Deneb III Naval Command. He is improper-named. The description is "dummy description"

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
		if the speaker is shipboard computer:
			say fixed letter spacing;
		say ST;
		say variable letter spacing;
	otherwise if X is 1 and last-turn-count-remote-speech-printed is not turn count:
		let BR be best route from the location to the location of the locale, using even locked doors;
[		say "You [if the location is galley and the midship door is closed]faintly [end if]hear someone speaking [the direction description of BR].";]
		now last-turn-count-remote-speech-printed is turn count;
	Now the last utterance of the speaker is ST;	
	if T is true:
		Add ST to the speech transcript of the speaker;	

To print (speech text - a text) as (speaker - a thing) near (locale - a thing):
	if speaker is not a person and speaker is not the shipboard computer:
		print speech text as speaker near locale with transcript false;
	otherwise:
		print speech text as speaker near locale with transcript true;

After deciding the scope of the player when location is Operations:
	if protocols-in-progress is false and computer-rebooting is false:
		choose the row with conv-state of current conversation state from the Table of People in Scope;
		if arvax in scope entry is true:
			place arvax in scope;
		if mulgrew in scope entry is true and mulgrew-is-angry is false:
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

A thing can be pushable. The equipment trunk is pushable.

Check pushing the equipment trunk:
	[If the mass of the equipment trunk * Gravity > the weight limit of the player:
		Say "[The equipment trunk] [are] too heavy for [us] to move." instead;]
	If the equipment trunk is not blocking the midship door:
		Say "[The equipment trunk] [are] already out of the way." instead;
	continue the action;

Check pushing something which is not pushable:
	Say "There's no point to pushing [the noun] around." instead;
	
Check pushing something which is not touchable:
	Say "You can't touch [the noun]." instead;

Carry out pushing the equipment trunk when the equipment trunk is blocking the midship door: 
	now the equipment trunk is not blocking the midship door.

Report pushing the equipment trunk when the equipment trunk was blocking the midship door:
	say "You push the trunk clear of the door.";
	now equipment trunk is handled;
	stop;
	
Check going down from operations deck when equipment trunk is blocking the midship door:
	say "There's an equipment trunk blocking the door." instead;


Section 4 - Engineering Deck

The suit recharging station is in the Engineering Deck. It is an enterable supporter. "A device labeled 'Suit Recharging Station' is here. It is shaped like a chair with nozzles protruding from either arm." The description is "It looks like a person might sit in it."

Understand "recharger" and "chair" and "seat" as suit recharging station.

Instead of entering the suit recharging station when the player is not wearing a vac suit:
	say "You sit in the suit recharger, but nothing happens. You stand up again.";

Instead of entering the suit recharging station when the player is wearing a vac suit (called VS):
	if remaining air of VS < 50:
		say "The nozzles on either side of the chair connect with the suit. After a few moments, the machine emits a pleasant 'ping', the nozzles retract, and you stand up.";
		now remaining air of VS is 50;
		deactivate the table of recharge hints;
	otherwise:
		say "The nozzles on either side of the chair connect with the suit. Apparently, the suit is already full, for the machine immediately emits a pleasant 'ping' and the nozzles retract. You stand up.";
	
After going to Engineering Deck for the first time:
	activate the table of recharge hints;
	continue the action;
	
Engineering Airlock Backdrop is a backdrop. It is privately-named. The printed name is "Engineering airlock". Engineering Airlock Backdrop is in Engineering Airlock, Engineering Deck, and Spacewalk 3. The description of Engineering Airlock Backdrop is "[if location is engineering airlock]The airlock is the last defense against the great uncaring vacuum of outer space.[otherwise if location is spacewalk 3][think]God, I wish I was in there.[think end][otherwise if location is engineering deck]The airlock door is to starboard.[end if]".
Understand "engineering/-- airlock" as engineering airlock backdrop.

Starboard Space is a backdrop. It is privately-named. The printed name is "space". Starboard space is in Engineering Airlock and Engineering Deck. The description is "On this side of the ship, space looks calm and empty. [think]Maybe it was a nightmare...[think end]".
Understand "space" as starboard space.

The engineering console is in Engineering Deck. It is scenery. "The engineering console is huge, boasting an incomprehensible array of controls and monitors of the physical state of the ship. You dare not mess with it."

messing with is an action applying to one thing. Understand "mess with [something]" as messing with.

Check messing with the engineering console:
	say "I SAID YOU DARE NOT MESS WITH IT!" instead;
	
Instead of touching the engineering console:
	try messing with the engineering console instead;
	
Does the player mean doing something to the engineering console when the location is Engineering Deck:
	It is very likely;

Check messing with something:
	say "I'm not sure how you would do that." instead;
		
The engineering monitors is scenery in the Engineering Deck. Understand "monitor", "electronics", and "controls" as engineering monitors. The description is "Without a degree in starship engineering, trying to understand these controls is pointless.".

Section 5 - Engineering Airlock

tipped astern is a truth state that varies.

After printing the locale description of engineering airlock:
	deactivate the table of vacuum hints;
	if tipped astern is false:
		tip "astern: behind or toward the rear of a ship, spaceship or aircraft.";
		now tipped astern is true;

After going to Engineering Airlock for the first time:
	print "Welcome back, visitor. I hope your spacewalk was uneventful.[line break]" as computer near player;
	continue the action;

Section 6 - Machine Room

The machine room counter is a supporter in the Machine Room. It is scenery. The description is "A long surface made of some composite material, this counter does an admirable job of keeping things off the floor."

The machine room drawers is a closed openable container in the Machine Room. It is plural-named. It is scenery. Understand "drawer" as the machine room drawers. The description is "Under the counter is a row of drawers which are [state and contents of the machine room drawers]."

The small key is in the machine room drawers. The description is "A small steel key.".
The roll of electrical tape is in the machine room drawers. The description is "Electrical tape always comes in handy. Perhaps not as handy as duct tape, but pretty handy. There's enough here to last you for a while.". 
The hex-shaped tool is in the machine room drawers. The description is "It's got a long handle like a screwdriver, but the end is a hexagon with some complex-looking ridges on it.".
Understand "hex" and "hex shaped" as the hex-shaped tool.
The fresh fuse is in the machine room drawers. The description is "A small yellow cartridge fuse." Understand "new fuse" as the fresh fuse.

The portable hand-held vacuum cleaner is a thing on the machine room counter. "There's a hand vac sitting on the counter."
Understand "hand/-- vac" as the portable hand-held vacuum cleaner.
The description of the vacuum cleaner is "A small canister vacuum, with a handle to easily carry it around, and a short hose."

Does the player mean doing something to the portable hand-held vacuum cleaner when the player is wearing a vac suit: it is very likely;

Does the player mean taking a vac suit when the player is wearing a vac suit: it is very unlikely.
Does the player mean taking the portable hand-held vacuum cleaner when the player is wearing a vac suit: it is very likely.

Section 7 - Engine Room

Definition: the engine diagram is rebooted if computer-rebooted is true or protocols-activated is true.

The description of Engine Room is "This where the combustion process is controlled. The aft wall is dominated by the operating panel section of the fusion engine. Monitoring electronics and controls cover the other two walls. A doorway opens forward to the Engineering Deck.

[if the engine diagram is rebooted]There is a large diagram of the fuel injection process on the forward wall. [otherwise]There is a large screen on the forward wall. It displays nothing right now. [end if]There is a large button below the diagram labeled 'Test'.";

The engine diagram is in the Engine Room. It is scenery. The description is "This is a diagram of the fuel injection process for the fusion engine. Printed above it is the label 'Delphi Engine Controls Aleph-Null'. Below that is a representation of the various inputs and the products created during the fuel injection process. Each input has a touch-sensitive surface which can be used to alter the diagram's settings."

Understand "screen" as engine diagram. 

The engine diagram is readable. 

Instead of reading the engine diagram:
	try examining the engine diagram;

The test button is a button in the engine room. It is scenery. "A square, yellow button with large capital letters saying 'TEST'."
Understand "yellow button" as test button.

The fusion engine is scenery in the Engine Room. The fusion engine can be broken.  "The portion of the engine directly accessible from the engine room is a formidable machine. You wouldn't dare touch any of the various dials, components, hatches, etc. that adorn the surface[if fusion engine is broken]. At your feet a part of the engine juts out -- it looks broken[end if]."

After examining the fusion engine when the fusion engine is broken:
	add fix the engine;
	make no decision;
	
Does the player mean examining the fusion engine when the location is Engine Room:
	It is very likely;
	
The engine room monitors is scenery in the Engine Room. They are plural-named. Understand "monitor", "electronics", and "controls" as engine room monitors. The description is "Without a degree in fusion propulsion, trying to understand these controls is pointless.".
	
The broken JL-758 is scenery in the Engine Room. "This is a wide, low, trapezoidal piece of metal like the one you've seen in the Staging Area, only this one looks scorched. It has the marking JL-758 on the front."

Understand "trapezoid", "part", "engine", "stabilizer" as broken JL-758.

Instead of doing something other than examining to the broken JL-758 when the fusion engine is broken:
	say "Don't worry about that for now. Worry about finding a replacement.";

Instead of doing something other than examining to the broken JL-758 when the fusion engine is not broken:
	say "You don't need to worry about that.";
	
After pushing the brand-new JL-758 to aft when the location is Engine Room (this is the replace the old engine part rule):
	say "You slide the old part out from the engine, and slide the new JL-758 in its place.";
	tick off fix the engine;
	now the brand-new JL-758 is nowhere;
	now the broken JL-758 is not scenery;
	now the fusion engine is not broken;
	make no decision;
	
	
Test sequence countdown is a number that varies;

Instead of pressing the test button when the engine diagram is not rebooted:
	say "Nothing happens.";

Instead of pressing the test button:
	if test sequence countdown is not 0:
		say "There is already a test sequence in progress.";
	otherwise:
		say "A voice says 'Fuel test sequence beginning...'";
		now test sequence countdown is 11;
		if ship is in self-destruct mode:
			now destruct in progress is true;

To end game suicide:
	say "The Void Matter is injected into the fusion engine, causing an explosion that rips the ship apart. You are never aware of this, however, as you are instantly vaporized. If you had been aware, you would certainly have been pleased to know that your death saved the people of New Da Nang.";
	increment score;
	now the final result is noble suicide;
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
			
The operating panel is scenery in the engine room. "Without a degree in fusion propulsion, trying to understand these controls is pointless."

Section 8 - Galley

The galley's blue button is a button.

After going to the galley for the first time:
	activate the table of midship door hints;
	continue the action;

The kitchen counter is a supporter in the Galley. It is scenery. "A standard kitchen counter."

The kitchen drawer is a container in the Galley. It is scenery. It is closed and openable. "A small kitchen drawer which is [state and contents of kitchen drawer].". Understand "drawers" and "galley drawers/drawer" as kitchen drawer.

The knife is a thing in the kitchen drawer. The description is "A typical butter knife.".
The fork is a thing in the kitchen drawer. The description is "A typical dinner fork.".
The spoon is a thing in the kitchen drawer. The description is "A typical dinner spoon.".

A stool is a kind of supporter which is scenery and enterable. The description is "A tall bar-type stool, bolted to the floor."

The left stool is a stool in the galley. The right stool is a stool in the galley.

[The stools is a supporter in the Galley. It is scenery. It is enterable. "Two tall bar-type stools, one on each side of the counter. They are bolted to the floor."
Understand "stool" as the stools.]

To say microwave display:
	if microwave is unplugged:
		say "The front display is black";
	otherwise if the wall socket is plugged-up:
		say "The front display is black";
	otherwise:
		say "The front display shows 'Press Start'";

The microwave oven is a container in the Galley. It is scenery. It is openable and closed. "The microwave is [if open]open[otherwise]closed[end if]. [if unplugged]Its cord is unplugged.[otherwise]It's plugged into a socket inset in the countertop.[end if] [microwave display]. A large red button below the display says 'Start'."

The microwave oven can be plugged-in or unplugged. The microwave oven is plugged-in.
The start button is a button that is a part of the microwave oven. "It's a red button. It says 'Start'." 
Understand "red button" as the start button.
The microwave front display is part of the microwave oven. The description is "[microwave display]."

To say socket description:
	say "It's an ordinary grounded wall socket";
	if the microwave oven is plugged-in:
		say ". The microwave oven is plugged in to it";
	otherwise if wall socket is plugged-up:
		say ". Upon close inspection, you notice that it's clogged up with dust";

Instead of searching the wall socket:
	say "[socket description].";
		
Instead of rubbing the wall socket:
	say "Your fingers won't fit into the socket to reach the dust.";

The wall socket is a thing in the galley. It is privately-named. It is scenery. The wall socket can be plugged-up. It is plugged-up. Understand "power point", "outlet", "power", "electrical", "socket", and "wall socket" as the wall socket. The description of the wall socket is "[socket description]."

Instead of inserting something into the wall socket:
	say "No.[paragraph break]";
	tip "Hey kids, never stick anything into an electrical outlet!";
	
Cleaning it with is an action applying to two things. Understand "clean [something] with [something]" as cleaning it with. Understand "vacuum [something] with [something]" as cleaning it with. Understand "unclog [something] with [something]" as cleaning it with.
Vacuuming is an action applying to one thing. Understand "vacuum [something]" as vacuuming.

Instead of vacuuming something:
	if the player encloses the portable vacuum:
		try cleaning the noun with the portable vacuum;
		rule succeeds;
	otherwise:
		say "You don't have a vacuum cleaner.";
		
check cleaning something with something:
	if the second noun is not the portable vacuum:
		say "[The second noun] cannot be used as a vacuum cleaner." instead;

Carry out cleaning the wall socket with the portable vacuum:
	now the wall socket is not plugged-up;
	
Report cleaning the wall socket with the portable vacuum when the wall socket was plugged-up:
	say "You vacuum the dust out of the socket.";
	rule succeeds;
	
Report cleaning the wall socket with the portable vacuum when the wall socket was not plugged-up:
	say "You vacuum the socket some more, but there's no more dust.";
	rule succeeds;
	
Report cleaning something with something:
	say "You vacuum [the noun] a little.";
	
Blowing into is an action applying to one thing. Understand "blow into [something]" as blowing into.

Instead of blowing into the wall socket:
	say "There's too much dust in there for that to be effective.";
	
Report blowing into something:
	say "Blowing into [the noun] accomplishes nothing.";

Instead of inserting an MRE into the microwave oven:
	say "MREs are self-heating; there's no need to microwave them.";

Instead of inserting something that is not the microwavable dinner into the microwave oven:
	say "That's not something you can heat in the microwave.";

The closet is a container in the Galley. It is scenery. It is closed and openable. "A closet with a folding door, set into the bulkhead."
The folding door is a part of the closet.

Instead of doing something to the folding door:
	now the noun is the closet;
	try the current action;

An MRE is a kind of thing. An MRE is edible. The description is "A regulation Meal Ready-to-Eat. One perk of not going on missions is you don't have to eat these things." The indefinite article is "an". [The mass of an MRE is 0.5].
10 MREs is in the closet. 

A microwavable dinner is in the closet. The description is "Spiced ham in some kind of sauce. Ugh."
A cooked dinner is a thing. It is edible. The description is "Spiced ham in some kind of sauce, heated. Ugh."
Report eating the cooked dinner:
	say "You eat the cooked dinner. It's as uninspiring as you imagined.";
	stop the action;
	
Does the player mean inserting into something that is not a container: it is very unlikely.
Does the player mean plugging in the microwavable dinner: it is very unlikely.
Does the player mean unplugging the microwavable dinner: it is very unlikely.
Does the player mean doing something to the microwavable dinner: it is very unlikely.
Does the player mean inserting the microwavable dinner into the microwavable dinner: It is very unlikely.
	
Check eating something when the chewing gum is currently chewed:
	say "You can't eat while chewing gum." instead;

The plug is a part of the microwave oven. The description is "It's an ordinary grounded plug.". 

Instead of pulling the plug:
	try unplugging the microwave oven;
	
Instead of unplugging the plug:
	try unplugging the microwave oven;
	
Instead of plugging in the plug:
	try plugging in the microwave oven;

Check plugging in the microwave when the microwave is plugged-in:
	say "That's already plugged in." instead;
	
Check unplugging the microwave oven when the microwave is unplugged:
	say "That's already unplugged." instead;
	
Carry out plugging in the microwave oven:
	Now the microwave oven is plugged-in;
	if the wall socket is not plugged-up:
		tick off fix the microwave;
	
Carry out unplugging the microwave oven:
	now the microwave oven is unplugged;
	
Report plugging in the microwave oven when the wall socket is plugged-up:
	say "You plug in the microwave oven, but nothing happens.";
	rule succeeds;

Report plugging in the microwave oven when the wall socket is not plugged-up:
	say "You plug in the microwave oven. It beeps three times and displays 'Press Start'.";
	rule succeeds;

Report plugging in something:
	say "You plug in [the noun].";
	
Report unplugging something:
	say "You unplug [the noun].";
	
Check plugging in something that is not the microwave oven:
	say "That can't be plugged in." instead;
	
Check unplugging something that is not the microwave oven:
	say "That can't be unplugged." instead;

Unplugging is an action applying to one thing. Understand "unplug [something]" as unplugging.
Plugging in is an action applying to one thing. Understand "plug in/-- [something]" as plugging in. Understand "plug [something] in" as plugging in.

Check pressing the start button when the microwave oven is unplugged:
	say "Nothing happens, probably because the microwave oven is unplugged." instead;

Check pressing the start button when the microwave oven is plugged-in and the socket is plugged-up:
	say "Nothing happens, but it's unclear why." instead;
	
Check pressing the start button when the microwave oven is open:
	say "(first closing the microwave oven)[command clarification break]";
	silently try closing the microwave oven;
	
Carry out pressing the start button when the microwave oven is not broken and the microwavable dinner is in the microwave oven:
	now the microwavable dinner is nowhere;
	now the cooked dinner is in the microwave oven;
	
Report pressing the start button when the microwave oven is not broken:
	say "The oven runs for a minute, beeps twice, and is quiet.";
	rule succeeds;

starting is an action applying to one thing. Understand "start [something]" as starting.

Check starting something that is not the microwave:
	say "That's not something you can start." instead;

check starting the microwave:
	try pressing the start button instead;

eaten already is a truth state that varies.

Check eating an MRE:
	if eaten already is true:
		say "You couldn't stomach anything more." instead;

Check eating the cooked dinner:
	if eaten already is true:
		say "You couldn't stomach anything more." instead;
		
Carry out eating something:
	now eaten already is true;
	
Report eating an MRE:
	say "You eat the MRE. Although it has the advantage of being self-heating, it is unfortunately thoroughly uninspired cuisine.";
	stop the action;

Traveled Fore Aft is a truth state that varies.

Instead of opening the Midship Door:
	say "You can't open that with your bare hands.";

Check pressing galley's blue button when something blocks the Midship Door:
	say "A loud buzzer sounds and a red light flashes on the door, which stays resolutely shut." instead;

Check pressing the fore blue button when something blocks the Midship Door:
	say "A loud buzzer sounds and a red light flashes on the door, which stays resolutely shut." instead;
	
Carry out pressing galley's blue button:
	now the Midship Door is open;
Carry out pressing the fore blue button:
	now the Midship Door is open;
	
Report pressing galley's blue button when the Midship Door was closed:
	say "The door slides open.";
	rule succeeds;
	
Report pressing the fore blue button when the Midship Door was closed:
	say "The door slides open.";
	rule succeeds;
	
Check pressing galley's blue button when the Midship Door is open:
	say "The door is already open." instead;
Check pressing the fore blue button when the Midship Door is open:
	say "The door is already open." instead;
	
After going through the Midship door:
	now traveled fore aft is true;
	continue the action;			
		
The control panel is thing in the galley. It is scenery. "The control panel features a prominent blue button for opening the door above. The door operations manual dangles on a chain from the panel."
The galley's blue button is part of the control panel. The description is "It's a button. It's blue."

The door operations manual is a thing in the galley. It is scenery. 
The door operations manual is readable. The readable text is "[description of the door operations manual]";

Does the player mean doing something other than reading to the door operations manual:
	It is very unlikely;
	
Does the player mean reading the door operations manual:
	It is very likely;

The description of the door operations manual is "Most of the manual is concerned with the technical details of the door, such as installation, maintainance, and repair. There is a small section towards the end detailing its safety features; for example: 'To prevent injury, the Portmaster V S-65 will not open when it senses weight pressing upon it from above. In this case, an audible signal and a red warning light will indicate that an obstruction exists.'";

Does the player mean opening the door operations manual: it is very unlikely.

Instead of taking the manual:
	say "It is chained securely to the control panel. Best leave it.";
	
Randomly shouting is an action applying to nothing. Understand "shout", "yell", "scream" as randomly shouting.
Knocking on is an action applying to one thing. Understand "knock on [something]", "pound on [something]", "bang on [something]" as knocking on.

Check knocking on something:
	say "There's no point in knocking on that.";
	
Instead of knocking on the midship door: 
	say "Whoever's up there, they didn't hear you apparently.";

Instead of knocking on the captain's door:
	say "You wait a second but no one answers. No one's home, I guess.";
	
Does the player mean knocking on the midship door when the player is in the Galley:
	it is very likely;

Instead of randomly shouting while player is in galley:
	say "Whoever is talking doesn't seem to hear you.";
	
Instead of hailing while player is in galley:
	say "Whoever is talking doesn't seem to hear you.";

The cookware is a thing in the galley. The printed name is "pots and pans". Understand "pots" and "pans" as cookware. The cookware is scenery. It is plural-named. The description is "There is a wide array of cookware here, none of which is likely to be useful to you."

Instead of taking the cookware:
	say "[The cookware] [are] not something you need to fix the ship.";

The midship ladder is a backdrop. The midship ladder is in Galley and Operations Deck. "It's an ordinary metal ladder. It connects the Galley to the Operations Deck. It has a small gap halfway up to accomodate the midship door."

Section 9 - Junction

The aft access panel is a container in the junction. It is scenery. It is closed.The printed name is "access panel". It is screwable and screwed. "The access panel is set in the bulkhead to the left of the door[if aft access panel is screwed]. It is closed and held fast with a screw[otherwise]. It is open, leaving an empty hole where the screw was[end if]." 

The hole is part of the aft access panel. The hole can be gummed-up. It is not gummed-up.
The description is "The little hole you put the screw in.".

The aft access panel contains the old fuse. 
The old fuse is privately-named. The printed name is "blown fuse". The description is "A typical yellow cartridge fuse, turned a smoky black.". Understand "blown" and "old" and "fuse" as old fuse.

Rule for listing contents of the aft access panel:
	say "these are the contents";
	
The examine containers rule does nothing when examining the aft access panel.

After examining the aft access panel when the aft access panel is open:
	try examining the row of fuses;
	
The row of fuses is a thing in the aft access panel. It is scenery. "Dummy description".

Instead of examining the row of fuses:
	if the old fuse is in the aft access panel:
		say "The panel holds a row of fuses, one of which is blown.";
	otherwise if the fresh fuse is in the aft access panel:
		say "The panel holds a row of fresh fuses.";
	otherwise:
		say "The panel holds a row of fuses, with one empty spot.";

Instead of taking the row of fuses:
	if the old fuse is in the aft access panel:
		say "You really only need the blown fuse. Taking that one instead.";
		try taking the old fuse;
	otherwise if the fresh fuse is in the aft access panel:
		say "You've replaced the bad fuse. No need to play with the fuses anymore.";
	otherwise:
		say "You've removed the bad fuse. Now worry about finding a replacement.";
		
The blue screw is a thing. The description is "It's a fairly small screw, covered in blue enamel."

After deciding the scope of the player when the player is in junction and the aft access panel is closed  and the aft access panel is screwed and the captain's door is broken:
	place the blue screw in scope;

Instead of unscrewing the blue screw when the blue screw is in the room of stuff:
	try unscrewing the aft access panel;

After unscrewing the aft access panel:
	now the aft access panel is open;
	now the blue screw is carried by the player;
	say "You open the panel, hanging on to the blue screw that held it shut.[paragraph break]";
	say "The access panel opens to reveal a row of fuses, one of which is blown.";
	
Check unscrewing the aft access panel when the fresh fuse is in the aft access panel:
	think "No way. I've fixed that already." instead;
	
Check inserting something into the aft access panel when the noun is not the fresh fuse and the noun is not the old fuse:
	say "[The noun] doesn't belong in the access panel." instead;
	
Check inserting the old fuse into the aft access panel:
	say "But you just removed the blown fuse from the access panel." instead; 
	
Check inserting the fresh fuse into the aft access panel when the old fuse is in the access panel:
	say "(first removing the blown fuse)[command clarification break]";
	silently try taking the old fuse;
	
Check screwing the aft access panel when the fresh fuse is not in the aft access panel:
	think "Why should I close it when I haven't fixed it yet?" instead;
	
Does the player mean inserting the blown fuse into the aft access panel: It is very unlikely.
Does the player mean inserting the fresh fuse into the aft access panel: It is very likely.

Carry out screwing the aft access panel when the aft access panel is unscrewed and the player encloses the blue screw:
	say "When you try to close the access panel, the blue screw slips from your grasp, bounces once, rolls, and falls down the ladder well. At the bottom of the ladder, it bounces once more, right through the grill of an air scrubber intake. That screw's long gone.";
	now the blue screw is nowhere;
	now the air scrubber intake is not undescribed;

Check screwing the aft access panel when the aft access panel is unscrewed and the player does not enclose the blue screw and the hole is not gummed-up (this is the check screw size rule):
	say "All of your screws are either too big or too small.";
		
Carry out screwing the aft access panel when the hole is gummed-up:
	now the aft access panel is closed;
	now the aft access panel is screwed;
	now the captain's door is not broken;
	Tick off fix the door;
	
Report screwing the aft access panel when the hole is gummed-up:
	say "You drive a screw into the gum and it holds. The panel is now closed.[paragraph break]";
	say "You hear a series of beeps, and a voice says 'Door now operational.'[paragraph break]";
	
Instead of opening the aft access panel:
	try unscrewing the aft access panel;
	
Instead of closing the aft access panel:
	try screwing the aft access panel;

Instead of inserting the chewing gum into the hole:
	if the gum is not enclosed by the player:			
		say "(first taking the chewing gum)[command clarification break]";
		silently try taking the chewing gum;
	if the gum is not enclosed by the player:
		rule fails;
	now the hole is gummed-up;
	now the chewing gum is nowhere;
	say "You push the gum into the hole.";
	think "I hope this works.";

Section 10 - Captain's Quarters

After going to Captain's Quarters for the first time:
	print "Welcome, repairperson. Please observe appropriate respect for sensitive materials while in the Captain's quarters.[line break]" as computer near player;
	continue the action;

The matching card of Captain's door is the red access card.

The description of the captain's door is "[The captain's door] is a conventional, self-opening starship door. It is painted in the traditional red of a starship captain. It features a slot through which you may slide the appropriate access card. Beside the door is an access panel, which is [if aft access panel is closed]closed[otherwise]open[end if].".

The description of the captain's door's slot is "It's a typical card slot, perfect for sliding thin things through."

Captain's Door is closed.

Captain's Door can be broken or fixed. Captain's door is broken. 

Instead of opening captain's door when the captain's door is not already authorized:
	say "You can't just open the door with your bare hands. It needs an access card.";
	
Instead of opening captain's door when the captain's door is already authorized:
	say "Since you're already authorized, the door will open automatically for you from now on.";
	
The description of Captain's Quarters is "Neat and spartan, this cabin is the very model of a small fighting ship's captain's quarters. An impeccably organized desk is against one wall, while a typically spotless bed sits beneath a portrait of this very ship. You can exit to fore.".

The captain's bed is a supporter in the captain's quarters. It is enterable. It is scenery. It is undersided. "The captain's bed is like all the others on the ship: faultlessly neat."

The captain's desk is a thing in the captain's quarters. It is scenery. The description is "The Captain's desk is a simple institutional metal desk with a single drawer, [state and contents of desk drawer]. On the desk are two framed photos, one of a dog, who by his tag must be named 'Pluto', and another of an astronaut planting a flag on Earth's moon.".

The photo of Pluto is scenery in the captain's quarters. Understand "dog", "picture" as the photo of pluto.

Instead of examining the photo of Pluto:
	say "Pluto is a beagle with a wise, knowing look on his face.";
	think thought 16;

The moon photo is scenery in the captain's quarters. "The iconic photo of Neil Armstrong standing next to the American flag.". Understand "flag", "picture", "Armstrong", "Neil", "astronaut" as the moon photo.

The desk drawer is a container. It is part of the captain's desk. It is openable and closed. The description is "[description of the desk]"

The portrait of the ship is scenery in captain's quarters. "The SS Usagi looks ungainly, as a vessel that travels in vacuum typically does, but it's truly a beautiful ship."

After opening the drawer:
	activate table of journal hints;
	make no decision;

Instead of entering the captain's desk:
	say "Stop messing around.";
	
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
	
The desk drawer contains the captain's journal.
The captain's journal has indefinite article "the". The captain's journal can be locked or unlocked. It is locked. 
It is readable. It is addressable. The description is "dummy description"

Understand "diary" as the captain's journal.

Check examining the captain's journal:
	try reading the captain's journal instead;

Captain's Affair is a subject. It is not familiar. The description is "subject". Understand "compromise" or "compromised" as Captain's Affair.
Understand "blackmail", "cooperation", "treason", "journal", "diary" as Captain's Affair.

Carry out reading the captain's journal:
	print "The Captain's journal is considered off-limits to non-command personnel. This incident has been logged." as computer near player;
	say paragraph break;
	if locked:
		say "The captain's journal is an electronic diary which requires a password to open.";
		tip "For example, say 'journal, password walrus' to unlock the journal with the password 'walrus'.";
	otherwise:
		think thought 10;
		say "You page through the journal, skimming over the boring parts detailing the running of the ship. Eventually you come across something more interesting:
		
		'I screwed up last night. I let them spend the night and I think someone noticed. If this got out my career would be over.'
		
		A few pages later:
		
		'I'm being blackmailed. I don't know who, but someone messaged me telling me all they know. They know a lot. They made it clear they expect my [']cooperation['].'
		
		Numerous later passages detail this cooperation, ranging from simple intelligence gathering to actively working to harm the Space Authority.[paragraph break]";
		think thought 11;
		now Captain's Affair is familiar;
	rule succeeds;
	
Persuasion rule for asking the captain's journal to try hacking:
	persuasion succeeds;

Persuasion rule for asking the captain's journal to try doing something other than hacking:
	say "You can't ask a journal to do just anything.";
	persuasion fails;
	
Instead of answering the captain's journal that:
	say "The journal isn't actually a sentient being listening to you. It only accepts a voice login.";
	
After the journal hacking a topic:
	if "[topic understood]" is "charon":
		now captain's journal is unlocked;
		say "The journal chimes pleasantly and the screen fills with text.";
	otherwise:
		say "The journal beeps once to indicate an invalid login.";

Section 11 - Port-Side Crew Quarters

The port-side equipment cabinet is a container in Port-side crew quarters. It is scenery. It is closed and openable. "A simple black-painted steel cabinet, it is [state and contents of port-side equipment cabinet]."

The port-side cabinet door is a part of the port-side equipment cabinet. It is privately-named. The printed name is "cabinet door". Understand "cabinet/-- door" as port-side cabinet door. The description is "It's a simple black-painted steel door.".

The port-side equipment cabinet contains the engineering uniform. The engineering uniform is a wearable container. It contains a piece of note paper.
The description of the engineering uniform is "Colored the traditional mustard yellow of Engineering, it's really a remarkably ugly uniform.".

Rule for deciding whether all includes the piece of note paper when the piece of note paper is contained in the engineering uniform:
	It does not.

The piece of note paper is readable. The description is "[the readable text]". The readable text is "Scribbled on the paper is the number 9467."

Rule for printing room description details of the engineering uniform: omit contents in listing;

The port-side equipment cabinet contains the Universal Game Emulator. The description of Universal Game Emulator is "The Universal Game Emulator, or 'UGE', can play any game ever produced for any system.".  Understand "console", "UGE", "MAME" as Universal Game Emulator.

The port-side bed is in the port-side crew quarters. it is privately-named. The printed name is "bunk bed". It is scenery. The description is "A fairly typical military bunk bed." Understand "bunk" and "bed" as the port-side bed.
The port-side top bunk is a part of the port-side bed. It is a supporter. It is enterable. It is privately-named. The printed name is "top bunk". It is improper-named. The description is "This bunk is, like the other, made up with regulation precision." Understand "top bunk" as the port-side top bunk. 
The port-side bottom bunk is a part of the port-side bed. It is a supporter. It is enterable. It is privately-named. The printed name is "bottom bunk". It is improper-named. The description is "This bunk is, like the other, made up with regulation precision." Understand "bottom bunk" as the port-side bottom bunk.

Instead of climbing the port-side bed:
	try entering the port-side top bunk;

The port-side bottom bunk is undersided.
The black trunk underlies the starboard-side bottom bunk.

Does the player mean getting off something (called T):
	if the player is not on T:
		it is very unlikely;
	It is very likely;
	
Instead of entering the port-side bed:
	try entering a bunk;
	
Instead of looking under the port-side bed:
	try looking under the port-side bottom bunk;
	
Instead of going down when the player is on the port-side bottom bunk:
	try exiting;
	
A drawer-kind is a kind of container. It is openable.
	
After going to port-side crew quarters for the first time:
	activate table of open unit hints;
	make no decision;
		
After going to starboard-side crew quarters for the first time:
	activate table of open unit hints;
	make no decision;

The Port-side storage unit is a thing in port-side crew quarters. It is scenery. The printed name is "crew personal storage unit". Understand "crew", "personal", "storage", and "unit" as port-side storage unit. The port-side storage unit can be storage-breaking, storage-broken, or storage-fixed.
	The Port keypad is a container which is part of Port-side storage unit. It is closed, openable, locked, and lockable. The printed name is "keypad". The port keypad is typable. The carrying capacity is 0.
	The port keypad has matching key the small key.
	The Port display is a part of Port-side storage unit. The printed name is "display".
	The Port top drawer is a drawer-kind which is part of Port-side storage unit. The printed name is "top drawer". It is closed. Understand "upper" as the port top drawer.
	The Port bottom drawer is a drawer-kind which is part of Port-side storage unit. The printed name is "bottom drawer". It is closed. Understand "lower" as the port bottom drawer.
	
The description of the port-side storage unit is "The storage unit consists of top and bottom drawers, with an attached keypad and display. There is a keyhole under the keypad.[if the port bottom drawer is open] The top drawer is closed, but the bottom drawer is [state and contents of port bottom drawer].[otherwise if the port bottom drawer is half-open] The top drawer is closed; the bottom drawer juts out by a couple of centimeters.[otherwise if the port top drawer is open] The top drawer is [state and contents of port top drawer], but the bottom drawer is closed.[otherwise] Both drawers are closed.[end if]"

The description of the port keypad is "A standard 0-9 keypad with a '*' and '#'. Below the keys is a small keyhole.".

The port top drawer contains a copy of Planetfall.

The port keyhole is part of the port keypad. It is scenery.
"A pretty typical keyhole, maybe smaller than most."

Instead of inserting the small key into the port keyhole:
	try unlocking the port keypad with the small key;

Instead of unlocking the port keyhole with the small key:
	try unlocking the port keypad with the small key;
	
Instead of unlocking the port top drawer with something:
	say "You may be trying to unlock the keypad, which has a keyhole in it. Or you may be trying to unlock a drawer, which can only be done by typing the correct code on the keypad.";
	
Instead of unlocking the port bottom drawer with something:
	say "You may be trying to unlock the keypad, which has a keyhole in it. Or you may be trying to unlock a drawer, which can only be done by typing the correct code on the keypad.";
	
Instead of unlocking the port-side storage unit with something:
	say "You may be trying to unlock the keypad, which has a keyhole in it. Or you may be trying to unlock a drawer, which can only be done by typing the correct code on the keypad.";

Instead of examining the copy of Planetfall:
	say "It's amazing that this still exists. A copy of the interactive fiction classic on 5.25[quotation mark] floppy disk for the Apple II.";
	think thought 18;

To say port side display description:
	If port-side storage unit is storage-breaking:
		say "The display says 'Enter Code'";
	otherwise if the port-side storage unit is storage-broken:
		say "The display is blank";
	otherwise if the port-side storage unit is storage-fixed:
		if the port bottom drawer is open or the port top drawer is open or the port bottom drawer is half-open:
			say "The display says 'Close Drawer'";
		otherwise:
			say "The display says 'Enter Code'";

The description of the port display is "[port side display description].".

Instead of opening the port-side storage unit:
	try opening the port top drawer;
	
After closing the port keypad:
	now the port keypad is locked;
	continue the action;

The description of the Port top drawer is "The top drawer is labeled 'Franck'. It is [state and contents of port top drawer]."
The description of the Port bottom drawer is "The bottom drawer is labeled 'Khotpanya'. [if the port bottom drawer is open]It is [state and contents of port bottom drawer].[otherwise if the port bottom drawer is half-open]The bottom drawer juts out by a couple of centimeters.[otherwise]The bottom drawer is closed.[end if]"

After examining the starboard top drawer:
	now Delores Franck is familiar;
	continue the action;
	
After examining the starboard bottom drawer:
	now Somchai Khotpanya is familiar;
	continue the action;

The examine containers rule does nothing when examining the port bottom drawer.

An access card called the red access card is in the port bottom drawer. The description of the red access card is "The card is red, with the Space Authority symbol that designates it as an access card, but otherwise featureless. [think]Looks like the captain's card. Why would that be in a crewman's drawer?[think end]"
	
Instead of opening the port top drawer when port keypad is blown:
	say "Normally, you'd open it by typing the code on the keypad, but that seems to be broken at the moment.";

Instead of opening the port top drawer: 
	say "That can only be opened by typing the correct code on the keypad.";	
	
Instead of opening the port bottom drawer when the port bottom drawer is half-open:
	say "The drawer is partially open, but you can't find a purchase on it firm enough to open it.";
	
Instead of opening the port bottom drawer:
	say "That can only be opened by typing the correct code on the keypad.";

The port bottom drawer can be half-open. The port keypad can be blown.

Check typing on the port keypad when the port keypad is open:
	say "You need to close the keypad before you can type on it." instead;
	
Check contentlessly typing on the port keypad when the port keypad is open:
	say "You need to close the keypad before you can type on it." instead;

Carry out typing on the port keypad when port-side storage unit is storage-breaking:
	now the port bottom drawer is half-open;	
	now the port-side storage unit is storage-broken;
	add fix the storage unit;
	
Report pushing the display to a direction:
	say "success!";
	
Report typing on the port keypad when port-side storage unit was storage-breaking:
	say "As you press a key, the storage unit starts buzzing continuously. The display lights up with random characters, and you smell the distinct odor of burning wires. The bottom drawer pops out a centimeter or two.[paragraph break]";
	stop the action;
	
Check typing on the port keypad when the port-side storage unit is storage-broken:
	say "The storage unit seems to be broken." instead;
	
To decide whether some drawer open:
	decide on whether or not port bottom drawer is open or port top drawer is open;
	
Check typing on the port keypad when the port-side storage unit is not storage-broken and (some drawer open or the port bottom drawer is half-open):
	say "The display flashes 'Close Drawer'." instead;
	
Typing it on has a truth state called drawer opened. 

Carry out typing a topic on the port keypad when the port-side storage unit is storage-fixed:			
	if "[the topic understood]" is "9467":
		now the port top drawer is open;
		now drawer opened of typing it on is true;
	otherwise:
		now drawer opened of typing it on is false;
		
Report typing a topic on the port keypad when the port-side storage unit is storage-fixed and drawer opened of typing it on is true:
	say "The top drawer slides open";
	if the port top drawer contains nothing:
		say ". It is empty.";
	otherwise:
		say ", revealing ";
		list the contents of the port top drawer;
		say ".";

Carry out contentlessly typing on the port keypad when port-side storage unit is storage-breaking:
	now the port bottom drawer is half-open;	
	now the port-side storage unit is storage-broken;
	add fix the storage unit;

Report contentlessly typing on the port keypad when port-side storage unit was storage-breaking:
	say "As you press a key, the storage unit starts buzzing continuously. The display lights up with random characters, and you smell the distinct odor of burning wires. The bottom drawer pops out a centimeter or two.[paragraph break]";
	stop the action;
	
Check contentlessly typing on the port keypad when the port-side storage unit is storage-broken:
	say "The storage unit seems to be broken." instead;
	
Prying it open with is an action applying to two things. Understand "pry [something] with [something]" and "pry [something] open with [something]" and "pry open [something] with [something]" and "jimmy [something] with [something]" and "jimmy [something] open with [something]" and "jimmy open [something] with [something]" as prying it open with.

Instead of unlocking port bottom drawer with knife:
	try prying the port bottom drawer open with knife;
	
Instead of inserting the knife into the port bottom drawer:
	try prying the port bottom drawer open with knife;
	
Instead of unlocking port top drawer with knife when the port bottom drawer has been open:
	say "You're not going to make that trick work twice.";
	
Check prying something open with something:	
	If the noun is the port bottom drawer and the second noun is not the knife and the port bottom drawer is half-open:
		say "[The second noun] is too large to pry open [the noun].";
		think thought 8;
		stop the action;
	If the noun is a drawer-kind and the second noun is not the knife:
		say "[The second noun] is too large to pry open [the noun]." instead;
	if the noun is not a drawer-kind:
		say "It's not clear how you would pry [the noun] open." instead;
		
Check prying a drawer-kind open with the knife when the noun is not the port bottom drawer:
	say "You attempt to wedge the knife into the seam, but you can't get it in far enough." instead;

Check prying the port bottom drawer open with the knife when the port bottom drawer is closed and the port bottom drawer is not half-open:
	say "You attempt to wedge the knife into the seam, but you can't get it in far enough." instead;
		
Carry out prying the port bottom drawer open with the knife when the port bottom drawer is half-open:
	Now the port bottom drawer is open;
	Now the port bottom drawer is not half-open;
	deactivate table of open unit hints;
	
Report prying the port bottom drawer open with the knife when the port bottom drawer was half-open:
	say "You wedge the knife into the seam and lever the drawer open, revealing [list of things contained in the port bottom drawer with indefinite articles].";
	
After unlocking the port keypad with the small key:
	try opening the port keypad;
	
After opening the port keypad:
	if the port-side storage unit is storage-broken:
		say "You open the front panel of the keypad, revealing a bundle of wiring. You can see the problem immediately -- two wires with worn insulation are in contact, causing a short-circuit.";
	otherwise:
		say "You open the front panel of the keypad, revealing a bundle of wiring.";
		
Instead of examining the port keypad when the port keypad is open:
	if the port-side storage unit is storage-broken:
		say "Inside the keypad is a bundle of wiring. Two wires with worn insulation are in contact, causing a short-circuit.";
	otherwise:
		say "Inside the keypad is a bundle of wiring.";
	
	
[Instead of unlocking the port keypad with the small key when the port-side storage unit is storage-broken and the player does not carry the electrical tape:
	say "You open the front panel of the keypad. You can see the problem immediately -- two wires with worn insulation are in contact, causing a short-circuit. Unfortunately you don't have anything to fix it with, so for now you close the front panel.";]

The wires are scenery in the port keypad. "Two of the wires are crossed, leading to a short circuit.".	

Instead of putting the electrical tape on the wires:
	now the port-side storage unit is storage-fixed;
	tick off fix the storage unit;
	now the port keypad is closed;
	now the port keypad is locked;
	say "You wrap the wires in electrical tape and close the keypad.";
	
Instead of wrapping the wires with electrical tape:
	try putting the electrical tape on the wires;
	
Check taping the wires when the player does not enclose the electrical tape:
	if the electrical tape is touchable:	
		say "(first taking the electrical tape)[command clarification break]";
		now the player carries the electrical tape;
		try putting the electrical tape on the wires instead;
	otherwise:
		say "You don't have any tape." instead;

Instead of taping the wires when the player encloses the electrical tape:
	try putting the electrical tape on the wires;

[Instead of unlocking the port keypad with the small key:
	say "You open the front panel of the keypad. You don't see any immediate problems, so you close it again.";
	
Instead of unlocking the port keypad with the small key when the port-side storage unit is storage-broken and the player carries the roll of electrical tape:
	say "You open the front panel of the keypad. You can see the problem immediately -- two wires with worn insulation are in contact, causing a short-circuit. You use a strip of electrical tape to fix the problem.";
	now the port-side storage unit is storage-fixed;
	tick off Fix the storage unit;]
	
Instead of inserting something into the port bottom drawer when the port bottom drawer is half-open:
	say "You'll have to open the drawer all of the way to put something in it.";
	
Definition: A thing is non-player if it is not the player.
	
To say bunk list of (T - a thing):	
	now all things enclosed by T are unmarked for listing;
	let L be the list of non-player things that are on T;
	repeat with X running through L:
		now X is marked for listing;
	list the contents of T, as a sentence, giving inventory information, listing marked items only;

Instead of closing the port bottom drawer when the port bottom drawer is half-open:
	say "You're unable to close the drawer. I think you'll need to open it all the way first.";	

This is the describe port bunk contents rule:
	if the location is the port-side crew quarters:
		if nothing is on the port-side top bunk and nothing is on the port-side bottom bunk:
			rule succeeds;
		if something that is not the player is on the port-side top bunk and something that is not the player is on the port-side bottom bunk:
			say "You see [bunk list of port-side top bunk] on the top bunk, and [bunk list of port-side bottom bunk] on the bottom bunk.";
		otherwise if something that is not the player is on the port-side top bunk:
			say "You see [bunk list of port-side top bunk] on the top bunk.[run paragraph on] ";
			say paragraph break;
		otherwise if something that is not the player is on the port-side bottom bunk:			
			say "You see [bunk list of port-side bottom bunk] on the bottom bunk.[run paragraph on]";
			say paragraph break;

The describe port bunk contents rule is listed after the room description paragraphs about objects rule in the carry out looking rules.

Instead of going nowhere from port-side crew quarters when player is on the port-side top bunk and the noun is down:
	try exiting;

Instead of going nowhere from port-side crew quarters when player is on the port-side bottom bunk and the noun is down:
	try exiting;

Section 12 - Starboard-Side Crew Quarters

The starboard-side equipment cabinet is a container in starboard-side crew quarters. It is scenery. It is closed and openable. "A simple black-painted steel cabinet, it is [state and contents of starboard-side equipment cabinet]."
The starboard-side cabinet door is a part of the starboard-side equipment cabinet. It is privately-named. The printed name is "cabinet door". Understand "cabinet/-- door" as starboard-side cabinet door. The description is "It's a simple black-painted steel door.".

The starboard-side equipment cabinet can be unrepaired or repaired. The starboard-side equipment cabinet is unrepaired. 

The beacon is in the starboard-side equipment cabinet. The description is "A device for broadcasting the location of an object in space."

After entering the starboard-side top bunk when the starboard-side equipment cabinet is unrepaired:
	say "As you clamber up, it looks like there's something wrong with the cabinet door.";

The crooked screw is contained in the starboard-side cabinet door. The description is "The screw is bent beyond repair.".

Instead of opening the starboard-side equipment cabinet when the starboard-side equipment cabinet is unrepaired:
	say "The door is stuck one-quarter open. You try to open the cabinet the rest of the way, but the door is jammed.";
	
Instead of examining the starboard-side cabinet door when the starboard-side equipment cabinet is unrepaired and the player is not on the starboard-side top bunk and the player is not on the black trunk:
	say "You look closely, but you can't see anything from here that would stop the door from opening all the way.";
	
Instead of examining the starboard-side cabinet door when the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk):
	say "You can see the problem from up here: the top hinge of the cabinet door has a crooked screw, probably from the door being slammed too many times. You'll have to replace it.";

Instead of examining the starboard-side equipment cabinet when the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk):
	say "You can see the problem from up here: the top hinge of the cabinet door has a crooked screw, probably from the door being slammed too many times. You'll have to replace it.";
	
Replacing screw is an action applying to nothing. Understand "replace the/-- screw" as replacing screw.
Check replacing screw:
	say "I'm not sure what you're referring to.";

Instead of taking the screw when the location is starboard-side crew quarters and the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk): 
	try replacing screw;

Instead of unscrewing the screw when the location is starboard-side crew quarters and the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk): 
	try replacing screw;

Instead of fixing the screw when the location is starboard-side crew quarters and the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk): 
	try replacing screw;
	
Instead of replacing screw when the location is starboard-side crew quarters and the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk):
	say "You unscrew the old screw and replace it with a new one from your toolbox.";
	now the crooked screw is nowhere;
	now the starboard-side equipment cabinet is repaired;
	tick off fix the cabinet;
	
Instead of opening the starboard-side cabinet door:
	try opening the starboard-side cabinet;
	
Instead of closing the starboard-side cabinet door:
	try closing the starboard-side cabinet;

Instead of fixing the starboard-side equipment cabinet when the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk):
	try replacing screw instead;

Instead of fixing the starboard-side cabinet door when the starboard-side equipment cabinet is unrepaired and (the player is on the starboard-side top bunk or the player is on the black trunk):
	try replacing screw instead;
	
[To repair cabinet door:
	if the current stuck thing of the chewing gum is the tiny screw:
		now the current stuck thing of the chewing gum is the player;
		now the player carries the chewing gum;
		say ". You pull the chewing gum off the tiny screw, ";
	otherwise:
		say ". You find the tiny screw, ";
	say "and fix the door.";
	now the starboard-side equipment cabinet is repaired;
	tick off fix the cabinet;
	
skip reporting is a truth state that varies.

carry out entering the starboard-side top bunk when the starboard-side equipment cabinet is unrepaired:
	if the player encloses the screwdriver and the player encloses the tiny screw:
		repair cabinet door; 
	
report entering the starboard-side top bunk when the starboard-side equipment cabinet is unrepaired:
	say "Upon climbing onto the top bunk, you can see that the top hinge of the cabinet door has a crooked screw. That screw is partially-stripped, so you'll need to replace it";
	if the player does not enclose the screwdriver:
		say 	". Unfortunately you don't have a screwdriver with which to fix it.";
	otherwise if the player does not enclose the tiny screw:
		say ". However, you don't have the right size replacement screw.";
	otherwise:
		repair cabinet door;
		
After doing something when the player is on the starboard-side top bunk and the starboard-side equipment cabinet is unrepaired:
	if the player encloses the screwdriver and the player encloses the tiny screw:
		say "Now you have everything you need to fix the cabinet door";
		repair cabinet door;
	
After entering the black trunk when the starboard-side equipment cabinet is unrepaired:
	say "Upon climbing onto the trunk, you can see that the top hinge of the cabinet door has a crooked screw. That screw is partially-stripped, so you'll need to replace it";
	if the player does not enclose the screwdriver:
		say 	". Unfortunately you don't have a screwdriver with which to fix it.";
	otherwise if the player does not enclose the tiny screw:
		say ". However, you don't have the right size replacement screw.";
	otherwise:
		repair cabinet door;
		
After doing something when the player is on the black trunk and the starboard-side equipment cabinet is unrepaired:
	if the player encloses the screwdriver and the player encloses the tiny screw:
		say "Now you have everything you need to fix the cabinet door";
		repair cabinet door;]

The starboard-side bed is in the starboard-side crew quarters. it is privately-named. The printed name is "bunk bed". It is scenery. The description is "A fairly typical military bunk bed." Understand "bunk" and "bed" and "post" as the starboard-side bed.
The starboard-side top bunk is a part of the starboard-side bed. It is a supporter. It is enterable. It is privately-named. The printed name is "top bunk". It is improper-named. The description is "This bunk is, like the other, made up with regulation precision." Understand "top bunk" as the starboard-side top bunk. 
The starboard-side bottom bunk is a part of the starboard-side bed. It is a supporter. It is enterable. It is privately-named. The printed name is "bottom bunk". It is improper-named. The description is "This bunk is, like the other, made up with regulation precision." Understand "bottom bunk" as the starboard-side bottom bunk.

This is the describe starboard bunk contents rule:
	if the location is the starboard-side crew quarters:
		if nothing is on the starboard-side top bunk and nothing is on the starboard-side bottom bunk:
			rule succeeds;
		if something that is not the player is on the starboard-side top bunk and something that is not the player is on the starboard-side bottom bunk:
			say "You see [bunk list of starboard-side top bunk] on the top bunk, and [bunk list of starboard-side bottom bunk] on the bottom bunk.";
		otherwise if something that is not the player is on the starboard-side top bunk:
			say "You see [bunk list of starboard-side top bunk] on the top bunk.[run paragraph on] ";
			say paragraph break;
		otherwise if something that is not the player is on the starboard-side bottom bunk:
			say "You see [bunk list of starboard-side bottom bunk] on the bottom bunk.[run paragraph on]";
			say paragraph break;

The describe starboard bunk contents rule is listed after the room description paragraphs about objects rule in the carry out looking rules.

Instead of going nowhere from starboard-side crew quarters when player is on the starboard-side top bunk and the noun is down:
	try exiting;

Instead of going nowhere from starboard-side crew quarters when player is on the starboard-side bottom bunk and the noun is down:
	try exiting;

The starboard-side bottom bunk is undersided.
	
Instead of entering the starboard-side bed:
	try entering a bunk;
	
Instead of looking under the starboard-side bed:
	try looking under the starboard-side bottom bunk;
	
The starboard-side storage unit is a thing in starboard-side crew quarters. It is scenery. The printed name is "crew personal storage unit". Understand "crew", "personal", "storage", and "unit" as port-side storage unit.
	The starboard keypad is a container which is part of starboard-side storage unit. The printed name is "keypad". The starboard keypad is typable. It is closed, openable, locked, and lockable. The starboard keypad has matching key the small key.
	The starboard display is a part of starboard-side storage unit. The printed name is "display".
	The starboard top drawer is a drawer-kind which is part of starboard-side storage unit. The printed name is "top drawer". It is closed. Understand "upper" as the starboard top drawer.
	The starboard bottom drawer is a drawer-kind which is part of starboard-side storage unit. The printed name is "bottom drawer". It is closed.	Understand "lower" as the starboard bottom drawer.
	
The description of the starboard-side storage unit is "The storage unit consists of top and bottom drawers, with an attached keypad and display. There is a keyhole under the keypad. Both drawers are closed."

The description of the starboard keypad is "A standard 0-9 keypad with a '*' and '#'. Below the keys is a small keyhole.".

The description of the starboard display is "The display says 'Enter Code'.".

The description of the starboard top drawer is "The top drawer is labeled 'Jäger'. It is closed."
The description of the starboard bottom drawer is "The bottom drawer is labeled 'Abimbola'. It is closed."

After examining the starboard top drawer:
	now Friedrich Jäger is familiar;
	continue the action;
	
After examining the starboard bottom drawer:
	now Akin Abimbola is familiar;
	continue the action;

The starboard keyhole is part of the starboard keypad. It is scenery.
"A pretty typical keyhole, maybe smaller than most."

Instead of inserting the small key into the starboard keyhole:
	try unlocking the starboard keypad with the small key;

Instead of unlocking the starboard keyhole with the small key:
	try unlocking the starboard keypad with the small key;

Instead of opening the starboard-side storage unit:
	try opening the starboard top drawer;
	
Instead of opening the starboard top drawer:
	say "That can only be opened by typing the correct code on the keypad.";
	
Instead of opening the starboard bottom drawer:
	say "That can only be opened by typing the correct code on the keypad.";
	
Report typing on the starboard keypad:
	say "The storage unit buzzes and the display lights up 'ERROR'.";
	stop the action;
	
Report contentlessly typing on the starboard keypad:
	say "The storage unit buzzes and the display lights up 'ERROR'.";
	stop the action;
	
After unlocking the starboard keypad with the small key:
	try opening the starboard keypad;
	
After opening the starboard keypad:
	say "You open the front panel of the keypad, revealing a bundle of wiring.";
	
After closing the starboard keypad:
	now the starboard keypad is locked;
	continue the action;
		
Instead of examining the starboard keypad when the starboard keypad is open:
	say "Inside the keypad is a bundle of wiring.";
	
The sticky note is a thing in the starboard-side crew quarters. The description is "Written on the note is 'Mail package to Mitchell ASAP'.". "In a shocking lapse of military precision, there is a sticky note attached to the bed post."

The readable text of the sticky note is "[description]". It is readable.

A pair of slippers are a wearable thing in the starboard-side crew quarters. They are plural-named. The description is "These seem comfy.". "A pair of slippers peeks out from under the bed." 

After taking the slippers when the black trunk underlies the starboard-side bottom bunk for the first time:
	say "As you lean to take the slippers, you notice something under the bed.";

Instead of wearing the slippers when the player is wearing a vac suit:
	say "You can't wear those over the mag boots.";
	
Instead of wearing a vac suit when the player is wearing the slippers:
	say "The mag boots won't fit over your slippers.";

Section 13 - Aft Airlock

Aft-Airlock-Room is privately-named. The printed name is "Aft Airlock".

Instead of going outside when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is not wearing a vac suit and player is not wearing a broken vac suit:
	say "Not without a vac suit, you aren't.";

Instead of going aft when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is not wearing a vac suit and player is not wearing a broken vac suit:
	say "Not without a vac suit, you aren't.";

Instead of going outside when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is wearing a broken vac suit:
	say "The vac suit you're wearing is not reliable. Find another.";

Instead of going aft when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is wearing a broken vac suit:
	say "The vac suit you're wearing is not reliable. Find another.";

Check going to Spacewalk 1 when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is wearing a vac suit for the first time:
	say "It's dangerous out there. I recommend saving the game first...";
	tip "Use 'save' to save the game, or go 'out' again to continue without saving." instead;

[Check going aft when location is the Aft-Airlock-Room and Boarding the Ship is not happening and player is wearing a vac suit for the first time:
	say "It's dangerous out there. I recommend saving the game first...";
	tip "Use 'save' to save the game, or go 'out' again to continue without saving." instead;]
	
Aft Airlock Inner Door Broken is a truth state that varies. Aft Airlock Inner Door Broken is initially false.

Section 14 - Staging Area

The suit locker 1 is a container in Staging Area. It is privately-named. The printed name is "vac suit locker". It is scenery. It contains five vac suits. Understand "vac/-- suit/-- locker" as suit locker 1. The description is "The locker is made of some composite material, all black. It is [if suit locker 1 is open]open[otherwise]closed[end if].". It is open and openable.

A banged-up suit is a kind of thing. It is wearable. The description is "This vac suit has been banged up enough to be unreliable as protection against vacuum.". Understand "broken" and "unreliable" as a banged-up suit.

The suit locker 2 is a container. It is privately-named. It is flippable. It is closed and openable. The printed name is "vac suit locker". It is scenery. Understand "vac/-- suit/-- locker" as suit locker 2. "[If suit locker 2 is door-side down]The vac suit locker has fallen with its door to the ground. It looks pretty heavy[otherwise]The locker has been flipped door-side-up[end if]." It contains four banged-up suits. Suit locker 2 can be door-side down. It is door-side down. It is closed and openable.

Instead of pushing suit locker 2 when gravity > 1:
	say "The locker is too heavy to move.";
	
Instead of opening suit locker 2 when suit locker 2 is door-side down:
	say "The locker has fallen door-side down.";
	
Instead of closing suit locker 2 when suit locker 2 is door-side down:
	say "The locker has fallen door-side down.";
	
Check turning over suit locker 2 when suit locker 2 is not door-side down:
	say "You'd rather not. It's already door-side-up." instead;
	
Check turning over suit locker 2 when gravity > 1:
	say "It's much too heavy to turn over." instead;
	
Carry out turning over suit locker 2 when suit locker 2 is door-side down:
	now suit locker 2 is not door-side down;	
	
Instead of turning suit locker 2 when gravity is 1:
	try turning over suit locker 2;
	
Instead of turning suit locker 2 when gravity > 1:
	say "It's much too heavy to turn over.";
	
Instead of pushing suit locker 2 when gravity is 1:
	try turning over suit locker 2;
	
Instead of pushing suit locker 2 when gravity > 1:
	say "It's much too heavy to turn over.";
	
Instead of taking suit locker 2 when gravity is 1:
	say "You can't really lift the locker, even with the gravity this low, but you can turn it over.";
	try turning over suit locker 2;
	
Report turning over suit locker 2:
	say "You turn over the locker. Now it's door-side-up.";
	rule succeeds;
	
After dropping black trunk in Staging Area:
	say "You place the black trunk near the airlock door.";
	
EVA transport line in play is a truth state that varies.

After opening suit locker 2 when EVA transport line in play is false:
	say "You open the locker.[paragraph break]";
	say "You search through the contents of the locker. It's mostly broken vac suits, but you discover something interesting: an EVA transport line, used for securing objects during extravehicular transit.";
	now the player carries the EVA transport line;
	now EVA transport line in play is true;

One vac suit is in staging area. It is undescribed.

The munitions compartment is a container in Staging Area. The description is "The munitions compartment is a glass-fronted, horizontal cabinet mounted in the wall. It is closed, and holds an array of offensive weapons, including the Syrinx 52-K laser rifle."

The examine containers rule does nothing when the noun is the munitions compartment.

Understand "compartments", "gun", "cabinet", "glass" as munitions compartment. It is closed, locked and transparent. It is scenery.

The laser rifle is in the munitions compartment. The description is "A red and black ferocious stick of death, the Syrinx 52-K is among the best rifles available today." Understand "rifles", "weapon", "weapons", "gun", "guns", "stick of death", "Syrinx" and "52-K" as the laser rifle.

Instead of examining the Aft Airlock when the location is Staging Area: 
	say "You can see the aft airlock through a window in the airlock door[if explosion happened is false]. Beyond the airlock is the gangway back to Space Station Omicron-5[otherwise]. Beyond the airlock is the blackness of space, speckled with the dying embers of what was once Space Station Omicron-5[end if].";
	
The aft ladder is a backdrop. It is in staging area and Junction. "An ordinary metal ladder, it connects the staging area to the crew quarters."

The air scrubber intake is a thing in Staging Area. It is undescribed. It is fixed in place. "This is an aperture through which air is pulled for recycling. Even if you knew how, you wouldn't dare open it for fear of wrecking the air scrubber."

Rule for writing a paragraph about the air scrubber intake:
	say "There is an air scrubber intake in the wall here.";

Instead of going from Staging Area to Aft-Airlock-Room when Aft Airlock Inner Door Broken is true:
	say "You try to enter the airlock, but the automatic door fails to open for you.";
	think "It's always just opened in the past.";
	add fix the airlock door;
	
The inner side of the airlock inner door is in the staging area. It is privately-named. It is scenery. The printed name is "Airlock door". Understand "Airlock" and "door" and "inner" as the inner side of the airlock inner door. "The airlock door is an imposing solid barrier between vacuum and safety. It is colored yellow with red warning symbols on it. Above the door is a panel of electronic components."

The component panel is a thing in the staging area. The description is "dummy description". It is scenery. Understand "electronic" and "components" and "socket" as component panel.

Instead of doing something to the component panel when the player is not on the black trunk:
	say "[The component panel] is too high.";
	
Before doing something when the second noun is the component panel and the player is not on the black trunk:
	say "[The component panel] is too high.";
	stop the action;

Instead of examining the component panel when the player is on the black trunk:
	if the broken sensor is in the room of stuff:
		say "The prominent features of the panel are two optical sensors. One of them has become partially detached and looks broken.";
		add fix the airlock door;
	otherwise if aft airlock inner door broken is true:
		say "One of the two sockets for optical sensors is occupied, the other empty.";
	otherwise:
		say "The prominent features of the panel are two optical sensors. They are both in working order now.";
	
The broken sensor is a thing. The description is "You can tell it's broken because the connecting prongs are too short." Understand "detached" as broken sensor.

After deciding the scope of the player when the location is Staging Area and the player is on the black trunk and the broken sensor is in the room of stuff:
	place the broken sensor in scope;
	
After taking the broken sensor when the broken sensor was in the room of stuff:
	say "You remove the broken sensor from the panel.";
	
Instead of removing the broken sensor from the panel when the broken sensor is in the room of stuff:
	try taking the broken sensor instead;
	
Instead of inserting the optical sensor into the panel when player is on the black trunk:
	now aft airlock inner door broken is false;
	tick off fix the airlock door;
	now the optical sensor is nowhere;
	say "You insert the fresh sensor into the empty socket.";
	think "There. That should do it.";
	
Replacing sensor is an action applying to nothing. Understand "replace the/-- broken/-- optical/-- sensor" as replacing sensor.
Check replacing sensor:
	say "I'm not sure what you're referring to.";
	
Instead of replacing sensor when the black trunk is in the staging area and the player is on the black trunk and aft airlock inner door broken is true and player carries the optical sensor and the broken sensor is in the room of stuff:
	now aft airlock inner door broken is false;
	tick off fix the airlock door;
	now the optical sensor is nowhere;
	say "You remove the broken sensor and insert the fresh sensor into the empty socket.";
	think "There. That should do it.";	
	
The explosion is a backdrop. The description is "Receding behind the SS Usagi, the explosion of Space Station Omicron-5 sadly fades. [think]That's where I lived.[think end]". Understand "debris", "rubble", "embers" as explosion.

A room can be explosion-seeing.
Staging Area, Aft-airlock-room, spacewalk 1, spacewalk 2, and spacewalk 3 are explosion-seeing.
	
Section 15 - Spacewalk

Spacewalk 1, Spacewalk 2, and Spacewalk are offboard and vacuum.

The the you-can-also-see rule response (F) is " [if location is offboard]floating [end if]here".

The printed name of Spacewalk 1 is "Outside the Aft Airlock". The description of Spacewalk 1 is "[if not mag-boots-on]You are floating in the blackness of space outside of the aft airlock.[otherwise]You are standing on the hull of the ship, outside the aft airlock, secured by your vac suit's mag boots.[end if] Most of the hull is taken up by the protrusions of various machinery, antennae, radio dishes, and heat sinks. There is a clear path to fore among the obstructions. You can also go in to the airlock.

A hook protrudes from the hull next to the airlock door.".

The hook 1 is a hook in spacewalk 1. It is privately-named. The printed name is "hook". 
The hook 2 is a hook in spacewalk 2. It is privately-named. The printed name is "hook". 
The hook 3 is a hook in spacewalk 3. It is privately-named. The printed name is "hook".

The printed name of Spacewalk 2 is "Hull of the Usagi". The description of Spacewalk 2 is "Here the path runs aft to the aft airlock and starboard to the engineering airlock. [if broke debris is false]Your path to starboard is blocked by a piece of debris lodged in the hull. [think thought 6] It's going to be tough to get over; it doesn't look magnetic, so your mag boots won't stick to it. You'll need to be careful.[otherwise]Where there used to be a large embedded chunk of debris blocking the path, now there is a scattering of rubble.[end if]

There is a hook set in the hull here.";

The outer hull is a backdrop. It is in spacewalk 1, spacewalk 2, and spacewalk 3. The description is "The hull is covered with all kinds of machinery, antennae, radio dishes, and heat sinks. You should probably leave them alone. Your skills as a mechanic don't extend to specialized spaceship repair."

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
	
Does the player mean climbing the small piece of debris:
	It is very unlikely;
	
Does the player mean climbing the large piece of debris:
	It is very likely;
	
Does the player mean climbing the explosion:
	It is very unlikely;
	
Instead of climbing the small piece of debris:
	Try going starboard;
	
Instead of climbing the large piece of debris:
	Try going starboard;

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

Instead of throwing something when floating is true and mag-boots-on:
	Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you're attached to the hull again.[paragraph break]";
	Think "Oh thank god! I thought I was a goner.";
	now floating is false;
	Now room modifier is "";
	Now got past debris is true;
	now the noun is nowhere;
	deactivate the table of floating hints;
	try looking;
	
Instead of venting when floating is true and mag-boots-on:
	Say "You vent a bit of air from your suit. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you're attached to the hull again.[paragraph break]";
	Think "Oh thank god! I thought I was a goner.";
	now floating is false;
	Now room modifier is "";
	Now got past debris is true;
	deactivate the table of floating hints;
	let VS be a random vac suit worn by the player;
	decrement the remaining air of VS;
	try looking;
	
Instead of throwing something when floating is true and not mag-boots-on:
	if player carries the beacon:
		if ship is in self-destruct mode:
			Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Moments later the ship detonates, but you are far too close. You are vaporized in a wave of roaring Void Matter.";
			increment score;
			now the final result is noble suicide;
			end the story saying "You have died saving New Da Nang.";
		otherwise:
			Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
			now score is 0;
			now the final result is cowardice;
			end the story saying "You have saved yourself in a disgraceful act of cowardice.";
	otherwise:
		Say "You throw [the noun] away from the ship. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. It's a long and lonely way to die.";
		now the final result is pointless death;
		end the story saying "You have died.";
	
Instead of venting when floating is true and not mag-boots-on:
	if player carries the beacon:
		if ship is in self-destruct mode:
			Say "You vent a bit of air from your suit. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Moments later the ship detonates, but you are far too close. You are vaporized in a wave of roaring Void Matter.";
			increment score;
			now the final result is noble suicide;
			end the story saying "You have died saving New Da Nang.";
		otherwise:
			Say "You vent a bit of air from your suit. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
			now score is 0;
			now the final result is cowardice;
			end the story saying "You have saved yourself in a disgraceful act of cowardice.";
	otherwise:
		Say "You vent a bit of air from your suit. It propels you just a tiny amount toward the hull, but it's enough. One agonizing minute later, you realize your mag boots are deactivated. You bounce off the hull and back toward space. It's a long and lonely way to die.";
		now the final result is pointless death;
		end the story saying "You have died.";

The printed name of Spacewalk 3 is "Outside the Engineering Airlock".

Spacewalk 2 is fore from Spacewalk 1.

Spacewalk 3 is starboard from Spacewalk 2. "[if not mag-boots-on]You are floating in the blackness of space outside the engineering airlock.[otherwise]You are standing on the hull of the ship, outside the engineering airlock, secured by your vac suit's mag boots.[end if] Most of the hull is taken up by the protrusions of various machinery, antennae, radio dishes, and heat sinks. There is a clear path to port among the obstructions. You can also go in to the airlock.

A hook protrudes from the hull next to the airlock door.";


Spacewalk 1 is vacuum. Spacewalk 2 is vacuum. Spacewalk 3 is vacuum.
Spacewalk 1 is offboard. Spacewalk 2 is offboard. Spacewalk 3 is offboard.

Farther From Ship is a room.
Farther From Ship is outside from Spacewalk 1 and outside from Spacewalk 2 and outside from Spacewalk 3. "If you're here, you're already dead.".

To decide whether mag-boots-on:
	if the player is not wearing a vac suit:
		decide no;
	let VS be a random vac suit worn by the player;
	let MB be random magnetic boots which are part of VS;
	decide on whether or not MB is switched on;

Instead of going outside when location is an offboard room and destruct in progress is false:
	if mag-boots-on:
		say "The mag boots keep you firmly attached to the hull.";
	otherwise if the player carries the EVA transport line and attachment count > 0 or the location is room-tethered:
		say "You propel yourself away from the ship, but fortunately you are holding the EVA transport line, so you manage to get back to the ship.";
	otherwise:
		if player carries the beacon:
			Say "You propel yourself away from the ship. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
			now score is 0;
			now the final result is cowardice;
			end the story saying "You have saved yourself in a disgraceful act of cowardice.";
		otherwise:
			Say "You propel yourself away from the ship, realizing too late you have no way to get back. You drift through the blackness of space until your air runs out and you suffocate.";
			now the final result is pointless death;
			end the story saying "You have died";
	
Instead of going outside when location is an offboard room and destruct in progress is true:
	end game destruct;
	
To end game destruct:
	if player carries the beacon:
		say "You propel yourself away from the ship, away from the explosion that follows moments later. You switch on your beacon. Hours later, after you'd given up hope, a ship of the Space Marines finds you and brings you home. You are sorry you couldn't save the SS Usagi, but for your part in saving the people of New Da Nang, you receive a medal for meritorious service and are promoted to Lance Corporal.";
		increase score by 2;
		now the final result is lost the ship;
		End the story saying "You saved New Da Nang, but lost the ship.";
	otherwise:
		say "You propel yourself away from the ship, away from the explosion that follows moments later. However, in the blackness of space, there is no way anyone will find you. You float until you run out of air and suffocate.";
		increase score by 1;
		now the final result is noble suicide;
		End the story saying "You died saving New Da Nang.";

Instead of jumping when location is an offboard room:
	if mag-boots-on:
		Say "You can't even begin to jump in these mag boots.";
	otherwise if destruct in progress is true:
		end game destruct;
	otherwise if the player carries the beacon:
		Say "You propel yourself away from the ship. Some hours later a ship, following your beacon, finds you and rescues you. By that time, however, the SS Usagi has slammed into New Da Nang, killing thousands. You can't help but think you might have saved them if you had stayed on the ship.";
		now score is 0;
		now the final result is cowardice;
		end the story saying "You have saved yourself in a disgraceful act of cowardice.";
	otherwise:
		Say "You propel yourself away from the ship, realizing too late you have no way to get back. You drift through the blackness of space until your air runs out and you suffocate.";
		now the final result is pointless death;
		end the story saying "You have died";
	
After going to a room (called R2) when player is wearing vac suit and not mag-boots-on and R2 is offboard:
	if destruct in progress is true: 
		end game destruct;
	otherwise if R2 is room-tethered:
		say "You grab hold of the EVA transport line to keep yourself on the ship. Better turn your mag boots on.";
		tip "If you'd really like to go farther out from the ship, say so with 'out'.";
	otherwise:
		Say "You take a step on the hull of the ship, and keep going, and going... Should have turned those mag boots on.";	
		think "Oops.";
		activate table of vacuum hints;
		now the final result is pointless death;
		End the story saying "You float forever in the vastness of space"; 

Section 16 - Regions

The Interior is a region. The Bridge, operations deck, engineering deck, engine room, machine room, galley, junction, port-side crew quarters, starboard-side crew quarters, captain's quarters, staging area, engineering airlock and Aft-Airlock-Room are in the interior.

Book 14 - Planetfall

To print Planetfall banner text:
	say "PLANETFALL[line break]Infocom interactive fiction - a science fiction story[line break]Copyright (c) 1983 by Infocom, Inc. All rights reserved.[line break]PLANETFALL is a registered trademark of Infocom, Inc.[line break]Release 39 / Serial number 880501";

To print Planetfall intro text:
	say "Another routine day of drudgery aboard the Stellar Patrol Ship Feinstein. This morning’s assignment for a certain lowly Ensign Seventh Class: scrubbing the filthy metal deck at the port end of Level Nine. With your Patrol-issue self-contained multi-purpose all-weather scrub brush you shine the floor with a diligence born of the knowledge that at any moment dreaded Ensign First Class Blather, the bane of your shipboard existence, could appear.";
	
Playing Planetfall is a scene. Playing Planetfall begins when the player is in Deck Nine.
Playing Planetfall ends when the location is not in-planetfall.

Check quitting the game when the location is in-planetfall:
	say "You stop playing Planetfall. Time to save the ship.";
	now the status exit table is Table of Fancy Status;
	now right alignment depth is 14;
	now the player is yourself;
	try looking instead;

A room can be in-planetfall.

The ensign seventh class is a person. It is neuter. It is in Deck Nine.
The ensign seventh class wears the Patrol uniform.
The ensign seventh class wears the chronometer.
The ensign seventh class carries the Patrol-issue self-contained multi-purpose scrub brush.

Table of Planetfall Status
left	central	right
" [Location]"	""	"Score: 0  Time: [chrono reading]"

To start playing Planetfall:
	now status exit table is Table of Planetfall Status;
	now right alignment depth is 20;
	print Planetfall banner text;
	say paragraph break;
	print Planetfall intro text;
	now the player is the ensign seventh class.
	
The Patrol uniform is a wearable thing. The description of the Patrol uniform is "It is a standard-issue one-pocket Stellar Patrol uniform, a miracle of modern technology. It will keep its owner warm in cold climates and cool in warm locales. It provides protection against mild radiation, repels all insects, absorbs sweat, promotes healthy skin tone, and on top of everything else, it is super-comfy.".

The Patrol uniform contains the ID card. The description of the ID card is "'STELLAR PATROL[line break]
Special Assignment Task Force[line break]
ID Number:  6172-531-541'".

To say chrono reading:
	let T be 4475 + (3 * turn count);
	say "[T]";

The chronometer is a wearable thing. The description is "It is a standard wrist chronometer with a digital display. According to the chronometer, the current time is [chrono reading]. The back is engraved with the message 'Good luck in the Patrol! Love, Mom and Dad.'"

Understand "watch" as the chronometer.

Instead of reading the chronometer:
	try examining the chronometer;

The Patrol-issue self-contained multi-purpose scrub brush is a thing.

The brochure is a readable thing. The readable text is "'The leading export of Blow’k-bibben-Gordo is the adventure game[line break][line break]          *** PLANETFALL ***

written by S. Eric Meretzky.[line break]Buy one today. Better yet, buy a thousand.'";

Chapter 1 - Rooms

Deck Nine is a room. "This is a featureless corridor similar to every other corridor on the ship. It curves away to starboard, and a gangway leads up. To port is the entrance to one of the ship’s primary escape pods. The pod bulkhead is closed."
It is in-planetfall.

Instead of going port from Deck Nine:
	say "The escape pod bulkhead is closed.";
	
Instead of opening the escape pod bulkhead:
	say "Why open the door to the emergency escape pod if there’s no emergency?";

Reactor Lobby is starboard of Deck Nine. "The corridor widens here as it nears the main drive area. To starboard is the Ion Reactor that powers the vessel, and aft of here is the Auxiliary Control Room. The corridor continues to port."
It is in-planetfall.

Escape Pod is a room. It is in-planetfall.
The escape pod bulkhead is a door. It is port of Deck Nine and starboard of Escape Pod.

Planetfall Gangway is above Deck Nine. The printed name is "Gangway". It is in-planetfall. "This is a steep metal gangway connecting Deck Eight, above, and Deck Nine, below."

Deck Eight is above Gangway. It is in-planetfall. "This is a featureless corridor leading port and starboard. A gangway leads down, and to fore is the Hyperspatial Jump Machinery Room."

Brig is a room. It is in-planetfall. "You are in the Feinstein’s brig. Graffiti cover the walls. The cell door to the south is locked."

The cell door is a door. The cell door is starboard of brig.

Instead of opening cell door:
	say "No way, Jose.";
	
Instead of going starboard from brig:
	say "The cell door is locked.";
	
The graffiti is scenery in brig. It is readable. 
The readable text is "All the graffiti seem to be about Blather. One of the least obscene items reads:

There once was a krip, name of Blather[line break]
Who told a young Ensign named Smather[line break]
'I’ll make you inherit[line break]
A trotting demerit[line break]
And ship you off to those stinking fawg-infested tar-pools of Krather.'

It’s not a very good limerick, is it?"

The floor is a backdrop. 

When play begins: 
	Move the floor backdrop to all in-planetfall rooms;
	
Instead of rubbing the floor:
	say "The floor is a bit shinier now.";

Chapter 2 - Characters

Section 1 - Blather

Ensign First Class Blather is a man. He is undescribed. The description is "Ensign Blather is a tall, beefy officer with a tremendous, misshapen nose. His uniform is perfect in every respect, and the crease in his trousers could probably slice diamonds in half.".

Blather has a room called last yelling location.
Number of turns in location is a number that varies.

To report blather yelling: 
	if last yelling location of blather is the location:
		say "'I said to return to your post, Ensign Seventh Class!' bellows Blather, turning a deepening shade of crimson.";
	otherwise:
		say "Ensign Blather, his uniform immaculate, enters and notices you are away from your post. 'Twenty demerits, Ensign Seventh Class!' bellows Blather. 'Forty if you’re not back on Deck Nine in five seconds!' He curls his face into a hideous mask of disgust at your unbelievable negligence.";
	now the last yelling location of blather is the location;
	
Every turn when blather is not in the location and the location is Deck Eight:
	now blather is in Deck Eight;
	
Every turn when blather is not in the location and the location is Reactor Lobby:
	now blather is in Reactor Lobby;
	
Every turn when blather is in the location and the location is not Deck Nine:
	if number of turns in location is 4:
		say "Blather loses his last vestige of patience and drags you to the Feinstein’s brig. He throws you in, and the door clangs shut behind you.";
		now the player is in the brig;
	otherwise:
		report blather yelling;
		
Every turn when the location is Deck Nine and the alien Ambassador is not in the location:
	if number of turns in location is 2:
		now the alien ambassador is on deck nine;
		say "The alien ambassador from the planet Blow’k-bibben-Gordo ambles toward you from down the corridor. He is munching on something resembling an enormous stalk of celery, and he leaves a trail of green slime on the deck. He stops nearby, and you wince as a pool of slime begins forming beneath him on your newly-polished deck. The ambassador wheezes loudly and hands you a brochure outlining his planet’s major exports.";
		now the player carries the brochure;
		
		
Every turn when player is in Deck Nine and the Ambassador is in Deck Nine:
	if number of turns in location is 6:
		now the alien ambassador is nowhere;
		say "The ambassador grunts a polite farewell, and disappears up the gangway, leaving a trail of dripping slime.";
	otherwise if turns in location of ambassador > 0:
		say "[one of]The ambassador inquires whether you are interested in a game of Bocci.[or]The ambassador offers you a bit of celery.[or]The ambassador asks where Admiral Smithers can be found.[or]The ambassador introduces himself as Br’gun-te’elkner-ipg’nun.[or]The ambassador asks if you are performing some sort of religious ceremony.[or]The ambassador remarks that all humans look alike to him.[in random order]";

After going a direction when the location is in-planetfall:
	now the number of turns in location is 0;
	continue the action;

Every turn when the location is in-planetfall:
	increment the number of turns in location;
	
Instead of going nowhere when Blather is in the location:
	say "[one of]Ensign Blather blocks your way, snarling angrily.[or]Ensign Blather pushes you roughly back toward your post.[or]Blather throws you to the deck and makes you do 20 push-ups.[purely at random]";
	
Every turn when number of turns in location is 9 and the location is in-planetfall:
	say "A massive explosion rocks the ship. Echoes from the explosion resound deafeningly down the halls.[if player is in deck nine] The door to port slides open.[end if][if the ambassador is in the location] The ambassador squawks frantically, evacuates a massive load of gooey slime, and rushes away.[end if]";
	say paragraph break;
	think "No, no, no. This is hitting too close to home. Better quit and focus on saving the ship.";
	now the player is yourself;
	now right alignment depth is 14;
	now the status exit table is Table of Fancy Status;
	try looking;
	
Instead of examining ensign seventh class:
	say "That's difficult unless your eyes are prehensile.";
	
Instead of attacking Blather:
	say "Blather removes several of your appendages and internal organs.[line break][line break]    ****  You have died  ****[paragraph break]";
	think "Ouch. I hope that's not prescient.";
	try quitting the game;
	

Section 2 - Ambassador

The alien ambassador is a man. The alien ambassador has a number called turns in location. The alien ambassador is undescribed.
The description is "The ambassador has around twenty eyes, seven of which are currently open. Half of his six legs are retracted. Green slime oozes from multiple orifices in his scaly skin. He speaks through a mechanical translator slung around his neck.".

Every turn when the alien ambassador is in deck nine and the player is in deck nine:
	increment turns in location of alien ambassador;

Slime is a thing in Deck Nine. It is undescribed.

Instead of doing something to the slime when the ambassador has not been in deck nine:
	say "What slime?";

Instead of taking, touching the slime when the ambassador has been in deck nine:
	say "It feels like slime. Aren't you glad you didn't step in it?";

Instead of examining the slime when the ambassador has been in deck nine:
	say "It looks like slime. Aren't you glad you didn't step in it?";

Instead of smelling the slime when the ambassador has been in deck nine:
	say "It smells like slime. Aren't you glad you didn't step in it?";

Instead of rubbing the slime when the ambassador has been in deck nine:
	say "Whew. You’ve cleaned up maybe one ten-thousandth of the slime. If you hurry, it might be all cleaned up before Ensign Blather gets here.";
	
Instead of attacking the ambassador:
	say "The ambassador is startled, and emits an amazing quantity of slime which spreads across the section of the deck you just polished.";
	
Instead of saying hello to the ambassador:
	say "The ambassador taps his translator, and then touches his center knee to his left ear (the Blow’k-bibben-Gordoan equivalent of shrugging).";
	
Book 15 - The Plot

Chapter 1 - Scenes

Boarding the Ship is a scene.
Boarding the Ship begins when play begins.

Explosion happened is a truth state that varies.
Boarding the Ship ends when Explosion happened is true.

Crashing is a scene.

Chapter 2 - Flags

computer-rebooted is a truth-state that varies.
protocols-activated is a truth-state that varies.

Chapter 3 - Opening Moves

Before looking for the second time:
	say "[line break]The Second Law of Thermodynamics, in one formulation, states that disorganization always increases in the absence of some outside force. A corollary is that things will always break down in the absence of someone to fix them. As a member of the repair corps of Space Station Omicron-5, you're that someone. 
	
	Your last assignment of the day, on the SS Usagi, a Space Marines fighting ship, looks routine enough. Fix the microwave and a jammed locker door, and then you're off for the day.";

Section 1 - Moving through the Aft Airlock

mistakes in aft airlock is a number that varies.
	
Check going aft when location is Aft-Airlock-Room during Boarding the Ship:
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in aft airlock;
	if mistakes in aft airlock is 3:
		say line break;
		tip "Try going in: enter 'in'.";
	stop the action;
	
Check going outside when location is Aft-Airlock-Room during Boarding the Ship:
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in aft airlock;
	if mistakes in aft airlock is 3:
		say line break;
		tip "Try going in: enter 'in'.";
	stop the action;
	
Before going fore when location is Aft-Airlock-Room during Boarding the Ship:
	say "You enter the ship from the airlock. The inner door closes behind you.";
	
Before going inside when location is Aft-Airlock-Room during Boarding the Ship:
	say "You enter the ship from the airlock. The inner door closes behind you.";
	
Instead of going nowhere when location is Aft-Airlock-Room during Boarding the Ship:
	tip "Try going in: enter 'in'.";

Section 2 - Moving through the The Staging Area

mistakes in Staging Area is a number that varies.
	
Check going aft when location is Staging Area during Boarding the Ship:
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in Staging Area;
	if mistakes in Staging Area is 3:
		say line break;
		tip "Try going up: enter 'u'.";
	stop the action;
	
Check going outside when location is Staging Area during Boarding the Ship:
	say "Your work is [italic type]in[roman type] the ship, not outside.";
	increment mistakes in Staging Area;
	if mistakes in Staging Area is 3:
		say line break;
		tip "Try going up: enter 'u'.";
	stop the action;
	
Instead of going nowhere when location is Staging Area during Boarding the Ship:
	tip "Try going up: enter 'u'.";
	
Instead of taking a vac suit during Boarding the Ship:
	say "In general, the crew's gear is off-limits.";
	
Attention All Crew Spoken is a truth state that varies.
Explosion Turn is a number that varies.
				
Instead of going up when location is Staging Area during Boarding the Ship:
	say "You climb the la--[paragraph break]";
	say "***BOOM***";
	say "[paragraph break]Press any key...";
	if DEBUG is false:
		wait for any key;
	say "[line break]A gigantic force grabs the ship, knocking you off the ladder and sending you flying against an aft bulkhead. The inertial dampers are probably all that saved you from being smashed to jelly rather than just banged up. ";
	say "[paragraph break]Press any key...";
	if DEBUG is false:
		wait for any key;
	say "[line break]Some time later you find yourself lying on the floor of the staging area with a throbbing headache. Gingerly you push yourself to your knees and stand up. The vac suit locker has detached from its mounting and slammed into the airlock door. 
	
	[think]Thank god I wasn't in the way of that.[run paragraph on][think end]

	Looking outside --
	
	[think]Holy -- [think end]
	
	[think]Where's the station?[run paragraph on][think end].
	
	Where Space Station Omicron-5 was, is now an expanding sphere of rubble, dimly lit by the blue light of far-off Deneb. The rubble is clearly receding behind the ship. [think]We're moving![run paragraph on][think end]
	
	[think]How am I going to get off this ship?[run paragraph on][think end]";
	Now Explosion Happened is true;
	Now suit locker 1 is nowhere;
	Now suit locker 2 is in Staging Area;
	Now every vac suit that is in Staging Area is not undescribed;
	say "[paragraph break]Press any key...";
	if DEBUG is false:
		wait for any key;
	say line break;
	say banner text;
	let VS be a random vac suit that is in Staging Area;
	now the current stuck thing of the chewing gum is VS;
	now the chewing gum is not currently chewed;
	now the chewing gum is in the room of stuff;
	try looking;
	think "What now?";
	now the description of the gangway-backdrop is "The gangway is gone, with the rest of Space Station Omicron-5.";
	now the description of the space station omicron-5 is "The space station is now just an expanding cloud of debris, receding behind the ship.";
	now explosion is familiar;
	think "I think I spit out my gum.";
[	if the player wears the repair corps uniform:	
		now the current stuck thing of the chewing gum is the repair corps uniform;
		now the chewing gum is not currently chewed;
		now the chewing gum is in the room of stuff;
	otherwise:
		now the chewing gum is in the staging area;
		now the chewing gum is not currently chewed;]
	now Aft Airlock Inner Door Broken is true;
	move the explosion backdrop to all explosion-seeing rooms;
	Activate the table of beginning hints;
	Now the fusion engine is broken;
	Now the explosion turn is -2;
	
Every turn when explosion happened is true and computer-rebooted is false and protocols-activated is false:
	Increment explosion turn;
	if the remainder after dividing explosion turn by 10 is 0 and location is onboard:
		print "Attention all crew: command functions are offline and the computer is running with decreased capabilities. Full system reboot required.[line break]" as computer near player;
		now attention all crew spoken is true;
	continue the action;
	
Chapter 4 - Last Moves

every turn while last-moves is true and location is bridge:
	say "The moon of New Da Nang looms ever larger on the forward viewscreen.";

command mode activated is a truth state that varies.

Instead of touching the command console when last-moves is true:
	print "Welcome, Captain. What are your orders?" as shipboard computer near captain's chair;
	now command mode activated is true;

executing is an action applying to nothing. Understand "execute" as executing.

Persuasion rule when asking the shipboard computer to try executing when location is bridge and command mode activated is true:
	now last-moves is false;
	print "Yes, Captain. Executing evasive maneuvers.[paragraph break]" as shipboard computer near captain's chair;
	say "The ship pulls out of its dive toward New Da Nang, delivering a g-force that forces the breath out of you despite the intertial dampers. Soon you are turned around and headed for open space.";
	print "Diverting communications to the bridge.[line break]" as shipboard computer near captain's chair;
	say "[line break]Arvax comes over comms: 'Directing SS Usagi to Deneb III. Rendezvous with retrieval crew in approximately twenty-eight minutes.
	
	'Sergeant Screwdriver, this couldn't have happened without you. You deserve to be a hero on New Da Nang, but unfortunately we need to keep
	this incident secret, as will no doubt be emphasized at your debriefing.
	
	'You are to be especially commended for your judgment in determining the correct course of action when presented with a difficult
	choice. We have determined that Captain Mulgrew has been working with the separatists and was involved in the Omicron-5 bombing.
	She has been apprehended and will face the most severe justice permitted by the Space Authority.
	
	'Now, soldier, time to relax. The crew will be there soon to pick you up.'
	
	You relax in the captain's chair and reflect on your accomplishment. At the end of the day, you can barely sleep, as the newest member of the 95th Mechanical Division Special Maintenance Force. Adventure at last!";
	increase score by 3;
	now the final result is win;
	End the story finally saying "You have saved New Da Nang, the SS Usagi, and yourself!";

	
Book 16 - Contraptions and Puzzles

Chapter 1 - Fuel Mixing Puzzle

A substance has a text called symbol. A substance can be inputtable.
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
	say line break;
	tip "Use 'substance > input' to set each input. For instance, 'Un > 3' sets input 3 to Unobtainium. You may also use 'set <input> to <substance>' for the same effect. Use 'disconnect <input>' to disconnect an input.";
		
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
	say "The possible inputs are Anti-Helium, Oganesson, Red Matter, Tachyon Crystals, and Unobtainium. There are two additional possible outputs: Liquid Copernicium and Void Matter.";
	say line break;
	tip "Use 'substance > input' to set each input. For instance, 'Un > 3' sets input 3 to Unobtainium. You may also use 'set <input> to <substance>' for the same effect. Use 'disconnect <input>' to disconnect an input.";
	
	

Empty-space is a substance. The symbol is "--". 
Void Matter is a substance. The symbol is "VM". Understand "VM" as Void Matter.
Oganesson is a substance. The symbol is "Og". Understand "Og" as Oganesson. Oganesson is inputtable.
Unobtainium is a substance. The symbol is "Un". Understand "Un" and "unobtanium" as Unobtainium. Unobtainium is inputtable.
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
	
Check inputting a substance into an input when the location is not the engine room (this is the can't input substance outside of the engine room rule):
	say "You need to be in the engine room to adjust the fuel injection." instead;
	
Check inputting a substance into an input when engine diagram is not rebooted:
	say "The engine diagram is not on." instead;
	
Check inputting a substance into an input when engine diagram is rebooted:
	if noun is not inputtable:
		say "There is no input for that substance." instead;
	
Carry out inputting a substance (called S) into an input (called I) when engine diagram is rebooted:
	set key I of Engine Inputs to S;
	calculate products;
	if engine output is liquid copernicium:
		tick off adjust fuel injection specification;

After inputting when engine diagram is rebooted:
	try examining engine diagram;
	make no decision;
	
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
	
Book 17 - Technical Details

The parser nothing error internal rule response (B) is "But you don't see anything.".

When play begins:
	Repeat with X running through all things which are not backdrops:
		If X is nowhere:
			now X is in the room of stuff;
			
Rule for reaching inside the Room of Stuff: allow access;

understand the command "a" as something new. Understand "a" as aft;

Check an actor entering (this is the new implicitly pass through other barriers rule):
	if the holder of the actor is the holder of the noun, continue the action;
	let the local ceiling be the common ancestor of the actor with the noun;
	while the local ceiling is not a container and the local ceiling is not a supporter and the local ceiling is not a room:
		now the local ceiling is the holder of the local ceiling;
	while the holder of the actor is not the local ceiling:
		let the current home be the holder of the actor;
		if the player is the actor:
			if the current home is a supporter or the current home is an animal:
				say "(getting off [the current home])[command clarification break]" (A);
			otherwise:
				say "(getting out of [the current home])[command clarification break]" (B);
		silently try the actor trying exiting;
		if the holder of the actor is the current home, stop the action;
	if the holder of the actor is the noun, stop the action;
	if the holder of the actor is the holder of the noun, continue the action;
	let the target be the holder of the noun;
	if the noun is part of the target, let the target be the holder of the target;
	while the target is a thing:
		if the holder of the target is the local ceiling:
			if the player is the actor:
				if the target is a supporter:
					say "(getting onto [the target])[command clarification break]" (C);
				otherwise if the target is a container:
					say "(getting into [the target])[command clarification break]" (D);
				otherwise:
					say "(entering [the target])[command clarification break]" (E);
			silently try the actor trying entering the target;
			if the holder of the actor is not the target, stop the action;
			convert to the entering action on the noun;
			continue the action;
		let the target be the holder of the target;
		
The new implicitly pass through other barriers rule is listed instead of the implicitly pass through other barriers rule in the check entering rules.



Book 18 - Help


Helping with speech is an action out of world. Understand "help speech" as helping with speech.
Helping with scoring is an action out of world. Understand "help scoring" as helping with scoring.
Helping with commands is an action out of world. Understand "help commands" as helping with commands.
Helping with movement is an action out of world. Understand "help movement" as helping with movement.
Helping with interactive fiction is an action out of world. Understand "help IF" as helping with interactive fiction.

Carry out helping:
	say "Welcome to [the story title] by [the story author].
	
	Help is broken up into a number of sections:
	[line break][line break]
	- [bold type]help IF[roman type]: help with interactive fiction in general; how to get along with the parser.[line break]
	- [bold type]help movement[roman type]: help with nautical directions as used in this story.[line break]
	- [bold type]help commands[roman type]: a list of commands available in this story.[line break]
	- [bold type]help speech[roman type]: how to talk to characters.[line break]
	- [bold type]help scoring[roman type]: a description of how scoring works in this story.[line break]
	";
	
Carry out helping with interactive fiction:
	say "Text adventures (also known as interactive fiction) come in a number of flavors. This game (or story) is played by typing commands to which the game world reacts. 
	
	For instance, the game might tell you there's a doll on the shelf, and you might respond by saying 'take the doll from the shelf', to which the game might say 'Your little niece Annie sees the doll and says [']Dolly! There she is![']'. You might then type 'give the doll to annie', and so on.
	
	Of course, the story can't understand just anything you type. Generally, commands come in a few forms:
	[line break][line break]
	- one word, like 'north', to move the player north.[line break]
	- a verb and a noun, like 'get football', to tell the story to pick up a football that's in the vicinity.[line break]
	- a verb and two nouns, like 'open the cellar door with the iron key', to unlock a door.
	
	Similarly, the story can only understand certain words. The nouns you can use will generally be apparent from what you discover during play. The set of verbs you can use is more difficult to determine. Some verbs common to most stories are:
	[line break][line break]
	- [bold type]get/take[roman type] and [bold type]drop[roman type][line break]
	- [bold type]open[roman type] and [bold type]close[roman type][line break]
	- [bold type]ask[roman type] and [bold type]tell[roman type][line break]
	- [bold type]wear[roman type] and [bold type]take off[roman type][line break]
	- [bold type]eat[roman type] and [bold type]drink[roman type][line break]
	- [bold type]enter[roman type] and [bold type]exit[roman type][line break]
	- [bold type]give[roman type][line break]
	- [bold type]insert[roman type] something [bold type]into[roman type] something else
	
	There are a few commands that are used so much they have special abbreviations:
	[line break][line break]
	- [bold type]look[roman type], abbreviated [bold type]l[roman type], repeats the description of the player's surroundings.[line break]
	- [bold type]examine[roman type], abbreviated [bold type]x[roman type], yields a close-up description of an object.[line break]
	- [bold type]inventory[roman type], abbreviated [bold type]i[roman type], lists the objects the player is carrying.[line break]
	- [bold type]wait[roman type], abbreviated [bold type]z[roman type], causes a turn to pass without the player doing anything.[line break]
		";

Carry out helping with movement:
	say "This story, as it takes place on a spaceship, uses nautical directions. These are: fore, aft, port, starboard, up, down, in, and out. (abbreviated 'f', 'a', 'p', 's', 'u', 'd', 'in', and 'out')
		
	[italic type]Fore[roman type] is the direction towards the front of the ship, that is, the usual direction of travel. [italic type]Aft[roman type] is the opposite of fore. [italic type]Port[roman type] is the direction to your left when you're facing fore. [Italic type]Starboard[roman type] is the opposite of port. You can remember port from starboard by remembering that 'port' and 'left' have the same number of letters.
	
	[Italic type]Up[roman type] and [italic type]down[roman type] are relative to the shipboard artificial gravity. This gravity doesn't extend beyond the hull. Instead, outside we have the radial directions [italic type]in[roman type] (toward the center of mass of the ship) and [italic type]out[roman type] (away from the center of mass).
	
	Out and In can also refer to entering and exiting the ship and airlocks.";
	
Carry out helping with scoring:
	say "This game has a number of different endings, some of them happy, some of them not. They all come with a score.
	
	Some of the score you earn depends on the ending you reach, but some of it comes from doing your job. You're a member of the 
	repair corps, so you need to repair things. Everything you fix earns you a point.
	
	There is a maximum score of [maximum score], earned by fixing everything broken on the ship and reaching the most satisfactory ending.";

Carry out helping with commands:
	say "Here are some verbs available in this game that might come in handy: 
	[line break][line break]
	- [bold type]clean[roman type][line break] 
	- [bold type]chew[roman type][line break]
	- [bold type]disconnect[roman type][line break]
	- [bold type]fix/repair[roman type][line break]
	- [bold type]plug in[roman type][line break]
	- [bold type]slide/swipe (through/in a slot)[roman type][line break]
	- [bold type]spit out[roman type][line break]
	- [bold type]stick (something) to[roman type][line break]
	- [bold type]type[roman type][line break]
	- [bold type]unbolt[roman type][line break]
	- [bold type]unplug[roman type][line break]
	- [bold type]vacuum[roman type][line break]
	- [bold type]vent[roman type][line break]
	
	A note on fixing things: you don't need to fiddle with screwdrivers and screws. Instead, say what you mean.";
	
Carry out helping with speech:
	say "There are a few commands that allow you to talk to other characters you meet. These are:
	[line break][line break]
	- [bold type]hello[roman type]: to start talking to someone.[line break]
	- [bold type]ask <someone> about <something>[roman type]: ask the character to tell you what it knows about a thing.[line break]
	- [bold type]goodbye[roman type]: to stop talking to someone.[line break]
	- [bold type]tell <someone> about <something>[roman type]: tell the character what you know about a thing.[line break]
	- [bold type]yes[roman type][line break]
	- [bold type]no[roman type]
	
	Note: you cannot talk or ask about a subject with which you are unfamiliar. Thus you cannot get an answer to 'ask Frank about Sophie' unless you are aware of Sophie's existence.
	
	To ask a person or thing to do something use the following pattern: '<name>, <action>', for instance, 'computer, help.'
	
	One useful command is '<name>, repeat', which will cause the named person or thing to repeat the last thing they said, if anything. You can also say '<name>, repeat all', which will cause them to repeat an entire transcript of their speech.";	
	
Book 19 - Hints

Hints tipped is a truth state that varies.

After printing the locale description of Junction when hints tipped is false:
	tip "You can enter 'hints' at any time for help in progressing in the game.";
	now hints tipped is true;

Table of Potential Hints (continued)
title	subtable
"How do I avoid being knocked unconscious?"	Table of Beginning Hints
"How do I fix the microwave oven?"	Table of Microwave Hints
"How do I fix the equipment cabinet?"	Table of cabinet hints
"How do I open the storage unit?"	Table of open unit hints
"How do I fix the storage unit?"	Table of fix unit hints
"How do I fix the airlock door?"	Table of airlock door hints
"How do I fix the captain's door?"	Table of captain door hints
"How do I access the captain's journal?"	Table of journal hints
"Why do I die when I try to go outside?"	Table of vacuum hints
"Help! I'm floating!"	Table of floating hints
"How do I recharge the vac suit's air?"	Table of recharge hints
"Whom should I trust, Arvax or Mulgrew?"	Table of Trust hints
"How do I use the shipboard computer?"	Table of Computer hints
"How do I destroy the ship?"	Table of Self-destruct hints
"How do I save the ship?"	Table of winning hints
"What's wrong with the helm?"	Table of Helm Hints Protocols
"How do I set the fuel injection?"	Table of Fuel Injection Hints
"How do I fix the engine?"	Table of Engine Hints
"How do I move the engine stabilizer?"	Table of Moving Engine Hints
"Can I survive blowing up the ship?"	Table of Surviving Self-destruction Hints
"How do I get past the midship door?"	Table of Midship Door Hints

Table of Beginning Hints
hint	used (a number)
"Have you tried not boarding the ship?"		
"Try doing something different once you're on the ship."	
"Just don't type anything."
"You can't."

Table of Microwave Hints
hint	used (a number)
"Have you examined the microwave yet?"	
"Have you tried turning it off and on again?"	
"Okay, not quite that easy, but almost."	
"But first, you'll have to get to the other side of the ship."	
"You'll want to examine the socket up close."	

Table of cabinet hints
hint	used (a number)
"You might want to look at this problem from a different perspective."	

Table of open unit hints
hint	used (a number)
"The code must be around here somewhere."	
"Or you could just try typing randomly."	
"Did something interesting happen? If not, try the storage unit in the other room."	
"Okay, so the bottom drawer is half-open. Got any ideas how to open it the rest of the way?"	
"Maybe you could pry it open. If you just had the right item..."	
"There's a knife in the galley drawer that'll work nicely."	

Table of fix unit hints
hint	used (a number)
"Yeah, you broke it, now you've gotta fix it."	
"Spoiler: it has to do with the keyhole on the keypad. You did examine it, right?"	
"Don't come back until you have the key."	
"Okay, you got the key, now open it."	
"Tell me you got the electrical tape when you picked up the key..."

Table of airlock door hints
hint	used (a number)
"So the airlock door won't open. Have you examined the door yet?"	
"I guess you can't reach the panel, eh?"	
"Is there something you can stand on?"	
"It might be somewhere else."	
"Look under the bed in the starboard-side crew quarters."	
"Okay, the sensor is busted. Where do you get a new one?"	
"Have you opened the trunk yet?"	
"There must be some new optical sensors in here somewhere."	
"Examine Bertie the Bear™."
"Don't be squeamish. Take his eyes."
	
Table of captain door hints
hint	used (a number)
"Look around for something that will allow us to work on the door."	
"Open the panel."	
"Looks like we need a new fuse. Have you found one?"	
"Okay great, you found a fuse and replaced the old one. Now close the panel."	
"Butter fingers. But that's okay because you have lots of screws in your toolbox."	
"None of them fit, dang. But maybe you can make one fit."		
"Stick the chewing gum into the hole."

Table of journal hints
hint	used (a number)
"There are clues in the room as to the password."	
"Like the dog and the moon."	
"Think moon and Pluto."	
"The password is Charon, the largest moon of Pluto."		

Table of Vacuum Hints
hint	used (a number)
"First, you need a vac suit."		
"Second, you need to activate your mag boots before leaving the airlock."	

Table of Floating Hints
hint	used (a number)
"You can't just float back to the ship."	
"You need Newton's Third Law."	
"'For every action, there is an equal and opposite reaction.'"	
"If you want to go [italic type]toward[roman type] the ship, something else needs to go [italic type]away[roman type] from the ship."	
"How about throwing something?"	
"Throwing something you won't need again, that is."	
"Or you could vent some air from the vac suit"

Table of Recharge Hints
hint	used (a number)	
"There's a vac suit recharging station just sitting in engineering deck!"	

Table of Trust Hints
hint	used (a number)
"Ooh... that's a hard one."	
"You could compare their answers to questions."	
"You could verify their answers with the shipboard computer."	
"Is either of them particularly concerned or unconcerned about your well-being?"	
"Maybe you could investigate one of them. Who's easier to investigate at the moment?"	

Table of Computer Hints
hint	used (a number)	
"You can access the computer from anywhere on board the ship."	
"Try 'computer, help' for further instructions."	
"Some information and operations are only accessible when you have the right access codes. Get them from Arvax and/or Mulgrew."	

Table of Self-destruct Hints
hint	used (a number)
"The ship self-destruct sequence is guarded by hand-print access through the captain's command console on the bridge. There's no way you can get past that."	
"You can make the ship blow up by feeding the wrong fuel into the fusion engine."	
"Check out the engine diagram in the engine room."	
"The engine will explode if you supply it with Void Matter."	
"You can consult the ship's computer to learn about Void Matter and how you can create it and other substances."	
"You can create void matter by setting Input 1 to Unobtainium, Input 2 to Tachyon Crystals, Input 3 to Anti-Helium, and Input 4 to Tachyon Crystals."	
"Press the test button to start the countdown to destroy the ship."	



Table of Winning Hints
hint	used (a number)
"To save the ship, first you need to reboot it."	
"If you invoke the emergency protocols, you cannot save the ship, only destroy it."	
"As Arvax will tell you, there are two things you must do:"	
"Set the correct fuel injection configuration."	
"Fix the engine."	
"Each of these have their own hints."

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
"The shipboard computer can tell you how to create all of the different substances, which can help you make Liquid Copernicium, the correct fuel."	
"Set Input 1 to Oganesson, Input 2 to Anti-Helium, Input 3 to Tachyon Crystals, and Input 4 to Oganesson."	

Table of Engine Hints
hint	used (a number)
"The engine stabilizer has burned up. You need to replace it."	
"To do that you need another."	
"How about the big engine part in the staging area?"	
"Move it into this room, and then you can slide it in as a replacement."

Table of Moving Engine Hints
hint	used (a number)
"The engine cannot be lifted or moved. It's too heavy."	
"Can you make it lighter?"	
"This will sound crazy, but how about manipulating gravity?"	
"There's an artificial gravity control on the environmental console."	
"Now you can push it, hooray! But how do you get it to the engine room?"	
"You can't push it up the ladder, so you'll have to go outside instead."	
"To do that, you'll need some way of keeping the stabilizer under control (or stable, if you will.)"	
"Look in the vac suit locker for some help."	
"You'll need to turn the locker over first."
"Attach the EVA transport line to the hooks outside."
"Then push the engine stabilizer along the EVA transport line."	

Table of Surviving Self-destruction Hints
hint	used (a number)
"I would suggest getting off the ship before it explodes."	
"Well, you need the vac suit, and it needs to be recharged."	
"You also need some way for people to find you floating in space."	
"Look for the beacon in the starboard-side locker."

Table of Midship Door Hints
hint	used (a number)
"No, there isn't a person standing on the door."	
"But there is *something* on the door."	
"You're going to have to move it."	
"So you'll have to get to the other side of the door."	

Book 20 - About

abouting is an action out of world. Understand "about" and "credits" as abouting.

Carry out abouting:
	say banner text;
	say the list of extension credits;
	say paragraph break;
	say "Thanks for great playtesting goes to: Garry Warrick, Mike Russo, Peter Gross, Drew Cook, Stu Dobbie, and Jade.";
	say "Special thanks to Laura Taalman for so many great ideas and improvements.";

Book 21 - Not for Release

DEBUG is true.

When play begins:
	if DEBUG is true:
		Now Arvax's security code is 2;
		Now Mulgrew's security code is 3;
		
[include property checking by emily short;]
		
Show blank subjects is always false.

When play begins:
	If Show blank subjects is true:
		Repeat with S running through subjects:
			if there is a dt-subject of S in the Table of computer Subjects:
				do nothing;
			otherwise:
				say "[S] has no entry in the Table of Computer Subjects.";
				
Show blank things is always false.

When play begins:
	If Show blank things is true:
		Repeat with S running through things:
			if there is a dt-subject of S in the Table of computer Subjects:
				do nothing;
			otherwise:
				say "[S] has no entry in the Table of Computer Subjects.";
				
ShowPrePostReportStack is always false.

Understand "* [text]" as a mistake ("Noted.").

The special vac suit is a vac suit.

suiting up is an action out of world. Understand "suit up" as suiting up.
Carry out suiting up:
	Now the player carries the special vac suit;
	Now the player wears the special vac suit;
	
fixing the drawer is an action out of world. Understand "fix drawer" as fixing the drawer.
Carry out fixing the drawer:
	now the port-side storage unit is storage-fixed;
	
Setting gravity to is an action applying to one number. Understand "set gravity to [number]" as setting gravity to.

Carry out setting gravity to a number (called N):
	now gravity is N;
	
Report setting gravity to:
	Say "You got it. Physics has been changed at your whim.";
	
Refilling is an action applying to nothing. Understand "refill" as refilling.
Carry out refilling:
	let VS be a random vac suit worn by the player;
	now the remaining air of VS is 1000;
	
planetfalling is an action out of world. Understand "pf" as planetfalling.
Carry out planetfalling:
	start playing planetfall;

Test airlock with "f/f/u/a/u/s/take slippers/look under bed/get trunk/open it/take present/open it/take eyes/p/d/drop trunk/stand on trunk/take broken sensor/put optical sensor in panel".

test spacewalk with "test airlock/take suit/wear it/turn on mag boots/a/out/out/f/s/vent air/s/in/p/sit in recharger"

test microwave with "test spacewalk/p/open drawer/take all/s/f/move trunk/set gravity control to 1/press button/d/open drawer/take knife/open closet/take dinner/unplug microwave/vacuum socket/plug in microwave"

test cabinet with "test microwave/a/s/get on top bunk/replace screw".

test storage with "test cabinet/get down/open cabinet/take beacon/p/p/open cabinet/x uniform/take paper/read it/take Universal Game Emulator/x unit/type 9467 on keypad/pry bottom drawer open with knife/take card/close drawer/put key into keyhole/tape wires/close bottom drawer/type 9467 on keypad/take planetfall".

test planetfall with "test storage/play planetfall on universal/z/z/z/z/z/z/z/z/z";

test staging with "test planetfall/s/d/turn locker/open locker".

test tether with "test staging/a/out/tie EVA transport line to hook/f/tie EVA transport line to hook/s/tie EVA transport line to hook/p/a/in/in/turn off boots/push jl-758 aft/push jl-758 aft/push jl-758 aft/push jl-758 fore/push jl-758 starboard/push jl-758 in/push jl-758 in/push jl-758 aft".

test captain with "test tether/f/f/d/a/open door with red card/x panel/open panel/take blown fuse/put fuse in panel/close panel/close panel/x panel/put gum in hole/close panel/open door with red card/a/open drawer/take journal/read it/journal, password walrus/journal, password charon/read journal".

test arvax with "test captain/f/f/u/z/hello/hello/tell arvax about journal".

test reboot with "test arvax/computer, access code 2/computer, reboot/z/z/z/z".

test fuel with "test reboot/ask arvax about ship/a/a/x diagram/ask computer about liquid/og > 4/ask computer about red matter/TC > 3/ask computer about unobtainium/ah > 2/og > 1"; 

test win with "test fuel/f/f/ask arvax about ship/f/touch command console/computer, execute"

test protocols with "test arvax/computer, access code 3/computer, emergency protocols"

test explode with "test protocols/ask arvax about ship/f/open helm panel with hex-shaped tool/x panel/open it/a/tell arvax about helm/ask arvax about ship/a/a/x diagram/ask computer about void matter/tc > 4/ask computer about tc/ah > 3/ask computer about rm/un > 1/tc > 2/press test".

test nobly with "test explode/z/z/z/z/z/z/z/z/z/z".

test escape with "test explode/f/s/out".

test walkthrough with "f/f/u/wear vac suit/u/p/open cabinet/x engineering uniform/read paper/type 9467 on keypad/read list/x storage unit/open bottom drawer/x universal game emulator/s/s/read note/take slippers/look under bed/open trunk/open present/x bear/x eyes/take eyes/take trunk/p/d/drop trunk/a/x door/x panel/stand on trunk/x panel/take broken sensor/put new sensor in panel/a/a/turn on boots/a/f/s/x suit/vent suit/s/in/in/sit in chair/f/hello/hello/ask arvax about mulgrew/ask mulgrew about dalmatian/computer, access code 2/ask computer about dalmatian/a/p/take vac/open drawer/take all/s/a/x engine/f/f/push trunk/press blue button/d/x microwave/unplug microwave/x socket/vacuum socket/plug in microwave/open drawer/take knife/a/p/x unit/open bottom drawer/open bottom drawer with knife/take card/close bottom drawer/x unit/x keypad/open keypad with key/tape wires/s/a/open door with card/x door/open panel/take blown fuse/put fresh fuse in panel/close panel/close panel/put gum in hole/close panel/open door with card/a/x desk/x dog/x moon/open drawer/take journal/read it/journal, password walrus/ask computer about pluto/journal, password charon/read diary/f/s/get on bed/x cabinet/replace screw/p/f/u/set gravity control to 1/jump/d/a/d/x engine part/x cord/x locker/push it/open it/a/a/attach line to hook/f/attach line to hook/s/attach line to hook/p/a/in/in/push engine a/g/push engine f/push it s/push it in/push it p/push engine a/read list/computer, reboot/f/f/ask arvax about ship/z/z/ask arvax about ship/a/a/x diagram/ask computer about LC/Og > 4/ask computer about RM/TC > 3/ask computer about Un/AH > 2/Og > 1/f/f/f/x command console/touch it/computer, execute".