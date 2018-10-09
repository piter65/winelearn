local dialogtext = {

{"label","1"},
{"ns","Do you want to pick up this package? It seems to belong to Can't Get Enough Media.","null.wav"},
{"pg","Yes","pickup"},
{"pg","No","END"},

{"label","pickup"},
{"fun3",setvar,"guitar",true},
{"goto","END"},


{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext


