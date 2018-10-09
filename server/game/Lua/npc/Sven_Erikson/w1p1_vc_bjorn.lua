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

{"label","T1P1VC1"},


{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VCBONUS"},
	{"n","I heard you chose someone else to help with the spill."},	
	{"pg1","Yeah, we ended up choosing %s instead.","END","vendorx"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","VC1ASD1"},
 {"ns","Excuse me, do I know you???","VS_T1P1VC1_10.ogg"},
 {"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
 {"pg","Hey, you’re Bjorn Egan! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Velkommen!! Welcome to Norse Communications. My name is Bjorn Egan. How can I help you??","VS_T1P1VC1_01.ogg"},
	 {"pgs","There has been an oil spill in the New City River, and with your huge team of experts around the world, I think you could really help New City. ","VC11B","a"},
	 {"pgs","There has been an oil spill in the New City River, and given your reputation among the Elliot County Media Professionals Association, I think the City could use your help.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, we are an international powerhouse agency, and that is perhaps our greatest strength. I am happy you decided to come for a visit.  So tell me, why are you here then?","VS_T1P1VC1_02.ogg"},
		 {"pg","The city asked my firm to look into finding someone to provide media relations services for this crisis.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well my friend, I’m not sure you are exactly on top of things -- but in any case the environment is at stake, so let’s proceed. Please tell me about what you intend to accomplish with your task. ","VS_T1P1VC1_03.ogg"},
		 {"pg","Right, sorry about that.  I’m here looking for someone to provide media relations services for the city during this oil spill crisis.","VC12A"},


	{"label","VC12A"},
	 {"ns","You seem as bright as the Northern sun at Midnight! So why exactly did you decide to come to me looking for media relations?","VS_T1P1VC1_04.ogg"},
	 {"pgs","I hear that you have a knack for helping clients maintain message balance when press attention turns negative.","VC12B","c"},
	 {"pgs","I  understand that you have a  talented team on hand that can analyze complicated technical information. ","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Yeah, well that certainly describes us!  Not to change the subject, but I understand the crisis needs urgent attention – and so I am ready to start work should you need me.","VS_T1P1VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well, you seem to have looked us up before you stopped by. Quite impressive! Now, I have been told all about the current crisis, and I am completely ready to drop everything and get to work immediately should you need us.","VS_T1P1VC1_06.ogg"},
		 {"pg","Alright then, let’s continue","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Well, is that all you need to know?  Would you like a tin of salmon before you go?","VS_T1P1VC1_07.ogg"},
	 {"pgs","Actually, I have some research to do. In the meantime, please consider this a crisis – and you will help us by only charging for what is absolutely necessary for the job..","VC13B","e"},
	 {"pgs","Before I leave, I want you to know my decision to hire you would be influenced if you were to decide to make some sort of donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","I will keep that in mind. Well then, I hope I will see you again soon.  Good luck with everything….I sure hope the City will end up getting us all out of this mess!","VS_T1P1VC1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","You have some nerve! What kind of barbarian comes into my office demanding bribes!? If you hire us it should be because we are the best choice for the job – not because we decide to give you kickbacks!","VS_T1P1VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Since I’ve already told you everything you need to know, I understand if you have to get going and attend to your urgent task.  Good luck!","VS_T1P1VC1_13.ogg"},
 {"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more about the crisis.  Goodbye!","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Velkommen! I understand  you are under time pressure – are you back because you need me to start work for the City?","VS_T1P1VC1_11.ogg"},
	 {"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss, first ","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that?  You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any media relations services, just to be sure.","VS_T1P1VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","Good VClhalla! What are you doing here? You have a critical task on your hands!  Get approVCl from Mayor Gonzalez to hire me – and then come back here to work details of the arrangement with me.","VS_T1P1VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hey, good thing you’re here –I hear news of the disaster is spreading like a Viking raid! The city needs a media relations strategy right away!  There is little time to spare, so you must tell me – why did the Mayor end up approving your decision to move forward?","VS_T1P1VC2_01.ogg"},
	 {"pgs","The Mayor feels we need to hire a firm to get the word out about the disaster recovery effort in a clear, concise way.","VC21C","a"},
	 {"pg","Actually, she didn’t –  I am just passing through.  See you around!","VC21B"},
	 {"pgs","City Hall needs to ensure we get area firms to pitch in and help, and so your standing with the Elliot County Media Professionals Association should help.","VC21D","b"},
	 {"pgs","I would hire you without reservation – especially given your ability to get the word out both locally and around the state.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Well, I hope to see you back here as soon as you are ready to negotiate.  You’ll probably need my help if you want to clean up the City’s image and get us all out of this mess!","VS_T1P1VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Well that’s us!  It’s good you pay attention to details so closely.  Now, it’s clear the City needs help, but tell me - what would you like us to do, exactly?","VS_T1P1VC2_03.ogg"},
		 {"pg","We are looking  for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts..","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Is that so? Well…umm…you’ve come to the right place!  Anyway, we have no time to waste on trivia.  Please tell me exactly what the City needs from us.","VS_T1P1VC2_04.ogg"},
		 {"pg","The City needs you to step in and assist it in dealings with the press and public as it attempts to sort out a solution to this crisis.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Well, to get involved, we would need $%d. This includes $1250 for local lodging for the Norse Communications personnel we will bring into town for the job, $1500 for both a statewide and national press relations campaign, and $1250 for long distance phone calls to our branch offices abroad.","VS_T1P1VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","$1250 for long distance phone calls?  Don’t you normally charge $750 for that???","VC22B","c"},
	 {"pgs","Wait – I think that a national campaign may be overkill…don’t you?","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Right then, you noticed that.  Well, eh, I normally do charge $750 for our long distance bill - but I was thinking of upgrading to satellite phones…well, never mind. Let’s just say my price is now $%d.","VS_T1P1VC2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","That’s just not right - if you would have done your reading, you would have seen that I always charge for national campaigns when I work for firms within the State.  You know, I can tell now that the City is going to be a difficult client. You know, I am going to have to charge $%d for this.","VS_T1P1VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","What in Valhalla’s name are you talking about?!  I just told you what I charge, and I don’t appreciate your style of negotiating!  I heard the City can be a difficult client.  You know what? I think am going to have to charge $%d to do this job…","VS_T1P1VC2_08.ogg","cost"},
		 {"pg","Oh.  Sorry to have offended you...","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, so I only need $1000 on top of that for hair dye, techno CD’s, herbal teas, and sun lamps for the entire team, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P1VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Techno CD’s? Sun lamps? Not only have I seen that you charge $500 for that expense – but the City is in crisis here, and I don’t think charging for such expenses is even right….","VC23B","f"},
	 {"pgs","Don’t the CD’s, hair dye, and sun lamps normally run you $500? Why are you trying to charge us so much?","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know, now that you mention it, I should really should pay for our hair dye, music, and light therapy expenses out of my own pocket…and under the circumstances I’ll even knock a little off my fee.  Let’s just say I charge you $%d.  Does that seem fair?","VS_T1P1VC2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I think you may actually have a point there.  I think I shouldn’t raise that expense – given the circumstances, of course.  And you know what?  I really feel I can work well with you.  So I am going to lower my offer to $%d.  What do you say?","VS_T1P1VC2_11.ogg","cost"},
		 {"pg","I appreciate that, Bjorn. Thanks.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering to provide a service for the City - and that entails certain expenses.  I appreciate the urgency of our crisis, but I won’t stand for your hardball tactics.  This really seems like a more demanding  job than I thought –so I think I am going to have to charge $%d now.","VS_T1P1VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Right then.  So now, it will take $%d to get me on board…and we really should get started! So tell me, after all that - do we have a deal?","VS_T1P1VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now that we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VC24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge for those lodging expenses?","VC24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","I was actually thinking about the fjords back home and the serious repercussions this disaster could end up having on our environment. Given this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P1VC2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","And I thought Vikings were harsh! I can’t believe this is how the City treats people.  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T1P1VC2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns","I’ve been patient with you, but now I am ready to give you a Viking funeral. If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.    We are done negotiating.  ","VS_T1P1VC2_16.ogg"},
		 {"pg","I apologize, I didn’t mean to anger you.  Let’s move on.","VC25A"},


	{"label","VC25RENEG"},
	{"fun2",incprofit,2},
	{"goto","VC25A"}, -- BChance: Added goto so the script doesn't end abruptly.

	{"label","VC25A"},
	 {"ns1","My price is $%d, and that’s my final offer.  ","VS_T1P1VC2_17.ogg","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VC25B"},
	 {"pgs","Before we call it a deal, I just want to let you know – you would be doing the City a favor by adjusting your $1500 advertising budget… ","VC25C","l"},


		{"label","VC25B"},
-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
--			{"fun",incevelyn},
			{"fun3",setvar,"evelynprogress",8},
--			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"journalprogress",8},
--			{"fun",incstandon},
--			{"fun",incevelyn},
--			{"fun2",incvars,"journalprogress"},
		 {"ns1","Right then, so the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P1VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 -- PETER WAS HERE - This is where increments get confused....
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, I’ve had about enough of this.  We are done negotiating.  There is a crisis that demands our attention- and frankly, your haggling makes you seem impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T1P1VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- peter says - i don;t know creates issues.
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VC25D"},
-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
--			{"fun",incevelyn},
			{"fun3",setvar,"evelynprogress",8},
--			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"journalprogress",8},
--			{"fun",incstandon},
--			{"fun",incevelyn},

		 {"ns1","Finally! Well, there is no time to waste – Let’s get Will Standon at City Hall to draw up a contract for $%d so we can get started.  Bring it right back here so that I can sign it -- and so that we can get to work!","VS_T1P1VC2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},
-- BChance: This commented out label makes the label above end abruptly.
		--{"label","VC25E"},
-- Peter was here- forcing vendors to behave....
			{"fun3",setvar,"standonprogress",8},
--			{"fun",incevelyn},
			{"fun3",setvar,"evelynprogress",8},
--			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"journalprogress",8},
--			{"fun",incstandon},
--			{"fun",incevelyn},
		 {"ns1","I have had it.  This negotiation is over.  Come back when …when…you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get out of my sight.","VS_T1P1VC2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I am ready to serve the City,but we should move quickly.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T1P1VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns1","Oh, it’s you.  Look, I time is ticking away, so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P1VC3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","There you are! I have’t been able to listen to anything but sad old techno CDs since you left.  This crisis is really bothering me a lot! I can’t wait to get started - did you come back with that contract for me to sign? ","VS_T1P1VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Oh, well…alright.  Just come back as soon as you get a contract – time is of the essence! ","VS_T1P1VC3_02.ogg"},
		 {"pg","Sounds good.  See you soon!","END"},

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
		 {"ns","Excellent! So, yes …uh-huh…wow! The city sure is being generous. That’s even more than I asked for!! Of course I’ll sign!","VS_T1P1VC3_03.ogg"},
		 {"pg","Thanks, I guess","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, then let me have a…wait - .no!  This isn’t the price we agreed on! What kind of monkey business is this?","VS_T1P1VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			{"fun2",incprofit,10},
			 {"ns","Wait, this is less than what we agreed!  I’ll need to conference my attorney in on this. Excuse me. Hello, Sven?  Yeah, they…uh-huh…okay, bye. Yes, well, my lawyer will send over a contract with the right numbers. You’re going to need to bring that contract back to your client – okay?","VS_T1P1VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.","VS_T1P1VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","I really hate confrontations so I’m relieved you understand this is the only way we can move forward.  Don’t worry, Norse will give you all the press you deserve!","VS_T1P1VC3_11.ogg"},
				 {"pg","Alright, I understand.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well let’s check it out….uh huh….mm hmmm…there you go! This looks perfect. Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P1VC3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","Excellent! I am happy to be part of the team.  I really look forward to doing the best job possible!","VS_T1P1VC3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","I’ve been know to stand around chewing on salmon jerky myself, but I have to ask -- what are you doing here!!?  You should get back to City Hall and have the Mayor sign that contract.  The future of our City is at stake!","VS_T1P1VC3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
