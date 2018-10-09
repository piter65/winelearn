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

{"label","T1P1VA1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P1vA1"},

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
		-- PEter was here- Forcing things to happen...



 {"ns","I am sorry; our seminar on ‘Techniques for Subliminal Messaging' doesn't start for another hour.  You may wait around here, if you like….but you'll have to  excuse me.  I have to print up the speaker badges.","VS_T1P1VA1_10.ogg"},
 {"pg","Pardon me, I didn’t mean to disturb you","END"},
 {"pg","Hey, you’re Nina Ojeda! I’ve heard of you!","END"},
 
--****************
--INTERVIEW
--****************
 
	{"label","VA11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Welcome to Narravi Associates!  I don’t think we’ve met before.  My name is Nina Ojeda. How can I help you?","VS_T1P1VA1_01.ogg"},
	 {"pgs","There has been an oil spill in the New City River – and the City needs someone who can clearly communicate to the press and public about what’s going on. ","VA11B","a"},
	 {"pgs","There has been an oil spill in the New City River, and the City needs help-and given your recent trouble with other firms in the industry, this may be a great opportunity for you to get back on top!","VA11C","b"},
 
		{"label","VA11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well it’s a good thing you decided to come here! We pride ourselves in our knack for distilling complicated information into short, consumptive sound bites.  So, now I am curious about what is going on.  What do you need from my firm? ","VS_T1P1VA1_02.ogg"},
		 {"pg","The city has asked me to find someone to provide help during this crisis performing media relations work for the City.","VA12A"},
 
		{"label","VA11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","It’s a good thing this isn’t a press conference, because anyone can see that you do not have your facts straight.  However, since the future of our City is in jeopardy, perhaps you should continue explaining your purpose here.","VS_T1P1VA1_03.ogg"},
		 {"pg","I guess I got my facts confused; sorry. I am here looking for someone to provide help during this crisis by performing media relations work for the City.","VA12A"},
 
 
	{"label","VA12A"},
	 {"ns","Here at Narravi, we like to think of ourselves as media musicians who play the press like a drum.  So given that this is a crisis situation and every second counts why did you decide to come here?","VS_T1P1VA1_04.ogg"},
	 {"pgs","Well I hear that you have a knack for limiting the PR damage done to your clients who have broken the law.","VA12B","c"},
	 {"pgs","Well, to be honest, I thought twice about about approaching you when I found you frequently turn down government clients.","VA12C","d"},
 
		{"label","VA12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, honestly, I can do that…but I would think you would also want someone who would be able to ensure that the messages are balanced so the press doesn’t turn negative. Regardless, I am available if you feel that I can help.","VS_T1P1VA1_05.ogg"},
		 {"pg","Okay, great!","VA13A"},
 
 
		{"label","VA12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","I can see you've been studying up on Narravi Associates. I can see we have a crisis on our hands and you can be sure that if you call on me, I will be happy to drop everything and focus on the City's needs.","VS_T1P1VA1_06.ogg"},
		 {"pg","Alright then, let’s continue.","VA13A"},
 
 
	{"label","VA13A"},
	{"fun", incinterv},
	 {"ns","So I hope that you are thoroughly informed now.  I will be here all week if you decide we’re the right firm for the task, and want to come back and discuss the details of the assignment.","VS_T1P1VA1_07.ogg"},
	 {"pgs","Yes, I’ll be back if I decide to hire you,-but in the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VA13B","e"},
	 {"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VA13C","f"},
 
		{"label","VA13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Yes, I was just thinking about the headlines this disaster will steal from my other clients…of course, this tragedy with the river’s fish, ducks and seals really does make a story that sells.  Well then, it was a pleasure meeting you.  I sure hope you can help get the town out of this mess!","VS_T1P1VA1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},
 
 
		{"label","VA13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","You should be ashamed of yourself.  I certainly hope you don’t treat all journalists like this!  I do not take kindly to prospective clients talking their way into my office and making demands!  Hire my firm  because we are the best choice– not because we give you a kickback!","VS_T1P1VA1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},
 
 
--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************
 
{"label","VA1ATD1"},
 {"ns","Thanks for stopping by, then.  It was nice meeting you. I know you’re busy, so don’t let me keep you.  If you decide you need our services, just come back and we’ll talk about details!","VS_T1P1VA1_13.ogg"},
 {"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more about the crisis.  Goodbye!","END"},
 
 
--*******************
--CAN'T NEGOTIATE YET
--*******************
 
	{"label","VA1ASD2A"},
	 {"ns","Hello. Are you here for the symposium on mass audience persuasion? Oh, it’s you!  You must be so busy right now – are you here to hire me?","VS_T1P1VA1_11.ogg"},
	 {"pg","No - I have more research to do, and have to meet with my client first.","VA1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VA1ASD2B","g"},
	 
		{"label","VA1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure you are prepared for that?  You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before we talk about providing the City with any media relations services.","VS_T1P1VA1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},
 
		{"label","VA1ASD2C"},
		-- scorea:+SS
		{"goto","END"},
 
--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************
 
{"label","VA2ASD1"},
 {"ns","What are you doing here? You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here to work out the details of the arrangement with me.","VS_T1P1VA2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},
 
--*****************
--NEGOTIATIONS
--*****************
 
	{"label","VA21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hey, good thing you’re here –I hear news of the disaster is spreading like a bad cold.  The city needs a media relations strategy right away!  There is little time to spare, so you must tell me –did the mayor approve Narravi Associates for your assignment?","VS_T1P1VA2_01.ogg"},
	 {"pgs","The mayor feels we need a firm that can get the word out about the recovery effort, and you are known to reach the media both in New City and throughout the state.","VA21C","a"},
	 {"pg","Actually, she didn’t. I am just passing through.  See you around!","VA21B"},
	 {"pgs","City Hall needs to ensure we get favorable international press coverage, and your extensive multinational network may be of help to us.","VA21D","b"},
	 {"pgs","I would hire you without reservation – except, I’m concerned your skills in media manipulation are untested.","VA21D","b"},
 
 
		{"label","VA21B"},
		 {"ns","Well, I hope to see you back here as soon as you are ready to negotiate.  You’ll probably need my help if you want to protect the City’s image and get us all out of this mess!.","VS_T1P1VA2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},
 
 
		{"label","VA21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","What an accurate analysis!  With that attention to detail, you should be writing press releases. It’s clear the City needs help, so tell me - what are you looking for us to do?","VS_T1P1VA2_03.ogg"},
		 {"pg","We are looking for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VA22A"},
 
 
		{"label","VA21D"},
		 -- scored:-MD
		 {"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor1},
		{"fun",talkedtovendor1},
		 {"ns","Is that so? Well, I don’t exactly know what you’re talking about but we have no time to waste on trivial matters.  Please tell me exactly what the City needs from us.","VS_T1P1VA2_04.ogg"},
		 {"pg","The City needs you to step in and assists it in dealings with the press and public as it attempts to sort out a solution to this crisis.","VA22A"},
 

	{"label","VA22A"},
	 {"fun",halfcost},
	 {"ns1","Well, to get involved with this, we would need $%d. This includes a $1200 budget for ad placements in the local and state-wide press, $1800 for extra desks and phone lines, and $1000 for matching ergonomic phones for our staff to handle media inquiries.","VS_T1P1VA2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VA25B"},
	 {"pgs","$1000 for ergonomic phones?  Didn’t I recently see you charge $500 for this expense?","VA22B","c"},
	 {"pgs","Wait – I think that ordering all those extra desks may be overkill…don’t you?","VA22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VA22D","deal","e"},
 
		{"label","VA22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Right then, you noticed that.  Well, eh, I normally do charge $500 for the ergonomic phones - but I was thinking of upgrading my service in this case…well, nevermind. Let’s just say my price is now $%d.","VS_T1P1VA2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VA23A"},
 
		{"label","VA22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That’s just not right - if you would have done your research, you would have seen that I always charge $1800 for extra phones and desk chairs for any additional staff I hire.  You know, I can tell now that the City is going to be a difficult client. I think I will have to charge $%d for this.","VS_T1P1VA2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.","VA23A"},
		 -- costa:PLUS
 
 
		{"label","VA22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Do you call that persuasive argumentation?!  I just told you what I charge, and I don’t appreciate your style of negotiating!  I heard the City can be a difficult client.  You know what? I think am going to have to charge $%d to do this…","VS_T1P1VA2_08.ogg","cost"},
		 {"pg","Oh.  Sorry to have offended you...","VA23A"},
 
 
	{"label","VA23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so I only need $1000 on top of that to cover our takeout food for the duration of the engagement, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P1VA2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VA25B","cost"},
	 {"pgs","Takeout food? Not only have I seen that you charge $500 for that expense – but the City is in crisis here, and I don’t think charging for takeout is right….","VA23B","f"},
	 {"pgs","Doesn’t takeout food normally run $500? Why are you trying to charge us so much?","VA23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VA23D","deal","h"},
 
		{"label","VA23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know, now that you mention it, I really should pay for that expense out of my own pocket, given the circumstances, and since you’re paying attention, I’ll shave a little off my profit…so let’s just say I charge you $%d.  Does that seem fair?","VS_T1P1VA2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VA24A"},
 
 
		{"label","VA23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I think you may actually have a point there.  You know what?  I really feel I can work well with you.  So I am going to lower my offer to $%d.  What do you say?","VS_T1P1VA2_11.ogg","cost"},
		 {"pg","I appreciate that, Nina. Thanks.","VA24A"},
 
		{"label","VA23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering to provide a service for the City - and that means that certain expenses will be incurred.  I appreciate the urgency of our crisis, but I won’t stand for your hardball tactics.  This really seems like a more demanding job than I thought –so I think I am going to have to charge $%d now.","VS_T1P1VA2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VA24A"},
 
 
	{"label","VA24A"},
	 {"ns1","Right then. So now, it will take $%d to get me on board…and we really should get started! So tell me, after all that - do we have a deal?","VS_T1P1VA2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VA25B"},
	 {"pgs","Now that we’ve covered all your expenses and considering that this is a crisis, do you think you could forgo some profit?","VA24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge so much for ad placement?","VA24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VA24D","cost","k"},
 
		{"label","VA24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions on our environment. Given that this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P1VA2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VA25A"},
 
 
		{"label","VA24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Is that so!? You know, I can’t believe this is how the City treats people.  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T1P1VA2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VA25A"},
 
 
		{"label","VA24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns","I’ve been patient with you, but now I’ve had just about enough. If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.    We are done negotiating.","VS_T1P1VA2_16.ogg"},
		 {"pg","I apologize; I didn’t mean to anger you.  Let’s move on.","VA25A"},
		 

	{"label","VA25RENEG"},
	{"fun2",incprofit,2},
 
	{"label","VA25A"},
	 {"ns1","My price is $%d, and that’s final.  Do you find that offer convincing enough?","VS_T1P1VA2_17.ogg","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VA25B"},
	 {"pgs","Before we call it a deal, I just wanted to let you know – you would be doing the City a favor by adjusting the $1800 budget you have for desks, chair and phone lines ….","VA25C","l"},
 
 
		{"label","VA25B"},




		-- PEter was here- Forcing things to happen...
-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

		 {"ns1","Great, so the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P1VA2_18.ogg","cost"},
		 {"pg","I’m on my way to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},
 
 
		{"label","VA25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, I’ve had about enough of this.  We are done negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem as if you are impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T1P1VA2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VA25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VA25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS
 
 
		{"label","VA25D"},
-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
--			{"fun",incevelyn},
			{"fun3",setvar,"evelynprogress",8},
--			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},
		 {"ns1","Finally! Well, there is no time to waste – Let’s get Will Standon at City Hall to draw up a contract for $%d so we can get started.  Bring it right back here so that I can sign it -- and so that we can get to work!","VS_T1P1VA2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},
 
		{"label","VA25RENEGCHECK"},
		{"if","reneg","<",2,"VA25RENEG"},
--		{"goto","VA25E"},   -- Peter was here

--		{"label","VA25E"},
		-- PEter was here- Forcing things to happen...

			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},

--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},
		 {"ns1","I have had it.  This negotiation is over.  Come back when …when…you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get out of my sight.","VS_T1P1VA2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},
 
--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************
 
{"label","VA2ATD1"},
 {"ns1","I am ready to serve the City, but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T1P1VA2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},
 
--***************
--NO CONTRACT YET
--***************
 
{"label","VA3ASD1"},
 {"ns1","Oh, it’s you.  Look, we need to get to work on this disaster as soon as possible, so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P1VA3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},
 
--******************
--CONTRACT SIGNING
--******************
 
	{"label","VA31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","There you are! I am so distraught by what is happening – I can’t wait to get involved!  So, do you have that contract for me to sign?","VS_T1P1VA3_01.ogg"},
	 {"pg","Yes, I have it right here.","VA32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VA31B"},
 
 
		{"label","VA31B"},
		 {"ns","Oh, well…alright.  Just come back as soon as you get a contract – there’s no time to lose!","VS_T1P1VA3_02.ogg"},
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
		 {"ns","There we are! So, yes …uh-huh…wow! It’s very kind of the City to recognize my dedication to the environment and be so generous. That’s even more than I asked for!! Of course I’ll sign!","VS_T1P1VA3_03.ogg"},
		 {"pg","Thanks, I guess","VA33A"},
		 -- costa:Set to CC
 
 
		{"label","VA32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, then let me have a…wait - .no!  There must be some kind of mistake here...","VS_T1P1VA3_04.ogg"},
		 {"pg","I am sorry…","VA32D"},
 
			{"label","VA32D"},
			{"fun2",incprofit,10},
			 {"ns","This is less than what we agreed on, and I’m going to have to consult with my attorney about this. Excuse me. Hello, Ken?  Yeah, they…uh-huh…okay. Look, my lawyer will send over a contract with the right numbers for you to bring back to your client – okay?","VS_T1P1VA3_06.ogg"},
			 {"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VA32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VA32F","b"},
			
				{"label","VA32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.","VS_T1P1VA3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VA33A"},
 
 
				{"label","VA32F"},
				-- scoreb:-SG
				 {"ns","I’m relieved you understand this is the only way we can move forward.  You can relax; all of your media relations needs are now in our competent hands.","VS_T1P1VA3_11.ogg"},
				 {"pg","Alright, I understand.","VA33A"},
 
 
		{"label","VA32C"},
		 {"ns","Well let’s check it out….uh huh….mm hmmm…there you go! This looks perfect. Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P1VA3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VA33A"},
 
 
	{"label","VA33A"},
	 {"ns","Excellent! I am happy to be part of the team.  I really look forward to doing the best job possible!","VS_T1P1VA3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I have to get going,","END"},
 
--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************
 
{"label","VA3ATD1"},
 {"ns","Pardon me, but, why are you here?   You should get back to City Hall and have the Mayor counter sign that contract.  The future of our City is at stake!","VS_T1P1VA3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},
 
--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
 
}
return dialogtext
