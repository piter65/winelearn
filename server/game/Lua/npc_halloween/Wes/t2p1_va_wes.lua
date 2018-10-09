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

{"label","T2P1VA1"},


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
 {"ns","Oi, have we met?  ","VS_T2P1VA1_10.ogg"},
 {"pg","Pardon me, I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Wes Berlin! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Oi, mate! I see you’ve found your way into my basement. I’m Wes Berlin. Are you a Shrapnel fan looking for a T-Shirt?","VS_T2P1VA1_01.ogg"},
	 {"pgs","Actually, Wes, I am looking for a spokesperson, and I hear you have a deep understanding of complex issues. ","VA11B","a"},
	 {"pgs","Actually, Wes, I am looking for a spokesperson -although I am not sure New City residents appreciate your loud public performances.","VA11C","b"},

		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Right, mate! It’s a good thing you thought of me, then!  So, tell me what brings you here. ","VS_T2P1VA1_02.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts.","VA12A"},

		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Are you sure you got that straight, mate? I don’t quite think you know what yore talking about! Well, no matter - just go on and tell me why you are here. ","VS_T2P1VA1_03.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts..","VA12A"},


	{"label","VA12A"},
	 {"ns","Me an’ my band mates was just discussing how we wanted to get involved after we heard about the disaster.  So what made you think of me when you started looking for a spokesperson?","VS_T2P1VA1_04.ogg"},
	 {"pgs","Well I hear that you have had several hit records, and you are known to people as a local musician and rock star.","VA12B","c"},
	 {"pgs","I hear that you have the ability to confidently handle yourself in situations where improvisation is called for.","VA12C","d"},

		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Oi, mate, it sounds like you’ve got a screw loose.  Where’d you get that idea?  But, no matter -- I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P1VA1_05.ogg"},
		 {"pg","Okay, great!","VA13A"},


		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Oi! That seems like a good reason to me, mate - you certainly seem to know your stuff!  Anyway, I could really rock a gig like this – so if you need me, I am happy to drop all of my gigs and focus on the City’s needs.","VS_T2P1VA1_06.ogg"},
		 {"pg","I am happy to hear you are available, Wes.","VA13A"},


	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","Right then, if you’ll excuse me, I’ve got to start posting flyers for next week’s headbanger.  Is there anything else you need?","VS_T2P1VA1_07.ogg"},
	 {"pgs","I will have to think about that. In the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VA13B","e"},
	 {"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VA13C","f"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Not to change the tune or anything, mate, the environment is a serious concern to me.  I’ll consider that when I figure out what I will need for this job. Well then, I hope to see you again, mate!","VS_T2P1VA1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Oi!  What do you mean, ‘donation’?  That’s right cheeky of you , mate!.  I do not take kindly to fans that come down to my basement demanding I hand over a few quid for nothing!  The City should hire me because I am the best vendor available – not because I give out kickbacks!","VS_T2P1VA1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thanks for stopping by, then, mate! If you decide you want me as a spokesperson, just come back and we’ll talk about then details!","VS_T2P1VA1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","Welcome back, mate!  So are you here to get me to start working as a spokesperson for the City’s relief and recovery efforts?","VS_T2P1VA1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VA1ASD2B","g"},
	 
		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that, mate? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I become the spokesperson for the city - just to be sure.","VS_T2P1VA1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VA2ASD1"},
 {"ns","What are you doing here mate? You have a right important task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work out the details of the arrangement.","VS_T2P1VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Oi, mate! You must be here to talk about the spokesperson gig. That’s great, because the flap over the disaster is getting louder than a Shrapnel show -- and we need to act right away!  So did the Mayor approve your decision to hire us?","VS_T2P1VA2_01.ogg"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering you have a deep rooted understanding of many of the complex issues underlying the local environmental causes that you advocate.","VA21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VA21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering the work you did with KNCR to raise support.","VA21D","b"},
	 {"pgs","Well, I’d like to do it, but I’m concerned that you are not able to confidently handle yourself in situations where improvisation is called for.","VA21D","b"},


		{"label","VA21B"},
		 {"ns","Right then, mate!  I’ll see you back here when you are ready to negotiate.  ","VS_T2P1VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Crikey!  With that kind of memory and attention to detail, you ought to be a bandleader, mate!  It’s clear that the City needs help, so speak up and tell me what you want from me.","VS_T2P1VA2_03.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts through the duration of the crisis.","VA22A"},


		{"label","VA21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Oi, mate, that’s right cheeky.  You’re not gonna make many friends trash talkin’ people! Have you actually looked into this decision? Anyway, we have no time to waste - so speak up and tell me what you want from me.","VS_T2P1VA2_04.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts through the duration of the crisis.","VA22A"},


	{"label","VA22A"},
	 {"fun",halfcost},
	 {"ns1","OK, let’s talk business: I normally charge $%d for a job like this.  First, I will need $2500 for concert t-shirts and CD’s to give away to fans at public events.  Then, I will need $4150 for microphones, PA speakers and cabling for the band to play performances in support of the disaster. Finally, I need $2850 for a speech coach to help me with…errr, my English.","VS_T2P1VA2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pgs","I thought that you normally charge less for your speech coach!","VA22B","c"},
	 {"pgs","Wait - $4150 for microphones and cabling?  I know for a fact you have charged less for those in the past!","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},

		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for a speech coach, but I was going to hire a speech therapist from the university in this particular case…well, never mind. Let’s just say I charge you the old rate; so me total price is $%d.","VS_T2P1VA2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},

		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you had checked, you would have seen that I always charge the same amount for new mics, cabling, and PA speakers for each gig!  I can tell now that you City people are a cheeky lot. You know, I really should be charging $%d for this.","VS_T2P1VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VA23A"},
		 -- costa:PLUS


		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Oi, mate!  Now your acting like a real nutter. I just told you what I charge, and I’m not liking your negotiating style one bit!  I’ve heard that you City lot can be a cheeky bunch - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P1VA2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VA23A"},


	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expenses is the $1500 I need for a giant tattoo on me back commemorating all the baby seals affected by the disaster, which brings us to $%d. So that’s me offer.  Do we have a deal?","VS_T2P1VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Not only do you usually charge less for tattoos – but there aren’t any seals living in the New City River! You shouldn’t charge us for that! Need to reword looks ok to me","VA23B","f"},
	 {"pgs","I have seen that you normally charge less for your tattoos.  I think you are trying to charge us too much.","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},

		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Right.  Now that you mention it, I think you’ve got a point.  Under the desperate circumstances, maybe I should get a tattoo of something else – and pay for it myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P1VA2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well done, mate, you noticed.  Well, I normally do charge $1000 for tattoos, but I was thinkin’ of getting a much larger one this time that’s really colorful.  Never mind – because this is an emergency, I will charge you the standard rate – so me price is set at $%d. What do you say?","VS_T2P1VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Wes. Thanks.","VA24A"},

		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Come on, mate! I am offering to represent you in public, and that means there are certain expenses I must pay for. I know we are in a crisis, but I won’t be bullied into making a bad deal for this gig.  You’re cheekier than I thought – I think I am going to have to charge $%d now.","VS_T2P1VA2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","Right then, mate, so I will need $%d to get started.  Do we have a deal?","VS_T2P1VA2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VA25B"},
	 {"pgs","Now that we’ve covered all your expenses –do you think you could forgo some profit since this is a crisis situation,?","VA24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge for those T-Shirts?","VA24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","Me an’ my mates was actually talking about this disaster and the future of our river…and of course, all the baby seals. Because this is an ecological crisis, so I’m willing to compromise! I think we should lower our offer to $%d.  Agreed?","VS_T2P1VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Come on, mate!  Actin’ like a nutter won’t get you anywhere with me.  I can already tell the City is going to be a very cheeky client, and I am really going to have to adjust me plan here and charge you $%d.","VS_T2P1VA2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Crikey!  It’s never ending!  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is with the way it’s going to be, I am going to have to charge you $%d.  And, honestly? I’m done negotiating!","VS_T2P1VA2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


	{"label","VA25RENEG"},
	{"fun2",incprofit,2},

	{"label","VA25A"},
	 {"ns1","I am glad we’re finally in the same cricket match, then, mate. Me price is $%d, and that’s the final offer.  How does that grab you, mate?","VS_T2P1VA2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VA25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for microphones…","VA25C","l"},


		{"label","VA25B"},
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","Right then, mate! I am happy to be a part of this gig. So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!  Cheers!","VS_T2P1VA2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Oi, this has gone a bit too far.  I think it’s safe to say we’re done negotiating.  There is a crisis that demands our attention- and honestly, your cheeky haggling makes you seem like the kind of nutter I try to avoid.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P1VA2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VA25D"},
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","Right, then!  There is no time to waste.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P1VA2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VA25RENEGCHECK"},
		{"if","reneg","<",2,"VA25RENEG"},

-- Peter was here		{"label","VA25E"},
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","Blimey!  This negotiation is over.  Come back when you have a contract for….you know what?  I don’t want to see your mug again until you have a contract for me for $%d. Now, get going before I change me mind!","VS_T2P1VA2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.   Is this correct?","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VA2ATD1"},
 {"ns1","Hey, mate.  I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P1VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns","What are you doing here, mate?  We have a City to save – so hurry back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P1VA3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Oi, mate!  ‘S right good you’re back - I can’t wait to get started as the City’s spokesperson!  Have you got that contract for me to sign? ","VS_T2P1VA3_01.ogg"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


		{"label","VA31B"},
		 {"ns","Alright then, mate.  Just come back as soon as you get a contract! ","VS_T2P1VA3_02.ogg"},
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
		 {"ns","Right, let’s have a look then.  Okay….mm-hmm….oh, my! Look at that!  The city sure is being generous. That’s even more than I asked for!!  I’m bloddy happy to sign this.  Here you go, mate!","VS_T2P1VA3_03.ogg"},
		 {"pg","Thanks, I guess","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  Oi!  This isn’t what we talked about! What kind of shenanigans are you up to, mate? ","VS_T2P1VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},

			{"label","VA32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am going to have to call my solicitor about this.  Hello, Ian?  Yeah, they…uh-huh…okay. Look, my guy will send over a contract with the right numbers. You must bring this new contract back to your client to countersign to get started.","VS_T2P1VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VA32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},
			
				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my solicitor has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  ","VS_T2P1VA3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},


				{"label","VA32F"},
				-- scoreb:-SG
				 {"ns","It’s great that you understand that this is the only way we can move forward, mate.  Here you go!","VS_T2P1VA3_11.ogg"},
				 {"pg","Alright. I understand, I guess.","VA33A"},


		{"label","VA32C"},
		 {"ns","Well let’s have a look then.  Okay….uh huh….mm hmmm…well now, this looks fine. Here you go, mate!","VS_T2P1VA3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},


	{"label","VA33A"},
	 {"ns","Right then, mate! I am bloody happy to be a part of this team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P1VA3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VA3ATD1"},
 {"ns","Oi! What are you doing here, mate? Get back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P1VA3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
