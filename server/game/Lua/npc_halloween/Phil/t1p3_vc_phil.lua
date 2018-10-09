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

{"label","T1P3VC1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P3vc1"},

--**************
--Chose Someone else
--**************

{"label","VCBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VC1ASD1"},
 {"ns","Excuse me, you’ll have to leave – this facility is for authorized personnel only.","VS_T1P3VC1_10.ogg"},
 {"pg","Sorry, I didn’t meant to intrude.","END"},
 {"pg","Hey, you’re Phil Burells! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Welcome to Burrells Brothers! My name is Phil Burells. How can I help you?","VS_T1P3VC1_01.ogg"},
	 {"pgs","I am looking for an spill containment services firm, and I understand you would be able to bring containment equipment to a disaster site.","VC11B","a"},
	 {"pgs","I am here looking for spill containment services, and I think your recent experience in the Azalian peninsula would serve us well in this crisis.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","I am pleased you are considering us for this deployment.  Please, tell me more about the situation.","VS_T1P3VC1_02.ogg"},
		 {"pg","There has been an oil spill in the New City River and the City asked my firm to look into containment of the disaster.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, to be honest, I think we may have left that job unfinished– but let’s not dwell on minor details. So what brings you here, exactly?","VS_T1P3VC1_03.ogg"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to help them contain the disaster.","VC12A"},


	{"label","VC12A"},
	 {"ns","I think that a rapid response is called for, given this crisis.  So why exactly did you think that our operation is suited for this deployment?","VS_T1P3VC1_04.ogg"},
	 {"pgs","I understand that you use up-to-date equipment for your containment operations.","VC12B","c"},
	 {"pgs","I understand you have had great success during your military service responding to disasters around the world","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, that sounds like something we can try to do.   Not to change the subject, but I understand the urgency of this crisis – and I am ready to take immediate action should you need us.","VS_T1P3VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","I am impressed by your level of preparation! You seem rather well-studied.  Now that I have been briefed on the current situation, we can deploy immediately should you need us to.","VS_T1P3VC1_06.ogg"},
		 {"pg","Alright then, let’s continue","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Is that all the information you require?","VS_T1P3VC1_07.ogg"},
	 {"pgs","Actually, I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VC13B","e"},
	 {"pgs","Before I leave, I want you to know my decision to hire you would be influenced if you were to decide to make some sort of donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","OK.  Good luck!","VS_T1P3VC1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","You have some nerve! What kind of agitator comes onto these premises looking for unauthorized donations!? If you hire us it should be because we are the best choice for the job – not because we decide to give you kickbacks!.","VS_T1P3VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

	{"label","VC1ATD1"},
	 {"ns","You have an urgent mission – so you better get going.","VS_T1P3VC1_13.ogg"},
	 {"pg","Yes,  I was actually on my way  to look around further.  I may be back soon to talk to you more the crisis.  Goodbye for now!","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Are you back to issue our deployment orders for this operation engagement?","VS_T1P3VC1_11.ogg"},
	 {"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss, first!","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","That sounds unlikely to me! I think you should probably get the official go-ahead from the Mayor about providing the City with any spill containment services, before we deploy into negotiations.","VS_T1P3VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

	{"label","VC2ASD1"},
	 {"ns","What are you doing back here?  You should go get approval from your client on a spill containment services provider. If you decide you want to hire me, report back when you are ready to negotiate.","VS_T1P3VC2_22.ogg"},
	 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","I am happy to see you back!  News of the disaster is spreading like ketchup on a hamburger. Why, with the urgency of this situation, I can only imagine you are here to issue deployment orders.  What persuaded your client to authorize our involvement?","VS_T1P3VC2_01.ogg"},
	 {"pgs","I understand you will be able to transport the containment equipment to the disaster site yourself.","VC21C","a"},
	 {"pg","Actually, my client didn’t approve you yet – I am just passing through to say hi.","VC21B"},
	 {"pgs","City Hall appreciates that you have cutting edge military equipment – which is a key factor in our decision on whom to hire.","VC21D","b"},
	 {"pgs","I recommended we hire you based on your positive history of containing oil spills in rivers.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Well what are you waiting for? Get the approval from City Hall to negotiate, and hurry back! You’ll need me to respond quickly if you hope to save the New City River!","VS_T1P3VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		 {"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","I am highly impressed by your attention to detail.  Now tell me, what are the immediate objectives of this action?","VS_T1P3VC2_03.ogg"},
		 {"pg","We are looking for a firm who can contain the oil slick at the disaster site in preparation for recovery and disposal.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		 {"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Well…umm…I don’t know about that, but…I guess you’ve come to the right place, anyway!  Regardless, we have no time to waste on such trivia.  Please tell me exactly what the City needs from us.","VS_T1P3VC2_04.ogg"},
		 {"pg","We are looking for a firm who can contain the oil slick at the disaster site in preparation for recovery and disposal.","VC22A"},


	{"label","VC22A"},
	{"fun",halfcost},
	 {"ns1","In order to undertake this operation we will need $%d. This includes a $1250 expense for mobilization of friends and state militia members to respond to the spill; $1500 for maintenance and service for military-surplus spill containment equipment; and $1250 for military-grade tent assemblies, motion detectors, and electrified chicken wire for our on-site command center.","VS_T1P3VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Isn’t $1250 for tent assemblies, motion detectors, and chicken wire a little much?","VC22B","c"},
	 {"pgs","$1250 for mobilization costs?  I know for a fact you’ve charged less for that in the past.","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I think you may have a point there.  I wanted to load up, you see -- you can never be too prepared. Let’s just make that $750, then, and say the total is $%d.","VS_T1P3VC2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now, that doesn’t really make sense.  If you had researched this decision, you’d have observed that I always incur that cost mobilizing our friends in the military service and members of the state militia to respond and provide containment.  You know, I can tell now that the City is going to be a difficult client – so I am going to have to charge $%d for this.","VS_T1P3VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Excuse me?  Look, I am negotiating in good faith – and you are trying my patience.  That is not how we do things in New City.  Now, I think am going to have to charge $%d to do this, because you’re making this engagement seem pretty difficult.","VS_T1P3VC2_08.ogg","cost"},
		 {"pg","Oh. Sorry to have offended you...","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remaining expense we must account for is the $1000 we will need for video games, DVDs, and informative short films to play to off-duty personnel in the ‘rec tent’ between shifts, which brings the total resource requirement to $%d. So that’s my offer.","VS_T1P3VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Video games and short films, eh? Not only have I seen that you charge $500 for that expense – but the City is in crisis here, and I can’t really see why we need them.","VC23B","f"},
	 {"pgs","Wait - I have seen you charge less for those short films and video games before.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense. How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns","You know, you certainly have a point. Come to think of it, it is quite possible that given the circumstances, we can lower that expense to $500 – and I’ll just get fewer video games than I initially planned on.","VS_T1P3VC2_10.ogg"},
		 {"pg","Thanks that would be great.  Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You may actually have a point there.  Given the circumstances, I think I can pay for that expense out my own pocket.  And do you know what?  I really feel I can work well with you – so I am going to lower my offer to $%d.","VS_T1P3VC2_11.ogg","cost"},
		 {"pg","Thanks, Phil. I appreciate the concession.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","That is disgraceful! I am offering my services for immediate action, and I find your attempts to strong-arm me to be disgraceful.  This confrontation has more potential for escalation than I thought – I am going to have to charge $%d now.","VS_T1P3VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Okay, so, that brings us to a total of $%d for the entire operation.  We really need to move out, so tell me - do we have a deal?","VS_T1P3VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VC24B","i"},
	 {"pgs","Look, before we ‘move out’, I just wanted to ask – are you sure you really need to decommission military spill containment equipment?","VC24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","Actually, I am quite concerned about the impact this is going to have on the community.  After all, this is where my children go to school!  For the sake of future generations, I am going to lower my offer to $%d.","VS_T1P3VC2_14.ogg","cost"},
		 {"pg","That’s quite an outlook, Phil.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I’ve just about reached my limit with you!  I have already given you my expenses, and now you are needlessly haggling with me.  Given how difficult you are being, I think it will take $%d to undertake this operation.","VS_T1P3VC2_15.ogg","cost"},
		 {"pg","My apologies - I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","I will not warn you again, but you are really starting to wear on my nerves.  Those kinds of tactics are unacceptable in this kind of negotiation. Do you understand me?  Just to teach you a lesson, my price for this operation is now $%d.","VS_T1P3VC2_16.ogg","cost"},
		 {"pg","I apologize; I didn’t mean to anger you.  Let’s move on,","VC25A"},
		 

	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","I am happy we have come to a mutual understanding. So, my price is $%d, and that’s my final offer.  Agreed?","VS_T1P3VC2_17.ogg","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VC25B"},
	 {"pgs","I just want to revisit the maintenance costs you charge for service to your military-surplus equipment. Don’t you think you could do better on that?","VC25C","l"},


		{"label","VC25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Excellent!  Now, you need to report to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you report back with the paperwork!","VS_T1P3VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, I’ve had just about enough of this. I am ready to walk away, because I don’t think we are on the same page, at all.  If you still want to do this, I’m charging $%d now, and that’s final!","VS_T1P3VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","This is just crazy - I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


			{"label","VC25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
			 {"ns1","I am happy we are finally in agreement.  Now, go and tell Will Standon at City Hall to have a contract drawn up for $%d, and report back here so we can get this operation underway!","VS_T1P3VC2_20.ogg","cost"},
			 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},

			{"label","VC25RENEGCHECK"},
			{"if","reneg","<",2,"VC25RENEG"},

--			{"label","VC25E"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
			 {"ns1","This negotiation is over!!  I’m raising my price. Vacate these premises and don’t report back until you have a contract for me for $%d!","VS_T1P3VC2_21.ogg","cost"},
			 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I’d love to stand around and chit-chat, but we are in the midst of a crisis situation.  You should move quickly to City Hall and report back once you’ve gotten Will Standon to draw up a contract for $%d.","VS_T1P3VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns1","Oh, it’s you.  Remember, to get an assessment underway we are going to need a contract for $%d.  Hurry to City Hall and talk to Standon – then report back here with that document, as soon as possible!","VS_T1P3VC3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","I am happy to see you back!  Time is slipping away from us, and we need to move fast.  Are you here with a contract for me to sign?","VS_T1P3VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Well what are you doing here, then?  This is an emergency!  Bring that contract back here post-haste!","VS_T1P3VC3_02.ogg"},
		 {"pg","Alright then. I’ll see you soon!","END"},

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
			 {"ns","So, yes …uh-huh…wow!  This is superb! You have awarded me an even higher contract than I was expectiong!  Here you go.  Present the contract to the Mayor so she can countersign, and the operation will be underway!","VS_T1P3VC3_03.ogg"},
			 {"pg","Thanks, I guess.","VC33A"},
			 -- costa:Set to CC


			{"label","VC32B"},
			{"fun",getvendorcontract},
			 {"ns","Okay, then let me have a…wait a second- this is inexcusable!  What kind of maneuver is this? Are you trying to short-change us?  That is disgraceful!","VS_T1P3VC3_04.ogg"},
			 {"pg","I am sorry…","VC32D"},

				{"label","VC32D"},
				{"fun2",incprofit,10},
				 {"ns","My attorney will surely have something to say about this.  Wouldn’t you say, Bill? Excuse me…hello, Oliver?  Yeah, they…uh-huh…okay, bye. Look, my lawyer will send over a contract with the right numbers which you will have to bring to City Hall – okay?","VS_T1P3VC3_06.ogg"},
				 {"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VC32E","a"},
				 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},

					{"label","VC32E"},
					 -- scorea:+SG
					 {"ns","I understand your position, recruit, but my attorney has advised me to use the contract he drew up.  He insists you get the Mayor to sign it if you want to deploy me, because it has the service fee we agreed on.","VS_T1P3VC3_10.ogg"},
					 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


					{"label","VC32F"},
					 -- scoreb:-SG
					 {"ns","I’m relieved you understand this is the only way we can move forward.  You have nothing to fear now, we will carry out this operation with all the precision you’d expect from a military operation!","VS_T1P3VC3_11.ogg"},
					 {"pg","Alright, I understand.","VC33A"},


			{"label","VC32C"},
			 {"ns","Well let’s check it out….uh huh….mm hmmm… This is perfect.  Here you are.  Report to City Hall with this contract and have the Mayor countersign - and the operation will be underway!","VS_T1P3VC3_05.ogg"},
			 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


		{"label","VC33A"},
		 {"ns","Well, that does it then!  My brother and I are looking forward to getting started on the engagement.  Now if you’ll excuse us, we have some preparations to make.","VS_T1P3VC3_07.ogg"},
		 {"pg","I also look forward to working with you both, as well, Phil.  Until next time!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

	{"label","VC3ATD1"},
	 {"ns","What are you doing here!!?   Get back to City Hall so the Mayor can sign that contract, this instant! The future of our City is at stake!","VS_T1P3VC3_08.ogg"},
	 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
