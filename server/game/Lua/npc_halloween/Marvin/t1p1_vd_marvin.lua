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

{"label","T1P2VD1"},


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

{"label","wp"},
	{"n","Hello. Sorry, but I am busy right now. I'll see you around."},
	{"pg","Alright","end"},
	
--THE FIRST ONE

{"label","VD11A"},
			{"fun",incvendorsvisited},
			{"fun",incvendor4},
			{"fun",talkedtovendor4},
			{"fun3",setvar,"scoreconvo","vd1"},
	{"ns","Welcome to Media Relations, Inc.! My name is Marvin Moneymaker. May I take your wallet?  I mean, your coat??","VS_T1P1VD1_01.ogg"},
	{"pgs","No, thanks. There has been an oil spill in the New City river,  Personally, I  am concerned that you may not be able to communicate the facts to the press clearly and concisely e– but I’ve been told you’d be able to help, regardless.","VD11B","a"},
	{"pgs","No, thank you. The New City River, has suffered and the City needs help-and I am confident that given how successful you are at doing a good job for your clients, you’d be able to help.","VD11C","b"},

{"label","VD11B"},
-- scorea:+MD
{"fun2", decprofit,2}, -- costa:MINUS
	{"ns","Well, I don’t want to argue with a customer. You’re here because the future of our City is at stake..and I want to help.  Please, tell me about what you intend to accomplish.","VS_T1P1VD1_02.ogg"},
	{"pg","Glad to hear it.  You see, the City asked my firm to look into finding someone to provide media relations services during this oil spill crisis.","VD12A"},

{"label","VD11C"},
-- scoreb:-MD
{"fun2", incprofit,2},-- costb:PLUS
	{"ns","Well, what do I say to that?  Ummm...well...that’s right on the money! Now please, tell me more about why you are here. My curiosity is piqued...","VS_T1P1VD1_03.ogg"},
	{"pg","I guess I got my facts confused.  I am here because the city could use help from a media relations firm to respond immediately to the crisis.","VD12A"},


{"label","VD12A"},
	{"ns","Well why didn’t you say so in the first place?  It sounds like you’ve come to the right firm!  So tell me, why exactly did you come here for media relations services?","VS_T1P1VD1_04.ogg"},
	{"pgs","Well I hear that you are able to present the positive side of a story to the press, and we could use that right now.","VD12B","c"},
	{"pgs","I understand you have been very financially successful – so that means you must be doing something right.","VD12C","d"},

{"label","VD12B"},
-- scorea:-MD
{"fun2", incprofit,2},-- costa:PLUS
	{"ns","Yeah, (<ahem>), that’s me! I am glad you think I could be of use to you.  I understand this is a crisis and so I am ready to drop everything and give it the urgent attention it deserves -- should you need me.","VS_T1P1VD1_05.ogg"},
	{"pg","Okay, great!","VD13A"},


{"label","VD12C"},
-- scoreb:+MD
{"fun2",decprofit,2},-- costb:MINUS
	{"ns","Right you are!  Indeed, they don’t call me ’Moneymaker’ for nothing! Now, I have heard all about the oil spill on the news.  I believe strongly in environmental causes, and so I am completely ready to drop everything and get to work immediately","VS_T1P1VD1_06.ogg"},
	{"pg","Alright then, let’s continue","VD13A"},


{"label","VD13A"},
{"fun", incinterv},
	{"ns","So is that all you need to make your decision whom to hire?","VS_T1P1VD1_07.ogg"},
	{"pgs","Yes, although I have some research to do. In the meantime, please consider this is a crisis – and you will help us by only charging for what is absolutely necessary for the job..","VD13B","e"},
	{"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VD13C","f"},

{"label","VD13B"},
-- scorea:+EB
{"fun2",decprofit,2},-- costa:MINUS
	{"ns","Well then, good luck with everything... I hope I will see you again soon.  I sure hope the City will pay up and get us all out of this mess!","VS_T1P1VD1_08.ogg"},
	{"pg","The pleasure was mine.  I’ll see you around!","END"},


