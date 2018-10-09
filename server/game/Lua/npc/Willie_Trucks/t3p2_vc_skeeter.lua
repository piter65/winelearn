local dialogtext = {

{"if","vendor3progress","==",0,"VCASD"},
{"if","vendor3progress","==",1,"VC1"},
{"if","vendor3progress","==",2,"VCATD"},
{"if","vendor3progress","==",3,"VCATD2"},
{"if","vendor3progress",">=",4,"VJAIL"},

--****************
--Peter's adding in a jail dialog
--****************

	{"label","VJAIL"},
	{"ns","I will never speak to you again!","null.wav"},
	{"pg","Fine with me.","END"},

--****************
--NEED TO TALK TO L2R
--****************

	{"label","VCASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VC1"},
	{"ns","Hello there.  Do I know you?  If not, you should probably find your way out now. There is no trespassing here.  We have sensitive explos- I mean, sensitive experiments we work on here and would rather not have out-of-towners poking about.  I just gave a volunteer an application a moment ago so I can  now officially solicit donations for the recovery effort!","VS_T3P2VC1_01.ogg"},
	{"pg","No. I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe an ecological disaster assessor is behind it. Would you mind answering a few questions?","VC2"},
	{"pg","Hello, Skeeter. I was just passing through. Sorry to trouble you.","END"},

	--Questions
	{"label","VC2"},
	{"fun",incvendor3},
	{"ns","There are people in town siphoning needed relief funds?  What a bunch of psychos! Sorry I was rude before.  I would be happy to assist you in your investigation.  What would you like to know?","VS_T3P2VC1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VC3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VC4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VC5"},

	{"label","VC3"},
	{"ns","I’m pretty sure that’s called a business.","VS_T3P2VC1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VC7"},
	{"pg","Is that a fact? I think I need to call in some backup and have you arrested.","VC6"},

	{"label","VC4"},
	{"ns","Oh, that’s easy.  One would call those categorical imperatives.","VS_T3P2VC1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VC7"},
	{"pg","Is that the way you see it? I think I need to call in some backup and have you arrested.","VC6"},

	{"label","VC5"},
	{"ns","Oh, I know that one.  That is called analytical decision-making.","VS_T3P2VC1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VC7"},
	{"pg","Is that so?  I think I need to call in some backup and have you arrested.","VC6"},

	{"label","VC6"},
	{"ns","I think you are just looking to make trouble – because I would never do such a thing. I’m an eco-terr, I mean, an ecologist – not an embezzler! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P2VC1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this man away!","VCARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VC7"},
	{"ns","Well, I am all too happy to help you blow this investigation wide open - I only hope that my answers can be of use to you.  Is there anything else you would like to know?","VS_T3P2VC1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VC3"},
	{"pg","What would you call ‘rules’ – or sets of morals, values and beliefs -- that help guide decisions?","VC4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VC5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if didn’t ‘blow out’ of town….","END"},

	{"label","VCARREST"},
	{"fun",pickedvendor3},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor3progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VCATD"},
	{"ns","Welcome back!  Are you here to continue your investigation, or are you here about the smell?","VS_T3P2VC1_08.ogg"},
	{"pg","No, actually – but if you don’t mind, I’d like to ask you some questions again.","VC7"},
	{"pg","Actually, you should probably cancel your game– because it is clear to me now you are guilty! Willie, arrest this man!","VC6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VCATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
