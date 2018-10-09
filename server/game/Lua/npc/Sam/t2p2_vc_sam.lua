local dialogtext = {
{"if","vendor","==",3,"ifs"},
{"if","vendor","~=",0,"VCBONUS"},
{"label","ifs"},
	{"if","vendor3progress","==",0,"VC1ASD1"},
	{"if","vendor3progress","==",1,"VC11A"},
	{"if","vendor3progress","==",2,"VC1ATD1"},
	{"if","vendor3progress","==",3,"VC1ASD2A"},
	{"if","vendor3progress","==",4,"VC2ASD1"},
	{"if","vendor3progress","==",5,"VC21A"},
	{"if","vendor3progress","==",6,"VC2ATD1"},
	{"if","vendor3progress","==",7,"VC3ASD1"},
	{"if","vendor3progress","==",8,"VC31A"},
	{"if","vendor3progress","==",9,"VC3ATD1"},
	{"if","vendor3progress","==",10,"VC3ATD1"},

{"label","T1P4VC1"},


--**************
--Chose Someone else
--**************

{"label","T2P2VC1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VCBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VC1ASD1"},
 {"ns","Hey, you must be here to deliver those train parts.  Where are your packages?","VS_T2P2VC1_10.ogg"},
 {"pg","Oh, sorry for the intrusion.  I must be in the wrong place. ","END"},
 {"pg","Hey, you’re Sam Shortback! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Hey, come on in! Welcome to Prairie Fire Services.  I’m Sam Shortback. Take your boots off, make yourself comfortable.  You must be an enthusiast here to look at my new model trains!","VS_T2P2VC1_01.ogg"},
	 {"pgs","Actually, Sam, I’ve come looking for a logistics firm – and I understand Prairie Fire has a large network of freight train operators that can supply us with adequate transportation and supplies. ","VC11B","a"},
	 {"pgs","Actually, Sam, I’ve come looking for a logistics firm – and as a life-long law enforcement officer you have the skills and experience we need for scheduling and coordinating large-scale operations.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, I’ll be – a bona fide customer! I should have figured! So what brings you here exactly?","VS_T2P2VC1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, I am not sure what exactly it is you’re getting at  there, short stuff – but it doesn’t really matter.  Just go on and tell me what brings you down here. ","VS_T2P2VC1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VC12A"},


	{"label","VC12A"},
	 {"ns","Well daw gone!  I was just thinking about how I should go on and get involved with that somehow! So why did you think of me when you were told to look for a logistics firm?","VS_T2P2VC1_04.ogg"},
	 {"pgs","Well, you have experience as a life-long law enforcement officer so you should have success undertaking this large operation.","VC12B","c"},
	 {"pgs","Well I understand your superior organizational skills are largely credited for the reduction in crime in New City while you were Sheriff.","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","You sound just about as mixed up as a pig in a poke! But no matter -- I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P2VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Now you’re talkin’!   You certainly seem to know your stuff!  Anyway, I think I could haul in a job like this, so if you need me, I am happy to put my model trains on hold and focus on the City’s needs.","VS_T2P2VC1_06.ogg"},
		 {"pg","I am happy to hear you are available, Sam.","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Alright, then.  Is there anything else you need?  I gotta run and charge my electric-diesel locomotives downstairs.","VS_T2P2VC1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VC13B","e"},
	 {"pgs","Okay, but before I go - it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I have lived in town for a long while, and was Sheriff for just about as long as anyone here can remember.  Because I love this City so deeply, I’ll certainly consider that as I figure out what I will need for this job. Well then, I hope to see you again!","VS_T2P2VC1_08.ogg"},
		 {"pg","The pleasure was mine, Sam.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Now wait just a doggone minute!  What do you mean, ‘a donation’?  That is just shameful.  I don’t appreciate people that stroll into my office trying to hold up the train!  The City should hire me because I am the best vendor available – not because I give out kickbacks!","VS_T2P2VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Thanks for stopping by, then! If you decide you want our firm to provide logistics and support services, just come back and we’ll talk about the details!","VS_T2P2VC1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Welcome back!  Make yourself comfortable. So are you here to get me started on the logistics for the City’s relief and recovery efforts?","VS_T2P2VC1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","Hmmmm…Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with logistics and support services - just to be sure.","VS_T2P2VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","What in tarnation are you doin’ here, pardner?!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P2VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Well howdy, you made it back! You must be here to talk about me providing logistics and support services for the City’s relief and recovery efforts. That’s a good thing, because the fuss about the spill is getting louder than a roaring freight train - and we need to act right away!  So did the Mayor approve your decision to hire us?","VS_T2P2VC2_01.ogg"},
	 {"pgs","Yes – we are particularly excited about your ties to local freight train operators, which will ensure we have adequate transportation for supplies and equipment.","VC21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VC21B"},
	 {"pgs","Yes, although we are concerned about your ability to ensure proper transportation for inbound relief supplies and equipment.","VC21D","b"},
	 {"pgs","You bet!  We look forward to what you can do for the city given your experience responding to various other crises around the County.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Well alrighty then.  I’ll just see you back here when you are ready to negotiate.","VS_T2P2VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","With that kind of attention to detail, you should try building model trains!  It’s clear the City needs help, so tell me what you are looking for us to do.","VS_T2P2VC2_03.ogg"},
		 {"pg","We are looking for a logistics firm that will provide the planning, scheduling, and coordinating for the transportation and storage of the relief supplies and equipment needed at the disaster site.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Oh, I see.  Well to be honest, I am not sure I follow your line of thinking there, pardner. Anyway, we have no time to waste - so go on and what you are looking for me to do.","VS_T2P2VC2_04.ogg"},
		 {"pg","We are looking for a logistics firm that will provide the planning, scheduling, and coordinating for the transportation and storage of the relief supplies and equipment needed at the disaster site.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, so I would normally charge $%d for a job like this.  This includes $2000 for payments to local freight train operators to guarantee adequate transportation, another $4250 for ramping up personnel at Prairie Fire to accommodate elevated levels of activity, and $3250 for rental of local self-storage spaces to accommodate inflow of supplies and equipment needing storage.","VS_T2P2VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Wait - $3250 for a self-storage space rental?  I know for a fact you have charged less for that in the past!","VC22B","c"},
	 {"pgs","I thought that you normally charge clients less to ramp up your personnel to accommodate large-scale projects.","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for storage units, but this time, I was going to rent the ones with the swinging saloon doors.  Well, never mind. Let’s say I charge you the old rate; so my total price is $%d.","VS_T2P2VC2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right, pardner. If you had checked, you would have seen that I always charge the same amount for ramping up my personnel on every large scale project!  I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P2VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Dag nabbit!  You can’t just come through here like some kind of runaway freight train making all kinds of demands.  I’m pretty darned sure I just told you what I charge, and I do not appreciate your negotiating style!  Down at the diner I heard that the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P2VC2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expenses is the $1500 for custom built model trains, tracks, model landcapes and fake foliage that I will need for the renovation of the toy train room we have in the basement at Prairie Fire.  That brings us to $%d, so that’s my offer.  Do we have a deal?","VS_T2P2VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Not only do you usually charge less for your model trains – but why would you need them?  You have plenty of trains already – and you shouldn’t charge clients for that!","VC23B","f"},
	 {"pgs","I have seen that you normally charge less for your trains, tracks, and table-top landscapes. I think you are trying to charge us too much for those.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Ok, pardner.  Now don’t get all riled up.  Under the desperate circumstances, maybe I should hold off on renovations to the toy train room – and pay for them myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P2VC2_10.ogg","cost"},
		 {"pg","Thanks, Sam - that would be great.  Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Uh, shucks.  Well, uh I normally do charge $1000 for my trains and table-top dioramas…but I was thinking of custom ordering these from a high-end Continental supplier. Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P2VC2_11.ogg","cost"},
		 {"pg","I appreciate that, Sam. Thanks.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You’re headin’ down the wrong track there, pardner! I am offering to provide a range of logistics and support services, and that means certain expenses must get paid. We are in a crisis, but I can’t be bullied into a bad deal. You are more demanding than I thought - I really should be charging $%d.","VS_T2P2VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Okay, so to round this thing up, I will need $%d to get started.  Do we have a deal?","VS_T2P2VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now that we’ve covered all your expenses – and considering that this is a crisis, do you think you could forgo some profit?","VC24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – why do you pay your freight operators so much money?","VC24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I was just talking to my boys, and we are all very concerned about what damage this disaster may cause. Because this is an ecological crisis, I am willing to compromise! I think I can lower my offer to $%d.  Agreed?","VS_T2P2VC2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Woah, pardner!  That ain’t no way to treat a feller.  I can already tell the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P2VC2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you really are starting to act eccentrically.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P2VC2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","So it seems like we are on track, now.  My price is $%d, and that’s my final offer.  What do you think about that?","VS_T2P2VC2_17.ogg","cost"},
	 {"pg","I think we have a deal, Sam.","VC25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money on self storage…","VC25C","l"},


		{"label","VC25B"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","Hot diggity! I am happy to be on board for this! So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P2VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Pardner, we’ve come to the end of the line.. We are done negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P2VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VC25D"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","Well it’s about time! Now, go and get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P2VC2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},
-- Peter was here		{"label","VC25E"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},




		 {"ns1","I’m sorry pardner but you’re headin’ for the wrong end of the train.  This negotiation is over.  Please don’t let me see you around these parts again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P2VC2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I am ready to hop on board to help the City, my young friend, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P2VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns","What in tarnation are you doing here, Pardner?  The City needs our services – so hurry on back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P2VC3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hello again, Pardner!  It’s nice to see you back in town – I’m so rippin’ to get back to work for the City I can’t drive my trains straight! Did you come with that contract for me to sign? ","VS_T2P2VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Shucks.   Well alright.  Just come back here as soon as you have a contract for us.","VS_T2P2VC3_02.ogg"},
		 {"pg","Sounds good.  See you soon!","END"},

		{"label","VC32X"},
			{"fun",incmayor},
			{"fun",incmayor}, -- BChance: Added 2nd call so that mayor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incvendor3},
			{"fun",talkedtovendor3},
			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"mickeytrap",1},
			{"fun",incmickey},
			{"if","contractcost",">","cost","VC32A"},--PRICE TOO HIGH
			{"if","contractcost","<","cost","VC32B"},--BEING TOO LOW
			{"goto","VC32C"},--CORRECT PRICE


		{"label","VC32A"},
		 {"fun",takemarkup},
		 {"ns","Okay, let’s have a look-see, shall we?  Okay….mm-hmm….well hoo-wee! Look at that!  The city sure is being generous. That’s even more than I asked for!! I am danged happy to sign this!  Here you go, Pardner!","VS_T2P2VC3_03.ogg"},
		 {"pg","Thanks, I guess","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! What kind of high-jinx are you up to, Pardner? ","VS_T2P2VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am going to have to call my lawyer about this.  Hello, Wyatt?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You need to hop along and bring this new contract to your client for her to countersign in order to get started.","VS_T2P2VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my lawyer won’t budge.  He has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now…","VS_T2P2VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","I sure am glad that you understand that this is the only danged way we can move forward.  Here you go!","VS_T2P2VC3_11.ogg"},
				 {"pg","Alright - I understand, I guess.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well let’s have a look-see then, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect, Pardner. Here you go!","VS_T2P2VC3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","Well hot-dang! I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P2VC3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","What in sam hill are you still doing here, Pardner? Get on back to City Hall pronto and get the Mayor to countersign that contract.  We need to get started - the future of our City is at stake!","VS_T2P2VC3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
