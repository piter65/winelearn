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

{"label","T1P4vb1"},


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
 {"ns","Hello, there.  Do I know you?","VS_T1P4VB1_10.ogg"},
 {"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
 {"pg","Hey, you’re Jannis Economou! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Welcome to Ypoforo Ecosystems! My name is Jannis Economou. How may I help you?","VS_T1P4VB1_01.ogg"},
	 {"pgs","I am here looking for a disaster assessment consultant, and I understand you have a track record producing unbiased assessments for a variety of clients.","VB11B","a"},
	 {"pgs","I am looking for a disaster assessment consultant, but I’m concerned about shortcomings in your performance conducting the recent assessment for Statewide Widgets.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well it looks like you know your mythology! Here at Ypoforo Ecosystems, we pride ourselves on our bias-free reporting.  Please, go on and tell me more.","VS_T1P4VB1_02.ogg"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VB12A"},

		{"label","VB11C"},
		-- scoreb:-MD
		{"fun2", incprofit,2},-- costb:PLUS
		 {"ns","What ever gave you that idea? I am not sure you closely read your research, because there was no such shortcoming in our performance.  No matter, you seem like something is on your mind, so please - continue.","VS_T1P4VB1_03.ogg"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VB12A"},


	{"label","VB12A"},
	 {"ns","By the gods, an oil spill!  That is a very bad omen, indeed.  So why did you come here to talk about performing an ecological impact assessment?","VS_T1P4VB1_04.ogg"},
	 {"pgs","You have an impressive track record of client work, though I am concerned you may not have the most appropriate and effective monitoring equipment.","VB12B","c"},
	 {"pgs","I understand your team has a reputation world-wide for various assessments you have performed around the world.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","I am not sure that is entirely true, but it doesn’t really matter right now. There is a local crisis that needs attention, and I feel strongly about the environment – so I am ready to set everything aside and start work right away on this, should you need our services.","VS_T1P4VB1_05.ogg"},
		 {"pg","Well, I am happy to hear that you are on board.","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","The gods must have graced you with a gift for details. You seem to be very well prepared with your research!  I understand what’s at stake here - so should you need me, I am happy to drop everything focus on  the City’s needs.","VS_T1P4VB1_06.ogg"},
		 {"pg","Sounds great!","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","So is that all the information you need from me?","VS_T1P4VB1_07.ogg"},
	 {"pgs","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VB13B","e"},
	 {"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Now that you mention it, this surely is a tragedy for our community! I will devote my full attention to this crisis and get to the bottom of this mess should you need my help,  Well, if you’ll excuse me….it was a pleasure to meet you.","VS_T1P4VB1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Shame on you! I am offended by your proposition.  If I were you, I would be careful – the gods are always watching!  Now, if you decide to hire me, do it because it’s the right thing to do– not because I make some kind of unauthorized donation to the cause.","VS_T1P4VB1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

	{"label","VB1ATD1"},
	 {"ns","So, I have told you just about everything you need to know.  I understand if you have to get going and attend to your urgent task.  Just come back when you are ready to negotiate!","VS_T1P4VB1_13.ogg"},
	 {"pg","Thanks for your time!  I may be back soon to talk to you more about the crisis.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Welcome back! I am pleased to see you are back.  So have you decided to get me on board as your vendor?","VS_T1P4VB1_11.ogg"},
	 {"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss first","VB1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take to make a deal?","VB1ASD2B","g"},
	 
		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","You are certainly eager—however you don’t seem ready yet to negotiate, I think you should probably get the official go-ahead from the Mayor before we talk about performing an ecological impact assessment, just to be sure.","VS_T1P4VB1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward...","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

	{"label","VB2ASD1"},
	 {"ns","What are you doing back here?  You need to go get approval from your client if you decide you want to hire me - and then come back here when you are ready to negotiate.","VS_T1P4VB2_22.ogg"},
	 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Thank the Gods you’re back!  News of the disaster is everywhere – and I am anxious to get started on this assignment.  Have you gotten approval from the Mayor to go ahead and use us to perform the containment?","VS_T1P4VB2_01.ogg"},
	 {"pgs","You bet!  I think you can do great work for the city considering your experience assessing the impact of environmental disasters worldwide.","VB21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VB21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering your obsession with monitoring technology!","VB21D","b"},
	 {"pgs","Well, I would  hire you, but I’m concerned the team of experts that you use doesn’t have the right mix of experience and skills for this task.","VB21D","b"},


		{"label","VB21B"},
		 {"ns","So I shall see you later! Come back whenever you are ready to discuss the details.","VS_T1P4VB2_02.ogg"},
		 {"pg","Yes, I’ll be back when I am ready to negotiate! Bye!","END"},


		{"label","VB21C"},
		-- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","I am impressed by your heroic attention to detail! It seems like your decision is quite well researched!  So what exactly does the City want me to do?","VS_T1P4VB2_03.ogg"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VB22A"},


		{"label","VB21D"},
		-- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","Oh, really?  Well, it doesn’t seem like you really looked into this decision. No matter - there is no time to waste.  Please tell me the details of the task the City has for us.","VS_T1P4VB2_04.ogg"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VB22A"},


	{"label","VB22A"},
	 {"fun",halfcost},
	 {"ns1","Okay, so $%d is what we will need to undertake this. This includes $1250 for staffing costs of our command and control center and on-site assessment activities; $1500 for monitoring cells, buoys, air and water sample kits, and other measurement equipment, and $1250 in taxes and fees for redeeming frequent flier miles to fly specialists from the islands to New City for the assessment.","VS_T1P4VB2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
	 {"pgs","I thought you normally charge $750 for the taxes and fees associated with redeeming frequent flier miles to fly your team to New City!","VB22B","c"},
	 {"pgs","Wait – I know for a fact you usually charge less for monitoring cells, buoys, air and water sample kits!","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
	 -- scoreb:+MD
	 {"fun2",subexpense,500},-- costb:MINUS
	 {"fun2",decprofit,5},
		 {"ns1","You are quite correct.  The truth is that I normally do charge less for that - but I was going to redeem fewer of my frequent flier miles this time and pay for some of the tickets with cash.  But never mind, I have plenty I can use.  Let’s just say I reduce that expense – and I will charge you $%d.","VS_T1P4VB2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I am sorry, but I think you are incorrect.  If you had done your research, you would have seen that that is what I usually charge for our monitoring equipment! I can tell that you are going to be difficult so I think I am going to have to charge you $%d","VS_T1P4VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.  Let’s continue.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Those aren’t the tactics we use to negotiate here in New City.  The Gods are watching, my friend!  You know what? I’m increasing my fee – and am going to charge you $%d for this.  That should teach you a lesson.","VS_T1P4VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	{"ns","Okay, so the last expense item is $1000 that I will be needing for eyeglasses, magnification lenses, large-print levels, and other aids that I will be needing to see the small-size LED readouts on my monitoring equipment.","VS_T1P4VB2_09.ogg"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","You have charged less for your reading aids  – but moreover, the City is in crisis, and it’s not right for you to charge for that expense.","VB23B","f"},
	 {"pgs","Don’t you normally charge $500 for those items? I think you are trying to charge us too much!","VB23C","g"},
	 {"pg1s","Wait a second, are you kidding ??  I’d like to hire you - but I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		{"fun2",decprofit,5},
		 {"ns1","You may have a point - I think I actually should pay for that myself.  Come to think of it, I think that was very honorable of you to mention that to me – so I am going to lower my offer to $%d. Is that agreeable?","VS_T1P4VB2_10.ogg","cost"},
		 {"pg","Thanks Jannis- that would be great.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know; now that you mention it, I was going to start using designer reading glasses – but I really shouldn’t, given the circumstances…so I’ll just make do.  Let’s just say I keep it at $500 and charge you $%d.","VS_T1P4VB2_11.ogg","cost"},
		 {"pg","That sound fair, Jannis. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","That is disgraceful! I appreciate the urgency of our crisis, but I won’t stand for your winner-take-all tactics. Come to think of it, this really seems like it will be more of a demanding project than I thought –so I think I am going to have to charge $%d now.","VS_T1P4VB2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","Okay, so that brings us to $%d.  I think we should get started on this now, so let’s move forward. Are you ready to make a deal?","VS_T1P4VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now that we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – do we really need to fly in a team of specialists for this?","VB24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I was thinking that this disaster really could cause this city more trouble than a Trojan horse.  Given that this is an ecological crisis, I think we can compromise. I think we should lower my offer to $%d.","VS_T1P4VB2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I think I have had enough of your brash and disrespectful attitude.   I am really going to have to adjust my plan if I am to work with you on this project.  I think I should actually be charging you $%d.","VS_T1P4VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","I find your conduct to be truly distasteful.  If you want to get anywhere in business or in life, you should learn to be diplomatic.  Your approach scares me – I think I may have to adjust my price to $%d.","VS_T1P4VB2_16.ogg","cost"},
		 {"pg","I apologize, I didn’t mean to anger you.  Let’s move on.","VB25A"},
		 

	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","I am happy we are in agreement.  So, my charges total $%d, and that’s my final offer.","VS_T1P4VB2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VB25B"},
	 {"pgs","Actually, I was thinking about the $1500 cost for monitoring equipment.  Given that we only use it once, don’t you think we could rent it for less?","VB25C","l"},


		{"label","VB25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Thank Zeus, then!  We should get started quickly.  You should to go to City Hall and tell Will Standon to have a contract drawn up for $%d. I’ll see you when you come back with the paperwork!","VS_T1P4VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VB25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","By the gods!  I have had enough of this. I am just fed up with your haggling! Someone should teach you a lesson in respect!  I’m going to increase my fee for this project to $%d and that’s final!","VS_T1P4VB2_19.ogg","cost"},
		 {"pg","Deal! Before you increase your price anymore, please, let’s just shake on it!","VB25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VB25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Finally! Well, there is no time to waste.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get started with the assessment!","VS_T1P4VB2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},

		{"label","VB25RENEGCHECK"},
		{"if","reneg","<",2,"VB25RENEG"},
	-- Peter was here	{"label","VB25E"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","I have had it.  This negotiation is over.  I don’t want to see you again until you have a contract for me for $%d.","VS_T1P4VB2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","I’d love to stand around with you and talk about the olive harvest, but I think you should hurry up and get a contract drawn up for $%d at City Hall.","VS_T1P4VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns1","You again?  The disaster’s effects are spreading like tadziki on a gyro, so you should hurry back with a contract from City Hall as soon as you can so we can get started with the assessment.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P4VB3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","You are back!  Thank the gods. We are all very anxious to get started!  I hope you are here with a contract for me to sign.","VS_T1P4VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","Oh, I see.  Well, just come back as soon as you get a contract.  Remember, time passes with the tides!","VS_T1P4VB3_02.ogg"},
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
			 {"ns","Glad to hear it! So let’s take a look then…okay….eureka! That’s even more than I asked for!! I’ll sign this right here, and…there you go!","VS_T1P4VB3_03.ogg"},
			 {"pg","Thanks, I guess.","VB33A"},
			 -- costa:Set to CC
			 

			{"label","VB32B"},
			{"fun",getvendorcontract},
			 {"ns","Okay, then let me have a…wait - no!  This isn’t the price we agreed on! What kind of prank are you trying to pull?","VS_T1P4VB3_04.ogg"},
			 {"pg","I am sorry...","VB32D"},
			 
				{"label","VB32D"},
				{"fun2",incprofit,10},
				 {"ns","You know what? My attorney is going to have something to say about this. Excuse me. Hello, Georgos?  Yes, they…uh-huh…right, bye. Look, my lawyer will send over a contract with the right numbers. Just bring this one back to your client, okay?","VS_T1P4VB3_06.ogg"},
				 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  If possible, I’d rather haveWill draw up a new contract.","VB32E","a"},
				 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},
				 
					{"label","VB32E"},
					 -- scorea:+SG
					 {"ns","I understand your position, but my attorney has advised me that you must use his contract if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  Here we are; it’s coming in through the fax right now.","VS_T1P4VB3_10.ogg"},
					 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


					{"label","VB32F"},
					 -- scoreb:-SG
					 {"ns","Thankfully you understand this is the only way we can move forward.  You have nothing to fear; you can leave it to us to let you know what is going on!","VS_T1P4VB3_11.ogg"},
					 {"pg","Alright, I understand.","VB33A"},

			 
			{"label","VB32C"},
			 {"ns","If you please, then, allow me to examine the document. Okay, uh huh….mm hmmm. There you go! This looks perfect. Just bring the contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P4VB3_05.ogg"},
			 {"pg","Excellent!  I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","Well then, I am happy to be a part of your team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P4VB3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","What in the name of Olympus are you doing here!!?   Get back to City Hall and have the Mayor countersign that contract.  The future of our City is at stake!","VS_T1P4VB3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that...","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
