local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","This whole disaster is no laughing matter. I’m trying to find a way to get people to quit clowning around, and do something about it.","VS_T3PXUT_08.ogg"},
	{"pg","I hope you find a way to pitch in! We need all the help we can get…see you around!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Heya, kid! Say, aren’t you working for the City in conjunction with the oil spill? I’m Blitzo the Clown. Maybe you’ve heard of me! They told me I should look for you, because I want to stage a fundraiser to help raise money for the City’s relief and recovery efforts!","VS_T3PXUT_01.ogg"},
	{"pg","You want to stage a fundraiser? How would that work, Blitzo?","1C"},
	{"pg"," I am in the middle of something right now – can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the City has it all under control.","1B"},
	{"pgs","I am not the person you should talk to about fundraisers.  Perhaps you should ask around City Hall.","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","I understand if you are busy, especially given the circumstances.  Well, if you have a second to talk seriously, I’ll be here. You can always come back and we’ll talk about that fundraiser.","VS_T3PXUT_02.ogg"},
		{"pg","Alright, then. Bye!","END"},

	{"label","1C"},
		{"ns","Well, I am one of the most well-known and well-liked celebrities here in town, and I seriously think I can help out the City by staging a fundraiser right here in town. My balloon animals could help raise a lot of money!","VS_T3PXUT_03.ogg"},
		{"pg","I think we could really use a fundraiser. How do we get started?","1D"},
		{"pg","If you’re so popular around New City, how come I’ve never heard of you?","1E"},
		{"pgs","You know what? Never mind. I don’t think holding a fundraiser is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","To get going, we need a contract – and then I can go ahead and get started raising money for the City!  Normally I charge $2500 for birthday parties, but for this, I can knock it down to $2000. I even have a contract prepared if you’d like to sign, but you’ll have to use your pen – mine tends to squirt.","VS_T3PXUT_04.ogg"},
			{"pgs","Okay, I’ll sign that. Thanks – I look forward to working with you! ","FAIL","c"}, --ET-
			{"pg","I should check around with my teammates and think about this more before I sign anything …","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"goto","END"},		


		{"label","1E"},
			{"ns","You’ve never heard of me? Well clearly, you haven’t been to a supermarket opening recently! Look, if you’re ready to stop clowning around, I think we should go ahead and get going with the fundraiser. I could use the work, and the City could use the money!","VS_T3PXUT_05.ogg"},
			{"pg","Alright then – it’s a deal! ","1D"},
			{"pgs","That’s a nice offer, Blitzo, but I don’t think holding a fundraiser is part of my job. I should get going…","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Heya kid! It’s nice to see you again. I hope your investigation is coming along! At least you can rest easy knowing there is a fundraiser in the works that will give the relief effort enough cash to fill a circus tent!","VS_T3PXUT_06.ogg"},
	{"pg","Well, I’m happy to see you are confident.  Thanks for your help!","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","Oh, hey, kid.  Say, how’s your investigation coming along? I understand the relief effort may be in financial trouble. Is that why you’re here? Did you reconsider that fundraiser I wanted to put on? ","VS_T3PXUT_07.ogg"},
	{"pg","Now that you mention it – why don’t you tell me about that fundraiser again?","1C"},
	{"pg","I haven’t changed my mind – I was just trying to make my way through here. Sorry to trouble you…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
