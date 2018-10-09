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

{"label","T1P3VA1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P3va1"},

--**************
--Chose Someone else
--**************

{"label","VABONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VA1ASD1"},
 {"ns","I am sorry, have we met?","VS_T1P3VA1_10.ogg"},
 {"pg","Pardon me, I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Peter Boltright! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VA11A"},
	{"fun",incvendorsvisited},
	{"fun",incvendor1},
	{"fun",talkedtovendor1},
	{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Welcome to Premiere Containment!  My name is Peter Boltright. How can I help you?","VS_T1P3VA1_01.ogg"},
	 {"pgs","I am looking for a spill containment services firm that can transport and deploy its equipment to the New City River.","VA11B","a"},
	 {"pgs","I am looking for a spill containment services vendor - although I am afraid your equipment may not be suited for the containment of an oil spill on a river.","VA11C","b"},

		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well it’s a good thing you decided to come here, then! That is certainly a key part of the well oiled machine that is Premiere Containment.  Now, tell me why you’re here.","VS_T1P3VA1_02.ogg"},
		 {"pg","Well, there has been an oil spill in the New City River, and the City asked my firm to find someone to help them contain the disaster.","VA12A"},

		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Are you sure about that? I don’t think you have any idea what you are talking about.  Well, no matter - just go on and tell me why you are here.","VS_T1P3VA1_03.ogg"},
		 {"pg","Well, there has been an oil spill in the New City River, and the City asked my firm to find someone to help them contain the disaster.","VA12A"},


	{"label","VA12A"},
	 {"ns","Yes, that’s been all over the news! So what drove you to come here to talk to me about it?","VS_T1P3VA1_04.ogg"},
	 {"pgs","I’ve seen it mentioned that you have a knack for containing oil spills.","VA12B","c"},
	 {"pgs","I understand you regularly purchase up-to-date containment equipment, so I am confident you will do well with the job.","VA12C","d"},

		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","I’m not sure everything is working right with you, my friend.  But no matter -- I feel strongly about the environment, and I am available if you feel I can help you.","VS_T1P3VA1_05.ogg"},
		 {"pg","Well, I am happy to hear that you are on board, at least.","VA13A"},


		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well that seems like a good reason - you certainly seem to know your stuff.  Anyway, we have a crisis on our hands – so if you need me, I am happy to drop everything and focus on the City’s needs.","VS_T1P3VA1_06.ogg"},
		 {"pg","Sounds great!","VA13A"},


	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","So if you’ll excuse me, I have some tinkering to do on my equipment.  Is there anything else you need?","VS_T1P3VA1_07.ogg"},
	 {"pgs","Yes, although I have some research to do. In the meantime, please consider this is a crisis – and you would really be helping us if you only charged for what is necessary to perform the job.","VA13B","e"},
	 {"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VA13C","f"},

		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","I know better than most about how devastating an oil spill can be.  I will surely take that into account when I figure out what my expenses will be for this job. Well then, I hope to see you again soon!","VS_T1P3VA1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Are you asking for an unauthorized donation?  I am appalled.  The City should hire my firm because we are the best – not because we give out kickbacks!","VS_T1P3VA1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VA1ATD1"},
 {"ns","Thanks for stopping by, then.  If you decide you want us to contain the spill, just come back and we’ll talk about details!","VS_T1P3VA1_13.ogg"},
 {"pg","Thanks for your time.  I am off to look around further – but I may be back soon to talk to you more the crisis.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VA1ASD2A"},
	 {"ns","You’re back!  Are you ready to hire us to help the City with emergency services?","VS_T1P3VA1_11.ogg"},
	 {"pg","No - I have more research to do, and have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take to make a deal?","VA1ASD2B","g"},

		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before we start providing the City with spill containment services   just to be sure.","VS_T1P3VA1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},

		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VA2ASD1"},
 {"ns","What are you doing here? You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here to work out details of the arrangement with me.","VS_T1P3VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},
 
--*****************
--NEGOTIATIONS
--*****************

	{"label","VA21A"},
	 {"fun",clearreneg},
	 {"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Are you here to talk about containing the oil spill? The slick spreading faster that grease on a lag bolt, so there is little time to waste!  But first, you must tell me – why did the Mayor end up approving your decision to move forward?","VS_T1P3VA2_01.ogg"},
	 {"pgs","The mayor feels we need someone with the latest and most effective containment equipment.","VA21C","a"},
	 {"pg","Actually, she didn’t –  I am just passing through.  See you around.!","VA21B"},
	 {"pgs","City Hall needs people with the kind of experience you have containing toxic waste spills around the world.","VA21D","b"},
	 {"pgs","I would hire you without reservation – except, I’m concerned your staff may not have the right experience for the job.","VA21D","b"},


		{"label","VA21B"},
		 {"ns","Well, I’ll just see you back here when you are ready to negotiate.  You should probably hurry, because things at the disaster site are probably turning worse every moment.","VS_T1P3VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VA21C"},
		 -- scorea:+MD
		 {"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","With that attention to detail, you should be a small engine mechanic!.  It’s clear that the City needs help, so tell me - what are you looking for us to do?","VS_T1P3VA2_03.ogg"},
		 {"pg","We are looking for a firm who can contain the oil slick at the disaster site in preparation for recovery and disposal. respond to, and secure, the disaster site.","VA22A"},


		{"label","VA21D"},
		-- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","You must have a screw loose, because that doesn’t seem right.  Have you really looked into this decision? Anyway, we have no time to waste  - so tell me, exactly what does the City need from us?","VS_T1P3VA2_04.ogg"},
		 {"pg","We are looking for a firm who can contain the oil slick at the disaster site.","VA22A"},


	{"label","VA22A"},
	{"fun",halfcost},
	 {"ns1","Well, I think that to get involved with this, we would need $%d. This includes a $1200 budget for crane operators, machinists, and engineers, $1800 for radio-controlled boats to drag impermeable liners, berms, pallets, and booms used for containment, and $1000 for the construction of a 200’ tall radio tower by the river to monitor, and control the containment operation.","VS_T1P3VA2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pgs","$1000 for a radio tower? Don’t you normally charge less for that?","VA22B","c"},
	 {"pgs","$1800 seems like an awful lot of money for radio-controlled boats and containment equipment. Don’t you normally charge less for that?","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},

		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, normally we do charge less for the radio tower construction, but we were thinking of using higher grade materials this time. Of course, we can always stick with the same tubular steel construction.  I’m impressed with your attention to detail – so let’s say my price is now $%d.","VS_T1P3VA2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},

		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That’s just not right - if you had done your research, you would know that I always charge $1800 for the latest berms, liners, and palettes to perform containment. I can tell that the City is going to be a difficult client now.  I really should be charging you $%d for this.","VS_T1P3VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VA23A"},
		 -- costa:PLUS


		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Hold on a moment! I just told you what I charge, and I don’t appreciate your style of negotiating!  I heard the City can be a difficult client.  Now I know why! You know what? I think am going to have to charge $%d to do this job…","VS_T1P3VA2_08.ogg","cost"},
		 {"pg","Oh.  Sorry to have offended you...","VA23A"},


	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so I only need $1000 on top of the other costs for drafting supplies, prototyping materials, and rental of a 3D printer, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P3VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Not only have I seen that you charge less for those supplies, but we are in a crisis -and so that really isn’t appropriate here.","VA23B","f"},
	 {"pgs","Don’t your protyping materials and such normally cost $500? Why are you trying to charge us so much?","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},

		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know,; now that you mention it,, I really should pay for that expense out of my own pockets, given the circumstances…and who knows if we even have time to invent custom equipment for the job.  So, let’s just say I charge you $%d.  Does that seem fair?","VS_T1P3VA2_10.ogg","cost"},
		 {"pg","Thanks, Peter.  That would be great.","VA24A"},


		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I think you may actually have a point there - maybe I shouldn’t pass this increased expense on to the City! After all, this is an emergency…you know what?  I really feel like I can work well with you.  So I am going to lower this expense back to $500.  My price is now $%d.  What do you say?","VS_T1P3VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Peter. Thanks.","VA24A"},

		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering to provide a service for the City - and that entails I meet certain expenses.  I appreciate the urgency of our crisis, but I won’t stand for your hardball tactics.  This really seems like a more demanding job than I thought –so I think I am going to have to charge $%d now.","VS_T1P3VA2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},


	{"label","VA24A"},
	 {"ns1","Right then. So now, it will take $%d to get me on board…and  we really should get started! So tell me - do we have a deal?","VS_T1P3VA2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VA25B"},
	 {"pgs","Now that we’ve covered your expenses – considering that this is a crisis, could you maybe forgo some of the profit you are making here?","VA24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – can we get you to lower your $1200 personnel costs?  Others charge less for theirs.","VA24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},

		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions on our environment. Given that this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P3VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},


		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Is that so!? You know, I can’t believe this is how the City treats people.  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am finished negotiating!","VS_T1P3VA2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},


		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns","I’ve been patient with you, but now I’ve had just about enough.  If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.    We are finished negotiating.","VS_T1P3VA2_16.ogg"},
		 {"pg","I apologize; I didn’t mean to anger you.  Let’s move on,","VA25A"},
		 

	{"label","VA25RENEG"},
	{"fun2",incprofit,2},

	{"label","VA25A"},
	 {"ns1","Okay then, so my final offer is $%d.  Is that agreeable to you?","VS_T1P3VA2_17.ogg","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VA25B"},
	 {"pgs","Before we call it a deal, could you do the City a favor by adjusting the $1800 budget you have for radio- controlled boats and containment equipment?","VA25C","l"},


		{"label","VA25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Right then, the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P3VA2_18.ogg","cost"},
		 {"pg","I’m on my way to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"}, 


		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, I’ve had about enough of this.  We are finished negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem as if you are impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T1P3VA2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


			{"label","VA25D"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","Finally! Well, there is no time to waste – Let’s get Will Standon at City Hall to draw up a contract for $%d so we can get started.  Bring it right back here so that I can sign it -- and so that we can get to work!","VS_T1P3VA2_20.ogg","cost"},
			 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},

			{"label","VA25RENEGCHECK"},
			{"if","reneg","<",2,"VA25RENEG"},


