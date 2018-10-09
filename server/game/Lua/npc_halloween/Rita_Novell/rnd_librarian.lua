local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"label","1"},
    {"ns","The card catalogue is a girl's best friend.","vs_library_rdm1.wav"},
	--{"wait","end"},
	{"pg","Okay.","end"},
{"label","2"},
    {"ns","Reading is to the mind as exercise is to the body.","vs_library_rdm2.wav"},
	--{"wait","end"},
	{"pg","Okay.","end"},
{"label","3"},
    {"ns","Books are the carriers of civilization.","vs_library_rdm3.wav"},
	--{"wait","end"}, 
	{"pg","Okay.","end"},   
{"label","end"},
}
 return dialogtext
