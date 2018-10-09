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
	{"ns","Welcome to New City Medical! I’m Gil Fermin!  Come in; come in….now, where did I put my business cards…so how can I help you? ","VS_T3P4VB1_01.ogg"},
	{"pg","I’m here investigating a scheme to divert funds from the recovery effort. I believe that an emergency responder is behind it. Would you mind answering a few questions?","VB2"},
	{"pg","Hello, Gil. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VB2"},
	{"fun",incvendor2},
	{"ns","There are people in town fraudulently soliciting donations  and keeping the money for themselves?  Well they do seem organized, which isn’t all bad. I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P4VB1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call rules or the sets of morals, values and beliefs that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},

	{"label","VB3"},
	{"ns","Oh, my.  I think I may need my reading glasses for this.  Now where are they?  And what was the question?  Oh, yes. I’m pretty sure that’s called a business.","VS_T3P4VB1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VB7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB4"},
	{"ns","Oh, my.  I hate getting put on the spot like this.  I don’t have any notes handy! Anyway, I think those ‘rules’ are called ethical principles. ","VS_T3P4VB1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB5"},
	{"ns","Oh, dear, oh dear.  I’m not sure I can remember this one.  Oh yes - that process would be called critical decision-making.","VS_T3P4VB1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that so? I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB6"},
	{"ns","I think you may be a little confused right now – because I would never do such a thing. I’m a medical technician, not a master tactician! I think you are making a big mistake. Are you sure you want to have me arrested?","VS_T3P4VB1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VBARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VB7"},
	{"ns","Yes, yes, yes.  Well, we could all use help getting all our facts organized properly.  I hope that you don’t lose any of the answers I give you!  So what else would you like to know?","VS_T3P4VB1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call rules or sets of morals, values and beliefs that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town.","END"},

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
	{"ns","Welcome back!  You look familiar.  Where do I know you from again?","VS_T3P4VB1_08.ogg"},
	{"pg","Hi, Gil, I have some questions related to my investigation to ask you.","VB7"},
	{"pg","Something tells me you’ll remember me after today - because you are behind this! Willie, arrest this man!","VB6"},

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
