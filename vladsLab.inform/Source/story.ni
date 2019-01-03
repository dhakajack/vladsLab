The story title is "Лаборатия Влада". 

The story author is "Джекa Уэлчa". [in genitive]

The story headline is "Интерактивная Литература".

Chapter 1 - Compiler Directives

Use MAX_STATIC_DATA of 250000.

Chapter 2 - Vorple Set Up

Include Vorple  by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Chapter 3 - Lower Level Tweakage

Include (-

Constant AGAIN1__WD     = 'snova';
Constant AGAIN2__WD     = 'e//';
Constant AGAIN3__WD     = 'opyat&';

Constant OOPS1__WD      = 'oj';
Constant OOPS2__WD      = 'okh';
Constant OOPS3__WD      = 'oj';
Constant UNDO1__WD      = 'otmena';
Constant UNDO2__WD      = 'otmena';
Constant UNDO3__WD      = 'otkat';

Constant ALL1__WD       = 'vse';
Constant ALL2__WD       = 'vsyu';
Constant ALL3__WD       = 'vsekh';
Constant ALL4__WD       = 'ves&';
Constant ALL5__WD       = 'oba';

Constant AND1__WD       = 'i//';
Constant AND2__WD       = 'i//';
Constant AND3__WD       = 'plyus';

Constant BUT1__WD       = 'krome';
Constant BUT2__WD       = 'bez';
Constant BUT3__WD       = 'minus';

Constant ME1__WD        = 'ya';
Constant ME2__WD        = 'menya';
Constant ME3__WD        = 'mne';
Constant ME4__WD        = 'mnoj';
Constant ME5__WD        = 'sebya';
Constant ME6__WD        = 'sebe';
Constant ME7__WD        = 'soboj';

Constant OF1__WD        = './/';
Constant OF2__WD        = './/';
Constant OF3__WD        = './/';
Constant OF4__WD        = './/';

Constant OTHER1__WD     = 'another';
Constant OTHER2__WD     = 'other';
Constant OTHER3__WD     = 'other';

Constant THEN1__WD      = 'zatem';
Constant THEN2__WD      = 'potom';
Constant THEN3__WD      = 'posle';

Constant NO1__WD        = 'n//';
Constant NO2__WD        = 'net';
Constant NO3__WD        = 'danet';

Constant YES1__WD       = 'd//';
Constant YES2__WD       = 'da';
Constant YES3__WD       = 'da';

Constant AMUSING__WD    = 'interes';
Constant FULLSCORE1__WD = 'poln';
Constant FULLSCORE2__WD = 'polnschet';

Constant QUIT1__WD      = 'k//';
Constant QUIT2__WD      = 'konets';

Constant RESTART__WD    = 'nachalo';
Constant RESTART2__WD =  'perezapusk';

Constant RESTORE__WD    = 'zagr';
Constant RESTORE__WD2  = 'zagruzit&';


-) instead of "Vocabulary" in "Language.i6t".

Include (-

[ Banner;
   BeginActivity(PRINTING_BANNER_TEXT_ACT);
   if (ForActivity(PRINTING_BANNER_TEXT_ACT) == false) {
	   	VM_Style(HEADER_VMSTY);
		TEXT_TY_Say(Story);
		VM_Style(NORMAL_VMSTY);
		new_line;
		TEXT_TY_Say(Headline);
		#ifdef Story_Author;
		print " ";
		TEXT_TY_Say(Story_Author);
		#endif; ! Story_Author
		new_line;
		VM_Describe_Release();
		print " / ";
		TEXT_TY_Say( (+ "Информ " +) );
		print  "7 ";
		TEXT_TY_Say( (+ "версия " +) );
		print (PrintI6Text) NI_BUILD_COUNT, " ";
		print "(I6/v"; inversion;
		print " lib ", (PrintI6Text) LibRelease, ") ";
		#Ifdef STRICT_MODE;
		print "S";
		#Endif; ! STRICT_MODE
		#Ifdef DEBUG;
		print "D";
		#Endif; ! DEBUG
		new_line;
    }
    EndActivity(PRINTING_BANNER_TEXT_ACT);
];
-) Instead of "Banner" in "Printing.i6t".

Include (-

[VM_Describe_Release i;
	TEXT_TY_Say( (+ "Выпуск " +) );
	@aloads ROM_GAMERELEASE 0 i;
	print i;
	print " / ";
	TEXT_TY_Say( (+ "Серийный номер " +) );
	for (i=0 : i<6 : i++) print (char) ROM_GAMESERIAL->i;
];

-) Instead of "Release Number" in "Glulx.i6t".


Chapter 4 - Kinds


[Yeah, this is definitely not the way that Inform usually approaches grammar, with very concise, low level definitions, but I think it might be practical for me. I don't think this general approach with transliteration, etc., is likely to be used by native Russian speakers or for big projects. In any event, I like the idea of having the grammar all transparently present at the I7 level (although it may make sense to shuffle this off eventually into an extension for re-use). I'm developing this bit by bit, so some early crude attempts will be refined over time, but I have to start somewhere.

An obvious shortcoming of this approach is that input and output are entirely divorced.]

Case is a kind of value. The cases are nom, gen, dat, acc, ins and pre.
Verb class is a kind of value. The verb classes are v1a, v1b, v2a, v2b.

The grammatical cases are nominative, genitive, dative, accusative, instrumental, and prepositional. [overriding English extension or later to be put in a Russian Language extension.]

Multiplicity is a kind of value. The multiplicities are singular and plural.

To decide which multiplicity is the multiplicity of (item - a thing): 
	let D be singular; 
	if item is plural-named, let D be plural;
	decide on D.

A thing has grammatical gender. The grammatical gender of a thing is usually masculine gender.
A room has grammatical gender. The grammatical gender of a room is usually masculine gender.
A direction has grammatical gender. The grammatical gender of a room is usually masculine gender.

A thing has grammatical case. The grammatical case of a thing is usually nominative.
A room has grammatical case. The grammatical case of a room is usually nominative.
A direction has grammatical case. The grammatical case of a room is usually nominative.

A thing has a text called name. The name of a thing is usually "".
A room has a text called name. The name of a room is usually "".
A direction has a text called name. The name of a direction is usually "".

A thing has a text called inflection pattern. The inflection pattern of a thing is usually "dom".
A room has a text called inflection pattern. The inflection pattern of a room is usually "dom".
A direction has a text called inflection pattern. The inflection pattern of a direction is usually "dom".

The indefinite article of a thing is "".

An Adjective is a kind of object.  Some adjectives are defined by the Table of Known Adjectives.

A thing has an adjective called modifier. The modifier of a thing is usually null.
[The modifier is an optional associated adjective to help disambiguate nouns; it is specified in the nominative masculine singular. It is declined based on the 2nd and 3rd letters from the end since the last one is always й. That's enough to classify it as a stressed adjective, on with a stem termination in КГХ, a sibilant, a soft-н or by default, a hard consonant.]

Definition: An object is declinable if it is a thing or it is a room or it is a direction.

Chapter 5 - Standard Rules Overrides

Section 1 - Napravlenie (in place of Section SR1/4 - Directions in Standard Rules by Graham Nelson)

[replace this section to get rid of the assignment of "n" as north, "s" as south, etc.]

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

The north is a direction.
The northeast is a direction.
The northwest is a direction.
The south is a direction.
The southeast is a direction.
The southwest is a direction.
The east is a direction.
The west is a direction.
The up is a direction.
The down is a direction.
The inside is a direction.
The outside is a direction.

The north has opposite south.
The northeast has opposite southwest.
The northwest has opposite southeast.
The south has opposite north.
The southeast has opposite northwest.
The southwest has opposite northeast.
The east has opposite west.
The west has opposite east.
Up has opposite down.
Down has opposite up.
Inside has opposite outside.
Outside has opposite inside.

The inside object translates into I6 as "in_obj".
The outside object translates into I6 as "out_obj".

The verb to be above means the reversed mapping up relation.
The verb to be mapped above means the reversed mapping up relation.
The verb to be below means the reversed mapping down relation.
The verb to be mapped below means the reversed mapping down relation.

Section 2 - Locale descriptions unindexed (in place of Section SR3/4 - Locale descriptions - Unindexed in Standard Rules by Graham Nelson)

Table of Locale Priorities
notable-object (an object)	locale description priority (a number)
--							--
with blank rows for each thing.

To describe locale for (O - object):
	carry out the printing the locale description activity with O.

To set the/-- locale priority of (O - an object) to (N - a number):
	if O is a thing:
		if N <= 0, now O is mentioned;
		if there is a notable-object of O in the Table of Locale Priorities:
			choose row with a notable-object of O in the Table of Locale Priorities;
			if N <= 0, blank out the whole row;
			otherwise now the locale description priority entry is N;
		otherwise:
			if N is greater than 0:
				choose a blank row in the Table of Locale Priorities;
				now the notable-object entry is O;
				now the locale description priority entry is N;

Printing the locale description of something (documented at act_pld) is an activity. [30]

The locale paragraph count is a number that varies.

Before printing the locale description (this is the initialise locale description rule):
	now the locale paragraph count is 0;
	repeat through the Table of Locale Priorities:
		blank out the whole row.

Before printing the locale description (this is the find notable locale objects rule):
	let the domain be the parameter-object;
	carry out the choosing notable locale objects activity with the domain;
	continue the activity.

For printing the locale description (this is the interesting locale paragraphs rule):
	let the domain be the parameter-object;
	sort the Table of Locale Priorities in locale description priority order;
	repeat through the Table of Locale Priorities:
		carry out the printing a locale paragraph about activity with the notable-object entry;
	continue the activity.

For printing the locale description (this is the you-can-also-see rule):
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity with the domain:
				if the domain is the location:
					say "[We] " (A);
				otherwise if the domain is a supporter or the domain is an animal:
					say "On [the domain] [we] " (B);
				otherwise:
					say "In [the domain] [we] " (C);
				if the locale paragraph count is greater than 0:
					say "[regarding the player][can] also see " (D);
				otherwise:
					say "[regarding the player][can] see " (E);
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing,
					[
					*** edited bit ***
					list the contents of the common holder, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
					
					]
					let L be the list of things in the common holder;
					generate listing of L in the accusative case;
				otherwise:
					[
					*** edited bit ***
					otherwise say "[a list of marked for listing things including contents]";
					]
					let L be the list of marked for listing things;
					generate listing of L in the accusative case;
				if the domain is the location, say " here" (F);
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.

Choosing notable locale objects of something (documented at act_cnlo) is an activity. [31]

For choosing notable locale objects (this is the standard notable locale objects rule):
	let the domain be the parameter-object;
	let the held item be the first thing held by the domain;
	while the held item is a thing:
		set the locale priority of the held item to 5;
		now the held item is the next thing held after the held item;
	continue the activity.

Printing a locale paragraph about something (documented at act_plp) is an activity. [32]

For printing a locale paragraph about a thing (called the item)
	(this is the don't mention player's supporter in room descriptions rule):
	if the item encloses the player, set the locale priority of the item to 0;
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the don't mention scenery in room descriptions rule):
	if the item is scenery, set the locale priority of the item to 0;
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the don't mention undescribed items in room descriptions rule):
	if the item is undescribed:
		set the locale priority of the item to 0;
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the set pronouns from items in room descriptions rule):
	if the item is not mentioned, set pronouns from the item;
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the offer items to writing a paragraph about rule):
	if the item is not mentioned:
		if a paragraph break is pending, say "[conditional paragraph break]";
		carry out the writing a paragraph about activity with the item;
		if a paragraph break is pending:
			increase the locale paragraph count by 1;
			now the item is mentioned;
			say "[conditional paragraph break]";
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the use initial appearance in room descriptions rule):
	if the item is not mentioned:
		if the item provides the property initial appearance and the
			item is not handled and the initial appearance of the item is
			not "":
			increase the locale paragraph count by 1;
			say "[initial appearance of the item]";
			say "[paragraph break]";
			if a locale-supportable thing is on the item:
				repeat with possibility running through things on the item:
					now the possibility is marked for listing;
					if the possibility is mentioned:
						now the possibility is not marked for listing;
				say "On [the item] " (A);
				[
				***  edited bit ***
				list the contents of the item, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
			
				]
				let L be the list of things on the item;
				generate listing of L in the nominative case;
				[*** edited bit ***]
				say ".[paragraph break]";
			now the item is mentioned;
	continue the activity.

For printing a locale paragraph about a supporter (called the tabletop)
	(this is the initial appearance on supporters rule):
	repeat with item running through not handled things on the tabletop which
		provide the property initial appearance:
		if the item is not a person and the initial appearance of the item is not ""
			and the item is not undescribed:
			now the item is mentioned;
			say initial appearance of the item;
			say paragraph break;
	continue the activity.

Definition: a thing (called the item) is locale-supportable if the item is not
scenery and the item is not mentioned and the item is not undescribed.

