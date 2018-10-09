local dialogtext = {
{"if","week","~=",3,"ASD1A"},
{"fun3",setvar,"scoreconvo","nlc_msq"},

{"if","msq1","~=",2,"ifs"},
{"if","msq2","~=",2,"ifs"},
{"if","msq3","~=",2,"ifs"},
{"if","msq4","~=",2,"ifs"},
{"if","msqprogress","~=",2,"ifs"},
{"fun2",incvars,"msqprogress"},

{"label","ifs"},
{"if","msqprogress","==",0,"ASD1B"},
{"if","msqprogress","==",1,"1A"},
{"if","msqprogress","==",2,"2D"},
{"if","msqprogress","==",3,"7A"},
{"if","msqprogress",">=",4,"ATD1"},

--******************
--FIRST MEETING
--******************

{"label","1A"},
{"ns","Hey, there! You’re with Professional Services, right? I’m Larry Ledger, and I’m an accountant here in town.  Say, you don’t have a half hour or so to spare, do you?  You see, it’s my busy season, and I could really use a hand!","VS_T3PXMATHQU_01.ogg"},
{"pg","What seems to be the trouble?","1C"},
{"pg","I am not sure I have time for this right now, Larry. I’ll talk to you later.","1B"},

	{"label","1B"},
	{"ns","Well, alright, then. But please, when you do find time, please hurry back here. I could really use a hand!","VS_T3PXMATHQU_02.ogg"},
	{"pg","Okay, then, Mr. Ledger– maybe I’ll see you again soon.","END"},

	{"label","1C"},
	{"ns","Great! I’d really appreciate the help. You see, I have several clients around New City who need help with day to day decisions.  But like I said, it’s a busy time of year for me, so I am afraid I may not have the time to go and see them! Do you think you can spare a moment? ","VS_T3PXMATHQU_03.ogg"},
	{"pg","Okay, then, Larry - what do you want me to do?","2A"},
	{"pg","I am not sure I have the time to get into this right now. I may be back later.","1B"},

{"label","2A"},
{"ns","Okay, here is the deal: I have four clients around town, each of whom need help making an everyday decision. You need to conduct a cost-benefit analysis for them – and then recommend a choice.  Once you finish visiting all four of my clients, come back here and I’ll reward you for your efforts!","VS_T3PXMATHQU_04.ogg"},
{"pg","Okay, Larry, I think I can help out. How does this work?","2B"},
{"pg","On second thought, Mr. Ledger, this sounds a little too involved for me right now. I’ll come back later after I brush up on cost-benefit analysis.","1B"},

	{"label","2B"},
	{"ns","Okay, so you need to help four of my clients: The first client you need to see is Ashley Dapper over at Clean Green Machinery.  The next person you need to help is Manny Sales, who is over at the Tchochke Shop. After that, you should see Avanish Singh over at Eastern Legal and Serge Toulouse at Resoration Group.  Once you finish with all four clients, come find me back here! ","VS_T3PXMATHQU_05.ogg"},
	{"pg","Okay, I got it. Now what do I do when I get there?","2C"},

{"label","2C"},
{"fun2",incvars,"msq1"},
{"fun2",incvars,"msq2"},
{"fun2",incvars,"msq3"},
{"fun2",incvars,"msq4"},
{"fun2",incvars,"msqprogress"},
{"ns","Each of my clients is facing a decision.  You have to conduct a cost-benefit analysis for them, and then recommend which choice would be best for them to pursue. When you are done seeing everyone, come back, and I’ll let you know how you did!","VS_T3PXMATHQU_06.ogg"},
{"pg","Okay, great! I guess I’ll be going now.","END"},

--******************
--NOT TALKED TO NPCS
--******************

{"label","2D"},
{"ns","What are you doing here? My clients are calling and asking where you are! You have to go to the locations I told you about earlier and help each of my clients make a decision. Talk to each one, and help them decide on the best choice based on cost-benefit analysis.  I’ll see you back here when you’re finished!","VS_T3PXMATHQU_07.ogg"},
{"pg","I was just on my way to do that. I’ll see you back here later!","END"},
{"pg","Actually, Larry – I need a quick reminder. Can you tell me where everyone is located again?","2E"},

{"label","2E"},
{"ns","Sure! Here is where everyone is again: First, there is Ashley Dapper over at Clean Green Machinery.  You also need to help Manny Sales, who is waiting for you at the Tchochke Shop. Also, Avanish Singh needs a hand over at Eastern Legal - and finally, Serge Toulouse at Resoration Group also needs to speak with you.   Once you finish with each client, come find me back here! ","VS_T3PXMATHQU_08.ogg"},
{"pg","Thanks for the reminder, Larry – I’ll see you back here soon.","END"},

--******************
--TALKED TO NPCS
--******************

{"label","7A"},
{"fun2",incvars,"msqprogress"},
{"ns","Hey! You’re back! I heard from my clients that you’ve seen everyone, and helped them make their decisions.  That’s quite a relief!  If it wasn’t for you, I don’t know what I would have done - because I may not have been able to help until it was too late.","VS_T3PXMATHQU_25.ogg"},
{"pg","Well, I am happy to be of service. So, is that it?","7B"},

{"label","7B"},
{"ns","Yes, I think that’s all the help I need for now! I’ll be sure to let you know if I need anything else. But in the meantime, please take this - I hope you find my reward sufficient for your time. Thanks again!","VS_T3PXMATHQU_26.ogg"},
{"if","mqscore","<",3,"POOR"},
{"fun3",setvar,"certificate",true},
{"pg","Oh, hey – A “Certificate of Accounting”! Gee, thanks, Larry!","addmoney"},

{"label","POOR"},
{"pg","Okay, then, Mr. Ledger– maybe I’ll see you again soon!","addmoney"},

{"label","addmoney"},
{"fun",addmathcash},
{"goto","END"},

--******************
--WRONG TASK
--******************

{"label","ASD1A"},
{"ns","Hey there! Larry Ledger’s the name…say, aren’t you with Professional Team Services? It’s a good thing to know there are experts here in town – who knows, I may need your help sometime soon!","VS_T3PXMATHQU_27.ogg"},
{"pg","Of course, Larry. Well it’s nice to meet you.","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD1B"},
{"ns","Hey there! Larry Ledger’s the name…say, aren’t you with Professional Team Services? I’m really busy right now helping some clients of mine, but come find me later -- I may need your help with something!","VS_T3PXMATHQU_28.ogg"},
{"pg","Right, then, Larry – I’ll be sure and check back with you soon to see if you need anything.","END"},

--******************
--DONE WITH QUEST
--******************

{"label","ATD1"},
{"ns","Well, thanks again for all your help.  I really depreciate it!  Hah! Depreciate it! Do you get it? But seriously – it was a pleasure working with you. I’ll be sure and let you know if something else pops up! ","VS_T3PXMATHQU_33.ogg"},
{"pg","I’ll see you around, then, Larry. Take care!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
