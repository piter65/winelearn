local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

-- BChance: Commented below because it was messing up side-quest progress.
-- {"if","msq1","~=",2,"ifs"},
-- {"if","msq2","~=",3,"ifs"},
-- {"if","msq3","~=",2,"ifs"},
-- {"if","msq4","~=",3,"ifs"},
-- {"if","msqprogress","~=",2,"ifs"},
-- {"fun2",incvars,"msq1"},
-- {"fun2",incvars,"msq2"},
-- {"fun2",incvars,"msq3"},
-- {"fun2",incvars,"msq4"},
-- {"fun2",incvars,"msqprogress"},

-- {"label","ifs"},
{"if","msq2","==",0,"ASD3B"},
{"if","msq2","==",1,"ASD3C"},
{"if","msq2","==",2,"4A"},
{"if","msq2","==",3,"4D"},
{"if","msq2","==",4,"ATD3"},

--******************
--WRONG TASK
--******************

-- Peter Skips  {"label","ASD3A"},
{"ns","Hello there! Say, aren’t you from out of town? My horoscope told me I’d meet someone new today.","VS_T2PXETHQU_30.ogg"},
{"pg","What a coincidence!","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD3B"},
{"ns","It doesn’t take a fortune teller to see that this man is irrational! I should have seen this coming. My horoscope told me I’d meet resistance today.","VS_T2PXETHQU_31.ogg"},
{"pg","Right then, maybe I should leave you two alone.","END"},

--******************
--NOT TALKED TO OTHER NPC
--******************

{"label","ASD3C"},
{"ns","Hey there! Something about your aura tells me that Vern sent you to come get us.  Well, please tell the drill sergeant over here that I will totally not “drop down and give him twenty pushups”! I am the one with ethical principles – not him!","VS_T2PXETHQU_32.ogg"},
{"pg","Okay let me talk to your friend over here.","END"},

--*****************
--FIRST MEETING
--*****************

{"label","4A"},
{"fun2",incvars,"msq2"},
{"ns","Well, what do you make of his story?  I have to tell you, I don’t think Terrell’s karma is very good, because he doesn’t seem to know much about ethical principles! I, on the other hand, am an expert on the subject.","VS_T2PXETHQU_12.ogg"},
{"pg","Are you, now? Well, what do you have to tell me about?","4B"},

{"label","4B"},
{"ns","Okay, well I heard of a company that routinely dumps toxic waste into a nearby river. As it turns out, this company would rather pay fines for dumping their waste than build expensive facilities for safely storing and disposing of it.","VS_T2PXETHQU_13.ogg"},
{"pg","Okay, I see. So, what do you think about that?","4C"},

{"label","4C"},
{"fun2",incvars,"msqprogress"}, -- BChance: Added this to fix side-quest.
{"ns","Well, if it was up to me, I would never dump waste into our rivers, because it would lead to losing customers – and lower sales in the long run.  So what do you think about that?","VS_T2PXETHQU_14.ogg"},
{"pgs","That sounds like you would have based your decision on ethical principles.","4D","c"},  --ED+
{"pgs","I’m not saying you are right or wrong about that– but I don’t think your reasoning is based on ethical principles.","4D","d"},  --ED-

{"label","4D"},
{"ns","Well, I am relieved you settled that for me!  Even if we all agree to disagree, at least we can get on with our lives! You can tell Vern that I’ll join him and the others soon.  Thanks for your help!","VS_T2PXETHQU_15.ogg"},
{"pg","I am happy to lend a hand. Good luck with your volunteer work!","END"},

--******************
--COMPLETED QUEST
--******************

{"label","ATD3"},
{"ns","Thanks for your time settling that dispute.  I knew you would be able to help us!  You can tell Vern I’ll see him soon.","VS_T2PXETHQU_40.ogg"},
{"pg","Will do!  See you around!","END"},

--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
