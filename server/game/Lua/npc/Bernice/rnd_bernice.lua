local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
    {"ns","Wes was always my favorite!","vs_wb_mum_rdm1.wav"},
	{"wait","end"},
{"label","2"},
    {"ns","I always encouraged my kids to get tattoos!","vs_wb_mum_rdm2.wav"},
	{"wait","end"},
{"label","3"},
    {"ns","Don't tell my son - I hate loud music!","vs_wb_mum_rdm3.wav"},
	{"wait","end"},
{"label","4"},
    {"ns","I used to like opera.","vs_wb_mum_rdm4.wav"},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
