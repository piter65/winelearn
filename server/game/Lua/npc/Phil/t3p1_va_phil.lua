local dialogtext = {

{"if","vendor1progress","==",0,"VAASD"},
{"if","vendor1progress","==",1,"VA1"},
{"if","vendor1progress","==",2,"VAATD"},
{"if","vendor1progress","==",3,"VAATD2"},
{"if","vendor1progress",">=",4,"VDJAIL"},

--****************
--Peter's adding an in jail dialog
--****************

	{"label","VDJAIL"},
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
	{"ns","Welcome to Burells Brothers! My name is Phil.  How can I help you?","VS_T3P1VA1_01.ogg"},
	{"pg","I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe a local containment services provider is behind it. Would you mind answering a few questions?","VA2"},
	{"pg","Hello, Phil. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VA2"},
	{"fun",incvendor1},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  That ain’t no barrel of laughs, I’ll tell ya. I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P1VA1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},

	{"label","VA3"},
	{"ns","Oh, that’s easy.  That’s called a business.","VS_T3P1VA1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VA7"},
	{"pg","Is that a fact? I’m calling in reinforcements to have you arrested ","VA6"},

	{"label","VA4"},
	{"ns","I think I know this one.  Those 'rules' are called ethical principles.","VS_T3P1VA1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that the way you see it? I’m calling in reinforcements to have you arrested","VA6"},

	{"label","VA5"},
	{"ns","Even my brother Bill could answer this one! That process is known as cost-benefit analysis.","VS_T3P1VA1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VA7"},
	{"pg","Is that so?  I’m calling in reinforcements to have you arrested","VA6"},

	{"label","VA6"},
	{"ns","Bill? Say something! Tell them I would never do such a thing! We’re only guilty of serving our County – with containment services! You’re making a big mistake! Are you sure you want to have me arrested? ","VS_T3P1VA1_06.ogg"},
	{"pg","You’re the ones making mistakes, criminals!  Willie, take these men away!","VAARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you  two didn’t leave town!","END"},

	--More questions
	{"label","VA7"},
	{"ns","Well, I am all too happy to serve your investigation.  I hope that my answers can be of service to the County!  Is there anything else you would like to know?","VS_T3P1VA1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VA3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VA4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VA5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it you two didn’t leave town.","END"},

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
	{"ns","Welcome back!  Are you here to continue your investigation, or did you want to take a look at some of our backyard septic solutions?  ","VS_T3P1VA1_08.ogg"},
	{"pg","Excuse me, but if you don’t mind, I’d like to ask you a few more questions.","VA7"},
	{"pg","It’ll have to wait. It is clear to me now that you two are guilty! Willie, arrest these men!","VA6"},

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
