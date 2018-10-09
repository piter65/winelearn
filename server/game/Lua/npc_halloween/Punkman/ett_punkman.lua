local dialogtext = {
{"fun3",setvar,"scoreconvo","nlc_ett"},

{"if","guitar","==",true,"ready"},
{"goto","ifs2"},

{"label","ifs2"},
	{"if","ett","==",0,"asd"},
	{"if","ett","==",1,"1a"},
	{"if","ett","==",2,"atd2"},
	{"if","ett","==",3,"atd3"},
	{"if","ett","==",4,"1f"},
	{"if","ett","==",5,"atd1"},

{"label","ready"},
	{"if","ett","==",2,"ready2"},
	{"goto","ifs2"},

{"label","ready2"},	
	{"fun2",incvars,"ett"},
	{"fun2",incvars,"ett"},
	{"goto","ifs2"},

{"label","asd"},
	{"ns","Hey, mate! Lovely day, isn’t it?","VS_T2PXET_07.ogg"},
	{"pg","Why, yes – yes it is!","end"},

{"label","1a"},
	{"fun2",incvars,"ett"},
	{"ns","Hey, mate! You got a second? The name is Jeff Punkman. Say, you’re from out of town, right? I got a proposition for you, if you’re interested.","VS_T2PXET_01.ogg"},
	{"pg","What do you have in mind?","1c"},
	{"pg","It’s nice to meet you, Jeff, but I don’t really have time to chat right now. I may try to find you later.","1b"},

	{"label","1b"},
		{"ns","That’s alright then, mate.  I’ll be right here so if you decide you need some cash, you should come back and hear me out. ","VS_T2PXET_02.ogg"},
		{"pg","Okay, I may see you around, then.","end"},

	{"label","1c"},
		{"ns","I got a new guitar that I need picked up, if you know what I mean - but I am too well known in town to do it myself. If you can go and grab it for me, and I’ll give you some cash.","VS_T2PXET_03.ogg"},
		{"pg","I could always use some more cash. What do you need?","1d"},
		{"pg","What do you mean, “you’re too well known”?","1e"},
		{"pg","You know, I am not sure I should do this. I may have to check in with my team and see what they think.","1b"},

		{"label","1d"},
			{"ns","Excellent, mate! I’m happy to hear you can help. All you gotta do is go behind Can’t Get Enough Media.  You’ll see a pile of boxes out back. Just walk up and click on them, and you’ll grab that guitar for me.  Bring it back here, and I’ll give you a reward!","VS_T2PXET_04.ogg"},
			{"pg","Okay, you got it Jeffrey. I‘ll see you back here in a moment.","end"},

		{"label","1e"},
			{"ns","You see, I am too well known to go get the guitar myself…mostly because I tend to forget to pay for me goods from CGEM. Anyway, mate, so could you use some cash or what? It’ll only take a minute.","VS_T2PXET_05.ogg"},
			{"pg","Now that you put it that way  that sounds like something I can do! How do we get started?","1d"},
			{"pgs","I don’t know, Jeff, I don’t think that sounds like something I should be doing. Please excuse me.","reject","a"}, --EU+

{"label","1f"},
	{"ns","Hey again, mate! I was hoping I’d see you back here. So did you pick up the package for me or what? If you decide to hand it over, I have cash for you.","VS_T2PXET_06.ogg"},
	{"pg","Yep! I have the guitar right here. Thanks for the cash!","trans"},
	
	{"label","trans"},
		{"fun2",incvars,"ett"},
		{"fun",incsq},
		--add item to inventory or whatnot
		{"fun3",setvar,"guitar",false},
		{"fun3",setvar,"check",true},
		{"goto","end"},

{"label","atd1"},
	{"ns","Hey, mate! It was a pleasure doing business with you. Say, maybe I’ll see you around town!  Thanks again!","VS_T2PXET_08.ogg"},
	{"pg","The pleasure was mine, Jeff. See you around!","end"},

{"label","atd2"},
	{"ns","There you are, then!  Did you come back because you decided you could use some cash, mate?","VS_T2PXET_09.ogg"},
	{"pg","I have, Jeff. So what did you want me to do again?","1d"},
	{"pg","Actually, Jeff, I’m not sure I can spare the time just yet. I may see you soon though.","1b"},
	{"pgs","I don’t think I should be running any errand for you, Jeff and that’s final!","reject","b"}, --EU+

	{"label","reject"},
		{"fun2",incvars,"ett"},
		{"goto","end"},

{"label","atd3"},
	{"ns","Look, if you don’t want the money – it’s your loss. It’s not like I’m trying to punk you - I only want me guitar.  I’m sure someone else around here can help me with that.  No worries, mate.","VS_T2PXET_10.ogg"},
	{"pg","I’m glad there are no hard feelings, Jeff.  See you around.","end"},

	
{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
