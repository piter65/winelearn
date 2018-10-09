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
	{"ns","Welcome to Norse Communications! My name is Bjorn Egan.  Do you have an appointment with one of our specialists?","VS_T3P3VA1_01.ogg"},
	{"pg","No.  I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe a local media relations consultant is behind it. Would you mind answering a few questions?","VA2"},
	{"pg","Hello, Bjorn. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VA2"},
	{"fun",incvendor1},
	{"ns","Fraudulent solicitation of donations – how cold and impersonal! I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P3VA1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call rules – or the sets of morals, values and beliefs -- that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},

	{"label","VA3"},
	{"ns","Oh, yes. In the Northern Countries we call this, oh how do you say…”business”.","VS_T3P3VA1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VA7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA4"},
	{"ns","Ah! Even someone from Fjorland would know that! Those rules are called ethical principles. ","VS_T3P3VA1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that the way you see it? Well, I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA5"},
	{"ns","On, that’s a tough one.  I believe that is known as cost-benefit analysis.","VS_T3P3VA1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that so? I think I need to call in backup and have you arrested.","VA6"},

	{"label","VA6"},
	{"ns","I am but a humble guest in this wonderful County! I would never do such a thing! I’m a media consultant – not a mastermind criminal! You’re making a big mistake! Are you sure you want to arrest me? ","VS_T3P3VA1_06.ogg"},
	{"pg","You’re the ones making mistakes, criminals!  Willie, take this man away!","VAARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VA7"},
	{"ns","Of course, I am happy to aid in your investigation.  I hope that my answers can be of service to the relief and recovery effort!  What else you would like to know?","VS_T3P3VA1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VA4"},
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
	{"ns","Welcome back!  I hope you are doing well in your investigation, and that you are going to get to the bottom of this fraudulent scheme! Would you like a can of salmon, by chance?","VS_T3P3VA1_08.ogg"},
	{"pg","Excuse me, Bjorn, but if you don’t mind, I’d like to ask you some questions again.","VA7"},
	{"pg","It’ll have to wait. It is clear to me now that you are the culprit! Willie, arrest this man!","VA6"},

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
