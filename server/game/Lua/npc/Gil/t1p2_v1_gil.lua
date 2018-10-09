local dialogtext = {
{"if","vendor","==",1,"ifs"},
{"if","vendor","~=",0,"VABONUS"},
{"label","ifs"},
	{"if","vendor1progress","==",0,"VA1ASD1"},
	{"if","vendor1progress","==",1,"VA11A"},
	{"if","vendor1progress","==",2,"VA1ATD1"},
	{"if","vendor1progress","==",3,"VA1ASD2A"},
	{"if","vendor1progress","==",4,"VA2ASD1"},
	{"if","vendor1progress","==",5,"VA21A"},
	{"if","vendor1progress","==",6,"VA2ATD1"},
	{"if","vendor1progress","==",7,"VA3ASD1"},
	{"if","vendor1progress","==",8,"VA31A"},
	{"if","vendor1progress","==",9,"VA3ATD1"},
	{"if","vendor1progress","==",10,"VA3ATD1"},

{"label","T1P4VA1"},


--**************
--Chose Someone else
--**************

{"label","T1P2VA1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VABONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","wp"},
	{"n","Hello. Sorry, but I am busy right now. I'll see you around."},
	{"pg","Alright","END"},

--*********************
--CAN'T INTERVIEW YET
--*********************
		{"label","VA1ASD1"},
			{"ns","I am sorry, have we met?  Not like I would remember, anyway.  At any rate, please excuse me.  I am very busy right now -- if I could only remember what it is I was working on…","VS_T1P2VA1_10.ogg"},
			{"pg","Pardon me, I didn’t mean to disturb you.","END"},
			{"pg","Hey, you’re Gil Fermin! I’ve heard of you!","END"},
			
--****************
--INTERVIEW
--****************

	{"label","VA1"},
		
		{"label","VA11A"},
			{"fun",incvendorsvisited},
			{"fun",incvendor1},
			{"fun",talkedtovendor1},
			{"fun3",setvar,"scoreconvo","va1"},
			{"ns","Welcome to New City Emergency Medics!  Why, I don’t think we’ve met before.  Not like, I’d remember, of course! My name is Gil Fermin. How can I help you?","VS_T1P2VA1_01.ogg"},
			{"pgs","I am looking for an emergency response firm with effective means of controlling crowds and ensuring safety at the scene of an ecological disaster.","VA11B","a"},
			{"pgs","I am looking for an emergency services vendor -  although I am concerned that your recent legal troubles may interfere with your involvement.","VA11C","b"},
		
				{"label","VA11B"},
					 -- scorea:+MD
					 {"fun2", decprofit,2}, -- costa:MINUS
					{"ns","Well it’s a good thing you decided to come here, then! That is certainly a key feature of our service offering here at New City Emergency Medics Association.  So, now that I’m concentrating tell me why you’re here.","VS_T1P2VA1_02.ogg"},
					{"pg","There has been an oil spill in the New City River, and the City asked my firm to find emergency response services to help them respond to the disaster.","VA12A"},
				
				{"label","VA11C"},
					 -- scoreb:-MD
					 {"fun2", incprofit,2},-- costb:PLUS
					{"ns","Now I don’t always remember things, but I don’t think you have any idea what you are talking about.  Well, you’re here, so you may as well just go on and tell me why.","VS_T1P2VA1_03.ogg"},
					{"pg","There has been an oil spill in the New City River, and the City asked my firm to find emergency response services to help them respond to the disaster.","VA12A"},
		

		{"label","VA12A"},
			{"ns","Well, I would imagine the City is in quite a mess, here, isn’t it?  So why did you come here to talk about this with me in particular?","VS_T1P2VA1_04.ogg"},
			{"pgs","I’ve seen it mentioned that you have a knack for being highly organized which is important for this job.","VA12B","c"},
			{"pgs","I understand you regularly purchase up-to-date medical and security equipment, so I am confident you will do well with the job.","VA12C","d"},
		
				{"label","VA12B"},
					 -- scorea:-MD
					 {"fun2", incprofit,2},-- costa:PLUS
					{"ns","I think you’re a little confused right now – but  no matter,  I know the feeling,  I feel strongly about the environment, so I am available if you think I can help you.","VS_T1P2VA1_05.ogg"},
					{"pg","Well, I am happy to hear that you are ready to come on board.","VA13A"},
				

				{"label","VA12C"},
					 -- scoreb:+MD
					 {"fun2",decprofit,2},-- costb:MINUS
					{"ns","You certainly seem to know your stuff!  Anyway, we have a crisis on our hands – so should you need me, I am happy to focus on the City’s needs.","VS_T1P2VA1_06.ogg"},
					{"pg","Sounds great!","VA13A"},
		

		{"label","VA13A"},
			{"fun", incinterv},
			{"ns","So now, where was I?  I forgot.  Anyway, is that all you need to know?","VS_T1P2VA1_07.ogg"},
			{"pgs","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VA13B","e"},
			{"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VA13C","f"},

				{"label","VA13B"},
					 -- scorea:+EB
					 {"fun2",decprofit,2},-- costa:MINUS
					{"ns","Yes, I was just thinking about all the injury and suffering that may result from this…so I will be sure to take that into account when I figure out what my expenses will be for this job. Well then, I hope to hear from you soon – and I sure hope you can help get the town out of this mess!","VS_T1P2VA1_08.ogg"},
					{"pg","The pleasure was mine.  I’ll see you around!","END"},
				

				{"label","VA13C"},
					 -- scoreb:-EB
					 {"fun2",incprofit,2},-- costb:PLUS
					{"ns","Your bedside manners are atrocious!  How dare you stumble into this office and demand bribes!  The City should hire my firm because we are the best – not because we give out  kickbacks!","VS_T1P2VA1_09.ogg"},
					{"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},
		

--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************
		
		{"label","VA1ATD1"},
			{"ns","Thanks for stopping by, then, it was nice meeting you. I know you’re busy, so don’t let me keep you.  If you decide you need us to respond to the emergency, just come back and we’ll talk about details!","VS_T1P2VA1_13.ogg"},
			{"pg","Thanks for your time.  I am off to look around further – but I may be back soon to talk to you more about the crisis.","END"},
		

--*******************
--CAN'T NEGOTIATE YET
--*******************

		{"label","VA1ASD2A"},
			{"ns","Are you being helped?  Oh, yes, it’s you again!  I’ve been hoping you’d return, although honestly, I forgot what you looked like.  So are you ready to hire us to help the City with emergency services?","VS_T1P2VA1_11.ogg"},
			{"pg","No - I have more research to do, and have to meet with my client first.","VA1ASD2C"},
			{"pgs","You bet!  I’d love to get you on board.  What will it take to make a deal?","VA1ASD2B","g"},
		
				{"label","VA1ASD2B"},
				-- scoreb:-SS
					{"ns","Are you sure about that? Even I don’t think you seem ready to negotiate.  I think you should probably get the official go-ahead from your client before we agree to provide the City with emergency response services just to be sure.","VS_T1P2VA1_12.ogg"},
					{"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

				{"label","VA1ASD2C"},
				-- scorea:+SS
				{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************
		
	{"label","VA2ASD1"},
		{"ns","What are you doing here? You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here to work details of the arrangement with me.","VS_T1P2VA2_22.ogg"},
		{"pg","Thanks, I was actually on my way to do that…","END"},
			
--*****************
--NEGOTIATIONS
--*****************

	{"label","VA2"},
		
		{"label","VA21A"},
			 {"fun",clearreneg},
			 {"fun3",setvar,"scoreconvo","v2"},
			{"ns","You must be here to talk about providing emergency services for the disaster, right?  News of the disaster is spreading like a bad cold – so there is little time to waste!  You must tell me – why did the Mayor approve your decision to move forward?","VS_T1P2VA2_01.ogg"},
			{"pgs","The mayor feels we need someone with the ability to make sure that both workers and onlookers at the disaster site stay safe.","VA21C","a"},
			{"pg","Actually, she didn’t –  I am just passing through.  See you around!","VA21B"},
			{"pgs","City Hall needs people with the kind of experience you have in responding to disasters around the world.","VA21D","b"},
			{"pgs","I would hire you without reservation – except, I’m concerned your staff may not have the right experience for the job.","VA21D","b"},

		
				{"label","VA21B"},
					{"ns","Did you forget something somewhere?  I do that all the time.  Well, I’ll just see you back here when you are ready to negotiate.  You’ll probably need help making sure things at the disaster site don’t turn into a total mess!","VS_T1P2VA2_02.ogg"},
					{"pg","Sure thing! Bye!","END"},
				

				{"label","VA21C"},
					 -- scorea:+MD
					 {"fun2",decprofit,2}, -- costa:MINUS
					{"fun",incvendor1},
					{"fun",talkedtovendor1},
					{"ns","Well at least one of us sure seems to have their act together!  With that attention to detail, you should be performing surgery. It’s clear the City needs help, so tell me - what are you looking for us to do?","VS_T1P2VA2_03.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services respond to, and secure, the disaster site.","VA22A"},
				

				{"label","VA21D"},
				-- scored:-MD
				{"fun2",incprofit,2}, -- costd:PLUS
					{"fun",incvendor1},
					{"fun",talkedtovendor1},
					{"ns","Now hold on, Even I know you’re sound  totally out of sorts – because that was total nonsense.  Have you really looked into this decision? Anyway, we have no time to waste  - so tell me, exactly what does the City need from us?","VS_T1P2VA2_04.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services.","VA22A"},
				

		{"label","VA22A"},
		{"fun",halfcost},
			{"ns1","Well, I think that to get involved with this, we would need $%d. This includes a $1200 budget for rapid personnel deployment, $1800 for medical equipment rentals and the establishment of a security perimeter, and $1000 for a gener-ator, vending machines, and ping pong tables for my staff.","VS_T1P2VA2_05.ogg","cost"},
			{"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
			{"pgs","$1000 for vending machines and ping pong tables? That seems like a lot for recreational equipment.","VA22B","c"},
			{"pgs","Wait – $1800 that seems like an awful lot of money for renting medical equipment. Don’t you normally charge less for that?","VA22C","d"},
			{"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},

				{"label","VA22B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,500},-- costb:MINUS
					 {"fun2",decprofit,5},
					{"ns1","Oh, did I say $1000?  I must have been reading the wrong rate sheet…let’s see…oh yes.  That is $500 for the generator and the recreational equipment to entertain my service staff in this case…well, I like your attention to detail. Let’s just say my price is now $%d.","VS_T1P2VA2_06.ogg","cost"},
					{"pg","That works.  Let’s continue.","VA23A"},
				
				{"label","VA22C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","That’s just not right - if you had done your research, you would know that I always charge $1800 for the latest medical equipment, and for security gear to set up a perimeter. I can tell that the City is going to be a difficult client now; I think I should be charging you $%d for this.","VS_T1P2VA2_07.ogg","cost"},
					{"pg","Well, I am sorry to have offended you.","VA23A"},
					 -- costa:PLUS
				

				{"label","VA22D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","Now wait just a second here!  I just told you what I charge, and I don’t appreciate your style of negotiating!  I heard the City can be a difficult client.  Now I know why! You know what? I think I am going to have to charge $%d to do this job…","VS_T1P2VA2_08.ogg","cost"},
					{"pg","Oh.  Sorry to have offended you...","VA23A"},
					

		{"label","VA23A"},
			{"fun",threequartercost},
			{"ns1","Okay, so I only need $1000 on top of that for sugared candies, caffeinated soft drinks, and over-the-counter energy pills, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P2VA2_09.ogg","cost"},
			{"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
			{"pgs","Candies, soda, and energy pills? Not only have I seen that you charge less for that, but we are in a crisis, and I don’t think charging for that is right.","VA23B","f"},
			{"pgs","Don’t your candies, sodas, and energy pills normally cost $500? Why are you trying to charge us so much?","VA23C","g"},
			{"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},
		
				{"label","VA23B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,1000},-- costb:MINUS
					 {"fun2",decprofit,5},
					{"ns1","You know; now that you mention it,  I really should pay for that expense out of my own pockets, given the circumstances…so let’s just say I charge you $%d.  Does that seem fair?","VS_T1P2VA2_10.ogg","cost"},
					{"pg","Thanks, Gil.  That would be great.","VA24A"},
				

				{"label","VA23C"},
					 -- scorec:+MD
					 {"fun2",subexpense,500},-- costc:MINUS
					 {"fun2",decprofit,5},
					{"ns1","I think you may actually have a point there - maybe I shouldn’t pass this cost on to the City! After all, this is an emergency…you know what?  I really feel I can work well with you.  So I am going to lower my offer to $%d.  What do you say?","VS_T1P2VA2_11.ogg","cost"},
					{"pg","Nice one, let’s continue","VA24A"},
				
				{"label","VA23D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","I am offering to provide a service for the City - and that entails certain expenses.  I appreciate the urgency of our crisis, but I won’t stand for your hardball tactics.  This really seems like a more demanding job than I thought –so I think I am going to have to charge $%d now.","VS_T1P2VA2_12.ogg","cost"},
					{"pg","I see.  Well, I am sorry to have offended you.","VA24A"},
		

		{"label","VA24A"},
			{"ns1","So now, it will take $%d to get me on board…and we really should get started! So tell me - do we have a deal?","VS_T1P2VA2_13.ogg","cost"},
			{"pg","We have ourselves a deal!","VA25B"},
			{"pgs","Now that we’ve covered your expenses – and considering that this is a crisis, could you forgo some of the profit you are making here?","VA24B","i"},
			{"pgs","Before we go ahead with this, I just wanted to ask – will you lower your $1200 personnel cost?  Others charge less for that.","VA24C","j"},
			{"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},
		
				{"label","VA24B"},
					 -- scoreb:+EW
					 {"fun2",decprofit,10},-- costb:MINUS
					{"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions on our environment. Given that this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P2VA2_14.ogg","cost"},
					{"pg","I am happy you see it that way.  Thanks.","VA25A"},
				

				{"label","VA24C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","Is that so!? I can’t believe this is how the City treats people.  You should already know what I usually charge! As much as I want to help, if this is what I am going to have to put up with, I am going to have to charge you $%d.  I am done negotiating!","VS_T1P2VA2_15.ogg","cost"},
					{"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},
				

				{"label","VA24D"},
					 -- scored:-EW
					 {"fun2",incprofit,6},-- costd:PLUS
					{"ns","I’ve been patient with you, but now I’ve had just about enough.  If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.    We are donefinished negotiating.","VS_T1P2VA2_16.ogg"},
					{"pg","I apologize; I didn’t mean to anger you.  Let’s move on,","VA25A"},
					

		{"label","VA25RENEG"},
		{"fun2",incprofit,2},
			
		{"label","VA25A"},
			{"ns1","Okay then, so my final offer is $%d.  Is that agreeable to you?","VS_T1P2VA2_17.ogg","cost"},
			{"pg","Okay, fair enough.  It’s a deal.","VA25B"},
			{"pgs","Before we call it a deal, you would be doing the City a favor by adjusting the $1800 budget you have for rental of medical and security equipment?","VA25C","l"},
		

				{"label","VA25B"},
-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



					{"ns1","Okay, so the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P2VA2_18.ogg","cost"},
					{"pg","I’m on my way to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},
		

				{"label","VA25C"},
					 -- scoreb:-EW
					 {"fun2",incprofit,3},-- costb:PLUS
					 {"fun",increneg},
					{"ns1","Listen, I’ve had about enough of this.  We are finished negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem as if you are impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T1P2VA2_19.ogg","cost"},
					{"pg","Before you increase your price anymore, I accept your offer.","VA25D"},
					{"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
					-- scoreb:-EW
					-- costb:PLUS
				

						{"label","VA25D"},

-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},




							{"ns1","Finally! Well, there is no time to waste.  Let’s get Will Standon at City Hall to draw up a contract for $%d so we can get started.  Bring it right back here so that I can sign it -- and so that we can get to work!","VS_T1P2VA2_20.ogg","cost"},
							{"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},
						
						{"label","VA25RENEGCHECK"},
						{"if","reneg","<",2,"VA25RENEG"},

-- peter						{"label","VA25E"},
-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

							{"ns1","I have had it.  This negotiation is over.  Come back when you have a contract for me for $%d.","VS_T1P2VA2_21.ogg","cost"},
							{"pg","I’ll go to City Hall now and get the papers drawn up.","END"},
				
--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************
		
	{"label","VA2ATD1"},
		{"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T1P2VA2_23.ogg","cost"},
		{"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

		{"label","VA3ASD1"},
			{"ns1","Oh, it’s you!  I remembered you, this time! Hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P2VA3_09.ogg","cost"},
			{"pg","I’ll be back shortly with the contract. Thank you for the reminder..","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA3"},
		
		{"label","VA31A"},
			{"fun3",setvar,"scoreconvo","v3"},
			{"ns","Oh, I am so distraught by what is happening – I can’t remember if I even know you….oh yes, that’s right!  You work with the City.  Did you come with that contract for me to sign?","VS_T1P2VA3_01.ogg"},
			{"pg","Yes, I have it right here.","VA32X"},
			{"pg","No, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},
		

				{"label","VA31B"},
					{"ns","Oh, well…alright.  Just come back as soon as you get a contract – time is of the essence!","VS_T1P2VA3_02.ogg"},
					{"pg","Sounds good.  See you soon!","END"},
		
				{"label","VA32X"},
					{"fun",incmayor},
					{"fun",incmayor}, -- BChance: Added 2nd call so that mayor is in correct state.
					{"fun",incstandon},
					{"fun",incevelyn},
					{"fun",incvendor1},
					{"fun",talkedtovendor1},
					{"fun2",incvars,"journalprogress"},
					{"fun3",setvar,"mickeytrap",1},
					{"fun",incmickey},
					{"if","contractcost",">","cost","VA32A"},--PRICE TOO HIGH
					{"if","contractcost","<","cost","VA32B"},--BEING TOO LOW
					{"goto","VA32C"},--CORRECT PRICE
		

				{"label","VA32A"},
					{"fun",takemarkup},
					{"ns","Okay, here we go…yes …uh-huh…wow! Look at that!  The city sure is being generous. That’s even more than I asked for!! Of course I’ll sign!  Here, you better take this back before I lose it.","VS_T1P2VA3_03.ogg"},
					{"pg","Thanks, I guess","VA33A"},
					 -- costa:Set to CC
				

				{"label","VA32B"},
					{"fun",getvendorcontract},
					{"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! What kind of trick are you trying to pull here? Did you think I’d forget the price we agreed on?","VS_T1P2VA3_04.ogg"},
					{"pg","I am sorry…","VA32D"},

						{"label","VA32D"},
						{"fun2",incprofit,10},
							{"ns","My attorney is going to have something to say about this! Excuse me. Hello, Jenny?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You’re going to have to bring that contract back to your client – okay?","VS_T1P2VA3_06.ogg"},
							{"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather have Will draw up a new contract.","VA32E","a"},
							{"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},

								{"label","VA32E"},
									 -- scorea:+SG
									{"ns","I understand your position, but my attorney has advised me that you must use the contract she drew up if you want me on your team.  She insists you get the Mayor to sign it because it has the service fee we agreed on.","VS_T1P2VA3_10.ogg"},
									{"pg","Well, if that’s the way it has to be, I understand.","VA33A"},
								

								{"label","VA32F"},
									 -- scoreb:-SG
									{"ns","I’m relieved that you understand this is the only way we can proceed.  Now, she’s going to fax this over any second…and I am going to sign it and give it to you before I lose it.","VS_T1P2VA3_11.ogg"},
									{"pg","Alright, I understand.","VA33A"},
				

				{"label","VA32C"},
					{"ns","Well let’s check it out….uh huh….mm hmmm…this looks perfect. Here, take this contract back, before I lose it.","VS_T1P2VA3_05.ogg"},
					{"pg","Excellent!  I am looking forward to working with you.","VA33A"},
				
		
		{"label","VA33A"},
			{"ns","Well so long then!  I really look forward to being part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P2VA3_07.ogg"},
			{"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},
		
--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

	{"label","VA3ATD1"},
		{"ns","What are you doing here? You need go to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T1P2VA3_08.ogg"},
		{"pg","Yes, thanks - I was just about to do that…","END"},
		
--******************
--END
--******************
	{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
	
}
return dialogtext
