local dialogtext = {

{"if","vendor1progress","==",0,"VAASD"},
{"if","vendor1progress","==",1,"VA1"},
{"if","vendor1progress","==",2,"VAATD"},
{"if","vendor1progress","==",3,"VAATD2"},

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
	{"ns","Like hey! Whoa, I sense some pretty serious energy from you right now.  Are you feeling alright? ","VS_T3P2VA1_01.ogg"},
	{"pg","Yes, thanks. I’m investigating a scheme to divert funds from the City, and I believe an ecological disaster assessor is behind it. Do you mind answering a few questions?","VA2"},
	{"pg","Yes, thanks Rose. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VA2"},
	{"fun",incvendor1},
	{"ns","There are people in town soliciting donations – and keeping the money for themselves?  That’s like, a total bummer! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P2VA1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call rules, or the sets of morals, values and beliefs -- that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},

	{"label","VA3"},
	{"ns","Oh, like, I totally know this one.  That’s called a business.","VS_T3P2VA1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VA7"},
	{"pg","Is that a fact?  I think I need to call in some backup and have you arrested.","VA6"},

	{"label","VA4"},
	{"ns","Wait, wait…I know this one!  Wait, no I forgot what I was gonna say….oh yeah!   Those rules are called ethical principles. ","VS_T3P2VA1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that the way you see it? I think I need to call in some backup and have you arrested.","VA6"},

	{"label","VA5"},
	{"ns","Ah, man! That’s, like, a trick question.  I don’t know – but I think that’s a cost-benefit analysis.","VS_T3P2VA1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that so?   I think I need to call in some backup and have you arrested.","VA6"},

	{"label","VA6"},
	{"ns","Whoa, like, did you eat some moldy bread or something? I would never do such a thing! I’m a Capricorn not a criminal! You’re making a big mistake! Are you sure you want to arrest me? ","VS_T3P2VA1_06.ogg"},
	{"pg","You’re the ones making a mistake, criminal!  Willie, take these woman away!","VAARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you  didn’t leave town!","END"},

	--More questions
	{"label","VA7"},
	{"ns","Of course – even though you are working for the “man” I am happy to help the investigation.  I only hope that my answers can help save the river and the fish and the birds and stuff!  Is there anything else you need to know?","VS_T3P2VA1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town….","END"},

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
	{"ns","Whoa, hey there again! Wow, you totally look like your energy centers are really misaligned.  Would you like to meditate with me?","VS_T3P2VA1_08.ogg"},
	{"pg","Excuse me, but if you don’t mind, I’d like to ask you some questions again.","VA7"},
	{"pg","You’ll have time to meditate – behind bars! I believe you are the one behind all this! Willie, arrest this woman!","VA6"},

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
