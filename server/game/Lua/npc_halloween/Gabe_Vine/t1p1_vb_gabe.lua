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

{"label","T1P1VB1"},


--**************
--Chose Someone else
--**************

{"label","T1P4va1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

{"label","T1P1VB1"},


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
 {"ns","Um.  Excuse me, do I know you?..?","VS_T1P1VB1_10.ogg"},
 {"pg","No, I don’t think we’ve been introduced.  Pardon me.","END"},
 {"pg","Hey, you’re Gabe Vine! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VB11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		{"fun3",setvar,"scoreconvo","vb1"},
	 {"ns","Welcome to New Media Communications. My name is Gabe Vine. How can I help you?","VS_T1P1VB1_01.ogg"},
	 {"pgs","There has been an oil spill in the New City River, and because you have experience both in town and around the State, I think the City could use your help.","VB11B","a"},
	 {"pgs","There has been an oil spill in the New City river, and the City needs help-although I am concerned about your recent legal troubles.","VB11C","b"},

		{"label","VB11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Right on, brah! That’s what we’ve been doing here ever since we started a little over a year ago.  Well I am happy to see you here. You’ve got my attention – so talk to me. ","VS_T1P1VB1_02.ogg"},
		 {"pg","Glad to hear it.  You see, the city asked my firm to look into finding someone to provide media relations services during this oil spill crisis.","VB12A"},

		{"label","VB11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","What on earth are you talking about?  Are you sure have the right Gabe Vine? You don’t seem very prepared – but you’re here because the future of our City is at stake.  Go on and tell me about what you intend to accomplish with your work for the City.","VS_T1P1VB1_03.ogg"},
		 {"pg","I guess I got my facts confused. Anyway, I’m here looking for media relations services the city needs eduring this oil spill crisis.","VB12A"},


	{"label","VB12A"},
	 {"ns","Well let’s talk turkey.  I understand this oil spill has presented the City with a crisis situation.  I know that every second counts here – so why did you decide to come here looking for media relations services?","VS_T1P1VB1_04.ogg"},
	 {"pgs","My understanding is that you used to work at Ubik & Wittus and so you have exactly the kind of experience we need for this.","VB12B","c"},
	 {"pgs","Well I hear that you are skilled at communicating complicated messages to the overall public.","VB12C","d"},

		{"label","VB12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Whaddya mean?  I am pretty sure you have absolutely no idea what you are talking about.  Never mind.  I’m as green as they come strongly about the environment – and so I am ready to start work right away if you need me.","VS_T1P1VB1_05.ogg"},
		 {"pg","Alright then, let’s continue.","VB13A"},


		{"label","VB12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well, that makes a lot of sense. You sure do know what you’re talking about! The bottom line is, I feel strongly about the environment – and so I m ready to start work right away if you need me to.","VS_T1P1VB1_06.ogg"},
		 {"pg","Okay, great!","VB13A"},


	{"label","VB13A"},
	{"fun", incinterv},
	 {"ns","So did you hear everything you need to?  What do you say?","VS_T1P1VB1_07.ogg"},
	 {"pgs","Yes, but I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VB13B","e"},
	 {"pgs","Well, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VB13C","f"},

		{"label","VB13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","Well then, I hope to chat with you again soon.  Good luck with everything - I sure hope you can help the City get us all out of this mess!","VS_T1P1VB1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VB13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","I’ve about had it with that kind of trash talk.  I do not take kindly to newcomers waltzing into my office demanding bribes!  If you decide to hire me, do it because I am the best possible choice for the job – not because I decide to give you a kickback!.","VS_T1P1VB1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VB1ATD1"},
 {"ns","Since I’ve already told you everything you need to know, I understand if you have to get going and attend to your business.  Good luck!","VS_T1P1VB1_13.ogg"},
 {"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more the crisis.  Goodbye!","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VB1ASD2A"},
	 {"ns","Hey, brah! Welcome back. I understand you are under time pressure – are you back because you need me to start work for the City?","VS_T1P1VB1_11.ogg"},
	 {"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss first ","VB1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VB1ASD2B","g"},
	 
		{"label","VB1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that?  You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from the Mayor before we talk about providing the City with any media relations services, just to be safe.","VS_T1P1VB1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I am ready to move forward…","END"},

		{"label","VB1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VB2ASD1"},
 {"ns","I’d love to chew the fat, but you have a critical task on your hands!  You should go get approval from your client if you decide you want to hire me - and then come back here so that we can negotiate.","VS_T1P1VB2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VB21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Welcome back, brah! I am happy you came back to talk.  There sure is a lot going on! So have you gotten approval from the Mayor to engage my services?","VS_T1P1VB2_01.ogg"},
	 {"pgs","You bet!  I am excited considering your career has been spent in the media industry here in New City.","VB21C","a"},
	 {"pg","No, I am just passing through.  See you around","VB21B"},
	 {"pgs","You bet!  I am excited to see what you can do for the city considering the great work you did saving Idion Energy!","VB21D","b"},
	 {"pgs","Well, I would  hire NMC, but I’m concerned that your firm may not be able to get news out about the disaster both locally and state-wide…","VB21D","b"},


		{"label","VB21B"},
		 {"ns","Well then I’ll see you later, brah!  Just come back as soon as you are ready to chat about the details.","VS_T1P1VB2_02.ogg"},
		 {"pg","Yes, I’ll be back when I am ready to negotiate! Bye!","END"},


		{"label","VB21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","I like the way you talk, brah! You’re speaking my language…so what exactly does the City want me to do?","VS_T1P1VB2_03.ogg"},
		 {"pg","We are looking for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VB22A"},


		{"label","VB21D"},
		 -- scored:-MD
		 {"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor2},
		{"fun",talkedtovendor2},
		 {"ns","Well, that sounds doable, but I’m not sure that’s really why youre here…well, no matter…because there is no time to waste.  Please tell me the details of the task the City has outlined.","VS_T1P1VB2_04.ogg"},
		 {"pg","We are looking  for a firm who can act as a liaison between the City and the media, communicating ongoing developments in our recovery efforts.","VB22A"},


	{"label","VB22A"},
	 {"fun",halfcost},
	 {"ns1","It sounds like you guys want to talk turkey! Well, we  charge $%d.  This includes $2000 to set up a war room by the disaster site.  I also need $750 for flyers and pamphelets for my team of street promoters to hand out, and $1250 for comic books to help teach us about similar toxic disasters.","VS_T1P1VB2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VB25B"},
	 {"pgs","I thought you normally charge $750 for the comic books your experts use to learn about disasters.","VB22B","c"},
	 {"pgs","Wait – I don’t think that’s what you usually charge to print flyers and hire a team of street promoters…","VB22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VB22D","deal","e"},

		{"label","VB22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Uh yeah, you noticed that…well, the truth is, I normally do charge less for them but I was thinking I was going to upgrade my service offering for the City in this particular case…well, nevermind. Let’s just say my price is now $%d.","VS_T1P1VB2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VB23A"},

		{"label","VB22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you would have done your homework, you would have seen that’s what I always charge for the flyers and pamphelets my street team passes out!  I can tell now that the City is going to be a difficult client. You know, I am going to have to charge $%d for this.","VS_T1P1VB2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have offended you.  Let’s continue.","VB23A"},
		 -- costa:PLUS


		{"label","VB22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Are you for real, man?  I just told you what I charged, and I don’t appreciate your hardball negotiation tactics.  I can tell now that the City is going to be a difficult client. You know what? I’m increasing my fee.  I am going to have to charge $%d for this...","VS_T1P1VB2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VB23A"},


	{"label","VB23A"},
	{"fun",threequartercost},
	 {"ns1"," Okay, so I also charge $1000 for lozenges, throat spray, and other remedies for the laryngitis I develop when working in high-stress situations, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T1P1VB2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VB25B","cost"},
	 {"pgs","Not only have I seen you charge less for that – the City is in crisis here.  I don’t think it’s right for you to charge for that expense at all.","VB23B","f"},
	 {"pgs","I have seen that you normally charge $500 for that expense.  I think you are trying to charge us too much.","VB23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VB23D","deal","h"},

		{"label","VB23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Yeah, I can see what you’re saying.  I think I’ll just knock that expense right off, then.  And you know what?  I really feel I can work well with you.  So I am going to lower my offer to $%d.  What do you say?","VS_T1P1VB2_10.ogg","cost"},
		 {"pg","Thanks Gabe- that would be great.  Let’s continue.","VB24A"},


		{"label","VB23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","You know; now that you mention it, I really shouldn’t raise my rate for my throat spray given the circumstances…so let’s just say I charge you $%d.  Does that seem fair? ","VS_T1P1VB2_11.ogg","cost"},
		 {"pg","I appreciate that, Gabe. Thanks.","VB24A"},

		{"label","VB23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering to provide a service for the City - and that entails certain expenses.  I appreciate the urgency of our crisis, but I won’t stand for your hardball tactics.  This really seems like a more demanding job than I thought –so I think I am going to have to charge $%d now.","VS_T1P1VB2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VB24A"},


	{"label","VB24A"},
	 {"ns1","Right then.  So that brings us to $%d.  We really should get started here – so do we have a deal or what?","VS_T1P1VB2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VB25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VB24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge for a war room?","VB24C","j"},
	 {"pg1s","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VB24D","cost","k"},

		{"label","VB24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","That’s funny, I was actually thinking about how this disaster really could have serious repercussions on our environment. Given that this is an ecological crisis, I am willing to compromise for the sake of the future. I think we should lower my offer to $%d.  Agreed?","VS_T1P1VB2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VB25A"},


		{"label","VB24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","You know, you really ought to learn how to play ball.  I can already hear  the whispers – the City is going to be a very challenging client, and I am really going to have to adjust my plan here.  Look, I am going to have to charge you $%d.","VS_T1P1VB2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VB25A"},


		{"label","VB24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns","Listen, you’re freaking me out with all this back and forth.  We are done negotiating.  If you want to get anywhere in business – and in life – you are going to have to learn to be diplomatic.","VS_T1P1VB2_16.ogg"},
		 {"pg","I apologize, I didn’t mean to annoy you.  Let’s move on.","VB25A"},


	{"label","VB25RENEG"},
	{"fun2",incprofit,2},

	{"label","VB25A"},
	 {"ns1","I am happy we are on the same page.  So, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T1P1VB2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VB25B"},
	 {"pgs","Well, I was actually thinking about your comic books expense. Don’t you think we could find it cheaper?","VB25C","l"},


		{"label","VB25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Right then, so the next step for you is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T1P1VB2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VB25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, I’ve had about enough of this.  We were done negotiating, and there is work to be done.  Now you are just yanking my chain.  Frankly, you seem as if you are impossible to work with - so I’m charging $%d now, and that’s final!","VS_T1P1VB2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, let’s just shake on it!","VB25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VB25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VB25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Finally! Well, there is no time to waste, now.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get right to work!","VS_T1P1VB2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time","END"},

		{"label","VB25RENEGCHECK"},
		{"if","reneg","<",2,"VB25RENEG"},


--		{"label","VB25E"},   -- skipping label
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","That’s it for me, man.  This negotiation is over.  Come back when you have a contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get out of my sight.","VS_T1P1VB2_21.ogg","cost"},
		 {"pg","Okay, sorry.  I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VB2ATD1"},
 {"ns1","I’d love to stand around and chit-chat with you, but it is critical we move ahead quickly with this task.  You don’t have a contract for me?  I think you should hurry up and get one drawn up for $%d at City Hall.","VS_T1P1VB2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VB3ASD1"},
 {"ns1","Oh, it’s you.  Look, I understand time is ticking away, so hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","VS_T1P1VB3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VB31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","There you are, brah! I can’t stop talking about what’s going on – it’s really bothering me! I can’t wait to get started on this.  So, do you have that contract for me to sign?  ","VS_T1P1VB3_01.ogg"},
	 {"pg","Yes, I have it right here.","VB32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VB31B"},


		{"label","VB31B"},
		 {"ns","Oh, well…alright.  Just come back as soon as you get a contract – time is of the essence! ","VS_T1P1VB3_02.ogg"},
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
		 {"ns","Excellent, now we’re talkin! So, yes …uh-huh…wow! Look at that!  The city sure is being generous. That’s even more than I asked for!! Of course I’ll sign!","VS_T1P1VB3_03.ogg"},
		 {"pg","Thanks, I guess","VB33A"},
		 -- costa:Set to CC


		{"label","VB32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, then let me have a…wait - .no!  This isn’t isn’t the price we agreed on! What kind of jive are you trying to pull here?","VS_T1P1VB3_04.ogg"},
		 {"pg","I am sorry…","VB32D"},

			{"label","VB32D"},
			{"fun2",incprofit,10},
			 {"ns","Wait, this is less than what we agreed!  My attorney is going to have something to say about this. Excuse me. Hello, Eva?  Yeah, they…uh-huh…okay, bye. Look, my lawyer will send over a contract with the right numbers. You’re going to bring that contract back to your client – okay?","VS_T1P1VB3_06.ogg"},
			 {"pgs","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather have Will draw up a new contract.","VB32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VB32F","b"},
			
				{"label","VB32E"},
				 -- scorea:+SG
				 {"ns","I understand your position, but my attorney has advised me that you must use the contract she drew up if you want me on board.  She insists you get the Mayor to sign it because it has the service fee we agreed on.","VS_T1P1VB3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VB33A"},


				{"label","VB32F"},
				-- scoreb:-SG
				 {"ns","It’s cool that you understand that this is the only way we can move forward.  Don’t worry, I can get the word out on the street.  When people hear things in New City, they hear them through Gabe Vine!","VS_T1P1VB3_11.ogg"},
				 {"pg","Alright, I understand.","VB33A"},


		{"label","VB32C"},
		 {"ns","Well let’s check it out….uh huh….mm hmmm…there you go! This looks right on the money. Just bring this contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T1P1VB3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VB33A"},


	{"label","VB33A"},
	 {"ns","Excellent! I am happy to be part of the team.  I really look forward to doing the best job possible!","VS_T1P1VB3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around,","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VB3ATD1"},
 {"ns","I’m not one to tell you not to stand around and chew the fat, but…what are you doing here!!?   Get back to City Hall and have the Mayor sign that contract.  The future of our City is at stake!","VS_T1P1VB3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
