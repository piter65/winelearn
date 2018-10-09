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

{"label","T2P1VD1"},


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

{"label","VD1ASD1"},
 {"ns","Oh, hello!  My, it’s so nice to meet a young fan.  I am sorry, though, but I can’t give out any autographs just now…I just had a manicure.","VS_T2P1VD1_10.ogg"},
 {"pg","Oh, then pardon the interruption. I didn’t mean to disturb you.","END"},
 {"pg","Hey, you’re Fiona Rudd! I’ve heard of you!","END"},

--****************
--INTERVIEW
--****************

	{"label","VD11A"},
		{"fun",incvendorsvisited},
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		{"fun3",setvar,"scoreconvo","vd1"},
	 {"ns","Well hello, sugar! Would you like an autographed picture?  I have quite a few right here somewhere. ","VS_T2P1VD1_01.ogg"},
	 {"pgs","Actually, Ms. Rudd, the City is looking for a spokesperson – and I thought you could be perfect considering you’re regarded as a Dixieland legend.","VD11B","a"},
	 {"pgs","Actually, Ms. Rudd, the City is looking for a spokesperson – and we need someone like you who has a trustworthy image and the previous success with the local media.","VD11C","b"},

		{"label","VD11B"},
		 -- scorea:+MD
		 {"fun2", decprofit,2}, -- costa:MINUS
		 {"ns","Oh, my!  You sure do know to flatter a gal.  So tell me what brings you here. ","VS_T2P1VD1_02.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts..","VD12A"},

		{"label","VD11C"},
		 -- scoreb:-MD
		 {"fun2", incprofit,2},-- costb:PLUS
		 {"ns","Well, I just love company Sugar but I’m a bit confused.  Why don’t you tell me why you are here. ","VS_T2P1VD1_03.ogg"},
		 {"pg","Well, it’s about the oil spill in the New City River. The City asked my firm to find a spokesperson to publicly represent the City’s relief and recovery efforts..","VD12A"},


	{"label","VD12A"},
	 {"ns","Well, oh, my!  I certainly would be perfect for this, wouldn’t I?  Just so I can hear it for myself, tell me what made you think of me when you were told to look for a spokesperson?","VS_T2P1VD1_04.ogg"},
	 {"pgs","I hear that you have a deep understanding of many of the complex issues underlying the charity causes that you advocate","VD12B","c"},
	 {"pgs","Yes, Fiona, I think that having a well liked person who is always  cheery and friendly as the face for our cause could really help the City.","VD12C","d"},

		{"label","VD12B"},
		 -- scorea:-MD
		 {"fun2", incprofit,2},-- costa:PLUS
		 {"ns","Well, Sugar, you certainly do flatter me and I’m not really sure I follow you but I feel strongly about the environment, and I’ll be here if you feel I can help.","VS_T2P1VD1_05.ogg"},
		 {"pg","Okay, great!","VD13A"},


		{"label","VD12C"},
		 -- scoreb:+MD
		 {"fun2",decprofit,2},-- costb:MINUS
		 {"ns","Well I am impressed!  You certainly are a good fan, aren’t you. Now, we have a crisis on our hands – so if you need me, I am happy to postpone my facelift and focus on the City’s needs.","VS_T2P1VD1_06.ogg"},
		 {"pg","Alright then, let’s continue","VD13A"},


	{"label","VD13A"},
	{"fun", incinterv},
	 {"ns","Right then, if you’ll excuse me, there are some CD’s I have to print up and mail out.  Is there anything else you need?","VS_T2P1VD1_07.ogg"},
	 {"pgs","I will have to think about that. In the meantime, please consider that you would really be helping us by charging us only for what is necessary for the job.","VD13B","e"},
	 {"pgs","Before I go - it would influence my decision to hire you if you were to decide to make a personal donation to the clean up effort.","VD13C","f"},

		{"label","VD13B"},
		 -- scorea:+EB
		 {"fun2",decprofit,2},-- costa:MINUS
		 {"ns","You know, I am deeply troubled by our current environmental issues.  I’ll certainly consider that as I figure out what I will need to take on this responsibility. Well then, I hope to see you again, hon!","VS_T2P1VD1_08.ogg"},
		 {"pg","The pleasure was mine.  I’ll see you around!","END"},


		{"label","VD13C"},
		 -- scoreb:-EB
		 {"fun2",incprofit,2},-- costb:PLUS
		 {"ns","Come again, sugar?  Did you say ‘donation’?  Whatever do you mean by that? I do not take kindly to strangers that interrupt my hair appointment demanding funny-money!  The City should hire me because I am the best – not because I give out kickbacks!","VS_T2P1VD1_09.ogg"},
		 {"pg","No offense intended.  I may come back soon once I’ve checked in with my Boss.","END"},


--****************************
--HAVEN'T LEFT AFTER INTERVIEW
--****************************

{"label","VD1ATD1"},
 {"ns","Thanks for stopping by, Sugar! If you decide you want me as a spokesperson, just come back and we’ll talk about the details!","VS_T2P1VD1_13.ogg"},
 {"pg","Thanks for your time.  I am going to look around a little more – but I may be back soon to talk to you again.","END"},


--*******************
--CAN'T NEGOTIATE YET
--*******************

	{"label","VD1ASD2A"},
	 {"ns","Welcome back, hon!  So are you here to get me to start working as a spokesperson for the City’s relief and recovery efforts?","VS_T2P1VD1_11.ogg"},
	 {"pg","No I don’t think so.  I have to meet with my client first.","VD1ASD2C"},
	 {"pgs","You bet!  I’d love to get you on board.  What will it take?","VD1ASD2B","g"},
	 
		{"label","VD1ASD2B"},
		-- scoreb:-SS
		 {"ns","Are you sure about that, Sugar? You don’t seem ready to negotiate.  I think you should probably get the official go-ahead from your client before I start providing the City with public representation - just to be sure.","VS_T2P1VD1_12.ogg"},
		 {"pg","Yes, you’re right.  I’ll come back when I have am ready to move forward…","END"},

		{"label","VD1ASD2C"},
		-- scorea:+SS
		{"goto","END"},

--***********************************
--HAVEN'T TALKED TO MAYOR
--***********************************

{"label","VD2ASD1"},
 {"ns","I don’t see you in the appointment book, Sugar. You have a critical task on your hands!  Get approval from Mayor Gonzalez to hire me – and then come back here so we can work on the details of the arrangement.","VS_T2P1VD2_22.ogg"},
 {"pg","Thanks, I was actually on my way to do that…","END"},

