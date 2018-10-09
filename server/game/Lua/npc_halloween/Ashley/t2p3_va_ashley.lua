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

{"label","T2P3VA1"},


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

{"label","VA1ASD1"},
 {"ns","Good day to you!  You must be the tailor that my valet called to have my ascots altered!  If it isn’t too much trouble, I may have to ask that you wash your hands before measuring me….","VS_T2P3VA1_10.ogg"},
 {"pg","Pardon me, I think you have the wrong person. Sorry to disturb you.","END"},
 {"pg","Hey, you’re Ashley Dapper! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Good day!  Welcome to Clean Green Machinery.  My name is Dapper.  Ashley Dapper.  Now this may sound odd, but please, before you touch anything, do wash your hands!","VS_T2P3VA1_01.ogg"},
	 {"pgs","Okay, Ashley.  I am looking for a waste recovery and disposal provider, and I hear you focus solely on environmentally friendly recovery.","VA11B","a"},
	 {"pgs","Okay, Ashley. I am looking for a waste recovery and disposal provider -although I am not sure you would want to help out because you don’t really enjoy your work.","VA11C","b"},

		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well then, you are quite the well-read customer, I see.  Good show!  Now that you’ve piqued my curiosity, tell me, what brings you here?","VS_T2P3VA1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked me to find a firm to participate in the recovery by providing waste recovery and disposal services.","VA12A"},

		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","With all due respect, I am not sure that your information is entirely accurate. Well, fear not, there is a good chance I may be able to help you regardless.  Please, tell me what brings you here. ","VS_T2P3VA1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked me to find a firm to participate in the recovery by providing waste recovery and disposal services.","VA12A"},


	{"label","VA12A"},
	 {"ns","Well what a splendid coincidence!  I was just having crumpets earlier with some co-workers, and we were discussing how we should get involved!  So what, pray tell, led you to think of us when you were asked to look for a waste recovery and disposal provider?","VS_T2P3VA1_04.ogg"},
	 {"pgs","Well, I hear that you have one of the oldest operations in town, and so you have professional experience that may prove helpful.","VA12B","c"},
	 {"pgs","Yes.  I understand that you are considered an industry leader in providing environmentally friendly waste disposal.","VA12C","d"},

		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Indeed!  Is that so?  You sound like you are dreadfully confused because that doesn’t describe me at all!  But no matter , we have a strong commitment to the environment here at Clean Green Machinery and so we are available if you feel we can be of service.","VS_T2P3VA1_05.ogg"},
		 {"pg","Okay, great!","VA13A"},


		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well that seems like a splendid reason to come here. indeed.  You seem to have quite a grip on your responsibilities!  Anyway, I think I’d find cleaning up the river to be rather gratifying, so if you need me, I am happy to clear my plate and focus on the City’s needs.","VS_T2P3VA1_06.ogg"},
		 {"pg","I am happy to hear you are available, Ashley.","VA13A"},


	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","Right, then!  Is there anything else you need to know?  I am afraid I must excuse myself , it’s nearly time for my mid-morning tea!","VS_T2P3VA1_07.ogg"},
	 {"pgs","I think that’s about it, but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VA13B","e"},
	 {"pgs","I think that’s about it – but before I go, it would influence my decision to hire you if you were to make a personal donation to the clean-up effort.","VA13C","f"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Well, yes, of course!  The environment is a primary concern for me and I’d feel rather guilty if I didn’t do everything I could to keep my costs contained for this job.  Well then, I hope to see you again!","VS_T2P3VA1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","I beg your pardon?  You want a ‘donation’, indeed!  I am afraid I have no patience for provincial types that stroll into my office demanding questionable financial transactions!  The City should hire us because we are the best firm available, not because I give out kickbacks!","VS_T2P3VA1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thank you so much for stopping by!  If you decide you want to have us recover and dispose of the contaminants on the River, just come back and we’ll talk about details.","VS_T2P3VA1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more, but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","Welcome back!  I take it you are back to have us recover and dispose of the oil slick on the New City River?","VS_T2P3VA1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VA1ASD2B","g"},
	 
		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you quite sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with any services, to be sure.","VS_T2P3VA1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VA2ASD1"},
 {"ns","What ever are you doing here?  You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me and then come back here so we can work on the details of the arrangement.","VS_T2P3VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Well good day to you once more!  You must be here to talk about waste recovery and disposal services.  That is good, because the oil slick is spreading faster than a viral infection!  We need to act right away.  Did the Mayor approve your decision to hire us?","VS_T2P3VA2_01.ogg"},
	 {"pgs","Yes, Ashley.  We are comforted by the fact you have expertise in safely storing hazardous waste materials.","VA21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VA21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering the fact you have operations in multiple cities.","VA21D","b"},
	 {"pgs","Yes, Ashley. We understand your operation guarantees 100% recovery of all contaminants, which is important to us.","VA21D","b"},


		{"label","VA21B"},
		 {"ns","OK I was just leaving for tea, right after I wash my hands, again.  At any rate, I’ll see you back here when you are ready to negotiate.  ","VS_T2P3VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Indeed, with that kind of attention to detail, you should be a pathologist!  I appreciate your concern, and I will keep that in mind.  Now, please go ahead and tell me what you are looking for us to do.","VS_T2P3VA2_03.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VA22A"},


		{"label","VA21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Well, I certainly hope that is not why you wanted to hire me, because it’s simply untrue! Have you actually looked into this decision?  Anyway, the City needs our help, so tell me what you are looking to do.","VS_T2P3VA2_04.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VA22A"},


	{"label","VA22A"},
	 {"fun",halfcost},
	 {"ns1","Splendid, then!  For this kind of project, I normally charge $%d. This includes $2500 for contract personnel to staff the clean-up effort.  Then, I will need $4150 for berms, pallets, and booms to perform the recovery.  Also, there is a $2850 charge for a trailer so my hygienist, custodial staff and personal physician can be on hand to ensure a sterile environment for the duration of the clean-up.","VS_T2P3VA2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pgs","Wait - how much for a trailer and a team of health specialists?  I know for a fact you have charged less for that in the past!","VA22B","c"},
	 {"pgs","Don’t you normally charge less for the berms, pallets, booms and liners that you rent to perform your recoveries?","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},

		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, the truth is, I normally do pay less for a trailer, hygienist, doctor and custodial staff, but I was going to rent a double-wide trailer, given the time we will be spending on this endeavor.  Well, never mind. Let’s say I charge you the old rate, so my total price is $%d.","VS_T2P3VA2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},

		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Indeed! If you had checked, you would have seen that I always charge the same for rental of recovery equipment!  I’m beginning to sense that the City is going to be one of those difficult clients.  You know, I really should be charging $%d for this.","VS_T2P3VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VA23A"},
		 -- costa:PLUS


		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","My dear friend.  You simply cannot just come in here with that kind of compulsive behavior.  I just told you what I charge, and I do not appreciate your negotiating style!  I heard the City can be a difficult client, now I know why!  You know what?  I think I have to charge $%d for this job.","VS_T2P3VA2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VA23A"},


	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, well the remainder of my expenses is the $1500 I charge for a tailor-made suit at Pauline’s, which brings us to $%d.  So that’s my offer.  Do we have a deal?","VS_T2P3VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Not only do you usually charge less for tailor-made suits, but you probably already have plenty!  You shouldn’t charge us for that!","VA23B","f"},
	 {"pgs","I have seen that you normally charge less for tailor-made suits.  I think you are trying to charge us too much.","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},

		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point.  Under the desperate circumstances, maybe I should just wear some of the suits I bought last week and pay for the dry cleaning myself, too.  You know what?  I really feel I can work well with you.  Let’s just say I reduce my profit margin and charge you $%d, total.  Is that fair?","VS_T2P3VA2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, if the truth be known, I normally do charge $1000 for tailor made suits, but I was thinking of getting custom shirts and ascots for this particular project.  Never mind, this is an emergency, so I will charge you the standard rate, so my price is set at $%d.  What do you say?","VS_T2P3VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Ashley. Thanks.","VA24A"},

		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","My dear friend, there is no need to be obstreperous about this!  I am offering waste disposal and recovery services, which entail certain expenses must be incurred!  This is a crisis indeed, but I can’t be bullied into a bad deal.  You seem to be rather demanding.  I think I should charged $%d for this now.","VS_T2P3VA2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","Right then!  I hope that just about does it, because I am starting to break a sweat and I loathe sweaty people.  So, then, I will need $%d for the project.  Are we in agreement?","VS_T2P3VA2_13.ogg","cost"},
	 {"pg","Yes, Ashley we have ourselves a deal!","VA25B"},
	 {"pgs","Now that we’ve covered all your expenses and considering that this is a crisis, do you think you could forgo some profit?","VA24B","i"},
	 {"pgs","Before we go ahead, I need to ask – do you really have to charge so much for contract clean-up personnel?","VA24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","I was just thinking about the disaster as I was washing up over and over again for tea.  I really don’t think I’ll be able to live with myself until we properly address it.  Because of the situation, I am willing to compromise!  I think we should lower my offer to $%d.  Agreed?","VS_T2P3VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I’ll tell you what, your negotiating tactics are making me feel as if I should have a bath.  You know, you’d do well to remember your manners my friend.  It’s easy to see that the City is going to be a very challenging client, and I really am going to have to adjust my plan here and charge you $%d.","VS_T2P3VA2_15.ogg","cost"},
		 {"pg","My apologies.  I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you are simply acting irrationally.  We just went over my expenses and we agreed on everything!  I really do want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P3VA2_16.ogg","cost"},
		 {"pg","My apologies, I must have gotten my facts mixed up.","VA25A"},


	{"label","VA25RENEG"},
	{"fun2",incprofit,2},

	{"label","VA25A"},
	 {"ns1","Fine then.  My price is $%d, and that really is my final offer.  How does that strike you?","VS_T2P3VA2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VA25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for rental of your recovery equipment…","VA25C","l"},


		{"label","VA25B"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","Splendid!  I am happy to help clean up this mess.  So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P3VA2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Okay, that’s it.  We are finished with this interminable negotiation and frankly, your constant haggling is a bit hard to take.  I’m charging $%d now, and that’s only because my sense of civic duty overwhelms me!","VS_T2P3VA2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VA25D"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","Finally! Now, there is simply no time to waste.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P3VA2_20.ogg","cost"},
		 {"pg","Great! I am going to go to Will Standon at City Hall to get papers drawn up.  Thanks for your time!","END"},

		{"label","VA25RENEGCHECK"},
		{"if","reneg","<",2,"VA25RENEG"},
	-- Pete skip this	{"label","VA25E"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","Oh, really.  This is just too much.  I’m sorry, but this negotiation has concluded.  I’m quite sure that I will have a serious little fit if I see you around here again without a contract for me for $%d.  Now, get going before I change my mind!","VS_T2P3VA2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VA2ATD1"},
 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P3VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns","What ever are you doing here?  We have a City to save so hurry back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P3VA3_09.ogg"},
 {"pg","I’ll be back shortly with the contract.  Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","You are back, splendid!  I am so anxious to get started; I haven’t even taken my second bath yet today!  Did you come with that contract for me to sign?  I do hope it’s sterile.","VS_T2P3VA3_01.ogg"},
	 {"pg","Yes, Ashley.  I have it right here and I am pretty sure it’s clean.","VA32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


		{"label","VA31B"},
		 {"ns","Alright then, cheerio!  I shall go change and you should come back as soon as you get a contract.","VS_T2P3VA3_02.ogg"},
		 {"pg","That sounds good.  See you soon!","END"},

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
		 {"ns","Okay, let’s have a look here then, shall we?  Okay….mm-hmm….oh, my!  Look at that!  That’s quite generous and quite a bit more than I asked for!  I am happy to sign this.  Here you go!","VS_T2P3VA3_03.ogg"},
		 {"pg","Thanks, I guess","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait... no!  I beg your pardon!  This isn’t what we discussed!  What kind of nonsense is this anyway? ","VS_T2P3VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},

			{"label","VA32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am simply going to have to call my attorney about this.  Hello, Farnsworth?  Yes, they…uh-huh…okay.  Look, my lawyer will send over a contract with the right numbers.  You must bring this new contract to your client for her to countersign in order to get started.","VS_T2P3VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VA32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},
			
				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, really I do... but my attorney has advised me that you must use the contract he drew up if you want me on board.  He simply insists you get the Mayor to sign it because it has the service fee we agreed on. ","VS_T2P3VA3_10.ogg"},
				 {"pg","I guess I understand if that’s the way it has to be.  And yes, Ashley, my hands are clean.","VA33A"},


				{"label","VA32F"},
				-- scoreb:-SG
				 {"ns","I’m quite relieved you understand that this is the only way we can move forward.  Here you go!  Wait are your hands clean?","VS_T2P3VA3_11.ogg"},
				 {"pg","I totally understand that’s the way it has to be.  And yes, Ashley, my hands are clean.","VA33A"},


		{"label","VA32C"},
		 {"ns","Well let’s have a look then, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go!","VS_T2P3VA3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},


	{"label","VA33A"},
	 {"ns","Right then! I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P3VA3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me, I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VA3ATD1"},
 {"ns","What are you still doing here?  Milling about with that contract, indeed!  You should be off to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P3VA3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
