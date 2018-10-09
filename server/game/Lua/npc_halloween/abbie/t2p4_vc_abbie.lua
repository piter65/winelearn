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

{"label","T2P4VC1"},


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
 {"ns","Oh, hello. I don’t think I have much time until my TV interview – if you are going to style my hair and do my makeup for the evening broadcast, we should get started right away. ","VS_T2P4VC1_10.ogg"},
 {"pg","Oh, sorry for the intrusion. I must be in the wrong place. ","END"},
 {"pg","Hey, you’re Abbie Korpis! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Welcome to Abbie S. Korpis Associates. I’m Abbie! You must be here to prep me for the Legal Entertainment Tonight interview! And, you know, I am so happy you’re here – I’d like to get your opinion on a pair of shoes.","VS_T2P4VC1_01.ogg"},
	 {"pgs","Actually, Abbie, I am looking for legal and compliance services – and we think your gift for unearthing the details that allow you to maximize your clients’ settlements may be of use to us.","VC11B","a"},
	 {"pgs","Actually, Abbie, I am looking for legal and compliance services – and as a renowned attorney, we think you have the experience it takes practicing environmental law to be of service.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Oh, my! You’re looking for a real-life lawyer! I thought you were here with one of those Sunday evening news programs… I should have figured! So what brings you here exactly?","VS_T2P4VC1_02.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, I must admit I am fuzzy about the point you are trying to make – but who am I to argue with a prospective client? Please – go on and tell me what brings you here.","VS_T2P4VC1_03.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VC12A"},


	{"label","VC12A"},
	 {"ns","Well I’ll be! That is some coincidence. I was just talking to some of my ex-stepchildren, and they were telling me about how I should get involved somehow! So why did you think of my firm when you were told to look for legal and compliance services?","VS_T2P4VC1_04.ogg"},
	 {"pgs","I was told to come here because of your exposure in the field of environmental law.","VC12B","c"},
	 {"pgs","Well I understand you have a talent for finding details that help your clients get ahead, which is just what New City needs.","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, I’ve heard some weak arguments at the traffic court but this, well,  no matter – I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P4VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","That’s a good reason – you certainly seem to know your stuff! Anyway, I think I could really nail a case like this to the wall, so if you need me, I am happy to reschedule my family court cases to focus on the City’s needs.","VS_T2P4VC1_06.ogg"},
		 {"pg","I am happy to hear you are available, Abbie.","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Okay, so is there anything else you need?  I have some distraught clients I must attend to… and I still have to prepare for that interview!","VS_T2P4VC1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VC13B","e"},
	 {"pgs","Okay, but before I go – it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I have been on the Sunday talk shows here in town for longer than any other lawyer on television. Because I owe this community so much for all that I have, I’ll keep that in mind as I figure out what is needed for the project. Well, I hope to see you again!","VS_T2P4VC1_08.ogg"},
		 {"pg","The pleasure was mine, Abbie. I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","A “donation”? I really don’t think so.  I don’t appreciate hucksters that slither into my office proposing inappropriate agreements! The City should hire me because I am the best vendor available – not because I give you a “donation”!","VS_T2P4VC1_09.ogg"},
		 {"pg","No offense intended. I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Thanks for stopping by, then! If you decide you want our firm to provide logistics and support services, just come back and we’ll talk about the details!","VS_T2P4VC1_13.ogg"},
 {"pg","Thanks for your time. I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Welcome back! You have great timing; I still have a few minutes before my interview! So are you here to talk about representing the City during its disaster relief and recovery efforts?","VS_T2P4VC1_11.ogg"},
	 {"pg","No I don’t think so. I have to meet with my client first.","VC1ASD2C"},
	 {"pgs","You bet! I’d love to get you on board. What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that? You don’t seem ready to negotiate. I think you should probably get the official go-ahead from your client before I start providing the City with legal or compliance services – just to be sure.","VS_T2P4VC1_12.ogg"},
		 {"pg","Yes, you’re right. I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","What are you doing here? Don’t you have something you should be doing?! Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the agreement!","VS_T2P4VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Well, you’re back. You just missed my TV interview! I was fantastic! Anyway, let’s talk about the City’s legal representation, because the lawsuits over the spill are lining up like ungrateful ex-husbands demanding alimony payments – and we need to act right away! So did the Mayor approve your decision to hire us?","VS_T2P4VC2_01.ogg"},
	 {"pgs","Yes – we are particularly excited about your ties to the County Bar Association, which we feel may just give you access to the legal expertise we will need for this job.","VC21C","a"},
	 {"pg","No, I am just passing through. See you around.","VC21B"},
	 {"pgs","Yes, she did. We closely considered your experience facilitating communication between your clients, the courts and government agencies.","VC21D","b"},
	 {"pgs","You bet! We look forward to what you can do for the city given your representation of various other municipalities around the County.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Okay, then. Well, I have some desperate -sounding voicemails I need to return – so I’ll see you back here when you are ready to negotiate.","VS_T2P4VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","With your ability to recall details, you should try taking the bar exam! It’s clear the City needs help, so tell me what you need my firm to do.","VS_T2P4VC2_03.ogg"},
		 {"pg","We need a firm that can represent the City during upcoming legal disputes and administrate compliance with various government regulatory agencies in matters related to the disaster.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","I don’t think that answer is a particularly accurate representation of the facts... but, we have no time to waste – so tell me what you are looking for my firm to do.","VS_T2P4VC2_04.ogg"},
		 {"pg","We need a firm that can represent the City during upcoming legal disputes and administrate compliance with various government regulatory agencies in matters related to the disaster.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, so I would normally charge $%d for a job like this. This includes $2000 for shoes, jewelry, and accessories for public appearances as the City’s legal council, another $4250 for legal fees associated with handling the case, and $3250 for on-staff manicurists to repair all the nails I will most likely break filing paperwork.","VS_T2P4VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Wait – $3250 for manicurists? I know for a fact you have charged less for that in the past!","VC22B","c"},
	 {"pgs","I thought that you normally charge clients less for legal fees and expenses associated with case administration.","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal. What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Let me tell you something. These environmental cases can drag on and on. And my fingernails will be paying the price of all that paperwork and I’ll really need an extra manicurist. HOWEVER, I’ll ask her to put in unpaid overtime and charge you the old rate; so let’s just say my total fees and expenses add up to $%d.","VS_T2P4VC2_06.ogg","cost"},
		 {"pg","That works. Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you had checked into this, you would have seen that I charge all of my clients the same amount for administration fees and expenses! I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P4VC2_07.ogg","cost"},
		 {"pg","I am sorry to have offended you, Abbie. Let’s continue.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Well, I don’t know. You seem to be missing the point here. I just told you what I charge, and I do not appreciate your aggressive negotiating style! I’ve heard that the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P4VC2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expense is the $1500 for alimony payments to my ex-husbands – which brings us to $%d, so that’s my offer. Do we have a deal?","VS_T2P4VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal! Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Not only do you usually charge less for your alimony payments – but is it really ethical to pass on that expense. You shouldn’t charge clients for that!","VC23B","f"},
	 {"pgs","I have seen that you normally charge less for alimony payments. I think you are trying to charge us too much for those.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense. How about we just agree to have you come on board for $%d. What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Listen. If you knew my ex-husbands, you’d realize that the City would be getting a heck of a deal at that price. HOWEVER, under these desperate circumstances, maybe I should hold off on charging the City for my alimony– so I can pay for it myself. In fact I really feel like we would make a good team Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P4VC2_10.ogg","cost"},
		 {"pg","Thanks, Abbie – that would be great. Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well there is some truth to that, I suppose. I normally do charge $1000 for alimony payments… but I have another divorce on the books for next week and, oh never mind – because this is an emergency, I can hold off and charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P4VC2_11.ogg","cost"},
		 {"pg","I appreciate that, Abbie. Thanks.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You certainly are stubborn. You kind of remind me of Ron, my second husband. You see, I am offering to provide legal representation for the City, which means I must meet certain costs. I understand that we are in crisis mode here but expenses are expenses. You know – you are more demanding than I first thought. I really should be charging $%d.","VS_T2P4VC2_12.ogg","cost"},
		 {"pg","I see. Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Okay, so the following constitutes a legal offer: I will need $%d to get started. Do we have a deal?","VS_T2P4VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now that we’ve covered all your expenses – and considering that this is a crisis, do you think you could forgo some profit?","VC24B","i"},
	 {"pgs","Before we finish, I have to ask – why do we need to buy you new shoes? Don’t you have enough yet?","VC24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I was just talking to myself in the hallway, and I realized that I’m very concerned about the damage this disaster may cause to our community. Because this is an ecological crisis, I am willing to compromise! I think I can lower my offer to $%d. Agreed?","VS_T2P4VC2_14.ogg","cost"},
		 {"pg","I am happy you see it that way. Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That is no way to talk to a lady! You know, you ought to mind your manners – otherwise people my think you’re being difficult. I can tell this is going to be a challenging assignment, so I am going to have to adjust my plan here – and charge you $%d to take the City on as a client.","VS_T2P4VC2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now that is shamelessly manipulative behavior. We just went over my expenses, and we agreed on everything! As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d. And, I am done negotiating!","VS_T2P4VC2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","So it seems like we are on the same side, now! My price is $%d, and that’s my final offer. What do you think about that?","VS_T2P4VC2_17.ogg","cost"},
	 {"pg","I think we have a deal, Abbie.","VC25B"},
	 {"pgs","Okay, but I still don’t see why you insist on spending all that money for on-staff manicurists…","VC25C","l"},


		{"label","VC25B"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","Then it’s a deal! I am happy to partner up with you! I am looking for a healthy, stable, long-term relationship. Now just go to City Hall and tell Will Standon to have a contract drawn up for $%d. I’ll see back here with the paperwork!","VS_T2P4VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall. I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","I’ve had just about enough. We are done negotiating. There is a crisis that demands our attention – and frankly, your haggling makes you seem impossible to work with. I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P4VC2_19.ogg","cost"},
		 {"pg","Before you increase your price any more, please, I accept your offer.","VC25D"},
		 {"pgs","I don’t know – I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
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


		 {"ns1","Well it’s about time! Now, go and get a contract drawn up for $%d so we can get started. Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P4VC2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},


-- PEter was here		{"label","VC25E"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","You know, I run into all types in court but you really have a style all your own. This negotiation is over! I don’t want to see you again until you have a contract for me for $%d. Now, you should get going before I change my mind and raise my price!","VS_T2P4VC2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P4VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder. I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns1","What are you doing here? The City needs representation – so hurry back with a contract from City Hall as soon as you can! Remember, my price is $%d. I’ll see you back here soon!","VS_T2P4VC3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Well, you’re finally back! I am so anxious to get to work for the City I can barely apply my make-up! Did you come with that contract for me to sign? ","VS_T2P4VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh no, not yet. I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Oh, well all right, just come back here as soon as you have a contract for me.","VS_T2P4VC3_02.ogg"},
		 {"pg","Sounds good. See you soon!","END"},

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
		 {"ns","Okay, let’s have a look here then, shall we? Okay… mm-hmm… well, I’ll be! Look at that! That’s even more than I asked for! The city is even more generous than my third husband. I am happy to sign this. Here you go!","VS_T2P4VC3_03.ogg"},
		 {"pg","Thanks, I guess.","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a… wait – no! This isn’t what we discussed! What kind of material misrepresentation did you think you’d get away with?","VS_T2P4VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am afraid we’ll have to do something about this! Hold on, let me page my assistant. Hello, Alan? Yeah, we need a new one. Look, my assistant is going to punch up a new contract. He will email it to me now and I will print the new contract here for you to have your client countersign.","VS_T2P4VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your assistant. I’d really rather City Hall draw up a new contract…","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but you must use the contract I drew up if you want me on board. I insist that you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s printing out right now…","VS_T2P4VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","I am happy you understand my position. It’s really the only way we can move forward. Here, look - the new contract has already printed. There you go!","VS_T2P4VC3_11.ogg"},
				 {"pg","All right – I understand, I guess.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well let’s have a look then, shall we? Okay… uh huh… mm hmm… well now, this looks perfect. Here you go! Oh, shoot. I broke a nail.","VS_T2P4VC3_05.ogg"},
		 {"pg","Excellent! I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","Well I am happy to be a part of the team! Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P4VC3_07.ogg"},
	 {"pg","I also look forward to working with you. Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","What are you still doing here with that contract? Get back to City Hall and get the Mayor to countersign that contract. We need to get started – the future of our City is at stake!","VS_T2P4VC3_08.ogg"},
 {"pg","Yes, thanks – I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
