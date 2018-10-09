local dialogtext = {
{"label","help"},
	{"n","Welcome to the New City Library. What can I help you with?"},
	{"pg","I need information about some of the local businesses.","info"},
	{"pg","I'd like to make a return.","return"},
	{"pg","Good bye.","end"},

{"label","info"},
	{"n","What information do you need?"},
		{"if","playernum","==",1,"1"},
		{"if","playernum","==",2,"2"},
		{"if","playernum","==",3,"3"},
		{"if","playernum","==",4,"4"},
{"label","1"},
	{"pg","I need materials regarding Nina Ojeda.","w1b1"},
	{"pg","I need materials regarding Gabe Vine.","w1b2"},
	{"pg","I need materials regarding Bjorn Egan.","w1b3"},
	{"pg","I need materials regarding Marvin Moneymaker.","w1b4"},
	{"pg","Nevermind.","end"},
{"label","2"},
	{"pg","I need materials regarding Gil Fermin.","w1b5"},
	{"pg","I need materials regarding John Gray.","w1b6"},
	{"pg","I need materials regarding Tom Barrier.","w1b7"},
	{"pg","I need materials regarding Dr. Zeke Mullen.","w1b8"},
	{"pg","Nevermind.","end"},
{"label","3"},
	{"pg","I need materials regarding Peter Boltright.","w1b9"},
	{"pg","I need materials regarding Oroko Nakashima.","w1trb10"},
	{"pg","I need materials regarding Phil Burells.","w1b11"},
	{"pg","I need materials regarding Anthony Wexler.","w1b12"},
	{"pg","Nevermind.","end"},
{"label","4"},	
	{"pg","I need materials regarding Nathaniel Wailer.","w1b13"},
	{"pg","I need materials regarding Jannis Economou.","w1b14"},
	{"pg","I need materials regarding Ramblin' Rose.","w1b15"},
	{"pg","I need materials regarding Skeeter McBragg.","w1b16"},
	{"pg","Nevermind.","end"},

{"label","w1b1"},
	{"fun2",givebook,"w1b1"},
	{"goto","okinfo"},

{"label","w1b2"},
	{"fun2",givebook,"w1b2"},
	{"goto","okinfo"},

{"label","w1b3"},
	{"fun2",givebook,"w1b3"},
	{"goto","okinfo"},

{"label","w1b4"},
	{"fun2",givebook,"w1b4"},
	{"goto","okinfo"},

{"label","w1b5"},
	{"fun2",givebook,"w1b5"},
	{"goto","okinfo"},

{"label","w1b6"},
	{"fun2",givebook,"w1b6"},
	{"goto","okinfo"},

{"label","w1b7"},
	{"fun2",givebook,"w1b7"},
	{"goto","okinfo"},

{"label","w1b8"},
	{"fun2",givebook,"w1b8"},
	{"goto","okinfo"},

{"label","w1b9"},
	{"fun2",givebook,"w1b9"},
	{"goto","okinfo"},

{"label","w1b10"},
	{"fun2",givebook,"w1b10"},
	{"goto","okinfo"},

{"label","w1b11"},
	{"fun2",givebook,"w1b11"},
	{"goto","okinfo"},

{"label","w1b12"},
	{"fun2",givebook,"w1b12"},
	{"goto","okinfo"},

{"label","w1b13"},
	{"fun2",givebook,"w1b13"},
	{"goto","okinfo"},

{"label","w1b14"},
	{"fun2",givebook,"w1b14"},
	{"goto","okinfo"},

{"label","w1b15"},
	{"fun2",givebook,"w1b15"},
	{"goto","okinfo"},

{"label","w1b16"},
	{"fun2",givebook,"w1b16"},
	{"goto","okinfo"},

{"label","okinfo"},
	{"n","Okay, here you go. Hope that information helps."},
	{"pg","Thanks.","end"},

{"label","return"},
	--{"n","Certainly, let's see what you have here."},
	--{"wait","okreturn"},

{"label","okreturn"},
	{"fun",takebook},
	{"n","Ok, I'll put this back for you.  Have a nice day."},
	{"pg","Good bye.","end"},

{"label","end"},
}
return dialogtext