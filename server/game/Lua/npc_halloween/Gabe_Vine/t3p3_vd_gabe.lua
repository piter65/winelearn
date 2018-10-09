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
	{"ns","Am I glad to see you!  I have been here alone all day and there is some gossip I just heard that I have to tell some…-– oh, I’m sorry, have we met? I always get ahead of myself! My name is Gabe Vine. Welcome to New Media Communications.","VS_T3P3VD1_01.ogg"},
	{"pg","Hello.  I’m here investigating a scheme to divert funds from the City, and I believe a media relations consultant is behind it. Do you mind answering a few questions?","VD2"},
	{"pg","Hello, Gabe. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VD2"},
	{"fun",incvendor4},
	{"ns","There are people in town soliciting donations – and keeping the money for themselves?  Talk about scandalous! Well, now that you’ve told me, I feel like telling everyone else. Do you think I could be of any help? What would you like to know?","VS_T3P3VD1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call ‘rules’ or the sets of morals, values and beliefs that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},

	{"label","VD3"},
	{"ns","Oh, okay.  Let me think…Okay – that is called formation.","VS_T3P3VD1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VD7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD4"},
	{"ns","That is as clear as a bell. Those are Eastern philosophies.","VS_T3P3VD1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD5"},
	{"ns","Oh, I recognize that!  That is called the investment principle.","VS_T3P3VD1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that so?   I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD6"},
	{"ns","Clearly you have the story wrong – because I would never do such a thing. I’m a consultant, not a crook! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P3VD1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VDARREST"},
	{"pg","Well, maybe not – at least not yet. I’m going to go check my facts, but I may be back – so don’t leave town!","END"},

	--More questions
	{"label","VD7"},
	{"ns","Well, I am all too happy to talk it out with you!  I hope that our heart-to-heart answers will make you feel better! What else you would like to know?","VS_T3P3VD1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call rules or sets of morals, values and beliefs that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town.","END"},

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
	{"ns","Welcome back!  Are you here to continue your investigation, or do you want to hear something about someone in town that I just heard that you won’t believe?","VS_T3P3VD1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you some questions again.","VD7"},
	{"pg","You can gossip all you want in a jail cell – because you are the one behind all this! Willie, arrest this man!","VD6"},

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
