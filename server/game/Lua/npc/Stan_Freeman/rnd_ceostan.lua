local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",2,"1"},
{"goto","2"},
{"label","1"},
    {"ns","Good luck! Go get 'em!","vs_ceo_rdm1.wav"},
      {"pg","Okay, thanks.","end"},
--	{"wait","end"},
{"label","2"},
    {"ns","You can do it! Make us proud!","vs_ceo_rdm2.wav"},
     {"pg","Okay, thanks.","end"},
	--{"wait","end"},
{"label","end"},
}
 return dialogtext
