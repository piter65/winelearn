local dialogtext = {
{"if","rnddialog","==",0,"3"},
{"if","rnddialog","==",2,"3"},
{"goto","4"},
{"label","1"},
    {"ns","Hi. Hope I gave you the right advice.","vs_w1p4e1_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","I hope those vendors worked out for you!","vs_w1p4e1_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","It's a perfect day to build something.","vs_w1p4e1_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","Days like today make me want to play with my hammer.","vs_w1p4e1_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