{"label","VD13C"},
-- scoreb:-EB
{"fun2",incprofit,2},-- costb:PLUS
	{"ns","Is that so?  Well, I get your drift, and my name may be Moneymaker but payoffs??  No way buster!  If you want my services you have to pay... and pay.","VS_T1P1VD1_09.ogg"},
	{"pg","Right then, I am sorry to have offended you.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VD1ASD1"},
	{"ns","Excuse me, do I know you????","VS_T1P1VD1_10.ogg"},
	{"pg","No, I don’t think we’ve been introduced.  Pardon me...","END"},
	{"pg","Hey, you’re Marvin Moneymaker! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

{"label","VD1ASD2A"},
	{"ns","Well aren’t you a site for poor, I mean, sore eyes! Are you back because you need me to start work for the City?","VS_T1P1VD1_11.ogg"},
	{"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss, first ","VD1ASD2C"},
	{"pgs","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B","g"},

{"label","VD1ASD2B"},
-- scoreb:-SS
	{"ns","Are you sure about that?  You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any media relations services, just to be sure.","VS_T1P1VD1_12.ogg"},
	{"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward...","END"},

		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VD1ATD1"},
	{"ns","Since I’ve already told you everything you need to know, I understand if you have to get going and attend to your urgent task.  Good luck.","VS_T1P1VD1_13.ogg"},
	{"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more about the crisis.  Goodbye!","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

{"label","VD21A"},
{"fun",clearreneg},
{"fun3",setvar,"scoreconvo","v2"},
	{"ns","I am happy to see you’re back.  Now, there is money at stake here, so we have no time to waste. Have you gotten approval from the Mayor to engage my services?","VS_T1P1VD2_01.ogg"},
	{"pgs","You bet!  I am hopeful about what you can do for the city, given your record of creative and innovative marketing. ","VD21C","a"},
	{"pg","No, I am just passing through.  See you around","VD21B"},
	{"pgs","You bet!  I am excited to see what you can do for the city considering the work you did for Interstate Containment.","VD21D","b"},
	{"pgs","We like your firm’s track record clearly communicating complicated technical data to the press & public.","VD21D","b"},


{"label","VD21B"},
	{"ns","Well so long then!  I hope to see you back here as soon as you are ready to pay, err, negotiate.","VS_T1P1VD2_02.ogg"},
	{"pg","Sure thing! Bye!","END"},


{"label","VD21C"},
-- scorea:+MD
{"fun2",decprofit,2}, -- costa:MINUS
				{"fun",incvendor4},
				{"fun",talkedtovendor4},
	{"ns","I’m flattered!  I am impressed that you have been following my career.  Clearly, you display great  attention to detail. So what does the City want me to do?","VS_T1P1VD2_03.ogg"},
	{"pg","We are looking  for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VD22A"},


{"label","VD21D"},
-- scored:-MD
{"fun2",incprofit,2}, -- costd:PLUS
				{"fun",incvendor4},
				{"fun",talkedtovendor4},
	{"ns","Never mind that you aren’t prepared – it is your lack of attention to detail that is inexcusable.  Never mind - there is no time to waste.  Please tell me the details of the task the City has outlined.","VS_T1P1VD2_04.ogg"},
	{"pg","We are looking  for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VD22A"},


{"label","VD22A"},
{"fun",halfcost},
{"ns1","Let’s get down to business: I usually charge $%d.  I need $1000 for my team of door- to- door salesmen to promote the City’s media messages. Next, I’ll need $1000 for motivational CD’s and inspirational posters . And finally, I need $2000 for a stylist to keep me looking good for interviews.","VS_T1P1VD2_05.ogg","cost"},
	{"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
	{"pgs","I thought you normally charge $1500 for the stylist you hire during intensive client engagements!","VD22B","c"},
	{"pgs","Wait - $1000 for books and motivational CDs seems a little high to me.","VD22C","d"},
	{"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal","e"},

{"label","VD22B"},
-- scoreb:+MD
{"fun2",subexpense,500},-- costb:MINUS
{"fun2",decprofit,5},
{"ns1","Right then, you noticed that.  Well, eh, I normally do but I just found a new girl from the Continent...oh well, I can use my old stylist in this particular case...well, nevermind. Let’s just say my price is now $%d.","VS_T1P1VD2_06.ogg","cost"},
	{"pg","That works.  Let’s continue.","VD23A"},

{"label","VD22C"},
-- scorec:-MD
{"fun2",incprofit,2},-- costc:PLUS
{"ns1","Well, that’s just not right. If you would have done your homework, you would have seen that I always charge the same $1000  for my motivational posters and CD’s.  My salesmen can’t do without them!  I can tell the City is going to be a difficult client-so I have to charge $%d for this now.","VS_T1P1VD2_07.ogg","cost"},
	{"pg","Well, I am sorry to have  offended you.","VD23A"},
	-- costa:PLUS


{"label","VD22D"},
-- scored:-EW
{"fun2",incprofit,4},-- costd:PLUS
{"ns1","Don’t write a check your mouth can’t cash there youngster!  I just told you what I charged, and I don’t appreciate being treated like this during a negotiation.  I can tell the City is going to be a difficult client.  You know what? I think am going to have to charge $%d for this...","VS_T1P1VD2_08.ogg","cost"},
	{"pg","Sorry, I didn’t mean to offend you.","VD23A"},


{"label","VD23A"},
{"fun",threequartercost},
{"ns1","Okay, so the remainder of my expenses is $1000 which I need for lease payments on the sports car I keep at my weekend house. This brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P1VD2_09.ogg","cost"},
{"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
{"pgs","Not only have I seen you charge less for that – the City is in crisis here.  I don’t think it’s right for you to charge for your car at all.","VD23B","f"},
{"pgs","I have seen that you charge $500 for lease payments for that same car!  What are you trying to pull here?","VD23C","g"},
{"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal","h"},

{"label","VD23B"},
-- scoreb:+MD
{"fun2",subexpense,1000},-- costb:MINUS
{"fun2",decprofit,5},
{"ns1","You know, now that you mention it, I really should pay for the lease payments on my sports car out of my own pockets, given the circumstances... and since you’re paying attention to the details I’ll even knock a little off my profit. Does that seem fair? So let’s just say I charge you $%d.  ","VS_T1P1VD2_10.ogg","cost"},
	{"pg","Thanks, that would be great.  Let’s continue.","VD24A"},


{"label","VD23C"},
-- scorec:+MD
{"fun2",subexpense,500},-- costc:MINUS
{"fun2",decprofit,5},
{"ns1","I think you may actually have a point there.  I think I’ll just knock that car payment back to it’s usual rate bringing my offer to $%d.  What do you say?","VS_T1P1VD2_11.ogg","cost"},
	{"pg","I appreciate that, Marvin. Thanks.","VD24A"},

{"label","VD23D"},
-- scored:-EW
{"fun2",incprofit,4},-- costd:PLUS
{"ns1","I am offering a  service to the City - and that entails certain expenses be incurred.  I appreciate the urgency of our crisis, but I won’t stand for your posturing during these negotiations.  This really seems like a more demanding  job than I thought –so I think I should actually be charging $%d .","VS_T1P1VD2_12.ogg","cost"},
	{"pg","I see.  Well, I am sorry to have offended you.","VD24A"},


{"label","VD24A"},
{"ns1","Right then.  So that brings us to $%d.  We really should get started here – so do we have a deal or what?  Let’s get going, I need to make a living, too, you know.","VS_T1P1VD2_13.ogg","cost"},
	{"pg","We have ourselves a deal!","VD25B"},
	{"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VD24B","i"},
	{"pgs","Before we go ahead, I must ask – are you sure you have to charge for door-to-door salesmen?","VD24C","j"},
	{"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

{"label","VD24B"},
-- scoreb:+EW
{"fun2",decprofit,10},-- costb:MINUS
{"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions on our environment. Given that this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P1VD2_14.ogg","cost"},
	{"pg","I am happy you see it that way.  Thanks.","VD25A"},


{"label","VD24C"},
-- scorec:-MD
{"fun2",incprofit,2},-- costc:PLUS
{"ns1","Well isn’t that rich!  Let me tell you, you really should learn how to treat people.  I can already see the dollar signs – this going to be a very challenging assignment, and I am going to have to adjust my plan and charge you $%d.","VS_T1P1VD2_15.ogg","cost"},
	{"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


{"label","VD24D"},
-- scored:-EW
{"fun2",incprofit,6},-- costd:PLUS
	{"ns","Listen, I’ve had about enough of this.  We are done negotiating.  If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.","VS_T1P1VD2_16.ogg"},
	{"pg","I apologize, I didn’t mean to anger you.  Let’s move on,","VD25A"},
	

	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

{"label","VD25A"},
{"ns1","I am happy we are on the same page.  So, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T1P1VD2_17.ogg","cost"},
	{"pg","Alright then.  It’s a deal.","VD25B"},
	{"pgs","Well, I was actually thinking about your stylist. Does she really need to be work full-time?","VD25C","l"},


{"label","VD25B"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
				{"ns1","So let’s take that to the bank!  Go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you afterwards when you come back with the paperwork!","VS_T1P1VD2_18.ogg","cost"},
	{"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


{"label","VD25C"},
	 -- scoreb:-EW
	 {"fun2",incprofit,3},-- costb:PLUS
	 {"fun",increneg},
	 {"ns1","Listen, I’ve had about enough of this.  We were done negotiating, and there is work to be done.  Now you are just needlessly haggling.  Frankly, you seem as if you are impossible to work with - so I’m charging $%d now, and that’s final!","VS_T1P1VD2_19.ogg","cost"},
	{"pg","Before you increase your price anymore, please, let’s just shake on it!","VD25D"},
	{"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
	-- scoreb:-EW
	 -- costb:PLUS


{"label","VD25D"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
				{"ns1","Finally! Well, there is no time to waste, now.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get right to work!","VS_T1P1VD2_20.ogg","cost"},
	{"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},

		{"label","VD25RENEGCHECK"},
		{"if","reneg","<",2,"VD25RENEG"},


		
-- {"label","VD25E"},   peter comments out label
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
				{"ns1","I have had it.  This negotiation is over.  Come back when you have a contract for....you know what?  I don’t want to see you again until you you have a contract for me for $%d. Now, get out of my sight.","VS_T1P1VD2_21.ogg","cost"},
	{"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VD2ASD1"},
	{"ns","It seems as if you have a critical task on your hands, but I am busy here, too.  You should go get approval from your client if you decide you want to hire me - and then come back here so that we can negotiate.","VS_T1P1VD2_22.ogg"},
	{"pg","Thanks, I was actually on my way to do that...","END"},

--*****************
--NEGOTIATIONS
--*****************

{"label","VD2ATD1"},
{"ns1","Given how critical it is that we move quickly with this task, I think you should hurry up and get a contract drawn up for $%d at City Hall.  Just think about how we both need the money!","VS_T1P1VD2_23.ogg","cost"},
	{"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VD31A"},
{"fun3",setvar,"scoreconvo","v3"},
	{"ns","There you are! I haven’t even been able to think about money, let alone eat, since you left.  I am very disturbed by this crisis! I can’t wait to get started - did you come back with that contract for me to sign?  ","VS_T1P1VD3_01.ogg"},
	{"pg","Yes, I have it right here.","VD32X"},
	{"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


{"label","VD31B"},
	{"ns","Oh, well...alright.  Just come back as soon as you get a contract – time is of the essence! ","VS_T1P1VD3_02.ogg"},
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
	{"ns","Excellent! So, yes ...uh-huh...wow! That’s the smell of money! The city sure is being generous. That’s even more than I asked for!! Of course I’ll sign!","VS_T1P1VD3_03.ogg"},
	{"pg","Thanks, I guess","VD33A"},
	-- costa:Set to CC


{"label","VD32B"},
{"fun",getvendorcontract},
	{"ns","Okay, then let me have a...wait - .  No!  This isn’t isn’t the price we agreed on! Are you trying to line your own pockets, here?","VS_T1P1VD3_04.ogg"},
	{"pg","I am sorry, there must be some mistake...","VD32D"},

{"label","VD32C"},
	{"ns","Well let’s check it out....uh huh...mm hmmm...there you go! This looks right on the money. Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P1VD3_05.ogg"},
	{"pg","Excellent!  I am looking forward to working with you.","VD33A"},


{"label","VD32D"},
{"fun2",incprofit,10},
	{"ns","Wait, this is less than what we agreed!  You’ve got to show me the money, here!  My attorney is going to have something to say about this. Excuse me. Hello, Warren?  Yeah, they...uh-huh...okay, bye. Look, my lawyer will send over a contract with the correct figures. You’re going to have to bring that contract to your client – okay?","VS_T1P1VD3_06.ogg"},
	{"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VD32E","a"},
	{"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F","b"},

{"label","VD33A"},
	{"ns","Excellent! I am happy to be part of the team.  I really look forward to doing the best job possible!","VS_T1P1VD3_07.ogg"},
	{"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around,","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VD3ATD1"},
	{"ns","Listen, I can understand sitting home wanting to stand around all day counting your money but what are you doing here!!?   Get back to City Hall and have the Mayor sign that contract.  The future of our City is at stake!","VS_T1P1VD3_08.ogg"},
	{"pg","Yes, thanks - I was just about to do that...","END"},

--******************
--END
--******************
{"label","VD3ASD1"},
{"ns1","Oh, it’s you.  Look, I understand time is ticking away, so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P1VD3_09.ogg","cost"},
	{"pg","I’ll be back shortly with the contract. Thank you for the reminder..","END"},

--******************
--CONTRACT SIGNING
--******************

{"label","VD32E"},
-- scorea:+SG
	{"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on and you need to show me the money!.","VS_T1P1VD3_10.ogg"},
	{"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


{"label","VD32F"},
-- scoreb:-SG
	{"ns"," I’m relieved you understand this is the only way we can move forward.  Don’t worry, Media Relations Inc.  always delivers the coverage our clients pay for!","VS_T1P1VD3_11.ogg"},
	{"pg","Alright, I understand.  ","VD33A"},


	{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
	
}
return dialogtext
