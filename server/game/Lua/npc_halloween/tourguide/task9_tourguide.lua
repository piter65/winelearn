local dialogtext = {


{"if","pilotstage","==",0,"tg_10"},   
{"if","pilotstage","==",10,"tg_10"},  -- evelyn
{"if","pilotstage","==",20,"tg_10"},	 -- will
{"if","pilotstage","==",30,"tg_10"},	 -- webster
{"if","pilotstage","==",40,"tg_10"},	 -- webster
{"if","pilotstage","==",50,"tg_50"},	 -- webster



{"label","default"},
	{"n","Hi there!  I'm glad you can help. Why not check with Evelyn at the office to see what you should do next!"},

	{"pg","Ok then...","end"},
	

{"label","tg_10"},
	{"n","Thanks for playing.  If you're confused, Evelyn usually knows what to do next."},
	{"pg","Ok then...","end"},

{"label","tg_50"},
	{"n","Did someone win the race?\n\n Anyway, we're done! If you have any last minute thoughts, enter them in your journal. Thanks for helping, and please thank your teacher for me."},

		{"pg","You are welcome","end"},


{"label","end"},
}
 return dialogtext
