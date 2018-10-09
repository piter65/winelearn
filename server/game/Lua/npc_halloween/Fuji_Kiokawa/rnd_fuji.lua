local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
	{"ns","May you have an interesting life.","vs_fuji_rdm1.wav"},
	{"wait","end"},
{"label","2"},
	{"ns","The honorable father taught the honorable daughter.","vs_fuji_rdm2.wav"},
	{"wait","end"},
{"label","3"},
	{"ns","Meeting is only the beginning of separation.","vs_fuji_rdm3.wav"},
	{"wait","end"},
{"label","4"},
	{"ns","All things are merely dreams.","vs_fuji_rdm4.wav"},
	{"wait","end"},		
	{"label","end"},
}

return dialogtext
