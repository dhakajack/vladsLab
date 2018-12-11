"Vlad's Lab" by Welch, Jack  [E]

Chapter 1 - Vorple Set Up

Include Vorple  by Juhana Leinonen.

Release along with the "Vorple" interpreter.

Chapter 2 - Grammar Tweaks

The indefinite article of things is usually "".

Rule for listing nondescript items:
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
		say "[E]";
		if the number of entries in L is greater than 2 and N is less than (the number of entries in L minus 1):
			say ", ";
	say "."
	
Understand "ya/menya" as yourself.

Chapter 3 - World

The Laboratory is a room.  The description of the Laboratory is "Большая комната для научных экспериментов. Центральный коридор находится к югу.". The printed name of the laboratory is "Лаборатория". 

The worktable is a supporter in the Laboratory. The description of the worktable is "Изношенный рабочий стол." The printed name of the worktable is "рабочий стол". Understand "rabochij/stol" as the worktable.

A box is an open container in the laboratory. The description of the box is "Картонная коробка." The printed name of the box is "[if the number of things in the box is zero]пустую [end if]коробку". Understand "kartonnaya/korobka/kartonnuyu/korobku" as box.

The hall is south from Laboratory. "Узкий коридор. Ваша лаборатория к северу, санузел [unicode 8212] к западу, а столовая [unicode 8212] на востоке." The printed name of the hall is "Koridor". 

The plant is in the hall. The description of the plant is "Растение без цветов." The printed name of the plant is "растение".  Understand "rastenie" as the plant.

The portrait is in the hall. The description of the portrait is "Портрет старика." The printed name of the portrait is "портрет". Understand "portret/starika" as portrait.

The bathroom is west from the hall. The description of the bathroom is "Ничем не примечательная ванная комната. Центральный коридор находится к востоку." The printed name of the bathroom is "Санузел".

The toilet is a supporter in the bathroom. The description of the toilet is "Белый туалет." The printed name of the toilet is "туалет". Understand "belyj/tualet/tualete" as the toilet. 

The sink is in the bathroom. It is fixed in place. The description of the sink is "Маленькая раковина. На данный момент, похоже, сломан." The printed name of the sink is "раковину". Understand "rakovina/rakovinu/rakovine" as the sink.

The bathtub is an open container in the bathroom. It is fixed in place. The description of the bathtub is "Чугунная ванна.". The printed name of the bathtub is "ванна". Understand "vanna/vannu/vanne" as the bathtub.

The rubber duck is in the bathtub. The description of the rubber duck is "Крошечная желтая утка". The printed name of the rubber duck is "резиновая уточка". Understand "rezinovaya/rezinovayu/utochka/utochku" as the rubber duck.

The cafeteria is east from the hall. "Место, где все обедают. Центральный коридор находится к западу." The printed name of the cafeteria is "Столовая".

The dining table is in the cafeteria. It is a supporter. The description of the table is "Длинный деревянный стол." The printed name of the dining table is "обеденный стол". Understand "dlinnyj/derevyannyj/stol" as the dining table.

A slice of bread is edible. It is on the dining table. The description of the slice of bread is "Густой ломтик вкусного хлеба." The printed name of the slice of bread is "хлеб". Understand "gustoj/lomtik/vkusnogo/khleba/vkusnyj/khleb" as the slice of bread.

A cucumber is edible. It is on the dining table. The description of the cucumber is "Спелый огурец." The printed name of the cucumber is "огурец". Understand "spelyj/ogurets" as the cucumber.

A spoon is on the dining table. The description of the spoon is "Маленькая пластиковая ложка". The printed name of the spoon is "ложку". Understand "malen&kaya/malen&kuyu/lozhka/lozhku" as the spoon.

Chapter 4 - Transliterations

[Действия, Группа 1]

Understand the command "konets" as "quit".
Understand the command "nachalo" as "restart".
Understand the command "perezapusk" as "restart".
Understand the command "vosst" as "restore".
Understand the command "zagruzit&" as "restore".
Understand the command "sokh" as "save".
Understand the command "sokhranit&" as "save".
Understand the command "schet" as "score".
Understand the command "otchet" as "transcript".
Understand the command "skript" as "transcript".
Understand "otchet vykl" as switching the story transcript off.
Understand the command "versiya" as "version".

