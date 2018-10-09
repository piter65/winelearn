local dialogtext = {

	{"if","emptycollectkits_1","==",true,"1A"},
	{"if","emptycollectkits_2","==",true,"1A"},
	{"if","emptycollectkits_3","==",true,"1A"},
	{"if","emptycollectkits_4","==",true,"1A"},
	{"if","emptycollectkits_5","==",true,"1A"},
	{"if","emptycollectkits_6","==",true,"1A"},
	{"if","emptycollectkits_7","==",true,"1A"},
	{"if","emptycollectkits_8","==",true,"1A"},
	{"if","emptycollectkits_9","==",true,"1A"},
	{"if","emptycollectkits_10","==",true,"1A"},
	{"goto","NOOBJS"},

	{"label","1A"},
	{"ns","Do you want to collect a sample?","null.wav"},
	{"pg","Yes.","1B"},
	{"pg","Maybe later.","END"},

	{"label","1B"},
	{"if","emptycollectkits_1","==",true,"1B1"},
	{"if","emptycollectkits_2","==",true,"1B2"},
	{"if","emptycollectkits_3","==",true,"1B3"},
	{"if","emptycollectkits_4","==",true,"1B4"},
	{"if","emptycollectkits_5","==",true,"1B5"},
	{"if","emptycollectkits_6","==",true,"1B6"},
	{"if","emptycollectkits_7","==",true,"1B7"},
	{"if","emptycollectkits_8","==",true,"1B8"},
	{"if","emptycollectkits_9","==",true,"1B9"},
	{"if","emptycollectkits_10","==",true,"1B10"},

	{"label","1B1"},
	{"fun3",setvar,"emptycollectkits_1",nil},
	{"fun3",setvar,"scollectkits_1",true},
	{"goto","ADDTUBE"},

	{"label","1B2"},
	{"fun3",setvar,"emptycollectkits_2",nil},
	{"fun3",setvar,"scollectkits_2",true},
	{"goto","ADDTUBE"},

	{"label","1B3"},
	{"fun3",setvar,"emptycollectkits_3",nil},
	{"fun3",setvar,"scollectkits_3",true},
	{"goto","ADDTUBE"},

	{"label","1B4"},
	{"fun3",setvar,"emptycollectkits_4",nil},
	{"fun3",setvar,"scollectkits_4",true},
	{"goto","ADDTUBE"},

	{"label","1B5"},
	{"fun3",setvar,"emptycollectkits_5",nil},
	{"fun3",setvar,"scollectkits_5",true},
	{"goto","ADDTUBE"},

	{"label","1B6"},
	{"fun3",setvar,"emptycollectkits_6",nil},
	{"fun3",setvar,"scollectkits_6",true},
	{"goto","ADDTUBE"},

	{"label","1B7"},
	{"fun3",setvar,"emptycollectkits_7",nil},
	{"fun3",setvar,"scollectkits_7",true},
	{"goto","ADDTUBE"},

	{"label","1B8"},
	{"fun3",setvar,"emptycollectkits_8",nil},
	{"fun3",setvar,"scollectkits_8",true},
	{"goto","ADDTUBE"},

	{"label","1B9"},
	{"fun3",setvar,"emptycollectkits_9",nil},
	{"fun3",setvar,"scollectkits_9",true},
	{"goto","ADDTUBE"},

	{"label","1B10"},
	{"fun3",setvar,"emptycollectkits_10",nil},
	{"fun3",setvar,"scollectkits_10",true},
	{"goto","ADDTUBE"},

	{"label","ADDTUBE"},
	{"fun2",incvars,"filledtubes"},
	{"if","filledtubes","<",6,"END"},
	{"if","msq1",">",7,"END"},
	{"fun2",incvars,"msq1"},
	{"goto","END"},

	{"label","NOOBJS"},
	{"ns","You do not have anything with which you can collect samples.","null.wav"},
	{"pg","Okay.","END"},

--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
