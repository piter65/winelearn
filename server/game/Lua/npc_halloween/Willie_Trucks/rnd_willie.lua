local dialogtext = {
{"if","player","~=",2,"random"},
{"if","week","<",2,"random"},
{"if","w1vendor","==",4,"1"},
{"goto","3"},

{"label","random"},
{"if","rnddialog","==",0,"5"},
{"if","rnddialog","==",2,"5"},
{"goto","6"},
{"label","1"},
{"if","rnddialog","==",0,"2"},
{"if","rnddialog","==",2,"2"},
    {"ns","Oh, Skate and Board is going to totally hook you up!","vs_w1p2vd_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","What a rad show we are going to put on at your event!","vs_w1p2vd_rdm2.wav"},
	{"wait","end"},
{"label","3"},
{"if","rnddialog","==",0,"4"},
{"if","rnddialog","==",2,"4"},
    {"ns","Oh, you just, like, totally missed it!","vs_w1p2vd_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","Dude, we could have rocked together.","vs_w1p2vd_rdm4.wav"},
	{"wait","end"},
{"label","5"},
    {"ns","I feel an Ollie coming on.","vs_w1p2vd_rdm5.wav"},
	{"wait","end"},
{"label","6"},
    {"ns","A grind a day keeps the doctor away.","vs_w1p2vd_rdm6.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
