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
{"if","msq1","==",0,"ASD2B"},
{"if","msq1","==",1,"3A"},
{"if","msq1","==",2,"3D"},
{"if","msq1","==",3,"ATD2"},

--******************
--WRONG TASK
--******************

-- Peter skips{"label","ASD2A"},
{"ns","Good day, recruit! You’ll have to forgive me, but I am deeply embroiled in a volunteer mobilization effort at the moment. I hope you do not mind showing yourself out. Dismissed!","VS_T2PXETHQU_28.ogg"},
{"pg","Right then, maybe I should leave you two alone.","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD2B"},
{"ns","Recruit, can you please tell this civilian to drop down and give me twenty? Her decision has nothing to do with ethical principles!","VS_T2PXETHQU_29.ogg"},
{"pg","Right then, maybe I should leave you two alone.","END"},

--*****************
--FIRST MEETING
--*****************

{"label","3A"},
{"fun2",incvars,"msq1"},
{"fun2",incvars,"msq2"},
{"ns","Excuse me, recruit – I was just engaging this civilian here about a situation where I believe a decision should be made based on ethical principles.  Say – did Vern Sharpe send you here to come and get us? Well, then maybe you can mediate this disagreement!","VS_T2PXETHQU_08.ogg"},
{"pg","Alright then, let’s have it.","3B"},

{"label","3B"},
{"ns","You see, recruit, I know of a car salesman in Rosenfield that is paid on commissions. The bigger the sales he makes, the more money he makes. I recently discovered he lies to potential buyers about some of the cheaper cars he sells so that they buy more expensive models.","VS_T2PXETHQU_09.ogg"},
{"pg","Okay, I see. So, what do you think about that?","3C"},

{"label","3C"},
{"ns","Well I think that one should never lie to customers, no matter what – because I just feel deep down that lying is always wrong. Now, I believe that this is a matter of ethical principles – but my psychic sidekick here disagrees!","VS_T2PXETHQU_10.ogg"},
{"pgs","I am with you on this one Terrel. That sounds like ethical principles to me.","3D","a"},  --ED+
{"pgs","I agree with your sidekick. That doesn’t sound like an ethical principle to me.","3D","b"},  --ED-

{"label","3D"},
{"ns","That is outstanding, recruit.  I find that analysis to be satisfactory.  You’ve been a big help – if it wasn’t for you, we could have been engaged for hours over this.  You can tell Vern I’ll join up with his squad soon!","VS_T2PXETHQU_11.ogg"},
{"pg","I will be sure and tell him. Nice meeting you, and good luck with your volunteer work!","END"},

--******************
--COMPLETED QUEST
--******************

{"label","ATD2"},
{"ns","Thank you for helping clarify our dispute, recruit.  When you report to Vern, please brief him that I will be joining him ASAP.  Dismissed!","VS_T2PXETHQU_39.ogg"},
{"pg","I’m happy you are pleased, Terrell. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
