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

{"label","T2P4VB1"},


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
 {"ns","Welcome to Dewey, Sewham, & Howe. Come in! If you have been the victim of an accident, please see the gentleman with the blue tie. If you have been the victim of a wrongful action, a slip and fall, or if someone yelled at you and ruined your day, just have a seat and someone will be with you shortly.","VS_T2P4VB1_10.ogg"},
 {"pg","Uh, gee, thanks.","END"},
 {"pg","Hey, you’re Anthony Dewey! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Well look, Gordon, another client! Welcome to Dewey, Sewham, and Howe. My name is Anthony Dewey, and this is my brother, Gordon. Are you a client? You don’t look like an accident victim.","VS_T2P4VB1_01.ogg"},
	 {"pgs","Actually, I am looking for legal and compliance services – and I think you have demonstrated the ability to closely follow up with the minute details of your clients’ cases.","VB11B","a"},
	 {"pgs","Actually, I am looking for a legal and compliance services provider – and though you lack experience, we are confident your contacts in government will be of service to us.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Why, did you hear that Gordon? How intriguing! Clearly, you have been following our career – or else you know a good law suit when you see one. So, tell me what brings you here. ","VS_T2P4VB1_02.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VB12A"},

		{"label","VB11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Why, did you hear that Gordon? I don’t quite think this one has much of a case. You should read the news, because we have been litigating for as long as we can remember. Well, no matter - just go on and tell me why you are here.","VS_T2P4VB1_03.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VB12A"},


	{"label","VB12A"},
	 {"ns","What a coincidence! We just had a meeting with the senior partners, and we were discussing the disaster – and talking about how someone ought to sue someone for something! So why did you come here to find a legal and compliance services provider?","VS_T2P4VB1_04.ogg"},
	 {"pgs","Well I hear that you have had many successful engagements representing City governments during disasters just like this!","VB12B","c"},
	 {"pgs","Frankly, I admire your firm’s ability to get the best possible outcome for your clients – and for yourselves.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Did you hear that Gordon? This one can talk – but doesn’t seem too concerned with accuracy, but no matter – my brother and I feel strongly about the environment, and we are available should you feel we can be of service.","VS_T2P4VB1_05.ogg"},
		 {"pg","Okay, great!","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","You are a clever one indeed! You seem to know your way around the firm already. Anyway, we have a crisis on our hands – so if you need us, my brother and I are happy to assign some of our case load to our junior partners in order to fully focus on the City’s needs.","VS_T2P4VB1_06.ogg"},
		 {"pg","I am happy to hear you are available, Anthony.","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","Right then, so if you’ll excuse us, my brother and I have some business matters to attend to. Is there anything else you need?","VS_T2P4VB1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VB13B","e"},
	 {"pgs","No, but before I go – it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, we may seem ruthless when it comes to defending our slip-and-fall victims – but we certainly have a soft spot for the environment. I’ll consider your position when I figure out what is needed for this job. Well then, we hope to see you again soon.","VS_T2P4VB1_08.ogg"},
		 {"pg","The pleasure was mine. I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Excuse me? What do you mean, ‘donation’? I do not take kindly to prospective clients that come into my practice demanding additional consideration! The City should hire us because we are the best law firm in town – not because I give out kickbacks!","VS_T2P4VB1_09.ogg"},
		 {"pg","No offense intended. I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VB1ATD1"},
 {"ns","Thanks for stopping by, then! If you decide you want to talk about what it will take to provide legal and compliance services for the City’s relief and recovery effort, just come back and we’ll talk about the details!","VS_T2P4VB1_13.ogg"},
 {"pg","Thanks for your time. I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Hello again! You just caught me on my way out to serve some papers! So are you here to talk about legal representation for the City’s relief and recovery efforts?","VS_T2P4VB1_11.ogg"},
	 {"pg","No I don’t think so. I have to meet with my client first.","VB1ASD2C"},
	 {"pgs","You bet! I’d love to get you on board. What will it take?","VB1ASD2B","g"},
	 
		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","Maybe you should check your legal brief. You don’t seem ready to negotiate. I think you should probably get the official go-ahead from your client before we start providing the City with legal and compliance services, just to be sure.","VS_T2P4VB1_12.ogg"},
		 {"pg","Yes, you’re right. I’ll come back when I have am ready to move forward…","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VB2ASD1"},
 {"ns","What are you doing here? You should get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P4VB2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Well, look who it is Gordon! The representative from Professional Team Services is back. We’re about as nervous as a negligent property owner with all this disaster activity going on! We need to act right away. Did the Mayor approve your decision to hire us?","VS_T2P4VB2_01.ogg"},
	 {"pgs","Yes – we are confident considering your unique success mining the minutiae of the law to find advantageous loopholes for your clients.","VB21C","a"},
	 {"pg","No, I am just passing through. See you around.","VB21B"},
	 {"pgs","That’s correct.  We are looking forward to the kind of representation you gave the Green Rivers Alliance during its restoration of the Hayford Eddy.","VB21D","b"},
	 {"pgs","Yes.  I am excited to see what you can do for the City considering your recent success representing Rosenfield after the tsunami of 2003.","VB21D","b"},


		{"label","VB21B"},
		 {"ns","Well, we like taking on new clients – so just let us know when you are ready to negotiate.","VS_T2P4VB2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VB21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","With that kind of memory for details, you should be a court reporter! It’s clear the City needs our help, so tell my brother and me what you need us to do.","VS_T2P4VB2_03.ogg"},
		 {"pg","We need a firm that can represent the City during upcoming legal disputes, and administrate compliance with various government regulatory agencies in matters related to the disaster.","VB22A"},


		{"label","VB21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","Did you hear that Gordon? Pitiful! Your lack of preparation is evident. Have you actually looked into this decision? Anyway, we have no time to waste – so just tell my brother and me what you are looking for us to do.","VS_T2P4VB2_04.ogg"},
		 {"pg","We need a firm that can represent the City during upcoming legal disputes, and administrate compliance with various government regulatory agencies in matters related to the disaster.","VB22A"},


	{"label","VB22A"},
	 {"fun",halfcost},
	 {"ns1","In that case, we will need $%d to have New City as a client. That includes $2200 for fees and expenses related to paperwork filings, and $4650 for paralegals to administrate the client account. This also includes a $2650 charge for a radio and television campaign encouraging anyone who may have been hurt by the spill to contact us.","VS_T2P4VB2_05.ogg","cost"},
	 {"pg","Sure thing! I’ll get a contract drawn up!","VB25B"},
	 {"pgs","I thought you normally charge clients less for your public announcements on television and radio…","VB22B","c"},
	 {"pgs","Wait – you want us to pay how much to cover the filing of your paperwork? I know for a fact you have charged less in the past for the same kind of workers!","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal. What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Guilty as charged! My brother and I normally do charge less for our announcements, but we were going to air them at prime-time this time… fine, you win. Let’s just say I charge you the old rate; so my total price is $%d.","VS_T2P4VB2_06.ogg","cost"},
		 {"pg","That works. Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Why I should hold you in contempt! If you had checked, you would have seen that my brother and I always charge the same for our teams of paralegals! I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d.","VS_T2P4VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here acting like some sort of shyster, you know. We just told you what we charge, and we do not appreciate your negotiating style! I’ve heard talk around the courthouse that the City can be a difficult client – now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P4VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, so the remainder of my expense is the $1500 for Continental designer shoes and ties to wear to client-related engagements, which brings us to $%d. So that’s my offer. Do we have a deal?","VS_T2P4VB2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal! Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","Not only have I seen you charge less for shoes and accessories, but it’s outrageous and inappropriate to pass that expense on to us.","VB23B","f"},
	 {"pgs","I have seen that you normally charge less for shoes and designer neckties. I think you are trying to charge us too much.","VB23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you – but I’m afraid I am NOT going to pay that expense. How about we just agree to have you come on board for $%d. What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point. Under these desperate circumstances, maybe my brother and I should reconsider our wardrobe – and pay for new shoes and neckties ourselves. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P4VB2_10.ogg","cost"},
		 {"pg","Thanks, that would be great. Let’s continue.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Point taken. Well, we normally do charge $1000 for shoes and ties, but I was thinking of custom-ordering them from an exclusive Continental clothier… but never mind. This is a public emergency, and so my brother and I will charge you the standard rate – so our price is set at $%d. What do you say?","VS_T2P4VB2_11.ogg","cost"},
		 {"pg","I appreciate that, gentlemen. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","If we weren’t in a good faith negotiation, we would sue you for your behavior! Providing the City with legal representation entails we meet certain expenses. This is a crisis, but we can’t be bullied into making a deal! You are more demanding than my brother and I first thought – Ithink we have to charge $%d to do this job.","VS_T2P4VB2_12.ogg","cost"},
		 {"pg","I see. Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","Right then, so we will need $%d to get started. Do we have a deal?","VS_T2P4VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now that we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure it costs that much to hire paralegals? I mean, they didn’t even go to law school.","VB24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, all of us at Dewey, Sewham, and Howe – from the senior partners to the mail room – are very concerned for our City’s future. Because this is an ecological crisis, I am willing to compromise! I think we should lower my offer to $%d. Agreed?","VS_T2P4VB2_14.ogg","cost"},
		 {"pg","I am happy you see it that way, gentlemen. Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That is disgraceful! You would be well served to mind your manners – otherwise people will equate you with some sort of ambulance chaser! I can tell the City is going to be a very challenging client, and I am going to have to adjust my plan here, and charge you $%d to do this.","VS_T2P4VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you’re starting to sound like you’re pinching pennies. We just went over our expenses, and then agreed on everything! As much as we’d like to help, if this is what have to put up with, we are going to have to charge you $%d. And, my brother and I are done negotiating!","VS_T2P4VB2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","Now that we are both on the same side, our price is $%d, and that’s the final offer. Are we in agreement?","VS_T2P4VB2_17.ogg","cost"},
	 {"pg","Yes, gentlemen – it’s a deal.","VB25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for radio and television ads…","VB25C","l"},


		{"label","VB25B"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Right then! We are honored to be considered for your legal team. Your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d. My brother and I will be here when you come back with the paperwork!","VS_T2P4VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall. I’ll talk to you soon.","END"},


		{"label","VB25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","You know, we’ve been in some long court battles but this negotiation takes the cake! We are done negotiating. There is a crisis that demands our attention – and frankly, your haggling indicates that you are likely to be impossible to work with. I’m charging $%d now, and that’s only because we feel strongly about the project!","VS_T2P4VB2_19.ogg","cost"},
		 {"pg","Before you increase your price any more, please, I accept your offer.","VB25D"},
		 {"pgs","I don’t know – I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
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



		 {"ns1","Finally! Now, there is no time to waste. You should get a contract drawn up for $%d so we can get started. Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P4VB2_20.ogg","cost"},
		 {"pg","Great! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

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


		 {"ns1","Negotiating is one thing, but you take it to a whole new level. This negotiation is over. Come back when you have a contract for me for $%d. Now, get going before I change my mind and raise our price!","VS_T2P4VB2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","My brother and I are ready to serve the City, but we must move quickly. Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P4VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder. I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns","What are you doing here? Our Senior Partners are meeting about this project as we speak! You should hurry back with a contract from City Hall! My brother and I will see you back here soon!","VS_T2P4VB3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Look who it is, Gordon! We’ve been expecting you. Are you here with that contract for me to sign? ","VS_T2P4VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Oh, no, not yet. I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","All right. Just come back here as soon as you get a contract. We’ll be waiting!","VS_T2P4VB3_02.ogg"},
		 {"pg","Sounds good. See you soon!","END"},

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
		 {"ns","Okay, let’s take a close look, shall we? Okay… mm-hmm… oh, my! Why, look, Gordon! The city is a generous client. That’s even more than we asked for! We are happy to sign this. Here you go!","VS_T2P4VB3_03.ogg"},
		 {"pg","Thanks, I guess.","VB33A"},
		 -- costa:Set to CC


		{"label","VB32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a look… wait – no! This isn’t what we discussed! What kind of maneuver is this?","VS_T2P4VB3_04.ogg"},
		 {"pg","I am sorry…","VB32D"},

			{"label","VB32D"},
			 {"fun2",incprofit,10},
			 {"ns","Look, we are going to have to do something about this. Gordon’s going to look through this and plug in the right numbers. And you, my friend are going to have to bring the contract to your client for her to countersign in order to get started.","VS_T2P4VB3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from Gordon. I’d really rather City Hall draw up a new contract…","VB32E","a"},
			 {"pgs","That seems fair to me. Given my oversight, that sounds like the right thing to do...","VB32F","b"},
			
				{"label","VB32E"},
				 -- scorea:+SG
				 {"ns","You’ve made your case but you must use the contract we drew up if you want us on board. We insist that you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s printing right now…","VS_T2P4VB3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


				{"label","VB32F"},
				-- scoreb:-SG
				 {"ns","My brother and I appreciate that you understand that this is the only way we can move forward. Look, the new contract is already being printed up.","VS_T2P4VB3_11.ogg"},
				 {"pg","Okay, thanks.","VB33A"},


		{"label","VB32C"},
		 {"ns","Well let’s have a look then, shall we? Okay… uh huh… mm hmm… well, Gordon what do you say? I think it looks perfect. We’ll sign it… right there… here you go!","VS_T2P4VB3_05.ogg"},
		 {"pg","Excellent! I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","Excellent! My brother and I are both thrilled to be a part of the legal team! Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P4VB3_07.ogg"},
	 {"pg","I also look forward to working with you. Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","Why are you still here with that contract? The City desperately needs representation! Get back to City Hall and get the Mayor to countersign that contract. The future of our City is at stake!","VS_T2P4VB3_08.ogg"},
 {"pg","Yes, thanks – I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
