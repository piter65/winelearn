local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",2,"1"},
{"goto","2"},
{"label","1"},
    {"n","I hope things are going well for you."},
	{"wait","end"},
{"label","2"},
    {"n","Don't forget to write your notes down."},
	{"wait","end"},    
{"label","end"},
}
 return dialogtext
