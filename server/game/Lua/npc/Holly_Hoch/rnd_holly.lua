local dialogtext = {
{"if","player","~=",3,"random"},
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
    {"ns","This is totally going to work!","vs_w1p3vd_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Gee, it's great that you picked Potty Pak!","vs_w1p3vd_rdm2.wav"},
	{"wait","end"},
{"label","3"},
{"if","rnddialog","==",0,"4"},
{"if","rnddialog","==",2,"4"},
    {"ns","You could have won but I don't see that happening.","vs_w1p3vd_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","I guess you're in the same category with the spotted owl...endangered.","vs_w1p3vd_rdm4.wav"},
	{"wait","end"},
{"label","5"},
    {"ns","A perfect day for a drum circle meeting!","vs_w1p3vd_rdm5.wav"},
	{"wait","end"},
{"label","6"},
    {"ns","I feel like going on a hike.","vs_w1p3vd_rdm6.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