--*****************
--NEGOTIATIONS
--*****************

	{"label","VD21A"},
	{"fun",clearreneg},
	{"fun3",setvar,"scoreconvo","v2"},
	 {"ns","Hello again, sugar!  You’re back! You must be here to talk about hiring me to be your spokesperson. I am sure that’s best, because people are fussing about the disaster like bulls at the rodeo - and we need to act right away!  So did the Mayor approve your decision to hire me?","VS_T2P1VD2_01.ogg"},
	 {"pgs","Yes, Ms. Rudd, although I need to be reassured that you have a solid reputation with the local media in New City to portray the image we will need for the relief and recovery campaign.","VD21C","a"},
	 {"pg","No, I am just passing through.  See you around.","VD21B"},
	 {"pgs","Yes, Ms. Rudd, we are confident you are good for the job, especially because of the history the local press has had getting behind your previous advocacy work. ","VD21D","b"},
	 {"pgs","You bet!  I am excited to see what momentum you can build for the city considering you have a hit record out right now.","VD21D","b"},


		{"label","VD21B"},
		 {"ns","Well okay then, sugar! I’ll probably get a facial in the mean time – so just come back here when you are ready to negotiate.  ","VS_T2P1VD2_02.ogg"},
		 {"pg","Sure thing! Bye!","END"},


		{"label","VD21C"},
		 -- scorea:+MD
		{"fun2",decprofit,2}, -- costa:MINUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","With that kind of memory, you should be a musicologist!  It’s clear that the City needs help, so go on and tell me what you are looking for me to do.","VS_T2P1VD2_03.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts through the duration of the crisis.","VD22A"},


		{"label","VD21D"},
		 -- scored:-MD
		{"fun2",incprofit,2}, -- costd:PLUS
		{"fun",incvendor4},
		{"fun",talkedtovendor4},
		 {"ns","Now, sugar, I am not entirely sure I follow you. But you don’t need to explain yourself, hon - just tell me what you are looking for me to do.","VS_T2P1VD2_04.ogg"},
		 {"pg","We are looking for a spokesperson that will make public appearances, conduct interviews, and otherwise represent the City’s relief and recovery efforts through the duration of the crisis.","VD22A"},


	{"label","VD22A"},
	 {"fun",halfcost},
	 {"ns1","So let’s talk: I normally charge $%d for a job like this, which includes $2000 for speaker and entertainer fees that I charge when I do advocacy work. Then, I need $4000 for lodging, meals, and other accommodations costs for the duration my stay in town.  Also, there’s $3500 for autographed posters, CDs, and other promotional items to give away to my fans at public appearances.","VS_T2P1VD2_05.ogg","cost"},
	 {"pg","Sure thing!  I’ll get a contract drawn up!","VD25B"},
	 {"pgs","I thought you normally charge less for autographed posters!","VD22B","c"},
	 {"pgs","Wait - $2000 for various speaker and entertainer fees?  Don’t you normally charge less for that?","VD22C","d"},
	 {"pg1s","Let’s just make it $%d, and call it a deal.  What do you say?","VD22D","deal","e"},

		{"label","VD22B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Well, hon, I normally do charge less for autographed posters, CDs, and other promotional materials, but I was also going to burn DVDs of some recent concerts to honor this cause. Never mind - let’s just say I charge the old rate; so my total price is $%d.","VS_T2P1VD2_06.ogg","cost"},
		 {"pg","That works.  Let’s continue.","VD23A"},

		{"label","VD22C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Well, that’s just not right. If you had checked, you would have seen that I always charge the same amount for my speaker and entertainment fees!  I’m starting to feel like the City is going to be a difficult client. You know, I really should be charging $%d for this.","VS_T2P1VD2_07.ogg","cost"},
		 {"pg","Well, I am sorry to have  offended you.","VD23A"},
		 -- costa:PLUS


		{"label","VD22D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","You can’t just come in here and act like some sort of cowboy, you know. I just told you what I charge, and I do not appreciate your negotiating style!  I heard the City can be a difficult client - now I know why! You know what? I think I have to charge $%d for this job.","VS_T2P1VD2_08.ogg","cost"},
		 {"pg","Sorry, I didn’t mean to offend you.","VD23A"},


	{"label","VD23A"},
	{"fun",threequartercost},
	 {"ns1","Okay, so the remainder of my expense is the $1500 I need for alimony payments to my ex-husbands, which brings us to $%d. So that’s my offer.  Do we have a deal?","VS_T2P1VD2_09.ogg","cost"},
	 {"pg1","$%d? It’s a deal!  Let’s talk about paperwork.","VD25B","cost"},
	 {"pgs","Wait - not only do you usually charge promoters less for your alimony payments – but it isn’t right to charge a client for that!","VD23B","f"},
	 {"pgs","I have seen that you normally charge less for alimony payments.  I think you are trying to charge us too much.","VD23C","g"},
	 {"pg1s","I’ll tell you what, I’d like to hire you - but I’m afraid I am NOT going to pay that expense . How about we just agree to have you come on board for $%d.  What do you say?","VD23D","deal","h"},

		{"label","VD23B"},
		 -- scoreb:+MD
		 {"fun2",subexpense,1500},-- costb:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Now that you mention it, Sugar, I think you have a point.  Under the desperate circumstances, maybe I should rethink how much alimony is costing me  – and pay for it myself. You know what? I really feel I can work well with you. Let’s just say I reduce my profit margin and charge you $%d, total. Is that fair?","VS_T2P1VD2_10.ogg","cost"},
		 {"pg","Thanks, that would be great.  Let’s continue.","VD24A"},


		{"label","VD23C"},
		 -- scorec:+MD
		 {"fun2",subexpense,500},-- costc:MINUS
		 {"fun2",decprofit,5},
		 {"ns1","Oh, you noticed.  Well, I normally do charge $1000 for alimony, but I am going through the finalization of my most recent divorce, and those alimony bills are really starting to pile up. Never mind – because this is an emergency, I will charge you the standard rate – so my price is set at $%d. What do you say?","VS_T2P1VD2_11.ogg","cost"},
		 {"pg","I appreciate that, Fiona. Thanks.","VD24A"},

		{"label","VD23D"},
		 -- scored:-EW
		 {"fun2",incprofit,4},-- costd:PLUS
		 {"ns1","Now Sugar, you definitely need to work on your manners! I am offering to represent you in public, and that means certain expenses must be paid! This is a crisis, but I can’t be bullied into a bad deal. You are more demanding than I thought, so I need $%d for this job.","VS_T2P1VD2_12.ogg","cost"},
		 {"pg","I see.  Well, I am sorry to have offended you.","VD24A"},


	{"label","VD24A"},
	 {"ns1","Right then, hon, so we will need $%d to get started. What do you say, Sugar? Do we have a deal?","VS_T2P1VD2_13.ogg","cost"},
	 {"pg","We have ourselves a deal!","VD25B"},
	 {"pgs","Now we’ve covered all your expenses – considering this is a crisis, do you think you could forgo some profit?","VD24B","i"},
	 {"pgs","Before we go ahead with this, I just wanted to ask – are you sure you have to charge for all of your accommodations??","VD24C","j"},
	 {"pg1s","You know, given that this is an crisis, I think you are taking advantage of the City by charging $%d.","VD24D","cost","k"},

		{"label","VD24B"},
		 -- scoreb:+EW
		 {"fun2",decprofit,10},-- costb:MINUS
		 {"ns1","My bandmates and I were actually chatting on the Internet about this disaster and the future of our river. You know, because this is an ecological crisis, I am willing to compromise! I think we should lower my offer to $%d.  Agreed?","VS_T2P1VD2_14.ogg","cost"},
		 {"pg","I am happy you see it that way.  Thanks.","VD25A"},


		{"label","VD24C"},
		 -- scorec:-MD
		 {"fun2",incprofit,2},-- costc:PLUS
		 {"ns1","Now, Sugar! You know, you ought to treat folks right – otherwise they’ll think you’re some sort of bully.  I can already tell the City is going to be a very challenging client, and I am really going to have to adjust my plan here and charge you $%d.","VS_T2P1VD2_15.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


		{"label","VD24D"},
		 -- scored:-EW
		 {"fun2",incprofit,6},-- costd:PLUS
		 {"ns1","Sugar, please!  We just went over my expenses, and we agreed on everything!  As much as I want to help the environment, if this is what I am going to have to put up with, I am going to have to charge you $%d.  And, I am done negotiating!","VS_T2P1VD2_16.ogg","cost"},
		 {"pg","My apologies – I must have gotten my facts mixed up.","VD25A"},


	{"label","VD25RENEG"},
	{"fun2",incprofit,2},

	{"label","VD25A"},
	 {"ns1","I am happy you are singing my song, then, Sugar. So, my price is $%d, and that’s my final offer.  How does that strike you?","VS_T2P1VD2_17.ogg","cost"},
	 {"pg","Alright then.  It’s a deal.","VD25B"},
	 {"pgs","Okay, but I still don’t see why you’re charging us all that for your alimony payments?","VD25C","l"},


		{"label","VD25B"
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},


		 {"ns1","So it’s a deal!  I am looking forward to helping the City!  Your next step is to go to City Hall and tell Will Standon to have a contract drawn up for $%d.  I’ll see you when you come back with the paperwork!","VS_T2P1VD2_18.ogg","cost"},
		 {"pg","I’m on my way, then, to get the papers drawn up at City Hall.  I’ll talk to you soon.","END"},


		{"label","VD25C"},
		 -- scoreb:-EW
		 {"fun2",incprofit,3},-- costb:PLUS
		 {"fun",increneg},
		 {"ns1","Hon, this is getting tiring. We are simply done negotiating. There is a crisis that demands attention- and frankly, your haggling makes you seem, well, impossible to work with.  I’m charging $%d now, and that’s only because I feel strongly about doing this job!","VS_T2P1VD2_19.ogg","cost"},
		 {"pg","Before you increase your price anymore, please, I accept your offer.","VD25D"},
		 {"pgs","I don’t know - I still think you’re profiting too much from a community crisis.","VD25RENEGCHECK","l"},
		 -- scoreb:-EW
		 -- costb:PLUS


		{"label","VD25D"},
-- Peter says force it
			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



		 {"ns1","Finally! Now let’s not waste any time, Sugar.  You should get a contract drawn up for $%d so we can get started.  Bring it right back here as soon as you can so that I can sign it and we can get to work!","VS_T2P1VD2_20.ogg","cost"},
		 {"pg","Great!! I am going to go to Will Standon at City Hall to get papers drawn up. Thanks for your time!","END"},

		{"label","VD25RENEGCHECK"},
		{"if","reneg","<",2,"VD25RENEG"},

-- Peter was here		{"label","VD25E"},

			{"fun3",setvar,"standonprogress",8},
			{"fun3",setvar,"evelynprogress",8},
			{"fun3",setvar,"journalprogress",8},



		 {"ns1","Look, hon, you’re getting to be worse than my last husband!  This negotiation is over.  Come back when you have contract for….you know what?  I don’t want to see you again until you have a contract for me for $%d. Now, get going before I change my mind!","VS_T2P1VD2_21.ogg","cost"},
		 {"pg","Well I guess we have a deal then! I’ll go to City Hall now and get the papers drawn up.","END"},

--***************
--HAVEN'T LEFT AFTER NEGOTIATIONS
--***************

{"label","VD2ATD1"},
 {"ns1","Hey, Sugar!  It’s nice to see you again.  I am ready to serve the City, so just come on back when you get a contract drawn up for $%d at City Hall.  Then we can get to work!","VS_T2P1VD2_23.ogg","cost"},
 {"pg","Hey, thanks for the reminder.  I’ll see you back here soon.","END"},

--***************
--NO CONTRACT YET
--***************

{"label","VD3ASD1"},
 {"ns","What on earth are you doing here, Sugar?  We have a City to save – so hurry back with a contract from City Hall as soon as you can!  I’ll see you back here soon!","VS_T2P1VD3_09.ogg"},
 {"pg","I’ll be back shortly with the contract. Thank you for the reminder.","END"},

--******************
--CONTRACT SIGNING
--******************

	{"label","VD31A"},
	{"fun3",setvar,"scoreconvo","v3"},
	 {"ns","Well hello, Sugar!  I am so happy to see you again - I can’t wait to get started as the City’s spokesperson! Did you come with that contract for me to sign? ","VS_T2P1VD3_01.ogg"},
	 {"pg","Yes, I have it right here.","VD32X"},
	 {"pg","Oh, no, not yet.  I still have to go to Will Standon at City Hall to have it drawn up.","VD31B"},


		{"label","VD31B"},
		 {"ns","Alright then, Sugar.  Just come back as soon as you get a contract! ","VS_T2P1VD3_02.ogg"},
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
		 {"ns","Okay, Hon, let’s take a look, shall we?  Okay….mm-hmm….oh, my! Isn’t that sweet?  The city sure is being generous. That’s even more than I asked for!! I am happy to sign this. Here you go, Sugar!","VS_T2P1VD3_03.ogg"},
		 {"pg","Thanks, I guess…","VD33A"},
		 -- costa:Set to CC


		{"label","VD32B"},
		{"fun",getvendorcontract},
		 {"ns","Okay, let me have a…wait - no!  This isn’t what we discussed!  I was beginning to like you.  Are you tryin to break my heart with your cheatin’ ways? My attorney, the Honorable Colonel Parker Medford Parker, will have something to say about this!","VS_T2P1VD3_04.ogg"},
		 {"pg","I am sorry…","VD32D"},

			{"label","VD32D"},
			 {"fun2",incprofit,10},
			 {"ns","I am sorry, but I am going to have to call the Colonel about this.  Hello, Colonel?  Yes, Sugar they…uh-huh…okay. Look, my the Colonel will send over a contract with the right numbers. You must bring this new contract back to your client to countersign to get started.","VS_T2P1VD3_06.ogg"},
			 {"pgs","I am sorry for the oversight, but I prefer not to take a contract from your attorney.  I’d really rather City Hall draw up a new contract…","VD32E","a"},
			 {"pgs","That seems fair to me.  Given my oversight, that sounds like the right thing to do...","VD32F","b"},
			
				{"label","VD32E"},
				 -- scorea:+SG
				 {"ns","I so so understand your predicament, Sugar, but my attorney the Colonel has advised me that you must use the contract he drew up if you want me on board.  He insists you get the Mayor to sign it because it has the service fee we agreed on.  ","VS_T2P1VD3_10.ogg"},
				 {"pg","Well, if that’s the way it has to be, I understand.","VD33A"},


				{"label","VD32F"},
				-- scoreb:-SG
				 {"ns","I’m am so relieved that you understand that this is the only way we can move forward, Sugar.  Here you go!","VS_T2P1VD3_11.ogg"},
				 {"pg","Alright. I understand, I guess.","VD33A"},


		{"label","VD32C"},
		 {"ns","Well let’s take a look, shall we?  Okay….uh huh….mm hmmm…well now, this looks perfect. Here you go, Sugar!","VS_T2P1VD3_05.ogg"},
		 {"pg","Excellent!  I am looking forward to working with you.","VD33A"},


	{"label","VD33A"},
	 {"ns","OK then, Sugar! I am happy to be a part of the team!  Now just get that contract back to City Hall for the Mayor to countersign, and it will be official!","VS_T2P1VD3_07.ogg"},
	 {"pg","I also look forward to working with you.  Now if you’ll excuse me – I’m sure I’ll be seeing you around!","END"},

--**************************
--HAVEN'T LEFT AFTER SIGNING
--**************************

{"label","VD3ATD1"},
 {"ns","I know you aren’t thinking about getting your hair done, now, are you??  You have an unsigned contract worth a lot of money! Get back to City Hall and get the Mayor to countersign it.  The future of our City is at stake!","VS_T2P1VD3_08.ogg"},
 {"pg","Yes, thanks - I was just about to do that…","END"},

--******************
--END
--******************
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