For printing a locale paragraph about a thing (called the item)
	(this is the describe what's on scenery supporters in room descriptions rule):
	if the item is scenery and the item does not enclose the player:
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "On [the item] " (A);
			[
			***  edited bit ***
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			]
			let L be the list of things on the item;
			generate listing of L in the nominative case;
			say ".[paragraph break]";
	continue the activity.

For printing a locale paragraph about a thing (called the item)
	(this is the describe what's on mentioned supporters in room descriptions rule):
	if the item is mentioned and the item is not undescribed and the item is
		not scenery and the item does not enclose the player:
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "On [the item] " (A);
			[
			***  edited bit ***
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			]
			let L be the list of things on the item;
			generate listing of L in the nominative case;
			say ".[paragraph break]";
	continue the activity.

Issuing the response text of something -- documented at act_resp -- is an
activity on responses. [33]

The standard issuing the response text rule is listed last in for issuing the
response text.

The standard issuing the response text rule translates into I6 as
"STANDARD_RESPONSE_ISSUING_R".


Section 3 - The Player

The description of the player is "Ты выглядишь как обычно."

Section 4 - Response Overrides

To say capitalized (item - a thing) in the (itemcase - a grammatical case) case:
	let PN be "[item in the itemcase case]";
	say PN with initial capital.
		
[announce items from multiple object lists rule response (A): "[current item from the multiple object list]: [run paragraph on]"]
The announce items from multiple object lists rule response (A) is "[current item from the multiple object list in the nominative case]: [run paragraph on]"

[The block vaguely going rule response (A): "You'll have to say which compass direction to go in."]
The block vaguely going rule response (A) is "Идти можно только в некотором направлении."

[no chnage][The print the final prompt rule response (A): "> [run paragraph on]"]

[The print the final question rule response (A): "Would you like to "]
The print the final question rule response (A) is "Вы хотите ".

[The print the final question rule response (B): " or "]
The print the final question rule response (B) is " или ".

[The standard respond to final question rule response (A): "Please give one of the answers above."]
The standard respond to final question rule response (A) is "Нужен один из перечисленных ответов."

[departing from the rInform6 implmentation that listed items in the nominative, here the accusative is required as output from the list]

[The you-can-also-see rule response (A): "[We] "]
The you-can-also-see rule response (A) is "Здесь вы ".

[The you-can-also-see rule response (B): "On [the domain] [we] "]
The you-can-also-see rule response (B) is "На [domain in the prepositional case] ".

[The you-can-also-see rule response (C): "In [the domain] [we] "]
The you-can-also-see rule response (C) is "В [domain in the prepositional case] ".

[The you-can-also-see rule response (D): "[regarding the player][can] also see "]
The you-can-also-see rule response (D) is "также видите".

[The you-can-also-see rule response (E): "[regarding the player][can] see "]
The you-can-also-see rule response (E) is "видите ".

[The you-can-also-see rule response (F): " here"]
The you-can-also-see rule response (F) is "".

[The use initial appearance in room descriptions rule response (A): "On [the item] "]
The use initial appearance in room descriptions rule response (A)is  "На [the item in the prepositional case] "

[The describe what's on scenery supporters in room descriptions rule response (A): "On [the item] "]
The describe what's on scenery supporters in room descriptions rule response (A) is "На [the item in the prepositional case] "

[The describe what's on mentioned supporters in room descriptions rule response (A): "On [the item] "]
The describe what's on mentioned supporters in room descriptions rule response (A) is "На [the item in the prepositional case] "

[The print empty inventory rule response (A): "[We] [are] carrying nothing."]
The print empty inventory rule response (A) is "У тебя с собой ничего нет."

[The print standard inventory rule response (A): "[We] [are] carrying:[line break]"]
The print standard inventory rule response (A) is "У тебя с собой есть:[line break]"

[The report other people taking inventory rule response (A): "[The actor] [look] through [their] possessions."]
[translate][The report other people taking inventory rule response (A): "[The actor] [look] through [their] possessions."]

[The can't take yourself rule response (A): "[We] [are] always self-possessed."]
The can't take yourself rule response (A) is "Ты всегда есть у себя."

[The can't take other people rule response (A): "I don't suppose [the noun] [would care] for that."]
The can't take other people rule response (A) is "[capitalized noun in the dative case] это вряд ли понравится."

[The can't take component parts rule response (A): "[regarding the noun][Those] [seem] to be a part of [the whole]."]
The can't take component parts rule response (A) is "[capitalized noun in the nominative case] явно явля[noun does a verb of class v1b]ся частью [whole in the genitive case]."

[The can't take people's possessions rule response (A): "[regarding the noun][Those] [seem] to belong to [the owner]."]
The can't take people's possessions rule response (A) is "[capitalized noun in the nominative case] явнo принадлеж[noun does a verb of class v2a] [the owner in the dative case]."

[The can't take items out of play rule response (A): "[regarding the noun][Those] [aren't] available."]
The can't take items out of play rule response (A) is "[capitalized noun in the nominative case] [short form of nedosyagaemyj regarding noun]."

[The can't take what you're inside rule response (A): "[We] [would have] to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first."]
The can't take what you're inside rule response (A) is "Сначала тебе необходимо покинуть [noun in the accusative case]."

[The can't take what's already taken rule response (A): "[We] already [have] [regarding the noun][those]."]
The can't take what's already taken rule response (A) is "[capitalized noun in the nominative case] у тебя уже есть."

[The can't take scenery rule response (A): "[regarding the noun][They're] hardly portable."]
The can't take scenery rule response (A) is "[capitalized noun in the accusative case] невозможно взять."

[The can only take things rule response (A): "[We] [cannot] carry [the noun]."]
[translate][The can only take things rule response (A): "[We] [cannot] carry [the noun]."]

[The can't take what's fixed in place rule response (A): "[regarding the noun][They're] fixed in place."]
The can't take what's fixed in place rule response (A) is "[capitalized noun in the nominative case] жёстко [short form of zakreplennyj regarding noun]."

[The use player's holdall to avoid exceeding carrying capacity rule response (A): "(putting [the transferred item] into [the current working sack] to make room)[command clarification break]"]
The use player's holdall to avoid exceeding carrying capacity rule response (A) is "(укладывая [transferred item in the accusative case] внутрь [current working sack in the genitive case], чтобы освободить место)."

[The can't exceed carrying capacity rule response (A): "[We]['re] carrying too many things already."]
The can't exceed carrying capacity rule response (A) is "У тебя с собой слишком много вещей."

[The standard report taking rule response (A): "Taken."]
The standard report taking rule response (A) is "Ты берёшь [if noun is plural-named]их[otherwise if grammatical gender of noun is feminine gender]её[otherwise]его[end if]."

[The standard report taking rule response (B): "[The actor] [pick] up [the noun]."]
[translate][The standard report taking rule response (B): "[The actor] [pick] up [the noun]."]

[The can't remove what's not inside rule response (A): "But [regarding the noun][they] [aren't] there now."]
The can't remove what's not inside rule response (A) is "[capitalized noun in the nominative case] не наход[noun does a verb of class v2b]ся [if noun is a supporter]на[otherwise]в[end if] [second noun in the prepositional case]."

[The can't remove from people rule response (A): "[regarding the noun][Those] [seem] to belong to [the owner]."]
The can't remove from people rule response (A) is "[capitalized noun in the nominative case] явнo принадлеж[noun does a verb of class v2a] [the owner in the dative case]."

[The can't drop yourself rule response (A): "[We] [lack] the dexterity."]
The can't drop yourself rule response (A) is "У тебя не хватит ловкости."

[The can't drop body parts rule response (A): "[We] [can't drop] part of [ourselves]."]
[translate][The can't drop body parts rule response (A): "[We] [can't drop] part of [ourselves]."]

[The can't drop what's already dropped rule response (A): "[The noun] [are] already here."]
The can't drop what's already dropped rule response (A) is "У тебя нет [noun in the genitive case]."

[The can't drop what's not held rule response (A): "[We] [haven't] got [regarding the noun][those]."]
The can't drop what's not held rule response (A) is "[capitalized noun in the nominative case] не у тебя."

[The can't drop clothes being worn rule response (A): "(first taking [the noun] off)[command clarification break]"]
The can't drop clothes being worn rule response (A) is "(сначала сняв [noun in the accusative case] с себя)[command clarification break]".

[The can't drop if this exceeds carrying capacity rule response (A): "[There] [are] no more room on [the receptacle]."]
The can't drop if this exceeds carrying capacity rule response (A) is "Больше нет места на [the receptacle in the prepositional case]."

[The can't drop if this exceeds carrying capacity rule response (B): "[There] [are] no more room in [the receptacle]."]
The can't drop if this exceeds carrying capacity rule response (B) is "Больше нет места в [the receptacle in the prepositional case]."

[The standard report dropping rule response (A): "Dropped."]
The standard report dropping rule response (A) is "[standard-report-dropping-rule-response-a]."

To say standard-report-dropping-rule-response-a:
	let PN be "[short form of broshennyj regarding noun]";
	say PN with initial capital.

[The standard report dropping rule response (B): "[The actor] [put] down [the noun]."]
[translate][The standard report dropping rule response (B): "[The actor] [put] down [the noun]."]

[The can't put something on itself rule response (A): "[We] [can't put] something on top of itself."]
The can't put something on itself rule response (A) is "Невозможно положить что-либо на себя."

[The can't put onto what's not a supporter rule response (A): "Putting things on [the second noun] [would achieve] nothing."]
The can't put onto what's not a supporter rule response (A) is "Класть что-либо на [second noun in the accusative case] бессмысленно."

[The can't put clothes being worn rule response (A): "(first taking [regarding the noun][them] off)[command clarification break]"]
The can't put clothes being worn rule response (A) is "(сначала сняв [noun in the accusative case] с себя)[command clarification break]"

[The can't put if this exceeds carrying capacity rule response (A): "[There] [are] no more room on [the second noun]."]
The can't put if this exceeds carrying capacity rule response (A) is "Больше нет места на [the second noun]."

[The concise report putting rule response (A): "Done."]
[review]The concise report putting rule response (A) is "Ты кладёшь всё на [second noun in the accusative case]."

[The standard report putting rule response (A): "[The actor] [put] [the noun] on [the second noun]."]
[translate][The standard report putting rule response (A): "[The actor] [put] [the noun] on [the second noun]."]

[The can't insert something into itself rule response (A): "[We] [can't put] something inside itself."]
The can't insert something into itself rule response (A) is "Невозможно вложить что-либо внутрь себя."

[The can't insert into closed containers rule response (A): "[The second noun] [are] closed."]
The can't insert into closed containers rule response (A) is "[capitalized second noun in the nominative case] [short form of zakrytyj regarding second noun]."

[The can't insert into what's not a container rule response (A): "[regarding the second noun][Those] [can't contain] things."]
The can't insert into what's not a container rule response (A) is "[capitalized second noun in the nominative case] не мо[if the second noun is plural-named]г[otherwise]ж[noun does a verb of class v1a] что-либо содержать."

[The can't insert clothes being worn rule response (A): "(first taking [regarding the noun][them] off)[command clarification break]"]
The can't insert clothes being worn rule response (A) is "(сначала сняв [noun in the accusative case])[command clarification break]".

[The can't insert if this exceeds carrying capacity rule response (A): "[There] [are] no more room in [the second noun]."]
The can't insert if this exceeds carrying capacity rule response (A) is "Больше нет места в [second noun in the prepositional case]."

[The concise report inserting rule response (A): "Done."]
The concise report inserting rule response (A) is "Ты кладёшь всё в [second noun in the accusative case]."

[The standard report inserting rule response (A): "[The actor] [put] [the noun] into [the second noun]."]
[translate][The standard report inserting rule response (A): "[The actor] [put] [the noun] into [the second noun]."]

[The can't eat unless edible rule response (A): "[regarding the noun][They're] plainly inedible."]
The can't eat unless edible rule response (A) is "[capitalized noun in the nominative case] явно не год[noun does a verb of class v2b]ся в пищу."

[The can't eat clothing without removing it first rule response (A): "(first taking [the noun] off)[command clarification break]"]
The can't eat clothing without removing it first rule response (A) is "(сначала сняв [noun in the accusative case])[command clarification break]".

[The can't eat other people's food rule response (A): "[The owner] [might not appreciate] that."]
[translate][The can't eat other people's food rule response (A): "[The owner] [might not appreciate] that."]

[The standard report eating rule response (A): "[We] [eat] [the noun]. Not bad."]
The standard report eating rule response (A) is "Ты съедаешь [noun in the accusative case]. Вполне съедобно."

[The standard report eating rule response (B): "[The actor] [eat] [the noun]."]
[translate][The standard report eating rule response (B): "[The actor] [eat] [the noun]."]

[The stand up before going rule response (A): "(first getting off [the chaise])[command clarification break]"]
[translate][The stand up before going rule response (A): "(first getting off [the chaise])[command clarification break]"]

[The can't travel in what's not a vehicle rule response (A): "[We] [would have] to get off [the nonvehicle] first."]
[translate][The can't travel in what's not a vehicle rule response (A): "[We] [would have] to get off [the nonvehicle] first."]

[The can't travel in what's not a vehicle rule response (B): "[We] [would have] to get out of [the nonvehicle] first."]
[translate][The can't travel in what's not a vehicle rule response (B): "[We] [would have] to get out of [the nonvehicle] first."]

[The can't go through undescribed doors rule response (A): "[We] [can't go] that way."]
The can't go through undescribed doors rule response (A) is "Ты не можешь пойти туда."

[The can't go through closed doors rule response (A): "(first opening [the door gone through])[command clarification break]"]
[translate][The can't go through closed doors rule response (A): "(first opening [the door gone through])[command clarification break]"]

[The can't go that way rule response (A): "[We] [can't go] that way."]
The can't go that way rule response (A) is "Ты не можешь пойти туда."

[The can't go that way rule response (B): "[We] [can't], since [the door gone through] [lead] nowhere."]
The can't go that way rule response (B) is "[capitalized the door gone through in the nominative case] никуда не ведет."

[The describe room gone into rule response (A): "[The actor] [go] up"]
[check]The describe room gone into rule response (A) is "[capitalized actor in the nominative case] ид[actor does a verb of class v1a] вверх"

[The describe room gone into rule response (B): "[The actor] [go] down"]
[check]The describe room gone into rule response (B) is "[capitalized actor in the nominative case] ид[actor does a verb of class v1a] вниз"

[The describe room gone into rule response (C): "[The actor] [go] [noun]"]
[check]The describe room gone into rule response (C) is "[capitalized actor in the nominative case] ид[actor does a verb of class v1a][if noun is up or noun is down][noun in the accusative case][otherwise] на [noun in the accusative case][end if]"

[The describe room gone into rule response (D): "[The actor] [arrive] from above"]
[check]The describe room gone into rule response (D) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] сверху".

[The describe room gone into rule response (E): "[The actor] [arrive] from below"]
[check]The describe room gone into rule response (E) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] снизу".

[The describe room gone into rule response (F): "[The actor] [arrive] from [the back way]"]
The describe room gone into rule response (F) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] с [the back way in the genitive case]".

[The describe room gone into rule response (G): "[The actor] [arrive]"]
[review]The describe room gone into rule response (G) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b]".

[The describe room gone into rule response (H): "[The actor] [arrive] at [the room gone to] from above"]
[review]The describe room gone into rule response (H) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] на [the room gone to in the accusative case] сверху".

[The describe room gone into rule response (I): "[The actor] [arrive] at [the room gone to] from below"]
[review]The describe room gone into rule response (I) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] на [the room gone to in the accusative case] снизу".

[The describe room gone into rule response (J): "[The actor] [arrive] at [the room gone to] from [the back way]"]
[review]The describe room gone into rule response (J) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] на [the room gone to in the accusative case] с [the back way in the genitive case]".

[The describe room gone into rule response (K): "[The actor] [go] through [the noun]"]
[review]The describe room gone into rule response (K) is "[capitalized actor in the nominative case] проход[actor does a verb of class v2b] через [noun in the accusative case]".

[The describe room gone into rule response (L): "[The actor] [arrive] from [the noun]"]
[review]The describe room gone into rule response (L) is "[capitalized actor in the nominative case] прибыва[actor does a verb of class v1b] из [noun in the genitive case]".

[The describe room gone into rule response (M): "on [the vehicle gone by]"]
[review]The describe room gone into rule response (M) is "на [the vehicle gone by in the prepositional case]".

[The describe room gone into rule response (N): "in [the vehicle gone by]"]
[review]The describe room gone into rule response (N) is "на [the vehicle gone by in the prepositional case]".

[The describe room gone into rule response (O): ", pushing [the thing gone with] in front, and [us] along too"]
[review]The describe room gone into rule response (O) is ", толкая [the thing gone with in the accusative case] впереди, и вы тоже".

[The describe room gone into rule response (P): ", pushing [the thing gone with] in front"]
[review]The describe room gone into rule response (P) is ", толкая [the thing gone with in the accusative case] впереди"

[The describe room gone into rule response (Q): ", pushing [the thing gone with] away"]
[review]The describe room gone into rule response (Q) is ", отталкивая [the thing gone with in the accusative case]".

[The describe room gone into rule response (R): ", pushing [the thing gone with] in"]
[review]The describe room gone into rule response (R) is "толкая [the thing gone with in the accusative case]".

[The describe room gone into rule response (S): ", taking [us] along"]
[review]The describe room gone into rule response (S) is "с вами".

[The can't enter what's already entered rule response (A): "But [we]['re] already on [the noun]."]
The can't enter what's already entered rule response (A) is "Но ты уже на [noun in the prepositional case]."

[The can't enter what's already entered rule response (B): "But [we]['re] already in [the noun]."]
The can't enter what's already entered rule response (B) is "Но ты уже в [noun in the prepositional case]."

[The can't enter what's not enterable rule response (A): "[regarding the noun][They're] not something [we] [can] stand on."]
The can't enter what's not enterable rule response (A) is "Но на [noun in the accusative case] невозможно встать."

[The can't enter what's not enterable rule response (B): "[regarding the noun][They're] not something [we] [can] sit down on."]
The can't enter what's not enterable rule response (B) is "Но на [noun in the accusative case] невозможно сесть."

[The can't enter what's not enterable rule response (C): "[regarding the noun][They're] not something [we] [can] lie down on."]
The can't enter what's not enterable rule response (C) is "Но на [noun in the accusative case] невозможно лечь."

[The can't enter what's not enterable rule response (D): "[regarding the noun][They're] not something [we] [can] enter."]
The can't enter what's not enterable rule response (D) is "Но на [noun in the accusative case] невозможно войти."

[The can't enter closed containers rule response (A): "[We] [can't get] into the closed [noun]."]
The can't enter closed containers rule response (A) is "[capitalized noun in the nominative case] [short form of zakrytyj regarding noun], и ты не можешь войти туда."

[The can't enter if this exceeds carrying capacity rule response (A): "[There] [are] no more room on [the noun]."]
[review]The can't enter if this exceeds carrying capacity rule response (A) is "Больше нет места на [noun in the accusative case]."

[The can't enter if this exceeds carrying capacity rule response (B): "[There] [are] no more room in [the noun]."]
[review]The can't enter if this exceeds carrying capacity rule response (B) is "Больше нет места в [noun in the accusative case]."

[The can't enter something carried rule response (A): "[We] [can] only get into something free-standing."]
The can't enter something carried rule response (A) is "Ты не можешь войти в то, что у тебя в руках."

[The implicitly pass through other barriers rule response (A): "(getting off [the current home])[command clarification break]"]
[translate][The implicitly pass through other barriers rule response (A): "(getting off [the current home])[command clarification break]"]

[The implicitly pass through other barriers rule response (B): "(getting out of [the current home])[command clarification break]"]
[The implicitly pass through other barriers rule response (B): "(getting out of [the current home])[command clarification break]"]

[The implicitly pass through other barriers rule response (C): "(getting onto [the target])[command clarification break]"]
[translate][The implicitly pass through other barriers rule response (C): "(getting onto [the target])[command clarification break]"]

[The implicitly pass through other barriers rule response (D): "(getting into [the target])[command clarification break]"]
[translate][The implicitly pass through other barriers rule response (D): "(getting into [the target])[command clarification break]"]

[The implicitly pass through other barriers rule response (E): "(entering [the target])[command clarification break]"]
[translate][The implicitly pass through other barriers rule response (E): "(entering [the target])[command clarification break]"]

[The standard report entering rule response (A): "[We] [get] onto [the noun]."]
The standard report entering rule response (A) is "Ты влезаешь на [noun in the accusative case]."

[The standard report entering rule response (B): "[We] [get] into [the noun]."]
The standard report entering rule response (B) is "Ты влезаешь в [noun in the accusative case]."

[The standard report entering rule response (C): "[The actor] [get] into [the noun]."]
The standard report entering rule response (C) is "[capitalized actor in the nominative case] влеза[actor does a verb of class v1b] в [noun in the accusative case]."

[The standard report entering rule response (D): "[The actor] [get] onto [the noun]."]
The standard report entering rule response (D) is "[capitalized actor in the nominative case] залеза[actor does a verb of class v1b] в [noun in the accusative case]."

[The can't exit when not inside anything rule response (A): "But [we] [aren't] in anything at the [if story tense is present tense]moment[otherwise]time[end if]."]
The can't exit when not inside anything rule response (A) is "Но ты сейчас не находишься в чём-либо."

[The can't exit closed containers rule response (A): "You can't get out of the closed [cage]."]
The can't exit closed containers rule response (A) is "[capitalized cage in the nominative case] [short form of zakrytyj regarding cage], и ты не можешь выйти."

[The standard report exiting rule response (A): "[We] [get] off [the container exited from]."]
The standard report exiting rule response (A) is "Ты слезаешь с [container exited from in the genitive case]."

[The standard report exiting rule response (B): "[We] [get] out of [the container exited from]."]
The standard report exiting rule response (B) is "Ты выходишь из [container exited from in the genitive case]."

[The standard report exiting rule response (C): "[The actor] [get] out of [the container exited from]."]
The standard report exiting rule response (C) is "[capitalized actor in the nominative case] выход[actor does a verb of class v2b] из [container exited from in the genitive case]."

[The can't get off things rule response (A): "But [we] [aren't] on [the noun] at the [if story tense is present tense]moment[otherwise]time[end if]."]
The can't get off things rule response (A) is "Но ты сейчас не находишься в чём-либо."

[The standard report getting off rule response (A): "[The actor] [get] off [the noun]."]
The standard report getting off rule response (A) is "[capitalized actor in the nominative case] слеза[actor does a verb of class v1b] с [container exited from in the genitive case]."

[The room description heading rule response (A): "Darkness"]
[review]The room description heading rule response (A) is "Темнота".

[The room description heading rule response (B): " (on [the intermediate level])"]
The room description heading rule response (B) is " (на [intermediate level in the prepositional case])"

[The room description heading rule response (C): " (in [the intermediate level])"]
The room description heading rule response (C) is " (в [intermediate level in the prepositional case])"

[The room description body text rule response (A): "[It] [are] pitch dark, and [we] [can't see] a thing."]
The room description body text rule response (A) is "Кромешная тьма — не видно ни зги!"

[The other people looking rule response (A): "[The actor] [look] around."]
[review]The other people looking rule response (A) is "[capitalized actor in the nominative case] смотр[v2b] вокруг."

[The examine directions rule response (A): "[We] [see] nothing unexpected in that direction."]
The examine directions rule response (A) is "В этом направлении не видно ничего примечательного."

[The examine containers rule response (A): "In [the noun] "]
[TODO][The examine containers rule response (A): "In [the noun] "]

[The examine containers rule response (B): "[The noun] [are] empty."]
The examine containers rule response (B) is "В [noun in the prepositional case] ничего нет."

[The examine supporters rule response (A): "On [the noun] "]
[TODO][The examine supporters rule response (A): "On [the noun] "]

[The examine devices rule response (A): "[The noun] [are] [if story tense is present tense]currently [end if]switched [if the noun is switched on]on[otherwise]off[end if]."]
The examine devices rule response (A) is "[capitalized noun in the nominative case] уже [if the noun is switched on][short form of vklyuchennyj regarding noun][otherwise][short form of vyklyuchennyj regarding noun][end if]."

[The examine undescribed things rule response (A): "[We] [see] nothing special about [the noun]."]
The examine undescribed things rule response (A) is "Ничего особенного в [noun in the prepositional case] ты не видишь."

[The report other people examining rule response (A): "[The actor] [look] closely at [the noun]."]
[translate][The report other people examining rule response (A): "[The actor] [look] closely at [the noun]."]

[The standard looking under rule response (A): "[We] [find] nothing of interest."]
The standard looking under rule response (A) is "Ты не находишь под [noun in the instrumental case] ничего интересного."

[The report other people looking under rule response (A): "[The actor] [look] under [the noun]."]
[translate][The report other people looking under rule response (A): "[The actor] [look] under [the noun]."]

[The can't search unless container or supporter rule response (A): "[We] [find] nothing of interest."]
[review]The can't search unless container or supporter rule response (A) is "Ты не находишь ничего интересного."

[The can't search closed opaque containers rule response (A): "[We] [can't see] inside, since [the noun] [are] closed."]
The can't search closed opaque containers rule response (A) is "[capitalized noun in the nominative case] [short form of zakrytyj regarding noun], и ты не можешь заглянуть внутрь."

[The standard search containers rule response (A): "In [the noun] "]
[TODO][The standard search containers rule response (A): "In [the noun] "]

[The standard search containers rule response (B): "[The noun] [are] empty."]
The standard search containers rule response (B) is "В [noun in the prepositional case] ничего нет."

[The standard search supporters rule response (A): "On [the noun] "]
[TODO][The standard search supporters rule response (A): "On [the noun] "]

[The standard search supporters rule response (B): "[There] [are] nothing on [the noun]."]
The standard search supporters rule response (B) is "На [noun in the prepositional case] ничего нет."

[The report other people searching rule response (A): "[The actor] [search] [the noun]."]
[translate][The report other people searching rule response (A): "[The actor] [search] [the noun]."]

[The block consulting rule response (A): "[We] [discover] nothing of interest in [the noun]."]
The block consulting rule response (A) is "Ты не находишь в [noun in the prepositional case] ничего подходящего.."

[The block consulting rule response (B): "[The actor] [look] at [the noun]."]
[translate][The block consulting rule response (B): "[The actor] [look] at [the noun]."]

[The can't lock without a lock rule response (A): "[regarding the noun][Those] [don't] seem to be something [we] [can] lock."]
The can't lock without a lock rule response (A) is "[capitalized noun in the accusative case] невозможно запереть."

[The can't lock what's already locked rule response (A): "[regarding the noun][They're] locked at the [if story tense is present tense]moment[otherwise]time[end if]."]
The can't lock what's already locked rule response (A) is "[capitalized noun in the nominative case] уже [short form of zapertyj regarding noun]."

[The can't lock what's open rule response (A): "First [we] [would have] to close [the noun]."]
The can't lock what's open rule response (A) is  "Сначала необходимо закрыть [noun in the accusative case]."

[The can't lock without the correct key rule response (A): "[regarding the second noun][Those] [don't] seem to fit the lock."]
The can't lock without the correct key rule response (A) is "[capitalized second noun in the nominative case] не подход[second noun does a verb of class v2b] к замку."

[The standard report locking rule response (A): "[We] [lock] [the noun]."]
The standard report locking rule response (A) is "Ты запираешь [noun in the accusative case]."

[The standard report locking rule response (B): "[The actor] [lock] [the noun]."]
[review]The standard report locking rule response (B) is "[capitalized actor in the nominative case] запира[actor does a verb of class v1b] [noun in the accusative case]."

[The can't unlock without a lock rule response (A): "[regarding the noun][Those] [don't] seem to be something [we] [can] unlock."]
The can't unlock without a lock rule response (A) is "[capitalized noun in the accusative case] невозможно запереть."

[The can't unlock what's already unlocked rule response (A): "[regarding the noun][They're] unlocked at the [if story tense is present tense]moment[otherwise]time[end if]."]
The can't unlock what's already unlocked rule response (A) is "[capitalized noun in the accusative case] не [short form of zapertyj regarding noun]."

[The can't unlock without the correct key rule response (A): "[regarding the second noun][Those] [don't] seem to fit the lock."]
The can't unlock without the correct key rule response (A) is "[capitalized second noun in the nominative case] не подход[second noun does a verb of class v2b] к замку."

[The standard report unlocking rule response (A): "[We] [unlock] [the noun]."]
The standard report unlocking rule response (A) is "Ты отпираешь [noun in the accusative case]."

[The standard report unlocking rule response (B): "[The actor] [unlock] [the noun]."]
The standard report unlocking rule response (B) is "[capitalized actor in the nominative case] отпира[actor does a verb of class v1b] [noun in the accusative case]."

[The can't switch on unless switchable rule response (A): "[regarding the noun][They] [aren't] something [we] [can] switch."]
The can't switch on unless switchable rule response (A) is "[capitalized noun in the accusative case] невозможно включить."

[The can't switch on what's already on rule response (A): "[regarding the noun][They're] already on."]
The can't switch on what's already on rule response (A) is "[capitalized noun in the nominative case] уже [short form of vklyuchennyj regarding noun]."

[The standard report switching on rule response (A): "[The actor] [switch] [the noun] on."]
The standard report switching on rule response (A) is "[capitalized actor in the nominative case] включа[actor does a verb of class v1b] [noun in the accusative case]."

[The can't switch off unless switchable rule response (A): "[regarding the noun][They] [aren't] something [we] [can] switch."]
The can't switch off unless switchable rule response (A) is "[capitalized noun in the accusative case] невозможно выключить."

[The can't switch off what's already off rule response (A): "[regarding the noun][They're] already off."]
The can't switch off what's already off rule response (A) is "[capitalized noun in the nominative case] уже [short form of vyklyuchennyj regarding noun]."

[The standard report switching off rule response (A): "[The actor] [switch] [the noun] off."]
The standard report switching off rule response (A) is "[capitalized actor in the nominative case] выключа[actor does a verb of class v1b] [noun in the accusative case]."

[The can't open unless openable rule response (A): "[regarding the noun][They] [aren't] something [we] [can] open."]
The can't open unless openable rule response (A) is "[capitalized noun in the accusative case] невозможно открыть."

[The can't open what's locked rule response (A): "[regarding the noun][They] [seem] to be locked."]
The can't open what's locked rule response (A) is "Похоже, что [noun in the nominative case] [short form of zapertyj regarding noun]."

[The can't open what's already open rule response (A): "[regarding the noun][They're] already open."]
The can't open what's already open rule response (A) is "[capitalized noun in the nominative case] уже [short form of otkrytyj regarding noun]."

[The reveal any newly visible interior rule response (A): "[We] [open] [the noun], revealing "]
[TODO]The reveal any newly visible interior rule response (A) is "Ты открываешь [noun in the accusative case]. Внутри ".

[The standard report opening rule response (A): "[We] [open] [the noun]."]
The standard report opening rule response (A) is "Ты открываешь [noun in the accusative case]."

[The standard report opening rule response (B): "[The actor] [open] [the noun]."]
The standard report opening rule response (B) is "[capitalized actor in the nominative case] открыва[actor does a verb of class v1b] [noun in the accusative case]."

[The standard report opening rule response (C): "[The noun] [open]."]
[review]The standard report opening rule response (C) is "[capitalized noun in the nominative case] [short form of otkrytyj regarding noun]."

[The can't close unless openable rule response (A): "[regarding the noun][They] [aren't] something [we] [can] close."]
The can't close unless openable rule response (A) is "[capitalized noun in the accusative case] невозможно закрыть."

[The can't close what's already closed rule response (A): "[regarding the noun][They're] already closed."]
The can't close what's already closed rule response (A) is "[capitalized noun in the nominative case] уже [short form of zakrytyj regarding noun]."

[The standard report closing rule response (A): "[We] [close] [the noun]."]
The standard report closing rule response (A) is "Ты закрываешь [noun in the accusative case]."

[The standard report closing rule response (B): "[The actor] [close] [the noun]."]
The standard report closing rule response (B) is "[capitalized actor in the nominative case] закрыва[actor does a verb of class v1b] [noun in the accusative case]."

[The standard report closing rule response (C): "[The noun] [close]."]
The standard report closing rule response (C) is "[capitalized noun in the nominative case] [short form of zakrytyj regarding noun]."

[The can't wear what's not clothing rule response (A): "[We] [can't wear] [regarding the noun][those]!"]
The can't wear what's not clothing rule response (A) is "Надеть [noun in the accusative case] на себя невозможно."

[The can't wear what's not held rule response (A): "[We] [aren't] holding [regarding the noun][those]!"]
The can't wear what's not held rule response (A) is "[We] [aren't] holding [regarding the noun][those]!"

[The can't wear what's already worn rule response (A): "[We]['re] already wearing [regarding the noun][those]!"]
The can't wear what's already worn rule response (A) is "У тебя нет [noun in the genitive case] с собой."

[The standard report wearing rule response (A): "[We] [put] on [the noun]."]
The standard report wearing rule response (A) is "Ты надеваешь [noun in the accusative case] на себя."

[The standard report wearing rule response (B): "[The actor] [put] on [the noun]."]
[review]The standard report wearing rule response (B) is "[capitalized actor in the nominative case] надева[actor does a verb of class v1b] [noun in the accusative case]."

[The can't take off what's not worn rule response (A): "[We] [aren't] wearing [the noun]."]
The can't take off what's not worn rule response (A) is "[capitalized noun in the nominative case] не на тебе."

[The can't exceed carrying capacity when taking off rule response (A): "[We]['re] carrying too many things already."]
The can't exceed carrying capacity when taking off rule response (A) is "У тебя с собой слишком много вещей."

[The standard report taking off rule response (A): "[We] [take] off [the noun]."]
The standard report taking off rule response (A) is "Ты снимаешь [noun in the accusative case] с себя."

[The standard report taking off rule response (B): "[The actor] [take] off [the noun]."]
[review]The standard report taking off rule response (B) is "[capitalized actor in the nominative case] снима[actor does a verb of class v1b] [noun in the accusative case]."

[The can't give what you haven't got rule response (A): "[We] [aren't] holding [the noun]."]
The can't give what you haven't got rule response (A) is "[We] [aren't] holding [the noun]."

[The can't give to yourself rule response (A): "[We] [can't give] [the noun] to [ourselves]."]
The can't give to yourself rule response (A) is "У тебя нет [noun in the genitive case] с собой."

[The can't give to a non-person rule response (A): "[The second noun] [aren't] able to receive things."]
[translate][The can't give to a non-person rule response (A): "[The second noun] [aren't] able to receive things."]

[The can't give clothes being worn rule response (A): "(first taking [the noun] off)[command clarification break]"]
The can't give clothes being worn rule response (A) is "(сначала сняв [noun in the accusative case] с себя)[command clarification break]".

[The block giving rule response (A): "[The second noun] [don't] seem interested."]
The block giving rule response (A) is "[capitalized second noun in the accusative case] это не заинтересовало."

[The can't exceed carrying capacity when giving rule response (A): "[The second noun] [are] carrying too many things already."]
[review]The can't exceed carrying capacity when giving rule response (A) is "У [actor in the genitive case] слишком много вещей."

[The standard report giving rule response (A): "[We] [give] [the noun] to [the second noun]."]
[review]The standard report giving rule response (A) is "Ты даешь [second noun in the dative case] [noun in the accusative case]."

[The standard report giving rule response (B): "[The actor] [give] [the noun] to [us]."]
[review]The standard report giving rule response (B) is "[capitalized actor in the nominative case] тебе да[actor does a verb of class v1b] [noun in the accusative case]."

[The standard report giving rule response (C): "[The actor] [give] [the noun] to [the second noun]."]
[review]The standard report giving rule response (C) is "[capitalized actor in the nominative case] да[actor does a verb of class v1b] [second noun in the dative case] [noun in the accusative case]."

[The can't show what you haven't got rule response (A): "[We] [aren't] holding [the noun]."]
The can't show what you haven't got rule response (A) is "У тебя нет [noun in the genitive case] с собой."

[The block showing rule response (A): "[The second noun] [are] unimpressed."]
The block showing rule response (A) is "[capitalized second noun in the accusative case] это не впечатлило."

[The block waking rule response (A): "That [seem] unnecessary."]
The block waking rule response (A) is "Будить [noun in the accusative case] не стоит."

[The implicitly remove thrown clothing rule response (A): "(first taking [the noun] off)[command clarification break]"]
The implicitly remove thrown clothing rule response (A) is "(сначала сняв [noun in the accusative case] с себя)[command clarification break]"

[The futile to throw things at inanimate objects rule response (A): "Futile."]
The futile to throw things at inanimate objects rule response (A) is "Бросать [noun in the accusative case] в [second noun in the accusative case] бесполезно."

[The block throwing at rule response (A): "[We] [lack] the nerve when it [if story tense is the past tense]came[otherwise]comes[end if] to the crucial moment."]
The block throwing at rule response (A) is "У тебя не хватает решимости бросить [noun in the accusative case] в [second noun in the accusative case]."

[The block attacking rule response (A): "Violence [aren't] the answer to this one."]
The block attacking rule response (A) is "Сила есть — ума не надо?"

[The kissing yourself rule response (A): "[We] [don't] get much from that."]
The kissing yourself rule response (A) is "Будет лучше сосредоточиться на игре."
[note that this one has changed significantly since version 6, might need more parallel retranslation]

[The block kissing rule response (A): "[The noun] [might not] like that."]
[translate][The block kissing rule response (A): "[The noun] [might not] like that."]

[The block answering rule response (A): "[There] [are] no reply."]
The block answering rule response (A) is "Ответа не последовало."

[The telling yourself rule response (A): "[We] [talk] to [ourselves] a while."]
The telling yourself rule response (A) is "Беседы с собой — занятие нездоровое."

[The block telling rule response (A): "This [provoke] no reaction."]
The block telling rule response (A) is "This [provoke] no reaction."

[The block asking rule response (A): "[There] [are] no reply."]
The block asking rule response (A) is "[if grammatical gender of the noun is feminine gender]Твоя собеседница никак не отреагировала[otherwise]Твой собеседник никак не отреагировал[end if]."

[The standard report waiting rule response (A): "Time [pass]."]
The standard report waiting rule response (A) is "Проходит немного времени."

[The standard report waiting rule response (B): "[The actor] [wait]."]
[review]The standard report waiting rule response (B) is "[capitalized actor in the nominative case] жд[actor does a verb of class v1a]."

[The report touching yourself rule response (A): "[We] [achieve] nothing by this."]
[review]The report touching yourself rule response (A) is "Если тебе очень хочется."
[note that this one has changed significantly since version 6, might need more parallel retranslation]

[The report touching yourself rule response (B): "[The actor] [touch] [themselves]."]
The report touching yourself rule response (B) is "[capitalized actor in the nominative case] трога[actor does a verb of class v2a] себя."

[The report touching other people rule response (A): "[The noun] [might not like] that."]
[The report touching other people rule response (A): "[The noun] [might not like] that."]

[The report touching other people rule response (B): "[The actor] [touch] [us]."]
[review]The report touching other people rule response (B) is "[capitalized actor in the nominative case] трога[actor does a verb of class v2a] тебя."

[The report touching other people rule response (C): "[The actor] [touch] [the noun]."]
The report touching other people rule response (C) is "[capitalized actor in the nominative case] трога[actor does a verb of class v2a] [noun in the accusative case]."

[The report touching things rule response (A): "[We] [feel] nothing unexpected."]
The report touching things rule response (A) is "Никаких необычных ощущений нет."

[The report touching things rule response (B): "[The actor] [touch] [the noun]."]
The report touching things rule response (B) is "[capitalized actor in the nominative case] трога[actor does a verb of class v2a] [noun in the accusative case]."

[The can't wave what's not held rule response (A): "But [we] [aren't] holding [regarding the noun][those]."]
The can't wave what's not held rule response (A) is "Сперва надо взять [noun in the accusative case]."

[The report waving things rule response (A): "[We] [wave] [the noun]."]
[translate][The report waving things rule response (A): "[We] [wave] [the noun]."]

[The report waving things rule response (B): "[The actor] [wave] [the noun]."]
[translate][The report waving things rule response (B): "[The actor] [wave] [the noun]."]

[The can't pull what's fixed in place rule response (A): "[regarding the noun][They] [are] fixed in place."]
The can't pull what's fixed in place rule response (A) is "[capitalized noun in the nominative case] трудно сдвинуть с места."

[The can't pull scenery rule response (A): "[We] [are] unable to."]
[The can't pull scenery rule response (A): "[We] [are] unable to."]

[The can't pull people rule response (A): "[The noun] [might not like] that."]
[The can't pull people rule response (A): "[The noun] [might not like] that."]

[The report pulling rule response (A): "Nothing obvious [happen]."]
[The report pulling rule response (A): "Nothing obvious [happen]."]

[The report pulling rule response (B): "[The actor] [pull] [the noun]."]
[The report pulling rule response (B): "[The actor] [pull] [the noun]."]

[The can't push what's fixed in place rule response (A): "[regarding the noun][They] [are] fixed in place."]
The can't push what's fixed in place rule response (A) is "[capitalized noun in the accusative case] трудно сдвинуть с места."

[The can't push scenery rule response (A): "[We] [are] unable to."]
The can't push scenery rule response (A) is "[capitalized noun in the accusative case] двигать невозможно."

[The can't push people rule response (A): "[The noun] [might not like] that."]
[translate][The can't push people rule response (A): "[The noun] [might not like] that."]

[The report pushing rule response (A): "Nothing obvious [happen]."]
The report pushing rule response (A) is "Ничего не произошло."

[The report pushing rule response (B): "[The actor] [push] [the noun]."]
[review]The report pushing rule response (B) is "[capitalized actor in the nominative case] толка[actor does a verb of class v1b] [noun in the accusative case]."

[The can't turn what's fixed in place rule response (A): "[regarding the noun][They] [are] fixed in place."]
The can't turn what's fixed in place rule response (A) is "[capitalized noun in the accusative case] трудно сдвинуть с места."

[The can't turn scenery rule response (A): "[We] [are] unable to."]
The can't turn scenery rule response (A) is "[capitalized noun in the accusative case] двигать невозможно."

[The can't turn people rule response (A): "[The noun] [might not like] that."]
[translate][The can't turn people rule response (A): "[The noun] [might not like] that."]

[The report turning rule response (A): "Nothing obvious [happen]."]
The report turning rule response (A) is "Ничего не произошло."

[The report turning rule response (B): "[The actor] [turn] [the noun]."]
[review]The report turning rule response (B) is "[capitalized actor in the nominative case] поворачива[actor does a verb of class v1b] [noun in the accusative case]."

[The can't push unpushable things rule response (A): "[The noun] [cannot] be pushed from place to place."]
[translate][The can't push unpushable things rule response (A): "[The noun] [cannot] be pushed from place to place."]

[The can't push to non-directions rule response (A): "[regarding the noun][They] [aren't] a direction."]
The can't push to non-directions rule response (A) is "Двигать можно только в определённом направлении."

[The can't push vertically rule response (A): "[The noun] [cannot] be pushed up or down."]
[translate][The can't push vertically rule response (A): "[The noun] [cannot] be pushed up or down."]

[The can't push from within rule response (A): "[The noun] [cannot] be pushed from here."]
[translate][The can't push from within rule response (A): "[The noun] [cannot] be pushed from here."]

[The block pushing in directions rule response (A): "[The noun] [cannot] be pushed from place to place."]
[translate][The block pushing in directions rule response (A): "[The noun] [cannot] be pushed from place to place."]

[The innuendo about squeezing people rule response (A): "[The noun] [might not like] that."]
The innuendo about squeezing people rule response (A) is "Не стоит давать волю рукам."
[note that this one has changed significantly since version 6, might need more parallel retranslation]

[The report squeezing rule response (A): "[We] [achieve] nothing by this."]
The report squeezing rule response (A) is "Сжимать [noun in the accusative case] бессмысленно."

[The report squeezing rule response (B): "[The actor] [squeeze] [the noun]."]
The report squeezing rule response (B) is "[capitalized actor in the nominative case] сжима[actor does a verb of class v1b] [the noun in the accusative case]."

[The block saying yes rule response (A): "That was a rhetorical question."]
The block saying yes rule response (A) is "Вопрос был риторическим."

[The block saying no rule response (A): "That was a rhetorical question."]
The block saying no rule response (A) is "Вопрос был риторическим."

[The block burning rule response (A): "This dangerous act [would achieve] little."]
The block burning rule response (A) is "Поджигать [noun in the accusative case] бессмысленно."

[The block waking up rule response (A): "The dreadful truth [are], this [are not] a dream."]
The block waking up rule response (A) is "Поверь, это не сон, а явь."

[The block thinking rule response (A): "What a good idea."]
The block thinking rule response (A) is "Отличная идея."

[The report smelling rule response (A): "[We] [smell] nothing unexpected."]
The report smelling rule response (A) is "Никакого необычного запаха нет."

[The report smelling rule response (B): "[The actor] [sniff]."]
[review]The report smelling rule response (B) is "[capitalized actor in the nominative case] нюха[actor does a verb of class v1b]."

[The report listening rule response (A): "[We] [hear] nothing unexpected."]
The report listening rule response (A) is "Никаких необычных звуков нет."

[The report listening rule response (B): "[The actor] [listen]."]
[review]The report listening rule response (B) is "[capitalized actor in the nominative case] слуша[actor does a verb of class v1b]."

[The report tasting rule response (A): "[We] [taste] nothing unexpected."]
The report tasting rule response (A) is "Никакого необычного вкуса нет."

[The report tasting rule response (B): "[The actor] [taste] [the noun]."]
The report tasting rule response (B) is "[capitalized actor in the nominative case] пробу[actor does a verb of class v1b] [noun in the accusative case]."

[The block cutting rule response (A): "Cutting [regarding the noun][them] up [would achieve] little."]
The block cutting rule response (A) is "Резать [noun in the accusative case] бессмысленно."

[The report jumping rule response (A): "[We] [jump] on the spot."]
The report jumping rule response (A) is "Ты глупо подпрыгиваешь на месте."

[The report jumping rule response (B): "[The actor] [jump] on the spot."]
[review]The report jumping rule response (B) is "[capitalized actor in the nominative case] подпрыгива[actor does a verb of class v1b] на месте."

[The block tying rule response (A): "[We] [would achieve] nothing by this."]
The block tying rule response (A) is "Привязывать [noun in the accusative case] [if second noun is not nothing] к [second noun in the dative case]бессмысленно."

[The block drinking rule response (A): "[There's] nothing suitable to drink here."]
The block drinking rule response (A) is "Выпить [noun in the accusative case] невозможно."

[The block saying sorry rule response (A): "Oh, don't [if American dialect option is active]apologize[otherwise]apologise[end if]."]
The block saying sorry rule response (A) is "О, не нужно извинений."

[The block swinging rule response (A): "[There's] nothing sensible to swing here."]
The block swinging rule response (A) is "Качать [noun in the accusative case] бессмысленно."

[The can't rub another person rule response (A): "[The noun] [might not like] that."]
[translate][The can't rub another person rule response (A): "[The noun] [might not like] that."]

[The report rubbing rule response (A): "[We] [rub] [the noun]."]
[review]The report rubbing rule response (A) is "Ты трешь [noun in the accusative case]."

[The report rubbing rule response (B): "[The actor] [rub] [the noun]."]
The report rubbing rule response (B) is "[capitalized actor in the nominative case] тр[actor does a verb of class v1a] [noun in the accusative case]."

[The block setting it to rule response (A): "No, [we] [can't set] [regarding the noun][those] to anything."]
The block setting it to rule response (A) is "Невозможно установить [noun in the accusative case] на что-либо."

[The report waving hands rule response (A): "[We] [wave]."]
The report waving hands rule response (A) is "Ты глупо машешь руками."

[The report waving hands rule response (B): "[The actor] [wave]."]
The report waving hands rule response (B) is "[capitalized actor in the nominative case] маш[actor does a verb of class v1a] руками."

[The block buying rule response (A): "Nothing [are] on sale."]
The block buying rule response (A) is "[capitalized noun in the nominative case] не прода[noun does a verb of class v1a]ся."

[The block climbing rule response (A): "Little [are] to be achieved by that."]
The block climbing rule response (A) is "Забираться на [noun in the accusative case] бессмысленно."

[The block sleeping rule response (A): "[We] [aren't] feeling especially drowsy."]
The block sleeping rule response (A) is "Сейчас тебя не клонит ко сну."

[generate action rule response (A): "(considering the first sixteen objects only)"]
The generate action rule response (A) is "(ограничиваясь первыми 16 объектами)[command clarification break]".

[generate action rule response (B): "Nothing to do!"]
The generate action rule response (B) is "Но делать ничего не надо!"

[adjust light rule response (A): "[It] [are] [if story tense is present tense]now [end if]pitch dark in [if story tense is present tense]here[else]there[end if]!"]
The adjust light rule response (A) is "Теперь здесь непроглядная тьма!"

[basic accessibility rule response (A) is "You must name something more substantial."]
The basic accessibility rule response (A) is "You must name something more substantial."

[basic visibility rule response (A): "[It] [are] pitch dark, and [we] [can't see] a thing."]
The basic visibility rule response (A) is "Кромешная тьма — не видно ни зги!"

[requested actions require persuasion rule response (A): "[The noun] [have] better things to do."]
The requested actions require persuasion rule response (A) is "[capitalized noun in the nominative case] явно не собира[noun does a verb of class v1b]ся тебя слушать."

[carry out requested actions rule response (A): "[The noun] [are] unable to do that."]
[*review]The carry out requested actions rule response (A) is "[capitalized noun in the nominative case] не мо[if the noun is plural-named]г[otherwise]ж[noun does a verb of class v1a] этого сделать."
	
[access through barriers rule response (A): "[regarding the noun][Those] [aren't] available."]
The access through barriers rule response (A) is "[capitalized noun in the nominative case] не [short form of nedosyagaemyj regarding noun]."

[can't reach inside closed containers rule response (A): "[The noun] [aren't] open."]
The can't reach inside closed containers rule response (A) is "[capitalized noun in the nominative case] не [short form of otkrytyj regarding noun]."

[can't reach inside rooms rule response (A): "[We] [can't] reach into [the noun]."]
[*translate]The can't reach inside rooms rule response (A) is "[We] [can't] reach into [the noun]."

[can't reach outside closed containers rule response (A): "[The noun] [aren't] open."]
The can't reach outside closed containers rule response (A) is "[capitalized noun in the nominative case] не [short form of otkrytyj regarding noun]."

[
list writer internal rule response (A): " ("
list writer internal rule response (B): ")"
list writer internal rule response (C): " and "
]

The list writer internal rule response (C) is " и ".

[list writer internal rule response (D): "providing light"]

[list writer internal rule response (E): "closed"]

	
[list writer internal rule response (F): "empty"]


[list writer internal rule response (G): "closed and empty"]


[list writer internal rule response (H): "closed and providing light"]


[list writer internal rule response (I): "empty and providing light"]


[list writer internal rule response (J): "closed, empty[if serial comma option is active],[end if] and providing light"]


[list writer internal rule response (K): "providing light and being worn"]


[list writer internal rule response (L): "being worn"]


[list writer internal rule response (M): "open"]


[list writer internal rule response (N): "open but empty"]


[list writer internal rule response (O): "closed"]


[list writer internal rule response (P): "closed and locked"]


[list writer internal rule response (Q): "containing"]
The list writer internal rule response (Q) is "содерж[noun does a verb of class v2a]".

[*translate]The list writer internal rule response (R) is  "on [if the noun is a person]whom[otherwise]which[end if] ".
[*translate]The list writer internal rule response (S) is ", on top of [if the noun is a person]whom[otherwise]which[end if] ".
[*translate]The list writer internal rule response (T) is "in [if the noun is a person]whom[otherwise]which[end if] ".
[*translate]The list writer internal rule response (U) is ", inside [if the noun is a person]whom[otherwise]which[end if] ".

[list writer internal rule response (V): "[regarding list writer internals][are]"]
The list writer internal rule response (V) is "". [presume this will work for the verb to be]

[list writer internal rule response (V): "[regarding list writer internals][are]"]
The list writer internal rule response (W) is " ничего". [presume this will work for the verb to be]

[list writer internal rule response (X): "Nothing"]
The list writer internal rule response (X) is "Ничего".

[list writer internal rule response (Y): "nothing"]
The list writer internal rule response (Y) is "ничего".

[*translate]The action processing internal rule response (A) is "[bracket]That command asks to do something outside of play, so it can only make sense from you to me. [The noun] cannot be asked to do this.[close bracket]".

 The action processing internal rule response (B) is "You must name an object."
[*translate]The action processing internal rule response (C) is "You may not name an object."
[*translate]The action processing internal rule response (D) is "You must supply a noun."
[*translate]The action processing internal rule response (E) is "You may not supply a noun."
[*translate]The action processing internal rule response (F) is "You must name a second object."
[*translate]The action processing internal rule response (G) is "You may not name a second object."
[*translate]The action processing internal rule response (H) is "You must supply a second noun."
[*translate]The action processing internal rule response (I) is "You may not supply a second noun."

[action processing internal rule response (J): "(Since something dramatic has happened, your list of commands has been cut short.)"]
The action processing internal rule response (J) is "(Произошло что-то, что укоротило ваш список команд.)"

[action processing internal rule response (K): "I didn't understand that instruction."]
[*review]The action processing internal rule response (K) is "Я не понял эту инструкцию."

[parser error internal rule response (A): "I didn't understand that sentence."]
The parser error internal rule response (A) is "Эта команда непонятна."

[translate]parser error internal rule response (B) is "I only understood you as far as wanting to ".
[translate] parser error internal rule response (C) is "I only understood you as far as wanting to (go) "

[parser error internal rule response (D): "I didn't understand that number."]
The parser error internal rule response (D) is "Это число непонятно."

[parser error internal rule response (E): "[We] [can't] see any such thing."]
The parser error internal rule response (E) is  "Этого предмета здесь нет."

[parser error internal rule response (F): "You seem to have said too little!"]
The parser error internal rule response (F) is "Похоже, надо сказать что-то ещё!"

[parser error internal rule response (G): "[We] [aren't] holding that!"]
The parser error internal rule response (G) is "Этого предмета у тебя нет."

[parser error internal rule response (H): "You can't use multiple objects with that verb."]
The parser error internal rule response (H) is "С этим действием не допускается много объектов."

[parser error internal rule response (I): "You can only use multiple objects once on a line."]
The parser error internal rule response (I) is "Множественные объекты допустимы только один раз."

[parser error internal rule response (J): "I'm not sure what ['][pronoun i6 dictionary word]['] refers to."]
The parser error internal rule response (J) is "Непонятно, к чему относится ['][pronoun i6 dictionary word]['] ."

[parser error internal rule response (K): [We] [can't] see ['][pronoun i6 dictionary word]['] ([the noun]) at the moment."]
The parser error internal rule response (K) is "В данный момент отсутствует ['][pronoun i6 dictionary word][']."

[parser error internal rule response (L): "You excepted something not included anyway!"]
The parser error internal rule response (L) is "Вы исключили нечто не включённое!"

[parser error internal rule response (M): "You can only do that to something animate."]
The parser error internal rule response (M) is "Действие применимо только к одушевлённым объектам."

[parser error internal rule response (N): "That's not a verb I [if American dialect option is active]recognize[otherwise]recognise[end if]."]
The parser error internal rule response (N) is "Этот глагол непонятен."

[parser error internal rule response (O): "That's not something you need to refer to in the course of this game."]
The parser error internal rule response (O) is "Упоминать это в игре нет необходимости."

[parser error internal rule response (P): "I didn't understand the way that finished."]
The parser error internal rule response (P) is "Конец команды непонятен."

[parser error internal rule response (Q): "[if number understood is 0]None[otherwise]Only [number understood in words][end if] of those [regarding the number understood][are] available."]
The parser error internal rule response (Q) is "[if number understood is 0]Ни одного из них нет[otherwise]Только [number understood in words] из них есть[end if] в наличии."

[*translate][parser error internal rule response (R): "That noun did not make sense in this context."]

[parser error internal rule response (S): "To repeat a command like 'frog, jump', just say 'again', not 'frog, again'."]
The parser error internal rule response (S) is "Чтобы повторить команду [bold type]жаба, прыг[roman type], введите [bold type]опять[roman type] (но не [bold type]жаба, опять[roman type])."

[parser error internal rule response (T): "You can't begin with a comma."]
The parser error internal rule response (T) is "Команда не может начинаться с запятой."

[parser error internal rule response (U): "You seem to want to talk to someone, but I can't see whom."]
The parser error internal rule response (U) is "Непонятно, к кому ты обращаешься."

[parser error internal rule response (V): "You can't talk to [the noun]."]
The parser error internal rule response (V) is "Бессмысленно говорить с [noun in the instrumental case]."

[parser error internal rule response (W): "To talk to someone, try 'someone, hello' or some such."]
The parser error internal rule response (W) is "Чтобы обратиться к собеседнику, введите [bold type]собеседник, привет[roman type].";

[parser error internal rule response (X): "I beg your pardon?"]
The parser error internal rule response (X) is "Простите?"

[parser nothing error internal rule response (A): "Nothing to do!"]
The parser nothing error internal rule response (A) is "Действий нет!"

[parser nothing error internal rule response (B): "[There] [adapt the verb are from the third person plural] none at all available!"]
The parser nothing error internal rule response (B) is "Нет совсем ничего подходящего."

[parser nothing error internal rule response (C): "[regarding the noun][Those] [seem] to belong to [the noun]."]
The parser nothing error internal rule response (C) is "[capitalized noun in the nominative case] явно принадлеж[noun does a verb of class v2a] [second noun in the dative case]."

[parser nothing error internal rule response (D): "[regarding the noun][Those] [can't] contain things."]
The parser nothing error internal rule response (D) is "[capitalized noun in the nominative case] не мо[if the noun is plural-named]г[otherwise]ж[noun does a verb of class v1a]  что-либо содержать."

[parser nothing error internal rule response (E): "[The noun] [aren't] open."]
The parser nothing error internal rule response (E) is "[capitalized noun in the nominative case] [short form of zakrytyj regarding noun]."

[parser nothing error internal rule response (F): "[The noun] [are] empty."]
The parser nothing error internal rule response (F) is "В [noun in the prepositional case] ничего нет."

[darkness name internal rule response (A): "Darkness"]
The darkness name internal rule response (A) is "Темнота".

[parser command internal rule response (A): "Sorry, that can't be corrected."]
The parser command internal rule response (A) is "Это невозможно исправить."

[parser command internal rule response (B): "Think nothing of it."]
The parser command internal rule response (B) is "Исправить это нельзя."

[parser command internal rule response (C): "'Oops' can only correct a single word."]
The parser command internal rule response (C) is "'Команда [bold type]ой[roman type] исправляет только одно слово."

[parser command internal rule response (D): "You can hardly repeat that."]
The parser command internal rule response (D) is "Это вряд ли можно повторить."

[parser clarification internal rule response (A): "Who do you mean, "]
The parser clarification internal rule response (A) is "Что имеется в виду: ".

[parser clarification internal rule response (B): "Which do you mean, "]
The parser clarification internal rule response (B) is "Что имеется в виду: ".

[parser clarification internal rule response (C): "Sorry, you can only have one item here. Which exactly?"]
The parser clarification internal rule response (C) is "Но здесь доступен только один предмет. Какой именно?"

[TODO][translate][parser clarification internal rule response (D): "Whom do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?"]

[TODO][translate][parser clarification internal rule response (E): "What do you want [if the noun is not the player][the noun] [end if]to [parser command so far]?"]

[parser clarification internal rule response (F): "those things"]
The parser clarification internal rule response (F) is "эти объекты".

[*translate][parser clarification internal rule response (G): "that"]

[parser clarification internal rule response (H): " or "]
The parser clarification internal rule response (H) is "или".

[yes or no question internal rule response (A): "Please answer yes or no."]
The yes or no question internal rule response (A) is "Ответьте [bold type]да[roman type] или [bold type]нет[roman type]."

[Consider for future revision allowing parser be на ты/вы as a use option.]
[print protagonist internal rule response (A): "[We]"]
The print protagonist internal rule response (A) is "ты".

[print protagonist internal rule response (B): "[ourselves]"]
The print protagonist internal rule response (B) is "себя".

[print protagonist internal rule response (C): "[our] former self"]
The print protagonist internal rule response (C) is "ты (ранее)".

[standard implicit taking rule response (A): "(first taking [the noun])[command clarification break]"]
The standard implicit taking rule response (A) is "(сначала взяв [noun])[command clarification break]".

[standard implicit taking rule response (B): "([the second noun] first taking [the noun])[command clarification break]"]
The standard implicit taking rule response (B) is "([the second noun] сначала взяв [the noun])[command clarification break]".

[print obituary headline rule response (A): " You have died "]
[not quite == dead, but lost is probably close enough and what was used in RI6.  The formal you is probably used here because it avoids the issue of requiring gender-specific past-participle of "lost" for the informal you; [TOCONSIDER] rephrase to get around this. Maybe "VICTORY! or DEFEAT!  ??]
The print obituary headline rule response (A) is "  Вы проиграли  "

[print obituary headline rule response (B): " You have won "]
The print obituary headline rule response (B) is " Вы выиграли "

[print obituary headline rule response (C): " The End "]
The print obituary headline rule response (C) is " Конец "

[immediately undo rule response (A): "The use of 'undo' is forbidden in this story."]
[translate]The immediately undo rule response (A) is "The use of 'undo' is forbidden in this story."

[immediately undo rule response (B): "You can't 'undo' what hasn't been done!"]
The immediately undo rule response (B) is "Нельзя отменить то, что не сделано!"

[immediately undo rule response (C): "Your interpreter does not provide 'undo'. Sorry!"]
The immediately undo rule response (C) is "Интерпретатор не поддерживает отмену хода."

[immediately undo rule response (D): "'Undo' failed. Sorry!"]
The immediately undo rule response (D) is "Отменить ход не удалось."

[immediately undo rule response (E): "[bracket]Previous turn undone.[close bracket]"]
The immediately undo rule response (E) is "[bracket]Предыдущий ход отменён.[close bracket]"

[immediately undo rule response (F): "'Undo' capacity exhausted. Sorry!"]
[translate][immediately undo rule response (F): "'Undo' capacity exhausted. Sorry!"]

[quit the game rule response (A): "Are you sure you want to quit? "]
[review]The quit the game rule response (A) is "Tы хочешь покинуть игру? "

[save the game rule response (A): "Save failed."]
The save the game rule response (A) is "Сохранить игру не удалось."

[save the game rule response (B): "Ok."]
The save the game rule response (B) is "Игра сохранена."

[restore the game rule response (A): "Restore failed."]
The restore the game rule response (A) is "Restore failed."

[restore the game rule response (B): "Ok."]
The restore the game rule response (B) is "Игра восстановлена."

[restart the game rule response (A): "Are you sure you want to restart? "]
The restart the game rule response (A) is "Ты хочешь перезапустить игру? "

[restart the game rule response (B): "Failed."]
The restart the game rule response (B) is "Перезапустить игру не удалось."

[verify the story file rule response (A): "The game file has verified as intact."]
The verify the story file rule response (A) is "Файл игры проверен успешно."

[verify the story file rule response (B): "The game file did not verify as intact, and may be corrupt."]
The verify the story file rule response (B) is "Файл игры не прошёл проверку и может быть повреждён."

[switch the story transcript on rule response (A): "Transcripting is already on."]
The switch the story transcript on rule response (A) is "Режим транскрипта уже включён."

[switch the story transcript on rule response (B): "Start of a transcript of"]
The switch the story transcript on rule response (B) is "Включение транскрипта: "

[switch the story transcript on rule response (C): "Attempt to begin transcript failed."]
The switch the story transcript on rule response (C) is "Включить транскрипт не удалось."

[switch the story transcript off rule response (A): "Transcripting is already off."]
The switch the story transcript off rule response (A) is "Режим транскрипта уже выключен."

[switch the story transcript off rule response (B): "[line break]End of transcript."]
The switch the story transcript off rule response (B) is "[line break]Выключение транскрипта."

[switch the story transcript off rule response (C): "Attempt to end transcript failed."]
The switch the story transcript off rule response (C) is "Выключить транскрипт не удалось."

[announce the score rule response (A): "[if the story has ended]In that game you scored[otherwise]You have so far scored[end if] [score] out of a possible [maximum score], in [turn count] turn[s]"]
The announce the score rule response (A) is "[if the story has ended]В эту попытку[otherwise]К этому моменту[end if] вы набрали [score] (из [maximum score] возможных) за [turn count] turn[s]"

[announce the score rule response (B): ", earning you the rank of "]
[translate]The announce the score rule response (B) is ", earning you the rank of "

[announce the score rule response (C): "[There] [are] no score in this story."]
The announce the score rule response (C) is "В этой игре счёт не предусмотрен."

[announce the score rule response (D): "[bracket]Your score has just gone up by [number understood in words] point[s].[close bracket]"]
The announce the score rule response (D) is "[bracket]Ваш счёт увеличился на [number understood in words].[close bracket]"

[announce the score rule response (E): "[bracket]Your score has just gone down by [number understood in words] point[s].[close bracket]"]
The announce the score rule response (E) is "[bracket]Ваш счёт уменьшился на [number understood in words].[close bracket]"

[standard report preferring abbreviated room descriptions rule response (A): " is now in its 'superbrief' mode, which always gives short descriptions of locations (even if you haven't been there before)."]
The standard report preferring abbreviated room descriptions rule response (A) is " сейчас в [bold type]кратком[roman type] режиме (всегда краткие описания мест)."

[standard report preferring unabbreviated room descriptions rule response (A): " is now in its 'verbose' mode, which always gives long descriptions of locations (even if you've been there before)."]
The standard report preferring unabbreviated room descriptions rule response (A) is " сейчас в [bold type]длинном[roman type] режиме (всегда длинные описания мест)."

[standard report preferring sometimes abbreviated room descriptions rule response (A): " is now in its 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise."]
The standard report preferring sometimes abbreviated room descriptions rule response (A) is " сейчас в [bold type]нормальном[bold type] режиме (длинные описания для новых мест, краткие для старых)."

[standard report switching score notification on rule response (A): "Score notification on."]
The standard report switching score notification on rule response (A) is "Извещения о счёте включены."

[standard report switching score notification off rule response (A): "Score notification off."]
The standard report switching score notification off rule response (A) is "Извещения о счёте выключены."

[announce the pronoun meanings rule response (A): "At the moment, "]
The announce the pronoun meanings rule response (A) is "В данный момент: "

[announce the pronoun meanings rule response (B): "means "]
The announce the pronoun meanings rule response (B) is "означает "

[announce the pronoun meanings rule response (C): "is unset"]
The announce the pronoun meanings rule response (C) is "отсутствует"

[And from the Vorple Module]

The display Vorple credits rule response (A) is "Ворпeл версия [version number][line break]".


Chapter 6 - Some  grammar


Section 1 - Noun Dictionary

[In the order: nominative singular, genitive singular, dative singular, accusative singular, prepositional singular, instrumental singular, nominative plural, genitive plural, dative plural, accusative plural, prepositional plural, instrumental plural]

[

""		do nothing, use the supplied form: nominative singular
- 		delete last letter
~		swap position of last two letters
letter		add a letter

Note that unicode characters can't appear as a topic and unicode text won't match up with unicode text in table, hence use of transliterated exemplars.

]

Table of Noun Inflections
exemplar 	pattern
[first declension]
"voda"	{"","-ы","-е","-у","-ой","-е","-ы","-","м","-ы","ми","х"}
"korobka"	{"","-и","-е","-у","-ой","-е","-и","-о~","м","-и","ми","х"}
"kasha"	{"","-и","-е","-у","-ей","-е","-и","-","м","-и","ми","х"}
"zemlya"	{"","-и","-е","-ю","-ёй","-е","-и","-e~ь","м","-и","ми","х"}
"lektsiya"	{"","-и","-и","-ю","-ей","-и","-и","-й","м","-и","ми","х"}
[second declension]
"dom"	{"","а","у","","ом","е","а","ов","ам","а","ами","ах"}
"ogurets"	{"","~-а","~-у","","~-ом","~-е","~-ы","~-ов","~-ам","~-ы","~-ами","~-ах"}
"medved&"	{"","-я","-ю","-я","-ем","-е","-и","-ей","-ям","-ей","-ями","-ях"}
"znoj"	{"","-я","-ю","","-ем","-е","-и","-ев","-ям","-и","-ями","-ях"}
"litij"	{"","-я","-ю","","-ем","-и","-и","-ев","-ям","-и","-ями","-ях"}
"oblako"	{"","-а","-у","","м","-е","-а","ов","-ам","-а","-ами","-ах"}
"pole"	{"","-я","-ю","","м","","-я","й","-ям","-я","-ями","-ях"}
"izvestie"	{"","-я","-ю","","м","-и","-я","-й","-ям","-я","-ями","-ях"}
"vremya"	{"","-ени","-ени","","-енем","-ени","-ена","-ён","-енам","-ена","-енами","-енах"}
[third declension]
"tetrad&"	{"","-и","-и","","ю","-и","-и","-ей","-ям","-и","-ями","-ях"}
"noch&"	{"","-и","-и","","ю","-и","-и","-ей","-aм","-и","-ами","-ах"}
"doch&"	{"","-ери","-ери","","ерью","-ери","-ери","-ерей","-ерям","-ерей","-ерьми","-ерях"}

[A subset of the full listwriter for use in generating you-can-see]

To generate listing of (itemlist - a list of things) in the (itemcase - a grammatical case) case:
	repeat with item running through itemlist:
		if item is concealed:
			remove item from itemlist;
		if item is not marked for listing:
			remove item from itemlist;
	repeat with N running from 1 to the number of entries in itemlist:
		if N is greater than 1 and N is the number of entries in itemlist:
			say " и ";
		let item be entry N of itemlist;
		say item in the itemcase case;
		let T be a list of text;[list of parenthetical attributes of the item, not including lit, worn, etc., here]
		if item is openable and item is closed:
			add "[short form of zakrytyj regarding item][if item is locked]и [short form of zapertyj regarding item][end if]" to T;
		if item is a container and the number of things in item is zero:
			add "[short form of pustyj regarding item]" to T;
		if the number of entries in T is greater than 0:
			say " ([T])";
		let mentionables be 0;
		repeat with inneritem running through things enclosed by the item:
			[would need to explictly designate items on a person as marked for listing]			
			if item is a supporter and inneritem is on item:
				now inneritem is marked for listing;
				increase mentionables by 1;
			otherwise if item is a container and (item is open or item is transparent) and inneritem is in item:
				now inneritem is marked for listing;
				increase mentionables by 1;
		if mentionables is greater than 0:
			say " (";
			let stuff be the list of marked for listing things enclosed by the item;
			if item is a person:
				say "у [long form of kotoryj regarding item in the prepositional case] есть";
			otherwise if item is a supporter:
				say "на [long form of kotoryj regarding item in the prepositional case] сто[if mentionables is 1]ит[otherwise]ят[end if]";
			otherwise:
				say "в [long form of kotoryj regarding item in the prepositional case] сто[if mentionables is 1]ит[otherwise]ят[end if]";
			say " ";
			generate listing of stuff in the nominative case;
			say ")";
		if the number of entries in itemlist is greater than 2 and N is less than (the number of entries in itemlist minus 1):
			say ", ".
			
To say listing of (itemlist - a list of things) in the (itemcase - a grammatical case) case:
	let L be a list of text;
	repeat with item running through itemlist:
		add "[item in the itemcase case]" to L;
	say L.

[says noun and coupled modifier]

To say (item - a declinable object) in the (itemcase - a grammatical case) case:
	let IG be the grammatical gender of the item;
	let IM be the multiplicity of the item;
	if item is a thing and modifier of item is not null:
		say long form of modifier of the item in the itemcase case IG gender IM;
		say " ";
	say item in the itemcase case IM.
	
[say just the noun]

To say (item - an object) in the (itemcase - a grammatical case) case (itemmult - a multiplicity):
	let N be the name of the item;
	let itempattern be the inflection pattern of the item;
	[say "Calling text routine with text [N] based on a pattern of [itempattern].";]
	say N in the itemcase case itemmult multiplicity with itempattern pattern.

To say (itemtext - a text) in the (itemcase - a grammatical case) case (itemmult - a multiplicity) multiplicity with (itempattern - a text) pattern:
	[say "Text routine called with itemtext [itemtext] in the [itemcase] case and [itemmult] multiplicity with [itempattern] pattern.";]
	if itempattern is not an exemplar listed in the Table of Noun Inflections:
		say "ERROR: declination pattern not found in lookup table";
		the rule fails;
	let termination be "";
	let T be itemtext;
	let terminationList be the pattern corresponding to an exemplar of itempattern in the Table of Noun Inflections;
	if the itemmult is singular:
		if the itemcase is:
			-- nominative:
				now the termination is "[entry 1 of terminationList]";
			-- genitive:
				now the termination is "[entry 2 of terminationList]";
			-- dative:
				now the termination is "[entry 3 of terminationList]";
			-- accusative:
				now the termination is "[entry 4 of terminationList]";
			-- instrumental:
				now the termination is "[entry 5 of terminationList]";
			-- prepositional:
				now the termination is "[entry 6 of terminationList]";	
	otherwise:[item is plural]
		if the itemcase is:
			-- nominative:
				now the termination is "[entry 7 of terminationList]";
			-- genitive:
				now the termination is "[entry 8 of terminationList]";
			-- dative:
				now the termination is "[entry 9 of terminationList]";
			-- accusative:
				now the termination is "[entry 10 of terminationList]";
			-- instrumental:
				now the termination is "[entry 11 of terminationList]";
			-- prepositional:
				now the termination is "[entry 12 of terminationList]";
	[say "The current termination is: [termination].";]
	while termination is not empty:
		let C be character number 1 in termination;
		if C is:
			-- "-":
				replace the regular expression "(\w*)\w" in T with "\1"; [chop 1 letter off the end]
			-- "~":
				replace the regular expression "(\w*)(\w)(\w)" in T with "\1\3\2"; [invert last 2 letters]
			-- otherwise:
				let T be "[T][C]"; [append one character]
		replace character number 1 in termination with "";
	say T.
	
Section 2 - Known Adjectives
[kind of a pain, but beats re-typing them each time; these do double duty for both short and long form stems]

Table of Known Adjectives
adjective	rus-adjective	
null	""
pustyj	"пустый"
nedosyagaemyj	"недосягаемый"
nadetyj	"надетый"
otkrytyj	"открытый"
zakrytyj	"закрытый"
zapertyj	"запертый"
zakreplennyj	"закрепленный"
broshennyj	"брошенный"
kotoryj	"который"
bol&shoj	"большой"
malen&kij	"маленький"
khoroshij	"хороший"
gotovyj	"готовый"
korotkij	"короткий"
redkij	"редкий"
vazhnyj	"важный"
bol&noj	"больной"
polnyj	"полный"
smeshnoj	"смешной"
zloj	"злой"
spokojnyj	"спокойный"
blizkij	"близкий"
novyj	"новый"
starshij	"старший"
sinij	"синий"
tolstyj	"толстый"
rezinovyj	"резиновый"
derevyannyj	"деревянный"
spelyj	"спелый"
krasnyj	"красный"
vklyuchennyj	"включенный"
vyklyuchennyj	"выключенный"


	
Section 3 - Decline Long From Adjectives

To say long form of (adj - an adjective) regarding (item - a thing) in the (case - a grammatical case) case:
	if adj is null:
		the rule fails;
	let G be the grammatical gender of the item;
	let C be the case;
	let M be the multiplicity of the item;
	say long form of adj in the C case G gender M.
	
[Algorithmic declension of regular long form adjectives]
To say long form of (adj - an adjective) in the (itemcase - a grammatical case) case (itemgender - grammatical gender) gender (itemmult - a multiplicity):
	if adj is null:
		the rule fails;
	if adj is not an adjective listed in the Table of Known Adjectives:
		say "ERROR: adjective not found in Table of Known Adjectives.";
		the rule fails;
	let item be the rus-adjective corresponding to the adjective of adj in the Table of Known Adjectives;
	if (itemcase is nominative and itemgender is masculine gender and itemmult is singular) or (itemcase is accusative and itemgender is masculine gender and itemmult is singular):
		say item;
		the rule succeeds; [if it's nom masc singular just use the exemplar.]
	let stem be the item; 
	let termination be stem;
	let newterm be "";
	replace the regular expression "(\w*)(\w{3})" in stem with "\1"; [extract stem]
	replace the regular expression "(\w*)(\w{3})" in termination with "\2"; [extract terminal three characters, a consonant, a vowel and an й from the male nominative singular exemplar.]
	let category be 1; [default to hard consonant stem];
	[	
		#		category
				________________________________
		1		hard consonant stem
		2		нь
		3		stressed stem (like большой)
		4		к, г, х
		5		sibilants (ж, ш, щ, ч)
       ]
	let antepenultimate be character number 1 in termination;
	let penultimate be character number 2 in termination;
	if antepenultimate is "н":
		if penultimate is "и":
			let category be 2; [otherwise it is assumed the is н hard]
	otherwise if penultimate is "о":
		let category be 3;
	otherwise if antepenultimate matches the regular expression "<кгх>":
		let category be 4;
	otherwise if antepenultimate matches the regular expression "<жшщч>":
		let category be 5;
	if category is 1 and penultimate is not "ы":
		say "ERROR: hard consonant adjective, but termination is not ы";
		the rule fails;
	if the itemmult is:
		-- plural:
			if itemcase is:[collapse redundancies]
				-- accusative:
					let itemcase be nominative;
				-- prepositional:
					let itemcase be genitive;				
			if itemcase is:
				-- nominative:
					if the category is 1:
						let newterm be "ые";
					otherwise:
						let newterm be "ие";
				-- genitive:
					if the category is 1:
						let newterm be "ых";
					otherwise:
						let newterm be "их";
				-- dative:
					if the category is 1:
						let newterm be "ым";
					otherwise:
						let newterm be "им";
				-- instrumental:
				if the category is 1:
						let newterm be "ыми";
					otherwise:
						let newterm be "ими";
				-- otherwise:
					say "ERROR: ITEM CASE NOT DEFINED";
					the rule fails;
		-- singular: [nom masc sing is the exemplar itself and returned above.]
			if (itemcase is accusative and itemgender is neuter gender):[recode acc neu sing to nominative]
				let itemcase be nominative;
			if itemcase is:
				-- nominative:
					if the category is:
						-- 1:
							if the itemgender is: [m is addressed at start of routine as default]
								-- feminine gender:
									let newterm be "ая";
								-- neuter gender:
									let newterm be "ое";
						-- 2:
							if itemgender is:
								-- feminine gender:
									let newterm be "яя";
								-- neuter gender:
									let newterm be "ее";
						-- 3:		
							if itemgender is:
								-- feminine gender:
									let newterm be "ая";
								-- neuter gender:
									let newterm be "ое";								
						-- 4:
							if itemgender is:
								-- feminine gender:
									let newterm be "ая";
								-- neuter gender:
									let newterm be "ое";
						-- 5:	
							if itemgender is:
								-- feminine gender:
									let newterm be "ая";
								-- neuter gender:
									let newterm be "ее";		
				-- genitive:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is feminine gender:
							let newterm be "ей";
						otherwise:
							let newterm be "его";
					otherwise:
						if itemgender is feminine gender:
							let newterm be "ой";
						otherwise:
							let newterm be "ого";
				-- dative:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is feminine gender:
							let newterm be "ей";
						otherwise:
							let newterm be "ему";
					otherwise:
						if itemgender is feminine gender:
							let newterm be "ой";
						otherwise:
							let newterm be "ому";
				-- accusative: [only dealing with feminine since masculine and neuter are recoded above as nominative]
					if category is 2: [нь]
						let newterm be "юю";
					otherwise:
						let newterm be "ую";
				-- instrumental:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is feminine gender:
							let newterm be "ей";
						otherwise:
							let newterm be "им";
					otherwise if category is 3 or category is 4: [stressed]
						if itemgender is feminine gender:
							let newterm be "ой";
						otherwise:
							let newterm be "им";
					otherwise:
						if itemgender is feminine gender:
							let newterm be "ой";
						otherwise:
							let newterm be "ым";
				-- prepositional:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is feminine gender:
							let newterm be "ей";
						otherwise:
							let newterm be "ем";
					otherwise:
						if itemgender is feminine gender:
							let newterm be "ой";
						otherwise:
							let newterm be "ом";
	say "[stem][antepenultimate][newterm]".
		
Section 4 - Short Form Adjectives

To say short form of (adj - an adjective) regarding (item - a thing):
	if adj is null:
		the rule fails;
	let G be the grammatical gender of the item;
	let M be the multiplicity of the item;
	say short form of adj with G gender M.

To say short form of (adj - an adjective) with (itemgender - grammatical gender) gender (itemmult - a multiplicity) :
	if adj is null:
		the rule fails;
	if adj is not an adjective listed in the Table of Known Adjectives:
		say "ERROR: adjective not found in Table of Known Adjectives.";
		the rule fails;
	let item be the rus-adjective corresponding to the adjective of adj in the Table of Known Adjectives;
	if item exactly matches the text "большой":
		if itemmult is plural:
			say "велики";
		otherwise:
			if itemgender is:
				-- masculine gender:
					say "велик";
				-- feminine gender:
					say "велика";
				-- neuter gender:
					say "велико";
		the rule succeeds;
	if item exactly matches the text "маленький":
		if itemmult is plural:
			say "малы";
		otherwise:
			if itemgender is:
				-- masculine gender:
					say "мал";
				-- feminine gender:
					say "мала";
				-- neuter gender:
					say "мало";
		the rule succeeds;
	[if it'snot one of those special cases:]	
	let stem be item;
	let intercalator be item;
	replace the regular expression "(\w*)(\w)\w" in intercalator with "\2"; [next to last letter, a vowel]
	replace the regular expression "(\w*)(\w{2})" in stem with "\1"; [extract stem, all but last two letters]
	replace the regular expression "(\w*н)н" in stem with "\1"; [drop final of double n in stem]
	if itemmult is plural:
		say stem;
		if stem exactly matches the regular expression "\w*<гкхжшщч>":
			say "и";
		otherwise:
			say "ы";
	otherwise:
		if itemgender is:
			-- feminine gender:
				say "[stem]а";
			-- neuter gender:
				say "[stem]о";
			-- masculine gender:
				if stem exactly matches the regular expression "<^аеиоуыэ><^аеиоуыэ>":
					replace the regular expression "(\w)(\w)" in stem with "\1[intercalator]\2";
				otherwise if stem exactly matches the regular expression "\w*<^аеиоуыэ>к":
					replace the regular expression "(\w*)(к)" in stem with "\1ок";
				otherwise if stem exactly matches the regular expression "\w*<^аеиоуыэ>н":
					if the stem exactly matches the regular expression "полн|смешн":
						replace the regular expression "(\w*)(н)" in stem with "\1он";
					otherwise if the stem exactly matches the regular expression "\w*<йь>н":
						replace the regular expression "(\w*)(<йь>)н" in stem with "\1ен";
					otherwise:
						replace the regular expression "(\w*)(н)" in stem with "\1ен";
				say stem.	
				
Section 5 - Third Person Verb Formation

To say (item - thing) does a verb of class (class - verb class):
	if the item is plural-named:
		if the class is:
			-- v1a: 
				say "ут";
			-- v1b:
				say "ют";
			-- v2a:
				say "ат";
			-- v2b:
				say "ят";
	otherwise:
		if the class is:
			-- v1a: 
				say "ет";
			-- v1b:
				say "ет";
			-- v2a:
				say "ит";
			-- v2b:
				say "ит";
				

	
Section 6 - Das Kapital

To say (phrase - text) with initial capital:
	let LC be character number 1 in phrase;
	let UC be "";
	if there is an upper corresponding to a lower of LC in the Table of UpperCase:
		let UC be the upper corresponding to the lower of LC in the Table of UpperCase;
		replace character number 1 in phrase with UC;
	say phrase.

Table of UpperCase
lower	upper
"а"	"А"
"б"	"Б"
"в"	"В"
"г"	"Г"
"д"	"Д"
"е"	"Е"
"ё"	"Ё"
"ж"	"Ж"
"з"	"З"
"и"	"И"
"й"	"Й"
"к"	"К"
"л"	"Л"
"м"	"М"
"н"	"Н"
"о"	"О"
"п"	"П"
"р"	"Р"
"с"	"С"
"т"	"Т"
"у"	"У"
"ф"	"Ф"
"х"	"Х"
"ц"	"Ц"
"ч"	"Ч"
"ш"	"Ш"
"щ"	"Щ"
"ъ"	"Ъ"
"ь"	"Ь"
"э"	"Э"
"ю"	"Ю"
"я"	"Я"


Chapter 7 - Grammar Tweaks

[Rule for listing nondescript items:
	let L be a list of things;
	say "Ты видишь здесь ";
	repeat with item running through things enclosed by the location:
		if the item is a person or the item is a door or the item is enclosed by the player:
			next;
		add item to L;
	repeat with N running from 1 to the number of entries in L:
		if N is greater than 1 and N is the number of entries in L:
			say " и ";
		let E be entry N of L;
		say "[printed name of E in the acc case]";
		if the number of entries in L is greater than 2 and N is less than (the number of entries in L minus 1):
			say ", ";
	say "."]
	
Understand "ya/menya" as yourself.

Chapter 8 - World

The Laboratory (f) is a room.  The description is "Большая комната для научных экспериментов. Центральный коридор находится к югу.". The printed name is "Лаборатория". 

The daughter (f) is in the laboratory. The description is "Ваша дочь." The name is "дочь". The inflection pattern is "noch&".  Understand "doch&" as daughter. 

The worktable (m) is a supporter in the Laboratory. The description is "Изношенный рабочий стол." The name is "стол". The inflection pattern is "dom". The modifier is bol&shoj. Understand "rabochij/stol" as the worktable. The worktable is lit.

A box (f) is an open transparent container. It is in the laboratory. The description is "Картонная коробка." The name is "коробка". The inflection pattern is "korobka". The modifier is novyj. Understand "kartonnaya/korobka/kartonnuyu/korobku" as box. 

The workbook (f) is in box. The description is "Тетрадь с миллиметровкой." The name is "тетрадь". The inflection pattern is "tetrad&". The modifier is malen&kij. Understand "tetrad&" as the workbook. The workbook is lit.

The hall (m) is south from Laboratory. "Узкий коридор. Ваша лаборатория к северу, санузел [unicode 8212] к западу, а столовая [unicode 8212] на востоке." The printed name is "Коридор". 

The sabre (f) is in the hall. The description is "Ржавая сабля."  The name is "сабля". The inflection pattern is "zemlya". The modifier of sabre is starshij. Understand "sablya" as the sabre.

The plant (n) is in the hall. The description is "Растение без цветов." The name is "растение". The inflection pattern is "izvestie". Understand "rastenie" as the plant. 

The portrait (m) is in the hall. The description is "Портрет старика." The name of portrait is "портрет".  The inflection pattern is "dom". The modifier of portrait is sinij. Understand "portret/starika" as portrait. 

The book (f) is in the hall. The description is "Толстая книга." The name of book is "книга". The inflection pattern is "voda". The modifier of book is tolstyj. Understand "kniga/knigu" as the book. 

The mummy (f) is in the hall. The description is "Египетские мумии." The name is "мумия". The inflection pattern is "lektsiya". Understand "mumiya/mumiyu" as the mummy. 

The bathroom (m) is west from the hall. The description is "Ничем не примечательная ванная комната. Центральный коридор находится к востоку." The printed name is "Санузел".

The toilet (m) is a supporter in the bathroom. The description is "Белый унитаз."  The name of toilet is "унитаз". The inflection pattern is "dom".  Understand "belyj/unitaz" as the toilet.

The sink (f) is in the bathroom. It is fixed in place. The description is "Маленькая раковина. На данный момент, похоже, сломан." The name is "раковина". The inflection pattern is "voda". Understand "rakovina/rakovinu/rakovine" as the sink.

The bathtub (f) is an open fixed in place container in the bathroom. It is fixed in place. The description is "Чугунная ванна.". The name is "ванна". The inflection pattern is "voda". Understand "vanna/vannu/vanne" as the bathtub.

The rubber duck (f) is in the bathtub. The description of the rubber duck is "Крошечная желтая утка". The name of the rubber duck is "утка". The inflection pattern is "korobka". The modifier is rezinovyj. Understand "rezinovaya/rezinovayu/utochka/utochku" as the rubber duck.

The cafeteria (f) is east from the hall. "Место, где все обедают. Центральный коридор находится к западу." The printed name of the cafeteria is "Столовая".

The dining table (m) is in the cafeteria. It is a supporter. The description is "Деревянный стол." The name is "стол". The inflection pattern is "dom". The modifier is derevyannyj. Understand "derevyannyj/stol" as the dining table.

A cucumber (m) is edible. It is on the dining table. The description is "Спелый огурец." The name of cucumber is "огурец". The inflection pattern is "ogurets". The modifier is spelyj. Understand "spelyj/ogurets" as the cucumber. 

The kasha (f) is edible. It is on the dining table. The description is "Каша без молока." The name of kasha is "каша". The inflection pattern is "kasha". Understand "kasha/kashu" as kasha. 

The apple (n) is edible. It is on the dining table. The description is "Красное яблоко." The name of apple is "яблоко". The  The inflection pattern is "oblako". The modifier of apple is krasnyj. Understand "yabloko" as the apple. 

Chapter 9 - Transliterations

[clear definitions]

Understand nothing as waiting.

Understand the command "take" as something new.
Understand the command "carry" as something new.
Understand the command "hold" as something new.
Understand the command "get" as something new.
Understand the command "pick" as something new.
Understand the command "stand" as something new.
Understand the command "remove" as something new.
Understand the command "shed" as something new.
Understand the command "doff" as something new.
Understand the command "disrobe" as something new.
Understand the command "don" as something new.
Understand the command "wear" as something new.
Understand the command "put" as something new.
Understand the command "drop" as something new.
Understand the command "throw" as something new.
Understand the command "discard" as something new.
Understand the command "give" as something new.
Understand the command "pay" as something new.
Understand the command "offer" as something new.
Understand the command "feed" as something new.
Understand the command "present" as something new.
Understand the command "display" as something new.
Understand the command "show" as something new.
Understand the command "go" as something new.
Understand the command "walk" as something new.
Understand the command "leave" as something new.
Understand the command "run" as something new.
Understand the command "inventory" as something new.
Understand the command "i" as something new.
Understand the command "inv" as something new.
Understand the command "look" as something new.
Understand the command "l" as something new.
Understand the command "consult" as something new.
Understand the command "open" as something new.
Understand the command "unwrap" as something new.
Understand the command "uncover" as something new.
Understand the command "shut" as something new.
Understand the command "cover" as something new.
Understand the command "close" as something new.
Understand the command "cross" as something new.
Understand the command "enter" as something new.
Understand the command "sit" as something new.
Understand the command "exit" as something new.
Understand the command "out" as something new.
Understand the command "x" as something new.
Understand the command "watch" as something new.
Understand the command "describe" as something new.
Understand the command "check" as something new.
Understand the command "examine" as something new.
Understand the command "read" as something new.
Understand the command "yes" as something new.
Understand the command "y" as something new.
Understand the command "yes" as something new.
Understand the command "no" as something new.
Understand the command "sorry" as something new.
Understand the command "shit" as something new.
Understand the command "fuck" as something new.
Understand the command "damn" as something new.
Understand the command "bother" as something new.
Understand the command "curses" as something new.
Understand the command "drat" as something new.
Understand the command "darn" as something new.
Understand the command "search" as something new.
Understand the command "wave" as something new.
Understand the command "adjust" as something new.
Understand the command "set" as something new.
Understand the command "drag" as something new.
Understand the command "pull" as something new.
Understand the command "push" as something new.
Understand the command "move" as something new.
Understand the command "shift" as something new.
Understand the command "clear" as something new.
Understand the command "press" as something new.
Understand the command "rotate" as something new.
Understand the command "twist" as something new.
Understand the command "unscrew" as something new.
Understand the command "screw" as something new.
Understand the command "turn" as something new.
Understand the command "switch" as something new.
Understand the command "lock" as something new.
Understand the command "unlock" as something new.
Understand the command "attack" as something new.
Understand the command "break" as something new.
Understand the command "smash" as something new.
Understand the command "hit" as something new.
Understand the command "fight" as something new.
Understand the command "torture" as something new.
Understand the command "wreck" as something new.
Understand the command "crack" as something new.
Understand the command "destroy" as something new.
Understand the command "murder" as something new.
Understand the command "kill" as something new.
Understand the command "punch" as something new.
Understand the command "thump" as something new.
Understand the command "wait" as something new.
Understand the command "z" as something new.
Understand the command "answer" as something new.
Understand the command "say" as something new.
Understand the command "shout" as something new.
Understand the command "speak" as something new.
Understand the command "tell" as something new.
Understand the command "ask" as something new.
Understand the command "eat" as something new.
Understand the command "sleep" as something new.
Understand the command "nap" as something new.
Understand the command "sing" as something new.
Understand the command "climb" as something new.
Understand the command "scale" as something new.
Understand the command "purchase" as something new.
Understand the command "buy" as something new.
Understand the command "squash" as something new.
Understand the command "squeeze" as something new.
Understand the command "dive" as something new.
Understand the command "swing" as something new.
Understand the command "blow" as something new.
Understand the command "pray" as something new.
Understand the command "wake" as something new.
Understand the command "awake" as something new.
Understand the command "awaken" as something new.
Understand the command "kiss" as something new.
Understand the command "embrace" as something new.
Understand the command "hug" as something new.
Understand the command "think" as something new.
Understand the command "sniff" as something new.
Understand the command "smell" as something new.
Understand the command "listen" as something new.
Understand the command "hear" as something new.
Understand the command "taste" as something new.
Understand the command "feel" as something new.
Understand the command "touch" as something new.
Understand the command "rub" as something new.
Understand the command "shine" as something new.
Understand the command "polish" as something new.
Understand the command "sweep" as something new.
Understand the command "clean" as something new.
Understand the command "dust" as something new.
Understand the command "wipe" as something new.
Understand the command "scrub" as something new.
Understand the command "attach" as something new.
Understand the command "fix" as something new.
Understand the command "fasten" as something new.
Understand the command "tie" as something new.
Understand the command "light" as something new.
Understand the command "burn" as something new.
Understand the command "swallow" as something new.
Understand the command "sip" as something new.
Understand the command "drink" as something new.
Understand the command "fill" as something new.
Understand the command "slice" as something new.
Understand the command "prune" as something new.
Understand the command "chop" as something new.
Understand the command "cut" as something new.
Understand the command "jump" as something new.
Understand the command "skip" as something new.
Understand the command "hop" as something new.
Understand the command "score" as something new.
Understand the command "quit" as something new.
Understand the command "q" as something new.
Understand the command "save" as something new.
Understand the command "restart" as something new.
Understand the command "restore" as something new.
Understand the command "version" as something new.
Understand the command "script" as something new.
Understand the command "transcript" as something new.
Understand the command "superbrief" as something new.
Understand the command "short" as something new.
Understand the command "verbose" as something new.
Understand the command "long" as something new.
Understand the command "brief" as something new.
Understand the command "normal" as something new.
Understand the command "nouns" as something new.
Understand the command "pronouns" as something new.
Understand the command "notify" as something new.
Understand the command "insert" as something new.
Understand the command "smash" as something new.
Understand the command "purchase" as something new.
Understand the command "squash" as something new.
Understand the command "taste" as something new.
Understand the command "fasten" as something new.

[Действия, Группа 1]

Understand "konets" as quitting the game.
Understand "k" as quitting the game.
Understand "nachalo" as restarting the game.
Understand "perezapusk" as restarting the game.
Understand "zagruzit&" as restoring the game.
Understand "vosst" as restoring the game.
Understand "sokh" as saving the game.
Understand "sokhranit&" as saving the game.
Understand "schet" as requesting the score.
Understand "otchet" as switching the story transcript on.
Understand "skript" as switching the story transcript on.
Understand "skript vkl" as switching the story transcript on.
Understand "otchet vkl" as switching the story transcript on.
Understand "skript vykl" as switching the story transcript off.
Understand "otchet vykl" as switching the story transcript off.
Understand "versiya" as requesting the story file version.

[Действия, Группа 1]

Understand "osmotret&sya" as looking.
Understand the command "osm" or "o" as "osmotret&sya".
Understand "osmotret&sya [something]" as examining.
Understand "postmotret& vokrug" as looking.
Understand "postmotret& na [something visible]" as examining.
Understand "izuchit& [something]" as examining.
Understand "obyskat& [something]" as searching.
Understand "i" as taking inventory.
Understand "inv" as taking inventory.
Understand "inventar&" as taking inventory.
Understand  "vzyat& [something]" as taking.
Understand  "vzyat& [things inside] iz [something]" as removing it from.
Understand "polozhit& [something preferably held]" as dropping.
Understand "vybrosit& [something preferably held]" as dropping.
Understand "polozhit& [other things] na [something]" as putting it on.
Understand "polozhit& [other things] v [something]" as inserting it into.
[бросить в]
Understand "idti [direction]" as going.
Understand "vojti v [something]" or "vojti" as entering.
Understand "vyjti" as exiting.
Understand "slezt&" as exiting.
Understand "otperet& [something] [other things]" as unlocking it with.
Understand "zaperet& [something] [other things]" as locking it with. [second noun should be in the instrumental]
Understand "vklyuchit& [something]" as switching on.
Understand "vyklyuchit& [something]" as switching off.
Understand  "otkryt& [something]" as opening.
Understand  "zakryt& [something]" as closing.
Understand "snyat& [something preferably held]" as taking off.
Understand "nadet& [something preferably held]" as wearing.
Understand "s#est&" as eating.
Understand "zh" as waiting.
Understand  "zhdat&" as waiting.


[Действия, Группа 3]

Understand "posmotret& pod [something]" as looking under.
Understand "poslushat&" as listening.
Understand "slushat&" as listening.
Understand "poslushat&" as listening.
Understand "slushat&" as listening.
Understand "poslushat& [something]" as listening to.
Understand "slushat& [something]" as listening to.
Understand "liznut& [something]" as tasting.
Understand "dotronut&sya [something]" as touching.
Understand "kosnut&sya [something]" as touching.
Understand "tolknut&" as pulling.
Understand "potyanut& [something]" as pushing.
Understand the command "povernut&" as "turn".
Understand "tolknut& [something] na [a direction]" as pushing it to.
Understand "privyazat& [something] k [something]" as tying it to.
[СВЯЗАТЬ ?]
Understand "pit& [something]" as drinking.
Understand "vypit& [something]" as drinking.
Understand "udarit& [something]" as attacking.
Understand "rezat& [something]" as attacking.
Understand "slomat& [something]" as attacking.
Understand "pokachat& [something]" as swinging.
Understand "kachnut& [something]" as swinging.
Understand "poteret& [something]" as rubbing.
Understand "utanovit& [something] na [text]" as setting it to.
Understand "kupit& [something]" as buying.
Understand "makhnut& [something]" as buying.
Understand "zalezt& na [something]" as climbing.
Understand "sdavit& [something]" as squeezing.
Understand "szhech& [something]" as burning.
Understand "szhat& [something]" as burning.
Understand "zazhech& [something]" as burning.
Understand "poiskat& pro [text] v [something]" as consulting it about (with nouns reversed).
Understand "rasskazat& [someone] pro [text]" as telling it about.
Understand "ckazat& [someone] chto [text]" as answering it that. [cannot say "сказать (что-то) (кому)" because second noun cannot directly follow a text token ]
Understand "sprosit& [someone] pro [text]" as asking it about.
Understand "dat& [something preferably held] [someone]" as giving it to.
Understand "pokazat& [something preferably held] [someone]" as showing it to.
Understand "poprosit& u [someone] [something]" as asking it for.
Understand "razbudit& [someone]" as waking.
Understand "prosnut&sya" as waking up.
Understand "potselovat& [someone]" as kissing.
Understand "spat&" as sleeping.
Understand "pomakhat&" as waving hands.
Understand "izvinit&sya" as saying sorry.
Understand "podprygnut&" as jumping.
Understand "prygnut&" as jumping.
Understand "podumat&" as thinking.
Understand "dumat&" as thinking.
Understand "ponyukhat& [something]" as smelling.
Understand "nyukhat& [something]" as smelling.
Understand "ponyukhat&" as smelling.
Understand "nyukhat&" as smelling.
Understand "idti" as going.
Understand "d" as saying yes.
Understand "n" as saying no.
Understand "da" as saying yes.
Understand "net" as saying no.

[Направления - Directions are a subclass of object and have grammatical gender and case]

Understand "s" or "sever" as north.
Understand "yu" or "yug" as south.
Understand "v" or "vostok" as east.
Understand "z" or "zapad" as west.
Understand "vn" or "vniz" as down.
Understand "vv" or "vverkh" as up.
Understand "sv" or "severo-vostok" as northeast.
Understand "sz" or "severo-zapad" as northwest.
Understand "yuv" or "yugo-vostok" as southeast.
Understand "yuz" or "yugo-zapad" as southwest.

The name of north is "север".
The name of south is "юг".
The name of east is "восток".
The name of west is "запад".
The name of northeast is "северо-восток".
The name of northwest is "северо-запад".
The name of southeast is "юго-восток".
The name of southwest is "юго-запад".
The name of up is "вверх".
The name of down is "вниз".
The name of inside is "вход".
The name of outside is "выход".


Chapter 10 - Start

When play begins:
	say "This is a short proof-of-concept game demonstrating use of vorple to allow text entry in non-Latin characters. I'm sure that there are plenty of errors -- this is a work in progress. I am slowly adding standard rules and grammar based mostly in rInform. This is meant only as a stub for future work. [paragraph break]The point is that it is possible to type unicode characters outside the Latin range and have the parser do the right thing with them rather than summarily dying.[paragraph break]Your mission in this example game: fill the box with stuff.".

Chapter 11 - Some example customized responses

After inserting something (called the item) into the box:
	say "Вы положите [item] в коробку. Теперь в коробке ";	
	let N be the number of things in the box; 
	if N is:
		-- 1: 
			say "онда вещь.";
		-- 5:
			say "пять вещей.";
			end the story finally saying "Ура! Коробка заполнена.";
		-- otherwise:
			if N is:
				-- 2:
					say "две";
				-- 3:
					say "три";
				-- 4:
					say "четыре";
			say " вещи."
			
After eating something:
	say "[one of]Ммммм[or]Не плохо[or]Отлично[or]Как вкусно[in random order]."
	
Chapter 12 - Tests

Section 1 - Decline an object

ItemDeclining is an action applying to one visible thing. Understand "itemdecline [any things]" as itemDeclining.

Carry out itemDeclining:
	repeat with itemmult running through multiplicities:
		repeat with itemcase running through grammatical cases:
			say "[noun in the itemcase case itemmult]."	
			
Section 2 - Decline noun text
			
textDeclining is an action applying to nothing. Understand "textDecline" as textDeclining.

The list of lists of text called testTexts is always
	{
		{"вода", "voda"},
		{"коробка", "korobka"},
		{"каша", "kasha"},
		{"земля", "zemlya"},
		{"лекция", "lektsiya"},
		{"дом", "dom"},
		{"огурец", "ogurets"},
		{"медведь", "medved&"},
		{"зной", "znoj"},
		{"литий", "litij"},
		{"облако", "oblako"},
		{"поле", "pole"},
		{"известие", "izvestie"},
		{"время", "vremya"},
		{"тетрадь", "tetrad&"},
		{"ночь", "noch&"},
		{"дочь", "doch&"}
	}

Carry out textDeclining:
	repeat with L running through testTexts:
		let L1 be entry 1 in L;
		let L2 be entry 2 in L;
		repeat with itemmult running through  {singular, plural}:
			repeat with itemcase running through {nominative, genitive, dative, accusative, instrumental, prepositional}:
				say "[L1 in the itemcase case itemmult multiplicity with L2 pattern].";
		say paragraph break.	
		
Section 3 - Decline a long form adjective

Adclining is an action applying to one visible thing. Understand "adcline [any things]" as adclining.

Carry out adclining:
	repeat with itemmult running through {singular, plural}:
		repeat with itemcase running through {nominative, genitive, dative, accusative, instrumental, prepositional}:
			repeat with itemgender running through {masculine gender, feminine gender, neuter gender}:
				say "[long form of modifier of the noun in the itemcase case itemgender gender itemmult]."

Test adclination with "adcline korobka/adcline portret/adcline stol/adcline tetrad&/adcline sablya".

Section 4 - Decline short adjectives

shortAdjing is an action applying to nothing. Understand "shortAdj" as shortAdjing.

Carry out shortAdjing:
	repeat through Table of Known Adjectives:
		repeat with itemmult running through  {singular, plural}:
			repeat with itemgender running through  {masculine gender, feminine gender, neuter gender}:
				say short form of adjective entry with itemgender gender itemmult;
				say line break;
		say line break.


