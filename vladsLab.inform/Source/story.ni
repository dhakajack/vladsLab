The story title is "Лаборатия Влада". 

The story author is "Джекa Уэлчa". [in genitive]

The story headline is "Интерактивная Литература".

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

Multiplicity is a kind of value. The multiplicities are singular and plural.

To decide which multiplicity is the multiplicity of (item - a thing): 
	let D be singular; 
	if item is plural-named, let D be plural;
	decide on D.

Gender is a kind of value. The genders are m, f, and n.
A thing has a gender. The gender of a thing is usually m.

A thing has a text called name. The name of a thing is usually "".
A thing has a text called inflection pattern. The inflection pattern of a thing is usually "dom".

The indefinite article of a thing is "".

A thing has a text called modifier. The modifier of a thing is usually "". 
[The modifier is an optional associated adjective to help disambiguate nouns; it is specified in the nominative masculine singular. It is declined based on the 2nd and 3rd letters from the end since the last one is always й. That's enough to classify it as a stressed adjective, on with a stem termination in КГХ, a sibilant, a soft-н or by default, a hard consonant.]

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

Section 3 - The Player

The description of the player is "Ты выглядишь как обычно."

Section 4 - Response Overrides

To say capitalized (item - a thing) in the (itemcase - a case) case:
	let PN be "[printed name of item in the itemcase case]";
	say PN with initial capital.

To say list-writer-internal-rule-worn:
	say say short form of "надетый" regarding noun.
	
To say list-writer-internal-rule-available:
	say short form of "недосягаемый" regarding noun.
	
To say list-writer-internal-rule-empty:
	say short form of "пустый" regarding noun.
	
To say list-writer-internal-rule-open:
	say short form of "открытый" regarding noun.
	
To say list-writer-internal-rule-closed:
	say short form of "закрытый" regarding noun.
	
To say list-writer-internal-rule-locked:
	say short form of "запертый" regarding noun.

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
The requested actions require persuasion rule response (A) is "[capitalized noun in the nom case] явно не собира[noun does a verb of class v1b]ся тебя слушать."

[carry out requested actions rule response (A): "[The noun] [are] unable to do that."]
[*review]The carry out requested actions rule response (A) is "[capitalized noun in the nom case] не мо[if the noun is plural-named]г[otherwise]ж[noun does a verb of class v1a] этого сделать."
	
[access through barriers rule response (A): "[regarding the noun][Those] [aren't] available."]
The access through barriers rule response (A) is "[capitalized noun in the nom case] не [list-writer-internal-rule-available]."

[can't reach inside closed containers rule response (A): "[The noun] [aren't] open."]
The can't reach inside closed containers rule response (A) is "[capitalized noun in the nom case] не [list-writer-internal-rule-open]."

[can't reach inside rooms rule response (A): "[We] [can't] reach into [the noun]."]
[*translate]The can't reach inside rooms rule response (A) is "[We] [can't] reach into [the noun]."

[can't reach outside closed containers rule response (A): "[The noun] [aren't] open."]
The can't reach outside closed containers rule response (A) is "[capitalized noun in the nom case] не [list-writer-internal-rule-open]."

[
list writer internal rule response (A): " ("
list writer internal rule response (B): ")"
list writer internal rule response (C): " and "
]

The list writer internal rule response (C) is " и ".

[list writer internal rule response (D): "providing light"]
The list writer internal rule response (D) is "свет[noun does a verb of class v2b]".

[list writer internal rule response (E): "closed"]
The list writer internal rule response (E) is "[list-writer-internal-rule-closed]".
	
[list writer internal rule response (F): "empty"]
The list writer internal rule response (F) is "[list-writer-internal-rule-empty]".

[list writer internal rule response (G): "closed and empty"]
The list writer internal rule response (G) is "[list-writer-internal-rule-closed] и [list-writer-internal-rule-empty]".

[list writer internal rule response (H): "closed and providing light"]
The list writer internal rule response (H) is "свет[noun does a verb of class v2b] и [list-writer-internal-rule-closed]".

[list writer internal rule response (I): "empty and providing light"]
The list writer internal rule response (I) is "свет[noun does a verb of class v2b] и [list-writer-internal-rule-empty]".

[list writer internal rule response (J): "closed, empty[if serial comma option is active],[end if] and providing light"]
The list writer internal rule response (J) is "свет[noun does a verb of class v2b], [list-writer-internal-rule-closed] и [list-writer-internal-rule-empty]".

[list writer internal rule response (K): "providing light and being worn"]
The list writer internal rule response (K) is "свет[noun does a verb of class v2b] и [list-writer-internal-rule-worn]".

[list writer internal rule response (L): "being worn"]
The list writer internal rule response (L) is "[list-writer-internal-rule-worn]".

