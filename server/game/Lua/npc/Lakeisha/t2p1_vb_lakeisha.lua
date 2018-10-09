local dialogtext = {
{"if","vendor","==",2,"ifs"},
{"if","vendor","~=",0,"VBBONUS"},
{"label","ifs"},
	{"if","vendor2progress","==",0,"VB1ASD1"},
	{"if","vendor2progress","==",1,"VB11A"},
	{"if","vendor2progress","==",2,"VB1ATD1"},
	{"if","vendor2progress","==",3,"VB1ASD2A"},
	{"if","vendor2progress","==",4,"VB2ASD1"},
	{"if","vendor2progress","==",5,"VB21A"},
	{"if","vendor2progress","==",6,"VB2ATD1"},
	{"if","vendor2progress","==",7,"VB3ASD1"},
	{"if","vendor2progress","==",8,"VB31A"},
	{"if","vendor2progress","==",9,"VB3ATD1"},
	{"if","vendor2progress","==",10,"VB3ATD1"},

{"label","T1P4VB1"},


--**************
--Chose Someone else
--**************

{"label","T2P1VB1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VBBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VB1ASD1"},
 {"ns","Do you need help, or are you just browsing? ","VS_T2P1VB1_10.ogg"},
 {"pg","No, thanks, I am just looking.","END"},
 {"pg","Hey, you’re Lakeisha! I’ve heard of you! ","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Welcome to Can’t Get Enough Media! I’m Lakeisha. Do you need help, or are you just browsing?","VS_T2P1VB1_01.ogg"},
	 {"pgs","Actually, the City is looking for a spokesperson who can comprehend multiple issues which you demonstrate on your radio show. ","VB11B","a"},
	 {"pgs","Actually, the City is looking for a spokesperson, although I am concerned you have a history of antagonism with some of the local charities.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well right on! It’s good to know that you have been following my career – and I am flattered to be considered.  So, tell me what brings you here. ","VS_T2P1VB1_02.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts.","VB12A"},

		{"label","VB11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","You should check the show’s ratings, because I think we are pretty popular. Well, no matter - just go on and tell me why you are here. ","VS_T2P1VB1_03.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts..","VB12A"},


	{"label","VB12A"},
	 {"ns","What a coincidence! My producer and I were just discussing how I should get involved. So why did you think of me when you were told to look for a spokesperson?","VS_T2P1VB1_04.ogg"},
	 {"pgs","Well I hear that you have had several celebrities on your show that you could convince to lend their support.","VB12B","c"},
	 {"pgs","Well I hear you display a quick tongue and a sharp wit on her your radio program, which could really help us out here.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","I’m not so sure you’re tuned in here, because that’s not really accurate.  I don’t really do interviews with what you would call “traditional” celebrities.  But no matter -- I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P1VB1_05.ogg"},
		 {"pg","Okay, great!","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well, you certainly have followed my career closely - you  seem to know your stuff!  Anyway, we have a crisis on our hands – so if you need me, I am happy to take off some hours here at the store and focus on the City’s needs.","VS_T2P1VB1_06.ogg"},
		 {"pg","I am happy to hear you are available, Lakeisha.","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","Right then, if you’ll excuse me, I have to get to the station to do a show in a few minutes.  Is there anything else you need?","VS_T2P1VB1_07.ogg"},
	 {"pgs","I will have to think about that. In the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VB13B","e"},
	 {"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I may sound tough on the air – but the environment is a soft spot for me.  I’ll consider your position when I figure out what I will need for the job. Well then, I hope to see you again! Now if you’ll excuse me, I have to prepare for a broadcast…","VS_T2P1VB1_08.ogg"},
		 {"pg","Thanks Lakeisha.  I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","What do you mean ‘donation’?  It sounds like payola to me!  The City should hire me because I am the best vendor available – not because I give out kickbacks! ","VS_T2P1VB1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VB1ATD1"},
 {"ns","Thanks for stopping by, then! If you decide you want me as a spokesperson, just come back and we’ll talk about the details!","VS_T2P1VB1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Hello again!  You just caught me on my way out to the station.  So are you here to get me to start working as a spokesperson for the City’s relief and recovery efforts?","VS_T2P1VB1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VB1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VB1ASD2B","g"},
	 
		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with public representation - just to be sure.","VS_T2P1VB1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward.","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VB2ASD1"},
 {"ns","What are you doing here? You have a critical task to take care of!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P1VB2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Welcome back! You must be here to talk about the spokesperson gig. That’s good, because we need to act right away before things get out of hand!  So did the Mayor approve your decision to hire us?","VS_T2P1VB2_01.ogg"},
	 {"pgs","That’s right, I have decided to hire you because your commentary and media reviews indicate that you have a knack for grasping complex issues.","VB21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VB21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the City considering your reputation as a mature broadcaster of character and integrity.","VB21D","b"},
	 {"pgs","Yes, I have.  I am excited to see what you can do for the City considering your broad experience doing advocacy work.","VB21D","b"},


		{"label","VB21B"},
		 {"ns","Well, I have a little while before I have to go prepare for my evening broadcast, so I’ll see you back here when you are ready to negotiate.  ","VS_T2P1VB2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VB21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","With those kinds of facts at your fingertips, you should be a news announcer!  It’s clear that the City needs help, so tell me what you are looking for me to do.","VS_T2P1VB2_03.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts throughout the duration of the crisis.","VB22A"},


		{"label","VB21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","If you were a caller on my show, I’d have a hard time letting that one go!  Have you actually looked into my career? Anyway, we have no time to waste - so just tell me what you are looking for me to do.","VS_T2P1VB2_04.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts throughout the duration of the crisis.","VB22A"},


	{"label","VB22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, then, to do that I would need $%d. That includes $2200 for freelance radio engineers, producers, and production assistants to create specialized broadcasts.  Also, there’s $4650 for prerecording interstitials, buying new records, and preparing New City River advocacy segments for my show.  Then, I need $2650 for  ‘New City River is #1’ T-Shirts, mugs, tote bags, foam fingers, and other items for on-air promotions and fundraisers.","VS_T2P1VB2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
	 {"pgs","I thought you normally charge clients less for the items you give away on your radio shows…","VB22B","c"},
	 {"pgs","Wait - $4650 for prerecorded interstitials?  I know for a fact you have charged less in the past for producing similar broadcast pieces!","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for items that I give away, but I was going to upgrade the items we sent to prize winners this time…well, never mind. Let’s just say I charge you the old rate; so my total price is $%d.","VS_T2P1VB2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, don’t go on the air with those ideas. If you had checked, you would have seen that I always charge the same amount for prerecording my interstitial broadcast pieces!  I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P1VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here acting like some sort of talk show bully, you know. I told you what I charge, and I do not appreciate this kind of negotiating!  I’ve heard that working for the City can be a difficult. I think I have to charge $%d for this job.","VS_T2P1VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expense is the $1500 for a grand prize giveaway for anyone who swims from the shore of the New City River to a buoy on the edge of the oil slick, and back, during the first riverside broadcast, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T2P1VB2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","Not only do you usually charge less for a grand prize giveaway – but I think the City shouldn’t pay for that sort of stunt…","VB23B","f"},
	 {"pgs","I have seen that you normally charge less for the grand prize you give away to those who perform outrageous stunts.  I think you are trying to charge us too much.","VB23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I guess you’re right.  Under these circumstances, maybe I should reconsider the exact nature of the grand prize  – and pay for it myself. You seem easy to work with -  let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P1VB2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed.  Well, I normally do charge $1000 for my grand prizes, but I was thinking of increasing them ahead of ratings week next month.  Never mind – this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P1VB2_11.ogg","cost"},
		 {"pg","I appreciate that, Lakeisha. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","If you were a caller, I’d hang up on you!  I  am offering my services as a celebrity spokesperson, and there are certain expenses I have to pay for. I know we are in a crisis, but I have my terms and you need to respect them.  You are more demanding than I thought – I think I have to charge $%d now.","VS_T2P1VB2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","So, we will need $%d to get started.  Do we have a deal?","VS_T2P1VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now that we’ve covered all your expenses – do you think you could forgo some profit since this is a crisis?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge for those freelance engineers?","VB24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I have gotten an awful lot of calls into the program about this disaster and the future of our river.  so, I am willing to compromise! I think we should lower my offer to $%d.  Agreed?","VS_T2P1VB2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, I’ve had some nasty callers to the show over the years but you’re starting to push the envelope!  I can already tell this is going to be a rough gig.  I am really going to have to adjust my plan here and charge you $%d.","VS_T2P1VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you really are starting to shock me.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P1VB2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","Now, that we are both tuned in, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P1VB2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VB25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for foam fingers…","VB25C","l"},


		{"label","VB25B"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},


		 {"ns1","Great! I’m happy to bring this cause to the airwaves. Your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P1VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VB25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","This is harder than climbing the broadcast tower!.  We are finished negotiating.  There is a crisis that demands our attention- and frankly, your haggling is just too much.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P1VB2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VB25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VB25D"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","At last!  Let’s get this thing rolling!  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P1VB2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VB25RENEGCHECK"},
		{"if","reneg","<",2,"VB25RENEG"},
-- Peter was here		{"label","VB25E"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},




		 {"ns1","This negotiation is so over!  Come back when you a have contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P1VB2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","I am ready to represent the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P1VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns","What are you doing here?  Did you leave something in the store?  We have a City to save – so hurry back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P1VB3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hey! I am happy you are back - I can’t wait to get started as the City’s spokesperson! Did you come with that contract for me to sign? ","VS_T2P1VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","Alright.  I have a few hours before my next radio program - so just come back as soon as you get a contract! ","VS_T2P1VB3_02.ogg"},
		 {"pg","Sounds good.  See you soon!","END"},

		{"label","VB32X"},
			{"fun",incmayor},
			{"fun",incmayor}, -- BChance: Added 2nd call so that mayor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incvendor2},
			{"fun",talkedtovendor2},
			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"mickeytrap",1},
			{"fun",incmickey},
			{"if","contractcost",">","cost","VB32A"},--PRICE TOO HIGH
			{"if","contractcost","<","cost","VB32B"},--BEING TOO LOW
			{"goto","VB32C"},--CORRECT PRICE


		{"label","VB32A"},
		 {"fun",takemarkup},
		 {"ns","Word!  Let’s take a look.  Okay….mm-hmm….oh, my! Look at that!  That’s even more than I asked for!! I am happy to sign this.  Here you go!","VS_T2P1VB3_03.ogg"},
		 {"pg","Thanks, I guess.","VB33A"},
		 -- costa:Set to CC


		{"label","VB32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed!  Are you serious? ","VS_T2P1VB3_04.ogg"},
		 {"pg","I am sorry…","VB32D"},

			{"label","VB32D"},
			 {"fun2",incprofit,10},
			 {"ns","Excuse me while I call my attorney about this.  Hello, Robin?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You must bring this new contract back to your client to countersign so we can get started.","VS_T2P1VB3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VB32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},
			
				{"label","VB32E"},
				 -- scorea:+SG
				 {"ns","I hear you, but my attorney has advised me that you must use the contract she drew up if you want me on board.  She insists you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now…","VS_T2P1VB3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


				{"label","VB32F"},
				-- scoreb:-SG
				 {"ns","I’m so glad that you understand this is the only way we can move forward.  Here you go!","VS_T2P1VB3_11.ogg"},
				 {"pg","Okay, thanks.","VB33A"},


		{"label","VB32C"},
		 {"ns","Well let’s take a look.   Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go!","VS_T2P1VB3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","Word! I am happy to be a part of the program!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P1VB3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","I know you aren’t here to shop – so what are you doing here? Head back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P1VB3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
