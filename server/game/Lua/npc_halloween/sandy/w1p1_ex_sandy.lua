local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","E1ASD1"},
		{"ns","Well, hello there, moviegoer.  Do I know you?","VS_T1P1E1_14.ogg"},
		{"pg","No, I don’t think we’ve met.  Please pardon the interruption.","END"},
		{"pg","Hey, you’re Sandy Carlson!  I’ve heard of you!","END"},

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
		{"ns","Hello, there, moviegoer!  Welcome to the New City Cinema!  My name is Sandy Carlson, but you can call me Sandy. How can I help you?","VS_T1P1E1_01.ogg"},
		{"pg","Hello, Sandy, pleasure to meet you.  I am here looking for media relations firms to help New City in its efforts to recover from the oil spill. I heard you can help...","E12A"},

			{"label","E12A"},
				{"ns","So you‘ve been hired by the Mayor  to get us all out of this mess, huh?  Well, there are a few people in town that can help out. Norse Communications, the most successful media relations firm in the County, is headquartered right here in town!!  So what  exactly are your goals for the services you are providing the City?","VS_T1P1E1_02.ogg"},
				{"pgs","Well, Sandy,we are looking for a vendor that will be able to project the best image for the city.","E12B","a"},
				{"pgs","We are looking for vendors that are best suited to performing each task effectively.","E12C","b"},

			{"label","E12B"},
			-- scorea:-SS
				{"ns","Well if that’s what you are looking for, I say you look into Bjorn Egan. His firm, Norse Communications, is a worldwide powerhouse and they have a long, impressive client list. ","VS_T1P1E1_03.ogg"},
				{"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City’s oil spill recovery effort?","E13A"},

			{"label","E12C"},
			-- scoreb:+SS
				{"ns","Oh yes, I see. You sure have a feel for what your client needs here, don’t you!  Well, I have some people in mind that may be a good fit for the job.  Research all of them thoroughly to determine the best choice in terms of the guidelines your client gave you.","VS_T1P1E1_04.ogg"},
				{"pg","Glad to hear it!  Who can you tell me about?","E13A"},
				 -- scorea:+MD

	{"label","E13A"},
		{"ns","There are four media relations firms that I think might work for the job.  Nina Ojeda’s outfit is known to do this sort of thing. Also, Marvin Moneymaker has some local notoriety. Gabe Vine is also around, and finally, there’s Bjorn Egan, whom I mentioned before.  I hear he is available.","VS_T1P1E1_05.ogg"},
		{"pg","Tell me about Nina Ojeda","E13B"},
		{"pg","Who is Gabe Vine?","E13C"},
		{"pg","Tell me about Bjorn Egan.","E13D"},
		{"pg","Who is Marvin Moneymaker?","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},

				{"label","E13BNO"},
				{"ns","Nina Ojeda? She is a slick businesswoman, indeed, and she’s worked her way through the industry to head up Narravi Associates, a firm here in town. You can always find her there. Of course, her firm has been really busy and probably isn’t interested in this assignment.","VS_T1P1E1_05.ogg"},
				{"pg","I see.  Well, let’s continue.","E13A"},					
		
			{"label","E13B"},
			{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Nina Ojeda? She is a slick businesswoman, indeed, and she’s worked her way through the industry to head up Narravi Associates, a firm here in town. You can always find her there. Of course, her firm has been really busy and probably isn’t interested in this assignment.","VS_T1P1E1_06.ogg"},
				{"pgs","I see.  Well, let’s continue.","E13A","c"},
				 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well, Vine sure is a born talker. He runs New Media Communications Inc. and can normally be found there.  It seems that everyone hears it all through Gabe Vine.  ","VS_T1P1E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13C"},
			{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","Well, Vine sure is a born talker. He runs New Media Communications Inc. and can normally be found there.  It seems that everyone hears it all through Gabe Vine.  ","VS_T1P1E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","Well, you would be well served if you went with Bjorn Egan.  His firm, Norse Communications, is headquartered right here in downtown New City.  Don’t be surprised to see him there at all hours of the day and night – it takes hard work a lot to be that successful!","VS_T1P1E1_08.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
			{"label","E13D"},
			{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","Well, you would be well served if you went with Bjorn Egan.  His firm, Norse Communications, is headquartered right here in downtown New City.  Don’t be surprised to see him there at all hours of the day and night – it takes hard work a lot to be that successful!","VS_T1P1E1_08.ogg"},
				{"pgs","I’ll take that into consideration.  Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well Marvin Moneymaker, sure is quite a character. He’s got a one-track mind, but he may be perfect for this. You can always find him at Media Relations, Inc., if you want to go and talk to him.","VS_T1P1E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
			{"label","E13E"},
			{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well Marvin Moneymaker, sure is quite a character. He’s got a one-track mind, but he may be perfect for this. You can always find him at Media Relations, Inc., if you want to go and talk to him.","VS_T1P1E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you, moviegoer.  Now you should go see what you can find out about these vendors, and then interview each one.  The Internet Café has a computer you can use.","VS_T1P1E1_10.ogg"},
		{"pgs","Research? Interview?  What do you mean?","E14B","g"},
		{"pgs","Thanks for your time! Excuse me, I am going to get right to it.","E15A","h"}, 
		-- scoreb:-LA

			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Let me be clearer. You should go visit your four vendor options. Nina Ojeda is almost always at Narravi Associates. You can find Gabe Vine at New Media Communications.  Bjorn Egan hangs out at Norse Communications and Marvin Moneymaker is almost always at Media Relations, Inc.  Remember, go to the the Internet Café to find a computer first!.","VS_T1P1E1_11.ogg"},
				{"pgs","What do you mean, find a computer?  For what?","E14C","i"},
				-- scorea:+LA
				{"pgs","Thanks, I guess I’ll be on my way then,","E15A","j"},
				-- costb:-LA

			{"label","E14C"},
				{"ns","To make choices that best follow the guidelines you are given, you must do thorough research.  Using the computers at the Internet Café and your team office is one way to research vendors here in New City.  You can also find useful information in newspapers and newscasts, or in the library. Finally, you can get information from people around town.","VS_T1P1E1_12.ogg"},
				{"pgs","Got it. Interview the vendors.  Conduct research at the Internet Café and the Library.  Look for news around town and finally see who the best choice is.  Is there anything else?","E15A","k"},
				 -- scorea:+LA
				 {"pgs","Excellent!  Thanks for your time; I will be on my way now.","E15A","l"},
				 -- scoreb:-LA

	{"label","E15A"},
		{"ns","Oh, one more thing.  Have you heard about the ‘side missions’ some people around town have for you? These optional tasks may not affect your team’s overall performance, but they will help you to do better personally. You are also rewarded when you complete them successfully.","VS_T1P1E1_13.ogg"},
		{"pg","Thanks for the info, Sandy!  I am going to get going now.  See you around.","END"},	
		{"pg","Thanks for the info.  Will you tell me where to find my vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
	{"ns","All right, then, moviegoer!  Remember, the next step for you is to do research in the Internet Café or at the library, and then go interview the vendors I just told you about.  Be sure and keep up with the news around town, as it helps, too!","VS_T1P1E1_16.ogg"},
	{"pg","Okay, I got it.  Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
	{"ns","Nina Ojeda is always at Narravi Associates. You can find Gabe Vine working at the New Media Communications office.  Bjorn Egan runs the State headquarters of Norse Communications here in New City, and Marvin Moneymaker is almost always at Media Relations, Inc.","VS_T1P1E1_15.ogg"},
	{"pg","Thanks for repeating that for me, Sandy.  See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
	{"ns","Hello again, moviegoer!  I heard you completed all of your interviews. Well done!  I hope you make the right choice.  The City is depending on you...","VS_T1P1E1_17.ogg"},
	{"pg","Me too Sandy!  See you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
	{"ns","Hello again, moviegoer!  I heard you settled on someone to help you save the New City River.  I sure hope you made the right choice – the future of our ecosystem may depend on it!","VS_T1P1E1_18.ogg"},
	{"pg","Okay, thanks!  See you around!","END"},

--*************************
--END
--*************************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
