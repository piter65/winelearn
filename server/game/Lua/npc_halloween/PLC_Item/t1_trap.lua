local dialogtext = {

{"label","1"},
{"ns","Do you want to pick up this package? It seems to belong to Pauline's Clothing Shop.","null.wav"},
{"pg","Yes","pickup"},
{"pg","No","END"},

{"label","pickup"},
{"fun3",setvar,"package",true},
{"goto","END"},


{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext


