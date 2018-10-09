local dialogtext = {
{"if","vendor","==",3,"ifs"},
{"if","vendor","~=",0,"VBBONUS"},
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

{"label","T2P3VC1"},


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
 {"ns","Hello there!  Come on in!  Have a look around.  If you have a question about any of our disposal services, please don’t hesitate to ask.","VS_T2P3VC1_10.ogg"},
 {"pg","Oh, sorry for the intrusion.  I must be in the wrong place. ","END"},
 {"pg","Hey, you’re Freida West! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VC11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		{"fun3",setvar,"scoreconvo","vc1"},
	 {"ns","Well hello there, come on in!  Welcome to West Disposal Services.  I’m Freida West.  How can I help you?","VS_T2P3VC1_01.ogg"},
	 {"pgs","I am looking for a waste recovery and disposal provider and I have heard that you have an impressive array of recovery equipment.","VC11B","a"},
	 {"pgs","Yes, Freida. I am looking for a waste recovery and disposal provider and I am quite impressed by your recent local successes.","VC11C","b"},

		{"label","VC11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Well, then, a cash-paying customer, I see!  Step right up!  We have a range of services here at West Disposal that you may be interested in.  So what brings you here exactly?","VS_T2P3VC1_02.ogg"},
		 {"pg","It’s about the oil spill in the City’s River.  The City asked my team to find a firm to participate in the recovery by providing waste recovery and disposal services.","VC12A"},

		{"label","VC11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","I am not sure what exactly it is you’re getting at, but it doesn’t really matter.  Just go on and tell me what brings you down here. ","VS_T2P3VC1_03.ogg"},
		 {"pg","It’s about the oil spill in the City’s River.  The City asked my team to find a firm to participate in the recovery by providing waste recovery and disposal services.","VC12A"},


	{"label","VC12A"},
	 {"ns","I am glad you showed up, because we have all sorts of offerings that the City will find useful.  So why did you think of me for your waste recovery and disposal firm?","VS_T2P3VC1_04.ogg"},
	 {"pgs","Well I understand you have an immaculate safety record in the recovery and disposal of hazardous waste and your equipment is top notch.","VC12B","c"},
	 {"pgs","Well, I understand you have a long list of clients which include some of the largest contracts in Elliot County.","VC12C","d"},

		{"label","VC12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, like I tell my people here at West Disposal, the customer is always right!  So, not to change the subject, but I feel strongly about our environment and we are available if you feel we can help you.","VS_T2P3VC1_05.ogg"},
		 {"pg","Okay, great!","VC13A"},


		{"label","VC12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Right you are!  You certainly seem to know your stuff!  Anyway, I think I could dispose of a mess like that, so if you need me, I am happy to put my new telemarketing campaign on hold and focus on the City’s needs.","VS_T2P3VC1_06.ogg"},
		 {"pg","I am happy to hear you are available, Freida.","VC13A"},


	{"label","VC13A"},
	{"fun", incinterv},
	 {"ns","Okay, so is there anything else you need?  I have to run to the back and check in on our telephone representatives.","VS_T2P3VC1_07.ogg"},
	 {"pgs","I think that’s about it, but in the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VC13B","e"},
	 {"pgs","Okay, but before I go, it would influence my decision to hire you if you were to make a personal donation to the clean up effort.","VC13C","f"},

		{"label","VC13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I was just talking to the interns over lunch, about how this disaster may affect their future.  Because I care about this City, I’ll certainly consider that as I figure out what I will need for this job.  Well then, I hope to see you again!","VS_T2P3VC1_08.ogg"},
		 {"pg","The pleasure was mine, Freida.  I’ll see you around!","END"},


		{"label","VC13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","What was that?  A ‘donation’?  Not from this guy!.  I don’t appreciate it when someone struts into my office demanding kickbacks!  The City should hire me because I am the best vendor available, not because I give bribes!","VS_T2P3VC1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VC1ATD1"},
 {"ns","Thanks for stopping by, then!  If you decide you want our firm to provide waste recovery and disposal, just come back and we’ll talk about the details!","VS_T2P3VC1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more, but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VC1ASD2A"},
	 {"ns","Welcome back!  I’m happy to see you!  So are you here to get me started on the recovery and disposal of the oil spill?","VS_T2P3VC1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VC1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VC1ASD2B","g"},
	 
		{"label","VC1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that? You don’t seem prepared.  I think you should probably get the official go-ahead from your client before we start with the recovery... just to be sure.","VS_T2P3VC1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VC1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VC2ASD1"},
 {"ns","What are you doing here?  You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me and then come back here so we can work on the details of the arrangement.","VS_T2P3VC2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VC21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Looks like you made it back!  You must be here to seal the deal on providing recovery and disposal of the oil spill in the New City River.  That is good, because the rumors about the spread of the spill are leaking like a rusty barrel and we need to act right away!  So did the Mayor approve your decision to hire us?","VS_T2P3VC2_01.ogg"},
	 {"pgs","Yes, we are confident that your truck drivers, garbage collectors, and foremen can adequately staff the recovery and disposal effort.","VC21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VC21B"},
	 {"pgs","Yes – we are particularly excited about your impressive array of environmentally friendly oil-separation devices that you deploy in your recovery efforts.","VC21D","b"},
	 {"pgs","You bet!  We look forward to what you can do for the city given your experience responding to various other crises around the County.","VC21D","b"},


		{"label","VC21B"},
		 {"ns","Okay, then.  I’ll just see you back here when you are ready to negotiate.","VS_T2P3VC2_02.ogg"},
		 {"pg","Sure thing!  Bye!","END"},


		{"label","VC21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","I am impressed.  With that kind of attention to detail, you should join me looking for diamond rings in the landfill, there’s good money in it!  It’s clear the City needs help, so tell me what you are looking for us to do.","VS_T2P3VC2_03.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VC22A"},


		{"label","VC21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor3},
		{"fun",talkedtovendor3},
		 {"ns","Oh, I see.  Well to be honest, I am not sure I follow you.  Anyway, we have no time to waste  so go on and tell me what you are looking for us to do.","VS_T2P3VC2_04.ogg"},
		 {"pg","We are looking for a firm that will recover and dispose of the contaminants now spreading along the New City River as a result of the disaster.","VC22A"},


	{"label","VC22A"},
	 {"fun",halfcost},
	 {"ns1","Well in that case, our total charge for a job like this would be $%d.  This includes $2000 for payments to truck drivers, garbage collectors and construction foremen to supervise the disposal effort.  We also need $4250 to procure oil drums, containers, palettes, and booms to store recovered waste, and $3250 for rental of the HK-9000 oil separator device to recover the spill.","VS_T2P3VC2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VC25B"},
	 {"pgs","Wait, doesn’t an HK-9000 oil separator cost less?","VC22B","c"},
	 {"pgs","I thought that you normally charge clients less for the oil drums, containers, palettes, and booms that you use to store recovered waste","VC22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VC22D","deal","e"},

		{"label","VC22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, eh, I normally do charge less for the HK-9000, but this time, I was going to get the extended service plan with on-site service.  Well, never mind.  Let’s say I charge you the old rate; so my total price is $%d.","VS_T2P3VC2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VC23A"},

		{"label","VC22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s off the mark.  If you had checked, you would have seen that I always charge the same amount for recovery and disposal equipment!  I can tell now that the City is going to be a difficult client.  You know, I really should be charging $%d for this.","VS_T2P3VC2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VC23A"},
		 -- costa:PLUS


		{"label","VC22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Wait, I just told you what I charge, and I’m not liking your negotiating style!  You can’t come in acting like some sort of dumpster-diver.  I heard that the City can be a difficult client, now I see why!  You know what?  I think I have to charge $%d for this job.","VS_T2P3VC2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VC23A"},


	{"label","VC23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expense is the $1500 for production of ads for local late night cable television and sports-talk radio advertising our services to the general public, so that brings us to $%d.  So what do you say?  Do we have a deal?","VS_T2P3VC2_09.ogg","cost"},
	 {"pg1","$%d?  It’s a deal!  Let’s talk about paperwork.","VC25B","cost"},
	 {"pgs","Not only do you usually charge less for your radio and cable TV advertising, but why do we need it?  You have a campaign in place already and you shouldn’t charge clients for that!","VC23B","f"},
	 {"pgs","I have seen that you normally charge less for your television and radio ads.  I think you are trying to charge us too much for those.","VC23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you, but I’m afraid I am NOT going to pay that expense .  How about we just agree to have you come on board for $%d.  What do you say?","VC23D","deal","h"},

		{"label","VC23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","I guess you have a point there.  Under these desperate circumstances, maybe I should hold off on producing more radio and TV spots and pay for them myself.  You know what?  I you’re ok.  Let’s just say I reduce my profit margin and charge you $%d, total.  Is that fair?","VS_T2P3VC2_10.ogg","cost"},
		 {"pg","Thanks, Freida, that would be great.  Let’s continue.","VC24A"},


		{"label","VC23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Hmmm, you noticed.  Well, I normally do charge $1000 for producing ads for local cable television and for sports-talk radio, but I was thinking of getting some spots on shows that were more highly-rated. Never mind, because this is an emergency, I will charge you the standard rate, so my price is set at $%d. What do you say?","VS_T2P3VC2_11.ogg","cost"},
		 {"pg","I appreciate that, Freida. Thanks.","VC24A"},

		{"label","VC23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Now I am starting to think you are full of garbage!  I am offering recovery and disposal services, and that means I must meet certain expenses.  We are in a crisis, but I can’t be pushed into a stinky deal!  You know, you’re more demanding than I first thought, so I should be charging $%d to do this.","VS_T2P3VC2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VC24A"},


	{"label","VC24A"},
	 {"ns1","Okay, so to put a lid on this, I will need $%d to get started.  Do we have a deal?","VS_T2P3VC2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VC25B"},
	 {"pgs","Now that we’ve covered all your expenses, do you think you could forgo some profit considering that this is a crisis?","VC24B","i"},
	 {"pgs","Before I say yes, I have to ask – do you think we could find your army of truck drivers for a lower cost?","VC24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VC24D","cost","k"},

		{"label","VC24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","You know, I was just talking to a prospective client, and we were discussing how damaging this disaster may turn out to be.  Because this is an ecological crisis, I am willing to compromise!  I think I can lower my offer to $%d.  Agreed?","VS_T2P3VC2_14.ogg","cost"},
		 {"pg","I am happy you see it that way, Freida.  Thanks.","VC25A"},


		{"label","VC24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now that isn’t fair.  You would do well to mind your manners, otherwise people will think you’re trying to hard-sell them!  Seems like the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P3VC2_15.ogg","cost"},
		 {"pg","My apologies, I must have gotten my facts mixed up.","VC25A"},


		{"label","VC24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Now you’re starting to act really pushy.  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P3VC2_16.ogg","cost"},
		 {"pg","My apologies, I must have gotten my facts mixed up.","VC25A"},


	{"label","VC25RENEG"},
	{"fun2",incprofit,2},

	{"label","VC25A"},
	 {"ns1","So it seems like we are in the barrel together.  My price is $%d, and that’s my final offer.  What do you think about that?","VS_T2P3VC2_17.ogg","cost"},
	 {"pg","I think we have a deal, Freida.","VC25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that money for an oil separator…","VC25C","l"},


		{"label","VC25B"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Then it’s a deal!  I am ready to get to work!  So, your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P3VC2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VC25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","This is getting ridiculous.  You’re wasting my time.  There is a crisis that demands our attention, and your negotiating style is getting on my nerves.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P3VC2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VC25D"},
		 {"pgs","I don’t know, I still think you’re profiting too much from a community crisis.","VC25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VC25D"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Well it’s about time!  Now, go and get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P3VC2_20.ogg","cost"},
		 {"pg","Great!  I am going to go to Will Standon at City Hall to get papers drawn up.  Thanks for your time!","END"},

		{"label","VC25RENEGCHECK"},
		{"if","reneg","<",2,"VC25RENEG"},
		{"label","VC25E"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun2",incvars,"journalprogress"},
		 {"ns1","Ya know?  I have more important things to do than stand around haggling with you.  This negotiation is over.  Come back when you have contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d.  Now, get going before I change my mind!","VS_T2P3VC2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then!  I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VC2ATD1"},
 {"ns1","I am ready to get going on this, but we need to get moving.  Hurry up and get a contract drawn up for $%d at City Hall so we can get to work!","VS_T2P3VC2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VC3ASD1"},
 {"ns1","What are you doing back here?  You can’t change your mind about the sale, you know, so hurry back with a contract from City Hall as soon as you can!  Remember, my price is $%d.  I’ll see you back here soon!","VS_T2P3VC3_09.ogg","cost"},
 {"pg","I’ll be back shortly with the contract.  Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VC31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Excellent!  It’s nice to see you back.  I am so anxious to get to work for the City I haven’t made a single sale since you’ve left!  Did you come with that contract for me to sign? ","VS_T2P3VC3_01.ogg"},
	 {"pg","Yes, I have it right here.","VC32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VC31B"},


		{"label","VC31B"},
		 {"ns","Oh, well alright, then.  Just come back here as soon as you have a contract for us.","VS_T2P3VC3_02.ogg"},
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
		 {"ns","Okay, let’s take a look.  Okay….mm-hmm….well look at that!  That’s more than I asked for!  I am very happy to sign this contract.  The city won’t regret their generosity!  Here you go.","VS_T2P3VC3_03.ogg"},
		 {"pg","Thanks, I guess","VC33A"},
		 -- costa:Set to CC


		{"label","VC32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed!  What kind of bait and switch is this? ","VS_T2P3VC3_04.ogg"},
		 {"pg","I am sorry…","VC32D"},

			{"label","VC32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am going to have to call my attorney about this.  Hello, Seymour?  Yeah, they…uh-huh…okay.  Look, my lawyer will send over a contract with the right numbers.  You must bring this new contract to your client for her to countersign in order to get started.","VS_T2P3VC3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VC32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VC32F","b"},
			
				{"label","VC32E"},
				 -- scorea:+SG
				 {"ns","I can understand why you feel that way but my attorney has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  ","VS_T2P3VC3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VC33A"},


				{"label","VC32F"},
				-- scoreb:-SG
				 {"ns","I’m glad you understand this is the only way we can move ahead.  Here you go!","VS_T2P3VC3_11.ogg"},
				 {"pg","Alright  I understand, I guess.","VC33A"},


		{"label","VC32C"},
		 {"ns","Well take a look.  Okay….uh huh….mm hmmm…well now, this looks perfect.  Here you go!","VS_T2P3VC3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VC33A"},


	{"label","VC33A"},
	 {"ns","It’s a pleasure doing business with you!  I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P3VC3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me, I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VC3ATD1"},
 {"ns","What are you still doing here with that contract?  Get back to City Hall and get the Mayor to countersign it so we can get started.  The future of our City is at stake!","VS_T2P3VC3_08.ogg"},
 {"pg","Yes, thanks, I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