[Действия, Группа 1]

Understand the command "osm" as "look".
Understand the command "osmotret&sya" as "look".
Understand the command "obyskat&" as "search".
Understand the command "inventar&" as "inventory".
Understand  "vzyat& [something]" as taking.
Understand  "vzyat& [things inside] iz [something]" as removing it from.
Understand "polozhit& [something]" as dropping.
Understand "polozhit& [other things] na [something]" as putting it on.
Understand "polozhit& [other things] v [something]" as inserting it into.
Understand "idti [direction]" as going.
Understand "vojti v [something]" or "vojti" as entering.
Understand "vyjti" as exiting.
Understand "otperet& [something] [other things]" as unlocking it with.
Understand "zaperet& [something] [other things]" as locking it with. [second noun should be in the instrumental]
Understand "vklyuchit& [something]" as switching on.
Understand "vyklyuchit& [something]" as switching off.
Understand the command "otkryt&" as "open".
Understand the command "zakryt&" as "close".
Understand "cnyat& [something preferably held]" as taking off.
Understand the command "nadet&" as "wear".
Understand the command "s#est&" as "eat".
Understand the command "zhdat&" as "wait".

[Действия, Группа 3]

Understand "posmotret& pod [something]" as looking under.
Understand the command "poslushat&" as "listen".
Understand the command "liznut&" as "taste".
Understand the command "dotronut&sya" as "touch".
Understand the command "tolknut&" as "pull".
Understand the command "potyanut&" as "push".
Understand the command "pomakhat&" as "wave".
Understand the command "povernut&" as "turn".
Understand "tolknut& [something] na [a direction]" as pushing it to.
Understand "privyazat& [something] k [something]" as tying it to.
Understand the command "vypit&" as "drink".
Understand the command "udarit&" as "attack".
Understand  the command "pokachat&" as "swing".
Understand  the command "poteret&" as "rub".
Understand "utanovit& [something] na [text]" as setting it to.
Understand the command "kupit&" as "buy".
Understand "zalezt& na [something]" as climbing.
Understand the command "sdavit&" as "squeeze".
Understand the command "szhech&" as "burn".
Understand the command "razrezat&" as "cut".
Understand "poiskat& pro [text] v [something]" as consulting it about (with nouns reversed).
Understand "rasskazat& [someone] pro [text]" as telling it about.
Understand "ckazat& [someone] chto [text]" as answering it that. [cannot say "сказать (что-то) (кому)" because second noun cannot directly follow a text token ]
Understand "sprosit& [someone] pro [text]" as asking it about.
Understand "dat& [something preferably held] [someone]" as giving it to.
Understand "pokazat& [something preferably held] [someone]" as showing it to.
Understand "poprosit& u [someone] [something]" as asking it for.
Understand the command "razbudit&" as "wake".
Understand the command "potselovat&" as "kiss".
Understand the command "spat&" as "sleep".
Understand  "pomakhat&" as waving hands.
Understand the command "izvinit&sya" as "sorry".
Understand the command "podprygnut&" as "jump".
Understand the command "podumat&" as "think".
Understand the command "ponyukhat&" as "smell".
Understand "idti" as going.
Understand the command "da" as "yes".
Understand the command "net" as "no".

[Направления]

Understand "sever" as north.
Understand "yug" as south.
Understand "vostok" as east.
Understand "zapad" as west.

[for the sake of the demo, I did not implement single letter commands like "o" for look, "ю" for south, but it would make sensein a more complete implementation according to whatever conventions players are used to.]

[Woud also need to tweak the yes, no, and oops words at I6 level to be able to react to, for example, quit (y/n?)]

Chapter 5 - Start

When play begins:
	say "This is a short proof-of-concept game demonstrating use of vorple to allow text entry in non-Latin characters. There are plenty of errors, I have not extensively implemented grammar or replaced library responses. This is meant only as a stub for future work. [paragraph break]The point is that it is possible to type unicode characters outside the Latin range and have the parser do the right thing with them rather than summarily dying.[paragraph break]Your mission in this example game: fill the box with stuff.".

Chapter 6 - Some example customized responses

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
