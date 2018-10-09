local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","This oil spill sure is a tragedy for our City.  I’ve been ordering sandwich ingredients non-stop since I found out about it. I’ll have a plan to do my part for the disaster recovery effort, soon!","VS_T1P2UT_08.ogg"},
	{"pg","I wish you luck with that -- We need all the help we can get!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Hey, I’ve been looking all over for you! Give me a second here…I’m out of breath…anyway, they tell me you’re doing support services for the relief effort.  I wanted to ask you if you need me to make sandwiches for your people!","VS_T1P2UT_01.ogg"},
	{"pg","You want to make sandwiches for the relief effort? I’m not sure I understand.","1C"},
	{"pg","I am in the middle of something right now, Can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the City has it all under control.","1B"},
	{"pgs","I am not the person you should talk to about making sandwiches.  Perhaps you should ask around City Hall.e","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","Look, I understand you’re busy.  If I had a crisis to respond to, I wouldn’t be thinking about salami sandwiches, either.  But look, everyone’s gotta eat – so if you change your mind, come find me.  I’ll be here!","VS_T1P2UT_02.ogg"},
		{"pg","Alright, then. Bye!","END"},

	{"label","1C"},
		{"ns","Well, this is how it works: You got a bunch of relief workers coming into town soon, and they all gotta eat!  Just say the word, and I can make sure that my award-winning sandwiches make their way to the disaster site. ","VS_T1P2UT_03.ogg"},
		{"pg","I think we could really use food at the disaster site, now that you mention it. How do we get started?","1D"},
		{"pg","I can see how feeding volunteers and emergency responders could help– but I still need to be convinced.","1E"},
		{"pgs","You know what? Never mind. I don’t think buying sandwiches for the relief effort is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","To get sandwiches to the disaster site – and make sure your relief workers get fed – all you have to do is sign this contract I prepared for you. Look, I even gave you a discount.  Usually I charge $1000, but it’ll only cost you $500.","VS_T1P2UT_04.ogg"},
			{"pgs","Okay then, I’ll sign. Thanks I look forward to working with you! ","FAIL","c"}, --ET-
			{"pg","Thanks, but I should really check around with my teammates and think about it before I sign anything.","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"fun3",setvar,"mustardcontract",true},
				{"goto","END"},		


		{"label","1E"},
			{"ns","I don’t know how much more I can offer you but I can promise my sandwiches are top-notch.  If I were you, I would think twice before sending workers to a disaster site on an empty stomach! I’ll even cut you a break on the price.","VS_T1P2UT_05.ogg"},
			{"pg","Alright then – how do we get started? ","1D"},
			{"pgs","I don’t think getting sandwiches out to volunteers and responders is part of my job. I should get going.","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Now that you got your sandwiches, you should be all set for food at the disaster site.  You’re much better off – now our relief workers and volunteers don’t have to go to work hungry!","VS_T1P2UT_06.ogg"},
	{"pg","Great! Thanks for your help.","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","Well what a coincidence! I was just running around all over the place looking for you, and all of a sudden, here you are! Did you change your mind about buying sandwiches for the relief effort?","VS_T1P2UT_07.ogg"},
	{"pg","Now that you mention it – why don’t you tell me about your plan to feed volunteer and emergency responders again?","1C"},
	{"pg","I haven’t changed my mind, I was just trying to make my way through here. Sorry to trouble you.","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
