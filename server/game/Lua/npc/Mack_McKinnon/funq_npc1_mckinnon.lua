local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"label","ifs1"},

{"label","ifs2"},
{"if","msq1","==",0,"ATD1B"},
{"if","msq1","==",1,"1A"},
{"if","msq1","==",2,"ASD1B"},
{"if","msq1","==",3,"2D"},
{"if","msq1","==",4,"4A"},
{"if","msq1","==",5,"4D"},
{"if","msq1","==",6,"6A"},
{"if","msq1","==",7,"6D"},
{"if","msq1","==",8,"7A"},
{"if","msq1","==",9,"ATD1A"},

--******************
--NOT ACTIVATED
--******************

	{"label","ATD1B"},
	{"ns","Ahoy, matey! That tanker that ran aground has caused a real mess of things. I can only hope you’re doing your part to help save us all from going under!","VS_T1PXFUNQU_30.ogg"},
	{"pg","We’re all doing our best, Mack. Thanks for your concern.","END"},

--********************
--FIRST MEETING
--********************


	{"label","1A"},
	{"fun2",incvars,"msq1"},
	{"ns","Welcome to New City Boater’s Paradise! The name’s Mack, Mack McKinnon. Have we met? Please pardon me, but I don’t have much time to chat - we are desperately trying to help coordinate the relief and recovery efforts on behalf of the City. That’s why you see us here running around like a bunch of lowlanders defending from a Viking pirate raid! Say, do you think you have a moment? We could use the help!","VS_T1PXFUNQU_01.ogg"},
	{"pg","Yeah, I have a few minutes. What’s on your mind?","1C"},
	{"pg","I don’t know, Mack, I am not sure I can spare the time just now. Maybe later.","1B"},

		{"label","1B"},
		{"ns","Aye, well come back and lend a hand just as soon as you’re able.  You see, that river-goin’ tanker over yonder ran ashore, and it’s leaking contaminants. We need to find out what effects these will have on our ecosystem – and we haven’t much time!","VS_T1PXFUNQU_02.ogg"},
		{"pg","I understand. I’ll try to come back soon!","END"},
	
	{"label","1C"},
	{"ns","Alright, then, matey – welcome aboard! There isn’t much time to waste, so let me explain: The River is used to irrigate farms around Elliot County. We have to test the water around the waterfront in order to analyze the impact that contaminants will have on the local food supply. It’ll take time, so you’ll need a few minutes to spare to do the job! Are you ready?","VS_T1PXFUNQU_03.ogg"},
	{"pg","Okay, Mack, I’m ready. How do we get started?","2A"},
	{"pg","On second thought, Mack, this seems pretty involved. Let me come back when I have more time.","1B"},	
	
	{"label","2A"},
	{"ns","Aye matey, here’s the plan: we need to establish the types and levels of contaminants in the river.  This is done by testing samples. The first thing we need to do is get our hands on some sample testing kits and bring them back here so we can get started!","VS_T1PXFUNQU_04.ogg"},
	{"pg","Okay, got it: I have to collect the test kits that we need and bring them back here.","2B"},

	{"label","2B"},
	{"ns","That’s right, matey. And it just so happens that there is an ecologist in town who has some kits with her.  You need to get ten kits from her and bring them back here!! I’ll even give you a reward once you bring them back.","VS_T1PXFUNQU_05.ogg"},
	{"pg","Okay, then, Mack, I’m ready. How do we get started? ","2C"},

	{"label","2C"},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq2"},
	{"ns","To get started, go find the ecologist I mentioned. Her name is Terry Winkle, and her offices are located at the New City Preservation Society. I told her you were coming – so go and see her now and she will give you the kits we will need!","VS_T1PXFUNQU_06.ogg"},
	{"pg","Okay, then, I’m off to the New City Preservation Society now. I’ll see you when I get back with kits!","END"},


--******************
--DIDN'T WANT TO HELP FIRST
--******************

	{"label","ASD1B"},
	{"ns","Aye, did you come back because you changed your mind about helping an old sea-dog? I could use an extra pair of hands on deck…","VS_T1PXFUNQU_26.ogg"},
	{"pg","Alright, then, Mack – let’s get started!","1C"},
	{"pg","I don’t know, Mack. I still don’t have the time.  I’ll come back when I can devote my attention to this.","END"},

