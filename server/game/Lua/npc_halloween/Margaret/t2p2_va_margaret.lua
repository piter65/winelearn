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

{"label","T2P2VA1"},


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
 {"ns","Hello.  Wait – how do I know you?  You do look kind of familiar.  And yet… Oh, gosh, this is going to torture me for hours now…","VS_T2P2VA1_10.ogg"},
 {"pg","Pardon me, I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Margaret Wong! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Hello. Welcome to Phoenix Services Group. My name is Margaret Wong.  Is there something wrong or are you here for an appointment?","VS_T2P2VA1_01.ogg"},
	 {"pgs","Actually, Margaret, I am looking for a logistics and support services provider, and I hear you have a multi-city operation that can handle large projects.","VA11B","a"},
	 {"pgs","Actually, Margaret, I am looking for a logistics firm -although I am not sure your staff can take on the extra work.","VA11C","b"},

		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Thank goodness!  Whenever strangers just arrive here I always think…well nevermind.  It’s nice to feel appreciated from time to time.  Anyway I am getting ahead of myself.  Tell me what brings you here. ","VS_T2P2VA1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VA12A"},

		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Uh-oh.  I knew it.  You’re all anxious and confused and don’t know what you’re talking about.  Don’t worry just take deep breaths.  .Well, no matter – maybe I can help you anyway, especially if it has to do with the environment.  Just go on and tell me why you are here. ","VS_T2P2VA1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River. The City asked my firm to find a logistics firm to provide planning, warehousing, and transportation services for the City’s relief and recovery efforts.","VA12A"},


	{"label","VA12A"},
	 {"ns","Oh!  That’s a pleasant coincidence, because I was just sitting here earlier, feeling very guilty that I wasn’t doing all I can to help the City.  So did you really come here on purpose to look for a logistics firm?","VS_T2P2VA1_04.ogg"},
	 {"pgs","Yes. I hear that your employees love you because of how you handle yourself in stressful situations so you should be able to do a great job for us.","VA12B","c"},
	 {"pgs","Yes. I hear that you have access to transportation into town that would be adequate for the relief supplies and restoration equipment the City will be needing.","VA12C","d"},

		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, no I’m afraid that doesn’t really describe me at all.  Just my luck, I guess.  But no matter -- I feel strongly about the environment, and I am available if you feel I can help.","VS_T2P2VA1_05.ogg"},
		 {"pg","Okay, great!","VA13A"},


		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well I guess that’s a good reason to come here - you certainly seem to know what you’re talking about!  Anyway, I think it would be very therapeutic for me to get this project – so if you need me, I am happy to drop all of my preoccupations and focus on the City’s needs.","VS_T2P2VA1_06.ogg"},
		 {"pg","I am happy to hear you are available, Margaret.","VA13A"},


	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","Okay, great.  So, if you’ll excuse me, I have to do a little deep breathing – the phone bill is coming today and I’ll tell you, every time I open that envelope…well, never mind.  Is there anything else you need?","VS_T2P2VA1_07.ogg"},
	 {"pgs","I think that’s about it – but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VA13B","e"},
	 {"pgs","No, but before I go - it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VA13C","f"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Well, yes, of course!  I’d feel so guilty if I didn’t do everything I could to keep my costs contained for this job. Well then, I hope to see you again!","VS_T2P2VA1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","You want a ‘donation’?  A “donation”??  I knew it.  I just knew it.  My husband says “you need to trust people, Margaret”.  But you see what happens?  Let your guard down for one minute and someone tries to twist your arm for money.  Well, let me tell you, the City should hire us because we are the best firm available – not because I give out kickbacks!","VS_T2P2VA1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thanks for stopping by! If you decide you want to hire us to be your logistics firm, just come back and we’ll talk about details.  Now please excuse me, I have to…oh I don’t know…I just have to…well, whatever.  Just excuse me, please.","VS_T2P2VA1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","Thank goodness, you’re back! Where have you been?  I was so worried.  Are you trying to give me a heart attack?  I take it you are here to get me to start logistics work for the City’s relief and recovery efforts?","VS_T2P2VA1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VA1ASD2B","g"},
	 
		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","Oh I don’t know.  Are you sure about that? You don’t seem ready to negotiate.  I think maybe you should probably get the official go-ahead from your client before I start providing the City with any services, to be sure.  I’d feel terribly if you didn’t.","VS_T2P2VA1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VA2ASD1"},
 {"ns","Excuse me.  Why are you here?  I hope everything is ok.  You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P2VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Oh, thank goodness you’re back!  I’m really glad nothing is wrong.   You must be here to talk about the logistics firm gig. That is good, because I am starting to worry more than a villager facing an angry shogun! We need to act right away.  Did the Mayor approve your decision to hire us?","VS_T2P2VA2_01.ogg"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering the fact you have operations in multiple cities.","VA21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VA21B"},
	 {"pgs","Yes, she did.  We are confident your ability will be an asset to our relief and recovery effort – even if you don’t quite have the experience we are looking for.","VA21D","b"},
	 {"pgs","Well, I’d like to do it, but I need to be convinced you have as much access to warehousing locally here in New City as you do elsewhere in the County.","VA21D","b"},


		{"label","VA21B"},
		 {"ns","Oh, no.  You’re leaving again?  I guess I’ll see you back here when you are ready to negotiate.  ","VS_T2P2VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Gee…if I had a memory like yours I think I’d have too much to worry about! Anyway, the anticipation is giving me an ulcer - tell me what you are looking for us to do.","VS_T2P2VA2_03.ogg"},
		 {"pg","We are looking for a logistics firm that will provide the planning, scheduling, and coordinating of the transportation and storage of the relief supplies and equipment needed at the disaster site.","VA22A"},


		{"label","VA21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Well, if that’s really why you decided to hire me, I’m worried about this job  Have you actually looked into this decision? Anyway, the City needs our help - so tell me what you are looking for me to do?","VS_T2P2VA2_04.ogg"},
		 {"pg","We are looking for a logistics firm that will provide the planning, scheduling, and coordinating for the transportation and storage of the relief supplies and equipment needed at the disaster site.","VA22A"},


	{"label","VA22A"},
	 {"fun",halfcost},
	 {"ns1","OK, well I guess we have to talk business at some point:  $%d is what  I normally charge for a job like this.  First, I will need $2500 to cover orientation costs for the additional staff we will be hiring to take on the project.  Then, I will need $4150 for transportation and warehousing  fees to transport and store any relief supplies and equipment.  Then, I need $2850 to buy new uniforms and two-way radios for coordination of personnel.","VS_T2P2VA2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pgs","Wait - $2850 for uniforms and two-way radios? I know for a fact you have charged less for those in the past!","VA22B","c"},
	 {"pgs","Don’t you normally charge less for transportation and warehousing fees?","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},

		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for two way radios and uniforms, but I was going to buy designer uniforms and two-way radios with expanded range.   I get worried when people are out of touch! Well, never mind. Let’s say I charge you the old rate – so my total price is $%d.","VS_T2P2VA2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},

		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I’m a little concerned here.  If you had checked, you would have seen that I always charge the same for transportation and storage fees for this type of project!  I’m a bit worried that the City is going to be a difficult client. You know, I really should be charging you $%d.","VS_T2P2VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VA23A"},
		 -- costa:PLUS


		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You know I really start getting the jitters when people start throwing their weight around.  I think I just told you what I charge, and I do not appreciate your negotiating style!  I’ve heard that the City can be a difficult client - now I’m starting to understand! You know what? I think I have to charge $%d for this job.","VS_T2P2VA2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VA23A"},


	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, well the remainder of my expense is the $1500 we charge for psychological disaster counseling for my staff and me, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T2P2VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Not only do you usually charge less for disaster counseling – but your insurance probably covers it! You shouldn’t charge us for that!","VA23B","f"},
	 {"pgs","I have seen that you normally charge less for your disaster counseling.  I think you are trying to charge us too much.","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},

		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, I guess you have a point, now that I think of it.  Under the desperate circumstances, maybe I should get full blown psychiatric treatment – and pay for it myself.   I like the way you think.   Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P2VA2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, well that’s true, actually.  Normally I do charge $1000 for disaster counseling, but I was thinking of flying in Dr. Zelig Frundig Von Steuben, the famed psychoanalyst, for this project.  Nevermind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P2VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Margaret. Thanks.","VA24A"},

		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Oh, this is very worrisome! We are talking about providing the city with logistics services, and that means certain expenses must be paid. I know this is a crisis, but even I won’t be bullied into a bad deal.  You are more demanding than I thought –I should charge $%d for this.","VS_T2P2VA2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","Okay, let me just catch my breath for a moment – I think I’m starting to hyperventilate.  I never did like negotiating…it’s so stressful! So, then, I will need $%d to get started.  Do we have a deal?","VS_T2P2VA2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VA25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VA24B","i"},
	 {"pgs","Before we go ahead, I need to ask – do you really have to charge for new hire orientation?","VA24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, before you came back, I was having panic attacks thinking about the devastation this disaster has caused us.  Since this is an ecological crisis, I am willing to compromise! I think we should lower my offer to $%d.  Agreed?","VS_T2P2VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Oh, gosh, I think my ulcer is acting up. You know, I really have a hard time with pushy people.  My mother was pushy and, well…oh nevermind.  I just think the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P2VA2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you are just acting like a control freak or something.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is any indication of what this relationship is going to be like, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P2VA2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


	{"label","VA25RENEG"},
	{"fun2",incprofit,2},

	{"label","VA25A"},
	 {"ns1","Okay, then, I think I can stop worrying.  My price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P2VA2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VA25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for transportation and warehousing fees…","VA25C","l"},


		{"label","VA25B"},

		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Oh, thank goodness!  I think I feel much better now that we are on the same team! So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P2VA2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Okay, that’s it.  We really have to stop negotiating now I am getting dizzy - and frankly, your haggling makes me wonder what it will be like to work with you.  I’m charging $%d now, and that’s only because I would feel guilty if I didn’t do this job!","VS_T2P2VA2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
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



		 {"ns1","Thank goodness! Now, there is no time to waste.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P2VA2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VA25RENEGCHECK"},
		{"if","reneg","<",2,"VA25RENEG"},
-- Peter		{"label","VA25E"},
		-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},

		 {"ns1","Oh, really, this is just too much.  This negotiation is over.  I mean I really don’t want you to come back here until you have a contract for me for $%d. Now, you really should get going before I change my mind!","VS_T2P2VA2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VA2ATD1"},
 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P2VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns","What on earth are you doing here?  Are you trying to give me a heart attack? We have a City to save – so hurry back with a contract from City Hall as soon as you can! I’ll see you back here soon!","VS_T2P2VA3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Thank goodness you are back – I was so worried you had gotten lost or something.  I am so anxious; I can’t wait to get started with the project! Did you come with that contract for me to sign? ","VS_T2P2VA3_01.ogg"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


		{"label","VA31B"},
		 {"ns","Alright then.  I guess I’ll just have to wait for you to come back...again...all alone.... Just come back as soon as you get a contract, okay?  Otherwise my panic attacks may come back… ","VS_T2P2VA3_02.ogg"},
		 {"pg","Sounds good.  See you soon!","END"},

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
		 {"ns","Okay, I hate surprises but let’s look at the contract.  I mean I guess we have to.   Okay….mm-hmm….oh, my! Look at that!  The city sure is being generous. That’s even more than I asked for!! I am happy to sign this.  Here you go! ","VS_T2P2VA3_03.ogg"},
		 {"pg","Thanks, I guess.","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  I knew it!  This isn’t what we discussed! What kind of agony are you trying to put me through? ","VS_T2P2VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},

			{"label","VA32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am going to have to call my attorney about this.  I really hate calling him – he always asks so many questions.  Hello, Sigmund?  Yeah, they…uh-huh…okay.  My lawyer will send over a contract with the right numbers. You must bring this new contract to your client for her to countersign in order to get started.","VS_T2P2VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VA32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},
			
				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I understand your position.  I mean I think empathy for others is very important, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists that you get the Mayor to sign it because it has the service fee we agreed on. ","VS_T2P2VA3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},


				{"label","VA32F"},
				-- scoreb:-SG
				 {"ns","I’m so relieved that you understand this is the only way we can move forward.  Maybe this headache will go away now.  Anyway, the new contract is already to come through the fax machine.  Here you go!","VS_T2P2VA3_11.ogg"},
				 {"pg","Alright. I understand, I guess.","VA33A"},


		{"label","VA32C"},
		 {"ns","Ok, I hate surprises but I guess we have to read the contract or we’ll never know what’s in it.  Ok, fine.  We’ll look at the contract  Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go! ","VS_T2P2VA3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},


	{"label","VA33A"},
	 {"ns","Well, that’s good news I guess.  No it is.  It is good news.   I’m happy to be a part of the team!  I mean, I guess you could say “happy”.  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P2VA3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VA3ATD1"},
 {"ns","Why are you still here?  Is everything ok?  Do you like it when I worry?  Get back to City Hall and get the Mayor to countersign that contract.  The future of our City is at stake!","VS_T2P2VA3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
