local dialogtext = {
{"if","player","~=",1,"random"},
{"if","week","<",3,"random"},
{"if","w2vendor","==",4,"1"},
{"goto","3"},

{"label","random"},
{"if","rnddialog","==",0,"5"},
{"if","rnddialog","==",1,"5"},
{"goto","6"},
{"label","1"},
{"if","rnddialog","==",0,"2"},
{"if","rnddialog","==",1,"2"},
    {"ns","Excellent choice, recruit.","vs_w2p1vd_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Standing by to execute orders, soldier!","vs_w2p1vd_rdm2.wav"},
	{"wait","end"},
{"label","3"},
{"if","rnddialog","==",0,"4"},
{"if","rnddialog","==",1,"4"},
    {"ns","You had your shot, maggot!","vs_w2p1vd_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","You failed in your mission to pick me for your event, maggot!","vs_w2p1vd_rdm4.wav"},
	{"wait","end"},
{"label","5"},
    {"ns","Drop and give me 20, recruit!","vs_w2p1vd_rdm5.wav"},
	{"wait","end"},
{"label","6"},
    {"ns","At ease, soldier!","vs_w2p1vd_rdm6.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
