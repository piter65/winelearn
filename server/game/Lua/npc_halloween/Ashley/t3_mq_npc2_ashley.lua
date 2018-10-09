local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"label","ifs"},
{"if","msq1","==",0,"ASD2"},
{"if","msq1","==",1,"3A"},
{"if","msq1","==",2,"ATD2"},

--******************
--FIRST MEETING
--******************

{"label","3A"},
{"ns","Cheeri-o! Welcome to Clean Green Machinery. My name is Ashley Dapper. You must have been sent here by my accountant, Larry Ledger! It’s a good thing you’re here, because I am facing a tough choice and I need some help.","VS_T3PXMATHQU_09.ogg"},
{"pg","Okay, then – what seems to be the problem?","3B"},

{"label","3B"},
{"ns","You see, I need a copy machine for my office because I make about 2000 copies a month. There are two different models I can get, and I need your help deciding which one I should get. I expect that either one will last three years.","VS_T3PXMATHQU_10.ogg"},
{"pg","Okay, so what are the numbers?","3C"},

{"label","3C"},
{"ns","One of the machines is an energy saving model.  It costs $5000 to purchase and install.  After that, I’ll need about $0.02 per copy for ink, paper, and maintenance to the copy machine.  The other model costs only $3700 to buy and install – but costs $0.04 per copy to operate.  Which one do you think I should purchase? ","VS_T3PXMATHQU_11.ogg"},
{"pgs","Both options have the same benefits and the same costs – so it doesn’t really make a difference which one you get.","3D","a"},  --CM-
{"pgs","Both options have the same benefits - so I suggest you purchase the less expensive model because of its lower cost over the life of the copier.","3D","b"},  --CM-
{"pgs","Both options have the same benefits - so I suggest you purchase the energy saving model because of its lower cost over the life of the copier.","ADDSCORE","c"},  --CM+
{"pg","You know, I’m not too sure I can answer this fully right now – let me get back to you on this…","END"},

{"label","ADDSCORE"},
{"fun",addmqscore},
{"goto","3D"},

{"label","3D"},
{"fun2",incvars,"msq1"},
{"ns","Lovely! That was a clever analysis. I will certainly take that into consideration. Well, that’s all I need for now - and I’ll be sure to let Larry know you were a great help!  Cheeri-o!","VS_T3PXMATHQU_12.ogg"},
{"pg","I am happy you appreciate the advice Good luck!","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD2"},
{"ns","Welcome to Clean Green Machinery!  My name is Ashley Dapper.  Feel free to have a look around – but please, don’t touch anything unless you’ve washed your hands fifteen times in the last three hours.  It’s a hang-up of mine.","VS_T3PXMATHQU_29.ogg"},
{"pg","Nice to meet you, I guess. I’ll make sure my hands are clean before I touch anything…","END"},

--******************
--TALKED ALREADY
--******************

{"label","ATD2"},
{"ns","That’s all the help I need for now – but that was a good show, indeed! I’ll be sure to tell Larry what great help you were!  Cheers!","VS_T3PXMATHQU_34.ogg"},
{"pg","I’m happy you are pleased, Ashley See you around!","END"},

--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
