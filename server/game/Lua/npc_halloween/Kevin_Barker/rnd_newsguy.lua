local dialogtext = {
{"if","playercash","<",1,"nf"},
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"label","1"},
    {"ns","Wanna buy a newspaper? Could help you in whatever it is you're doing","vs_newsguy_rdm1.wav"},
	{"pg","Sure","buy1"},     
	{"pg","No Thanks.","end"},    
{"label","2"},
    {"ns","We have all the news that almost fits. Want to buy a paper?","vs_newsguy_rdm2.wav"},
	{"pg","Sure","buy1"},     
	{"pg","No Thanks.","end"},    
{"label","3"},
    {"ns","Want to buy a paper? Might find some useful info.","vs_newsguy_rdm3.wav"},
	{"pg","Sure","buy1"},     
	{"pg","No Thanks.","end"},
{"label","nf"},
	{"n","If you want a newspaper, please come back when you have at least $1."},
	{"wait","end"},	   
{"label","buy1"},
	{"fun",buycrier},
	{"goto","end"},

{"label","end"},
}
 return dialogtext
