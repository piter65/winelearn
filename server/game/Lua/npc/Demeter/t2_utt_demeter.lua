local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","Boy, this oil spill really is quite a tragedy for our City.  My uncle Dennis runs a store here in town and he says he’s trying to figure out a way for us to pitch in. I hope he comes up with something soon!","VS_T2PXUT_08.ogg"},
	{"pg","I hope you find a way soon, too. We need all the help we can get!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Hey there! Say, you’re one of the team members from Professional Services working on the oil spill, right?  If you have a moment, I’d like to make you an offer. You see, my Uncle has some brand new communications equipment that may help them.  Are you interested?","VS_T2PXUT_01.ogg"},
	{"pg","Communications equipment? How does that work, Demeter?","1C"},
	{"pg","I am in the middle of something can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the vendor we hired has it all under control.","1B"},
	{"pgs","I am not the person you should talk to about communications equipment.  Perhaps you should ask around City Hall.","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","I understand that you probably have a lot on your mind oil spills take a lot of work to recover from! Just so you know, I’ll be here – so if you feel like communications equipment would help the vendor you hired do their job, you can always come back.","VS_T2PXUT_02.ogg"},
		{"pg","Alright, then, Demeter I may see you again soon. Bye!","END"},

	{"label","1C"},
		{"ns","You see, my Uncle owns a store in town called “Techtronics”. We just got a new shipment of long-range walkie-talkies that would help your vendors keep constant communications with each other, and the City.","VS_T2PXUT_03.ogg"},
		{"pg","I think we could really use communications equipment, now that you mention it. How do we get started?","1D"},
		{"pg","Well, I can see how communications equipment could help but I think I still need to be convinced.","1E"},
		{"pgs","You know what? Never mind. I don’t think securing communications equipment is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","You are wise to invest in the best radio equipment for your vendor! If want us to equip them with those long range walkies, all you have to do is sign this purchase order. Normally they cost $1500 – but I can give you a deal and charge the City $1000 if you are prepared to buy them now.","VS_T2PXUT_04.ogg"},
			{"pgs","Okay, sounds good to me! And, thanks I look forward to seeing what these can do for us! ","FAIL","c"}, --ET-
			{"pg","You know I should check around with my teammates and think about this more before I sign anything.","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"fun3",setvar,"demetercontract",true},
				{"goto","END"},		


		{"label","1E"},
			{"ns","One of the most important elements of effective crisis response is having the best technology available. With the AR-300 long-range walkies, you can be sure everyone is in constant, crystal-clear contact! I’ll even give you a deal on them!","VS_T2PXUT_05.ogg"},
			{"pg","Alright then how do we get started? ","1D"},
			{"pgs","I don’t think securing communications equipment is part of my job. I should get going.","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Hello again! I hope your vendor is coming along nicely now that you secured cutting-edge radio communications for them. Thanks for your business and so you know, you’re much better off! ","VS_T2PXUT_06.ogg"},
	{"pg","Well, I’m happy to see you are confident.  Thanks for your help!","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","Hello again! How is the vendor you hired, coming along? I hope they’re doing okay, because they probably need an upgrade to their communications technology! Have you reconsidered the walkie-talkies I offered earlier? ","VS_T2PXUT_07.ogg"},
	{"pg","Now that you mention it why don’t you tell me about that communications equipment again?","1C"},
	{"pg","I haven’t changed my mind – I was just trying to make my way through here. Sorry to trouble you.","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
