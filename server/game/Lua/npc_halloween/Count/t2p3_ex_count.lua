local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","E1ASD1"},
		{"ns","Bon jour, mon ami!  You are here to pick up the job for the Azalian Shiek, correct? The gilded septic tank has been completed and is ready for transportation to the desert, my kind sir.","VS_T2P3E1_14.ogg"},
		{"pg","No there’s some sort of mistake. Please pardon the interruption.","END"},
		{"pg","Hey, you’re Willie Ketchum! I’ve heard of you!","END"},

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
		{"ns","Mon dieu! I did not see I had a customer! My name is Count de Monet. You probably recognize my voice from our phone conversation. You are here to pick up that gilded septic tank for the Azalian Shiek, no?","VS_T2P3E1_01.ogg"},
		{"pg","No, Your Excellency. I am here because I heard you can help me find a firm to recover and dispose of contaminants from the area affected by the oil spill in the New City River.","E12A"},

			{"label","E12A"},
				{"ns","Why, yes! You are one of the Professional Services employees working for the City! I heard you’d be coming. There are a few people around who can help you out, like Freida West – who is both successful and honorable. What kind of firm are you looking for?","VS_T2P3E1_02.ogg"},
				{"pgs","Well, we are looking for a firm that will be able to make the biggest impact on the City’s relief and recovery efforts.","E12B","a"},
				{"pgs","We are looking for vendors that will best represent the City’s interests in the relief and recovery effort.","E12C","b"},

			{"label","E12B"},
			-- scorea:-SS
				{"ns","Well if that’s what you are looking for, I say you look into Wanda Rown of Potty Princess. She is truly regal, and well-versed in the finer points of court etiquette. She would be of great service.","VS_T2P3E1_03.ogg"},
				{"pg","Thanks for the suggestion. Can you tell me who else is available to pitch in with the City’s disaster recovery effort?","E13A"},

			{"label","E12C"},
			-- scoreb:+SS
				{"ns","Oui, that certainly makes sense. You sure seem to have a grasp on your client’s needs! I have some people in mind that may be a good fit for your assigned task.","VS_T2P3E1_04.ogg"},
				{"pg","Glad to hear it! Who can you tell me about?","E13A"},
				 -- scorea:+MD

	{"label","E13A"},
		{"ns","There are four vendors that I think may work for your assigned task. Ashley Dapper at Clean Green Machinery does this sort of thing, as does Adam Baum at Dis-Po Corp. Wanda Rown at Potty Princess, who I mentioned before, and then there’s Freida West and West Disposal Services.","VS_T2P3E1_05.ogg"},
		{"pg","Tell me about Clean Green Machinery.","E13B"},
		{"pg","What about Potty Princess?","E13C"},
		{"pg","What is West Disposal Services?","E13D"},
		{"pg","Tell me about Dis-Po Corporation.","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},

			{"label","E13B"},
			{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Clean Green Machinery, huh?  That firm is run by Ashley Dapper, who figures prominently in the business world here in New City. Of course, our families have a long running feud. I find him to be nothing more than an Emerald Isle snake oil salesman.","VS_T2P3E1_06.ogg"},
				{"pgs","I see. Let’s continue.","E13A","c"},
				 -- scorea:+MR

				{"label","E13BNO"},
				{"ns","Clean Green Machinery, huh?  That firm is run by Ashley Dapper, who figures prominently in the business world here in New City. Of course, our families have a long running feud. I find him to be nothing more than an Emerald Isle snake oil salesman.","VS_T2P3E1_05.ogg"},
				{"pg","I see. Let’s continue.","E13A"},					
		
			{"label","E13C"},
			{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","Well Wanda Rown is an excellent choice! She has a business fitting for a woman of her courtly demeanor, and she is loved and adored by all. She has a commercial building, Potty Princess, in downtown New City that is fit for a Countess!","VS_T2P3E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well Wanda Rown is an excellent choice! She has a business fitting for a woman of her courtly demeanor, and she is loved and adored by all. She has a commercial building, Potty Princess, in downtown New City that is fit for a Countess!","VS_T2P3E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13D"},
			{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","Well, West Disposal Services is certainly worth considering. It is run by Freida West, who is known to have a large capacity for storing waste products.","VS_T2P3E1_08.ogg"},
				{"pgs","I’ll take that into consideration. Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","Well, West Disposal Services is certainly worth considering. It is run by Freida West, who is known to have a large capacity for storing waste products.","VS_T2P3E1_08.ogg"},
				{"pg","I’ll take that into consideration. Let’s continue.","E13A"},
	
			{"label","E13E"},
			{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well it’s funny you ask about him. Adam Baum may be an accident just waiting to happen, but he is also a well known waste recovery and disposal provider because of his… unique skills. ","VS_T2P3E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well it’s funny you ask about him. Adam Baum may be an accident just waiting to happen, but he is also a well known waste recovery and disposal provider because of his… unique skills. ","VS_T2P3E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you! I am quite happy to be of service. If you will please excuse me, I must attend a workshop where they are doing a fine repoussier to a set of custom ordered toilet seat covers. You should go see what you can find out about your vendors!","VS_T2P3E1_10.ogg"},
		{"pgs","What do you mean, ‘find out about’ them?","E14B","g"},
		{"pgs","Thanks for your time! If you’ll excuse me, I am going to get right to it.","E15A","h"},
		 -- scoreb:-LA

			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Yes, when I say “find out”, I mean that you should visit your four vendor options and look wherever else you can for information. Ashley Dapper works at Clean Green Machinery. You can find Wanda Rown at Potty Princess. Freida West works at West Disposal Services and Adam Baum works at Dis-Po Corp,.","VS_T2P3E1_11.ogg"},
				{"pgs","‘Wherever else I can’? What did you have in mind by that? ","E14C","i"},
				-- scorea:+LA
				{"pgs","Excellent, Count, thanks for the recap. I’ll be on my way, now. See you around!","E15A","j"},
				-- costb:-LA

			{"label","E14C"},
				{"ns","Of course, sorry, I rushed through that! What I meant to say is that you should be sure to use the computers at the Internet Café, buy the newspapers on sale around town and visit the library once or twice to find all the useful information you can about your vendors.","VS_T2P3E1_12.ogg"},
				{"pgs","Got it. Interview the vendors. Conduct research by looking for the news around town. I think we can wrap it up, now.","E15A","k"},
				 -- scorea:+LA
				 {"pgs","Excellent! Thanks for everything. I will see you round town! ","E15A","l"},
				 -- scoreb:-LA

	{"label","E15A"},
		{"ns","I must attend to my repoussier, but before you go I want to remind you of the ‘side missions’ some people in town have for you. These are quests that do not affect your team score, but they help you do better personally – and you are rewarded when you complete them. Try and find them!","VS_T2P3E1_13.ogg"},
		{"pg","Thanks for the info! I am going to get going now. See you around.","END"},	
		{"pg","Thanks for the info. Could you tell me where to find vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
	{"ns","Well then, mon ami! It’s time for you to attend to your business with the waste recovery and disposal providers I just told you about. And I have my repoussier to attend to! Au revior!","VS_T2P3E1_16.ogg"},
	{"pg","Okay, I got it. Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
	{"ns","Okay, here are where your vendors are located again: Ashley Dapper works at Clean Green Machinery. You can find Wanda Rown at Potty Princess. Freida West works at West Disposal Services, and Adam Baum works at Dis-Po Corp.","VS_T2P3E1_15.ogg"},
	{"pg","Thanks for repeating that for me. See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
	{"ns","Hello again, mon ami! I heard you did all of your interviews. Well done! I hope you make the right choice. The City is depending on you! Of course, my repoussier is now complete, and I am about to have my late afternoon fondue…","VS_T2P3E1_17.ogg"},
	{"pg","Thanks again, Your Excellency. Enjoy your meal, I’ll see you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
	{"ns","Ah, mon ami, I heard you settled on someone to help you save the New City River. I sure hope you made the right choice. The future of our City may depend on it! Now, if you’ll excuse me, I believe my fondue is ready, and is now getting cold…","VS_T2P3E1_18.ogg"},
	{"pg","Of course, Your Excellency. I’ll see you around!","END"},

--*************************
--END
--*************************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
