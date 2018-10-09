local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_ett"},

{"label","ifs"},
{"if","package","==",true,"ready"},

{"label","ifs2"},
{"if","ett","==",0,"asd"},
{"if","ett","==",1,"1a"},
{"if","ett","==",4,"1f"},
{"if","ett","==",5,"atd1"},
{"if","ett","==",2,"atd2"},
{"if","ett","==",3,"atd3"},

{"label","ready"},
{"if","ett","==",2,"ready2"},
{"goto","ifs2"},

{"label","ready2"},	
{"fun2",incvars,"ett"},
{"fun2",incvars,"ett"},
{"goto","ifs2"},

{"label","asd"},
    {"ns","Heya, kid! Nice day, isn’t it? Say, come back later if you gotta second.  I may have something for ya.  ","VS_T1PXETRAP_07.ogg"},
    {"pg","Okay - maybe I’ll see you around later.","end"},

{"label","1a"},
    {"fun2",incvars,"ett"},
    {"ns","Psssst! Heya, kid! You got a second? The name is Mickey…Mickey Jones! I got a proposition for ya, if you have a minute to listen.  I need someone to run an errand for me.  I’ll make it worth your while!","VS_T1PXETRAP_01.ogg"},
    {"pg","Okay, Mickey. What do you have in mind?","1c"},
    {"pg","It’s nice to meet you, Mickey, but I don’t really have time to chat right now. I may try to find you later.","1b"},

	{"label","1b"},
    	{"ns","That’s alright, kid.  I’ll be right here in case you decide you need some new clothes.  I am sure you’ll need them, though.  I, for one, would never get caught without an appropriate wardrobe! ","VS_T1PXETRAP_02.ogg"},
    	{"pg","Sure, Mickey. See you around, I guess.","end"},

	{"label","1c"},
    	{"ns","You see, I find things on the cheap around town, if you get my drift, and I sell them to people here on this street corner.  I got a shipment that I need picked up, if you know what I mean, but I am too busy right now to go and get it..If you grab it for me, I’ll give you a brand new suit you can wear to your meetings at City Hall!","VS_T1PXETRAP_03.ogg"},
	{"pg","Hey, I could use a suit. How do we get started?","1d"},
	{"pg","What do you mean, on the cheap?","1e"},
    	{"pg","You know, I am not sure I should do this. ","1b"},

		{"label","1d"},
    		{"ns","Alright then! All you gotta do is go behind Pauline‘s clothing shop.  You’ll see a pile of boxes out back. Just walk up and pick out my package by clicking on the pile. Bring it back here, and I’ll give you a brand new suit!","VS_T1PXETRAP_04.ogg"},
    		{"pg","Okay, you got it Mickey. I‘ll see you back here in a moment.","end"},

		{"label","1e"},
    		{"ns","You see, I am able to provide goods at deep discounts to my customers, mostly because I try not to pay for them to begin with! But, that’s another story. Anyway, do you want a new suit or what? It’ll only take a minute.","VS_T1PXETRAP_05.ogg"},
    		{"pg","Now that you put it that way – that sounds like something I can do! How do we get started?","1d"},
    		{"pgs","I don’t know, Mickey, I don’t think that sounds like something I should be doing. Please excuse me.","reject","a"}, --EU+

{"label","1f"},
{"ns","Heya, kid! I was hoping I’d see you back here. So did you pick up the package for me or what? I have a nice new set of duds for you if you hand it over!","VS_T1PXETRAP_06.ogg"},
{"pg","Yep! I have the package right here. Thanks for the suit!","trans"},
{"pg","I was just passing through, Mickey. I may come back soon, though.","end"},
	
	{"label","trans"},
	{"fun2",incvars,"ett"},
	{"fun",incsq},
	--add item to inventory or whatnot
	{"fun3",setvar,"package",nil},
	{"fun3",setvar,"suit",true},
	{"goto","end"},

{"label","atd1"},
    {"ns","Heya kid! It was a pleasure workin for ya.  Say, maybe I’ll see you around town!  Thanks again!","VS_T1PXETRAP_08.ogg"},
    {"pg","The pleasure was mine, Mickey. See you around!","end"},

{"label","atd2"},
    {"ns","Heya, kid!  Did you come back because you decided you need a new suit?","VS_T1PXETRAP_09.ogg"},
    {"pg","I have, Mickey. So what did you want me to do again?","1d"},
    {"pg","Actually, Mickey, I’m not sure I can spare the time just yet. I may see you soon though.","1b"},
    {"pgs","I don’t think I should be running any errand for you, Mickey - and that’s final!","reject","b"}, --EU+

	{"label","reject"},
	{"fun2",incvars,"ett"},
	{"goto","end"},

{"label","atd3"},
    {"ns","Look, kid, if you don’t want a suit – it’s your loss. Just don’t come crying back to me when people start complaining that you’re under-dressed.","VS_T1PXETRAP_10.ogg"},
    {"pg","Actually, Mickey, I am pretty sure I won’t need anything from you. I’ll see you around.","end"},

	
{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
