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

{"label","VCBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","wp"},
	{"n","Hello. Sorry, but I am busy right now. I'll see you around."},
	{"pg","Alright","END"},

--*********************
--CAN'T INTERVIEW YET
--*********************

	{"label","VC1ASD1"},
		{"ns","Ten, hut! Do I know you recruit?","VS_T1P2VC1_10.ogg"},
		{"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
		{"pg","Hey, you’re Tom Barrier! I’ve heard of you!","END"},
			
--****************
--INTERVIEW
--****************

	{"label","VC1"},
		
		{"label","VC11A"},
			{"fun",incvendorsvisited},
			{"fun",incvendor3},
			{"fun",talkedtovendor3},
			{"fun3",setvar,"scoreconvo","vc1"},
			{"ns","Welcome to Medic!, Inc., At ease soldier.  My name is Tom Barrier, and I am the commanding officer here. How can I help you?","VS_T1P2VC1_01.ogg"},
			{"pgs","I am looking for an emergency response services firm, and I hear that your team has up-to the-minute readiness training.","VC11B","a"},
			{"pgs","I am looking for emergency services, and I understand you have responded to disasters in Rosenfield in the past as part of your service contract.","VC11C","b"},
		
				{"label","VC11B"},
					 -- scorea:+MD
					 {"fun2", decprofit,2}, -- costa:MINUS
					{"ns","Well it is an honor to have merited your consideration, recruit!  I would be happy to help - please go on and give me a situation report.","VS_T1P2VC1_02.ogg"},
					{"pg","There has been an oil spill in the New City River and the City asked my firm to look into emergency response services to respond to the disaster site.","VC12A"},
				
				{"label","VC11C"},
					 -- scoreb:-MD
					 {"fun2", incprofit,2},-- costb:PLUS
					{"ns","Well, recruit, to be honest, we are looking forward to such engagements – but we’ve yet to be deployed by the city of Rosenfield. So anyway, why are you on these premises?","VS_T1P2VC1_03.ogg"},
					{"pg","Yes, well, there has been an oil spill in the New City River and the City asked my firm to look into emergency response services to respond to the disaster site.","VC12A"},
		

		{"label","VC12A"},
			{"ns","This seems like a crisis that merits urgent attention and rapid deployment.    So why exactly did you think that our operation is suited for this engagement?","VS_T1P2VC1_04.ogg"},
			{"pgs","I understand you have crowd control methods that will effectively secure the site, and minimize harm to disaster relief workers and onlookers.","VC12B","c"},
			{"pgs","I understand that you are fully licensed and have experience providing medical response around our area.","VC12C","d"},
		
				{"label","VC12B"},
					 -- scorea:-MD
					 {"fun2", incprofit,2},-- costa:PLUS
					{"ns","Well recruit, <ahem> that sounds like something we can try to do.   Not to change the subject, but I understand this crisis merits urgent action – and so I am ready to deploy immediately should you issue the orders.","VS_T1P2VC1_05.ogg"},
					{"pg","Okay, great!","VC13A"},
				

				{"label","VC12C"},
					 -- scoreb:+MD
					 {"fun2",decprofit,2},-- costb:MINUS
					{"ns","Your level of preparation is impressive, recruit! You’ve clearly been reading the manual.  Now that I have been told all about the current crisis, and am completely ready to deploy immediately should you issue the orders.","VS_T1P2VC1_06.ogg"},
					{"pg","Alright then, let’s continue","VC13A"},
		

		{"label","VC13A"},
			{"fun", incinterv},
			{"ns","Well, recruit, have you satisfied your objectives here today?","VS_T1P2VC1_07.ogg"},
			{"pgs","Actually, I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VC13B","e"},
			{"pgs","Before I leave, I want you to know my decision to hire you would be influenced if you were to decide to make some sort of donation to the clean up effort.","VC13C","f"},
		
				{"label","VC13B"},
					 -- scorea:+EB
					 {"fun2",decprofit,2},-- costa:MINUS
					{"ns","So noted, recruit.  Good luck on your mission. Dismissed!","VS_T1P2VC1_08.ogg"},
					{"pg","The pleasure was mine.  I’ll see you around!","END"},
				

				{"label","VC13C"},
					 -- scoreb:-EB
					 {"fun2",incprofit,2},-- costb:PLUS
					{"ns","You a have some nerve, maggot! What kind of barbarian comes into my office demanding unauthorized donations!? If you hire our unit, it should be because we are the best choice for the job – not because we decide to give you kickbacks!","VS_T1P2VC1_09.ogg"},
					{"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},

		
--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

		{"label","VC1ATD1"},
			{"ns","You’re dismissed, recruit. You have an urgent mission – so get going, on the double!!","VS_T1P2VC1_13.ogg"},
			{"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more about the crisis.  Goodbye!","END"},

		
--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
		{"ns","Ten, hut recruit! I understand  you are under time pressure – are you back with deployment orders from the City?","VS_T1P2VC1_11.ogg"},
		{"pg","No, I don’t think so.  I have more research to do, and I have to talk to my boss, first","VC1ASD2C"},
		{"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
		 
			{"label","VC1ASD2B"},
				-- scoreb:-SS
				{"ns","That sounds unlikely to me, recruit! I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any emergency response services.","VS_T1P2VC1_12.ogg"},
				{"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},
		
			{"label","VC1ASD2C"},
			-- scorea:+SS
			{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

		{"label","VC2ASD1"},
			{"ns","What are you doing back here, recruit?  You should go get approval from your client if you decide you want to hire me - and then come back here so that we can negotiate.","VS_T1P2VC2_22.ogg"},
			{"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC2"},
		
		{"label","VC21A"},
			{"fun",clearreneg},
			{"fun3",setvar,"scoreconvo","v2"},
			{"ns","Ten, hut!  I am happy to see you report back, soldierrecruit -- news of the disaster is rapidly disseminating! I assume from your presence here that your superiors have decided to award me with a service contract.  What persuaded your CO to authorize this deployment?","VS_T1P2VC2_01.ogg"},
			{"pgs","I understand you have cutting edge military equipment – which is a key factor in our decision of whom we hire.","VC21C","a"},
			{"pg","Actually, my ‘CO’ didn’t approve you yet –  I am just passing through to say hi.","VC21B"},
			{"pgs","City Hall appreciates your military-style discipline, and your ability to respond to area emergencies in a timely fashion.","VC21D","b"},
			{"pgs","I recommended hiring you without reservation – despite your abysmal military service record.","VC21D","b"},
		

				{"label","VC21B"},
					{"ns","Well what are you waiting for, recruit?  You are dismissed!  Report back immediately when you get the approval from City Hall to negotiate! You’ll need me to respond quickly if you hope to maintain order through this chaos!","VS_T1P2VC2_02.ogg"},
					{"pg","Sure thing! Bye!","END"},
				

				{"label","VC21C"},
					 -- scorea:+MD
					{"fun2",decprofit,2}, -- costa:MINUS
					{"fun",incvendor3},
					{"fun",talkedtovendor3},
					{"ns","At ease!  I am highly comforted by your close attention to details.  Now it’s clear the City needs to deploy emergency response services immediately.  Please tell me, what are the immediate objectives of this engagement?","VS_T1P2VC2_03.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services. firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VC22A"},
				

				{"label","VC21D"},
					 -- scored:-MD
					 {"fun2",incprofit,2}, -- costd:PLUS
					{"fun",incvendor3},
					{"fun",talkedtovendor3},
					{"ns","I will not question the authority of your superiors but I am highly, well…umm…you’ve come to the right place!  Anyway, we have no time to waste on such trivia.  Please tell me exactly what the City needs from us.","VS_T1P2VC2_04.ogg"},
					{"pg","We are looking for a firm that can respond to the disaster site, helping the City by providing security and medical services.","VC22A"},
		

		{"label","VC22A"},
			{"fun",halfcost},
			{"ns1","In order to undertake this operation we will need $%d. This includes a $1250 expense for deployment of Medic!, Inc. security and medical personnel; $1500 for triage equipment, new medic field kits and camouflage uniforms; and $1250 for stun guns, tear gas, rubber bullets, and a pair of 3000 watt loudspeakers that we rely on for effective crowd engagement.","VS_T1P2VC2_05.ogg","cost"},
			{"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
			{"pgs","Stun guns? Tear gas? Riot shields? Isn’t $1250 a little excessive for such measures?","VC22B","c"},
			{"pgs","$1250 for deployment costs?  I know for a fact you’ve charged less for that in the past.","VC22C","d"},
			{"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},
		
				{"label","VC22B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,500},-- costb:MINUS
					 {"fun2",decprofit,5},
					{"ns1","I think you may have a point there, recruit.  I was expecting a large turnout for this engagement – and you can never be too prepared for an antagonistic indigenous population scenario.  Let’s make that $750, then, and I can shave some related expenses, so let’s just say the total is $%d.","VS_T1P2VC2_06.ogg","cost"},
					{"pg","That works.  Let’s continue.","VC23A"},
				
				{"label","VC22C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","Your recall of the facts is disgraceful, recruit.  If you had done some research, you’d have observed that I always incur mobilization costs when Medic undertakes large-scale engagement.  I can tell now that the City is going to be a difficult client – so I think I may have to charge $%d for this.","VS_T1P2VC2_07.ogg","cost"},
					{"pg","Well, I am sorry to have  offended you.","VC23A"},
					 -- costa:PLUS
				

				{"label","VC22D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","What are you talking about, recruit?!  I have reported my costs to you, yet you insist on escalating this confrontation!  I can tell that this may turn into a hostile engagement…so I think I am going to have to charge $%d for to do this…","VS_T1P2VC2_08.ogg","cost"},
					{"pg","Oh.  Sorry to have offended you...","VC23A"},
		

		{"label","VC23A"},
			{"fun",threequartercost},
			{"ns1","Okay, so the remaining expense we must account for is the $1000 we will need for a detachment of bugle players to play charges, taps, and other drills for the relief effort which brings the total resource requirement to $%d. So that’s my offer.  Can we call a ceasefire, now?","VS_T1P2VC2_09.ogg","cost"},
			{"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
			{"pgs","I’m not sure,  it’s just that I have seen you charge less for detachment of bugle players.","VC23B","f"},
			{"pgs","Bugle players?  Not only have I seen you charge $500 for that expense – but the City is in crisis here, and I can’t really see why we need them","VC23C","g"},
			{"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},
		
				{"label","VC23B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,1000},-- costb:MINUS
					 {"fun2",decprofit,5},
					{"ns","I am motivated to comply with your request, recruit.  Come to think of it, we are responding to a greasy oil spill - and it is quite possible the bugle players may ruin their instruments.  Given the circumstances, I will lower that expense to $500 – and I’ll get a small platoon of bugle players from the reserves instead.","VS_T1P2VC2_10.ogg"},
					{"pg","Thanks, please continue","VC24A"},
				

				{"label","VC23C"},
					-- scorec:+MD
					 {"fun2",subexpense,500},-- costc:MINUS
					 {"fun2",decprofit,5},
					{"ns1","You may actually have a point there, recruit.  Fish don’t respond to charges or stay motionless for taps - and such dissidence may compromise our authority with the locals at the site.  Do you know what, recruit?  I really feel I can work well with you.  I am going to lower my offer to $%d.","VS_T1P2VC2_11.ogg","cost"},
					{"pg","That’s pretty scary, Tom. But I appreciate the concession.","VC24A"},
				
				{"label","VC23D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","That is disgraceful, recruit! I am offering to deploy my forces to support your operation, and I find your attempts to outflank me to be disgraceful.  This confrontation has more potential for escalation than I thought – I think I am going to have to charge $%d now.","VS_T1P2VC2_12.ogg","cost"},
					{"pg","I see.  Well, I am sorry to have offended you.","VC24A"},
		

		{"label","VC24A"},
			{"ns1","Okay, recruit, that brings us to a total of $%d for the entire operation.  We really need to move out, so tell me - do we have a deal?","VS_T1P2VC2_13.ogg","cost"},
			{"pg","We have ourselves a deal!","VC25B"},
			{"pgs","Now we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VC24B","i"},
			{"pgs","Look, before we ‘move out’, I just wanted to ask – are you sure you really need those camouflage uniforms?","VC24C","j"},
			{"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},
		
				{"label","VC24B"},
					 -- scoreb:+EW
					 {"fun2",decprofit,10},-- costb:MINUS
					{"ns1","Actually, recruit, I am concerned at the prospect of collateral damage at this engagement, and I regret the inevitable encroachment of human rights that will occur. For the sake of humanity. I am going to lower my offer to $%d.  Agreed?","VS_T1P2VC2_14.ogg","cost"},
					{"pg","That’s quite an outlook, Tom.  Thanks.","VC25A"},
				

				{"label","VC24C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","I’ve just about reached my limit, recruit! Drop down and give me forty! Actually, cancel those orders.  I think I am simply going to modify my resource requirement. It will now cost $%d to undertake this operation.","VS_T1P2VC2_15.ogg","cost"},
					{"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},
				

				{"label","VC24D"},
					 -- scored:-EW
					 {"fun2",incprofit,6},-- costd:PLUS
					 {"ns1","I am sick and tired of your thoughtless contributions to this conversation, recruit!  I will not warn you again, but you are on my maggot list.  Do you understand me?  My price to deploy for this operation is now $%d. I’ve been patient with you, but now I am ready to give you a Viking funeral","VS_T1P2VC2_16.ogg","cost"},
					{"pg","I apologize, I didn’t mean to anger you.  Let’s move on,","VC25A"},
					

		{"label","VC25RENEG"},
		{"fun2",incprofit,2},

		{"label","VC25A"},
			{"ns1","I am happy we are on the same page now, recruit.  So, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T1P2VC2_17.ogg","cost"},
			{"pg","Okay, fair enough.  It’s a deal.","VC25B"},
			{"pgs","I was actually thinking about those riot shields you were going to buy. Don’t you think we could use some of the old ones you have lying around?","VC25C","l"},
		

				{"label","VC25B"},
-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



					{"ns1","That is affirmative, recruit.  To get the operation underway, you need to report to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you report back with the paperwork!  You’re dismissed, recruit!","VS_T1P2VC2_18.ogg","cost"},
					{"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},
				

				{"label","VC25C"},
					 -- scoreb:-EW
					 {"fun2",incprofit,3},-- costb:PLUS
					 {"fun",increneg},
					{"ns1","Listen, I’ve had just about enough of this, recruit. I am ready to extract my forces from this operation due to your ineptitude.  If you still want to do this, I’m charging $%d now, and that’s final!","VS_T1P2VC2_19.ogg","cost"},
					{"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
					{"pgs","This is just crazy -  I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
					-- scoreb:-EW
					-- costb:PLUS
				

						{"label","VC25D"},

-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

							{"ns1","I am relieved we are in agreement, recruit.  Tell Standon at City Hall to get a contract drawn up for $%d, and report back here so we can get this operation underway.","VS_T1P2VC2_20.ogg","cost"},
							{"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},
						
						{"label","VC25RENEGCHECK"},
						{"if","reneg","<",2,"VC25RENEG"},


		--				{"label","VC25E"},   -- Peter was here

-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},


							{"ns1","This negotiation is over, maggot!!  Please vacate these premises Get out of my sight and don’t report back until you have a contract for me for $%d!","VS_T1P2VC2_21.ogg","cost"},
							{"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},
		
--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************
		
		{"label","VC2ATD1"},
			{"ns1","I’d love to stand around and engage in small talk, but we are in the midst of a situation here.  You should double-time it to City Hall and report back once you’ve gotten Standon to draw up a contract for $%d.","VS_T1P2VC2_23.ogg","cost"},
			{"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

		{"label","VC3ASD1"},
			{"ns1","Remember; recruit, to commence this operation you need to get a contract for $%d.  Report back here with that document, on the double!","VS_T1P2VC3_09.ogg","cost"},
			{"pg","I’ll be back shortly with the contract. Thank you for the reminder..","END"},
			
--******************
--CONTRACT SIGNING
--******************

	{"label","VC3"},
		
		{"label","VC31A"},
			{"fun3",setvar,"scoreconvo","v3"},
			{"ns","Ten-hut recruit!  I am relieved to see you reporting back.  I am highly motivated for this assignment - did you come back with that contract for me to sign?","VS_T1P2VC3_01.ogg"},
			{"pg","Yes, I have it right here.","VC32X"}, 
			{"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},
		

				{"label","VC31B"},
					{"ns","That is pathetic, recruit.  Report back here with that contract immediately!  Dismissed!","VS_T1P2VC3_02.ogg"},
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
					{"ns","So, yes …uh-huh…wow!  This is superb, recruit! You have allocated even more resources than I requested!  Here you go! Report to City Hall with this contract, present it to the Mayor to countersign, and the operation will be underway!","VS_T1P2VC3_03.ogg"},
					{"pg","Thanks, I guess","VC33A"},
					 -- costa:Set to CC
				

				{"label","VC32B"},
					{"fun",getvendorcontract},
					{"ns","Okay, then let me have a…wait a second- this is inexcusable recruit!  You are truly a disgrace to your firm and to your profession!   What kind of maneuver is this?","VS_T1P2VC3_04.ogg"},
					{"pg","I am sorry…","VC32D"},

						{"label","VC32D"},
						{"fun2",incprofit,10},
							{"ns","This is not the amount we agreed upon, recruit!  My attorney is going to have something to say about this. Excuse me…hello, Gomer?  Yeah, they…uh-huh…okay, bye. Look, my lawyer will send over a contract with the right numbers which you will have to bring to City Hall – okay?","VS_T1P2VC3_06.ogg"},
							{"pgs","I am sorry for the oversight -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather have Will draw up a new contract.","VC32E","a"},
							{"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},

								{"label","VC32E"},
									-- scorea:+SG
									{"ns","I understand your position, recruit, but my attorney has advised me to use the contract he drew up.  He insists you get the Mayor to sign it if you want to deploy me, because it has the service fee we agreed on.","VS_T1P2VC3_10.ogg"},
									{"pg","Well, if that’s the way it has to be, I understand.","VC33A"},
								

								{"label","VC32F"},
									-- scoreb:-SG
									{"ns","10-4 recruit - this is the only way we can move forward.  Don’t worry about safety and security; I know how to handle this job!","VS_T1P2VC3_11.ogg"},
									{"pg","Alright, I understand.","VC33A"},

				
				{"label","VC32C"},
					{"ns","Well let’s check it out….uh huh….mm hmmm… This is outstanding, recruit.  Here you are.  Report to City Hall with this contract and present it to the Mayor to countersign, and the operation will be underway!","VS_T1P2VC3_05.ogg"},
					{"pg","Excellent!  I am looking forward to working with you.","VC33A"},
		
		
		{"label","VC33A"},
			{"ns","I am truly looking forward to this engagement, recruit.  Now if you’ll excuse me – I’m sure I’ll be seeing you around,  Carry on!","VS_T1P2VC3_07.ogg"},
			{"pg","I also look forward to working with you, as well, Tom.  Until next time!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************
		
		{"label","VC3ATD1"},
			{"ns","What are you doing here recruit!!? Re-deploy to City Hall immediately so the Mayor can sign that contract, on the double! The future of our City is at stake!","VS_T1P2VC3_08.ogg"},
			{"pg","Yes, thanks - I was just about to do that…","END"},
		
--******************
--END
--******************
	{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
	
}
return dialogtext
