local dialogtext = {
{"if","expertprogress","==",0,"E1ASD1"},
{"if","expertprogress","==",1,"E11A"},
{"if","expertprogress","==",2,"E1ATD1"},
{"if","expertprogress","==",3,"E1ATD2"},
{"if","expertprogress","==",4,"E1ATD3"},
{"if","expertprogress","==",5,"E1ATD4"},
 
{"label","E1ASD1"},
 {"ns","Well, hello there, honey.  Do I know you?","VS_T1P4E1_14.ogg"},
 {"pg","No, I don't think we've met.  Please pardon the interruption.","END"},
 {"pg","Hey, you're Heather Winehart!  I've heard of you!","END"},
 
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
	 {"ns","Well hello there, honey!  Welcome to my loft!  Isn't it  relaaaaxing? My name is Heather Winehart  of course. I'm famous,  so you know that already.  But please, call me Heather. How can I help you?","VS_T1P4E1_01.ogg"},
	 {"pg","Hello, Heather, pleasure to meet you.  I am here looking for disaster assessment consultants to help New City in its efforts to recover from the oil spill. I heard you can help...","E12A"},
 
		{"label","E12A"},
		 {"ns","So you are one of the young go-getters helping the Mayor get us all out of this mess, huh?  Well, there are a few people in town that can help out. Personally, I think Ramblin' Rose is totally far out, and she is right here in town!. So what exactly are your goals for the services you are providing the City?","VS_T1P4E1_02.ogg"},
		 {"pgs","Well, Heather,we are looking for a vendor that will be able to project the best image for the city.","E12B","a"},
		 {"pgs","We are looking for vendors that are best suited to performing each task effectively.","E12C","b"},
 
		{"label","E12B"},
		-- scorea:-SS
		 {"ns","Well if that's what you are looking for, I say you look into Ramblin' Rose.  She is known for her advocacy work and pops up in the news all the time whenever there is an environmental disaster.","VS_T1P4E1_03.ogg"},
		 {"pg","Thanks for the suggestion.  Can you tell me who else is available to pitch in with the City's oil spill recovery effort?","E13A"},
 
		{"label","E12C"},
		 -- scoreb:+SS
		 {"ns","Oh yes, I see. You sure have a feel for what your client needs here, don't you!  Well, I have some people in mind that may be a good fit for your event.  Research all of them thoroughly to determine the best choice in terms of the guidelines Will Standon gave you.","VS_T1P4E1_04.ogg"},
		 {"pg","Glad to hear it!  Who can you tell me about?","E13A"},
		 -- scorea:+MD
 
	{"label","E13A"},
	 {"ns","There are four disaster assessment consultants that I think might work for your task  Nathaniel Wailer's outfit is known to do this sort of thing. Also, Skeeter McBragg has some local notoriety. Yanis Economou is also around, and finally, Ramblin' Rose is back in town and walking around...","VS_T1P4E1_05.ogg"},
	 {"pg","Tell me about Nathaniel Wailer","E13B"},
	 {"pg","Who is Yanis Economou?","E13C"},
	 {"pg","Tell me about Ramblin' Rose.","E13D"},
	 {"pg","Who is Skeeter McBragg?","E13E"},
	 {"pg","Great, thanks! I think I have what I need now.","E14A"},
 
		{"label","E13B"},
		{"if","va","==",1,"E13BNO"},
		{"fun2",flagvendorinfo,1},
		 {"ns","Nathaniel Wailer? He is a totally tall, totally great looking Montogan who's always working on some big project over at Eco-Tech. You can find him there - of course, but he may be way too busy to take on this job.","VS_T1P4E1_06.ogg"},
		 {"pgs","I see.  Well, let's continue.","E13A","c"},
		 -- scorea:+MR
 
				{"label","E13BNO"},
				{"ns","Nathaniel Wailer? He is a totally tall, totally great looking Montogan who's always working on some big project over at Eco-Tech. You can find him there - of course, but he may be way too busy to take on this job.","VS_T1P4E1_06.ogg"},
				{"pg","I see.  Well, let's continue.","E13A"},					
		
		{"label","E13C"},
		{"if","vb","==",1,"E13CNO"},
		{"fun2",flagvendorinfo,2},
		 {"ns","Well, Yanis Economou is a nurse who has been in the field for a long time.  He runs Ypoforo Ecosystems and can always be found there. ","VS_T1P4E1_07.ogg"},
		 {"pgs","Great, let's continue.","E13A","d"},
		 -- scorea:+MR
 
				{"label","E13CNO"},
				{"ns","Well, Yanis Economou is a nurse who has been in the field for a long time.  He runs Ypoforo Ecosystems and can always be found there. ","VS_T1P4E1_07.ogg"},
				{"pg","Great, let's continue.","E13A"},	
		
		{"label","E13D"},
		{"if","vc","==",1,"E13DNO"},
		{"fun2",flagvendorinfo,3},
		 {"ns","You would be wise to consider Ramblin' Rose for a job like this.  She really tapped into all that environmentalism in the ‘70s and is always in the news. Ramblin' Rose is always wandering in the park next to City Hall. You should go see her - she's quite a gal. ","VS_T1P4E1_08.ogg"},
		 {"pgs","I'll take that into consideration.  Let's continue.","E13A","e"},
		 -- scorea:+MR
 
				{"label","E13DNO"},
				{"ns","You would be wise to consider Ramblin' Rose for a job like this.  She really tapped into all that environmentalism in the ‘70s and is always in the news. Ramblin' Rose is always wandering in the park next to City Hall. You should go see her - she's quite a gal. ","VS_T1P4E1_08.ogg"},
				{"pg","I'll take that into consideration.  Let's continue.","E13A"},
	
		{"label","E13E"},
		{"if","vd","==",1,"E13ENO"},
		{"fun2",flagvendorinfo,4},
		 {"ns","Well Skeeter McBragg sure is a character. He's a little unpredictable, but he could be perfect for this. You can always find him at Enviro-X Consultants, if you want to go and talk to him.","VS_T1P4E1_09.ogg"},
		 {"pgs","That's interesting. Let's move on.","E13A","f"},
		 -- scorea:+MR
 
				{"label","E13ENO"},
				{"ns","Well Skeeter McBragg sure is a character. He's a little unpredictable, but he could be perfect for this. You can always find him at Enviro-X Consultants, if you want to go and talk to him.","VS_T1P4E1_09.ogg"},
				{"pg","That's interesting. Let's move on.","E13A"},
	
	{"label","E14A"},
	{"fun",vendorinfoscore},
	 {"ns","I hope this has been helpful to you, honey.  Now you should go see what you can find out about the vendors, and then interview each one.  The Internet Cafe has a computer you can use.","VS_T1P4E1_10.ogg"},
	 {"pgs","Research? Interview?  What do you mean?","E14B","g"},
	 {"pgs","Thanks for your time! Excuse me, I am going to get right to it.","E15A","h"},
	 -- scoreb:-LA
 
		{"label","E14B"},
		-- scorea:+LA
		 {"ns","Oh, sorry, honey. What I mean is, go visit your four vendor options. Nathaniel Wailer is almost always at Eco-Tech. You can find Yanis Economou at Ypoforo Ecosystems.  Ramblin' Rose hangs out in the Park and Skeeter McBragg is almost always at Enviro-X Consultants  Remember, go to the the Internet cafe to find a computer first!","VS_T1P4E1_11.ogg"},
		 {"pgs","What do you mean, find a computer?  For what?","E14C","i"},
		 -- scorea:+LA
		 {"pgs","Thanks, I guess I'll be on my way then.","E15A","j"},
		 -- costb:-LA
 
			{"label","E14C"},
			 {"ns","In order to make the choices that best follow the given guidelines, you must do thorough research.  Using the computers at the Internet Cafe is one way to research vendors here in New City. You can also find useful information in newscasts, in the library, and on newsstands around town.","VS_T1P4E1_12.ogg"},
			 {"pgs","Got it. Interview the vendors.  Conduct research at the Internet Cafe.  Look for the news around town, see who the best choice is.  Is there anything else?","E15A","k"},
			-- scorea:+LA
			{"pgs","Excellent!  Thanks for your time; I will be on my way now. ","E15A","l"},
			-- scoreb:-LA
 
	{"label","E15A"},
	 {"ns","Well, yes, as a matter of fact.  Have you heard about the side missions some people around town have for you? These optional quests may not affect your team's overall performance, but they help you do better personally. You are also rewarded when you complete them successfully.","VS_T1P4E1_13.ogg"},
	 {"pg","Thanks for the info!  I am going to get going now.  See you around.","END"},
	 {"pg","Thanks for the info.  Could you tell me where to find vendors again?","E1ATD2"},
 
 
--*************************
--ALREADY TALKED
--*************************
 
{"label","E1ATD1"},
 {"ns","All right, then, hon!  Remember, the next step for you is to do research in the Internet Cafe  or at the library, and also go interview the vendors I just told you about.  Be sure and keep up with the news around town, as that helps, too!","VS_T1P4E1_16.ogg"},
 {"pg","Okay, I got it.  Thanks!","END"},
 
--*************************
--DONE WITH INTERVIEWS
--*************************
 
{"label","E1ATD2"},
 {"ns","Here are the vendors you want to talk to again: Nathaniel Wailer is always around at Eco-Tech. You can find Yanis Economou working at the Ypoforo Ecosystems office.  Ramblin' Rose runs around right here by City Hall, and Skeeter McBragg is at Enviro-X Consultants all the time.","VS_T1P4E1_15.ogg"},
 {"pg","Thanks for repeating that for me, Heather.  See you later!","END"},
 
--*************************
--NEED TO INTERVIEW
--*************************
 
{"label","E1ATD3"},
 {"ns","Hello again, honey!  I heard you did all of your interviews. Well done!  I hope you make the right choice.  The City is depending on you!","VS_T1P4E1_17.ogg"},
 {"pg","Okay, thanks, Heather!  See you around!","END"},
 
--*************************
--CHOSE A VENDOR
--*************************
 
{"label","E1ATD4"},
 {"ns","Hello again, hon!  I heard you settled on someone to help you save the New City River.  I sure hope you made the right choice  the future of our ecosystem may depend on it!.","VS_T1P4E1_18.ogg"},
 {"pg","Thanks, Heather.  I'll see you around.  Bye!","END"},
 
--*************************
--END
--*************************
 
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
