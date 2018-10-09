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

{"label","T2P4VA1"},


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
 {"ns","Hello.  Wait – how do I know you? You do look kind of familiar but I can’t be sure…","VS_T2P4VA1_10.ogg"},
 {"pg","Pardon me, I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Avanish Singh! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Good day to you! Welcome to Eastern Legal. You may call me Avanish Singh. How may I help you on this fine day?","VS_T2P4VA1_01.ogg"},
	 {"pgs","Hello, Avanish, I am looking for a legal and compliance services provider, and I hear you have a knack for details.","VA11B","a"},
	 {"pgs","Hello, Avanish, I am looking for legal and compliance services –but I am not sure about the impact you’ve had on the local judiciary over the course of your limited experience.","VA11C","b"},

		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well it is an honor indeed to merit such consideration! I am quite humbled by your praise. In any case, I do not wish to converse with you extraneously, so let me ask you directly – why are you here? ","VS_T2P4VA1_02.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VA12A"},

		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","I am not sure if you are accurately recalling the facts of your business case, in part because I think your perception is most misguided. Well, no matter – maybe I can help you anyway.  Just go on and tell me why you are here.","VS_T2P4VA1_03.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent New City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VA12A"},


	{"label","VA12A"},
	 {"ns","That is most funny – I was meditating here earlier, feeling riddled with remorse about the situation. Then suddenly I observed myself thinking that I should somehow get involved! What a coincidence! So why did you come here for legal and compliance services?","VS_T2P4VA1_04.ogg"},
	 {"pgs","I hear that you have extensive experience as a long-time practitioner of environmental law.","VA12B","c"},
	 {"pgs","I hear that you are an expert in the application of environmental law.","VA12C","d"},

		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Oh, no, well that is most unfortunate indeed, because I don’t think I conform to that description. But no matter – I feel strongly about the environment, and I am available if you feel I can help you.","VS_T2P4VA1_05.ogg"},
		 {"pg","Okay, great!","VA13A"},


		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well that’s a well-supported reason – you seem quite knowledgeable. I am most intrigued by the possibility of involvement with this project – so if you need me, I am happy to drop some of my extraneous work and focus on the City’s needs.","VS_T2P4VA1_06.ogg"},
		 {"pg","I am happy to hear you are available, Avanish.","VA13A"},


	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","So it seems like I have satisfied your inquisitiveness. Is there anything else you need to know?","VS_T2P4VA1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VA13B","e"},
	 {"pgs","No, but before I go – it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VA13C","f"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Why, yes, I agree wholeheartedly with your position.  We must not focus solely on material gain when there is so much more at stake in the universe. It is my dharma to keep my costs contained for this job. Well then, I hope to see you again!","VS_T2P4VA1_08.ogg"},
		 {"pg","The pleasure was mine. I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Oh!  This is quite shocking indeed! You want a ‘donation’? I do not take well to clients that project themselves into my office demanding baksheesh! The City should hire us because we are the best firm available – not because we participate in dishonorable activities in the name of business!","VS_T2P4VA1_09.ogg"},
		 {"pg","No offense intended. I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thanks for stopping by! If you decide you’d like to contract me as your legal and compliance services provider, just come back and we’ll discuss the details.","VS_T2P4VA1_13.ogg"},
 {"pg","Thanks for your time. I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","Hello again, my friend. It is nice to see you back on this most glorious day. Are you here to discuss the details of my involvement providing legal and compliance services to the City?","VS_T2P4VA1_11.ogg"},
	 {"pg","No I don’t think so. I have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VA1ASD2B","g"},
	 
		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","No no my friend! Are you sure about that? You don’t seem ready to negotiate. You should get the official go-ahead from your client before I start representing the City in any legal or compliance matters, to be sure.","VS_T2P4VA1_12.ogg"},
		 {"pg","Yes, you’re right. I’ll come back when I have am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VA2ASD1"},
 {"ns","What are you doing here? You have a critical task on your hands! Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P4VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hello, my friend! Welcome back! I am most happy to be seeing you again. You must be here to talk about providing the City with legal and compliance services. That is good, because the City may be facing more problems than a curry in a rainstorm! We need to act right away. Did the Mayor approve your decision to hire us?","VS_T2P4VA2_01.ogg"},
	 {"pgs","You bet! I am excited to see what you can do for the city, considering the fact you have contacts in regulatory agencies around the State.","VA21C","a"},
	 {"pg","No, I am just passing through. See you around.","VA21B"},
	 {"pgs","Yes, she did. We are confident your in your ability as a court room attorney to get the job done for us.","VA21D","b"},
	 {"pgs","Well, I’d like to do it, but I need to be convinced your staff can take on the project load.","VA21D","b"},


		{"label","VA21B"},
		 {"ns","Oh, well then my friend. It saddens me to see you leave, but I look forward to seeing you once again when you are ready to negotiate.","VS_T2P4VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","With that kind of attention to details, you should practice law! Anyway, I have been looking forward to discussing the details – so tell me what you are looking for us to do.","VS_T2P4VA2_03.ogg"},
		 {"pg","We need a firm that can represent the City during upcoming legal disputes, and administrate compliance with various government regulatory agencies in matters related to the disaster.","VA22A"},


		{"label","VA21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Well, it does not sound like I fulfill the description you just outlined – which leads me to believe you may not have all the facts. Well, it doesn’t matter - the City needs help – so, please tell me what you are looking for my firm to do.","VS_T2P4VA2_04.ogg"},
		 {"pg","We need someone that can represent the City during upcoming legal disputes, and administrate compliance with various government regulatory agencies in matters related to the disaster.","VA22A"},


	{"label","VA22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, then, the total of my fees and expenses for this would be $%d. First, I’ll need $2500 for additional phones, desks, and supplies for new hires. Then I need $4150 in salaries for contracting legal professionals that will be administrating the project. Also, there’s a $2850 charge for an experienced team of Sherpas as couriers to messenger legal documents back and forth.","VS_T2P4VA2_05.ogg","cost"},
	 {"pg","Sure thing! I’ll get a contract drawn up!","VA25B"},
	 {"pgs","Wait, how much for experienced Sherpa couriers? Haven’t you charged less for those in the past?","VA22B","c"},
	 {"pgs","I have read that you normally charge less for salaries to your contract legal professionals!","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal. What do you say?","VA22D","deal","e"},

		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for our Sherpa couriers, but seeing as there will be a lot of documents, I was thinking of hiring one or two more. Well, never mind. Let’s say I charge you the old rate – so my total price is $%d.","VS_T2P4VA2_06.ogg","cost"},
		 {"pg","That works. Let’s continue.","VA23A"},

		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","You are making about as much sense as a monsoon in March. If you had checked, you would have seen that I always charge the same for contract legal help! I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P4VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VA23A"},
		 -- costa:PLUS


		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here and throw your weight around, you know. I just told you what I charge, and I do not appreciate your negotiating style! I heard the City can be a difficult client indeed – now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P4VA2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VA23A"},


	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expenses is the $1500 I charge for sessions with my guru so that I may be more persuasive and effective while conducting my affairs – which brings us to $%d. So that’s my offer. Do we have a deal?","VS_T2P4VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal! Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Not only do you usually charge less for your personal effectiveness guru – but you shouldn’t charge us for that! It’s irrelevant!","VA23B","f"},
	 {"pgs","I have seen that you normally charge less for your guru. I think you are trying to charge us too much!","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense. How about we just agree to have you come on board for $%d. What do you say?","VA23D","deal","h"},

		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point. Under the desperate circumstances, maybe I should just go to the ashram to meet with him after this is all over – and pay for it myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P4VA2_10.ogg","cost"},
		 {"pg","Thanks, that would be great. Let’s continue.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed. Well, I normally do charge $1000 for my guru, but I was thinking of flying in his teacher, the renowned Swami Takin Ahadda Vantij. Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P4VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Avanish. Thanks.","VA24A"},

		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You incognizance befuddles me, my friend! In any legal and compliance services engagement, there are certain expenses that must be paid. I know this is a crisis, but I can’t be bullied into a bad deal! You are much less shanti than I thought – I should charge $%d for this.","VS_T2P4VA2_12.ogg","cost"},
		 {"pg","I see. Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","So, my friend, we will be needing $%d to undertake this engagement. Are we in agreement?","VS_T2P4VA2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VA25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VA24B","i"},
	 {"pgs","Before moving on, I have to ask – why do you have to pay so much for additional phones and office supplies? Couldn’t we find it cheaper somewhere?","VA24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, after we spoke last time, I started to meditate again, and I began to think about the devastation this disaster will wreak. Because this is an ecological crisis, I am willing to compromise! We can adjust the level of my remuneration to $%d. Agreed?","VS_T2P4VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way, Avanish. Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I must admit, I do not appreciate such incognizance. You know, you ought to treat people well – otherwise they’ll have difficulty understanding you! I can already tell the City is going to be a very challenging client indeed, and I feel I am going to have to adjust my plan and charge you $%d.","VS_T2P4VA2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you are being difficult to communicate with. We just reviewed my expenses, and we agreed on everything! As much as I want to help, if this is how I will be treated, I am going to have to charge you $%d. And, I am quite finished negotiating, my friend!","VS_T2P4VA2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


	{"label","VA25RENEG"},
	{"fun2",incprofit,2},

	{"label","VA25A"},
	 {"ns1","So, my friend, my price is $%d, and that’s my final offer. Are we in agreement?","VS_T2P4VA2_17.ogg","cost"},
	 {"pg","All right, then. It’s a deal.","VA25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us for a team of sherpas.","VA25C","l"},


		{"label","VA25B"},
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},


		 {"ns1","Well that is fantastic indeed! I think I feel much better now that we are playing cricket for the same team! So, your next step is to go to City Hall and have a contract drawn up for $%d. I’ll see you when you come back with the paperwork!","VS_T2P4VA2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall. I’ll talk to you soon.","END"},


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Okay, my friend, I am afraid we are finished negotiating. To be quite honest, your haggling makes you seem quite difficult indeed. I’m charging $%d now, and that’s only because at this point, I would be concerned about the state of my karma if I didn’t do this job!","VS_T2P4VA2_19.ogg","cost"},
		 {"pg","Before you increase your price any more, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know – I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
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





		 {"ns1","Finally! Now, there is no time to waste, my friend!  You should get a contract drawn up for $%d so we can get started. Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P4VA2_20.ogg","cost"},
		 {"pg","Great! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VA25RENEGCHECK"},
		{"if","reneg","<",2,"VA25RENEG"},





-- Peter was here		{"label","VA25E"},
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},



		 {"ns1","I have had just about enough of this, my friend. This negotiation is over. Come back when you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P4VA2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VA2ATD1"},
 {"ns1","Hello again, my friend. I am indeed happy to see you, but it is important we begin serving the City! Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P4VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder. I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns","What are you doing here, my friend? You need a contract from City Hall so we can get started! I’ll see you back here soon!","VS_T2P4VA3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hello, my friend! It is quite good to see you again! Did you come with that contract for me to sign? ","VS_T2P4VA3_01.ogg"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Oh, no, not yet. I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


		{"label","VA31B"},
		 {"ns","Okay, my friend – just come back as soon as you get a contract and we can get started providing legal representation.","VS_T2P4VA3_02.ogg"},
		 {"pg","Sounds good. See you soon!","END"},

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
		 {"ns","Okay, well then, let’s have a look, shall we? Okay….mm-hmm….oh, my! That’s quite nice! The city sure is being quite generous indeed. That’s even more than I asked for!! I am happy to sign this. Here you go, my friend!","VS_T2P4VA3_03.ogg"},
		 {"pg","Thanks, I guess.","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a… wait – no! This isn’t what we discussed! What kind of complicated set of circumstances are you trying to confuse me with? ","VS_T2P4VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},

			{"label","VA32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am afraid we have to do something about this! Hold on, let me page my assistant. Hello, Maneesh? Yes, we need a new one. Look, my assistant is going to type up a new contract. He will email it to me now and I will print it here for you to bring to your client and have countersigned.","VS_T2P4VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from you. I’d really rather that City Hall draw up a new contract…","VA32E","a"},
			 {"pgs","That seems fair to me. Given my oversight, that sounds like the right thing to do...","VA32F","b"},
			
				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I quite understand the position you’re in, my friend, but you must use the contract I drew up if you want me on board. I insist that you get the Mayor to sign it because it has the service fee we agreed on.","VS_T2P4VA3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},


				{"label","VA32F"},
				-- scoreb:-SG
				 {"ns","I’m quite relieved that you understand this is the way we must move forward, my friend. Anyway, the new contract has already printed. Here you go!","VS_T2P4VA3_11.ogg"},
				 {"pg","All right – I understand, I guess.","VA33A"},


		{"label","VA32C"},
		 {"ns","Well let’s have a look then, shall we? Okay… uh huh… mm hmm… well now, this looks perfect. Here you go, my friend!","VS_T2P4VA3_05.ogg"},
		 {"pg","Excellent! I am looking forward to working with you.","VA33A"},


	{"label","VA33A"},
	 {"ns","So there we are, my friend! I am happy to be a part of the team! Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P4VA3_07.ogg"},
	 {"pg","I also look forward to working with you. Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VA3ATD1"},
 {"ns","What are you doing here with that unexecuted agreement? Get back to City Hall and get the Mayor to countersign it right away!  Remember, my friend – the future of our City is at stake!","VS_T2P4VA3_08.ogg"},
 {"pg","Yes, thanks – I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
