local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"label","1"},
    {"ns","Howdy, partner!","vs_w4pxf1_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Happy trails, partner!","vs_w4pxf1_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","I'm lookin' to catch me some vermin!","vs_w4pxf1_rdm3.wav"},
	{"wait","end"},
{"label","end"},
}
 return dialogtext
