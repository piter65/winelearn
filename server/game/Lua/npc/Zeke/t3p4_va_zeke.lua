local dialogtext = {

{"if","vendor1progress","==",0,"VAASD"},
{"if","vendor1progress","==",1,"VA1"},
{"if","vendor1progress","==",2,"VAATD"},
{"if","vendor1progress","==",3,"VAATD2"},

{"if","vendor1progress",">=",4,"VJAIL"},

--****************
--Peter's adding in a jail dialog
--****************

	{"label","VJAIL"},
	{"ns","I will never speak to you again!","null.wav"},
	{"pg","Fine with me.","END"},
--****************
--NEED TO TALK TO L2R
--****************

	{"label","VAASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VA1"},
	{"ns","Hello, youngster! Welcome to Mullen Medical! My name is Dr. Mullen. I’m glad you caught me before my mid-morning nap.  How can I help you?","VS_T3P4VA1_01.ogg"},
	{"pg","I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe a local emergency responder is behind it. Would you mind answering a few questions?","VA2"},
	{"pg","Hello, Zeke. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VA2"},
	{"fun",incvendor1},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  My, times are changing aren’t they! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P4VA1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call rules or the sets of morals, values and beliefs that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},

	{"label","VA3"},
	{"ns","Oh, my! You caught me before my nap, and my memory sometimes fails me, but I think that would be called a business.","VS_T3P4VA1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VA7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA4"},
	{"ns","It’s so nice to hear young people talk about those ‘rules’! Yes, I think you call those ethical principles. ","VS_T3P4VA1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA5"},
	{"ns","Now, that one is a tough one.  I think I need to lie down! Anyway, I believe that’s called a cost-benefit analysis.","VS_T3P4VA1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that so? I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA6"},
	{"ns","Oh my, I don’t have my hearing aid but did you say you think I am behind all this? I would never do such a thing! I am a respected member of this community! I think you may be making a big mistake! Are you sure you want to have me arrested? ","VS_T3P4VA1_06.ogg"},
	{"pg","You’re the ones making mistakes, criminals!  Willie, take this man away!","VAARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VA7"},
	{"ns","Well, I am all too happy to help your investigation.  I hope that my answers can be of use to you – I can hardly remember anything these days!  What else do you need to know?","VS_T3P4VA1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call rules or sets of morals, values and beliefs that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town.","END"},

	{"label","VAARREST"},
	{"fun",pickedvendor1},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor1progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VAATD"},
	{"ns","Welcome back!  Are you here to continue your investigation?  I was just on my way to take my late morning nap.","VS_T3P4VA1_08.ogg"},
	{"pg","Excuse me, Dr. Mullen, I hate to delay your nap - but if you don’t mind, I’d like to ask you more questions.","VA7"},
	{"pg","There will be plenty time for you to nap – in prison! I believe you are the one behind all this!   Willie, arrest this man!","VA6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VAATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