--******************
--COMES BACK WITHOUT ITEMS
--******************

	{"label","2D"},
	{"ns","Ahoy, what are still doing here? You need to cut anchor and trim sail – we haven’t much time! Hurry to the New City Preservation Society and bring back ten sample collection kits! There is an engineer on his way that will need them to conduct the tests for contaminants!","VS_T1PXFUNQU_07.ogg"},
	{"pg","Of course, Mack. I am off to see Terry now, and I’ll see you back here shortly.","END"},


--******************
--COMES BACK WITH ITEMS
--******************

	{"label","4A"},
	{"fun3",setvar,"watersample",nil},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq2"},
	{"ns","Aye, matey, the first step of your quest is complete. We have the collection equipment to collect and measure samples. Now, we can get the testing apparatus, and we will have everything we need to conduct our sample testing!","VS_T1PXFUNQU_12.ogg"},
	{"pg","Apparatus? Experiment? What are you talking about?","4B"},

	{"label","4B"},
	{"ns","Aye, matey, I am afraid it isn’t over yet. We need a special device that we can use in our test – which will determine the types and levels of contaminants in the river. That will help us plan remediation efforts to remove them - or at the very least, minimize their impact.","VS_T1PXFUNQU_13.ogg"},
	{"pg","Okay, so I have to bring the device back here. Who has it?","4C"},

	{"label","4C"},
	{"fun2",incvars,"msq3"},
	{"ns","Ahoy, then, matey, you should cut anchor and get to Critical Point Consulting for the device needed to test the water samples for contamination levels. Leslie Chang is there and will give it to you – I told her you’d be coming. An engineer will meet us back here to conduct the test. He will be here any second – so you better get going!","VS_T1PXFUNQU_14.ogg"},
	{"pg","Okay, I got it. I will go see Leslie and get the device now.","END"},

--******************
--COMES BACK WITHOUT SECOND ITEMS
--******************

	{"label","4D"},
	{"ns","What are you doing dallying about? You have to see Leslie Chang at Critical Point Consulting and get the water sample testing device immediately. The engineer will be here any moment to collect samples and conduct the test – and he will be asking for it!","VS_T1PXFUNQU_15.ogg"},
	{"pg","Yes, of course. I’m off to Critical Point Consulting now to see Leslie Chang. I’ll be back soon.","END"},


--******************
--COMES BACK WITH SECOND ITEMS
--******************

	{"label","6A"},
	{"fun3",setvar,"volttest",nil},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq3"},
	{"ns","Ahoy, matey! You’re back! And, you have the device! Now we can do the testing – but there’s just one problem. The engineer we’ve been waiting for just called. His ferry is late and he will not get here in time to collect the samples we need – so I am afraid you’ll have to conduct the experiment instead!","VS_T1PXFUNQU_20.ogg"},
	{"pg","What do you mean? I am not sure I know how to do that.","6B"},

	{"label","6B"},
	{"ns","Aye, matey, no need to be so glum! It’s as easy as boilin’ a haggis on the foredeck! All you need to do is find any of the sample collection locations along the waterfront. To collect a sample and test it, all you need to do is click on the animated ’bulls-eyes‘ by these locations.","VS_T1PXFUNQU_21.ogg"},
	{"pg","Okay, so I have to find the ‘bulls-eyes’ by the sample collection areas and click on them. That seems simple enough.","6C"},

	{"label","6C"},
	{"fun3",setvar,"emptycollectkits_1",true},
	{"fun3",setvar,"emptycollectkits_2",true},
	{"fun3",setvar,"emptycollectkits_3",true},
	{"fun3",setvar,"emptycollectkits_4",true},
	{"fun3",setvar,"emptycollectkits_5",true},
	{"fun3",setvar,"emptycollectkits_6",true},
	{"fun3",setvar,"emptycollectkits_7",true},
	{"fun3",setvar,"emptycollectkits_8",true},
	{"fun3",setvar,"emptycollectkits_9",true},
	{"fun3",setvar,"emptycollectkits_10",true},
	{"fun2",incvars,"msq4"},
	{"ns","Aye, simple though it may seem, you will need to collect at least a half-dozen kits and bring them back here! I will give you some empty kits to start with. Bring back at least six of them and I’ll give you a fine bounty!","VS_T1PXFUNQU_22.ogg"},
	{"pg","Okay, I got it. I will go and collect some samples now.","END"},

