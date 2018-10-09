local dialogtext = {

{"if","vendor2progress","==",0,"VBASD"},
{"if","vendor2progress","==",1,"VB1"},
{"if","vendor2progress","==",2,"VBATD"},
{"if","vendor2progress","==",3,"VBATD2"},

--****************
--NEED TO TALK TO L2R
--****************

	{"label","VBASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VB1"},
	{"ns","Welcome to Eco-Tech, Mon! I am Nathaniel Wailer. Are you here to pick up assessment results? ","VS_T3P2VB1_01.ogg"},
	{"pg","No. I’m investigating a scheme to divert funds from the City’s recovery effort. I believe an ecological disaster assessor is behind it. Would you mind answering a few questions?","VB2"},
	{"pg","Hello, Nathaniel. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VB2"},
	{"fun",incvendor2},
	{"ns","There are people in town soliciting donations – and keeping the money for themselves?  That isn’t only an affront to the environment – but an insult to us all! I would be happy to help your investigation. What would you like to know?","VS_T3P2VB1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},

	{"label","VB3"},
	{"ns","Of course, mon, that is called a business.","VS_T3P2VB1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VB7"},
	{"pg","Is that a fact? I think I need to call in some backup and have you arrested.","VB6"},

	{"label","VB4"},
	{"ns","Back in Montoga, we all referred to those as ethical principles.","VS_T3P2VB1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that the way you see it? I think I need to call in some backup and have you arrested.","VB6"},

	{"label","VB5"},
	{"ns","That’s tricky, but I believe that’s called ethical decision-making.","VS_T3P2VB1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that so? I think I need to call in some backup and have you arrested.","VB6"},

	{"label","VB6"},
	{"ns","I don’t think you really feel my vibe – because I would never do such a thing. I’m an environmentalist, not a mental recitivist! You’re making a mistake, mon! Are  you really positive you want me arrested?","VS_T3P2VB1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VBARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you  didn’t leave town!","END"},

	--More questions
	{"label","VB7"},
	{"ns","Well, I am all too happy to make sure everything is irie for everyone here in town.  I hope that my answers can be of use to you!  What else do you want to know?  (pronounced eye-ree)","VS_T3P2VB1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town….","END"},

	{"label","VBARREST"},
	{"fun",pickedvendor2},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor2progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VBATD"},
	{"ns","Welcome back! I was just organizing some pictures here.  Are you here to continue your investigation, or would you like to look at some slides of my last trip to Montoga?","VS_T3P2VB1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you some questions again.","VB7"},
	{"pg","No, I have no more questions to ask you – because it is clear you are to blame! Willie, arrest this man!","VB6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VBATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
