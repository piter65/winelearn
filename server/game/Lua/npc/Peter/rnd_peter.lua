local dialogtext = {
{"if","player","~=",4,"random"},
{"if","week","<",4,"random"},
{"goto","1"},

{"label","random"},
{"if","rnddialog","==",0,"3"},
{"if","rnddialog","==",2,"3"},
{"goto","4"},
{"label","1"},
{"if","rnddialog","==",0,"2"},
{"if","rnddialog","==",2,"2"},
    {"ns","Hope my information was a good fit!","vs_w3p4e1_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Hey! Hope the advice I gave you worked!","vs_w3p4e1_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","I feel like today is going to be interesting.","vs_w3p4e1_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","Every thing in it's place, I always say.","vs_w3p4e1_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
