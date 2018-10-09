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
	{"ns","Welcome to Premiere Containment! I am Peter Boltright.  Are you here to take a look at some innovative containment solutions?  ","VS_T3P1VB1_01.ogg"},
	{"pg","No. I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe a local containment services provider is behind it. Would you mind answering a few questions?","VB2"},
	{"pg","Hello, Peter. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VB2"},
	{"fun",incvendor2},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  That sounds like a hare-brained scheme! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P1VB1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},

	{"label","VB3"},
	{"ns","I’m pretty sure that’s called a business.","VS_T3P1VB1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VB7"},
	{"pg","Is that a fact? I’m calling in reinforcements to have you arrested","VB6"},

	{"label","VB4"},
	{"ns","I know this.  One would call those ‘rules’ ethical principles.","VS_T3P1VB1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that the way you see it? I’m calling in reinforcements to have you arrested","VB6"},

	{"label","VB5"},
	{"ns","Oh, that’s a tough one.  I think that process would be called ethical decision-making.","VS_T3P1VB1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that so?   I’m calling in reinforcements to have you arrested","VB6"},

	{"label","VB6"},
	{"ns","I think something isn’t working here – because I would never do such a thing. I work in containment, not counterfeiting You’re making a big mistake! Are you sure you want to have me arrested?","VS_T3P1VB1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VBARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you  didn’t leave town!","END"},

	--More questions
	{"label","VB7"},
	{"ns","Well, I am all too happy to make sure everything works smoothly for the City.  I hope that my answers can be of use to your investigation!  Is there anything else you would like to know?","VS_T3P1VB1_07.ogg"},
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
	{"ns","Welcome back!  Are you here to continue your investigation, or are you here to take a look at my most recent invention?  It’s a messy demonstration – but my sewage aeration device is almost complete.  Care to have a look?","VS_T3P1VB1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you a few more questions.","VB7"},
	{"pg","No, I don’t have time because it is clear to me now that you are guilty! Willie, arrest this man!","VB6"},

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
