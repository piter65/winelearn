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

{"label","T2P4VD1"},


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
 {"ns","Well, hello! You must be the temp filling in as receptionist, right? Can you answer the phones while I step out for a minute?","VS_T2P4VD1_10.ogg"},
 {"pg","Oh, pardon the interruption. I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Liddy Gates! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VD11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		{"fun3",setvar,"scoreconvo","vd1"},
	 {"ns","Hi, please come in. My name is Lydia Gates, but you can call me Liddy. Do you have an appointment with someone here at Gates and Partners? ","VS_T2P4VD1_01.ogg"},
	 {"pgs","Actually, I am looking for a legal and compliance services provider – and I hear you really know your way around a court room.","VD11B","a"},
	 {"pgs","Actually, I am looking for a legal and compliance services provider – and I am particularly interested in your experience dealing with government regulatory agencies.","VD11C","b"},

		{"label","VD11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well that was well spoken! You sure seem to have a way with words, don’t you? As luck would have it, our receptionist is out – so you’ve come straight to the head honcho around here. So, what brings you to the office, exactly?","VS_T2P4VD1_02.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent the City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VD12A"},

		{"label","VD11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, I am not one to argue with a potential client. And, not to change the subject, but now that we’ve established that you don’t have an appointment, why don’t you tell me what brings you here.","VS_T2P4VD1_03.ogg"},
		 {"pg","It’s about the oil spill. I am looking for a legal and compliance services provider to advise and represent the City in legal matters pertaining to the disaster, and to help oversee regulatory compliance.","VD12A"},


	{"label","VD12A"},
	 {"ns","Well isn’t that something! I was just arguing with one of my paralegals here about what a great idea it would be to get involved! So why did you think of us, when you were told to look for a legal and compliance services provider?","VS_T2P4VD1_04.ogg"},
	 {"pgs","I understand that you are a widely touted expert in the field of contract law.","VD12B","c"},
	 {"pgs","Well, Lydia, I appreciate that you have never lost a single court case in which you were the lead attorney.","VD12C","d"},

		{"label","VD12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","You certainly do think highly of me, don’t you!  I probably won’t argue with you either. At any rate, I understand why you’re here – and I feel strongly about the environment, so I’ll be available if you think we can help, somehow.","VS_T2P4VD1_05.ogg"},
		 {"pg","Okay, great!","VD13A"},


		{"label","VD12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well I am at a loss for words! Your knowledge about this operation is impressive! Now, we have a crisis on our hands – so if you need me, I am happy to reschedule some of my courtroom appearances and focus on the City’s needs.","VS_T2P4VD1_06.ogg"},
		 {"pg","All right then, let’s continue","VD13A"},


	{"label","VD13A"},
	{"fun", incinterv},
	 {"ns","So, if that’s about it, I need to find out which paralegal is supposed to be filling in for our receptionist today and give her a piece of my mind! Is there anything else you need?","VS_T2P4VD1_07.ogg"},
	 {"pgs","No, that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job…","VD13B","e"},
	 {"pgs","No, but before I go – my decision to hire you could be swayed if you’d make a personal donation to the clean up effort…","VD13C","f"},

		{"label","VD13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, you have a point. Though I may like to argue about a lot of things, the idea of preserving our water supply is not really up for debate. I’ll certainly consider that as I figure out what I will need to take on this responsibility. Well then, I hope to see you again soon!","VS_T2P4VD1_08.ogg"},
		 {"pg","The pleasure was mine. I’ll see you around!","END"},


		{"label","VD13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Come again? What do you mean by ‘donation’? I am appalled by the suggestion. I do not take kindly to shysters that slither into my office looking for unreasonable settlements! The City should hire me because I am the best – not because I kowtow to such demands!","VS_T2P4VD1_09.ogg"},
		 {"pg","No offense intended. I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VD1ATD1"},
 {"ns","Thanks for stopping by! If you decide you want our firm to provide legal and compliance services, just come back and we’ll talk about the details!","VS_T2P4VD1_13.ogg"},
 {"pg","Thanks for your time. I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VD1ASD2A"},
	 {"ns","Welcome back! So have you made up your mind about a firm to provide legal and compliance services for the City’s relief and recovery efforts?","VS_T2P4VD1_11.ogg"},
	 {"pg","No I don’t think so. I have to meet with my client first.","VD1ASD2C"},
	 {"pgs","You bet! I’d love to get you on board. What will it take?","VD1ASD2B","g"},
	 
		{"label","VD1ASD2B"},
		-- scoreb:-SS
		 {"ns","Well, you don’t seem ready to negotiate as far as I can tell. I think you should probably get the official go-ahead from your client before I start providing the City with any legal representation – just to be sure.","VS_T2P4VD1_12.ogg"},
		 {"pg","Yes, you’re right. I’ll come back when I have am ready to move forward…","END"},

		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VD2ASD1"},
 {"ns","Hey there – not to argue with you, but what are you doing back here? You have a critical task on your hands! Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P4VD2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VD21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hello again! I sense you are back to talk about legal and compliance work for the City. I am glad you are moving forward, because people are railing about the disaster like attorneys before a grand jury- so we must act right away! Was your decision to hire us approved by City Hall? ","VS_T2P4VD2_01.ogg"},
	 {"pgs","Yes, Liddy, we are looking forward to seeing what you can do considering your reputation among the local legal community as a leading court room attorney.","VD21C","a"},
	 {"pg","No, I am just passing through. See you around.","VD21B"},
	 {"pgs","Yes, Liddy, we are confident you are good for the job, considering your work arguing for ranchers’ rights in Elliot County.","VD21D","b"},
	 {"pgs","Yes, Liddy, we hope you can bring the same success you brought to your clients when you argued against the Elliot County Young Scouts’ ecologically unfriendly camping practices last year.","VD21D","b"},


		{"label","VD21B"},
		 {"ns","Well I’m not going to argue with you if you want to go. Our receptionist is still out, so I have phone calls to take. But please, do come back when you are ready to negotiate!","VS_T2P4VD2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VD21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Well, you certainly made me feel much better about taking on this case! With that kind of persuasive argumentation, you should be an attorney! It’s clear the City needs help, so tell me what you are looking for my firm to do.","VS_T2P4VD2_03.ogg"},
		 {"pg","We are looking for a firm to serve the City’s legal and compliance need as it responds to, and recovers from, the disaster in the New City River.","VD22A"},


		{"label","VD21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","I do not follow your logic – in fact, I think I am lost – or you are. No need to explain yourself, though – just tell me what you are looking for the firm to do.","VS_T2P4VD2_04.ogg"},
		 {"pg","We are looking for a firm to serve the City’s legal and compliance need as it responds to, and recovers from, the disaster in the New City River.","VD22A"},


	{"label","VD22A"},
	 {"fun",halfcost},
	 {"ns1","In that case, we need $%d to do this project.  This includes $4000 for payments for additional legal experts to help me administrate the account. There’s also $3500 for the yoga lessons and psychotherapy I need to help me… adjust. Then, there’s $2000 in expenses and fees for filing various motions and other paperwork.","VS_T2P4VD2_05.ogg","cost"},
	 {"pg","Sure thing! I’ll get a contract drawn up!","VD25B"},
	 {"pgs","Wait a second – I know for a fact you normally charge less for yoga lessons and psychotherapy.","VD22B","c"},
	 {"pgs","Did you say $2000 for legal fees associated with paperwork? I am pretty sure I’ve seen you charge less for those.","VD22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal. What do you say?","VD22D","deal","e"},

		{"label","VD22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, I normally do charge less for my yoga lessons, but I just haven’t been myself recently. My psychiatrist recommended I go six times a week given the circumstances. But never mind – let’s just say I charge the old rate; so my total price is $%d.","VS_T2P4VD2_06.ogg","cost"},
		 {"pg","That works. Let’s continue.","VD23A"},

		{"label","VD22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you had checked, you would have seen that I always charge the same amount for handling filing and administrative fees for large projects! I can tell now that the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P4VD2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VD23A"},
		 -- costa:PLUS


		{"label","VD22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here like you own the place, you know. I just told you what I charge, and I do not particularly appreciate your negotiating style! People say the City can be a difficult client – now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P4VD2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VD23A"},


	{"label","VD23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expenses is the $1500 I need for lozenges and throat spray to ease my sore throat, and mentho-rub to relax my muscle tension after the long days of argumentation and wild gesturing that will be called for here. So that brings us to $%d. Do we have a deal?","VS_T2P4VD2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal! Let’s talk about paperwork.","VD25B","cost"},
	 {"pgs","Not only do you usually charge less for your throat and muscle remedies – but it’s totally obnoxious to charge a client for that!","VD23B","f"},
	 {"pgs","I have seen that you normally charge less for throat and muscle soreness remedies. As a matter of fact, I think you are trying to charge to overcharge us.","VD23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense. How about we just agree to have you come on board for $%d. What do you say?","VD23D","deal","h"},

		{"label","VD23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, I think you have a point. Under these desperate circumstances, maybe I should rethink how much I am spending at the pharmacy these days – and pay for it myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P4VD2_10.ogg","cost"},
		 {"pg","Thanks, Liddy. That would be great. ","VD24A"},


		{"label","VD23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Ah, yes. Well, I would charge $1000 for the medication, but I was going to have it ordered from an upscale family-run pharmacy in Wexlerberg. Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P4VD2_11.ogg","cost"},
		 {"pg","I appreciate that, Liddy. Thanks.","VD24A"},

		{"label","VD23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Now you are really starting to come across as overly argumentative. I am offering legal counsel, which means certain expenses must be paid! This is a crisis, but I can’t be bullied into a bad deal. You are more demanding than I thought – I am going to need $%d to take this on.","VS_T2P4VD2_12.ogg","cost"},
		 {"pg","I see. Well, I am sorry to have offended you.","VD24A"},


	{"label","VD24A"},
	 {"ns1","Right then, so we will need $%d to get started. What do you say? ","VS_T2P4VD2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VD25B"},
	 {"pgs","Now that we’ve covered all your expenses – and considering that this is a crisis, do you think you could forgo some profit?","VD24B","i"},
	 {"pgs","Before we go ahead, I have to ask – are you sure you have to charge so much for additional legal experts?","VD24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

		{"label","VD24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I was arguing with my paralegals earlier about the disaster and how it may really overload our overburdened court system. However, because this is an ecological crisis, I am willing to compromise! I think we should lower my offer to $%d. Agreed?","VS_T2P4VD2_14.ogg","cost"},
		 {"pg","I am happy you see it that way. Thanks.","VD25A"},


		{"label","VD24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now, look – you have to be aware of how you treat people – in business, in court and in life.  I can already tell the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P4VD2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


		{"label","VD24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you really are starting to act hysterically. We just went over my expenses, and we agreed on everything! As much as I want to help the City, if this is what I am going to have to put up with, I am going to have to charge you $%d. And, I am done negotiating!","VS_T2P4VD2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

	{"label","VD25A"},
	 {"ns1","So now that you have decided to make this into an argument, my price is $%d, and that’s my final offer. How does that strike you?","VS_T2P4VD2_17.ogg","cost"},
	 {"pg","All right, then. It’s a deal.","VD25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for yoga lessons. Can’t we save some money there?","VD25C","l"},


		{"label","VD25B"},
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},




		 {"ns1","So it’s a deal! I am looking forward to arguing on behalf of the City! So your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d. I’ll see you when you come back with the paperwork!","VS_T2P4VD2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall. I’ll talk to you soon.","END"},


		{"label","VD25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Look, I’ve had just about enough of your demands for now. We are done negotiating. There is a crisis going on – and frankly, your haggling makes me wonder about working with you. I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P4VD2_19.ogg","cost"},
		 {"pg","Before you increase your price any more, please, I accept your offer.","VD25D"},
		 {"pgs","I don’t know – I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
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

		 {"ns1","Finally! Now let’s not waste any time. You should get a contract drawn up for $%d so we can get started. Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P4VD2_20.ogg","cost"},
		 {"pg","Great! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VD25RENEGCHECK"},
		{"if","reneg","<",2,"VD25RENEG"},
-- Peter 		{"label","VD25E"},

-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Look, I have had enough arguing for one day. This negotiation is over. Come back when you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P4VD2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VD2ATD1"},
 {"ns1","Why, hello again! I am anxious to represent the City in court, but we should move quickly. Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P4VD2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder. I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VD3ASD1"},
 {"ns1","Now, I’m not trying to cross examine you – but what are you doing back here? The City desperately needs someone to argue its case – so hurry back with a contract from City Hall as soon as you can! Remember, my price is $%d. I’ll see you back here soon!","VS_T2P4VD3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hey, you’re finally back – what took so long? I am so anxious to get started working for the City that I can hardly formulate an argument! Did you come with that contract for me to sign?","VS_T2P4VD3_01.ogg"},
	 {"pg","Yes, I have it right here.","VD32X"},
	 {"pg","Oh no, not yet. I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


		{"label","VD31B"},
		 {"ns","All right then. I’ll meet you back here when you secure a contract for me to sign.","VS_T2P4VD3_02.ogg"},
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
		 {"ns","Okay, let’s review the contract. Okay… mm-hmm… I second that motion! The city sure is being very generous. That’s even more than I asked for! Here you go!","VS_T2P4VD3_03.ogg"},
		 {"pg","Thanks, I guess…","VD33A"},
		 -- costa:Set to CC


		{"label","VD32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a look… wait – no! This isn’t what we discussed! Are you trying to strong-arm me?","VS_T2P4VD3_04.ogg"},
		 {"pg","I am sorry…","VD32D"},

			{"label","VD32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am afraid we’ll have to do something about this! Hold on, let me page my assistant. Hello, Clarence?  We need a new contract. Look, my assistant is going to punch up a new contract for you to have your client countersign.","VS_T2P4VD3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your assistant. I’d really rather City Hall draw up a new contract…","VD32E","a"},
			 {"pgs","That seems fair to me. Given my oversight, that sounds like the right thing to do...","VD32F","b"},
			
				{"label","VD32E"},
				 -- scorea:+SG
				 {"ns","Look, I’d rather not make a federal case out of this misunderstanding and I appreciate your position, but you must use the contract we drew up if you want us on board. I insist you get the Mayor to sign it because it has the service fee we agreed on. Look, it’s printing out right now…","VS_T2P4VD3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


				{"label","VD32F"},
				-- scoreb:-SG
				 {"ns","I’m glad that you have no objections to moving forward this way. Anyway, the new contract is ready. Here you go!","VS_T2P4VD3_11.ogg"},
				 {"pg","All right – I understand, I guess.","VD33A"},


		{"label","VD32C"},
		 {"ns","Well let’s review the contract. Okay… uh huh… mm hmm… well no objections here! This looks perfect. Here you go!","VS_T2P4VD3_05.ogg"},
		 {"pg","Excellent! I am looking forward to working with you.","VD33A"},


	{"label","VD33A"},
	 {"ns","Well then! I am happy to argue on behalf of the City! Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P4VD3_07.ogg"},
	 {"pg","I also look forward to working with you. Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VD3ATD1"},
 {"ns","Look, I’m not trying to cross-examine you – but why are you still here with that contract? Get back to City Hall and get the Mayor to countersign it right away. We need to get started – the future of our City is at stake!","VS_T2P4VD3_08.ogg"},
 {"pg","Yes, thanks – I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
