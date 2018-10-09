local dialogtext = {
{"if","vendor","==",1,"ifs"},
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



{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

	{"label","VA1ASD1"},
	 {"ns","Hello, mon!  Have we met?","null.wav"},
	 {"pg","Pardon me, I didn’t mean to disturb you.","END"},
	 {"pg","Hey, you’re Nathaniel Wailer! I’ve heard of you!","END"},


--****************
--INTERVIEW
--****************

	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Good day to you, mon!  Welcome to Eco-Tech!  My name is Nathaniel Wailer, but you may call me “Nathaniel.” How can I help you?","null.wav"},
	 {"pg","I am looking for a disaster assessment consultant that can deliver a concise report on a local ecological disaster.","VA11B"},
	 {"pg","I am looking for a disaster assessment consultant -  although I am afraid your inability to communicate may get in the way of what we need.","VA11C"},


		{"label","VA11B"},
		 --{"fun",incceostate},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well it’s a good thing you decided to come here, mon! We certainly pride ourselves on our clear, concise assessment reports here at Eco-Tech.  So go on, and tell me what is on your mind.","null.wav"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VA12A"},


		{"label","VA11C"},
		 --{"fun",decceostate},
		 -- scoreb:-MD
		 {"fun2", incprofit,2}, -- costb:PLUS
		 {"ns","I don’t think you have any idea what you are talking about.  Are you sure you have the right Nathaniel Wailer, mon? Well, no matter - just go on and tell me why you are here.","null.wav"},
		 {"pg","Well, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VA12A"},


	{"label","VA12A"},
	 {"ns","Oh, yes, that is troubling indeed.  I have seen it all over the news! So what caused  you to come here to talk to me about it, mon?","null.wav"},
	 {"pg","I’ve seen it mentioned that you did very well raising local awareness of environmental issues through research of local ponds and streams.","VA12B"},
	 {"pg","I understand you have very effective- albeit unusual- methods for assessing the ecological impact of various hazardous materials.","VA12C"},

		{"label","VA12B"},
		 --{"fun",decceostate},
		 -- scorea:-MD
		 {"fun2",incprofit,2},-- costa:PLUS
		 {"ns","That does not sound like you know me, mon. But  no matter -- I feel strongly about the environment, and I am available should you feel I can help you.","null.wav"},
		 {"pg","Well, I am happy to hear that you are on board.","VA13A"},


		{"label","VA12C"},
		 --{"fun",incceostate},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well mon, you certainly seem to have done your research!  So, we have a crisis on our hands, indeed. Should you need me, I am happy to drop everything and focus on this project.","null.wav"},
		 {"pg","Sounds great!","VA13A"},


	{"label","VA13A"},
	 {"fun", incinterv},
	 {"ns","So is that all you need to know, mon?","null.wav"},
	 {"pg","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VA13B"},
	 {"pg","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VA13C"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Yes, it is my business to know about how devastating an oil spill can be.  I will surely take that into account when I figure out what my expenses will be for this job. Well then, I hope to see you again soon!  Have a good day, mon!","null.wav"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","How rude, mon! The City should hire Eco-Tech because it is the best firm available – not because we give unauthorized donations!  I am truly offended.","null.wav"},
		 {"pg","I am very sorry, then.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thanks for stopping by, then.  If you decide you want us to perform the ecological impact assessment, just come back and we’ll talk about details!","null.wav"},
 {"pg","Thanks for your time.  I am off to look around further – but I may be back soon to talk to you more about the crisis.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","Hey mon, you’re back!  Are you ready now to hire us to help the City with emergency services?","null.wav"},
	 {"pg","No - I have more research to do, and have to meet with my client first.","VA1ASD2C"},
	 {"pg","You bet!  I’d love to get you on board.  What will it take to make a deal?","VA1ASD2B"},

		{"label","VA1ASD2B"},
		 -- scoreb:-SS
		 {"ns","Are you sure about that? You certainly don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before we go ahead with the disaster assessment, just to be sure.","null.wav"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},


--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************


	{"label","VA2ASD1"},
	 {"ns","What are you doing here, mon? You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here to work details of the arrangement with me.","null.wav"},
	 {"pg","Thanks, I was actually on my way to do that...","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	 {"fun",clearreneg},
	 {"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Welcome back, mon!  It is good to see you. I take it you are here to talk about the assessment. That is good, because the disaster is growing worse by the instant, and we need to know its impact right away.  So did the Mayor end up approving your decision to move forward?","null.wav"},
	 {"pg","Yes. We feel we need someone with the latest and most effective monitoring equipment to do the job.","VA21C"},
	 {"pg","Actually, she didn’t –  I am just passing through.  See you around!","VA21B"},
	 {"pg","City Hall needs people with the kind of experience you have performing the kinds of assessments you have performed around the world.","VA21D"},
	 {"pg","I would hire you without reservation – except, I’m concerned your monitoring methods may be inappropriate for the job.","VA21D"},


		{"label","VA21B"},
		 {"ns","Well, mon, good day then.  I’ll see you back here when you are ready to negotiate.  But you should probably hurry, because things are probably turning worse and we need to know how it affects things like our drinking water and our food supply.","null.wav"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2},-- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","With that kind of information-gathering ability, you should be an environmental engineer! It’s clear the City needs help, so tell me - what are you looking for us to do?","null.wav"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VA22A"},


		{"label","VA21D"},
		 -- scorec:-MD
		{"fun",incprofit,2}, -- costc:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","I don’t know, mon.  Have you actually looked into your decision? Anyway, we have no time to waste  - so tell me, exactly what does the City need from us?","null.wav"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VA22A"},


	{"label","VA22A"},
	 {"fun",halfcost}, --to make deal for half the cost
	 {"ns1","Okay, then, to get the project underway mon, we well need $%d which includes a $1200 budget for a team of experts to fly in from Montoga to help assess the damage; $1800 for rental of monitoring devices for measuring and reporting ecological damage and environmental contamination; and $1000 for duct tape, chewing gum, and copper wiring for spot equipment repairs.","null.wav","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pg","$1000 for duct tape, chewing gum, and copper wiring used for spot equipment repairs? Don’t you normally charge less for that?","VA22B"},
	 {"pg","$1200 seems like an awful lot of money for a team of out-of-town experts. Don’t you think we can find people who are local?","VA22C"},
	 {"pg1","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal"},


		{"label","VA22B"},
		 -- scoreb:+MD
		 -- costb:MINUS
		 {"fun2",subexpense,500},
		 {"fun2",decprofit,3},
		 {"ns1","We usually charge $500 on materials for on-the-spot repairs, but we were thinking of using higher grade copper wiring this time around. But we can always just stick with the stuff we have been using.  I like your attention to details, mon, so let’s say my price is now $%d.","null.wav","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},


		{"label","VA22C"},
		 -- scorec:-MD
		 -- costc:PLUS
		 {"fun2",incprofit,2},		 -- scorea:Vendor adds 2 percentage points to his profit, AND the inflated expense is maintained.
		 {"ns1","That’s not right - if you had done your research, you would know that I always fly in the same team of experts from Montoga when I perform assessments – because they are the best. I can tell that the City is going to be a difficult client now.  I really should be charging you $%d for this.","null.wav","cost"},
		 {"pg","Well, I am sorry to have offended you.","VA23A"},
		 

		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4}, -- costd:PLUS
		 {"ns1","You can’t give me a sponge and tell me to soak up the sea, can you? I just told you what I charge, and I do not appreciate your negotiatin’ style!  I heard the City can be a difficult client - now I know why! You know what? I think I have to charge $%d to take this on.","null.wav","cost"},
		 {"pg","Oh.  Sorry to have offended you...","VA23A"},
		 -- scorea:VENDOR will add 4 points to profit AND maintains inflated expense 3.


	{"label","VA23A"},
	 {"fun",threequartercost},
	 {"ns1","Okay, mon, so I only need $1000 on top of that for organic fruits, vegetables, sugar-free candies and other refreshments for assessment personnel, which brings us to $%d.  So that’s my offer, mon.  Do we have a deal?","null.wav","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pg","Not only have I seen that you charge less for refreshments, but we are in a crisis -and so that really isn’t appropriate here.","VA23B"},
	 {"pg","Don’t your organic refreshments normally cost $500? Why are you charging us so much?","VA23C"},
	 {"pg1","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal"},


		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000}, -- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point.  Maybe I should pay for that expense out of my own pocket, under the desperate circumstances.  So, let’s just say I charge you $%d.  Does that seem fair?","null.wav","cost"},
		 {"pg","Thanks, Nathaniel.  That would be great.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,2},
		 {"ns1","I think you may actually have a point there - maybe I shouldn’t pass this cost on to the City! After all, this is an emergency.  And you know what, mon?  I really like your vibe.  I am going to lower my offer to $%d – just for you, mon.","null.wav","cost"},
		 {"pg","I appreciate that, Nathaniel. Thanks.","VA24A"},


		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering to provide a complete assessment, and that means there are certain expenses I must pay for. I know we are in a crisis, but I can’t be bullied into making a bad deal.  You are much more demanding than I thought – I think I am going to have to charge $%d now.","null.wav","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","Right then, mon, so $%d is what it will take to get me on board…and we really should get started! So tell me - do we have a deal?","null.wav","cost"},
	 {"pg","We have ourselves a deal!","VA25A"},
	 {"pg","Now that we’ve covered your expenses – considering that this is a crisis, could you maybe forgo some of the profit you are making here?","VA24B"},
	 {"pg","Before we go ahead with this, I just wanted to ask – can we maybe get you to lower the $1800 expense for the monitoring equipment you use?","VA24C"},
	 {"pg1","You know, since this is a crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,12},-- costb:MINUS
		 {"ns1","I was actually thinking about the repercussions this disaster will have on our rivers and streams.  Since that this is an ecological crisis, I am willing to compromise for the sake of our water supply. I think we should lower my offer to $%d.  Agreed?","null.wav","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I can’t believe this is how the City treats people!  We just went over my expenses, and then agreed on everything.  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","null.wav","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun",incprofit,6},-- costd:PLUS
		 {"ns","I’ve been patient with you, mon but now I’ve had just about enough.  If you want to get anywhere in this city you are going to have to learn to be respectful of the way we do things. Now, we are through negotiatin\'.","null.wav"},
		 {"pg","I apologize; I didn’t mean to anger you.  Let’s move on,","VA25A"},


	{"label","VA25RENEG"},
	{"fun2",incprofit,2},
	
	{"label","VA25A"},
	 {"ns1","Okay mon, so $%d is my final offer.  Is that agreeable to you?","null.wav","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VA25B"},
	 {"pg","Before we call it a deal, you would be doing the City a favor by adjusting the $1800 budget you have for the rental of your monitoring equipment?","VA25C"},


		{"label","VA25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Irie, then! So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","null.wav","cost"},
		 {"pg","I’m on my way to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","I’ve had just about enough of you for now.  We are done negotiatin’.  There is a crisis that demands our attention- and frankly, your hagglin’ makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","null.wav","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pg","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK"},


			{"label","VA25D"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","Finally! There is no time to waste, now, mon, so let’s get Will Standon at City Hall to draw up a contract for $%d so we can get started.  Bring it right back here so that I can sign it -- and so we can get to work on the assessment!","null.wav","cost"},
			 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},

			
			{"label","VA25RENEGCHECK"},
			{"if","reneg","<",2,"VA25RENEG"},
			{"label","VA25E"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","I have had it with you, mon.  This negotiation is over.  Come back when …when…you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, you’d better get goin’, mon!","null.wav","cost"},
			 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},



--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

	{"label","VA2ATD1"},
	 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","null.wav","cost"},
	 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns1","What in heaven’s name are you doing here, mon?  We have data we must start to collect – so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","null.wav","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns2","Cost: $%d, ContractCost: $%d Hey, mon! It is good to see you.  We really need to get started collecting data for the assessment - did you come with that contract for me to sign?","null.wav","cost","contractcost"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


	{"label","VA31B"},
	 {"ns","Oh, well…alright, mon. Just hurry back as soon as you get a contract – remember, time is a factor!","null.wav"},
	 {"pg","Sounds good.  See you soon!","END"},


		{"label","VA32X"},
			{"fun",incmayor},
			{"fun",incmayor}, -- BChance: Added 2nd call so that mayor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incvendor1},
			{"fun",talkedtovendor1},
			{"fun2",incvars,"journalprogress"},
			{"if","contractcost",">","cost","VA32A"},--PRICE TOO HIGH
			{"if","contractcost","<","cost","VA32B"},--BEING TOO LOW
			{"goto","VA32C"},--CORRECT PRICE


		{"label","VA32A"},
		 {"fun",takemarkup},
		 {"ns","Okay, let’s have a look here then, shall we?  Okay….mm-hmm….oh, my! Look at that!  The city sure is being generous. That’s even more than I asked for!! I am happy to sign this, then – here you go!","null.wav"},
		 {"pg","Thanks, I guess","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! What kind of trickery are you trying to get away with here?","null.wav"},
		 {"pg","I am sorry...","VA32D"},


			{"label","VA32D"},
			 {"ns","My attorney is going to have something to say about this! Excuse me. Hello, Damian?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You’re going to have to bring that contract back to your client – okay?","null.wav"},
			 {"pg","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VA32E"},
			 {"pg","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F"},

			
				{"label","VA32E"},
				 -- scorea:+SG
				 -- costa:PLUS
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now...","null.wav"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},


				{"label","VA32F"},
				 -- scoreb:-SG
				 -- costb:PLUS
				 {"ns","I’m relieved you understand this is the only way we can move forward.  It’s already come through the fax machine. I am just going to sign it and give it to you.  Here you go.","null.wav"},
				 {"pg","Alright, I understand.","VA33A"},

		{"label","VA32C"},
		 {"ns","Well let’s have a look then, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go, mon!","null.wav"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},



	{"label","VA33A"},
	 {"ns","And so that concludes our business then. I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","null.wav"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},


--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************
 
{"label","VA3ATD1"},
 {"ns","What on earth are you doing here, mon? Get back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","null.wav"},
 {"pg","Yes, thanks - I was just about to do that...","END"},



--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
	}
return dialogtext
