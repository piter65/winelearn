local dialogtext = {
{"if","player","~=",1,"random"},
{"if","player","~=",2,"random"},
{"if","week","<",2,"random"},
{"goto","1"},

{"label","random"},
{"if","rnddialog","==",0,"3"},
{"if","rnddialog","==",1,"3"},
{"goto","4"},
{"label","1"},
{"if","rnddialog","==",0,"2"},
{"if","rnddialog","==",1,"2"},
    {"ns","It's real nice to see ya'll again. Hope I was helpful for ya.","vs_w1p1e1_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","I'm glad I was able to help you out.","vs_w1p1e1_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","Nice day today isn't it?","vs_w1p1e1_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","I'm having so much fun!","vs_w1p1e1_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
