local dialogtext = {

{"if","vendor4progress","==",0,"VDASD"},
{"if","vendor4progress","==",1,"VD1"},
{"if","vendor4progress","==",2,"VDATD"},
{"if","vendor4progress","==",3,"VDATD2"},

--****************
--NEED TO TALK TO L2R
--****************

	{"label","VDASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VD1"},
	{"ns","Welcome to Ypoforo Ecosystems.  My name is Jannis Economou.  How may I help you?","VS_T3P2VD1_01.ogg"},
	{"pg","I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe an ecological disaster assessor is behind it. Would you mind answering a few questions?","VD2"},
	{"pg","Hello, Jannis. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VD2"},
	{"fun",incvendor4},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  That is truly a bad omen! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P2VD1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},

	{"label","VD3"},
	{"ns","Oh, yes.  I believe that is called incorporation.","VS_T3P2VD1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VD7"},
	{"pg","Is that a fact? I think I need to call in some backup and have you arrested.","VD6"},

	{"label","VD4"},
	{"ns","As sure as Neptune controls the seas, those ‘rules’ are known as mores.","VS_T3P2VD1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that the way you see it? I think I need to call in some backup and have you arrested.","VD6"},

	{"label","VD5"},
	{"ns","Yes, of course.  That is called using heuristics.","VS_T3P2VD1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that so? I think I need to call in some backup and have you arrested.","VD6"},

	{"label","VD6"},
	{"ns","Clearly you did not consult the oracle before making such a baseless accusation – because I’d never do such a thing! I’m a preservationist, not a pilferer! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P2VD1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VDARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VD7"},
	{"ns","Well, I am all too happy to guarantee the mythology of the relief and recovery effort!  I hope that my answers would please the gods and help save us all.  Is there anything else you would like to know?","VS_T3P2VD1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if both of you didn’t leave town….","END"},

	{"label","VDARREST"},
	{"fun",pickedvendor4},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor4progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VDATD"},
	{"ns","Welcome back!  Are you here to continue your investigation?  Personally, I think it would help if you made a sacrificial offering.  I can help you if you think you can get your hands on a lamb or a goat or something.","VS_T3P2VD1_08.ogg"},
	{"pg","Not yet, Jannis. If you don’t mind, I’d like to ask you some questions again.","VD7"},
	{"pg","Actually, you should probably pack up your alter – because you’re headed to prison! Willie, arrest this man!","VD6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VDATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
