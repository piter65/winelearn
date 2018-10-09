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


--*********************
--CAN'T INTERVIEW YET
--*********************
		{"label","VD1ASD1"},
			{"ns","I’d love to stand around and chat, but I really must take a nap and I don’t think we even know each other.","VS_T1P2VD1_10.ogg"},
			{"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
			{"pg","Hey, you’re Dr. Zeke Mullen! I’ve heard of you!","END"},
		
--****************
--INTERVIEW
--****************

	{"label","VD1"},
		{"label","VD11A"},
			{"fun",incvendorsvisited},
			{"fun",incvendor4},
			{"fun",talkedtovendor4},
			{"fun3",setvar,"scoreconvo","vd1"},
			{"ns","Hello there! Welcome to Mullen Medical Services! My name is Zeke Mullen. How can I help you?","VS_T1P2VD1_01.ogg"},
			{"pgs","I have come investigating emergency medical services firms to respond to a disaster, although I must admit I am concerned that you may not be up to responding quickly enough.","VD11B","a"},
			{"pgs","I have come investigating emergency medical service firms – and I understand you are a competent and effective group of retirees that can safely secure the site and provide triage.","VD11C","b"},
		
				{"label","VD11B"},
					 -- scorea:+MD
					 {"fun2", decprofit,2}, -- costa:MINUS
					{"ns","Well it sounds like you’ve come to the right place!  I am happy you caught me before my mid-morning nap.  So tell me, what’s on your mind, youngster?","VS_T1P2VD1_02.ogg"},
					{"pg","There has been an oil spill in the New City River, and the city asked my firm to look into finding an emergency medical services firm to respond to the disaster.","VD12A"},
				
				{"label","VD11C"},
					 -- scoreb:-MD
					 {"fun2", incprofit,2},-- costb:PLUS
					{"ns","Youngster, I am not sure if that’s entirely true, but we can surely try.  We may not be your age, but once we’ve had our naps we don’t feel a day over 70.  But I digress - tell me what you are looking for.","VS_T1P2VD1_03.ogg"},
					{"pg","I guess I got my facts confused.  I am here because the city could use help from an emergency medical services firm to respond immediately to the crisis.","VD12A"},
		

		{"label","VD12A"},
			{"ns","Oh dear, dear me.  That sure sounds like quite a mess.  So why, exactly, did you come here for emergency medical services?","VS_T1P2VD1_04.ogg"},
			{"pgs","Well I hear that you have been keeping your medical equipment and training up to date, which makes you perfect for this task.","VD12B","c"},
			{"pgs","I understand that you are a celebrated local hero  and have even earned a key to the City.","VD12C","d"},
		
				{"label","VD12B"},
					 -- scorea:-MD
					 {"fun2", incprofit,2},-- costa:PLUS
					{"ns","Well, I am glad you think so.  I understand this is a crisis so I am ready to drop everything and give it the urgent attention it deserves – right after my mid-morning nap, that is.","VS_T1P2VD1_05.ogg"},
					{"pg","Okay, great!","VD13A"},
				

				{"label","VD12C"},
					 -- scoreb:+MD
					 {"fun2",decprofit,2},-- costb:MINUS
					{"ns","Yes, I must admit that is true.  It is so refreshing to meet someone who is well read.  Now, this seems like an urgent crisis – and just so you know, I am ready to drop everything and get to work immediately – right after my mid-morning nap.","VS_T1P2VD1_06.ogg"},
					{"pg","Alright then, let’s continue","VD13A"},
				

		{"label","VD13A"},
		{"fun", incinterv},
			{"ns","So where were we?  Sorry, I get this way when I haven’t had my medication.  So is that all you need to make your decision on who to hire?","VS_T1P2VD1_07.ogg"},
			{"pgs","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job..","VD13B","e"},
			{"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VD13C","f"},
		
				{"label","VD13B"},
					 -- scorea:+EB
					 {"fun2",decprofit,2},-- costa:MINUS
					{"ns","Well then, good luck with everything. It’s time for my mid-morning nap, but I hope I will see you again soon.","VS_T1P2VD1_08.ogg"},
					{"pg","The pleasure was mine.  I’ll see you around!","END"},
				

				{"label","VD13C"},
					 -- scoreb:-EB
					 {"fun2",incprofit,2},-- costb:PLUS
					{"ns","Excuse me!  If I didn’t know better I’d think I was having a bad dream during my mid-day nap.  Are you suggesting a bribe?!  If you’re going to hire Mullen Medical do it for the right reasons there, Whippersnapper!","VS_T1P2VD1_09.ogg"},
					{"pg","Sorry if I offended you.","END"},
				

--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

	{"label","VD1ATD1"},
		{"ns","I’d love to stand around and keep chatting, but I’m exhausted.  I’ve already told you everything you need to know – so if you’ll excuse me, it’s time for my nap.","VS_T1P2VD1_13.ogg"},
		{"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more about the crisis.  Goodbye!","END"},
		

--*******************
--CAN'T NEGOTIATE YET
--*******************

			{"label","VD1ASD2A"},
				{"ns","Well hello there! Did you come back because you need me to wake everyone up so we can start to work for the City?","VS_T1P2VD1_11.ogg"},
				{"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss, first","VD1ASD2C"},
				{"pgs","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B","g"},
			
			{"label","VD1ASD2B"},
				-- scoreb:-SS
				{"ns","You certainly do seem eager, but you don’t seem prepared.  I think you should probably get approval from the Mayor before we negotiate a deal. You certainly do seem eager, but you don’t seem prepared.  I think you should probably get approval from the Mayor before we negotiate a deal.","VS_T1P2VD1_12.ogg"},
				{"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},
		
			{"label","VD1ASD2C"},
			-- scorea:+SS
			{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

	{"label","VD2ASD1"},
		{"ns","It seems as if you have a critical task on your hands, but I am busy here, too.  You should go get approval from your client if you decide you want to hire me - and then come back here so that we can negotiate.","VS_T1P2VD2_22.ogg"},
		{"pg","Thanks, I was actually on my way to do that…","END"},
		
--*****************
--NEGOTIATIONS
--*****************

	{"label","VD2"},
		
		{"label","VD21A"},
		{"fun",clearreneg},
		{"fun3",setvar,"scoreconvo","v2"},
			{"ns","I am happy to see you are back. Now, we don’t have much time to waste, and I really need to take a nap soon.  Have you gotten approval from the Mayor to engage my services?","VS_T1P2VD2_01.ogg"},
			{"pgs","You bet!  I am hopefulthink you’ll do a great job given the fact you have every conceivable piece of medical equipment on hand.","VD21C","a"},
			{"pg","No, I am just passing through.  See you around","VD21B"},
			{"pgs","You bet!  I am excited to see what you can do for the city considering the work you’ve done in the Oceanic Rim.","VD21D","b"},
			{"pgs","We like your firm’s track record of responding quickly to emergencies when called upon.","VD21D","b"},
		

				{"label","VD21B"},
					{"ns","Well so long then!  I hope to see you back here as soon as you are ready to negotiate – after I’ve had my nap, of course.","VS_T1P2VD2_02.ogg"},
					{"pg","Sure thing! Bye!","END"},
				

				{"label","VD21C"},
					-- scorea:+MD
					{"fun2",decprofit,2}, -- costa:MINUS
					{"fun",incvendor4},
					{"fun",talkedtovendor4},
					{"ns","I am impressed that you have been following our company history!  You’ve clearly displayed great  attention to detail. So what does the City want me to do?","VS_T1P2VD2_03.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services.","VD22A"},
				

				{"label","VD21D"},
				-- scored:-MD
				{"fun2",incprofit,2}, -- costd:PLUS
					{"fun",incvendor4},
					{"fun",talkedtovendor4},
					{"ns","Well to be honest, I have absolutely no idea what you are talking about.  But never mind - there is no time to waste.  Please tell me the details of the task the City has outlined.","VS_T1P2VD2_04.ogg"},
					{"pg","We are looking for a firm who can respond to the disaster site, helping the City by providing security and medical services.","VD22A"},
		

		{"label","VD22A"},
		{"fun",halfcost},
			{"ns1","Let’s get down to business: I usually charge $%d.  I will need $1000 for my Medical and security detail for early response action. Next, I’ll need $1000 for tarps, folding card tables, tents, and mosquito nets for the triage and holding area.  Finally, we need $2000 worth of bandages, rubbing alcohol, iodine, adhesive tape, anesthetics and vapor rub,","VS_T1P2VD2_05.ogg","cost"},
			{"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
			{"pgs","I thought you normally charge $1500 for the bandages, rubbing alcohol, geritol, and whatnot!","VD22B","c"},
			{"pgs","Wait - $1000 for tarps, folding card tables, a tent, and mosquito nets seems a little excessive to me.","VD22C","d"},
			{"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal","e"},
		
				{"label","VD22B"},
				-- scoreb:+MD
				{"fun2",subexpense,500},-- costb:MINUS
				{"fun2",decprofit,5},
					{"ns1","Right then, you noticed that.  Well, eh, I normally do but we were thinking of using brand name bandages vapor rub this time….which run a little more…but never mind. Let’s just say my price is now $%d.","VS_T1P2VD2_06.ogg","cost"},
					{"pg","That works.  Let’s continue.","VD23A"},
				
				{"label","VD22C"},
					 -- scorec:-MD
					 {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","Well, that’s just not right. If you would have done your homework, you would have seen that I always charge $1000 for tarps, folding card tables, a tent, and mosquito nets for our triage and holding area! I can tell the City is going to be a difficult client-so I have to charge $%d for this now.","VS_T1P2VD2_07.ogg","cost"},
					{"pg","Well, I am sorry to have  offended you.","VD23A"},
					 -- costa:PLUS
				

				{"label","VD22D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","Now, that’s the problem with your generation!  I just told you what I charged, and I don’t appreciate being treated like this during a negotiation.  I can tell the City is going to be a difficult client.  You know what? I think am going to have to charge $%d for this…","VS_T1P2VD2_08.ogg","cost"},
					{"pg","Sorry, I didn’t mean to offend you.","VD23A"},
		

		{"label","VD23A"},
			{"fun",threequartercost},
			{"ns1","Okay, so the last expense is the $1000 I will need for mechanized wheelchairs to navigate the crowds and respond to emerging situations at the disaster site, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P2VD2_09.ogg","cost"},
			{"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
			{"pgs","Not only have I seen you charge less for that – the City is in crisis here.  I don’t think it’s right for you to charge for such devices at all.","VD23B","f"},
			{"pgs","I have seen you charge $500 for the same kind of mechanized wheelchairs!  What re you trying to pull here?","VD23C","g"},
			{"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal","h"},
			
				{"label","VD23B"},
					 -- scoreb:+MD
					 {"fun2",subexpense,1000},-- costb:MINUS
					 {"fun2",decprofit,5},
					{"ns1","You know, now that you mention it, I really should buy those wheelchairs instead of renting them….and out of my own pocket, given the circumstances…so let’s just say I charge you $%d.  Does that seem fair?","VS_T1P2VD2_10.ogg","cost"},
					{"pg","Thanks, that would be great.  Let’s continue.","VD24A"},
				

				{"label","VD23C"},
					 -- scorec:+MD
					 {"fun2",subexpense,500},-- costc:MINUS
					 {"fun2",decprofit,5},
					 {"ns","You know, now that you mention it, I have charged less for that because I hadn’t bought as many in the past…but seeing as they don’t operate well in water anyway, let’s just say I charge you $500 for the wheelchairs.","VS_T1P2VD2_11.ogg"},
					{"pg","I appreciate that, Dr. Mullen. Thanks.","VD24A"},
				
				{"label","VD23D"},
					 -- scored:-EW
					 {"fun2",incprofit,4},-- costd:PLUS
					{"ns1","I am offering a  service to the City - and that entails certain expenses.  I appreciate the urgency of our crisis, but I won’t stand for you trying to bully an old timer like me.  This really seems like a more demanding  job than I thought –so I think I should actually be charging $%d.","VS_T1P2VD2_12.ogg","cost"},
					{"pg","I see.  Well, I am sorry to have offended you.","VD24A"},
		

		{"label","VD24A"},
			{"ns1","Right then.  So that brings us to $%d.  We really should get started here – do we have a deal?  I am exhausted and I really should take a nap, you know.","VS_T1P2VD2_13.ogg","cost"},
			{"pg","We have ourselves a deal!","VD25B"},
			{"pgs","Now that we’ve covered all your expenses – and considering that this is a crisis situation, do you think you could forgo some profit?","VD24B","i"},
			{"pgs","Before we go ahead, I must ask – are you sure you have to charge for early response action?","VD24C","j"},
			{"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

				{"label","VD24B"},
				-- scoreb:+EW
				{"fun2",decprofit,10},-- costb:MINUS
					{"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions for generations of New City residents to come…and I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P2VD2_14.ogg","cost"},
					{"pg","I am happy you see it that way.  Thanks.","VD25A"},
				

				{"label","VD24C"},
					 -- scorec:-MD
					  {"fun2",incprofit,2},-- costc:PLUS
					{"ns1","You really should respect your elders! The City is going to be a very challenging client, isn’t it?  I can already feel my joints aching.  I am really going to have to adjust my plan and charge you $%d.","VS_T1P2VD2_15.ogg","cost"},
					{"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},
				

				{"label","VD24D"},
					 -- scored:-EW
					 {"fun2",incprofit,6},-- costd:PLUS
					{"ns","Listen, I’ve had about enough of this.  We are done negotiating.  If you want to get anywhere in business – and in life – you are going to have to learn to respect your elders.","VS_T1P2VD2_16.ogg"},
					{"pg","I apologize, I didn’t mean to anger you.  Let’s move on,","VD25A"},
		

		{"label","VD25RENEG"},
		{"fun2",incprofit,2},

		{"label","VD25A"},
			{"ns1","I am happy we are finally coming together, because I can hear my mid-afternoon nap calling me.  So, my price is $%d, and that’s my final offer.  Is that agreeable to you, youngster?","VS_T1P2VD2_17.ogg","cost"},
			{"pg","Alright then.  It’s a deal.","VD25B"},
			{"pgs","Well, I was actually thinking about your personal mobility devices. the crowd control methods?  Wouldn’t regular wheelchairs work just as well?","VD25C","l"},
			
		
				{"label","VD25B"},

				-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

					{"ns1","Alright then, it’s time for me to lie down!  Go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you afterwards when you come back with the paperwork!","VS_T1P2VD2_18.ogg","cost"},
					{"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},
				

				{"label","VD25C"},
				-- scoreb:-EW
					 {"fun2",incprofit,3},-- costb:PLUS
					 {"fun",increneg},
					{"ns1","Listen, I’ve had about enough of this.  We were done negotiating, and now you are just needlessly haggling. Frankly, you seem as if you are impossible to work with - so I’m charging $%d now, and that’s final!","VS_T1P2VD2_19.ogg","cost"},
					{"pg","Before you increase your price anymore, let’s just shake on it!","VD25D"},
					{"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
					-- scoreb:-EW
					-- costb:PLUS
				

				{"label","VD25D"},

			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},
					{"ns1","Finally! Well, there is no time to waste, now.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get right to work!","VS_T1P2VD2_20.ogg","cost"},
					{"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},
				
				{"label","VD25RENEGCHECK"},
				{"if","reneg","<",2,"VD25RENEG"},

--				{"label","VD25E"},		Peter was here
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},
			

					{"ns1","I think you are going to give me an apoplexy.  This negotiation is over.  Come back when you have  a contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, leave before you upset me any more.","VS_T1P2VD2_21.ogg","cost"},
					{"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},
				
--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************
		
	{"label","VD2ATD1"},
		{"ns1","Given how critical it is that we move quickly with this task, I think you should hurry up and get a contract drawn up for $%d at City Hall.  Time is of the essence, and neither of us are getting any younger.","VS_T1P2VD2_23.ogg","cost"},
		{"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

		{"label","VD3ASD1"},
			{"ns1","Now neither of us are getting any younger – especially me.  You should hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P2VD3_09.ogg","cost"},
			{"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD3"},
		
		{"label","VD31A"},
			{"fun3",setvar,"scoreconvo","v3"},
			{"ns","There you are! I have been so anxious about the current crisis I haven’t even been able to nap since you left! I can’t wait to get started - have you come back with that contract for me to sign?","VS_T1P2VD3_01.ogg"},
			{"pg","Yes, I have it right here.","VD32X"},
			{"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},
		

				{"label","VD31B"},
					{"ns","Oh, well then….  Just come back as soon as you get a contract – please hurry, I know I wont be able to rest until we get rolling!","VS_T1P2VD3_02.ogg"},
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
					{"ns","Excellent! So, yes …uh-huh…wow! The City sure is giving me even more than I asked for!! Back in my time, they tried to short change you.  They sure are generous, these days. Of course I’ll sign!","VS_T1P2VD3_03.ogg"},
					{"pg","Thanks, I guess","VD33A"},
					 -- costa:Set to CC


				{"label","VD32B"},
					{"fun",getvendorcontract},
					{"ns","Okay, then let me have a…wait - .no!  This isn’t isn’t the price we agreed on! You wouldn’t try to rob a senior citizen would you?","VS_T1P2VD3_04.ogg"},
					{"pg","I am sorry, there must be some mistake…","VD32D"},
				
						{"label","VD32D"},
						{"fun2",incprofit,10},
							{"ns","Darn right there’s a mistake – and my attorney is going to have something to say about it. Excuse me. Hello, Mortimer?  Yeah, they…uh-huh…okay, bye.  My lawyer will send over a contract with the correct figures for you to bring to your client – okay?","VS_T1P2VD3_06.ogg"},
							{"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather have Will draw up a new contract.","VD32E","a"},
							{"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F","b"},

								{"label","VD32E"},
									 -- scorea:+SG
									{"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.","VS_T1P2VD3_10.ogg"},
									{"pg","Well, if that’s the way it has to be, I understand.","VD33A"},
								

								{"label","VD32F"},
									 -- scoreb:-SG
									{"ns","I appreciate that you understand this is the only way we can move forward.  Don’t worry, I assure you that we will put 100% of our energy into this project!","VS_T1P2VD3_11.ogg"},
									{"pg","Alright, I understand.","VD33A"},
				

				{"label","VD32C"},
					{"ns","Well let’s check it out….uh huh….mm hmmm…there you go! This looks spot on.   Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P2VD3_05.ogg"},
					{"pg","Excellent!  I am looking forward to working with you.","VD33A"},
				
		
		{"label","VD33A"},
			{"ns","Oh, I am so relieved!  Well, we are going to get right on the case and respond to this crisis – right after my early afternoon nap!","VS_T1P2VD3_07.ogg"},
			{"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},
		
--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************
		
		{"label","VD3ATD1"},
			{"ns","What are doing here?  Don’t you have to go to City Hall and have the Mayor sign that contract? This does seem awfully important, so maybe you should hurry up and do that.","VS_T1P2VD3_08.ogg"},
			{"pg","Yes, thanks - I was just about to do that…","END"},
		
--******************
--END
--******************
	{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
	
}
return dialogtext
