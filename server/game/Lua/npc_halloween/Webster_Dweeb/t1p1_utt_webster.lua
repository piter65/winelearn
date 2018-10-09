local dialogtext = {

{"if","mickey","==",0,"ASD1"},
{"if","mickey","==",1,"1A"},
{"if","mickey","==",2,"ATD2"},
{"if","mickey","==",3,"ATD1"},
{"if","mickey","==",4,"ASD1"},

{"label","ASD1"},
	{"ns","This oil spill really sure is a tragedy for our City.  I've been on the Internet non-stop since I found out about it trying to find a way to help out. I hope I come up with something soon!","VS_T1P1UT_08.ogg"},
	{"pg","I hope you find a way soon, too. We need all the help we can get!","END"},

{"label","1A"},
	{"fun3",setvar,"scoreconvo","nlc_utt"},
	{"fun",incmickey},
	{"ns","Hello there! I hear you are doing media relations for the City.  I've been looking for you all over town!  You see, I host a well known Webcast from downtown New City, and I want to help the relief effort by staging a grass-roots awareness campaign over the Internet!","VS_T1P1UT_01.ogg"},
	{"pg","A grass-roots campaign over the Internet? How does that work, Webster?","1C"},
	{"pg","I am afraid that I am in the middle of something - can we talk later?","1B"},
	{"pg","Thanks for the offer, but I am sure the City has their fundraising all under control.","1B"},
	{"pgs","I am not the person you should talk to about Internet grass-roots campaigning.  Perhaps you should ask around City Hall.","nullify","a"}, --ET+


	{"label","1B"},
		{"ns","I understand if you are busy with the early phases of the crisis response. You must have a lot of Internet research to conduct! If you change your mind, though, I'll be here - and I hope you do, because I am anxious to help out!","VS_T1P1UT_02.ogg"},
		{"pg","Alright, then. Bye!","END"},

	{"label","1C"},
		{"ns","You see, any media relations effort needs an online presence.  I have a successful Website and a large audience for my webcasts and I think an online campaign will help get people to donate and motivate them to volunteer.","VS_T1P1UT_03.ogg"},
		{"pg","I think we could really use more awareness, now that you mention it. How do we get started?","1D"},
		{"pg","Well, I can see how awareness could help- but I think I still need to be convinced.","1E"},
		{"pgs","You know what? Never mind. I don't think staging a grass-roots campaign is part of my job. I should be going.","nullify","b"},  --ET+


		{"label","1D"},
			{"ns","To get started, all you need to do is give the word, and we can draw up a contract.  As an Internet celebrity with a high-traffic site, I usually charge my advertisers $1000 to do campaigns for them - but for you, I can knock it down to $500. What do you say?","VS_T1P1UT_04.ogg"},
			{"pgs","Sure, I'll sign that. And, thanks - I look forward to working with you! ","FAIL","c"}, --ET-
			{"pg","You know, I should check around with my teammates and think about this more before I sign anything ...","1B"},
		
				{"label","FAIL"},
				{"fun",incmickey},
				{"fun",incsq},
				{"fun3",setvar,"webstercontract",true},
				{"goto","END"},		


		{"label","1E"},
			{"ns","Well, to be honest, I think your media relations effort needs an online presence in order to succeed.  As an Internet superstar, just think of all the people I will reach - and how many donations and volunteers we could get! ","VS_T1P1UT_05.ogg"},
			{"pg","Alright then - now that you put it that way, how do we get started? ","1D"},
			{"pgs","I don't think raising awareness is part of my job. I should get going...","nullify","d"}, --ET+

	{"label","nullify"},
	{"fun",incmickey},
	{"fun",incmickey},
	{"goto","END"},

--****************
--FAILED
--****************

{"label","ATD1"},	
	{"ns","Hello again! How is your work coming along? I am sure that you are doing a good job handling the City's media relations - especially considering the impact our online awareness campaign will have on the relief effort!","VS_T1P1UT_06.ogg"},
	{"pg","Well, I'm happy to see you are confident.  Thanks for your help!","END"},

--****************
--HASN'T FAILED YET
--****************

{"label","ATD2"},
	{"ns","It's you again! I hear your work is coming along. That's good, because the City sure needs media relations help right now! So, are you just passing through, or did you reconsider staging that grass-roots online awareness campaign?","VS_T1P1UT_07.ogg"},
	{"pg","Now that you mention it - why don't you tell me about that grass-roots campaign again?","1C"},
	{"pg","I haven't changed my mind - I was just trying to make my way through here. Sorry to trouble you...","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storenlcscore,scoreconvo,scorestr},

}
return dialogtext
