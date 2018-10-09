local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","This oil spill is truly a tragedy for our City.  I’ve been stockpiling hardware and supplies since I found out about it.  Soon, I’ll be ready to do my own part for the recovery effort!","VS_T1P3UT_08.ogg"},
	{"pg","Well, good luck with that - we need all the help we can get!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Hello! Aren’t you with Professional Services?  I understand that you are working with the City on the oil spill and that you are in charge of containing it. I wanted to talk to you about rescuing the wildlife along the river as the spill gets contained. Are you interested?","VS_T1P3UT_01.ogg"},
	{"pg","You want to stage a wildlife rescue? How would that work?","1C"},
	{"pg","I am afraid that I am in the middle of something , can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the City has it all under control.","1B"},
	{"pgs","I am not the person you should talk to about rescuing wildlife.  Perhaps you should ask around City Hall.","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","I understand if you’re busy.  You must have a lot of work to do responding to the crisis! I’ll be here, though; you can always come back and we can talk about wildlife rescue. ","VS_T1P3UT_02.ogg"},
		{"pg","Alright, then. Bye!","END"},

	{"label","1C"},
		{"ns","You see, even though you may be cleaning up the oil from the New City River, the wildlife surrounding the river is in danger. A lot of animals need to be cleaned, and others need to find new homes. If you like, my friends and I are experienced at wildlife rescue – and we can give you a hand!","VS_T1P3UT_03.ogg"},
		{"pg","Interesting. I think the river could use a wildlife rescue, now that you mention it. How do we get started?","1D"},
		{"pg","I can see how rescuing the wildlife around the New City River could prove helpful – but I need to be convinced.","1E"},
		{"pgs","You know what? Nevermind. I don’t think spearheading a wildlife rescue effort is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","To get started, all you need to do is sign this contract that I’ve prepared – and my friends and I can get started working for the City rescuing wildlife around the New City River! Normally, when we stage rescues, we charge our clients $1000, but given the current crisis, we would charge the City only $500.  How does that strike you?","VS_T1P3UT_04.ogg"},
			{"pgs","You have yourself a deal, I’ll sign that contract. Thanks I look forward to working with you! ","FAIL","c"}, --ET-
			{"pg","I think I should check around with my teammates and think about this more before I sign anything.","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"fun3",setvar,"dustcontract",true},
				{"goto","END"},		


		{"label","1E"},
			{"ns","Even though your team may be cleaning up the river, you aren’t rescuing the animals that are in danger! I would reconsider wildlife rescue if I were you – for the sake of our ecosystem. I’ll even make you a deal!","VS_T1P3UT_05.ogg"},
			{"pg","Alright then – how do we get started?","1D"},
			{"pgs","I don’t think hiring someone to do wildlife rescue is part of my job. I should get going.","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Well, hello there!  How is your work on the clean-up coming along? I am sure you’ll do a great job helping the City recover from the spill especially now that we can get going with the wildlife rescue!","VS_T1P3UT_06.ogg"},
	{"pg","Well, I’m happy to see you are confident.  Thanks for your help!","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","Hello again!  How is your work on the clean-up coming along? I am sure you’ll do a great job helping the City recover – but I hope you came back because you’ve reconsidered staging a wildlife rescue. The river sure could use one!","VS_T1P3UT_07.ogg"},
	{"pg","Now that you mention it –tell me again about your plan to rescue the wildlife along the New City River.","1C"},
	{"pg","I haven’t changed my mind.  I was just trying to make my way through here. Sorry to trouble you!","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
