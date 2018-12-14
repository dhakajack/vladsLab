The story title is "Лаборатия Влада". 

The story author is "Джекa Уэлчa". [in genitive]

The story headline is "Интерактивная Литература".

Chapter 2 - Vorple Set Up

Include Vorple  by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Chapter 3 - Lower Level Tweakage

The language of play is the Xrussian language.

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


Chapter 4 - A little grammar

[Yeah, this is definitely not the way that Inform usually approaches grammar, with very concise, low level definitions, but I think it might be practical for me. I don't think this general approach with transliteration, etc., is likely to be used by native Russian speakers or for big projects. In any event, I like the idea of having the grammar all transparently present at the I7 level (although it may make sense to shuffle this off eventually into an extension for re-use). I'm developing this bit by bit, so some early crude attempts will be refined over time, but I have to start somewhere.

An obvious shortcoming of this approach is that input and output are entirely divorced.]



Case is a kind of value. The cases are nom, gen, dat, acc, ins and pre.

Multiplicity is a kind of value. The multiplicities are singular and plural.

A thing has a text called base. The base of a thing is usually "".
A thing has a list of text called inflections.  The inflections of a thing is usually {"","","","","","","","","","","",""}.
[In the order: nominative singular, genitive singular, dative singular, accusative singular, prepositional singular, instrumental singular, nominative plural, genitive plural, dative plural, accusative plural, prepositional plural, instrumental plural]

[first declension]

The list of text called like kniga is always
 {"а","ы","е","у","ой","е","ы","","ам","ы","ами","ах"}. 

The list of text called like korobka is always
 {"а","ы","е","у","ой","е","ы","~о","ам","ы","ами","ах"}. 

The list of text called like armiya is always 
{"я","и","и","ю","ей","и","и","й","ям","и","ями","ях"}. 

The list of text called like zemlya is always
{"я","и","е","ю","ей","е","и","-ель","ям","и","ями","ях"}.

The list of text called like kasha is always
 {"а","и","е","у","ей","е","и","","ам","и","ами","ах"}. 

[second declension]

The list of text called like stol is always {"","а","у","","ом","е","ы","ов","ам","ы","ами","ах"}.

The list of text called like ogurets is always 
{"~e","а","у","~e","ом","е","ы","ов","ам","ы","ами","ах"}.

The list of text called like yabloko is always 
{"о","а","у","о","ом","е","и","","ам","и","ами","ах"}.

The list of text called like rastenie is always
{"е","я","ю","е","ем","и","я","й","ям","я","ями","ях"}. 

[third declension]

The list of text called like tetrad& is always
{"","-и","-и","","ю","-и","-и","-ей","-ям","-и","-ями","-ях"}.

The list of text called like doch& is always
 {"","-ери","-ери","","ерю","-ери","-ери","-ерей","-ерям","-ерей","-ерьми","-ерях"}.

The indefinite article of a thing is "".

To say (item - a thing) in the (itemcase - a case) case (itemmult - a multiplicity):
	let B be the base of the item;
	let the termination be "";
	if the itemmult is singular:
		if the itemcase is:
			-- nom:
				now the termination is "[entry 1 of the inflections of the item]";
			-- gen:
				now the termination is "[entry 2 of the inflections of the item]";
			-- dat:
				now the termination is "[entry 3 of the inflections of the item]";
			-- acc:
				now the termination is "[entry 4 of the inflections of the item]";
			-- ins:
				now the termination is "[entry 5 of the inflections of the item]";
			-- pre:
				now the termination is "[entry 6 of the inflections of the item]";		
	otherwise:[item is plural]
		if the itemcase is:
			-- nom:
				now the termination is "[entry 7 of the inflections of the item]";
			-- gen:
				now the termination is "[entry 8 of the inflections of the item]";
			-- dat:
				now the termination is "[entry 9 of the inflections of the item]";
			-- acc:
				now the termination is "[entry 10 of the inflections of the item]";
			-- ins:
				now the termination is "[entry 11 of the inflections of the item]";
			-- pre:
				now the termination is "[entry 12 of the inflections of the item]";
	if the termination matches the regular expression "-.*":
		[chop off the final letter and add the ending after the minus sign]
		replace the regular expression "-(.*)" in the termination with "\1";
		replace the regular expression "(\w*)\w" in B with "\1";
	if the termination matches the regular expression "~.*":
		[insert the ending after the tilde before the last letter of the stem]
		replace the regular expression "~(.*)" in the termination with "\1";
		replace the regular expression "(\w*)(\w)" in B with "\1[termination]\2";
		now the termination is "";
	say B;
	say the termination.			

Chapter 5 - Grammar Tweaks

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
		say "[E in the acc case singular]";
		if the number of entries in L is greater than 2 and N is less than (the number of entries in L minus 1):
			say ", ";
	say "."]
	
Understand "ya/menya" as yourself.

Chapter 6 - World

The Laboratory is a room.  The description of the Laboratory is "Большая комната для научных экспериментов. Центральный коридор находится к югу.". The printed name of the laboratory is "Лаборатория". 

The daughter is in the laboratory. The description of your daughter is "Ваша дочь." Understand "doch&" as daughter. The base of daughter is "дочь". The inflections of daughter are like doch&.