[list writer internal rule response (M): "open"]
The list writer internal rule response (M) is "[list-writer-internal-rule-open]".

[list writer internal rule response (N): "open but empty"]
The list writer internal rule response (N) is "[list-writer-internal-rule-open] и [list-writer-internal-rule-empty]".

[list writer internal rule response (O): "closed"]
The list writer internal rule response (O) is "[list-writer-internal-rule-closed]".

[list writer internal rule response (P): "closed and locked"]
The list writer internal rule response (P) is "[list-writer-internal-rule-closed] и [list-writer-internal-rule-locked]".

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

[*translate]The action processing internal rule response (B) is "You must name an object."
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


To say (item - a thing) in the (itemcase - a case) case (itemmult - a multiplicity):
	let N be the name of the item;
	let itempattern be the inflection pattern of the item;
	[say "Calling text routine with text [N] based on a pattern of [itempattern].";]
	say N in the itemcase case itemmult multiplicity with itempattern pattern.

To say (itemtext - a text) in the (itemcase - a case) case (itemmult - a multiplicity) multiplicity with (itempattern - a text) pattern:
	[say "Text routine called with itemtext [itemtext] in the [itemcase] case and [itemmult] multiplicity with [itempattern] pattern.";]
	if itempattern is not an exemplar listed in the Table of Noun Inflections:
		say "ERROR: declination pattern not found in lookup table";
		the rule fails;
	let termination be "";
	let T be itemtext;
	let terminationList be the pattern corresponding to an exemplar of itempattern in the Table of Noun Inflections;
	if the itemmult is singular:
		if the itemcase is:
			-- nom:
				now the termination is "[entry 1 of terminationList]";
			-- gen:
				now the termination is "[entry 2 of terminationList]";
			-- dat:
				now the termination is "[entry 3 of terminationList]";
			-- acc:
				now the termination is "[entry 4 of terminationList]";
			-- ins:
				now the termination is "[entry 5 of terminationList]";
			-- pre:
				now the termination is "[entry 6 of terminationList]";	
	otherwise:[item is plural]
		if the itemcase is:
			-- nom:
				now the termination is "[entry 7 of terminationList]";
			-- gen:
				now the termination is "[entry 8 of terminationList]";
			-- dat:
				now the termination is "[entry 9 of terminationList]";
			-- acc:
				now the termination is "[entry 10 of terminationList]";
			-- ins:
				now the termination is "[entry 11 of terminationList]";
			-- pre:
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

	
Section 3 - Decline Long From Adjectives

To say long form of (adj - text) regarding (item - a thing) in the (case - a case):
	let G be the gender of the item;
	let C be the case;
	let M be the multiplicity of the item;
	say long form adj in the C case G gender M.
	
[Algorithmic declension of regular long form adjectives]
To say long form (item - text) in the (itemcase - a case) case (itemgender - gender) gender (itemmult - a multiplicity):
	if item is empty:
		 the rule succeeds; [if there is no adjective, end processing here.]
	if (itemcase is nom and itemgender is m and itemmult is singular) or (itemcase is acc and itemgender is m and itemmult is singular):
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
				-- acc:
					let itemcase be nom;
				-- pre:
					let itemcase be gen;				
			if itemcase is:
				-- nom:
					if the category is 1:
						let newterm be "ые";
					otherwise:
						let newterm be "ие";
				-- gen:
					if the category is 1:
						let newterm be "ых";
					otherwise:
						let newterm be "их";
				-- dat:
					if the category is 1:
						let newterm be "ым";
					otherwise:
						let newterm be "им";
				-- ins:
				if the category is 1:
						let newterm be "ыми";
					otherwise:
						let newterm be "ими";
				-- otherwise:
					say "ERROR: ITEM CASE NOT DEFINED";
					the rule fails;
		-- singular: [nom masc sing is the exemplar itself and returned above.]
			if (itemcase is acc and itemgender is n):[recode acc neu sing to nominative]
				let itemcase be nom;
			if itemcase is:
				-- nom:
					if the category is:
						-- 1:
							if the itemgender is: [m is addressed at start of routine as default]
								-- f:
									let newterm be "ая";
								-- n:
									let newterm be "ое";
						-- 2:
							if itemgender is:
								-- f:
									let newterm be "яя";
								-- n:
									let newterm be "ее";
						-- 3:		
							if itemgender is:
								-- f:
									let newterm be "ая";
								-- n:
									let newterm be "ое";								
						-- 4:
							if itemgender is:
								-- f:
									let newterm be "ая";
								-- n:
									let newterm be "ое";
						-- 5:	
							if itemgender is:
								-- f:
									let newterm be "ая";
								-- n:
									let newterm be "ее";		
				-- gen:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is f:
							let newterm be "ей";
						otherwise:
							let newterm be "его";
					otherwise:
						if itemgender is f:
							let newterm be "ой";
						otherwise:
							let newterm be "ого";
				-- dat:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is f:
							let newterm be "ей";
						otherwise:
							let newterm be "ему";
					otherwise:
						if itemgender is f:
							let newterm be "ой";
						otherwise:
							let newterm be "ому";
				-- acc: [only dealing with feminine since masculine and neuter are recoded above as nominative]
					if category is 2: [нь]
						let newterm be "юю";
					otherwise:
						let newterm be "ую";
				-- ins:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is f:
							let newterm be "ей";
						otherwise:
							let newterm be "им";
					otherwise if category is 3 or category is 4: [stressed]
						if itemgender is f:
							let newterm be "ой";
						otherwise:
							let newterm be "им";
					otherwise:
						if itemgender is f:
							let newterm be "ой";
						otherwise:
							let newterm be "ым";
				-- pre:
					if category is 2 or category is 5: [нь or sibilant]
						if itemgender is f:
							let newterm be "ей";
						otherwise:
							let newterm be "ем";
					otherwise:
						if itemgender is f:
							let newterm be "ой";
						otherwise:
							let newterm be "ом";
	say "[stem][antepenultimate][newterm]".
		
