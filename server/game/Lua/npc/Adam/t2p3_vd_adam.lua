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

{"label","T2P3VD1"},


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
 {"ns","Well, hello there.  I’d be careful looking around here if I were you.  Most of this stuff is radioactive.  ","VS_T2P3VD1_10.ogg"},
 {"pg","Oh, then pardon the interruption. I had better get going.","END"},
 {"pg","Hey, you’re Adam Baum! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VD11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		{"fun3",setvar,"scoreconvo","vd1"},
	 {"ns","Hello!  Welcome to Dis-Po Corp.  I’m Adam Baum.  Come right in, just don’t stand too close to me, cause I’ve been, well let’s just say I’ve been a little over exposed. ","VS_T2P3VD1_01.ogg"},
	 {"pgs","Thanks for the warning, Adam.  I am looking for waste recovery and disposal services, and I hear you have a unique hands-on approach to recovering hazardous and toxic materials.","VD11B","a"},
	 {"pgs","Thanks for the warning, Adam.  I am looking for waste recovery and disposal services and I understand you recently recovered and safely disposed of a toxic waste spill in Rosenfield.","VD11C","b"},

		{"label","VD11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, it sounds like you are in trouble and have come to the right place!  This sounds like a job for….actually, hold on what brings you here, exactly? ","VS_T2P3VD1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River.  The City asked my team to find a firm to participate in the recovery by providing waste recovery and disposal services.","VD12A"},

		{"label","VD11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, not to change the subject, but it seems like you may be in trouble!  This sound like a job for….wait, hold on.  Why don’t you tell me what brings you here?","VS_T2P3VD1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River.  The City asked my team to find a firm to participate in the recovery by providing waste recovery and disposal services.","VD12A"},


	{"label","VD12A"},
	 {"ns","Well, then this truly sounds like a job for….Dis-Po Corp!  Faster than a beta particle, stronger than a thermo-nuclear blast, able to….well, actually, hold on again.  Why did you think of us, exactly, when you were told to find a waste recovery and disposal firm?","VS_T2P3VD1_04.ogg"},
	 {"pgs","I hear that you are an innovator in technology that aids and assists hazardous materials recovery.","VD12B","c"},
	 {"pgs","Yes, Adam, I appreciate that you are known as both an outdoor enthusiast and a conservationist.","VD12C","d"},

		{"label","VD12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, that’s possibly the nicest thing anyone has said to me since…well, since…since... oh whatever.  At any rate, you have the idea.  I understand why you’re here  and I feel strongly about the environment, so I’ll be available if you think we can help, somehow.","VS_T2P3VD1_05.ogg"},
		 {"pg","Okay, great!","VD13A"},


		{"label","VD12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","You certainly seem to know a pro when you see one, don’t you?  Now, we have a crisis on our hands so if you need me, I am happy to drop my less critical responsibilities and focus on the City’s needs.","VS_T2P3VD1_06.ogg"},
		 {"pg","Alright then, let’s continue","VD13A"},


	{"label","VD13A"},
	{"fun", incinterv},
	 {"ns","Right then, if you’ll excuse me, I was just in the middle of polishing my uranium samples.  Is there anything else you need?","VS_T2P3VD1_07.ogg"},
	 {"pgs","No, that’s about it,  but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VD13B","e"},
	 {"pgs","No, but before I go, it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VD13C","f"},

		{"label","VD13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Of course!  I understand that the City is in trouble and that our land and our water are at stake!  One glowing location in New City is enough.  I’ll certainly consider that as I figure out what I will need to take on this responsibility.  Well then, I hope to see you again!","VS_T2P3VD1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VD13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Umm, excuse me?  What do you mean by a ‘donation’?  I do not take kindly to mere mortals walking into my headquarters looking for “donations”!  The City should hire me because I am the best vendor available, not because I succumb to this kind of pressure!","VS_T2P3VD1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VD1ATD1"},
 {"ns","Ok, well thanks for stopping by!  If you decide you want me to handle the spill recovery and disposal for the mess in the River, just come back and we’ll talk about the details!","VS_T2P3VD1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more, but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VD1ASD2A"},
	 {"ns","Welcome back!  So are you here because you decided the City’s recovery and disposal efforts are a job for Dis-Po Corp?","VS_T2P3VD1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VD1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B","g"},
	 
		{"label","VD1ASD2B"},
		-- scoreb:-SS
		 {"ns","Honestly?  I’ve never seen a toxic mess that I didn’t want to clean up but you don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start any recovery and disposal, just to be sure.","VS_T2P3VD1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},

		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VD2ASD1"},
 {"ns","What are you doing back here? You have a critical mission to take care of!  Get approval from Mayor Gonzalez to hire me and then come back here so we can work on the details of the arrangement.","VS_T2P3VD2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VD21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Welcome back!  You must be back because you decided to get started with the waste recovery and disposal.  I am sure that’s best, because the spill is spreading like Iodine isotopes, and we need to act right away!  So did the Mayor approve your decision to hire me?","VS_T2P3VD2_01.ogg"},
	 {"pgs","Yes, Adam, we are hopeful because of your reputation as being immune to the effects of even the most toxic hazardous waste spills. ","VD21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VD21B"},
	 {"pgs","Yes, Adam.  We think your access to specialty equipment will be of great use during the City’s recovery efforts. ","VD21D","b"},
	 {"pgs","Yes,Adam, we are going to go with you – even though you may have a reputation for conservationism or for successfully advocating environmental causes.","VD21D","b"},


		{"label","VD21B"},
		 {"ns","Well okay then!  I have to go and bifurcate my U-238 samples downstairs, anyway, so just come back here when you are ready to negotiate.  ","VS_T2P3VD2_02.ogg"},
		 {"pg","Sure thing!  Bye!","END"},


		{"label","VD21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Well, you sure seem to be on top of things!  With that kind of eye for detail, you should work in environmental protection!  It’s clear the City needs help, so tell me what you are looking for me to do.","VS_T2P3VD2_03.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VD22A"},


		{"label","VD21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Now, hold on just a second.  I think I am a little confused.  I thought this was a job for….well anyway, you don’t need to explain yourself.  Just tell me what you are looking for me to do.","VS_T2P3VD2_04.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VD22A"},


	{"label","VD22A"},
	 {"fun",halfcost},
	 {"ns1","Well, in that case, I will need $%d to save you.  This includes $4000 for spools of netting and freezer wrap, and the straws and colanders I will use to perform the recovery.  There’s also a $3000 charge for forklift palettes, used soda bottles,, small plastic containers and paper cups to store recovered oil. Then I need $2500 to bus in volunteers, college interns, and convicts from the State prison to assist in the recovery. ","VS_T2P3VD2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
	 {"pgs","I thought you normally charge less for bussing in your recovery and disposal personnel!","VD22B","c"},
	 {"pgs","Wait - $3000 for used soda bottles, small plastic containers, and straws?  Isn’t that a little much?","VD22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal","e"},

		{"label","VD22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, I normally do charge less for the bus-ins, but I was going to rent some first-class air conditioned busses for this particular project.  Never mind, let’s just say I charge the old rate; so my total price is $%d.","VS_T2P3VD2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VD23A"},

		{"label","VD22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That’s not right!  If you had checked, you would have seen that I always charge the same amount for supplies!  Do you know how many straws and small plastic containers it takes to recover an entire oil spill?  I can tell that the City is going to be a difficult client.  I should charge $%d for this.","VS_T2P3VD2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VD23A"},
		 -- costa:PLUS


		{"label","VD22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here and act like some sort of hero from another cleanup, you know.  I told you what I charge and I do not appreciate being haggled with!  I heard the City can be difficult.  Now I know why!  As a matter of fact, I think I have to charge $%d for this job.","VS_T2P3VD2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VD23A"},


	{"label","VD23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expenses is the $1500 I need for ultra-rare power plant-grade Uranium isotopes, which I will purchase from an online auction house.  So that brings us to $%d.  Do we have a deal?","VS_T2P3VD2_09.ogg","cost"},
	 {"pg1","$%d?  It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
	 {"pgs","Wait, not only do you usually charge less for your radioactive rocks, but isn’t that illegal?  It isn’t right to charge a client for that!","VD23B","f"},
	 {"pgs","I have seen that you normally charge less for uranium samples.  I think you are trying to charge us too much.","VD23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense.  How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal","h"},

		{"label","VD23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I think you have a point there.  Under the desperate circumstances, maybe I should rethink how much I am spending on my radioactive isotope collection and start refining uranium myself.  I think you might be ok to work with.  Let’s just say I reduce my profit margin and charge you $%d, total.  Is that fair?","VS_T2P3VD2_10.ogg","cost"},
		 {"pg","Thanks, Adam.  That would be great. ","VD24A"},


		{"label","VD23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed.  Well, I would charge $1000 for those samples, but I was going to have it ordered express delivery.  Never mind, because this is an emergency, I will charge you the standard rate, so my price is set at $%d.  What do you say?","VS_T2P3VD2_11.ogg","cost"},
		 {"pg","I appreciate that, Adam. Thanks.","VD24A"},

		{"label","VD23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Now you are really starting to sound like some sort of oddball.  I am offering to recover and dispose of the oil spill, which means certain expenses must be paid!  This is a crisis, but I’m not going to get pushed into a bad deal.  You seem very demanding.  I think I may need $%d to do this project.","VS_T2P3VD2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VD24A"},


	{"label","VD24A"},
	 {"ns1","Right then, so that brings us to $%d to get started.  What do you say?  Is this a job for…Dis-Po Corp?","VS_T2P3VD2_13.ogg","cost"},
	 {"pg","Yes, Adam, we have ourselves a deal!","VD25B"},
	 {"pgs","Now that we’ve covered all your expenses and considering that this is a crisis, do you think you could forgo some profit?","VD24B","i"},
	 {"pgs","Before we go ahead, I have to ask, are you sure you have to charge so much for spools of netting and plastic wrap?","VD24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

		{"label","VD24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, when I was downstairs before, bifurcating my U-239 samples, I was just thinking about how this disaster will impact people in the area.  Because this is an ecological crisis, I am willing to compromise!  I think we should lower my offer to $%d.  Agreed?","VS_T2P3VD2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VD25A"},


		{"label","VD24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now, look here.  You ought to show some manners otherwise people will think you’re some sort of space case.  I can tell that the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P3VD2_15.ogg","cost"},
		 {"pg","My apologies.  I must have gotten my facts mixed up.","VD25A"},


		{"label","VD24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you are the one starting to act as if you’re invincible.   We just went over my expenses, and we agreed on everything!  As much as I want to help the City, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P3VD2_16.ogg","cost"},
		 {"pg","My apologies.  I must have gotten my facts mixed up.","VD25A"},


	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

	{"label","VD25A"},
	 {"ns1","Ok!  My price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P3VD2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VD25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for bussing in volunteers.  Do you think we need that many?","VD25C","l"},


		{"label","VD25B"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","So it’s a deal!  Dis-Po Corp, to the rescue!  So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P3VD2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VD25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Look, you’re really pushing it.  We are done negotiating.  There is a crisis that demands attention and frankly, your haggling makes you very challenging to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P3VD2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VD25D"},
		 {"pgs","I don’t know.  I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
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


		 {"ns1","Finally!  Now let’s not waste any time, then, trusty sidekick!  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P3VD2_20.ogg","cost"},
		 {"pg","Great!  I am going to go to Will Standon at City Hall to get papers drawn up.  Thanks for your time!","END"},

		{"label","VD25RENEGCHECK"},
		{"if","reneg","<",2,"VD25RENEG"},
-- Peter was here		{"label","VD25E"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Look, I have had it with you.  This negotiation is over.  Come back when you have contract for me for $%d.  Now, get going before I change my mind!","VS_T2P3VD2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then!  I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VD2ATD1"},
 {"ns1","Hello again, intrepid one!  I am ready to save the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P3VD2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VD3ASD1"},
 {"ns","My trusty sidekick!  Why no contract?  The City is in trouble….and this is a job…..well, you know, so hurry back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P3VD3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Well, if it isn’t my new sidekick!  I am so anxious to get started providing the City with their disposal needs that I think I am starting to glow!  Did you come with that contract for me to sign? ","VS_T2P3VD3_01.ogg"},
	 {"pg","Yes, I have it right here.","VD32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


		{"label","VD31B"},
		 {"ns","I guess I’ll just stand around and irradiate here until you come back with a contract! ","VS_T2P3VD3_02.ogg"},
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
		 {"ns","Okay, let’s take look at the contract.  Okay….mm-hmm….Well, look at that!  The City budget must have been passed.  That’s even more than I asked for!  I am happy to sign this, here you go!","VS_T2P3VD3_03.ogg"},
		 {"pg","Thanks, I guess…","VD33A"},
		 -- costa:Set to CC


		{"label","VD32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed!  You aren’t trying to double cross…..Dis-Po Corp! Are you?  What kind of feat are you trying to pull off here? ","VS_T2P3VD3_04.ogg"},
		 {"pg","I am sorry…","VD32D"},

			{"label","VD32D"},
			 {"fun2",incprofit,10},
			 {"ns","My attorney is definitely going to have something to say about this.  Hello, Clark?  Yeah, they…uh-huh…okay.  Look, my lawyer will send over a contract with the right numbers.  You must bring this new contract to your client in order to get started.","VS_T2P3VD3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VD32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F","b"},
			
				{"label","VD32E"},
				 -- scorea:+SG
				 {"ns","I understand where you’re coming from, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He says you have to get the Mayor to sign it because it has the service fee we agreed on.  ","VS_T2P3VD3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


				{"label","VD32F"},
				-- scoreb:-SG
				 {"ns","I’m glad you’re clear that this is the only way we can move forward.  Here you go!","VS_T2P3VD3_11.ogg"},
				 {"pg","Alright.  I understand, I guess.","VD33A"},


		{"label","VD32C"},
		 {"ns","Well let’s have a look then, shall we?  Okay….uh huh….mm hmmm…well now, this looks glowing.  Here you go!","VS_T2P3VD3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VD33A"},


	{"label","VD33A"},
	 {"ns","Well I am so happy to be a part of the team I may start to glow!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P3VD3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me, I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VD3ATD1"},
 {"ns","What are you doing with that contract?  Get back to City Hall and get the Mayor to countersign it.  The future of our City is at stake! And  this is a job for…..Dis-Po Corp!","VS_T2P3VD3_08.ogg"},
 {"pg","Yes, thanks, I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
