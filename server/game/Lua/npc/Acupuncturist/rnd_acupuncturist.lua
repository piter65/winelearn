local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
    {"ns","I have all Heather's custom needles right here.","vs_acupun_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","I can never get her to sit still.","vs_acupun_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","Let me test your meridians.","vs_acupun_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","Don't worry, the needles don't hurt.","vs_acupun_rdm4.wav"},
	{"wait","end"},
{"label","end"},
}
 return dialogtext
