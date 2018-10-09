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

{"label","T2P1VC1"},


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
 {"ns","Are you the reporter with Rapper’s Home Journal? I am ready for the interview, if you’d like to sit.","VS_T2P1VC1_10.ogg"},
 {"pg","Oh, no, sorry.  I must be in the wrong place. ","END"},
 {"pg","Hey, you’re Grandmaster G! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Hey, come on in, welcome. You must be the reporter my publicist told me was coming. I’m Grandmaster G, and this is my recording studio. Where do you want to do the interview?","VS_T2P1VC1_01.ogg"},
	 {"pgs","Actually, the City is looking for a spokesperson – and I understand you are a gifted producer with legal experts who support you, so you should be able to handle the complexities of this particular case.","VC11B","a"},
	 {"pgs","Actually, the City is looking for a spokesperson – and I understand you are a gifted spokesperson, and local charities have given you numerous awards for your public advocacy work.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, that’s cool.  I am surprised – and happy – that you decided to think of me.  So, what brings you here?","VS_T2P1VC1_02.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Are you sure about that? I don’t think you’ve done your homework but, whatever, just go on and tell me why you are here. ","VS_T2P1VC1_03.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts.","VC12A"},


	{"label","VC12A"},
	 {"ns","Ya know?  I was just talking to my agent about how I should get involved before I leave on my next tour.  But I’m curious, what made you think of me for a spokesperson?","VS_T2P1VC1_04.ogg"},
	 {"pgs","Well I hear that you you’re a local hiphop luminary who can think on your feet.","VC12B","c"},
	 {"pgs","Well I hear that you have done advocacy work in the past, and have featured some charity causes in the past on your recordings.","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","You sound about as mixed up as my records, man.  But whatever – I’m down with the environment, and I am available if you feel I can help you.","VS_T2P1VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","OK, cool.  You’re definitely on top of it!  Anyway, I think I could really hold this down, so if you need me, I am happy to drop some of my other activities to focus on the City’s needs.","VS_T2P1VC1_06.ogg"},
		 {"pg","I am happy to hear you are available, G.","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Alright, then.  You will have to excuse me, because my publicist told me there would be a reporter coming by shortly to do an interview, and I gotta put on some different kicks. Is there anything else you need?","VS_T2P1VC1_07.ogg"},
	 {"pgs","I will have to think about that. In the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VC13B","e"},
	 {"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I am really down with the environment and our future.  I’ll certainly consider that as I figure out what I will need for this job. Well then, I hope to see you again!","VS_T2P1VC1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Did I hear you right, man??  A ‘donation’?  That aint right.  I don’t appreciate players that come up to my recording studio demanding cheddar!  The City should hire me because I am the best vendor available – not because I give out kickbacks!","VS_T2P1VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Thanks for dropping by, man! If you decide you want me as a spokesperson, just come back and we’ll talk about the details!","VS_T2P1VC1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Welcome back, dude!  So are you here to get me to start working as a spokesperson for the City’s relief and recovery efforts?","VS_T2P1VC1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","I don’t know.  Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with public representation - just to be sure.","VS_T2P1VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","You still here?  You need to bounce, man!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P1VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hey, you’re back! You must be here to talk about the spokesperson gig.  That is good, because the buzz on this is getting louder than a boom box - and we need to act right away!  So did the Mayor approve your decision to hire us?","VS_T2P1VC2_01.ogg"},
	 {"pgs","Yes.  I have decided to hire you because you have ability to understand complex issues, and a team to help you do it.","VC21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VC21B"},
	 {"pgs","Well, I’d like to do it, but I’m concerned you don’t have the popularity that we are looking for in a spokesperson.","VC21D","b"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering your work for the “Clowns without Borders” fundraiser here in New City.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","That’s cool  – so if you’ll excuse me, I gotta find my other cell phone.  I’ll see you back here when you are ready to negotiate.  Now I saw it here somewhere…","VS_T2P1VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","With that kind of recall, you should try freelancing in  in the studio with me sometime!  It’s clear the City needs help, so tell me what you are looking for me to do.","VS_T2P1VC2_03.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts through the duration of the crisis.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Look, man - you’re not going to make any friends goin’ on like that! Have you actually looked into this decision? Anyway, we have no time to waste - so speak up and tell me what you are looking for me to do.","VS_T2P1VC2_04.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Let’s get down to it: I normally charge $%d for a job like this.  First, I will need $2000 for payments to my posse, who provide moral support and personal security services, $4250 for my legal team and expert witnesses that will be helping me understand the complexities of the underlying issues, and $3250 for rental of equipment to throw a block party tp raise local awareness.","VS_T2P1VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Wait - $3250 for a block party?  I know for a fact that you have charged less for a carnival, inflatable pools, and PA equipment in the past!","VC22B","c"},
	 {"pgs","I thought that you normally charge clients less to retain your legal team and your expert witnesses.","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for block parties, but this time, I was going to get professional breakdancing clowns instead of  interns from the clown college.  Well, whatever. Let’s say I charge you the old rate; so my total price is $%d.","VS_T2P1VC2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not cool, man. If you had checked, you would have seen that I always charge the same amount for my legal team for each gig I do!  I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P1VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here showboatin’ like that, you know. I just told you what I charge, and I do not appreciate your negotiating style!  I heard the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P1VC2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, so the remainder of my expense is the $1500 in track suits, sneakers, and professional styling in order to prepare for upcoming public appearances, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T2P1VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Not only do you usually charge less for your gear and your implants – but you already have plenty of gold teeth! You shouldn’t charge for that!","VC23B","f"},
	 {"pgs","I have seen that you normally charge less for your gear, styling, and periodontic work.  I think you are trying to charge us too much.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point.  Seeing as how things are tight, maybe I should stay with my latest kicks – and pay for it myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P1VC2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed.  Well, I normally do charge $1000 for my gear and my pro styling…but I was thinking of custom ordering my track suits from a more expensive manufacturer.  Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P1VC2_11.ogg","cost"},
		 {"pg","I appreciate that, G. Thanks.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Keep that up and I’ll be dissing you on my next record!  I am offering to represent you in public, and that means certain expenses must get paid. I know we are in a crisis, but I can’t be bullied into a bad deal.  You are more demanding than I thought – I think I am going to have to charge $%d now.","VS_T2P1VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Right then, so I will need $%d to get started.  Do we have a deal?","VS_T2P1VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now that we’ve covered all your expenses – do you think you could forgo some profit since this is a crisis situation??","VC24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – why do you have to pay your team so much money?","VC24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","I was just talking to some of my boys and we were discussing how this disaster will affect the future of our city. Because this is an ecological crisis, I am willing to talk! I think I can lower my offer to $%d.  Agreed?","VS_T2P1VC2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now that just isn’t fair. You know, you ought to treat people right and quit showboatin’!.  I can already tell the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P1VC2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","You’re takin’ this showboatin’ too far!.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P1VC2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","So it seems like we’re in a groove, now.  My price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P1VC2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VC25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for a block party…","VC25C","l"},


		{"label","VC25B"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","Ok, so we’re good! I’m down to have the City’s back on this.  So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P1VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Look, man this is startin’ to be a jive situation.  We are done negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P1VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VC25D"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","It’s about time, Showboat! Now, there is no time to waste.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P1VC2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},
-- Peter was here		{"label","VC25E"},
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","I’m not down with this!  .This negotiation is over.  Come back when you have a contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P1VC2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I am ready to step up for the City, but we’ve got to roll.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P1VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns","What are you doing here, man?  We have a City to save – so hurry back with a contract from City Hall as soon as you can!","VS_T2P1VC3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hey, man I’m happy to see you back - I am really down for getting’ started as the City’s spokesperson! Did you come with that contract for me to sign? ","VS_T2P1VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Alright then.  Just come back as soon as you get a contract! ","VS_T2P1VC3_02.ogg"},
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
		 {"ns","Okay, let’s check it out.  Okay….mm-hmm….oh, my! Look at that!  The city sure is sweetening the pie! That’s even more than I asked for!! I am happy to sign this.  Here you go!","VS_T2P1VC3_03.ogg"},
		 {"pg","Thanks, I guess","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! Where are you coming from, man? ","VS_T2P1VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am going to have to call my attorney about this.  Yo, Jig?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You’re going to have to bring this new contract back to your client – okay?","VS_T2P1VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I dig, but my attorney tells me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  ","VS_T2P1VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","Dude, I’m real glad that you understand this is the only way we can move forward.  Here you go!","VS_T2P1VC3_11.ogg"},
				 {"pg","Alright. I understand, I guess.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well let’s check it out.  Okay….uh huh….mm hmmm…well now, this looks cool.  Here you go!","VS_T2P1VC3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","Cool!  I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P1VC3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","What are you doing here, dude? Get back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P1VC3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
