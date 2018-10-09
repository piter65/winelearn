local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",2,"1"},
{"goto","2"},
{"label","1"},
    {"ns","Good luck. Go get 'em!","vs_standon_rdm1.wav"},
	 {"pg","Okay, thanks.","end"},
	--{"wait","end"},
	
{"label","2"},
    {"ns","You can do it! Make us proud!","vs_standon_rdm2.wav"},
	 {"pg","Okay, thanks.","end"},
	--{"wait","end"},    
{"label","end"},
}
 return dialogtext
