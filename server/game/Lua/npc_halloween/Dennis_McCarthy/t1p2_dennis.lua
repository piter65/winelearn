local dialogtext = {
	{"if","expertprogress","==",0,"E1ASD1"},
	{"if","expertprogress","==",1,"E11A"},
	{"if","expertprogress","==",2,"E1ATD1"},
	{"if","expertprogress","==",3,"E1ATD2"},
	{"if","expertprogress","==",4,"E1ATD3"},
	{"if","expertprogress","==",5,"E1ATD4"},

	{"label","notyet"},
		{"ns","Hello. Please go talk to Will Standon at City Hall.","null.wav"},
		{"pg","Okay.","END"},

	{"label","E1ASD1"},
		{"ns","Well, hello there, friend.  Do I know you?","VS_T1P2E1_14.ogg"},
		{"pg","No, I don’t think we’ve met.  Please pardon the interruption.","END"},
		{"pg","Hey, you’re Dennis McCarthy!  I’ve heard of you!","END"},
		
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
		{"ns","Hello, there, friend!  Welcome to Techtronics!  My name is Dennis McCarthy, but you can call me Dennis. How can I help you?","VS_T1P2E1_01.ogg"},
		{"pg","Hello, Dennis, pleasure to meet you.  I am here looking for emergency response service s providers to help New City in its efforts to recover from the oil spill. I heard you can help….","E12A"},
	
			{"label","E12A"},
				{"ns","So you are one of the young go-getters  that the Mayor got to get us all out of this mess, huh?  Well, there are a few people in town that can help out. Medic Inc, a firm here in town, has a reputation for providing emergency services to cities around the County. So what  exactly are your goals for the services you are providing the City?","VS_T1P2E1_02.ogg"},
				{"pgs","Well, Dennis, we are looking for a vendor that will be able to project the best image for the city.","E12B","a"},
				{"pgs","We are looking for vendors that are best suited to performing each task effectively.","E12C","b"},
				 					
					{"label","E12B"},
						 -- scorea:-SS
						{"ns","Well if that’s what you are looking for, I say you look into Tom Barrier.  He is a decorated military hero and an expert in emergency response.","VS_T1P2E1_03.ogg"},
						{"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City’s oil spill recovery effort?","E13A"},
					
					{"label","E12C"},
						-- scoreb:+SS
						{"ns","Oh yes, I see. You sure have a feel for what your client needs here, don’t you!  Well, I have some people in mind that may be a good fit for your event.  Research all of them thoroughly to determine the best choice in terms of the guidelines given to you.","VS_T1P2E1_04.ogg"},
						{"pg","Okay, great!","E13A"},
						 -- scorea:+MD
	
	{"label","E13A"},
		{"ns","There are four emergency response services providers that I think might work for your task.  Gil Fermin’s outfit is known to do this sort of thing. Also, Zeke Mullen has some local notoriety. John Gray is also around, and finally, there’s Tom Barrier, whom I mentioned before, and he’s in town this month.","VS_T1P2E1_05.ogg"},
		{"pg","Tell me about Gil Fermin","E13B"},
		{"pg","Who is John Gray?","E13C"},
		{"pg","Tell me about Tom Barrier.","E13D"},
		{"pg","Who is Zeke Mullen?","E13E"},
		{"pg","Great, thanks! I think I have what I need now.","E14A"},
	
			{"label","E13B"},
				{"if","va","==",1,"E13BNO"},
				{"fun2",flagvendorinfo,1},
				{"ns","Gil Fermin, huh? He is a wily-looking fellow who’s done lots of different kinds of emergency services work, and heads up New City Emergency Medics Association here in town. You can find him there.  Of course, right now he may be too busy to take the job...","VS_T1P2E1_06.ogg"},
				{"pgs","I see.  Well, let’s continue.","E13A","c"},
				 -- scorea:+MR
				
				{"label","E13BNO"},
				{"ns","It works! Gil Fermin, huh? He is a wily-looking fellow who’s done lots of different kinds of emergency services work, and heads up New City Emergency Medics Association here in town. You can find him there.  Of course, right now he may be too busy to take the job...","VS_T1P2E1_06.ogg"},
				{"pg","I see.  Well, let’s continue.","E13A"},					
		
			{"label","E13C"},
				{"if","vb","==",1,"E13CNO"},
				{"fun2",flagvendorinfo,2},
				{"ns","John Gray is a nurse who has been in the field for a long time.  He runs First Responders and can normally be found there.","VS_T1P2E1_07.ogg"},
				{"pgs","Great, let’s move on.","E13A","d"},
				 -- scorea:+MR
				
				{"label","E13CNO"},
				{"ns","John Gray is a nurse who has been in the field for a long time.  He runs First Responders and can normally be found there.","VS_T1P2E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
			{"label","E13D"},
				{"if","vc","==",1,"E13DNO"},
				{"fun2",flagvendorinfo,3},
				{"ns","You would be wise to consider Tom Barrier for a job like this.  He is a highly decorated medic and has experience.  His firm, Medic, Inc.!, is located right here in town.  You should stop by, it’s an impressive place.","VS_T1P2E1_08.ogg"},
				{"pgs","I’ll take that into consideration.  Let’s continue.","E13A","e"},
				 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","You would be wise to consider Tom Barrier for a job like this.  He is a highly decorated medic and has experience.  His firm, Medic, Inc.!, is located right here in town.  You should stop by, it’s an impressive place.","VS_T1P2E1_08.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
			{"label","E13E"},
				{"if","vd","==",1,"E13ENO"},
				{"fun2",flagvendorinfo,4},
				{"ns","Well Zeke Mullen sure is a character. He’s a little unpredictable, but he could be perfect for this. You can always find him at Mullen Medical Inc., if you want to go and talk to him.","VS_T1P2E1_09.ogg"},
				{"pgs","That’s interesting. Let’s move on.","E13A","f"},
				 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well Zeke Mullen sure is a character. He’s a little unpredictable, but he could be perfect for this. You can always find him at Mullen Medical Inc., if you want to go and talk to him.","VS_T1P2E1_09.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
	{"label","E14A"},
		{"fun",vendorinfoscore},
		{"ns","I hope this has been helpful to you.  Now you should go see what you can find out about the vendors, and then interview each one.  The Internet Café has a computer you can use.","VS_T1P2E1_10.ogg"},
		{"pgs","Research? Interview?  What do you mean?","E14B","g"},
		{"pgs","Thanks for your time! Excuse me; I am going to get right to it.","E15A","h"},
		 -- scoreb:-LA
	
			{"label","E14B"},
				 -- scorea:+LA
				{"ns","Let me be more clear. You should go visit your four vendor options. Gil Fermin is almost always at New City Emergency Medics Association. You can find John Gray at First Responders.  Tom Barrier hangs out at Medic! Inc. and Zeke Mullen is almost always at Mullen Medical Supply.  Remember, go to the Internet café to find a computer first!","VS_T1P2E1_11.ogg"},
				{"pgs","What do you mean, find a computer?  For what?","E14C","i"},
				 -- scorea:+LA
				{"pgs","Thanks, I guess I’ll be on my way then. I’ll go there now.","E15A","j"},
				 -- costb:-LA
			
					{"label","E14C"},
						{"ns","To make choices that best follow the guidelines you are given, you must research each of them thoroughly.  Using the computers at the Internet Café and in your team office is one way to research vendors here in New City.  You can also find useful information in newspapers and newscasts, or in the library. Finally, you can get information from people around town.","VS_T1P2E1_12.ogg"},
						{"pgs","Got it. Interview the vendors.  Conduct research at the Internet Café and the Library.  Look for news around town and finally see who the best choice is.  Is there anything else?","E15A","k"},
						 -- scorea:+LA
						{"pgs","Excellent!  Thanks for your time; I will be on my way now.","E15A","l"},
						 -- scoreb:-LA
	
	{"label","E15A"},
		{"ns","Well, before you go, have you heard about the ‘side missions’ some people around town have for you? These optional quests may not affect your team’s overall performance, but they help you do better personally. You are also rewarded when you complete them successfully. If you want to do really well you’ll take time to try out a few!","VS_T1P2E1_13.ogg"},
		{"pg","Thanks for the info!  I am going to get going now.  See you around.","END"},
		{"pg","Thanks for the info.  Could you tell me where to find vendors again?","E1ATD2"},
	

--*************************
--ALREADY TALKED
--*************************
	
	{"label","E1ATD2"},
		{"ns","Gil Fermin is always at New City Emergency Medics Association. You can find John Gray working at the First Responders office.  Tom Barrier runs Medic, Inc.! here in New City, and Zeke Mullen is almost always at Mullen Medical Supply.","VS_T1P2E1_15.ogg"},
		{"pg","Thanks for repeating that for me, Dennis.  See you later!","END"},
	
--*************************
--NEED TO INTERVIEW
--*************************	
	
	{"label","E1ATD1"},
		{"ns","All right, then, friend!  Remember, the next step for you is to do research in the Internet Café or at the library, and also go interview the vendors I just told you about.  Be sure and keep up with the news around town, as that helps, too!","VS_T1P2E1_16.ogg"},
		{"pg","Okay, I got it.  Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************
	
	{"label","E1ATD3"},
		{"ns","Hello again, friend!  I heard you did all of your interviews. Well done!  I hope you make the right choice.  The City is depending on you…","VS_T1P2E1_17.ogg"},
		{"pg","Okay, thanks, Dennis!  See you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************
	
	{"label","E1ATD4"},
		{"ns","Hello again, friend!  I heard you settled on someone to help you save the New City River.  I sure hope you made the right choice – the future of our ecosystem may depend on it!.","VS_T1P2E1_18.ogg"},
		{"pg","Thanks, Dennis.  I’ll see you around.  Bye!","END"},

--*************************
--END
--*************************

	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
