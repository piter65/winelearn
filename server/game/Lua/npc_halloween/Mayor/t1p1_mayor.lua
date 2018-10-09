local dialogtext = {
	{"if","mayorprogress","==",0,"M1ASD1"},
	{"if","mayorprogress","==",1,"M11A"},
	{"if","mayorprogress","==",2,"M1ATD1"},
	{"if","mayorprogress","==",3,"M2ASD1"},
	{"if","mayorprogress","==",4,"M21A"},
	{"if","mayorprogress","==",5,"M2ATD1"},

--*************************
--HAVEN'T OFFICIALLY DECIDED ON A VENDOR
--*************************

{"label","M1ASD1"},
	{"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go let Will Standon know. Now if you’ll please excuse me, these are very trying times.  I have urgent matters to attend to...","VS_T1toT2PXM1_07.ogg"},
	{"pg","I’m sorry for the interruption, Your Honor.","END"},

--***********************
--EXPLAIN VENDOR CHOICE
--***********************

	{"label","M11A"},
		{"fun",incstandon},
		{"fun",incevelyn},
		{"fun",incmayor},
		{"fun",talkedtomayor},
		{"fun2",incvars,"journalprogress"},
		{"fun3",setvar,"scoreconvo","m1"},
		{"ns","Hello!  My name is Mayor Judy Gonzales. You work for Stan Freeman, correct? Thank you for meeting with me.  I am really grateful that your team is here to help us through this crisis. As you can imagine, I am very busy – so let’s get right to work, shall we?","VS_T1PXM1_01.ogg"},
		{"pg","Pleased to meet you, Your Honor.  Let’s please begin.","M12"},
		{"label","M12"},
		 {"if","clothingscore","==",0,"M12A"},
		 {"goto","M12B"},
	
			{"label","M12A"}, -- Bad clothes
				-- scorea:-MA
				{"ns","Yes, now before we start, let me remind you that now more than ever, we have an image to uphold for the citizens of New City.  In the future, when you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM1_02.ogg"},
				{"pgs","I understand, Your Honor.  Thanks for letting me know.","M13","a"},
			{"label","M12B"}, -- Good clothes
			
				{"ns","Okay, so, let’s get started... wait, my... you know, you look very professional.  Thank you for dressing for the occasion. I appreciate it when people show up to City Hall looking their best.  It\'s always best to put your best foot forward.","VS_T1PXM1_03.ogg"},
				{"pgs","Thank you Your Honor, I understand the importance of professionalism.","M13","b"},
				 -- scoreb:+MA

	{"label","M13"},
		{"fun",setpickedvendor},
		{"ns","So, who do you think we should hire to be the media relations firm to help us through the first stages of this crisis?  I have anxiously been awaiting your recommendation.","VS_T1P1M1_01.ogg"},
		{"pg1","I think we should go with %s, Ms. Mayor.","M14A","vendorx"},
		
	{"label","M14A"}, -- Not Nina Ojeda
		{"if","vendor","==",1,"M15A"},
		{"ns","I see. So, I know a little about who is available and I am curious, why didn’t you choose Narravi Associates?","VS_T1P1M1_02.ogg"},
		{"pgs","I don’t think Ojeda has enough experience getting complicated messages across to the general public.","M14B","c"},
		{"pgs","Well I understand that Ms. Ojeda has been known to refuse governments and government agencies as clients.","M14C","d"},
		{"pgs","I discovered that Ms. Ojeda probably wouldn’t be interested in the job.","M14B","e"},

			{"label","M14B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Oh, really??   Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I believe this is true – I remember seeing it during my research.","M15A"},


			{"label","M14C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me!  It sounds as though you’ve done your research!  Well done!","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","M15A"},


	{"label","M15A"}, -- Not Gabe Vine
		{"if","vendor","==",2,"M16A"},
		{"ns","I am the Mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with New Media Communications?","VS_T1P1M1_03.ogg"},
		{"pgs","It seems that they are involved with wrongdoing at Idion Energy Associates.  It’s all over the news.","M15B","f"},
		{"pgs"," Well I am concerned NMC will not be able to position our messages to the public in a positive way.","M15C","g"},
		{"pgs","I am concerned NMC can’t communicate messages to the general public clearly and concisely.","M15B","h"},

			{"label","M15B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","There is research around town I’ve read that supports that, I think.","M16A"},

			{"label","M15C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","M16A"},


	{"label","M16A"},
		{"if","vendor","==",3,"M17A"}, -- Not Bjorn Egan
		{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Norse Communications?","VS_T1P1M1_04.ogg"},
		{"pgs","Norse only handles small scale projects– so I don’t think they are a good bet.","M16B","i"},
		{"pgs","Because it concentrates on multinational clients, Norse doesn’t have the local press contacts we are looking for.","M16C","j"},
		{"pgs","Norse has proven they are unreliable when it comes to clearly communicating technical information.","M16B","k"},


			{"label","M16B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","I’m not sure you have your facts straight.  I am going to trust you, although that does not seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I’ve read up on this, and I am confident that this is correct. ","M17A"},


			{"label","M16C"},
				-- scoreb:+MD
				{"ns","That sounds right.  You’ve done your research – good job.","VS_T1toT3PX_03.ogg"},
				{"pg"," Thank you, Your Honor.  Is there anything else you’d like to know?","M17A"},


	{"label","M17A"}, -- Not Marvin Moneymaker
		{"if","vendor","==",4,"M18A"}, 
		{"ns","I see.  So, before we move on, tell me why you decided against Media Relations, Inc..","VS_T1P1M1_05.ogg"},
		{"pgs","Marvin Moneymaker is a terrible businessman, and I don’t think we should hire anyone who is unsuccessful.","M17B","l"},
		{"pgs","I don’t think Media Relations has the ability to interpret data and communicate clearly to the general public.","M17C","m"},
		{"pgs","Marvin Moneymaker doesn’t have enough experience in media relations, or a track record of success.","M17B","n"},


			{"label","M17B"},
				-- scorec:-MD
				{"fun",incfailed},
				{"ns","That doesn’t sound right.  I’ll trust you, but I’m not sure about your decision.","VS_T1toT2PX_01.ogg"},
				{"pg","I appreciate that Your Honor, but I’ve looked around, and I believe this is true.","M18A"},


			{"label","M17C"},
				-- scoreb:+MD
				{"ns","That’s seems like a good enough reason to me!  You’ve done your research – good job. ","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","M18A"},


	{"label","M18A"}, -- Chose Nina Ojeda
		{"if","vendor","==",2,"M19A"}, 
		{"if","vendor","==",3,"M110A"}, 
		{"if","vendor","==",4,"M111A"},
		{"ns","Right then, so now that I know why you didn’t pick the other vendors, tell me why you chose Narravi Associates?","VS_T1P1M1_06.ogg"},
		{"pgs","Ojeda is overly laid back and very disorganized – and so I was concerned she wouldn’t be a good fit for us.","M18B","o"},
		{"pgs","I think Ojeda has proven her ability to make sure our message gets out both here in town and across the state.","M18C","p"},
		{"pgs"," I’ve read about how Narravi Associates is just one branch of a large multinational enterprise which is good because they are located here in New City.","M18B","q"},


			{"label","M18B"},
				-- scoreb:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I have looked into this and I believe I have made the right choice.","M112A"}, 


			{"label","M18C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you have done thorough research.  Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Your Honor.  What else do you need to know?","M112A"},
				


	{"label","M19A"}, --Chose Gabe Vine
		{"ns","So now that I know why the other vendors didn’t make it, please tell me why New Media Communications struck you as the right choice.","VS_T1P1M1_07.ogg"},
		{"pgs","New Media Communications can maintain a positive tone in their messaging, whatever their clients’ crises are.","M19B","r"},
		{"pgs","I think NMC has proven they can communicate technical information to the public in a clear and concise way.","M19C","s"},
		{"pgs","Mr. Vine is new to the media relations business and is eager to do help us during this crisis.","M19B","t"},


		{"label","M19B"},
			-- scorea:-MD
			{"fun",incfailed},
			{"ns","Really?  Are you sure you looked into this?  That sounds....unlikely.","VS_T1toT2PX_03.ogg"},
			{"pg","I have looked into this and I believe I have made the right choice.","M112A"},  


		{"label","M19C"},
			-- scoreb:+MD
			{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
			{"pg","I am happy that you are satisfied, Your Honor.","M112A"}, 
			

	{"label","M110A"}, -- Chose Bjorn Egan
		{"ns","Right then, so now that I know why you didn’t choose the other vendors, please tell me why you ended up choosing Norse Communications?","VS_T1P1M1_08.ogg"},
		{"pgs","I’ve read that Norse Communications has handled many difficult situations with both care and sensitivity.","M110B","u"},
		{"pgs","Norse Communications has proven talent when it comes to communicating difficult technical data in a clear and concise way.","M110C","v"},
		{"pgs","Norse Communications is an affiliate of one of the strongest media relations powerhouses in the world.","M110B","w"},

			{"label","M110B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I have looked into this and I believe I have made the right choice.","M112A"},  

			{"label","M110C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
				{"pg"," Thank you, Your Honor.  I am happy you are satisfied.","M112A"},  


	{"label","M111A"},  --Chose Marvin Moneymaker
		{"ns","So before I let you go, please tell me -- why in the world did you choose Media Relations, Inc.?","VS_T1P1M1_09.ogg"},
		{"pgs","I have confidence in Media Relations because Moneymaker truly understands the finer points of etiquette and is an articulate public speaker.","M111B","x"},
		{"pgs","Moneymaker has been very successful, and has been behind some sensational client work in the past.","M111C","y"},
		{"pgs","Media Relations has had great results handling sensitive press situations in the past.","M111B","z"},


			{"label","M111B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","That may be – but I stand by it, Your Honor.","M112A"},  

			{"label","M111C"},
				-- scoreb:+MD
				{"ns","That’s a good reason as any, I guess. At least you’ve done your research. Now, I really hope this works out... ","VS_T1toT2PX_04.ogg"},
				{"pg","Thank you, Your Honor I am happy you are satisfied.","M112A"},  


	{"label","M112A"},
		{"if","failed","<=",1,"M112B"},
		{"ns1","To be truthful, I am concerned. I don’t think you have researched your choices thoroughly, because you don’t seem to have your facts straight. We’re under pressure here – so it’s too late to find someone else now. Just go negotiate a contract price with %s.","VS_T1toT2PXM1_05.ogg","vendorx"},
		{"pg","I am sorry to have disappointed you.  I will pay closer attention to the research on my next task.","END"},


	{"label","M112B"},
		{"ns1","Before we finish, I must say I am impressed with your thoroughness!  You seem informed, and that tells me your choice is well-researched.  The next step now is to go back to %s and negotiate a contract price. ","VS_T1toT2PXM1_06.ogg","vendorx"},
		{"pg","I am honored.  Thank you kindly, Your Honor.","END"},

--*************************
--NEED TO NEGOTIATE PRICE
--*************************

{"label","M1ATD1"},
	{"ns","Now, you’ll have to excuse me and show yourself out. I am sure you understand that I have a lot of work to do. If you have negotiated a price with the media relations firm to help us through these early stages of the crisis, go to Will’s office and let him know. ","VS_T1P1M1_10.ogg"},
	{"pg","Yes, Your Honor. Take care.","END"},

--**********************
--NEED TO GET CONTRACT
--**********************

	{"label","M2ASD1"},
		{"ns","You’re the consultant on Stan’s team right? What are you doing here?  I am very busy right now.  Don’t come back until you have a contract for me to sign.","VS_T1PXM2_09.ogg"},
		{"pg","Yes, Your Honor.  I am sorry to have disturbed you.","END"},
		 -- scorea:-SS
		 
--*************************
--COUNTERSIGN CONTRACT
--*************************

	{"label","M21A"},
	{"fun",incmayor},
	{"fun",incstandon},
	{"fun",incevelyn},
	{"fun3",setvar,"scoreconvo","m2"},
	{"if","clothingscore",">",0,"M21B"},
		{"ns","Hello again.  I am happy you made it, and we need to move forward – but before we start I must remind you that in business appearance counts. If you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM2_01.ogg"},
		{"pgs","I’m sorry, Your Honor.  It won’t happen again.","M22A","a"},
		 -- scorea:-MA


	{"label","M21B"},
		{"ns","Welcome back!  I am happy you made it; we certainly have to get everything straightened away.  Before we begin, though, I notice you’ve dressed up. I find it very reassuring when people show up to City Hall looking their best. Thanks - I appreciate it. ","VS_T1PXM2_02.ogg"},
		{"pgs","Yes, of course Your Honor. Thank you.","M22A","b"},
		 -- scorea:+MA


	{"label","M22A"},
		{"ns","Okay, so, let’s get started.  We really need to move ahead effectively in order to successfully steer New City through this crisis.  Have you returned with a contract for me to countersign?","VS_T1PXM2_03.ogg"},
		{"if","vendorcontract","==",true,"M22B"},
		{"pg","Yes, here you go.","M23X"},


			{"label","M22B"}, --Vendor Contract
				{"p","Yes. I have a contract I got from the vendor right here, ready for your signature."},
				{"ns","You have a contract from the vendor?? You should never accept a contract from a service provider! We use City contracts because we have terms we need included. As it stands, we may have been backed into a bad deal.  I am disappointed.","VS_T1PXM2_04.ogg"},
				{"pgs","I am sorry, Your Honor.  It won’t happen again.","M23X","c"}, 
				 -- scorea:-SG

			{"label","M23X"},
			{"fun",startingcostplus10perc},
			{"if","cost","<=","testcost","M23A"},
			{"fun",startingcostplus30perc},
			{"if","cost","<=","testcost","M23B"},
			{"goto","M23C"},

			{"label","M23A"},
				{"ns3","Okay, lets have a look... okay... super! This vendor typically charges between $%d and $%d and we’re paying $%d. That shows you did a great job negotiating.  I will be sure to communicate that to your boss, Stan.","VS_T1PXM2_05.ogg","min","max","cost"},
				{"pgs","Thanks!  That’s fantastic news, Your Honor, I am happy you are pleased.","M24","d"},
				 -- scorea:+SG


			{"label","M23B"},
				{"ns3","Okay, so let’s take a look here... yes, I see.  This vendor typically charges between $%d and $%d and we’re paying $%d. Not too bad – but make sure you get all the information you can about a vendor before you negotiate and you’ll do even better.","VS_T1PXM2_06.ogg","min","max","cost"},
				{"pg","Thank you, Your Honor.","M24"},


			{"label","M23C"},
				{"ns3","So lets take a look... hmm... uh-oh.  This is troubling. It says here we’re paying $%d, which is quite high. This should run between $%d and $%d.  Next time, prepare yourself with research before you negotiate with a vendor – otherwise we’ll end up overspending.","VS_T1PXM2_07.ogg","cost","min","max"},
				{"pgs","Ok, Your Honor.  I will do a better job next time.","M24","e"},
				 -- scorea:-SG


	{"label","M24"},
	{"fun3",setvar,"invcontract",nil},
	{"fun3",setvar,"vendorcontract",nil},
	{"fun3",setvar,"signedcontract",true},
	{"fun",storecost},
	{"fun2",incvars,"journalprogress"},
		{"ns","Okay, then – that’s done!  Now, take the contract downstairs to Will Standon.  He will give you further instructions.  Hopefully, you found your first task challenging and rewarding.  I hope to see you soon – there is much work to be done during this crisis -- and not much time!","VS_T1PXM2_08.ogg"},
		{"pg","I understand, Your Honor.  I am sure we will meet again when I am assigned my next task.","END"},


--***********************
--NEED TO TALK TO WILL
--***********************

{"label","M2ATD1"},
	{"ns","What are you still doing here with that contract? We need to start on this immediately! You need to bring that document downstairs to Will Standon right away!","VS_T1PXM2_10.ogg"},
	{"pg","Yes, Your Honor.","END"},

--*******************
--END
--*******************

{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
