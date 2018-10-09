local dialogtext = {
{"if","vendor","==",4,"ifs"},
{"if","vendor","~=",0,"VDBONUS"},
{"label","ifs"},
	{"if","vendor4progress","==",0,"VD1ASD1"},
	{"if","vendor4progress","==",1,"VD11A"},
	{"if","vendor4progress","==",2,"VD1ATD1"},
	{"if","vendor4progress","==",3,"VD1ASD2A"},
	{"if","vendor4progress","==",4,"VD2ASD1"},
	{"if","vendor4progress","==",5,"VD21A"},
	{"if","vendor4progress","==",6,"VD2ATD1"},
	{"if","vendor4progress","==",7,"VD3ASD1"},
	{"if","vendor4progress","==",8,"VD31A"},
	{"if","vendor4progress","==",9,"VD3ATD1"},
	{"if","vendor4progress","==",10,"VD3ATD1"},

{"label","T1P4VD1"},


--**************
--Chose Someone else
--**************

{"label","T2P2VD1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VDBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VD1ASD1"},
 {"ns","Well, hello, stranger.  You must be here to deliver and install that mechanical bull.  Where are your packages?","VS_T2P2VD1_10.ogg"},
 {"pg","Oh, pardon the interruption. I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Dave Shortback! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VD11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		{"fun3",setvar,"scoreconvo","vd1"},
	 {"ns","Howdy, stranger! Welcome to Western Logistics.  I’m Dave Shortback. You must be a rodeo rider here to train on one the mechanical bulls downstairs! ","VS_T2P2VD1_01.ogg"},
	 {"pgs","Actually, Dave, I’ve come looking for a logistics firm – and I understand you have a network of personnel  you can draw upon in support of any large-scale projects.","VD11B","a"},
	 {"pgs","Actually, Dave, I’ve come looking for a logistics firm – and it seems from the work you did with the Rosenfield VFW that you have access to the transportation and warehousing we will need for coordinating the shipment of relief supplies.","VD11C","b"},

		{"label","VD11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well ain’t that a hoot and holler, you have logistics work in mind, I see. Well better you come here than to one of them other low-down logistics providers in town! So tell me what you have in mind. ","VS_T2P2VD1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VD12A"},

		{"label","VD11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Hmmmm…Well, pard’ner, I am not sure I follow you entirely.  Anyway, why don’t you go on and tell me what brings you here.","VS_T2P2VD1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VD12A"},


	{"label","VD12A"},
	 {"ns","Well, now that’s quite a coincidence.  I was just talkin’ to some of the other fellas about how we should all get involved!  So why did you think of us, exactly, when you were told to look for a logistics and support services firm?","VS_T2P2VD1_04.ogg"},
	 {"pgs","I hear that you are known as an innovator in the field of logistics and supply services.","VD12B","c"},
	 {"pgs","Yes, Dave, I appreciate that you are highly enthusiastic about developing your operation into the best logistics provider the City has seen.","VD12C","d"},

		{"label","VD12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, you certainly do think highly of us, don’t you? But, I must admit I am not sure I follow you. At any rate, I understand why you’re here - and I feel strongly about the environment, so I’ll be available if you think we can help, somehow.","VS_T2P2VD1_05.ogg"},
		 {"pg","Okay, great!","VD13A"},


		{"label","VD12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well hot-diggety!  You certainly know your way around the ranch, don’t you!  Now, we have a crisis on our hands – so if you need me, I am happy to polish my stirrups later and focus on the City’s needs.","VS_T2P2VD1_06.ogg"},
		 {"pg","Alright then, let’s continue","VD13A"},


	{"label","VD13A"},
	{"fun", incinterv},
	 {"ns","Right then, if you’ll excuse me, I have to hang up my chaps out back to dry. Is there anything else you need?","VS_T2P2VD1_07.ogg"},
	 {"pgs","No, that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VD13B","e"},
	 {"pgs","No, but before I go - it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VD13C","f"},

		{"label","VD13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I have a soft spot in my heart for our land and our water.  I’ll certainly consider that as I figure out what I will need to take on this responsibility. Well then, I hope to see you again, stranger!","VS_T2P2VD1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VD13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Now, wait one cotton pickin’ minute!   I do not take kindly to characters that mosey onto my land looking to rustle up phoney money! The City should hire me because I am the best – not because I  give out kickbacks!","VS_T2P2VD1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VD1ATD1"},
 {"ns","Thanks for stopping by! If you decide you want our firm to provide logistics and support services, just come back and we’ll talk about the details!","VS_T2P2VD1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VD1ASD2A"},
	 {"ns","Welcome back!  So are you here to wrangle a logistics and support services firm`for the City’s relief and recovery efforts?","VS_T2P2VD1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VD1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B","g"},
	 
		{"label","VD1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that, pardner? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with logistics and support services - just to be sure.","VS_T2P2VD1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VD2ASD1"},
 {"ns","Hey there, pard’ner.  What are you doing back here? You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P2VD2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VD21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hello again, pard’ner!  You must be back to talk about hiring a logistics and support services firm! People sure are fussing about the disaster like bulls at the rodeo - and we need to act right away!  So did the Mayor approve your decision to hire me?","VS_T2P2VD2_01.ogg"},
	 {"pgs","Yes, Dave, we are confident you are good for the job,considering your reputation as the best provider of logistics and support services to ranchers in Elliot County.","VD21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VD21B"},
	 {"pgs","Yes, Dave.  We think your access to local railway freight operators will be of great service to the City’s relief and recovery efforts. ","VD21D","b"},
	 {"pgs","Yes, Dave, we are looking forward to seeing what you can do considering your reputation among local transportation and warehousing providers.","VD21D","b"},


		{"label","VD21B"},
		 {"ns","Well okay then, pard’ner! I have to go and brush, polish and shine the bulls downstairs, anyway – so just come back here when you are ready to negotiate.  ","VS_T2P2VD2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VD21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Well, hooo-ey, pard’ner, you sure know your way around our ranch! With that kind of attention to detail, you should be designing mechanical bulls!  It’s clear the City needs help, so tell me what you are looking for us to do.","VS_T2P2VD2_03.ogg"},
		 {"pg","We are looking for a logistics firm that will provide planning, scheduling, and coordinating the transportation and storage of the relief supplies and equipment needed at the disaster site.","VD22A"},


		{"label","VD21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Now, hold on just a second - I think I am a little confused.  You don’t need to explain yourself, though, pard’ner- just tell me what you are looking for me to do.","VS_T2P2VD2_04.ogg"},
		 {"pg","We are looking for a logistics firm that will provide planning, scheduling, and coordinating the transportation and storage of the relief supplies and equipment needed at the disaster site.","VD22A"},


	{"label","VD22A"},
	 {"fun",halfcost},
	 {"ns1","In that case, we need $%d to do this project.  This includes $4000 for mobilization of local ranchers to help respond to the disaster. There’s also a $3000 charge for cowboys and itinerant farmhands to administrate and coordinate disaster relief efforts. Then, there’s $2500 we need for fresh horses and riders to carry instructions and messages between points in the supply chain around the County. ","VS_T2P2VD2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
	 {"pgs","I thought you normally charge less for your pony-express style network of fresh horses and riders!","VD22B","c"},
	 {"pgs","Wait - $3000 for cowboys and itinerant farmhands?  Don’t you normally charge less for that?","VD22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal","e"},

		{"label","VD22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, I normally do charge less for fresh horses and riders, but I was going to rent some thoroughbreds given the serious circumstances. Never mind - let’s just say I charge the old rate; so my total price is $%d.","VS_T2P2VD2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VD23A"},

		{"label","VD22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you would have checked, you would have seen that I always charge the same amount for hiring itinerant cowhands and laborers to administrate large projects!  I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P2VD2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VD23A"},
		 -- costa:PLUS


		{"label","VD22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here and act like some sort of cowboy, you know. I just told you what I charge, and I do not appreciate your negotiating style!  I heard the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P2VD2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VD23A"},


	{"label","VD23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, so the remainder of my expenses is the $1500 I need for a WesTech RGH-4000 two-ton mechanical bull that has a spring-loaded body and rawhide padding, which I am very excited about.  So that brings us to $%d.  Do we have a deal?","VS_T2P2VD2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
	 {"pgs","Wait - not only do you usually charge promoters less for your mechanical bulls – but it isn’t right to charge a client for that!","VD23B","f"},
	 {"pgs","I have seen that you normally charge less for mechanical bulls.  I think you are trying to charge us too much.","VD23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal","h"},

		{"label","VD23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, pard’ner, I think you have a point.  Under the desperate circumstances, maybe I should rethink how much I am spending on mechanical bulls – and pay for this one myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P2VD2_10.ogg","cost"},
		 {"pg","Thanks, Dave. That would be great. ","VD24A"},


		{"label","VD23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed.  Well, I would charge $1000 for that bull, but I was going to have it ordered express delivery. Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P2VD2_11.ogg","cost"},
		 {"pg","I appreciate that, Dave. Thanks.","VD24A"},

		{"label","VD23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Now pard’ner, you are really starting to sound like some sort of rustler. I am offering to provide logistics services, which means certain expenses must be paid! This is a crisis, but I can’t be bullied into a bad deal. You are more demanding than I thought - I am going to need $%d to take this on.","VS_T2P2VD2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VD24A"},


	{"label","VD24A"},
	 {"ns1","Right then, pardner, so we will need $%d to get started. What do you say? ","VS_T2P2VD2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VD25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VD24B","i"},
	 {"pgs","Before we go ahead, I have to ask – are you sure you have to charge so much for mobilizing local ranchers?","VD24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

		{"label","VD24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, we were talking about the disaster and how it may impact all the ranches in the area. You know, because this is an ecological crisis, I am willing to compromise! I think we should lower my offer to $%d.  Agreed?","VS_T2P2VD2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VD25A"},


		{"label","VD24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now, look here, pard’ner. You ought to show some manners – otherwise people will think you’re some sort of cowboy.  I can already tell the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P2VD2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


		{"label","VD24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you really are starting to act like a cattle rustler.  We just went over my expenses, and we agreed on everything!  As much as I want to help the City, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P2VD2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

	{"label","VD25A"},
	 {"ns1","So now that we are back on the horse, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P2VD2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VD25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for hiring cowboys and farmhands.  Can’t we find them cheaper somewhere?","VD25C","l"},


		{"label","VD25B"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},




		 {"ns1","So it’s a deal!  I am looking forward to riding for the City! So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P2VD2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VD25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Look, I’ve had just about enough of you for now. We are done negotiating. There is a crisis that demands attention- and frankly, your haggling makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P2VD2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VD25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VD25D"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},




		 {"ns1","Finally! Now let’s not waste any time, pard’ner.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P2VD2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VD25RENEGCHECK"},
		{"if","reneg","<",2,"VD25RENEG"},
-- Peter		{"label","VD25E"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Look, pard’ner, I have had it with you.  This negotiation is over.  Come back when you have contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P2VD2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VD2ATD1"},
 {"ns1","Howdy, pard’ner!  I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P2VD2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VD3ASD1"},
 {"ns1","What in Sam hill are you doing here?  The City needs our services.  Hurry back with a contract from City Hall as soon as you can!  Remember, my price is $%d.  I’ll see you back here soon!","VS_T2P2VD3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Howdy!  It’s nice to see you back here - I am so anxious to get started providing the City with their logistics needs that I can hardly ride a bull! Did you come with that contract for me to sign? ","VS_T2P2VD3_01.ogg"},
	 {"pg","Yes, I have it right here.","VD32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


		{"label","VD31B"},
		 {"ns","Alright then. I’ll just camp out while you get a contract – and then I’ll see you back here at the ranch! ","VS_T2P2VD3_02.ogg"},
		 {"pg","Sounds good.  See you soon!","END"},

		{"label","VD32X"},
			{"fun",incmayor},
			{"fun",incmayor}, -- BChance: Added 2nd call so that mayor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incvendor4},
			{"fun",talkedtovendor4},
			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"mickeytrap",1},
			{"fun",incmickey},
			{"if","contractcost",">","cost","VD32A"},--PRICE TOO HIGH
			{"if","contractcost","<","cost","VD32B"},--BEING TOO LOW
			{"goto","VD32C"},--CORRECT PRICE


		{"label","VD32A"},
		 {"fun",takemarkup},
		 {"ns","Okay, let’s have a look here then, shall we?  Okay….mm-hmm….well hoo-ey! Look at that!  The city sure is being generous. That’s even more than I asked for!! I am happy to sign this. Here you go, pard’ner!","VS_T2P2VD3_03.ogg"},
		 {"pg","Thanks, I guess…","VD33A"},
		 -- costa:Set to CC


		{"label","VD32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! What kind of bull are you trying to ride in here? ","VS_T2P2VD3_04.ogg"},
		 {"pg","I am sorry…","VD32D"},

			{"label","VD32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am sorry, but my attorney is going to have something to say about this.  Hello, Dusty?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You must bring this new contract to your client in order to get started.","VS_T2P2VD3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VD32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F","b"},
			
				{"label","VD32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now…","VS_T2P2VD3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


				{"label","VD32F"},
				-- scoreb:-SG
				 {"ns","I’m relieved you understand this is the only way we can move forward, pard’ner.  Look, the new contract is already coming through the fax machine.  Here you go!","VS_T2P2VD3_11.ogg"},
				 {"pg","Alright. I understand, I guess.","VD33A"},


		{"label","VD32C"},
		 {"ns","Well let’s have a look then, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go, pard’ner!","VS_T2P2VD3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VD33A"},


	{"label","VD33A"},
	 {"ns","Well hot-diggity! I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P2VD3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VD3ATD1"},
 {"ns","Why are you still on the ranch, pard’ner? Get back to City Hall and get the Mayor to countersign that contract.  We need to get started - the future of our City is at stake!","VS_T2P2VD3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