--Peter			{"label","VA25E"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","I have had it.  This negotiation is over.  Come back when you have a contract for me for $%d.","VS_T1P3VA2_21.ogg","cost"},
			 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VA2ATD1"},
 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T1P3VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VA3ASD1"},
 {"ns1","Why are you here?  We have an emergency on our hands – so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P3VA3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder..","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","I am happy you’re back – we really need to get started containing this disaster.  Did you bring that contract for me to sign?","VS_T1P3VA3_01.ogg"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},


		{"label","VA31B"},
		 {"ns","Oh, well…alright.  Just come back as soon as you get a contract – time is a factor!","VS_T1P3VA3_02.ogg"},
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
		 {"ns","Okay, here we go…yes …uh-huh…wow! Look at that!  The city sure is being generous. That’s even more than I asked for!! Of course I’ll sign!  Here!","VS_T1P3VA3_03.ogg"},
		 {"pg","Thanks, I guess","VA33A"},
		 -- costa:Set to CC


		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed! Are you trying to throw a wrench into the gears, here?","VS_T1P3VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},

			{"label","VA32D"},
			{"fun2",incprofit,10},
			 {"ns","My attorney is going to have something to say about this! Excuse me. Hello, Alva?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers. You’re going to have to bring that contract back to your client – okay?","VS_T1P3VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VA32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},

				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract she drew up if you want me on board.  She insists that you get the Mayor to sign it because it has the service fee we agreed on.  Look, it’s coming through the fax now…","VS_T1P3VA3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},


				{"label","VA32F"},
				 -- scoreb:-SG
				 {"ns","I’m relieved that you understand this is the only way we can move forward.  Now, my attorney is going to fax a document over any second…and I am going to sign it and give it to you.","VS_T1P3VA3_11.ogg"},
				 {"pg","Alright, I understand.","VA33A"},


		{"label","VA32C"},
		 {"ns","Well let’s check it out….uh huh….mm hmmm…this looks perfect. I’d be happy to sign!","VS_T1P3VA3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},


		{"label","VA33A"},
		 {"ns","We’re done then!  I am really looking forward to being part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!   Goodbye, for now!","VS_T1P3VA3_07.ogg"},
		 {"pg","I am also looking forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VA3ATD1"},
 {"ns","I am also looking forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","VS_T1P3VA3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
