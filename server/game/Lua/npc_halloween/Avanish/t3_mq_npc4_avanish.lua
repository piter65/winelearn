local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"label","ifs"},
{"if","msq3","==",0,"ASD4"},
{"if","msq3","==",1,"5A"},
{"if","msq3","==",2,"ATD4"},

--******************
--FIRST MEETING
--******************

{"label","5A"},
{"ns","Welcome to Eastern Legal! My name is Avanish Singh. You must have been sent here by Larry Ledger, right! I am so pleased to see you. I have a crucial decision to make that is giving me more trouble than an over spiced vindaloo.","VS_T3PXMATHQU_17.ogg"},
{"pg","Okay, Avanish – what is on your mind?","5B"},

{"label","5B"},
{"ns","My mobile service contract is expiring soon, and I am choosing whether I should renew my service or if I should get a new phone plan.  I talk on the phone about 1100 minutes a month, and send about 600 text messages.","VS_T3PXMATHQU_18.ogg"},
{"pg","I see. So what are your choices?","5C"},

{"label","5C"},
{"ns","My current plan costs $39 a month, and includes 1800 minutes and unlimited text messaging. A competing plan costs $29 for 1500 minutes, and includes 400 free text messages with a $0.05 charge for every text after that. What do you think I should do?","VS_T3PXMATHQU_19.ogg"},
{"pgs","Based on a cost-benefit analysis, I suggest you get the plan with the lower monthly service fee.","5D","g"},  --CM-
{"pgs","Well, the numbers suggest you should get the plan with the most airtime minutes and text messages. ","5D","h"},  --CM-
{"pgs","Given your current phone and text message usage, it does not make a difference which plan you choose.","ADDSCORE","i"},  --CM+
{"pg","You know, I’m not too sure I can answer this fully right now – let me get back to you on this…","END"},

{"label","ADDSCORE"},
{"fun",addmqscore},
{"goto","5D"},

{"label","5D"},
{"fun2",incvars,"msq3"},
{"ns","Okay– that makes sense to me! Your kind help has left me much better prepared to make this decision.  That is good karma for you, indeed!  Thanks, again!","VS_T3PXMATHQU_20.ogg"},
{"pg","My pleasure, Avanish. I’ll see you around.","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD4"},
{"ns","Greetings! Welcome to Eastern Legal.  You’ll forgive me if I ask that you show yourself around – I am terribly busy at the moment trying to make some important decisions …oh, if only my accountant were here!","VS_T3PXMATHQU_31.ogg"},
{"pg","Well best of luck with that!","END"},

--******************
--TALKED ALREADY
--******************

{"label","ATD4"},
{"ns","Hello, my friend! I am so pleased to see you again. Thank you so kindly for all of your help. Your analysis was impressive. It was a pleasure to watch you work!","VS_T3PXMATHQU_36.ogg"},
{"pg","My pleasure, Avanish. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
