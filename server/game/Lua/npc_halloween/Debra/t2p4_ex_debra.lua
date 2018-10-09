local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","E1ASD1"},
		{"ns","Oh, yes. Are you a venture capitalist here for the business presentation?","VS_T2P4E1_14.ogg"},
		{"pg","No, sorry. Please pardon the interruption.","END"},
		{"pg","Hey, you’re Debra. I’ve heard of you!","END"},

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
		{"ns","Hello, come on in! My name is Debra Geffen. You must be one of the investors we have been desperately waiting for! Welcome to Click-Adz, our humble Internet start-up! ","VS_T2P4E1_01.ogg"},
		{"pg","Hello, Debra, pleasure to meet you. But I am actually here looking for a firm to represent the City in its legal dealings related to crisis relief and disaster recovery. I heard you can help….","E12A"},

			{"label","E12A"},
				{"ns","Why of course! You are from Professional Services and are working for the City – I heard you’d be coming by. A few firms in town can help you out, like Dewey, Sewham and Howe. You probably know them from television! What kind of firm are you looking for?","VS_T2P4E1_02.ogg"},
				{"pgs","Well, we are looking for a vendor that will be able to make the biggest impact on the City’s relief and recovery efforts.","E12B","a"},
				{"pgs","We are looking for vendors that best represent the City’s interests in the relief and recovery effort.","E12C","b"},

			{"label","E12B"},
			-- scorea:-SS
				{"ns","Well if that’s what you are looking for, I’d say you should look into Dewey, Sewham, and Howe. They certainly look like consummate professionals on their television ads! ","VS_T2P4E1_03.ogg"},
				{"pg","Thanks for the suggestion. Can you tell me who else is available to pitch in with the City’s disaster recovery effort?","E13A"},

			{"label","E12C"},
			-- scoreb:+SS
				{"ns","Well that certainly makes sense. You sure seem to have a grasp on your client’s needs! I have some people in mind that may be a good fit for your assigned task.","VS_T2P4E1_04.ogg"},
				{"pg","Glad to hear it! Who can you tell me about?","E13A"},
				 -- scorea:+MD

	{"label","E13A"},
		{"ns","There are four vendors that I think might work for your assigned task. Avanish Singh at Eastern Legal does this sort of thing, as does Liddy Gates at Gates and Partners. Dewey, Sewham, and Howe, the attorneys I mentioned earlier, are successful, and finally, there’s Abbie S Korpis Associates.","VS_T2P4E1_05.ogg"},
		{"pg","Tell me about Eastern Legal.","E13B"},
		{"pg","Who are Dewey, Sewham and Howe?","E13C"},
		{"pg","What about Abbie Korpis?","E13D"},
		{"pg","Tell me about Gates and Partners.","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},

			{"label","E13B"},
			{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Avanish Singh, huh? His firm, Eastern Legal, is well known to residents of New City. He is normally found in the Eastern Legal offices. Of course, he uses a lot of technical terms, and so it is almost impossible to understand him when he talks.","VS_T2P4E1_06.ogg"},
				{"pgs","Okay, let’s continue.","E13A","c"},
				 -- scorea:+MR

				{"label","E13BNO"},
				{"ns","Avanish Singh, huh? His firm, Eastern Legal, is well known to residents of New City. He is normally found in the Eastern Legal offices. Of course, he uses a lot of technical terms, and so it is almost impossible to understand him when he talks.","VS_T2P4E1_05.ogg"},
				{"pg","Okay, let’s continue.","E13A"},					
		
			{"label","E13C"},
			{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","Well Dewey Sewham and Howe would be my choice. They are a wildly successful law firm who broadcasts advertisements on daytime television across the State. Brothers Anthony and Gordon Dewey are the senior partners who run the New City office.","VS_T2P4E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well Dewey Sewham and Howe would be my choice. They are a wildly successful law firm who broadcasts advertisements on daytime television across the State. Brothers Anthony and Gordon Dewey are the senior partners who run the New City office.","VS_T2P4E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13D"},
			{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","Well, Abbie S Korpis Associates is certainly worth considering.  Abbie is a prominent figure in the New City community and is a very capable attorney. She is normally found at her office.","VS_T2P4E1_08.ogg"},
				{"pgs","I’ll take that into consideration. Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","Well, Abbie S Korpis Associates is certainly worth considering.  Abbie is a prominent figure in the New City community and is a very capable attorney. She is normally found at her office.","VS_T2P4E1_08.ogg"},
				{"pg","I’ll take that into consideration. Let’s continue.","E13A"},
	
			{"label","E13E"},
			{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well Liddy Gates is a well-known court attorney who has won many high profile cases! She certainly is quite a character. She can normally be found practicing her courtroom tirades at the Gates and Partners offices. ","VS_T2P4E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well Liddy Gates is a well-known court attorney who has won many high profile cases! She certainly is quite a character. She can normally be found practicing her courtroom tirades at the Gates and Partners offices. ","VS_T2P4E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you. If you’ll excuse me, though, the work of an Internet executive is never done! I have to get some presentation materials together for some potential investors. Now you should go see what you can find out about your vendors!","VS_T2P4E1_10.ogg"},
		{"pgs","What do you mean, ‘find out about’ them?","E14B","g"},
		{"pgs","Thanks for your time! If you’ll excuse me, I am going to get right to it.","E15A","h"},
		 -- scoreb:-LA

			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Yes, when I say find out, what I mean is that you should go visit your four vendor options. Avanish Singh is at Eastern Legal. You can find Anthony and Gordon Dewey at Dewey, Sewham, and Howe. Abbie Korpis works at Abbie S Korpis Associates, and Liddy Gates is always at Gates and Partners. Look into them wherever you can, too.","VS_T2P4E1_11.ogg"},
				{"pgs","‘Wherever I can’? What did you have in mind for that?","E14C","i"},
				-- scorea:+LA
				{"pgs","Excellent, Debra, thanks for the recap. I’ll be on my way, now. See you around!","E15A","j"},
				-- costb:-LA

			{"label","E14C"},
				{"ns","Of course, sorry, I rushed through that! What I meant to say is that you should be sure to use the computers at the Internet Café, buy the newspapers on sale around town, and visit the library once or twice to find all the useful information you can about your vendors.","VS_T2P4E1_12.ogg"},
				{"pgs","Got it. Interview the vendors. Conduct research by looking for the news around town. I think we can wrap it up, now.","E15A","k"},
				 -- scorea:+LA
				 {"pgs","Excellent! Thanks for everything. I will see you around town! ","E15A","l"},
				 -- scoreb:-LA

	{"label","E15A"},
		{"ns","Of course – but before you go, I want to remind you of the ‘side missions’ some people in town have for you. These are optional quests that do not affect your team’s score, but they help you do better personally – and you are always rewarded when you complete them successfully. Try and find them!","VS_T2P4E1_13.ogg"},
		{"pg","Thanks for the info! I am going to get going now. See you around.","END"},	
		{"pg","Thanks for the info. Could you tell me where to find vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
	{"ns","All right then! It’s time for you to attend to the firms I just told you about that provide legal and compliance services. And time for me to print and staple a few investment prospectuses for my three o’clock tomorrow.","VS_T2P4E1_16.ogg"},
	{"pg","Okay, I got it. Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
	{"ns","Okay, here are where your vendors are located again: Avanish Singh is at Eastern Legal. You can find Anthony and Gordon Dewey at Dewey, Sewham, and Howe. Abbie Korpis works at Abbie S Korpis Associates, and Liddy Gates is always at Gates and Partners.","VS_T2P4E1_15.ogg"},
	{"pg","Thanks for repeating that for me. See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
	{"ns","Hello again! I heard you did all of your interviews. Well done! I hope you make the right choice. The City is depending on you! And now if you’ll excuse me, there is venture capital to raise…","VS_T2P4E1_17.ogg"},
	{"pg","Thanks, Debra. I’ll see you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
	{"ns","Hey, I heard you settled on someone to help you save the New City River. I sure hope you made the right choice – the future may depend on it! Of course, there is funding that depends on these business plans I must mail out, so if you’ll excuse me – I’ll see you around!","VS_T2P4E1_18.ogg"},
	{"pg","Thanks, Debra. I’ll see you around. Bye!","END"},

--*************************
--END
--*************************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
