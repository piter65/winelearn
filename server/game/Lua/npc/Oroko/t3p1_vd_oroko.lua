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
	{"ns","Welcome to Running Waters Corporation! My name is Oroko Nakashima, at your service.","VS_T3P1VD1_01.ogg"},
	{"pg","Hello,  I’m here investigating a scheme to divert funds from the City’s recovery effort, and I have heard a containment provider is involved. Do you mind answering a few questions?","VD2"},
	{"pg","Hello, Oroko. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VD2"},
	{"fun",incvendor4},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  How dishonorable! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P1VD1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},

	{"label","VD3"},
	{"ns","This is something I believe is called an activity.","VS_T3P1VD1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VD7"},
	{"pg","Is that a fact? I’m calling in reinforcements to have you arrested","VD6"},

	{"label","VD4"},
	{"ns","That is as clear as the sky on a cloudless day.  Those are Eastern philosophies.","VS_T3P1VD1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that the way you see it? I’m calling in reinforcements to have you arrested","VD6"},

	{"label","VD5"},
	{"ns","Oh, I recognize that!  That is called the investment principle.","VS_T3P1VD1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VD7"},
	{"pg","Is that so?  I’m calling in reinforcements to have you arrested","VD6"},

	{"label","VD6"},
	{"ns","Clearly you are not very wise – because I would never do such a thing. I’m a conservationist, not a crook! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P1VD1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this woman away!","VDARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VD7"},
	{"ns","Well, I am all too happy to restore honor to the relief and recovery effort!  I hope that my answers can help the City save face.  Is there anything else you would like to know?","VS_T3P1VD1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VD3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VD4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VD5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town….","END"},

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
	{"ns","Welcome back!  Are you here to continue your investigation, or are you interested in the recent ecological developments in the Oceanic Rim?","VS_T3P1VD1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you some questions again.","VD7"},
	{"pg","Actually, you should probably cancel your game– because it is clear to me now you are guilty! Willie, arrest this woman!","VD6"},

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
