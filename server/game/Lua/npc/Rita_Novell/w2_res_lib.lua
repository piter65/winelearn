local dialogtext = {
{"label","help"},
	{"n","Welcome to the New City Library. What can I help you with?"},
	{"pg","I need information about some of the local businesses.","info"},
	{"pg","I'd like to make a return.","okreturn"},
	{"pg","Good bye.","end"},

{"label","info"},
	{"if","playernum","==",1,"1"},
	{"if","playernum","==",2,"2"},
	{"if","playernum","==",3,"3"},
	{"if","playernum","==",4,"4"},
{"label","1"},
	{"n","What information do you need?"},
	{"pg","I need materials regarding Wes Berlin.","w2b1"},
	{"pg","I need materials regarding Lakeisha.","w2b2"},
	{"pg","I need materials regarding Grandmaster G.","w2b3"},
	{"pg","I need materials regarding Fiona Rudd.","w2b4"},
	{"pg","Nevermind.","end"},
{"label","2"},
	{"n","What information do you need?"},
	{"pg","I need materials regarding Margaret Wong.","w2b5"},
	{"pg","I need materials regarding Cedric Maxwell.","w2b6"},
	{"pg","I need materials regarding Sam Shortback.","w2b7"},
	{"pg","I need materials regarding Dave Shortback.","w2b8"},
	{"pg","Nevermind.","end"},
{"label","3"},
	{"n","What information do you need?"},
	{"pg","I need materials regarding Ashley Dapper.","w2b9"},
	{"pg","I need materials regarding Wanda Rown.","w2b10"},
	{"pg","I need materials regarding Freida West.","w2b11"},
	{"pg","I need materials regarding Adam Baum.","w2b12"},
	{"pg","Nevermind.","end"},
{"label","4"},
	{"n","What information do you need?"},
	{"pg","I need materials regarding Avanish Singh.","w2b13"},
	{"pg","I need materials regarding Anthony Dewey.","w2b14"},
	{"pg","I need materials regarding Abbie S. Korpis.","w2b15"},
	{"pg","I need materials regarding Liddy Gates.","w2b16"},
	{"pg","Nevermind.","end"},

{"label","w2b1"},
	{"fun2",givebook,"w2b1"},
	{"goto","okinfo"},

{"label","w2b2"},
	{"fun2",givebook,"w2b2"},
	{"goto","okinfo"},

{"label","w2b3"},
	{"fun2",givebook,"w2b3"},
	{"goto","okinfo"},

{"label","w2b4"},
	{"fun2",givebook,"w2b4"},
	{"goto","okinfo"},

{"label","w2b5"},
	{"fun2",givebook,"w2b5"},
	{"goto","okinfo"},

{"label","w2b6"},
	{"fun2",givebook,"w2b6"},
	{"goto","okinfo"},

{"label","w2b7"},
	{"fun2",givebook,"w2b7"},
	{"goto","okinfo"},

{"label","w2b8"},
	{"fun2",givebook,"w2b8"},
	{"goto","okinfo"},

{"label","w2b9"},
	{"fun2",givebook,"w2b9"},
	{"goto","okinfo"},

{"label","w2b10"},
	{"fun2",givebook,"w2b10"},
	{"goto","okinfo"},

{"label","w2b11"},
	{"fun2",givebook,"w2b11"},
	{"goto","okinfo"},

{"label","w2b12"},
	{"fun2",givebook,"w2b12"},
	{"goto","okinfo"},

{"label","w2b13"},
	{"fun2",givebook,"w2b13"},
	{"goto","okinfo"},

{"label","w2b14"},
	{"fun2",givebook,"w2b14"},
	{"goto","okinfo"},

{"label","w2b15"},
	{"fun2",givebook,"w2b15"},
	{"goto","okinfo"},

{"label","w2b16"},
	{"fun2",givebook,"w2b16"},
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