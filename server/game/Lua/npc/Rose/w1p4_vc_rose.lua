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

{"label","T1P4vc1"},

--**************
--Chose Someone else
--**************

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
 {"ns","Hey, man.  Like, do I know you?","VS_T1P4VC1_10.ogg"},
 {"pg","No, I don’t think we’ve been introduced.  Pardon me…","END"},
 {"pg","Hey, you’re Ramblin’ Rose! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Hey, man! Welcome! My name is Ramblin’ Rose. You look familiar.…Were you at Woodstock?","VS_T1P4VC1_01.ogg"},
	 {"pgs","No, I am here to talk to you about performing a disaster assessment, and I understand you have a track record of providing bias free reports.","VC11B","a"},
	 {"pgs","I am here inquring after a disaster assessment, and I think your recent success with your investigation into our local ponds and streams can be a great help to us here.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, I am certainly nobody’s slave – and I never work for ‘The Man’.  And Heaven knows I am not afraid of reporting controversial activity, that’s for sure, man.  So please, tell me more about the situation.","VS_T1P4VC1_02.ogg"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Woah, man.  Maybe you’re like operating in some kind of parallel universe or something cause I don’t have any idea what you’re talking about.  But anyway, tell me about your gig.","VS_T1P4VC1_03.ogg"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VC12A"},


	{"label","VC12A"},
	 {"ns","Whoa, man!  Far out!  An actual job!  That’s totally groovy!  So it seems like you need a professional for this.  Why did you come to me?","VS_T1P4VC1_04.ogg"},
	 {"pgs","I understand that you have ready access to the latest and most up-to-date technology you can use to perform your assessments.","VC12B","c"},
	 {"pgs","I understand you are known for your environmental advocacy and that your team of bus-ins and you are often seen at local disaster sites.","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well  I am glad you’d trust me with that.  I can promise to try and make that happen.   Not to change the subject, but like, I totally understand that this is a crisis and an assessment is totally needed.  I am ready to jump right in if you need me.","VS_T1P4VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Far out!  You have, like, a totally excellent short term memory!  I am impressed.  Now that I know about what’s going on, I can jump right in if you need me to.","VS_T1P4VC1_06.ogg"},
		 {"pg","Alright then, let’s continue","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","So is that, like, all you need to know, man?","VS_T1P4VC1_07.ogg"},
	 {"pgs","Actually, I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VC13B","e"},
	 {"pgs","Before I leave, I want you to know my decision to hire you would be influenced if you were to decide to make some sort of donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Whoa, that’s deep, man.  I am like, totally going to take that into consideration.","VS_T1P4VC1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","What kind of suit comes into my park demanding unauthorized donations?  If you hire me, it should be because our planets are aligned, and because I am the right choice for the job – not because I comply with this kind of strong-arming!","VS_T1P4VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Whoa, man, why are you still like, walking around in the park?  There is an urgent crisis you should be dealing with right now...","VS_T1P4VC1_13.ogg"},
 {"pg","Yes, I was actually just going to have a look around. I  may be back soon to talk to you more about the crisis.  Goodbye, for now!","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Whoa, hey there!  It’s like, so groovy that you’re back!  So did you decide to hire me to perform the assessment?","VS_T1P4VC1_11.ogg"},
	 {"pg","No, I have more research to do, and have to talk to my boss, first.","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","Whoa, like, slow down there, man.  I think you should probably get the official go-ahead from the Mayor about me providing the City with any disaster assessment services before we negotiate.","VS_T1P4VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward.","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","Whoa, man, what are you doing here?  You should split back to your client and decide on someone to hire! If you choose me, I will see you again when you come back to negotiate.","VS_T1P4VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that...","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hey there. You know, news of the disaster is all over the place…it kinda reminds me of when Jimmy died.  Oh well, , something tells me you’re here to hire me, right!  Well, it’s a good thing…I could really use the money.","VS_T1P4VC2_01.ogg"},
	 {"pgs","Yes, we decided to bring you on because we like your track record of environmental advocacy.","VC21C","a"},
	 {"pg","Actually, my client didn’t approve you yet –  I am just passing through.","VC21B"},
	 {"pgs","City Hall appreciates your extensive experience providing ecological assessments for all sorts of clients all over the State.","VC21D","b"},
	 {"pgs","We are excited to have you aboard – especially considering you have publicly stated you are over the death of The Boys’ lead guitarist Jimmy Rodriguez.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Whoa, what a bummer!  Well what’s taking you so long?  Get the approval from City Hall to negotiate, and hurry back here! I am sure the disaster is having terrible effects on the environment, and someone should figure out exactly what is going on!","VS_T1P4VC2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Whoa, you recall information really well!  I totally wish I still had a short term memory.  So anyway, tell me - what are we trying to do with this gig again?","VS_T1P4VC2_03.ogg"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		 {"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Well…umm…I don’t know about that, but…well, I don’t think that really matters, anyway!  But hey,, we have no time to waste on trivia.  Please tell me exactly what the City needs from us.","VS_T1P4VC2_04.ogg"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Oh, riiiight.  So, to get truckin’, I will need $%d. This includes $1250 to bus in my team of, err, specialists to assist with this assignment; $1500 for animal-friendly monitoring stakes to track ground water remediation; and $1250 for incense, flowers and bootleg tapes to serve as sensory aids while presenting my findings.","VS_T1P4VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Isn’t $1250 for bootleg tapes, incense and flowers more than you normally charge?","VC22B","c"},
	 {"pgs","$1250 for a charter bus rental?  I know for a fact you’ve charged less for that in the past!","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, I was going to use digital audio tape this time, which is a little pricier…but nevermind.  I have an old 8-track tape machine that works just fine. Let’s just make that $750, then, and I then can shave some related expenses, so let’s just say the total is $%d.","VS_T1P4VC2_06.ogg","cost"},
		 {"pg","That works!  Let’s move on, then.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Whoa, you are like, totally spaced, man. You should have looked around and researched this decision -- I always charge the same amount to bus in my pals. You know, I can tell now that the City is going to be a difficult client – so I think I may have to charge $%d for this.","VS_T1P4VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Look, man, you’re starting to bum me out.  That really is no way to act in a negotiation!  You know, you seem like you’re a little uptight for my tastes.  I think I am going to have to charge you $%d.","VS_T1P4VC2_08.ogg","cost"},
		 {"pg","Oh.  Sorry to have offended you...","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remaining expense we must account for is the $1000 for inks, colorants, and three dozen white t-shirts and work pants we need to create tie-dyed uniforms for the assessment personnel.  That brings us to $%d – and so that’s my offer.","VS_T1P4VC2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Tie dyed uniforms, eh? Not only have I seen you that you charge $500 for that expense – but the City is in crisis here, and I can’t really see why we would ever really need them.","VC23B","f"},
	 {"pgs","Before we wrap up, I’ll say yes– it’s just that I have seen you charge less for tie died uniforms before.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Right on, man.  Given the circumstances, I think I can pay for that out my own pocket.  And do you know what?  I really feel like there’s a real flow of positive energy between us – so I am going to lower my offer to $%d.  How about it?","VS_T1P4VC2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s move on.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns","Right on, man.  It is quite possible that given the circumstances, we can lower that expense to $500 – and I’ll just get exactly as many uniforms as I need, this time.","VS_T1P4VC2_11.ogg"},
		 {"pg","Thanks, Phil. I appreciate the concession.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Whoa. You are like, totally off base with your tactics, man.  You know, you really are uptight – I think I am going to have to charge $%d if I have to deal with people like you and manage to pull of a successful assessment.","VS_T1P4VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Alright then, man, that brings us to a final total of $%d for performing the assessment.  We really need to get truckin’, so tell me - do we have a deal?","VS_T1P4VC2_13.ogg","cost"},
	 {"pg","Yes, agreed.  We have a deal!","VC25B"},
	 {"pgs","Now we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VC24B","i"},
	 {"pgs","Before we ‘get truckin’,are you sure you really need $1500 for animal friendly monitoring stakes?  Can’t we rent them somewhere cheaper?","VC24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, man, when I think about all the little animals out there in the goo, it just makes me think of Jimmy….and I want to start to cry.  I think I can compromise for the sake of all the little animals, - so I am going to lower my offer to $%d.","VS_T1P4VC2_14.ogg","cost"},
		 {"pg","That’s quite an outlook, Rose.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","You know, man, you’re totally freaking me out.  I told you what my expenses are, and you’re being, like, a total fascist., I’m thinking it will take more to get this assessment done – so I think I have to charge you $%d. And that’s not negotiable.","VS_T1P4VC2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Whoa, man, you really are turning out to be a total bummer. Those kinds of tactics just aren’t acceptable here in New City.  I am going to have to teach you a lesson, man, so the price for this assessment is now $%d.","VS_T1P4VC2_16.ogg","cost"},
		 {"pg","I apologize, I didn’t mean to ‘bum you out.’  Let’s just continue.","VC25A"},
		 

	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","Well, far out, then! So, my price is $%d, and that’s my final offer.  Agreed?","VS_T1P4VC2_17.ogg","cost"},
	 {"pg","Okay, fair enough.  It’s a deal.","VC25B"},
	 {"pgs","Almost – I just want to talk about the charge for your sensory presentation aids.  Do you think we can find a cheaper place to buy them?","VC25C","l"},


		{"label","VC25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Groovy! So now, all you need to do is report to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you make it back with the paperwork!","VS_T1P4VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","You know, I’m like totally bummed out.  Because you are being sooo antagonistic right now, I am just going to have to charge you $%d and that’s final!","VS_T1P4VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","This is crazy - I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VC25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Far out, man!  I am happy we finally agree on something! Now, go and tell Will Standon at City Hall to get a contract drawn up for $%d, and report back here so we can get started on the assessment!","VS_T1P4VC2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},

-- Peter was here		{"label","VC25E"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Look, man, I have had it. This negotiation is like my favorite band, The Boys – totally finished! Forever!!  Get out of my site and don’t invade my space until you have a contract for me for $%d!","VS_T1P4VC2_21.ogg","cost"},
		 {"pg","Right then, so I guess we have a deal. I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","Hey man, I’d love to hang, but shouldn’t you be somewhere or something? You should go to City Hall and report back once you’ve gotten Standon to draw up a contract for $%d.","VS_T1P4VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns1","Whoa, hey there, man.  Remember, to get started we are going to need a contract for $%d. Talk to Will Standon at City Hall and hurry back here when you have it!","VS_T1P4VC3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Hey, man!  You are back. Far out. I can’t wait to get started, because like, I work’s been scarce.  Actually, I don’t know if I’ve ever had a real job.  Anway, are you here with a contract for me to sign?","VS_T1P4VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Whoa, man, like, what are you doing here?  This is  like a total emergency!  Bring that contract back here as fast as you can!","VS_T1P4VC3_02.ogg"},
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
		 {"ns","Alright, then, so let’s have a look!  Okay….uh-huh…oh, far out!  This is way more than I asked for!  Here you go.  Just give that to the Mayor so she can countersign, and we can get started with the assessment!","VS_T1P4VC3_03.ogg"},
		 {"pg","Thanks, I guess","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, then let me have a…whoa, man.  What a bummer! Are you trying to rip me off? You know, man, you should, be like totally ashamed of yourself.","VS_T1P4VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			{"fun2",incprofit,10},
			 {"ns","This is like, a lot less than we agreed upon, you know. My attorney will totally have something to say about this! Excuse me…hello, Buddy?  Yeah, they…uh-huh…okay, bye.  Look, my lawyer will send over a contract with the right numbers for you to bring back to City Hall – okay?","VS_T1P4VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I like totally understand your position, man, but my attorney has advised me to use the contract he drew up.  He insists you get the Mayor to sign it if you want to hire me, because it has the service fee we agreed on.","VS_T1P4VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","Whoa, man, it’s like, so cool how you understand that this is what I need to do for us to move ahead.  But don’t worry – I will still give the same level of effort and intensity I give to all my clients!","VS_T1P4VC3_11.ogg"},
				 {"pg","Alright, I understand.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well let’s check it out….uh huh….mm hmmm… Yeah, man, this is like, completely groovy.  Here you are!  Report to City Hall with this contract and have the Mayor countersign - and I can get started with the assessment!","VS_T1P4VC3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","Far out!  I am really excited to have an actual job.  And the money won’t hurt either.  Now if you’ll excuse me I have preparations to make – I’m sure I’ll be seeing you around!","VS_T1P4VC3_07.ogg"},
	 {"pg","I also look forward to working with you, as well, Rose.  Until next time!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","Whoa!  Like, what are you doing here!!?   Get back to City Hall so the Mayor can sign that contract, man! The future of our City is at stake!","VS_T1P4VC3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that...","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
