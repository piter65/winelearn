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

{"label","T1P2VB1"},


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

{"label","wp"},
	{"n","Hello. Sorry, but I am busy right now. I'll see you around."},
	{"pg","Alright","END"},

--*********************
--CAN'T INTERVIEW YET
--*********************

		{"label","VB1ASD1"},
			{"ns","Howdy!  Do I know you?","VS_T1P2VB1_10.ogg"},
			{"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
			{"pg","Hey, you’re John Gray! I’ve heard of you!","END"},
			
--****************
--INTERVIEW
--****************

	{"label","VB1"},
		{"label","VB11A"},
			{"fun",incvendorsvisited},
			{"fun",incvendor2},
			{"fun",talkedtovendor2},
			{"fun3",setvar,"scoreconvo","vb1"},
			{"ns","Well, hello there!  Welcome to First Responders.  My name is John Gray. Come on in and tell me how I can help you.","VS_T1P2VB1_01.ogg"},
			{"pgs","I am here looking for emergency reponse services, and I hear you may be able to get up to the minute medical equipment that is crucial for an emergency response engagement at an ecological disaster.","VB11B","a"},
			{"pgs","I am here looking for emergency reponse services – but you need to convince me you have the equipment needed to respond to an ecological disaster.","VB11C","b"},

				{"label","VB11B"},
					 -- scorea:+MD
					 {"fun2", decprofit,2}, -- costa:MINUS
					{"ns","I like the cut of your jib! That’s one of the things we do best here.  You have my attention now – so go ahead and tell me what’s on your mind.","VS_T1P2VB1_02.ogg"},
					{"pg","Well, there has been an oil spill in the New City River, and the City asked my firm to find emergency response services  firms to help them respond to the disaster.","VB12A"},
				
				{"label","VB11C"},
				-- scoreb:-MD
				{"fun2", incprofit,2},-- costb:PLUS
					{"ns","What in Dixie Hill are you talking about? You seem more lost than a goose in a snowstorm.   No matter, you seem like you’re here on important business, so I’ll let you continue.  Please, go on.","VS_T1P2VB1_03.ogg"},
					{"pg","Well, there has been an oil spill in the New City River, and the City asked my firm to find emergency response services firms to help them respond to the disaster. Right then, ’emergency response to the city during this oil spill","VB12A"},
		

		{"label","VB12A"},
			{"ns","Well I reckon this here oil spill has presented the City with a crisis situation.  So why did you come to us, exactly, looking for emergency response services?","VS_T1P2VB1_04.ogg"},
			{"pgs","You have a solid track record of managing crowds at disaster sites – so I’m hoping you’ll be able to make sure  everyone is safe and sound.","VB12B","c"},
			{"pgs","I understand your team will be able to respond rapidly so that we can minimize human tragedy as the crisis develops.","VB12C","d"},
		
				{"label","VB12B"},
					 -- scorea:-MD
					 {"fun2", incprofit,2},-- costa:PLUS
					{"ns","Well sure, I reckon we can try and handle a small crowd.  Of course, it doesn’t really matter; the bottom line is I feel strongly about the environment – and I am ready to start work right away if you need me to.","VS_T1P2VB1_05.ogg"},
					{"pg","Well, I am happy to hear that you feel that way.","VB13A"},
				

				{"label","VB12C"},
					 -- scoreb:+MD
					 {"fun2",decprofit,2},-- costb:MINUS
					{"ns","Well hot dog! You sure seem to know your stuff!  I understand what’s at stake here, then - so should you need me, I am happy to drop everything to focus on  the City’s needs.","VS_T1P2VB1_06.ogg"},
					{"pg","Sound great!","VB13A"},
		

		{"label","VB13A"},
			{"fun", incinterv},
			{"ns","Alright then, so is that everything you need to know from me?","VS_T1P2VB1_07.ogg"},
			{"pgs","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VB13B","e"},
			{"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VB13C","f"},
		
				{"label","VB13B"},
					 -- scorea:+EB
					 {"fun2",decprofit,2},-- costa:MINUS
					{"ns","Yes, I was just thinking about it and this here oil spill has gotten me madder than a wet hen.  You can be sure as Dixie Hill, that I want to help get us all out of this mess, – so I reckon I will do what I can.  See you around!","VS_T1P2VB1_08.ogg"},
					{"pg","The pleasure was mine.  I’ll see you around!","END"},
				

				{"label","VB13C"},
					 -- scoreb:-EB
					 {"fun2",incprofit,2},-- costb:PLUS
					{"ns","I am going to have to stop you right there, because you’re eating a little high on the hog. I do not take kindly to out-of-towners moseying in and demanding bribes! If you decide to hire me, do it because it’s the right thing to do– not because I give out kickbacks!","VS_T1P2VB1_09.ogg"},
					{"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},
				

--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

		{"label","VB1ATD1"},
			{"ns","I reckon I’ve told you just about everything you need to know, I understand if you have to get going and attend to your urgent task.  Just come on back when you want to work out the details!","VS_T1P2VB1_13.ogg"},
			{"pg","Thanks for your time.  I am off to look around further – but I may be back soon to talk to you more about the crisis","END"},

					
--*******************
--CAN'T NEGOTIATE YET
--*******************

		{"label","VB1ASD2A"},
			{"ns","Welcome back! I sure am happy to see you.  So have you decided to get me on board as your vendor?","VS_T1P2VB1_11.ogg"},
			{"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss first","VB1ASD2C"},
			{"pgs","You bet!  I’d love to get you on board.  What will it take to make a deal?","VB1ASD2B","g"},
				
				{"label","VB1ASD2B"},
				-- scoreb:-SS
					{"ns","Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any emergency response services, just to be sure","VS_T1P2VB1_12.ogg"},
					{"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},

				{"label","VB1ASD2C"},
				-- scorea:+SS
				{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

		{"label","VB2ASD1"},
			{"ns","What are you doin’ back here?  You should go get approval from your client if you decide you want to hire me - and then come back here so that we can negotiate.  Now please excuse me.","VS_T1P2VB2_22.ogg"},
			{"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB2"},
		
		{"label","VB21A"},
			{"fun",clearreneg},
			{"fun3",setvar,"scoreconvo","v2"},
			{"ns","Welcome back! News of the disaster is spreading like a bird flu in a chicken coop – so I reckon you’re here to talk about those emergency services you were asking after.  Have you gotten approval from the Mayor to engage my services?","VS_T1P2VB2_01.ogg"},
			{"pgs","You bet!  I think you can do great work for the city considering your experience as a health professional working at Rosenfield Medical.","VB21C","a"},
			{"pg","No, I am just passing through.  See you around.","VB21B"},
			{"pgs","You bet!  I am excited to see what you can do for the city considering your illustrious surgery career!","VB21D","b"},
			{"pgs","Well, I would  hire you, but I’m concerned that your firm may not be able to respond to the disaster promptly enough…","VB21D","b"},
		

				{"label","VB21B"},
					{"ns","Well then I’ll see you later!  Just come back as soon as you are ready to chat about the details.","VS_T1P2VB2_02.ogg"},
					{"pg","Yes, I’ll be back when I am ready to negotiate! Bye!","END"},
				

				{"label","VB21C"},
					-- scorea:+MD
					{"fun2",decprofit,2}, -- costa:MINUS
					{"fun",incvendor2},
					{"fun",talkedtovendor2},
					{"ns","Well that’s mighty fine that you noticed! It sure does sound like you know a thing or two.  So what exactly does the City want me to do?","VS_T1P2VB2_03.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services.","VB22A"},
				

				{"label","VB21D"},
				-- scored:-MD
				{"fun2",incprofit,2}, -- costd:PLUS
					{"fun",incvendor2},
					{"fun",talkedtovendor2},
					{"ns","I reckon you don’t have your story exactly right. Have you really looked into this decision? Well, no matter… there is no time to waste.  Please tell me the details of the task the City has outlined.","VS_T1P2VB2_04.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services.","VB22A"},
		

		{"label","VB22A"},
			{"fun",halfcost},
			{"ns1","So let’s talk turkey, then: We normally charge $%d for a job like this.  This consists of the $2000 needed to rapidly mobilize enough professionals to respond, $750 for durable and disposable medical equipment, and $1250 for the Dixie barbeque we set up while on longer  engagements..","VS_T1P2VB2_05.ogg","cost"},
			{"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
			{"pgs","I thought you normally charge $750 for the BBQ supplies your staff likes on site when they work on long engagements.","VB22B","c"},
			{"pgs","Wait – I know for a fact that you usually charge less to mobilize your staff in time for a prompt response!","VB22C","d"},
			{"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},
		
				{"label","VB22B"},
					-- scoreb:+MD
					{"fun2",subexpense,500},-- costb:MINUS
					{"fun2",decprofit,5},
					{"ns1","Yes, well, the truth is that I normally do charge less for that - but I reckoned I’d upgrade my service offering for the City in this particular case…but never mind. Let’s just say I charge my usual price for that expense, and shave off a few more bucks……and say that my price is now $%d.","VS_T1P2VB2_06.ogg","cost"},
					{"pg","That works.  Let’s continue.","VB23A"},
				
				{"label","VB22C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","That’s just not right. If you had done your research, you would have seen that that’s my usual charge forto mobilizing my staff to respond in a hurry! I can tell you are going to be as difficult as a mule chewing on bumblebees – so I think I am going to have to charge $%d for this job.","VS_T1P2VB2_07.ogg","cost"},
					{"pg","Well, I am sorry to have offended you.  Let’s continue.","VB23A"},
					-- costa:PLUS
				

				{"label","VB22D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","Now I think you’re eating a little high on the hog.  I don’t take kindly to those tactics …so you know what? I’m increasing my fee – and am going to charge $%d for this.","VS_T1P2VB2_08.ogg","cost"},
					{"pg","Sorry, I didn’t mean to offend you.","VB23A"},
		

		{"label","VB23A"},
			{"fun",threequartercost},
			{"ns1","Okay, so the last of my expenses is $1000 for massage therapists to provide my staff with restorative body and facial treatment after their long shifts, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P2VB2_09.ogg","cost"},
			{"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
			{"pgs","Not only have I seen you charge less for that – but I think the City is in crisis here, and it’s not right for you to charge for that expense.","VB23B","f"},
			{"pgs","Don’t you normally charge $500 for that expense? I think you are trying to charge us too much!","VB23C","g"},
			{"pg1s","Wait a second, are you kidding ??  I’d like to hire you - but I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},
		
				{"label","VB23B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,1000},-- costb:MINUS
					{"fun2",decprofit,5},
					{"ns1","Goll –lee! You sure have a point. I’ll just knock that expense right off there!  Come to think of it, I think I’m takin’ a bit of a shine to you – so I am going to lower my offer to $%d, just for you.  What do you say?","VS_T1P2VB2_10.ogg","cost"},
					{"pg","Thanks John- that would be great.","VB24A"},
				

				{"label","VB23C"},
					 -- scorec:+MD
					 {"fun2",subexpense,500},-- costc:MINUS
					 {"fun2",decprofit,5},
					{"ns1","You know; now that you mention it, I was going to start using different massage therapists – but I really shouldn’t raise my rate, given the circumstances…so I’ll just make do.  Let’s just say I keep it at $500 and charge you $%d.","VS_T1P2VB2_11.ogg","cost"},
					{"pg","That sound fair, John. Thanks.","VB24A"},
				
				{"label","VB23D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","I think if you listened closely to those pennies you’re trying to pinch, you’d hear eagles screaming.  I appreciate the urgency of our crisis, but I won’t stand for your tactics.  This really seems like a more demanding job than I thought –so I think I am going to have to charge $%d now.","VS_T1P2VB2_12.ogg","cost"},
					{"pg","I see.  Well, I am sorry to have offended you.","VB24A"},
		

		{"label","VB24A"},
			{"ns1","Right then, so that brings us to $%d.  I reckon we really should get started on this, so tell me -do we have a deal?","VS_T1P2VB2_13.ogg","cost"},
			{"pg","We have ourselves a deal!","VB25B"},
			{"pgs","Now we’ve covered all your expenses – and considering that this is a crisis, do you think you could forgo some profit?","VB24B","i"},
			{"pgs","Before we go ahead with this, I just wanted to ask – do we really need all of that durable and disposable medical equipment?","VB24C","j"},
			{"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},
		
				{"label","VB24B"},
					 -- scoreb:+EW
					 {"fun2",decprofit,10},-- costb:MINUS
					{"ns1","That’s funny, I was actually thinking about how this disaster really could cause this city more trouble than a rooster in a henhouse.  Given that this is an ecological crisis, I reckon I can compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P2VB2_14.ogg","cost"},
					{"pg","I am happy you see it that way.  Thanks.","VB25A"},
				

				{"label","VB24C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","You know, I’ve had enough of your fast-talkin’ attitude.  You’re getting to be like a goat in the briar patch , and I am really going to have to adjust my plan.  I think I am going to have to charge you $%d.","VS_T1P2VB2_15.ogg","cost"},
					{"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},
				

				{"label","VB24D"},
					 -- scored:-EW
					 {"fun2",incprofit,6},-- costd:PLUS
					{"ns","Now you’ve gone and got me mad.  I’m done reckonin’ - so I reckon it’s time to start fixin’.  If you’re fixin’ on getting anywhere in business or in life, you should learn to be diplomatic.","VS_T1P2VB2_16.ogg"},
					{"pg","I apologize, I didn’t mean to anger you.  Let’s move on,","VB25A"},
					

		{"label","VB25RENEG"},
		{"fun2",incprofit,2},
		
		{"label","VB25A"},
			{"ns1","I am happy we are on the same page.  So, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T1P2VB2_17.ogg","cost"},
			{"pg","Alright then.  It’s a deal.","VB25B"},
			{"pgs","Well, I was actually thinking about your massage therapists. How necessary is this expense?","VB25C","l"},
		

				{"label","VB25B"},

-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



					{"ns1","Fine.  The next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P2VB2_18.ogg","cost"},
					{"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},
				

				{"label","VB25C"},
				-- scoreb:-EW
					 {"fun2",incprofit,3},-- costb:PLUS
					 {"fun",increneg},
					{"ns1","Listen, I’ve had about enough of this.  You are just needlessly haggling.  I’m so worked up, I’m fixin’ on not doing this at all - so if you still want to do this, I’m charging $%d now, and that’s final!","VS_T1P2VB2_19.ogg","cost"},
					{"pg","Before you increase your price anymore, please, let’s just shake on it!","VB25D"},
					{"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
					-- scoreb:-EW
					-- costb:PLUS
				

						{"label","VB25D"},

-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



							{"ns1","Finally! Well, there is no time to waste, now.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get right to work!","VS_T1P2VB2_20.ogg","cost"},
							{"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},
						
						{"label","VB25RENEGCHECK"},
						{"if","reneg","<",2,"VB25RENEG"},

--		peter was here				{"label","VB25E"},
-- Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},
			
							{"ns1","Shazam!  This negotiation is over! I don’t want to see you again until you have a contract for me for $%d. Now, get out of my sight.","VS_T1P2VB2_21.ogg","cost"},
							{"pg","Sorry about that.   I’ll go to City Hall now and get the papers drawn up.","END"},
		
--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

		{"label","VB2ATD1"},
			{"ns1","I’d love to stand around and shoot the breeze, baws, but I think you should hurry up and get a contract drawn up for $%d at City Hall.","VS_T1P2VB2_23.ogg","cost"},
			{"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

		{"label","VB3ASD1"},
			{"ns1","Oh, it’s you.  Look, is the dang clock is ticking away, so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P2VB3_09.ogg","cost"},
			{"pg","I’ll be back shortly with the contract. Thank you for the reminder..","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB3"},
		
		{"label","VB31A"},
			{"fun3",setvar,"scoreconvo","v3"},
			{"ns","There you are! I feel like a bull in a barn fire –I can’t wait to get out of here and get started!  I hope you are here with a contract for me to sign.","VS_T1P2VB3_01.ogg"},
			{"pg","Yes, I have it right here.","VB32X"},
			{"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},
		

				{"label","VB31B"},
					{"ns","Well, then I reckon you should just come back as soon as you get a contract.  Remember, time is a factor here, so the sooner we get going, the better.","VS_T1P2VB3_02.ogg"},
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
					{"ns","Glad to hear it! So let’s take a look then…okay….I see.  Shazamm! Look at that!  That’s even more than I asked for!! Of course I’ll sign this…here you go!!","VS_T1P2VB3_03.ogg"},
					{"pg","Thanks, I guess","VB33A"},
					 -- costa:Set to CC
				

				{"label","VB32B"},
					{"fun",getvendorcontract},
					{"ns","Okay, then let me have a…wait - .woahno!  This isn’t the price we agreed on! What kind of monkey shines are you trying to pull here?","VS_T1P2VB3_04.ogg"},
					{"pg","I am sorry…","VB32D"},

						{"label","VB32D"},	
						{"fun2",incprofit,10},
							{"ns","This is less than we agreed!  My attorney is going to have something to say about this. Excuse me. Hello, Colonel?  Yeah, they…uh-huh…okay, bye. Look, my lawyer will send over a contract with the right numbers. Just bring this new contract back to your client – okay?","VS_T1P2VB3_06.ogg"},
							{"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather have Will draw up a new contract.","VB32E","a"},
							{"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},

								{"label","VB32E"},
								-- scorea:+SG
									{"ns","I understand your position, however my attorney, the Honorable Colonel Parker M. Parker, has advised me that you must use his contract if you want me on board.  He insists you get the Mayor to sign because it has the service fee we agreed on. Here; it’s coming in through the fax now.","VS_T1P2VB3_10.ogg"},
									{"pg","Well, if that’s the way it has to be, I understand.","VB33A"},
								

								{"label","VB32F"},
								-- scoreb:-SG
									{"ns","I’m pleased as punch that you understand that this is the only way we can move forward.  Don’t worry, I’ll still do my best to make sure folks at the disaster site are as safe as cows in a barnyard.","VS_T1P2VB3_11.ogg"},
									{"pg","Alright, I understand.","VB33A"},


				{"label","VB32C"},
					{"ns","Well let’s check it out….uh huh….mm hmmm…there you go! This looks perfect. Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P2VB3_05.ogg"},
					{"pg","Excellent!  I am looking forward to working with you.","VB33A"},
				
		
		{"label","VB33A"},
			{"ns","Well so long then.  I am really looking forward to being part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P2VB3_07.ogg"},
			{"pg","I also look forward to working with you.  Now if you’ll excuse me – I’ll be seeing you around.","END"},
		
--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

		{"label","VB3ATD1"},
			{"ns","What in Dixie Hill are you doing here!!?   Get back to City Hall and have the Mayor sign that contract.  The future of our City is at stake!","VS_T1P2VB3_08.ogg"},
			{"pg","Yes, thanks - I was just about to do that…","END"},
		
--******************
--END
--******************
	{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
	
}
return dialogtext
