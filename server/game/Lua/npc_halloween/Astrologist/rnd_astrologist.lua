local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
    {"ns","She's the quintessential Libra.","vs_astro_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","Harmony, creativity and balance.","vs_astro_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","Oh, I can just feel the stars aligning.","vs_astro_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","There's no doubt about it, it's Jupiter rising.","vs_astro_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
