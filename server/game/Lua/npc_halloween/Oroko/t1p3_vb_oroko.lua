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

{"label","T1P3VB1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P3vb1"},

--**************
--Chose Someone else
--**************

{"label","VBBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VB1ASD1"},
 {"ns","Excuse me, do I know you?","VS_T1P3VB1_10.ogg"},
 {"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
 {"pg","Hey, you’re Oroko Nakashima! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Welcome to Running Rivers Corporation! My name is Oroko Nakashima. How may I help you?","VS_T1P3VB1_01.ogg"},
	 {"pgs","I am here looking for spill containment services, and I understand you have access to the  right mix of equipment for containing oil spills.","VB11B","a"},
	 {"pgs","I am here looking for spill containment services, but I need to be convinced that the aging fishermen you use for containment are competent enough to respond.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","I am greatly honored that you have noticed this! Please, go on and tell me more.","VS_T1P3VB1_02.ogg"},
		 {"pg","Very well then. There has been an oil spill in the New City River, and the City asked my firm to find someone to help them contain the disaster.","VB12A"},

		{"label","VB11C"},
		-- scoreb:-MD
		{"fun2", incprofit,2},-- costb:PLUS
		 {"ns","You dishonor yourself by talking of such nonsense.  Whatever gave you that idea?  It seems like there is something on your mind, so please, continue.","VS_T1P3VB1_03.ogg"},
		 {"pg","There has been an oil spill in the New City River, and the City asked my firm to find someone to help them contain to the disaster.","VB12A"},


	{"label","VB12A"},
	 {"ns","An oil spill in our river is certainly bad fortune for the City.  So why did you come here looking for spill containment services?","VS_T1P3VB1_04.ogg"},
	 {"pgs","You have an impressive track record of responding to local disasters – and so we thought you’d be good for the job.","VB12B","c"},
	 {"pgs","I understand your team will be able to transport all of the needed equipment to the disaster site themselves.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","I am not sure that is entirely true, but it doesn’t really matter.  The bottom line is I feel strongly about the environment – and I am ready to start work right away should you need our services.","VS_T1P3VB1_05.ogg"},
		 {"pg","Well, I am happy to hear that you are on board.","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Your careful consideration of details is impressive! You seem to have done much research.  I understand what’s at stake here, then - so should you need me, I am happy to drop everything to focus on  the City’s needs.","VS_T1P3VB1_06.ogg"},
		 {"pg","Sounds great!","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","Alright then, so is that everything you need to know from me?","VS_T1P3VB1_07.ogg"},
	 {"pgs","Yes, although I have some research to do. In the meantime, please consider this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VB13B","e"},
	 {"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Now that you mention it, this is a tragedy for our community. You can be assured I will devote my full attention and do what I can to get us all out of this mess, Nice to meet you.","VS_T1P3VB1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","I am offended by your proposition.   If you decide to hire me, do it because it’s the right thing to do– not because I decide to give out bribes.","VS_T1P3VB1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

	{"label","VB1ATD1"},
	 {"ns","So, I hope I have told you everything you need to know, I understand if you have to get going and attend to your urgent task.  Just come back when you are ready!","VS_T1P3VB1_13.ogg"},
	 {"pg","Thanks for your time.  I am off to look around further – but I may be back soon to talk to you more about the crisis.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Welcome back! I am pleased to see you.  Have you decided to get me on board as your vendor?","VS_T1P3VB1_11.ogg"},
	 {"pg","No, I don’t think so.  I have more research to do, and I have to talk to my boss first.","VB1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take to make a deal?","VB1ASD2B","g"},

		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","You are certainly eager—however you don’t seem ready to negotiate yet.  I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any spill containment services services, just to be sure.","VS_T1P3VB1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VB2ASD1"},
 {"ns","Why are you here?  You need to go get approval from your client if you decide you want to hire me - and then come back here when you are ready to negotiate.","VS_T1P3VB2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
		{"fun",clearreneg},
		{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Welcome back! News of the disaster is spreading like soy sauce in a fried rice bowl.  Have you gotten approval from the Mayor to go ahead and use us to perform the containment?","VS_T1P3VB2_01.ogg"},
	 {"pgs","You bet!  I think you can do great work for the city considering your experience responding to disasters worldwide.","VB21C","a"},
	 {"pg","No, I am just passing through.  See you around","VB21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering your obsession with containment technology!","VB21D","b"},
	 {"pgs","Well, I would  hire you, but I’m concerned the aging fishermen you hire will not be able to respond promptly enough…","VB21D","b"},


		{"label","VB21B"},
		 {"ns","So I shall see you later, Honorable One! Come back whenever you are ready to discuss the details.","VS_T1P3VB2_02.ogg"},
		 {"pg","Yes, I’ll be back when I am ready to negotiate! Bye!","END"},


		{"label","VB21C"},
		-- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","You seem most wise! It appears as though your decision is quite well researched.  So what exactly does the City want me to do?","VS_T1P3VB2_03.ogg"},
		 {"pg","We are looking for a firm that can contain the oil slick at the disaster site in preparation for recovery and disposal.","VB22A"},


		{"label","VB21D"},
		-- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","You do not seem very wise.  Have you really looked into this decision? Well, no matter… there is no time to waste.  Please tell me the details of the task the City has for us.","VS_T1P3VB2_04.ogg"},
		 {"pg","We are looking for a firm who can contain the oil slick at the disaster site in preparation for recovery and disposal.","VB22A"},


	{"label","VB22A"},
	{"fun",halfcost},
	 {"ns1","Okay, so we will need $%d to complete the project.  This consists of $1250 for mobilization of local fishermen and conservationists to serve as a labor force for the containment, $1500 for impermeable berms, liners, and booms for use in containment, and $1250 for bamboo baskets, fishing line, and rice paper sails and other retrofitting for Far Eastern fishing boats we use for containment.","VS_T1P3VB2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
	 {"pgs","I thought you normally charge $750 for the bamboo baskets, fishing line, and rice paper sails and other retrofitting for Far Eastern fishing boats used for containment.","VB22B","c"},
	 {"pgs","Wait – I know for a fact you usually charge less for your impermeable berms, liners, and booms","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You are quite correct.  The truth is that I normally do charge less for that - but the price of bamboo has been skyrocketing recently!  But never mind, we have plenty in stock we can use.  Let’s just say I reduce that expense – so now let’s just say I will need $%d.","VS_T1P3VB2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I am sorry, but I think you are incorrect.  If you had done your research, you would have seen that is what I usually charge for our containment equipment.! I can tell you are going to be difficult so I think I am going to have to charge $%d for this job.","VS_T1P3VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.  Let’s continue.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offended!  You should refrain from that kind of talk before you dishonor yourself any further.  Those aren’t the tactics we use to negotiate here in New City…so… I’m increasing my fee – and am going to charge $%d for this.","VS_T1P3VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so finally I will need $1000 for a crew of acupuncturists, herbalists, and other eastern remedies to heal and comfort the conservationists and fishermen responding to the disaster, which brings us to $%d. So that is my offer.  Do we have a deal?","VS_T1P3VB2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","You have charged less for your Eastern remedyists  – but moreover, the City is in crisis, and it’s not right for you to charge for that expense.","VB23B","f"},
	 {"pgs","Don’t you normally charge $500 for that expense? I think you are trying to charge us too much!","VB23C","g"},
	 {"pg1s","Wait a second, are you kidding ??  I’d like to hire you - but I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		{"fun2",decprofit,5},
		 {"ns1","Everything is possible - I think I actually should pay for that myself.  Come to think of it, I think that was very honorable of you to mention that to me – so I am going to lower my offer to $%d. Is that agreeable?","VS_T1P3VB2_10.ogg","cost"},
		 {"pg","Thanks Oroko- that would be great.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know; now that you mention it, I was going to start using different remedyists – but I really shouldn’t raise my prices, given the circumstances…so I’ll just make do.  Let’s just say I keep it at $500 and charge you $%d.","VS_T1P3VB2_11.ogg","cost"},
		 {"pg","That sound fair, Oroko. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","That is disgraceful! I appreciate the urgency of our crisis, but I won’t stand for your tactics. Come to think of it, this really seems like it will be more of a demanding project than I thought –so I think I am going to have to charge $%d now.","VS_T1P3VB2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","Okay, so that brings us to $%d.  I think we should get started on this now. Are we in agreement?","VS_T1P3VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – do we really need to retrofit your fishing vessels for this?","VB24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, this disaster really could cause this city more trouble than a water buffalo  in a figurine shop.  Given that this is an ecological crisis, I think we can compromise. I think we should lower my offer to $%d.","VS_T1P3VB2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I am growing weary of your lack of respect.  I am really going to have to think twice about working with such a foolhardy person.  I think I am going to have to charge you $%d.","VS_T1P3VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","I find your conduct to be truly disgraceful.  If you want to get anywhere in business or in life, you should learn to be diplomatic.  Your incompetence scares me – I think I may have to adjust my price to $%d.","VS_T1P3VB2_16.ogg","cost"},
		 {"pg","I apologize, I didn’t mean to anger you.  Let’s move on,","VB25A"},
		 

	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","I am happy we are in agreement.  So, my charges total $%d, and that’s my final offer.","VS_T1P3VB2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VB25B"},
	 {"pgs","Well, I was actually thinking about the $1500 cost you have for your Eastern remedies. Do you think we really need this?","VB25C","l"},


		{"label","VB25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Right then, so the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d. I’ll see you when you come back with the paperwork!","VS_T1P3VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VB25C"},
		-- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","I’ve had about enough of this. I am fed up with your haggling.  Someone should teach you a lesson in respect!  I’m going to charge $%d for this project now, and that’s final!","VS_T1P3VB2_19.ogg","cost"},
		 {"pg","Deal! Before you increase your price anymore, please, let’s just shake on it!","VB25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


			{"label","VB25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
			 {"ns1","Finally! Well, there is no time to waste.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get started with the containment!","VS_T1P3VB2_20.ogg","cost"},
			 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},

			{"label","VB25RENEGCHECK"},
			{"if","reneg","<",2,"VB25RENEG"},


--Peterwashere			{"label","VB25E"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","I have had it.  This negotiation is over.  I don’t want to see you again until you have a contract for me for $%d. Now, get out of my sight.","VS_T1P3VB2_21.ogg","cost"},
			 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","I’d love to talk with you, but I think you should hurry up and get a contract drawn up for $%d at City Hall.","VS_T1P3VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns1","You again?  The oil spill is not getting any smaller - so you should hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P3VB3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","I am relieved to see you! We are all very anxious to get started!  I hope you are here with a contract for me to sign.","VS_T1P3VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","Oh, I see.  Well, just come back as soon as you get a contract.  Remember, time is of the essence!","VS_T1P3VB3_02.ogg"},
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
			 {"ns","So let’s take a look then, shall we?  Okay….mm-hmm….oh, my ! Look, that’s even more than I asked for!! Of course I’ll sign this…here you go!!","VS_T1P3VB3_03.ogg"},
			 {"pg","Thanks, I guess.","VB33A"},
			 -- costa:Set to CC


			{"label","VB32B"},
			{"fun",getvendorcontract},
			 {"ns","Okay,  let me have a…wait - .no!  This isn’t the price we agreed on! Are you trying to deceive me?","VS_T1P3VB3_04.ogg"},
			 {"pg","I am sorry…","VB32D"},
			
				{"label","VB32D"},
				{"fun2",incprofit,10},
				 {"ns","This is less than the amount we agreed on!  My attorney is going to have something to say about this. Excuse me. Hello, Minako?  Yesah, they…uh-huh…okay, bye. Look, my lawyer will send over a contract with the right numbers. Just bring this new contract back to your client - okay?","VS_T1P3VB3_06.ogg"},
				 {"pgs","I am sorry for the oversight -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VB32E","a"},
				 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},
				 
					{"label","VB32E"},
					 -- scorea:+SG
					 {"ns","I understand your position, but my attorney has advised me that you must use her contract if you want me on board.  She insists you get the Mayor to sign it because it has the service fee we agreed on.  Here we are; it’s coming in through the fax right now.","VS_T1P3VB3_10.ogg"},
					 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


					{"label","VB32F"},
					 -- scoreb:-SG
					 {"ns","You are wise to understand this is the only way we can move forward.  You have nothing to fear; everything is in our competent hands now.","VS_T1P3VB3_11.ogg"},
					 {"pg","Alright, I understand.","VB33A"},


			{"label","VB32C"},
			 {"ns","Please allow me to examine the document, then. Okay, uh huh….mm hmmm. There you go! This looks perfect. Just bring the contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P3VB3_05.ogg"},
			 {"pg","Excellent!  I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","I am really look forward to being part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P3VB3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","Excuse me but, what on earth are you doing here!!?   Please get back to City Hall and have the Mayor countersign that contract.  The future of our City is at stake!","VS_T1P3VB3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
