local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","E1ASD1"},
		{"ns","Well, gosh, I sure am anxious.  I feel like today there are going to be some trouble makers I am going to have to run after….oh, gosh, I feel nauseous….","VS_T2P2E1_14.ogg"},
		{"pg","No, I don’t think we’ve met.  Please pardon the interruption. This response doesn’t make sense.","END"},
		{"pg","Hey, you’re Willie Ketchum!  I’ve heard of you!","END"},

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
		{"ns","Well, hello there!  Willie Ketchum is the name. You aren’t here to cause any kind of trouble are you?  Trouble-makers make me anxious…","VS_T2P2E1_01.ogg"},
		{"pg","No, Willie.  I am here because I heard you can help me find a logistics and support services firm to help transport and store relief and clean-up supplies for the oil relief recovery effort.","E12A"},

			{"label","E12A"},
				{"ns","So you are one of the Professional Services employees working for the City?  I heard you’d be coming by. There are a few people in town that can help you out – like Force One Logistics, who has the experience and precision you may need. What kind of firm are you looking for?","VS_T2P2E1_02.ogg"},
				{"pgs","Well, we are looking for a firm that will be able to make the biggest impact on the City’s relief and recovery efforts.","E12B","a"},
				{"pgs","We are looking for vendors that best represent the City’s interests in the relief and recovery effort.","E12C","b"},

			{"label","E12B"},
			-- scorea:-SS
				{"ns","Well if that’s what you are looking for, I say you look into Force One. Their credentials may be exactly the kind of firm you need for your efforts. ","VS_T2P2E1_03.ogg"},
				{"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City’s disaster recovery effort?","E13A"},

			{"label","E12C"},
			-- scoreb:+SS
				{"ns","Well that certainly makes sense. You sure seem to have a grasp on your client’s needs! I have some people in mind that may be a good fit for your assigned task.  ","VS_T2P2E1_04.ogg"},
				{"pg","Glad to hear it!  Who can you tell me about?","E13A"},
				 -- scorea:+MD

	{"label","E13A"},
		{"ns","There are four vendors that I think may work for your assigned task. Phoenix Services does this sort of thing, as does Dave Shortback at Western Logistics. Force One, the firm I mentioned earlier, is successful - and finally, there’s Sam Shortback at Prairie Fire - he is Dave’s twin brother. ","VS_T2P2E1_05.ogg"},
		{"pg","Tell me about Phoenix Services.","E13B"},
		{"pg","What is Force One?","E13C"},
		{"pg","What about Praire Fire Services?","E13D"},
		{"pg","Tell me about Western Logistics.","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},

			{"label","E13B"},
			{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Phoenix Services, huh?  That firm is run by Margaret Wong, who is very driven in her profession. Of course, she may be too emotionally unstable to take on the job right now.","VS_T2P2E1_06.ogg"},
				{"pgs","I see.  Let’s continue.","E13A","c"},
				 -- scorea:+MR

				{"label","E13BNO"},
				{"ns","Phoenix Services, huh?  That firm is run by Margaret Wong, who is very driven in her profession. Of course, she may be too emotionally unstable to take on the job right now.","VS_T2P2E1_05.ogg"},
				{"pg","I see.  Let’s continue.","E13A"},					
		
			{"label","E13C"},
			{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","Well Cedric Maxwell is my favorite. He is a wildly successful logistics provider with a strong record  of providing paramilitary support. And, he sure knows how to handle trouble-makers! ","VS_T2P2E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well Cedric Maxwell is my favorite. He is a wildly successful logistics provider with a strong record  of providing paramilitary support. And, he sure knows how to handle trouble-makers! ","VS_T2P2E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13D"},
			{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","Well, Prairie Fire Services is certainly worth considering.  It is run by former New City Sheriff Sam Shortback.  He knows a thing or two about trouble-makers – and logistics!  Prairie Fire has offices in downtown New City too.","VS_T2P2E1_08.ogg"},
				{"pgs","I’ll take that into consideration.  Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","Well, Prairie Fire Services is certainly worth considering.  It is run by former New City Sheriff Sam Shortback.  He knows a thing or two about trouble-makers – and logistics!  Prairie Fire has offices in downtown New City too.","VS_T2P2E1_08.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
			{"label","E13E"},
			{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well it’s funny you ask about him.  Dave Shortback is former Sheriff Sam’s twin brother!  They had a falling out, though, and now runs his own business, Western Logistics, not far from his brother in downtown New City.","VS_T2P2E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well it’s funny you ask about him.  Dave Shortback is former Sheriff Sam’s twin brother!  They had a falling out, though, and now runs his own business, Western Logistics, not far from his brother in downtown New City.","VS_T2P2E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you!  Gosh, I’ve been so distracted, I hope I didn’t miss any trouble-makers scurrying about! Now you should go see what you can find out about your vendors!","VS_T2P2E1_10.ogg"},
		{"pgs","What do you mean, ‘find out about’ them?","E14B","g"},
		{"pgs","Thanks for your time! If you’ll excuse me, I am going to get right to it.","E15A","h"},
		 -- scoreb:-LA

			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Yes, when I say find out, what I mean is that you should go visit your four vendor options. Margaret Wong works at Phoenix Services Group.  You can find Cedric Maxwell at the Force One offices.  Sam Shortback works around the clock at Praire Fire Services, and his twin brother Dave runs Western Logistics right nearby.   Find out whatever you can wherever you can.","VS_T2P2E1_11.ogg"},
				{"pgs","‘Wherever I can’? What did you have in mind by that? ","E14C","i"},
				-- scorea:+LA
				{"pgs","Excellent, Willie, thanks for the recap.  I’ll be on my way, now.  See you around!","E15A","j"},
				-- costb:-LA

			{"label","E14C"},
				{"ns","Of course, sorry, I rushed through that!  What I meant to say is that you should be sure to use the computers at the Internet Café , buy the newspapers on sale around town, and visit the library once or twice to find all the useful information you can about your vendors.","VS_T2P2E1_12.ogg"},
				{"pgs","Got it. Interview the vendors.  Conduct research by looking for the news around town. I think we can wrap it up, now.","E15A","k"},
				 -- scorea:+LA
				 {"pgs","Excellent!  Thanks for everything.  I will see you round town! ","E15A","l"},
				 -- scoreb:-LA

	{"label","E15A"},
		{"ns","I have to keep a lookout, now, too - but before you go I want to remind you of the ‘side missions’ some people in town have for you. These are quests that do not affect your team score, but they help you do better personally – and you are rewarded when you complete them.  Try and find them!","VS_T2P2E1_13.ogg"},
		{"pg","Thanks for the info!  I am going to get going now.  See you around.","END"},	
		{"pg","Thanks for the info.  Could you tell me where to find vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
	{"ns","Okay then!  It’s time to go do your thing with the logistics providers I just told you about.   And I have to keep a close eye out for trouble-makers.","VS_T2P2E1_16.ogg"},
	{"pg","Okay, I got it.  Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
	{"ns","Okay, here are where your vendors are located again:  Margaret Wong works at Phoenix Services Group.  You can find Cedric Maxwell at the Force One offices.  Sam Shortback works around the clock at Praire Fire Services, and his twin brother Dave runs Western Logistics right nearby. ","VS_T2P2E1_15.ogg"},
	{"pg","Thanks for repeating that for me.  See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
	{"ns","Hello again!  I heard you did all of your interviews. Well done!  I hope you make the right choice.  The City is depending on you!  And City Hall is depending on me to keep out the trouble-makers!  So if you’ll excuse me…","VS_T2P2E1_17.ogg"},
	{"pg","Thanks, Willie.  I’ll see you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
	{"ns","Hello again!  I heard you settled on someone to help you save the New City River.  I sure hope you made the right choice – the future of our City may depend on it!  Now, if you’ll excuse me, I think I see a rabble-rouser!","VS_T2P2E1_18.ogg"},
	{"pg","Of course, Willie.  I’ll see you around!","END"},

--*************************
--END
--*************************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
