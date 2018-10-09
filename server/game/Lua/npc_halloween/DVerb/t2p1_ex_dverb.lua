local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","E1ASD1"},
		{"ns","Well, hello there, playa.  Do I know you?","VS_T2P1E1_14.ogg"},
		{"pg","No, I don’t think we’ve met.  Please pardon the interruption.","END"},
		{"pg","Hey, you’re D-Verb!  I’ve heard of you!","END"},

--*************************
--FIRST MEETING
--*************************

	{"label","E11A"},
		{"fun",incexpert},
		{"fun",talkedtoexpert},
		{"fun",incevelyn},
		{"fun",incvendor1},
		{"fun",incvendor2},
		{"fun",incvendor3},
		{"fun",incvendor4},
		{"fun2",incvars,"journalprogress"},
		{"fun3",setvar,"scoreconvo","e1"},
		{"ns","Whassup, playa?  Come on in!  Welcome to the Hip Hop House!  My name is D-Verb. Are you here for recording studio time?","VS_T2P1E1_01.ogg"},
		{"pg","Hello, D-Verb, pleasure to meet you.  I am actually here looking for spokespeople to represent New City to the media as it recovers from the recent oil spill. I heard you can help….","E12A"},

			{"label","E12A"},
				{"ns","So you are one of the Professional Services team members working for the City?  I heard you’d be coming by. There are a few people in town that can help you out – like Lakeisha - the famous radio DJ. What kind of spokesperson are you looking for?","VS_T2P1E1_02.ogg"},
				{"pgs","Well, we are looking for a vendor that will be able to make the biggest impact on the City’s relief and recovery efforts.","E12B","a"},
				{"pgs","We are looking for vendors that best represent the City’s interests in the relief and recovery effort.","E12C","b"},

			{"label","E12B"},
			-- scorea:-SS
				{"ns","Well if that’s what you are looking for, I say you look into Lakeisha.  She sure commands a large audience and would definitely get the lead-out about your efforts. ","VS_T2P1E1_03.ogg"},
				{"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City’s disaster recovery effort?","E13A"},

			{"label","E12C"},
			-- scoreb:+SS
				{"ns","Well that certainly makes sense. You sure seem to have a grasp on your client’s needs! I have some people in mind that may be a good fit for your assigned task.  ","VS_T2P1E1_04.ogg"},
				{"pg","Glad to hear it!  Who can you tell me about?","E13A"},
				 -- scorea:+MD

	{"label","E13A"},
		{"ns","There are four vendors that I think might work for your assigned task. Wes Berlin does this sort of thing, as does Fiona Rudd – who is pretty famous. Lakeisha, the radio disc jockey I mentioned earlier is pretty successful, and finally, there’s Grandmaster G. ","VS_T2P1E1_05.ogg"},
		{"pg","Tell me about Wes Berlin.","E13B"},
		{"pg","Who is Lakeisha?","E13C"},
		{"pg","What about Grandmaster G?","E13D"},
		{"pg","Tell me about Fiona Rudd.","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},

			{"label","E13B"},
			{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Wes Berlin, huh? His band, Shrapnel, is pretty popular here in New City. He is normally found in the basement of his Mom’s house. Of course, as a punk music-type, I am not sure he would reflect the image that the City is looking for.","VS_T2P1E1_06.ogg"},
				{"pgs","Okay, let’s continue.","E13A","c"},
				 -- scorea:+MR

				{"label","E13BNO"},
				{"ns","Wes Berlin, huh? His band, Shrapnel, is pretty popular here in New City. He is normally found in the basement of his Mom’s house. Of course, as a punk music-type, I am not sure he would reflect the image that the City is looking for.","VS_T2P1E1_05.ogg"},
				{"pg","Okay, let’s continue.","E13A"},					
		
			{"label","E13C"},
			{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","Well Lakeisha is my favorite. She is a wildly popular drive-time shock-jock and store owner who broadcasts around the County from right here in New City. She is normally found at her music shop, Can’t Get Enough Media.","VS_T2P1E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well Lakeisha is my favorite. She is a wildly popular drive-time shock-jock and store owner who broadcasts around the County from right here in New City. She is normally found at her music shop, Can’t Get Enough Media.","VS_T2P1E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13D"},
			{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","Well, Grandmaster G is certainly worth considering.  He is a New City hip-hop luminary and is certainly capable of being a spokesperson.  He is normally found at his recording studio.","VS_T2P1E1_08.ogg"},
				{"pgs","I’ll take that into consideration.  Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","Well, Grandmaster G is certainly worth considering.  He is a New City hip-hop luminary and is certainly capable of being a spokesperson.  He is normally found at his recording studio.","VS_T2P1E1_08.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
			{"label","E13E"},
			{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well I am surprised you’ve never heard of Fiona Rudd!  She is a well-known country singer who moved from Dixie right here to New City.  She is quite a character.  She is normally found preening herself at Remember the Mane Hair Salon.","VS_T2P1E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well I am surprised you’ve never heard of Fiona Rudd!  She is a well-known country singer who moved from Dixie right here to New City.  She is quite a character.  She is normally found preening herself at Remember the Mane Hair Salon.","VS_T2P1E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you. Now you should go see what you can find out about your vendors!","VS_T2P1E1_10.ogg"},
		{"pgs","What do you mean, ‘find out about’ them?","E14B","g"},
		{"pgs","Thanks for your time! If you’ll excuse me, I am going to get right to it.","E15A","h"},
		 -- scoreb:-LA

			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Yes, when I say” find out”, what I mean is that you should go visit your four vendor options. Wes Berlin hangs out in the basement of his Mom’s house.  You can find Lakeisha at Can’t Get Enough Media.  Grandmaster G hangs out at his downtown recording studio and Fiona Rudd is always at the hair salon.  And of course, look into them wherever else you can, too.","VS_T2P1E1_11.ogg"},
				{"pgs","‘Wherever else I can’? What do you mean by that?","E14C","i"},
				-- scorea:+LA
				{"pgs","Excellent, D-Verb, thanks for the recap.  I’ll be on my way, now.  See you around!","E15A","j"},
				-- costb:-LA

			{"label","E14C"},
				{"ns","Of course, sorry, I rushed through that!  What I meant to say is that you should be sure to use the computers at the Internet Café , buy the newspapers on sale around town, and visit the library once or twice to find all the useful information you can about your vendors.","VS_T2P1E1_12.ogg"},
				{"pgs","Got it. Interview the vendors.  Conduct research by looking for the news around town. I think we can wrap it up, now.","E15A","k"},
				 -- scorea:+LA
				 {"pgs","Excellent!  Thanks for everything.  I will see you round town! ","E15A","l"},
				 -- scoreb:-LA

	{"label","E15A"},
		{"ns","Of course – but before you go, I want to remind you of the ‘side missions’ some people in town have for you. These are optional quests that do not affect your team’s score, but they help you do better personally – and you are always rewarded when you complete them successfully.  Try and find them! ","VS_T2P1E1_13.ogg"},
		{"pg","Thanks for the info!  I am going to get going now.  See you around.","END"},	
		{"pg","Thanks for the info.  Could you tell me where to find vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
	{"ns","All right then, playa!  It’s time to go do your thing with the potential spokespeople I just told you about. ","VS_T2P1E1_16.ogg"},
	{"pg","Okay, I got it.  Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
	{"ns","Okay, here are where your vendors are located again:  Wes Berlin is almost always in the basement of his Mom’s house.  You can find Lakeisha at Can’t Get Enough Media.  Grandmaster G hangs out at his downtown recording studio, and Fiona Rudd is always at the hair salon. ","VS_T2P1E1_15.ogg"},
	{"pg","Thanks for repeating that for me.  See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
	{"ns","Hello again, playa!  I heard you did all of your interviews. Well done!  I hope you make the right choice.  The City is depending on you!","VS_T2P1E1_17.ogg"},
	{"pg","Thanks, D-Verb.  I’ll see you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
	{"ns","Hello again, playa!  I heard you settled on someone to help you save the New City River.  I sure hope you made the right choice – the future of our City may depend on it!","VS_T2P1E1_18.ogg"},
	{"pg","Thanks, D-Verb.  I’ll see you around.  Bye!","END"},

--*************************
--END
--*************************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