--******************
--COMES BACK WITHOUT THIRD ITEMS
--******************

	{"label","6D"},
	{"ns","Matey, if you keep dragging your feet, I’m going to make you walk the plank into the oil-covered drink! You need to find some collection sites and gather some samples!","VS_T1PXFUNQU_23.ogg"},
	{"pg","Yes, of course. I’m off to find some ‘bulls-eyes’ right now so I can get some samples.","END"},

--******************
--COMES BACK WITH THIRD ITEMS
--******************

	{"label","7A"},
	{"ns","Ahoy, matey! You’re back – and you have the samples! That’s a fine plunder. Now we can send the results to the land lubbers at City Hall who will send them along to officials in government, ecological damage assessors, and others associated with assessing the ecological impact of the oil spill. ","VS_T1PXFUNQU_24.ogg"},
	{"pg","Great, Mack! I am glad to have helped.","7B"},
	{"pg","Actually, I just wanted to drop these off – I’d like to collect a few more samples, just to be sure…","ifobjects"},

	{"label","7B"},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq2"},
	{"fun2",incvars,"msq3"},
	{"ns","Now, here is your bounty, as promised! But now, it’s time to part – I have my work to carry on with, as do you. It’s been an honor having you on the crew! Of course, there are other people in town who need your help, so you can keep up the good work by going and finding them too! Good luck, matey!","VS_T1PXFUNQU_25.ogg"},
	{"pg","The pleasure has been mine, Mack. Thank you – I guess I’ll be seeing you around!","ifobjects"},


	{"label","addcash"},
	{"fun2",incplayercash,5},
	{"goto","ifobjects"},
	{"label","ifobjects"},
	{"if","scollectkits_1","==",true,"deleteobj1"},
	{"if","scollectkits_2","==",true,"deleteobj2"},
	{"if","scollectkits_3","==",true,"deleteobj3"},
	{"if","scollectkits_4","==",true,"deleteobj4"},
	{"if","scollectkits_5","==",true,"deleteobj5"},
	{"if","scollectkits_6","==",true,"deleteobj6"},
	{"if","scollectkits_7","==",true,"deleteobj7"},
	{"if","scollectkits_8","==",true,"deleteobj8"},
	{"if","scollectkits_9","==",true,"deleteobj9"},
	{"if","scollectkits_10","==",true,"deleteobj10"},
	--NO MORE FILLED TUBES
	{"fun3",setvar,"filledtubes",0},
	{"goto","END"},	

	{"label","deleteobj1"},
	{"fun3",setvar,"scollectkits_1",nil},
	{"goto","addcash"},
	
	{"label","deleteobj2"},
	{"fun3",setvar,"scollectkits_2",nil},
	{"goto","addcash"},

	{"label","deleteobj3"},
	{"fun3",setvar,"scollectkits_3",nil},
	{"goto","addcash"},

	{"label","deleteobj4"},
	{"fun3",setvar,"scollectkits_4",nil},
	{"goto","addcash"},

	{"label","deleteobj5"},
	{"fun3",setvar,"scollectkits_5",nil},
	{"goto","addcash"},

	{"label","deleteobj6"},
	{"fun3",setvar,"scollectkits_6",nil},
	{"goto","addcash"},

	{"label","deleteobj7"},
	{"fun3",setvar,"scollectkits_7",nil},
	{"goto","addcash"},

	{"label","deleteobj8"},
	{"fun3",setvar,"scollectkits_8",nil},
	{"goto","addcash"},

	{"label","deleteobj9"},
	{"fun3",setvar,"scollectkits_9",nil},
	{"goto","addcash"},

	{"label","deleteobj10"},
	{"fun3",setvar,"scollectkits_10",nil},
	{"goto","addcash"},

--******************
--DONE
--******************

	{"label","ATD1A"},
	{"ns","There you are! You did a great job – and I am truly grateful. I’ll not soon forget what you’ve done here.  The City owes you a debt of gratitude!","VS_T1PXFUNQU_29.ogg"},
	{"pg","My pleasure, Mack. I’ll, see you around!","END"},

--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
