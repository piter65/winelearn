local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"label","ifs"},
{"if","msq4","==",0,"ASD5"},
{"if","msq4","==",1,"6A"},
{"if","msq4","==",2,"ATD5"},

--******************
--FIRST MEETING
--******************

{"label","6A"},
{"ns","Bon jour, mon ami! Come in! Larry Ledger sent you here, no? I am sure glad to see you as I have a problem that I am facing that is troubling me like a wheel of bad cheese. Perhaps you can help me?","VS_T3PXMATHQU_21.ogg"},
{"pg","What is on your mind?","6B"},

{"label","6B"},
{"ns","I have a client, you see, that is trying to decide whether or not they should implement a recycling program at the factory that they operate.","VS_T3PXMATHQU_22.ogg"},
{"pg","Okay, so what are the numbers?","6C"},

{"label","6C"},
{"ns","It would cost about $64,000 to implement a six-year recycling program, and it costs $5000 each year to maintain and operate. The plant would see a cost savings, though, of $25,000 per year for the next two years, and a $15,000 savings for four years after that, as a result of the program. Assuming that the plant invests the money it saves at an 8% annual return, what would you suggest?","VS_T3PXMATHQU_23.ogg"},
{"pgs","I think that the long-term cost savings may not warrant a recycling program - but they should do it regardless.","6D","j"},  --CM-
{"pgs","The numbers suggest a recycling program is not a good idea financially. The plant should invest the $64000 instead.","6D","k"},  --CM-
{"pgs","Based on a cost-benefit analysis, I suggest that the recycling program be implemented.","ADDSCORE","l"},  --CM+
{"pg","You know, I’m not too sure I can answer this fully right now – let me get back to you on this…","END"},

{"label","ADDSCORE"},
{"fun",addmqscore},
{"goto","6D"},

{"label","6D"},
{"fun2",incvars,"msq4"},
{"ns","I see! I will take your advice to heart, mon ami! Thank you kindly for your time.  I will be sure to tell Larry what a great help you were!  Now, if you will excuse me, it is nearly time for my crackers and frommage. Au revoir!","VS_T3PXMATHQU_24.ogg"},
{"pg","I am happy you appreciate my opinion. Well, then, good luck!","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD5"},
{"ns","Bon jour! Come in! I must apologize, though. Normally I would invite you in and offer you some cheese, but I am overwhelmed right now with some decisions I must make. Mon bleau! If only my accountant were here…","VS_T3PXMATHQU_32.ogg"},
{"pg","Well best of luck with that!","END"},

--******************
--TALKED ALREADY
--******************

{"label","ATD5"},
{"ns","Hello again, mon ami! I am so relieved you could help me - I am once again able to enjoy my hard-earned cheese and cracker breaks! You know, you should come by sometime and share some frommage with me!","VS_T3PXMATHQU_37.ogg"},
{"pg","I’m happy you appreciate the effort, Serge. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
