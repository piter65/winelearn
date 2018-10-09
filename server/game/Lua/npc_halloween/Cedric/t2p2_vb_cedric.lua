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

{"label","T2P2VB1"},


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
 {"ns","Do you have an appointment with a logistics specialist, or are you here to speak before Elliot County Council for the Endowment of the Martial Arts? ","VS_T2P2VB1_10.ogg"},
 {"pg","No, thanks, I am just looking.","END"},
 {"pg","Hey, you’re Cedric! I’ve heard of you! ","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Welcome to Force One! I’m Cedric Maxwell, sensei and CEO. Are you here for the crime fighting seminar? Where is your gee?","VS_T2P2VB1_01.ogg"},
	 {"pgs","Actually, the City is looking for a logistics firm – and I am confident there may be a good fit between us, as you have demonstrated the ability to handle many different crisis relief scenarios.","VB11B","a"},
	 {"pgs","Actually, the City is looking for a logistics firm – although I am concerned your network of martial arts schools has let some previous projects get out of hand.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well that sounds intriguing! I am glad to know that you have been following my crime-fighting career – or else appreciate my logistics work.  So, tell me what brings you here. ","VS_T2P2VB1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VB12A"},

		{"label","VB11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Are you sure about that? I don’t quite think you know what you’re talking about! You should read the news, because there is nothing Force One can’t handle!  In terms of logistics services, that is.  Well, no matter - just go on and tell me why you are here. ","VS_T2P2VB1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VB12A"},


	{"label","VB12A"},
	 {"ns","What a coincidence! I just had a meeting with the council and we were discussing how this scenario is just the job for Force One! So why did you think of me when you were told to look for a logistics firm?","VS_T2P2VB1_04.ogg"},
	 {"pgs","Well I hear that you have had many successful engagements in the South Seas responding to natural disasters just like this!","VB12B","c"},
	 {"pgs","Frankly, I admire Force One’s extreme measures for guaranteeing the effectiveness of the firm’s logistics and supply services offerings.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","I don’t think you are very well disciplined, because that’s not accurate.  I haven’t even been to the South Seas.  But no matter -- I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P2VB1_05.ogg"},
		 {"pg","Okay, great!","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well, you must have looked into us, because you seem to know your stuff!  Anyway, we have a crisis on our hands – so if you need me, I am happy to take off some from my ‘unofficial’ crime fighting endeavors and focus on the City’s needs.","VS_T2P2VB1_06.ogg"},
		 {"pg","I am happy to hear you are available, Cedric.","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","Right then, so if you’ll excuse me, I have to convene the council and tell them the news.  Is there anything else you need?","VS_T2P2VB1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VB13B","e"},
	 {"pgs","No, but before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I may seem ruthless when it comes to taking down bad guys  – but the environment is a real concern to me.  I’ll consider your position when I figure out what is needed for this job. Well then, I hope to see you again. ","VS_T2P2VB1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Excuse me?  What do you mean, ‘donation’?  I do not take kindly to tough guys that come into my martial arts dojo demanding material possessions!  The City should hire us because I am the best logistics firm available – not because I give out kickbacks!","VS_T2P2VB1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VB1ATD1"},
 {"ns","Thanks for stopping by, then! If you decide you want to talk about what it will take to provide logistics and support services, just come back and we’ll talk about the details!","VS_T2P2VB1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Hello again!  You just caught me on my way out to brief the council.  So are you here to get me to start working as a logistics firm for the City’s relief and recovery efforts?","VS_T2P2VB1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VB1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VB1ASD2B","g"},
	 
		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before we start providing the City with logistics and support services, just to be sure.","VS_T2P2VB1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VB2ASD1"},
 {"ns","What are you doing here? The council awaits the official go-ahead! Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P2VB2_22.ogg"},
 {"pg","Thanks, I’m on my way to do that.","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","I am happy you are back. The Supreme Council is becoming agitated and is pressing for a response.  We need to act right away. Did the Mayor approve your decision to hire us?","VS_T2P2VB2_01.ogg"},
	 {"pgs","Yes – we are confident considering the unique success that your network of Karate schools has had supplying local transportation and warehousing.","VB21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VB21B"},
	 {"pgs","That’s correct.  We are looking forward to the same kind of help you gave to the Green Rivers Alliance during its restoration of the Hayford Eddy.","VB21D","b"},
	 {"pgs","Yes.  I am excited to see what you can do for the City considering your most recent success responding to the tsunami in Rosenfield in 2003.","VB21D","b"},


		{"label","VB21B"},
		 {"ns","Well, sadly, I have to brief the Council that there has been no progress.  I’ll see you back here when you are ready to negotiate.  ","VS_T2P2VB2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VB21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","With that type of nose for details, you should be fighting crime with us!  It’s clear the City needs help, so tell me what you are looking for us to do.","VS_T2P2VB2_03.ogg"},
		 {"pg","We are looking for a logistics firm that will provide planning, scheduling, and coordinating of the transportation and storage of relief supplies and equipment needed at the disaster site.","VB22A"},


		{"label","VB21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","Your lack of focus and concentration is evident and unfortunate.  Have you actually looked into this decision? Anyway, we have no time to waste - just tell me what you are looking for me to do.","VS_T2P2VB2_04.ogg"},
		 {"pg","We are looking for a logistics firm that will provide planning, scheduling, and coordinating of the transportation and storage of relief supplies and equipment needed at the disaster site.","VB22A"},


	{"label","VB22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, then, we will need $%d to take this on.  That includes $2200 for mobilizing marital arts students across the County to participate in our effort.  We need $4650 to rent transportation and freight services equipment from our sources statewide. Then there is $2650 for police scanners, surveillance equipment, and klieg-lights to alert various Force One team members of ‘emerging situations’.","VS_T2P2VB2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
	 {"pgs","Wait - $2650 for police scanners and surveillance equipment?  I know for a fact you have charged less in the past for the same kind of gear!","VB22B","c"},
	 {"pgs","I thought you normally charge clients less for transportation equipment rental and freight services…","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for our surveillance and security equipment, but I was going to upgrade and order from a military-grade supplier this time…well, never mind. Let’s just say I charge you the old rate; so my total price is $%d.","VS_T2P2VB2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you had checked, you would have seen that I always charge the same for transportation rental and freight services!  I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P2VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here acting like some sort of vigilante, you know. I just told you what I charge, and I do not appreciate your negotiating style!  I’ve heard that the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P2VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expense is the $1500 for nunchucks, bricks, boards, gees, and protective sparring gear for our Sunday martial arts tournaments, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T2P2VB2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","Not only have I seen that you charge less for those tournaments, but it’s outrageous and inappropriate to stick us with this expense.","VB23B","f"},
	 {"pgs","I have seen that you normally charge less for the supplies you need to stage a martial arts tournament.  I think you are trying to charge us too much.","VB23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am not going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point.  Under the desperate circumstances, maybe I should consider having the tournaments until next month – and then I’ll pay for them myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P2VB2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed that! Well, I normally do charge $1000 for the Sunday tournaments, but I was thinking of expanding them to include kickboxing this time… Never mind – because this is a disaster scenario, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P2VB2_11.ogg","cost"},
		 {"pg","I appreciate that, Cedric. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","If you were a student of mine, I would rap you with a stiff bamboo rod! Providing the City with logistics and support services entails certain expenses that must be incurred. This is a crisis, but I can’t be bullied into making a deal.  You are more demanding than I thought – I think I’ll have to charge $%d to do this job.","VS_T2P2VB2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","Right then, so we will need $%d to get started.  Do we have a deal?","VS_T2P2VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now that we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just want to ask – are you sure it costs that much to mobilize karate school students?","VB24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, all of us at Force One – the Supreme Council, my students, and I – are very concerned for our City’s safety.  Because this is an ecological crisis, I am willing to compromise! I think we should lower our offer to $%d.  Agreed?","VS_T2P2VB2_14.ogg","cost"},
		 {"pg","I am happy that you see it that way.  Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That is disgraceful! You know, you should learn how to treat people or your chi will suffer.  I can tell the City is going to be a very challenging client, and I am going to have to adjust my plan here, and charge you $%d to do this.","VS_T2P2VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you really are starting to dishonor yourself.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P2VB2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","Now, that we are both in the same ring, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P2VB2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VB25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for security and surveillance equipment…","VB25C","l"},


		{"label","VB25B"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","Right then! The council and I are honored to come to the City’s rescue. So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P2VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VB25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","My patience has reached its limit.  Our negotiating has come to a close.  There is a crisis that demands our attention- and frankly, your haggling makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P2VB2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VB25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VB25D"},


		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","Finally! Now, there is no time to waste.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P2VB2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VB25RENEGCHECK"},
		{"if","reneg","<",2,"VB25RENEG"},
-- Peter was here		{"label","VB25E"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","I have had it with you.  This negotiation is over.  Come back when you have contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P2VB2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","The council and I are ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P2VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns1","What are you doing here?  The Supreme Council has already dispatched alerts to dojos across the County!  We have a City to save – so hurry back with a contract from City Hall as soon as you can!  Remember, my price is $%d.  I’ll see you back here soon!","VS_T2P2VB3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","You are back!  Just in time! The Supreme Council just issued orders to prepare for dispatch.  Did you come with that contract for me to sign? ","VS_T2P2VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","Alright. Well, I guess it will take the Supreme Council a little time to prepare… just come back as soon as you get a contract! ","VS_T2P2VB3_02.ogg"},
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
		 {"ns","Okay, let’s investigate.  Okay….mm-hmm….oh, look at that!  The city is being very generous. That’s even more than I asked for!! The Supreme Council will be overjoyed!  I am happy to sign this.  Here you go!","VS_T2P2VB3_03.ogg"},
		 {"pg","Thanks, I guess.","VB33A"},
		 -- costa:Set to CC


		{"label","VB32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! What kind of take-down move are you trying to pull off here? ","VS_T2P2VB3_04.ogg"},
		 {"pg","I am sorry…","VB32D"},

			{"label","VB32D"},
			 {"fun2",incprofit,10},
			 {"ns","It looks like I am going to have to call my attorney about this.  Hello, Pat?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You must bring this new contract to your client for her to countersign in order to get started.","VS_T2P2VB3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VB32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},
			
				{"label","VB32E"},
				 -- scorea:+SG
				 {"ns","I understand the difficulty of your position, but my attorney has advised me that you must use the contract she drew up if you want me on board. She insists you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now…","VS_T2P2VB3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


				{"label","VB32F"},
				-- scoreb:-SG
				 {"ns","The Supreme Council will appreciate that you understand this is the only way we can move forward.  Look, the new contract is already come through the fax machine.  Here you go!","VS_T2P2VB3_11.ogg"},
				 {"pg","Okay, thanks.","VB33A"},


		{"label","VB32C"},
		 {"ns","Well let’s have a look then, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect. The Supreme Council will be pleased. Here you go!","VS_T2P2VB3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","Excellent! I am happy to be a part of the effort to rescue the City!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P2VB3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","What on earth are you doing here? The City needs us to come to the rescue! Get back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P2VB3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
