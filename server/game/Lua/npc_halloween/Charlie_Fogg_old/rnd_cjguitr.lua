local dialogtext = {
{"if","rnddialog","==",0,"1"},
{"if","rnddialog","==",1,"2"},
{"if","rnddialog","==",2,"3"},
{"if","rnddialog","==",3,"4"},
{"label","1"},
    {"ns","Rehearse all day, play all night.","vs_cjband_rdm1.wav"},
	 {"pg","okay.","END"}
	--{"wait","end"},
{"label","2"},
    {"ns","Let's jam!","vs_cjband_rdm2.wav"},
	 {"pg","okay.","END"}
	--{"wait","end"},
{"label","3"},
    {"ns","I need to change my strings.","vs_cjband_rdm3.wav"},
	 {"pg","okay.","END"}
	--{"wait","end"},
{"label","4"},
    {"ns","We can always fix it in the mix, man.","vs_cjband_rdm4.wav"},
	 {"pg","okay.","END"}
	--{"wait","end"},
{"label","end"},
}
 return dialogtext
