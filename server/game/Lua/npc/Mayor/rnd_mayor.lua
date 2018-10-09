local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",2,"1"},
{"goto","2"},
{"label","1"},
    {"ns","Don't forget to vote for me!","vs_mayor_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Ethical behavior is the sign of good person.","vs_mayor_rdm2.wav"},
	{"wait","end"},
{"label","end"},
}
 return dialogtext
