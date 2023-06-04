Nautical Directions by Philip Riley begins here.


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


The fore is a direction.
The aft is a direction.
The port is a direction.
The starboard is a direction.

The up is a direction.
The down is a direction.
The inside is a direction.
The outside is a direction.

Fore has opposite aft. Understand "f" as fore. Understand "forwards" as fore.
Aft has opposite fore. Understand "a", "back" as aft.
Port has opposite starboard. Understand "p", "pt" as port.
Starboard has opposite port. Understand "s", "sb" as starboard.

[per original]
Up has opposite down. Understand "u" as up.
Down has opposite up. Understand "d" as down.
Inside has opposite outside. Understand "in" as inside.
Outside has opposite inside. Understand "out" as outside.

The inside object translates into I6 as "in_obj".
The outside object translates into I6 as "out_obj".

The verb to be above means the reversed mapping up relation.
The verb to be mapped above means the reversed mapping up relation.
The verb to be below means the reversed mapping down relation.
The verb to be mapped below means the reversed mapping down relation.
	
To say direction term for (D - a direction):
	if D is fore:
		say "forward";
	otherwise:
		say D;


Nautical Directions ends here.
