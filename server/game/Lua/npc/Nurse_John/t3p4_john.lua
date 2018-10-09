local dialogtext = {

{"if","vendor4progress","==",0,"VDASD"},
{"if","vendor4progress","==",1,"VD1"},
{"if","vendor4progress","==",2,"VDATD"},
{"if","vendor4progress","==",3,"VDATD2"},
{"if","vendor4progress",">=",4,"VJAIL"},

--****************
--Peter's adding in a jail dialog
--****************

	{"label","VJAIL"},
	{"ns","I will never speak to you again!","null.wav"},
	{"pg","Fine with me.","END"},

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
	{"ns","Well, hello there!  Welcome to First Responders.  My name is John Gray. Are you a medical professional looking for a moonlighting shift?  We are currently interviewing.","VS_T3P4VD1_01.ogg"},
	{"pg","I’m here investigating a scheme to divert funds from the recovery effort. I believe that an emergency responder is behind it. Would you mind answering a few questions?","VD2"},
	{"pg","Hello, John. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VD2"},
	{"fun",incvendor4},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  Now that’s just unhealthy! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P4VD1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call rules or the sets of morals, values and beliefs  that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},

	{"label","VD3"},
	{"ns","I know this one.  That’s called an activity.","VS_T3P4VD1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VD7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD4"},
	{"ns","Well I think I remember this one from night school!   Those are called nuggets of wisdom.","VS_T3P4VD1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD5"},
	{"ns","Making selections isn’t easy – I think that’s called selection manifestation.","VS_T3P4VD1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that so? I think I need to call in backup and have you arrested.","VD6"},

	{"label","VD6"},
	{"ns","Now I know you don’t know the first thing about medicine – because I would never do such a thing. I’m a trauma specialist, not a lawbreaker! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P4VD1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VDARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VD7"},
	{"ns","Well, I am all too happy to respond to the crisis any way I can!  I hope that my answers can help the City recover from its wounds.  Is there anything else you would like to know?","VS_T3P4VD1_07.ogg"},
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
	{"ns","Are you here with more questions for your investigation, or would you like to volunteer as an emergency technician?","VS_T3P4VD1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you some questions again.","VD7"},
	{"pg","The next time you practice medicine will be behind bars– because you are the one behind all this!Willie, arrest this man!","VD6"},

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
