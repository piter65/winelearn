local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
    {"ns","Don't be a fool. Stay in school.","vs_blessuw_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Miss a day, it fades away.","vs_blessuw_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","Voluteering is the way to go!","vs_blessuw_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","Think global, act local.","vs_blessuw_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
