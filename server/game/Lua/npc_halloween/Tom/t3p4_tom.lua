local dialogtext = {

{"if","vendor3progress","==",0,"VCASD"},
{"if","vendor3progress","==",1,"VC1"},
{"if","vendor3progress","==",2,"VCATD"},
{"if","vendor3progress","==",3,"VCATD2"},

--****************
--NEED TO TALK TO L2R
--****************

	{"label","VCASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VC1"},
	{"ns","Welcome to Medic, Inc! I am Tom Barrier. Do you need medical attention?  Have there been casualties?","VS_T3P4VC1_01.ogg"},
	{"pg","I’m here investigating a scheme to divert funds from the recovery effort. I believe that an emergency responder is behind it. Would you mind answering a few questions?","VC2"},
	{"pg","No, Tom – I didn’t mean to alarm you.  I was just passing through. Excuse me…","END"},

	--Questions
	{"label","VC2"},
	{"fun",incvendor3},
	{"ns","What? People are fraudulently soliciting donations – and keeping the money for themselves? That is disgraceful! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P4VC1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VC3"},
	{"pg","What would you call rules or the sets of morals, values and beliefs  that help guide decisions?","VC4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VC5"},

	{"label","VC3"},
	{"ns","I can comply with that question, recruit. I’m pretty sure that’s called a business.","VS_T3P4VC1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VC7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VC6"},

	{"label","VC4"},
	{"ns","That question is outstanding, recruit.  Back in the military, we called those rules the code.","VS_T3P4VC1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VC7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VC6"},

	{"label","VC5"},
	{"ns","Yes, recruit, I am happy you asked.  That is known as the collateral damage assessment approach.","VS_T3P4VC1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VC7"},
	{"pg","Is that so? I think I need to call in backup and have you arrested.","VC6"},

	{"label","VC6"},
	{"ns","Your performance is unacceptable recruit– because I would never do such a thing. I’m a medic, not a malfeasant! You’re making a big mistake! Are you really sure you want to have me arrested?","VS_T3P4VC1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VCARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VC7"},
	{"ns","Well, I am happy to comply with your inquiry, recruit.  I hope that my answers can help smoke the culprit out of his cave! What else you d you need to know?","VS_T3P4VC1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VC3"},
	{"pg","What would you call rules  or sets of morals, values and beliefs that help guide decisions?","VC4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VC5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town.","END"},

	{"label","VCARREST"},
	{"fun",pickedvendor3},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor3progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VCATD"},
	{"ns","Welcome back, recruit!  Are you here to continue your investigation, or are you or someone you know in need of urgent medical attention?","VS_T3P4VC1_08.ogg"},
	{"pg","Not quite, Tom.  If you don’t mind, I’d like to ask you some questions again.","VC7"},
	{"pg","You need attention alright– because it is clear that you are the one behind all this! Willie, arrest this man!","VC6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VCATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
