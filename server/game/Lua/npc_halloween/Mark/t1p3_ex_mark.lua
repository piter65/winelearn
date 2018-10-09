local dialogtext = {
{"if","expertprogress","==",0,"E1ASD1"},
{"if","expertprogress","==",1,"E11A"},
{"if","expertprogress","==",2,"E1ATD1"},
{"if","expertprogress","==",3,"E1ATD2"},
{"if","expertprogress","==",4,"E1ATD3"},
{"if","expertprogress","==",5,"E1ATD4"},

{"label","T1P3e1"},

--*************************
--HAVEN'T TALKED TO STANDON
--*************************

{"label","E1ASD1"},
 {"ns","Well, hello there, buddy.  Do I know you?","VS_T1P3E1_14.ogg"},
 {"pg","No, I don’t think we’ve met.  Please pardon the interruption.","END"},
 {"pg","Hey, you’re Mark Carpenter!  I’ve heard of you!","END"},

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
	 {"ns","Hello, there, buddy!  Welcome to Power Planning Services!  My name is Mark Carpenter, but you can call me Mark. How can I help you?","VS_T1P3E1_01.ogg"},
	 {"pg","Hello, Mark, pleasure to meet you.  I am here looking for spill containment services firms to help New City in its efforts to recover from the oil spill. I heard you can help….","E12A"},

		{"label","E12A"},
		 {"ns","So you are one of the young go-getters helping the Mayor get us all out of this mess, huh?  Well, there are a few people in town that can help out. Burells Brothers, one firm in town, is known as a military subcontractor and responds to emergencies all around the world. So what  exactly are your goals for the services you are providing the City?","VS_T1P3E1_02.ogg"},
		 {"pgs","We are looking for a vendor that will be able to project the best image for the city.","E12B","a"},
		 {"pgs","We are looking for vendors that are best suited to performing each task effectively.","E12C","b"},

		{"label","E12B"},
		-- scorea:-SS
		 {"ns","Well if that’s what you are looking for, I say you look into Phil and Bill Burells.  They are well respected military subcontractors who have gotten a lot of attention recently for an overseas deployment.","VS_T1P3E1_03.ogg"},
		 {"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City’s oil spill recovery effort?","E13A"},

		{"label","E12C"},
		 -- scoreb:+SS
		 {"ns","Oh yes, I see. You sure have a feel for what your client needs here, don’t you!  Well, I have some people in mind that may be a good fit for your event.  Research all of them thoroughly to determine the best choice in terms of the guidelines given you.","VS_T1P3E1_04.ogg"},
		 {"pg","Glad to hear it!  Who can you tell me about?","E13A"},
		 -- scorea:+MD

	{"label","E13A"},
	 {"ns","There are four spill containment services firms that I think might work for your task  Peter Boltright’s outfit is known to do this sort of thing. Also, Anthony Wexler has some local notoriety. Oroko Nakashima is also around, and finally, the Burells Brothers I mentioned earlier just got back into town.","VS_T1P3E1_05.ogg"},
	 {"pg","Tell me about Peter Boltright","E13B"},
	 {"pg","Who is Oroko Nakashima?","E13C"},
	 {"pg","Tell me about Phil and Bill Burells.","E13D"},
	 {"pg","Who is Anthony Wexler?","E13E"},
	 {"pg","Great, thanks! I think I have what I need now.","E14A"},

				{"label","E13BNO"},
				{"ns","Peter Boltright, huh? He is a wily fellow who’s known for tinkering and innovation, and heads up Premiere Containment. You can find him there.   Of course, he may be considered more of an inventor than a containment specialist…","VS_T1P3E1_06.ogg"},
				{"pg","I see.  Well, let’s continue.","E13A"},					
		
		{"label","E13B"},
		{"if","va","==",1,"E13BNO"},
		{"fun2",flagvendorinfo,1},
		 {"ns","Peter Boltright, huh? He is a wily fellow who’s known for tinkering and innovation, and heads up Premiere Containment. You can find him there.   Of course, hev may be considered more of an inventor than a containment specialist…","VS_T1P3E1_06.ogg"},
		 {"pgs","I see.  Well, let’s continue.","E13A","c"},
		 -- scorea:+MR

				{"label","E13CNO"},
				{"ns","Well, Oroko Nakashima is a nurse who has been in the field for a long time.  She runs Running Rivers Corporation and can normally be found there.","VS_T1P3E1_07.ogg"},
				{"pg","Great, let’s move on.","E13A"},	
		
		{"label","E13C"},
		{"if","vb","==",1,"E13CNO"},
		{"fun2",flagvendorinfo,2},
		 {"ns","Well, Oroko Nakashima is a nurse who has been in the field for a long time.  She runs Running Rivers Corporation and can normally be found there.","VS_T1P3E1_07.ogg"},
		 {"pgs","Great, let’s move on.","E13A","d"},
		 -- scorea:+MR

				{"label","E13DNO"},
				{"ns","You would be wise to consider Phil and Bill Burells for a job like this.  They were formally in the military and have plenty of experience.  Their shop, Burells Brothers, is located right here in town.  You should stop by, it’s an impressive place.","VS_T1P3E1_08.ogg"},
				{"pg","I’ll take that into consideration.  Let’s continue.","E13A"},
	
		{"label","E13D"},
		{"if","vc","==",1,"E13DNO"},
		{"fun2",flagvendorinfo,3},
		 {"ns","You would be wise to consider Phil and Bill Burells for a job like this.  They were formally in the military and have plenty of experience.  Their shop, Burells Brothers, is located right here in town.  You should stop by, it’s an impressive place.","VS_T1P3E1_08.ogg"},
		 {"pgs","I’ll take that into consideration.  Let’s continue.","E13A","e"},
		 -- scorea:+MR

				{"label","E13ENO"},
				{"ns","Well Anthony Wexler sure is a character. I know he spends a lot of time running his dart tournament league, but he could be perfect for this. You can always find him at Interstate Containment, if you want to go and talk to him.","VS_T1P3E1_09.ogg"},
				{"pg","That’s interesting. Let’s move on.","E13A"},
	
		{"label","E13E"},
		{"if","vd","==",1,"E13ENO"},
		{"fun2",flagvendorinfo,4},
		 {"ns","Well Anthony Wexler sure is a character. I know he spends a lot of time running his dart tournament league, but he could be perfect for this. You can always find him at Interstate Containment, if you want to go and talk to him.","VS_T1P3E1_09.ogg"},
		 {"pgs","That’s interesting. Let’s move on.","E13A","f"},
		 -- scorea:+MR

	{"label","E14A"},
	{"fun",vendorinfoscore},
	 {"ns","I hope this has been helpful to you, buddy.  Now you should go see what you can find out about the vendors, and then interview each one.  The Internet Café has a computer you can use.","VS_T1P3E1_10.ogg"},
	 {"pgs","Research? Interview?  What do you mean?","E14B","g"},
	 {"pgs","Thanks for your time! Excuse me, I am going to get right to it.","E15A","h"},
	 -- scoreb:-LA

		{"label","E14B"},
		-- scorea:+LA
		 {"ns","Let me be more clear. You should go visit your four vendor options. Peter Boltright is almost always at Premiere Containment. You can find Oroko Nakashima at Running Rivers Corporation.  Phil and Bill Burells hangs out at Burells Brothers and Anthony Wexler is almost always at Interstate Containment  Remember, go to the the Internet café to find a computer first!","VS_T1P3E1_11.ogg"},
		 {"pgs","What do you mean, find a computer?  For what?","E14C","i"},
		 -- scorea:+LA
		 {"pgs","Thanks, I guess I’ll be on my way then,","E15A","j"},
		 -- costb:-LA

			{"label","E14C"},
			 {"ns","In order to make choices that best follow the guidelines you are given, you must do thorough research.  Using the computers at the Internet Café and your team office is one way to research vendors here in New City.  You can also find useful information in newspapers and newscasts, or in the library. Finally, you can get information from people around town.","VS_T1P3E1_12.ogg"},
			 {"pgs","Got it. Interview the vendors.  Conduct research at the Internet Café and the Library.  Look for news around town and finally see who the best choice is.  Is there anything else?","E15A","k"},
			-- scorea:+LA
			{"pgs","Excellent!  Thanks for your time; I will be on my way now.","E15A","l"},
			-- scoreb:-LA

	{"label","E15A"},
	 {"ns","Well, yes, as a matter of fact.  Have you heard about the ‘side missions’ some people around town have for you? These optional quests may not affect your team’s overall performance, but they help you do better personally. You are also rewarded when you complete them successfully. If you want to do really well you’ll take time to try out a few!","VS_T1P3E1_13.ogg"},
	 {"pg","Thanks for the info!  I am going to get going now.  See you around.","END"},
	 {"pg","Thanks for the info.  Could you tell me where to find vendors again?","E1ATD2"},


--*************************
--ALREADY TALKED
--*************************

{"label","E1ATD1"},
 {"ns","All right, then, buddy!  Remember, the next step for you is to do research in the Internet Café  or at the library, and also go interview the vendors I just told you about.  Be sure and keep up with the news around town, as that helps, too!","VS_T1P3E1_16.ogg"},
 {"pg","Okay, I got it.  Thanks!","END"},

--*************************
--DONE WITH INTERVIEWS
--*************************

{"label","E1ATD2"},
 {"ns","Here are the vendors you want to talk to again: Peter Boltright is always around at Premiere Containment. You can find Oroko Nakashima working at the Running Rivers Corporation office.  Phil and Bill Burells runs the State headquarters of Burells Brothers here in New City, and Anthony Wexler is at Interstate Containment all the time.","VS_T1P3E1_15.ogg"},
 {"pg","Thanks for repeating that for me, Mark.  See you later!","END"},

--*************************
--NEED TO INTERVIEW
--*************************

{"label","E1ATD3"},
 {"ns","Hello again, buddy!  I’ve heard that you’ve done all of your interviews. Well done!  I hope you make the right choice, now.  The City is depending on you…","VS_T1P3E1_17.ogg"},
 {"pg","Okay, thanks, Mark!  See you around!","END"},

--*************************
--CHOSE A VENDOR
--*************************

{"label","E1ATD4"},
 {"ns","Hello again, buddy!  I’ve heard that you settled on someone to help you save the New City River.  I sure hope you made the right choice – the future of our ecosystem may depend on it!.","VS_T1P3E1_18.ogg"},
 {"pg","Okay, thanks, Mark!  See you around!","END"},
 
--*************************
--END
--*************************

	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