The worktable is a supporter in the Laboratory. The description of the worktable is "Изношенный рабочий стол." Understand "rabochij/stol" as the worktable. The base of the worktable is "стол". The inflections of the worktable are like stol.

The workbook is in the Laboratory. The description of the workbook is "Тетрадь с миллиметровкой." Understand "tetrad&" as the workbook. The base of the workbook is "тетрадь". The inflections of the workbook are like tetrad&.

A box is an open container in the laboratory. The description of the box is "Картонная коробка." Understand "kartonnaya/korobka/kartonnuyu/korobku" as box. The base of box is "коробк". The inflections of box are like korobka.

The hall is south from Laboratory. "Узкий коридор. Ваша лаборатория к северу, санузел [unicode 8212] к западу, а столовая [unicode 8212] на востоке." The printed name of the hall is "Коридор". 

The sabre is in the hall. The description of the sabre is "Ржавая сабля." Understand "sablya" as the sabre. The base of sabre is "сабл". The inflections of sabre are like zemlya.

The plant is in the hall. The description of the plant is "Растение без цветов." The printed name of the plant is "растение".  Understand "rastenie" as the plant. The base of plant is "растени". The inflections of plant are like rastenie.

The portrait is in the hall. The description of the portrait is "Портрет старика." The printed name of the portrait is "портрет". Understand "portret/starika" as portrait. The base of portrait is "портрет". The inflections of portrait are like stol.

The book is in the hall. The description of the book is "Толстая книга." Understand "kniga/knigu" as the book. The base of book is "книг". The inflections of the book are like kniga.

The mummy is in the hall. The description of the mummy is "Египетские мумии." Understand "mumiya/mumiyu" as the mummy. The base of mummy is "муми". The inflections of mummy are like armiya.

The bathroom is west from the hall. The description of the bathroom is "Ничем не примечательная ванная комната. Центральный коридор находится к востоку." The printed name of the bathroom is "Санузел".

The toilet is a supporter in the bathroom. The description of the toilet is "Белый унитаз." Understand "belyj/unitaz" as the toilet. The base of toilet is "унитаз". The inflections of the toilet are like stol.

The sink is in the bathroom. It is fixed in place. The description of the sink is "Маленькая раковина. На данный момент, похоже, сломан." Understand "rakovina/rakovinu/rakovine" as the sink. The base of sink is "раковин". The inflections of sink are like kniga.

The bathtub is an open container in the bathroom. It is fixed in place. The description of the bathtub is "Чугунная ванна.". The printed name of the bathtub is "ванна". Understand "vanna/vannu/vanne" as the bathtub.

The rubber duck is in the bathtub. The description of the rubber duck is "Крошечная желтая утка". The printed name of the rubber duck is "резиновая уточка". Understand "rezinovaya/rezinovayu/utochka/utochku" as the rubber duck.

The cafeteria is east from the hall. "Место, где все обедают. Центральный коридор находится к западу." The printed name of the cafeteria is "Столовая".

The dining table is in the cafeteria. It is a supporter. The description of the table is "Длинный деревянный стол." The printed name of the dining table is "обеденный стол". Understand "dlinnyj/derevyannyj/stol" as the dining table.

A cucumber is edible. It is on the dining table. The description of the cucumber is "Спелый огурец." Understand "spelyj/ogurets" as the cucumber. The base of cucumber is "огурц". The inflections of cucumber are like ogurets.

The kasha is edible. It is on the dining table. The description of the kasha is "Каша без молока." Understand "kasha/kashu" as kasha. The base of kasha is "каш". The inflections of kasha are like kasha.

The apple is edible. It is on the dining table. The description of the apple is "Красное яблоко." Understand "yabloko" as the apple. The base of apple is "yablok". The inflections of apple are like yabloko.

Chapter 7 - Transliterations

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
Understand "sever" as north.
Understand "s" as north. 

Does the player mean going north:
	it is very likely.
	
[need to disambiguate from "s" for south which is hardcoded into the standard rules.]

Understand "yug" or "yu" as south.
Understand "vostok" as east.
Understand "v" as east.
Understand "zapad" as west.
Understand "z" as west.
Understand "vniz" as down.
Understand "vn" as down.
Understand "vverkh" as up.
Understand "vv" as up.
Understand "sv" as northeast.
Understand "severo-vostok" as northeast.
Understand "sz" as northwest.
Understand "severo-zapad" as northwest.
Understand "yuv" as southeast.
Understand "yugo-vostok" as southeast.
Understand "yuz" as southwest.
Understand "yugo-zapad" as southwest.


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


Chapter 8 - Start

When play begins:
	say "This is a short proof-of-concept game demonstrating use of vorple to allow text entry in non-Latin characters. There are plenty of errors, I have not extensively implemented grammar or replaced library responses. This is meant only as a stub for future work. [paragraph break]The point is that it is possible to type unicode characters outside the Latin range and have the parser do the right thing with them rather than summarily dying.[paragraph break]Your mission in this example game: fill the box with stuff.".

Chapter 9 - Some example customized responses

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
	
Chapter 10 - Tests

Declining is an action applying to one visible thing. Understand "decline [any things]" as declining.

Carry out declining:
	repeat with itemmult running through multiplicities:
		repeat with itemcase running through cases:
			say "[noun in the itemcase case itemmult]."

