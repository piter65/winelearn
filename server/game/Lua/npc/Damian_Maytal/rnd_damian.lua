local dialogtext = {
{"if","player","~=",1,"random"},
{"if","week","<",3,"random"},
{"if","w2vendor","==",1,"1"},
{"goto","3"},

{"label","random"},
{"if","rnddialog","==",0,"5"},
{"if","rnddialog","==",2,"5"},
{"goto","6"},

{"label","1"},
{"if","rnddialog","==",0,"2"},
{"if","rnddialog","==",2,"2"},
    {"ns","Nuff respect, mon. Good choice.","vs_w2p1va_rdm1.wav"},
    {"pg","okay","end"}
	--{"wait","end"},
{"label","2"},
    {"ns","Very good choice, mon.","vs_w2p1va_rdm2.wav"},
	 {"pg","okay","end"}
	--{"wait","end"},
{"label","3"},
{"if","rnddialog","==",0,"4"},
{"if","rnddialog","==",2,"4"},
    {"ns","Don't feel bad about your choice, mon.","vs_w2p1va_rdm3.wav"},
	 {"pg","okay","end"}
	--{"wait","end"},
{"label","4"},
    {"ns","Put on a smile, mon. You can pick me next time.","vs_w2p1va_rdm4.wav"},
	 {"pg","okay","end"}
	--{"wait","end"},
{"label","5"},
    {"ns","Life is good, mon.","vs_w2p1va_rdm5.wav"},
	 {"pg","okay","end"}
	--{"wait","end"},
{"label","6"},
    {"ns","Irie, mon.","vs_w2p1va_rdm6.wav"},
	 {"pg","okay","end"}
	--{"wait","end"},  
{"label","end"},
}
 return dialogtext