Section 4 - Short Form Adjectives

To say short form of (adj - text) regarding (item - a thing):
	let G be the gender of the item;
	let M be the multiplicity of the item;
	say short form adj with G gender M.

To say short form (item - text) with (itemgender - gender) gender (itemmult - a multiplicity) :
	if item exactly matches the text "большой":
		if itemmult is plural:
			say "велики";
		otherwise:
			if itemgender is:
				-- m:
					say "велик";
				-- f:
					say "велика";
				-- n:
					say "велико";
		the rule succeeds;
	if item exactly matches the text "маленький":
		if itemmult is plural:
			say "малы";
		otherwise:
			if itemgender is:
				-- m:
					say "мал";
				-- f:
					say "мала";
				-- n:
					say "мало";
		the rule succeeds;
	[if it'snot one of those special cases:]	
	let stem be item;
	let intercalator be item;
	replace the regular expression "(\w*)(\w)\w" in intercalator with "\2"; [next to last letter, a vowel]
	replace the regular expression "(\w*)(\w{2})" in stem with "\1"; [extract stem, all but last two letters]
	if itemmult is plural:
		say stem;
		if stem exactly matches the regular expression "\w*<гкхжшщч>":
			say "и";
		otherwise:
			say "ы";
	otherwise:
		if itemgender is:
			-- f:
				say "[stem]а";
			-- n:
				say "[stem]о";
			-- m:
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
				
Section 6 - Printed Name Generation

To say printed name of (item - a thing) in the (itemcase - a case) case:
	let IG be the gender of the item;
	let IM be singular;
	if the item is plural-named:
		let the IM be plural;
	if modifier of the item is not empty:
		say long form modifier of the item in the itemcase case IG gender IM;
		say " ";
	say item in the itemcase case IM.
	
Section 7 - Das Kapital

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

The Laboratory is a room.  The description is "Большая комната для научных экспериментов. Центральный коридор находится к югу.". The printed name is "Лаборатория". 

The daughter is a woman in the laboratory. The description is "Ваша дочь." The name is "дочь". The inflection pattern is "noch&".  Understand "doch&" as daughter. 

The worktable is a supporter in the Laboratory. The description is "Изношенный рабочий стол." The name is "стол". The inflection pattern is "dom". The modifier is "большой". Understand "rabochij/stol" as the worktable. 

The workbook is in box. The description is "Тетрадь с миллиметровкой." The name is "тетрадь". The inflection pattern is "tetrad&". The modifier is "маленький". Understand "tetrad&" as the workbook. The workbook is lit.

A box is in the laboratory. The gender of the box is f. The description is "Картонная коробка." The name is "коробка". The inflection pattern is "korobka". The modifier is "новый". Understand "kartonnaya/korobka/kartonnuyu/korobku" as box. 

The hall is south from Laboratory. "Узкий коридор. Ваша лаборатория к северу, санузел [unicode 8212] к западу, а столовая [unicode 8212] на востоке." The printed name is "Коридор". 

The sabre is in the hall. The description is "Ржавая сабля."  The name is "сабля". The inflection pattern is "zemlya". The modifier of sabre is "старший". Understand "sablya" as the sabre.

The plant is in the hall. The description is "Растение без цветов." The name is "растение". The inflection pattern is "izvestie". Understand "rastenie" as the plant. 

The portrait is in the hall. The description is "Портрет старика." The name of portrait is "портрет".  The inflection pattern is "dom". The modifier of portrait is "синий". Understand "portret/starika" as portrait. 

The book is in the hall. The description is "Толстая книга." The name of book is "книга". The inflection pattern is "voda". Understand "kniga/knigu" as the book. 

The mummy is in the hall. The description is "Египетские мумии." The name is "мумия". The inflection pattern is "lektsiya". Understand "mumiya/mumiyu" as the mummy. 

The bathroom is west from the hall. The description is "Ничем не примечательная ванная комната. Центральный коридор находится к востоку." The printed name is "Санузел".

The toilet is a supporter in the bathroom. The description is "Белый унитаз."  The name of toilet is "унитаз". The inflection pattern is "dom".  Understand "belyj/unitaz" as the toilet.

The sink is in the bathroom. It is fixed in place. The description is "Маленькая раковина. На данный момент, похоже, сломан." The name is "раковина". The inflection pattern is "voda". Understand "rakovina/rakovinu/rakovine" as the sink. 

The bathtub is an open container in the bathroom. It is fixed in place. The description is "Чугунная ванна.". The name is "ванна". The inflection pattern is "voda". Understand "vanna/vannu/vanne" as the bathtub.

The rubber duck is in the bathtub. The description of the rubber duck is "Крошечная желтая утка". The name of the rubber duck is "утка". The inflection pattern is "korobka". The modifier is "резиновый". Understand "rezinovaya/rezinovayu/utochka/utochku" as the rubber duck.

The cafeteria is east from the hall. "Место, где все обедают. Центральный коридор находится к западу." The printed name of the cafeteria is "Столовая".

The dining table is in the cafeteria. It is a supporter. The description is "Деревянный стол." The name is "стол". The inflection pattern is "dom". The modifier is "деревянный". Understand "derevyannyj/stol" as the dining table.

A cucumber is edible. It is on the dining table. The description is "Спелый огурец." The name of cucumber is "огурец". The inflection pattern is "ogurets". The modifier is "спелый". Understand "spelyj/ogurets" as the cucumber. 

The kasha is edible. It is on the dining table. The description is "Каша без молока." The name of kasha is "каша". The inflection pattern is "kasha". Understand "kasha/kashu" as kasha. 

The apple is edible. It is on the dining table. The description is "Красное яблоко." The name of apple is "yablokо". The  The inflection pattern is "oblako". Understand "yabloko" as the apple. 

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
Understand "vybrocit& [something preferably held]" as dropping.
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

[Направления]
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


[might need to implement additional properties for directions, like dativePrintName for go к направлению (or maybe just get away with sticking a "у" on the end programmatically?]

The printed name of north is "север".
The printed name of south is "юг".
The printed name of east is "восток".
The printed name of west is "запад".
The printed name of northeast is "северо-восток".
The printed name of northwest is "северо-запад".
The printed name of southeast is "юго-восток".
The printed name of southwest is "юго-запад".
The printed name of up is "вверх".
The printed name of down is "вниз".

[The printed name of inside is "";
The printed name of outside is "";]


Chapter 10 - Start

When play begins:
	say "This is a short proof-of-concept game demonstrating use of vorple to allow text entry in non-Latin characters. There are plenty of errors, I have not extensively implemented grammar or replaced library responses. This is meant only as a stub for future work. [paragraph break]The point is that it is possible to type unicode characters outside the Latin range and have the parser do the right thing with them rather than summarily dying.[paragraph break]Your mission in this example game: fill the box with stuff.".

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
		repeat with itemcase running through cases:
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
		repeat with itemmult running through multiplicities:
			repeat with itemcase running through cases:
				say "[L1 in the itemcase case itemmult multiplicity with L2 pattern].";
		say paragraph break.	
		
Section 3 - Decline a long form adjective

Adclining is an action applying to one visible thing. Understand "adcline [any things]" as adclining.

Carry out adclining:
	repeat with itemmult running through multiplicities:
		repeat with itemcase running through cases:
			repeat with itemgender running through genders:
				say "[long form modifier of the noun in the itemcase case itemgender gender itemmult]."

Test adclination with "adcline korobka/adcline portret/adcline stol/adcline tetrad&/adcline sablya".

Section 4 - Decline short adjectives

shortAdjing is an action applying to nothing. Understand "shortAdj" as shortAdjing.

The list of text called shortAdjTest is always 
	{ "большой", "маленький", "хороший", "готовый", "короткий", "редкий", "важный", "больной", "полный", "смешной","злой", "спокойный", "близкий" }

Carry out shortAdjing:
	repeat with L running through shortAdjTest:
		repeat with itemmult running through multiplicities:
			repeat with itemgender running through genders:
				say "[short form L with itemgender gender itemmult].";
		say paragraph break.	


