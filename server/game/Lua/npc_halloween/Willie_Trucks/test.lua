local dialogtext = {
{"if","vendor","==",4,"ifs"},
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



{"label","T1P4vd1"},

--*********************
--CAN'T INTERVIEW YET
--*********************

	{"label","VD1ASD1"},
	 {"ns","Hey, it’s you again. Look, I’d love to chill with you, but I have to go to Rosenfield to set a fi- I mean, I have a client appointment in a few minutes.","null.wav"},
	 {"pg","I’m sorry to disturb you.","END"},
	 {"pg","Hey, you’re Skeeter McBragg I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VD11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		{"fun3",setvar,"scoreconvo","va1"},
	 {"ns","Hey, dude! Welcome to Enviro-X. The name is McBragg, but everyone calls me Skeeter. Are you here with more questions about that suspicious fire?","null.wav"},
	 {"pg","No, actually, I am here for a disaster assessment – and given your reputation as the man who cleaned up the New City waterfront, I think you could be a big help.","VD11X"},
	 {"pg","I have come investigating disaster assessment  vendors – and I understand you and your highly trained specialists will be able to deliver a reliable assessment.","VD11C"},


		{"label","VD11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2},-- costa:MINUS
		 {"ns","Well I am not normally one to toot my own horn – but you’ve certainly come to the right place!  I am happy you caught me before I skipped town- I mean, before I took off to go skating.  Anyway, tell me what’s on your mind?","null.wav"},
		 {"pg","Very well then, there has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VD12A"},


		{"label","VD11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Really?  Well then, I am happy to help.  What’s on your mind?Really?  Well then, I am happy to help.  What’s on your mind?","null.wav"},
		 {"pg","There has been an oil spill in the New City River, and the City asked my firm to find someone to assess the impact of the disaster and monitor the area for developments.","VD12A"},


	{"label","VD12A"},
	 {"ns","An oil tanker leak, huh? Whoa, that sounds aweso- I mean, that’s really shady.  If you don’t mind my asking, why ever did you come here looking for disaster assessment?","null.wav"},
	 {"pg","Well I understand you can be relied on to do what’s right for the environment and produce thorough, accurate and unbiased assessment reports.","VD12B"},
	 {"pg","Well, I did think twice about it when I found out you generally have an anti-corporate bias.","VD12C"},


		{"label","VD12B"},
		 -- scorea:-MD
		 {"fun2",incprofit,2},-- costa:PLUS
		 {"ns","Totally, dude.  Anyway, this gig sounds like a total blas- I mean, I understand that this is a serious crisis, so I am ready to drop everything and assemble my staff if you need us.","null.wav"},
		 {"pg","Okay, great!","VD13A"},


		{"label","VD12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Yes – and there is nothing wrong with that!  Make ‘em pay, that’s my motto. Anyway, you certainly ehave done your research! So, I am ready to drop everything and start work immediately if you need me.","null.wav"},
		 {"pg","Alright then, let’s continue.","VD13A"},


	{"label","VD13A"},
	{"fun", incinterv},
	 {"ns","So is that it? Can I go now?","null.wav"},
	 {"pg","Yes, although I have some research to do. In the meantime, please consider that this is a crisis – and you will help us by only charging for what is absolutely necessary for the job.","VD13B"},
	 {"pg","Wel, honestly, it would influence my decision to hire you if you were to decide to make some sort of donation to the clean up effort.","VD13C"},

		{"label","VD13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","OK, good luck with everything! If you’ll excuse me, I have to bounce and work on a pipe b- I mean, um ah a project for a client. Anyway, I hope to see you again soon.","null.wav"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VD13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","That’s totally shady, dude!  What do I look like?  Some cracked out skater who doesn’t know what’s up?  You’re asking me for an unauthorized donation! You should choose Enviro cause we rock not because I caved on your weird demands.","null.wav"},
		 {"pg","Sorry about that  I’ll smooth things over with my boss and see if we can get you on board.","END"},

--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

	{"label","VD1ATD1"},
	 {"ns","Look, I’d love to chill with you dude, but I have to run and set off an expl- I mean, do some work for a prospective client.  I’ve already told you everything you need to know – so if you’ll excuse me, I have to get some things ready...","null.wav"},
	 {"pg","Thanks for your time.  I am off to look around further, and may be back soon to talk to you more the crisis.  Goodbye!","END"},

--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VD1ASD2A"},
	 {"ns","Hey, you’re gonna need a warrant if y- Oh, it’s you! Did you come back because you want us to start work for the City?","null.wav"},
	 {"pg","No, I don’t think so.  I have more research to do, and have to talk to my boss first","VD1ASD2C"},
	 {"pg","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B"},

		{"label","VD1ASD2B"},
		-- scoreb:-SS
		 {"ns","Whoa, slow down there, dude! Maybe you should get approval from the Mayor before we negotiate a deal to do a disaster assessment.  What do you say?  Go check  in at City Hall and come back later if you choose to hire me.","null.wav"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward...","END"},


		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

	{"label","VD2ASD1"},
	 {"ns","It seems as if you have a critical task on your hands, but I have some letter bom…- I mean, sensitive correspondence I have to mail. Get approval from your client if you want to hire me - and return when you are ready to negotiate.","null.wav"},
	 {"pg","Thanks, I was actually on my way to do that...","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VD21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","(on the phone) I told you people, I don’t know anything ab—(then) oh, it’s you! Have you gotten approval from the Mayor to hire me?","null.wav"},
	 {"pg","Well,  I am hopeful that your enthusiasm will serve us well through this catastrophe.","VD21C"},
	 {"pg","No, I am just passing through.  See you around","VD21B"},
	 {"pg","You bet!  I am excited about the reputation your staff has for their high level of training and ability.","VD21D"},
	 {"pg","We decided on you for your firm’s track record of being able to produce clear and compelling reports.","VD21D"},

		{"label","VD21B"},
		 {"ns","Okay, then!  I hope to see you back here as soon as you are ready to negotiate – if they don’t detain me for more questioning, that is.","null.wav"},
		 {"pg","Sure thing! Bye!","END"},

		{"label","VD21C"},
		-- scorea:+MD
		{"fun2",decprofit,2},-- costa:MINUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Wow, you know me already! It seems like you’re rocking the serious research and have come well-prepared. So what does the City want me to do?","null.wav"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VD22A"},


		{"label","VD21D"},
		 -- scorec:-MD
		{"fun",incprofit,2}, -- costc:PLUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Right.  I mean, whatever you just said.  Well, anyway, there is no time to waste.  Please tell me the details of the task the City has outlined.","null.wav"},
		 {"pg","We are looking for a firm that can assess the ecological impact of the oil spill and monitor any ongoing developments related to the disaster.","VD22A"},


	{"label","VD22A"},
	{"fun",halfcost}, --to make deal for half the cost
	 {"ns1","Right then, so $%d is what we need to get this done. This includes $1000 for the construction of an assessment command area on the riverside nearby the disaster that includes some card tables and a half-pipe; $1000 measuring tape, rulers, flasks, beakers, and swimming pool water testing kits; $2000 for explosives, fuses, blasting caps and a case of spray paint.","null.wav","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
	 {"pg","I thought you normally charge $1500 for the explosives, fuses, blasting caps and spray paint you need for assessments!","VD22B"},
	 {"pg","Wait - $1000 for your “monitoring equipment” is a little excessive, don’t you think?","VD22C"},
	 {"pg1","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal"},


		{"label","VD22B"},
		 -- scoreb:_+MD
		 -- costb:MINUS
		 {"fun2",subexpense,500},
		 {"fun2",decprofit,3},
		 {"ns1","Well, eh, I normally do charge less for that - but we were thinking of upgrading to brand name plastic explosives from the store-bought household cleaners we normally use but never mind. Let’s just say my price is now $%d.","null.wav","cost"},
		 {"pg","That works.  Let’s continue.","VD23A"},


		{"label","VD22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not happening. If you had done your research, you would have seen that I always use the same assessment equipment for all my jobs – and the cost to my clients is always the same! I can tell the City is going to be a difficult client, you know.  I should charge $%d for this, really.","null.wav","cost"},
		 {"pg","Well, I am sorry to have offended you.","VD23A"},
		 -- costa:PLUS


		{"label","VD22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Look, I just told you about specific costs, and I don’t appreciate that kind of negotiation tactic.  I can tell that working for the City is going to be tough.  You know what? I think am going to have to charge $%d for this...","null.wav","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VD23A"},


	{"label","VD23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so lastly I will need $1000 to retrofit a few skateboards with 130HP motors at New City Skate and Board so I can use them as mobility devices for my assessment team, which brings us to $%d. So that’s my offer.  Do we have a deal?","null.wav","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
	 {"pg","Not only have I seen that you charge less for that – the City is in crisis  and it’s not right for you to charge for motorized skateboards at all.","VD23B"},
	 {"pg","I have seen you charge $500 for the same work done to skateboards you have used in the past!  What re you trying to pull here?","VD23C"},
	 {"pg1","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal"},


		{"label","VD23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1000},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","But those motors are turbocharged, dude! Oh, alright.  I guess I have a few old ones lying around that we can use. So, let’s just say I pay for it myself and charge you $%d.  Does that seem fair?","null.wav","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VD24A"},


		{"label","VD23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,2},
		 {"ns","Oh, come on!  These motors are turbocharged! Well, fine then, never mind - let’s just say I charge you $500 for the motorized skateboards, okay?","null.wav"},
		 {"pg","I appreciate that, Skeeter. Thanks.","VD24A"},


		{"label","VD23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","I am offering a  service to the City - and that entails certain expenses.  I appreciate the urgency of our crisis, but I’m not down for you trying to snake me in a negotiation.  This really seems like a more demanding  job than I thought –so I think I should actually be charging $%d.","null.wav","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VD24A"},


	{"label","VD24A"},
	 {"ns1","Right then.  So that brings us to $%d. Now do we have a deal yet?  We really should get started here – and now that I think of it I have to check on something I am cooking up in the basement.","null.wav","cost"},
	 {"pg","vWe have ourselves a deal!","VD25B"},
	 {"pg","Now that we’ve covered all your expenses – considering that this is a crisis, do you think you could forgo some profit?","VD24B"},
	 {"pg","I have to ask – are you sure you have to bring explosives along on this gig?","VD24C"},
	 {"pg1","You know, given that this is a crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost"},


		{"label","VD24B"},
		 -- scoreb:-EW
		 {"fun2",decprofit,12},-- costb:MINUS
		 {"ns1","You know, this crisis really could have a totally negative impact on the local business– and that means there will be less work to go around. So, I am willing to compromise for the sake of the local economy. I think we should lower my offer to $%d.  Agreed?","null.wav","cost"},
		 {"pg","I am happy you see it that way.  Thanks, Skeeter.","VD25A"},


		{"label","VD24C"},
		 -- scorec:-MD
		  {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","I think the fumes in here are starting to tweak you out, dude! Come to think of it, I should invest in some gas masks too. Anyway, I can see you are going to be a very demanding client… so I am going to have to adjust my plan and charge you $%d.","null.wav","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


		{"label","VD24D"},
		 -- scored:-EW
		 {"fun",incprofit,6},-- costd:PLUS
		 {"ns","I’ve had about enough of this.  We are finished negotiating.  If you want to get anywhere in business – and in life – you are going to have to learn to show a little love, dude.","null.wav"},
		 {"pg","I apologize, I didn’t mean to anger you.  Let’s move on.","VD25A"},

	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

	{"label","VD25A"},
	 {"ns1","I am happy this is finally starting to make sense, because I think it’s time for me to check on this concoction I am working on in the basement.  So, $%d is my price, and that’s my final offer.","null.wav","cost"},
	 {"pg","Yes.  It’s a deal.","VD25B"},
	 {"pg","Well, I was actually thinking about that half-pipe you are going to build. Is that really necessary?","VD25C"},


		{"label","VD25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Excellent, dude! But I have to run! So go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you afterwards when you come back with the paperwork!","null.wav","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VD25C"},
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Listen, you’re really starting to burn me up. What’s with the endless haggling? Frankly, you seem as if you are impossible to work with - so  $%d is what I’m charging now, and that’s final!","null.wav","cost"},
		 {"pg","Before you increase your price anymore, please, let’s just shake on it!","VD25D"},
		 {"pg","I don’t know - I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK"},
		 -- scoreb:-EW
		 -- costb:PLUS


			{"label","VD25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
			 {"ns1","Finally! Well, there is no time to waste, now.  Go get Will Standon at City Hall to get a contract drawn up for $%d, and bring it right back here so we can get to work!","null.wav","cost"},
			 {"pg","Great!! I am going to go to City Hall to get papers drawn up. Thanks for your time.","END"},

			{"label","VD25RENEGCHECK"},
			{"if","reneg","<",2,"VD25RENEG"},
			
			{"label","VD25E"},
				{"fun",incstandon},
				{"fun",incevelyn},
				{"fun2",incvars,"journalprogress"},
			 {"ns1","Dude, you are tweaking me out so much I feel like I’m going to explode!  And speaking of which, I have to go check on something in the basement…you know what? I don’t want to see you again until you have a contract for $%d. Please go before you upset me any more.","null.wav","cost"},
			 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

	{"label","VD2ATD1"},
	 {"ns1","What are you still doing here? I think you should hurry up and get a contract drawn up for $%d at City Hall.  This disaster is a ticking time bomb…so you should probably hurry!","null.wav","cost"},
	 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},
	 
--***************
--NO CONTRACT YET
--***************

	{"label","VD3ASD1"},
	 {"ns1","Dude, you really should get going – for every passing minute, the assessment is going to be harder and harder. You should hurry back with a contract from City Hall as soon as you can.  Remember, my price is $%d.  I’ll see you back here soon!","null.wav","cost"},
	 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","I told you I’m not answering any more questions until my law- oh, it’s you!  Are you back with a contract for me to sign?","null.wav"},
	 {"pg","Yes, I have it right here.","VD32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


		{"label","VD31B"},
		 {"ns","Oh, well then.  Just come back as soon as you get a contract. I am going to wait here for you – so don’t take too long, okay?  I have some timed expl- I mean, there are a few outstanding matters I have to check on in a few hours.","null.wav"},
		 {"pg","Sounds good.  See you soon!","END"},


		{"label","VD32X"},
			{"fun",incmayor},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incvendor4},
			{"fun",talkedtovendor4},
			{"fun2",incvars,"journalprogress"},
			{"if","contractcost",">","cost","VD32A"},--PRICE TOO HIGH
			{"if","contractcost","<","cost","VD32B"},--BEING TOO LOW
			{"goto","VA32C"},--CORRECT PRICE

		{"label","VD32A"},
		{"fun",takemarkup},
		 {"ns","Alright, then! So let’s have a look here….okay, I don’t know that word.  No idea what that means…Well, look at that! The City sure is giving us more than we asked for!!  They sure are generous.  Here you go!","null.wav"},
		 {"pg","Thanks, I guess.","VD33A"},
		 -- costa:Set to CC


		{"label","VD32B"},
		{"fun",getvendorcontract},
		 {"ns","Alright, then! So let’s have a look here….okay, I don’t know that word.  No idea what that means…hey, wait a second here!  Dude, this is totally sketched out!","null.wav"},
		 {"pg","I am sorry, there must be some mistake…","VD32D"},

			{"label","VD32D"},
			 {"ns","The amount here on your contract is less than what we agreed on.  I know he’s busy enough with my personal issues, but my attorney is going to have something to say about this. Excuse me. Hello, Justin?  Yeah, they…uh-huh…okay, bye. Okay, so my lawyer is sending us a contract with the right figures.","null.wav"},
			 {"pg","I am sorry for the oversight  -- but I prefer not to take a contract from your attorney.  If it’s possible, I’d rather Will draw up a new contract.","VD32E"},
			 {"pg","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F"},

				{"label","VD32E"},
				 -- scorea:+SG
				 -- costa:PLUS
				 {"ns","I catch your flow dude, but my attorney has advised me that you have to use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.","null.wav"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


				{"label","VD32F"},
				 -- scoreb:-SG
				 -- costb:PLUS
				 {"ns","I ’m totally down with your understanding that this is the only way we can move forward.  This is gonna rock - things are really gonna start to really blow up around here!","null.wav"},
				 {"pg","I am happy you are excited, I guess.","VD33A"},

		{"label","VD32C"},
		 {"ns","Alright, then! So let’s have a look here….okay, I don’t know that word.  No idea what that means…This looks perfect, I think – but what do I know? Here just bring this back to the Mayor to countersign, and it will be official!","null.wav"},
		 {"pg","Excellent!  I am looking forward to working with you.","VD33A"},



	{"label","VD33A"},
	 {"ns","Well, it’s official then!  My team and I are going to get right on the case and respond to this crisis – right after I finish my little concoction in the basement.  Wait a second.  Do you smell something funny?","null.wav"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around.","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

	{"label","VD3ATD1"},
	 {"ns","You must be the neighbor that called about that smel—oh, it’s you!  Shouldn’t you be at City Hall right now getting the Mayor to sign that contract? I think you should probably get out of here and do that.","null.wav"},
	 {"pg","Yes, thanks - I was just about to do that...","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
