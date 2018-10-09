local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","This oil spill really sure is a tragedy for our City.  I’ve been stockpiling hardware and supplies since I found out about it.  Soon, though, I’ll be ready to do my own part for the recovery effort!","VS_T1P4UT_08.ogg"},
	{"pg","I hope you find a way soon, too. We need all the help we can get!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Hey! Thank goodness I found you! You’re on the Professional Services team in town working on the oil spill, right? My name is Marcos Mendes. I want to talk to you about the relief effort. You see, I specialize in ecosystem restoration, and I’d like to help revive the ecosystem around the river and the surrounding area.","VS_T1P4UT_01.ogg"},
	{"pg","You want to stage an ecological restoration effort? How does that work?","1C"},
	{"pg","I am afraid that I am in the middle of something – can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the City has it all under control.","1B"},
	{"pgs","I am not the person you should talk to about ecological restoration.  Perhaps you should ask around City Hall.","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","I understand if you are busy – you have a crisis you must respond to, after all! I just got back from Rosenfield, though, where I was restoring a local playground after a toxic waste leak - so I’ll be in town for a while. You can always come back and we can talk about planning the restoration of the New City River ecosystem! ","VS_T1P4UT_02.ogg"},
		{"pg","Alright, then. Bye!","END"},

	{"label","1C"},
		{"ns","You see, whenever there is some sort of environmental disaster, people are frequently called in not only to clean up, but also to restore the affected ecosystem. Normally, that kind of activity can be costly, so it needs planning. I can do that  and make a deal for the City, considering the circumstances.","VS_T1P4UT_03.ogg"},
		{"pg","I think the City could really use ecological restoration, now that you mention it. How do we get started?","1D"},
		{"pg","I can see how restoring the ecosystem around the New City River could prove helpful – but I think I still need to be convinced.","1E"},
		{"pgs","You know what? Never mind. I don’t think spearheading a ecological restoration effort is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","I’m glad to hear you want to come on board! To get started, all you have to do is sign this contract I drew up. Normally I charge $1000 for restoration planning services – but seeing as the City is in a crisis, I’ll lower it to say, $500. What do you think?","VS_T1P4UT_04.ogg"},
			{"pgs","Sure, hand over the contract and I’ll sign it. And, thanks – I look forward to working with you! ","FAIL","c"}, --ET-
			{"pg","I think I should check around with my teammates and think about this more before I sign anything …","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"fun3",setvar,"marcoscontract",true},
				{"goto","END"},		


		{"label","1E"},
			{"ns","You know, if I were you, I would think twice about this.  This disaster has weakened the River’s ecosystem, and it needs to be restored to its condition before the spill. I’ll even make you a deal, considering the circumstances!","VS_T1P4UT_05.ogg"},
			{"pg","Alright then – how do we get going?","1D"},
			{"pgs","I don’t think hiring someone to do an ecological restoration is part of my job. I should get going…","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Hello again! How’s everything coming along? I think you did the right thing by having me plan the restoration campaign for the river. I am sure it will make a real impact on the relief and recovery effort!","VS_T1P4UT_06.ogg"},
	{"pg","Well, I’m happy to see you are confident.  Thanks for your help!","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","Hello again! So how are you making out on your task? Did you come back to talk about a restoration campaign? That’s good, because I think it would be a real shame to neglect the ecosystem around the river!","VS_T1P4UT_07.ogg"},
	{"pg","Now that you mention it –tell me again about your plan to restore the environs along the New City River.","1C"},
	{"pg","I haven’t changed my mind – I was just trying to make my way through here. Sorry to trouble you…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
