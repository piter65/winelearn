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

{"label","T1P4m1"},

--*************************
--HAVEN'T OFFICIALLY DECIDED ON A VENDOR
--*************************
	{"label","M1ASD1"},
	 {"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go let Will Standon know. Now if you’ll please excuse me, these are very trying times.  I have urgent matters to attend to.","VS_T1toT2PXM1_07.ogg"},
	 {"pg","I’m sorry for the interruption, Ms. Mayor.","END"},

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
	 {"pg","Pleased to meet you, Ms Mayor.  Let’s please begin.","M12"},
	 {"label","M12"},
	 {"if","clothingscore","==",0,"M12A"},
	 {"goto","M12B"},

		{"label","M12A"}, -- Bad clothes
		 -- scorea:-MA
		 {"ns","Yes, now before we start, let me remind you that now more than ever, we have an image to uphold for the citizens of New City.  In the future, when you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM1_02.ogg"},
		 {"pgs","So noted, Ms. Mayor.  Thanks for letting me know.","M13","a"},
		{"label","M12B"}, -- Good clothes

		 {"ns","Okay, so, let’s get started…wait, my…you know, you look very professional.  Thank you for dressing for the occassion. I appreciate it when people show up to City Hall looking their best.","VS_T1PXM1_03.ogg"},
		 {"pgs","I understand how that is important, Ms. Mayor.","M13","b"},
		 -- scoreb:+MA
		 
	{"label","M13"},
	 {"fun",setpickedvendor},
	 {"ns","So, who do you think should be the disaster assessment consultant to help us through the first stages of this crisis?  I have anxiously been awaiting your recommendation.","VS_T1P4M1_01.ogg"},
	 {"pg1","I think we should go with %s, Ms. Mayor.","M14A","vendorx"},

		{"label","M14A"}, -- Not Nina Ojeda
		{"if","vendor","==",1,"M15A"},
		 {"ns","I see. So, I know a little about who is available and I am curious.  Why didn’t you choose Eco-Tech?","VS_T1P4M1_02.ogg"},
		 {"pgs","Wailer doesn’t have a proven track record of accurate and unbiased assessments.","M14B","c"},
		 {"pgs","I am concerned that many in the industry find Wailer’s methods for maintaining equipment to be unusual.","M14C","d"},
		 {"pgs","Eco-Tech is known to be overbooked - and if we asked, Wailer is more than likely too busy to take on the case.","M14B","e"},

			{"label","M14B"},
			-- scorea:-MD
			{"fun",incfailed},
			 {"ns","Oh.  Really??   Are you sure you have your facts straight?  I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
			 {"pg","I believe this is true – I think I remember seeing it in the research.","M15A"},


			{"label","M14C"},
			-- scoreb:+MD
			 {"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Very good.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M15A"},


		{"label","M15A"}, -- Not Gabe Vine
		 {"if","vendor","==",2,"M16A"}, 
		 {"ns","I am mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with Ypoforo Ecosystems?","VS_T1P4M1_03.ogg"},
		 {"pgs","Ypoforo has disappointed clients recently, and I don’t want him repeating the experience with us.","M15B","f"},
		 {"pgs","I am concerned Ypoforo will not deliver the clear and concise presentation of the findings we need.","M15C","g"},
		 {"pgs","I am concerned Economou doesn’t have a lot of experience because of his lack of clients.","M15B","h"},

			{"label","M15B"},
			-- scorea:-MD
			{"fun",incfailed},
			 {"ns","Are you sure you have your facts straight?  I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
			 {"pg","There is research around town that supports this….I think.","M16A"},

			{"label","M15C"},
			-- scoreb:+MD
			 {"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research! Very good.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M16A"},


		{"label","M16A"},
		{"if","vendor","==",3,"M17A"}, -- Not Bjorn Egan
		 {"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Ramblin’ Rose?","VS_T1P4M1_04.ogg"},
		 {"pgs","I am concerned that Ramblin’ Rose is not known for her environmentalism – which could hurt the project.","M16B","i"},
		 {"pgs","Ramblin’ Rose does not have any equipment on hand for assessing ecosystem damage.","M16C","j"},
		 {"pgs","Ramblin Rose is known to only furnish slanted, one-sided reports to her assessment clients.","M16B","k"},


			{"label","M16B"},
			 -- scorea:-MD
			 {"fun",incfailed},
			 {"ns","I’m not sure you have your facts straight. I am going to trust you on this, although that does not seem likely to me.","VS_T1toT2PX_01.ogg"},
			 {"pg","I’ve read up on this, and I am pretty sure that’s true, actually…","M17A"},


			{"label","M16C"},
			-- scoreb:+MD
			 {"ns","That sounds right.  You’ve done your research – good job.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M17A"},


		{"label","M17A"}, -- Not Marvin Moneymaker
		{"if","vendor","==",4,"M18A"}, 
		 {"ns","I see.  So, before we move on, tell me why you decided against Enviro-X Consulting.","VS_T1P4M1_05.ogg"},
		 {"pgs","McBragg doesn’t care about the environment at all – which makes him an unlikely choice.","M17B","l"},
		 {"pgs","Frankly, I feel that Enviro-X lacks the capabilities, know how, and equipment to accurately assess damage to the New City river.","M17C","m"},
		 {"pgs","I am concerned that McBragg is not really energetic enough–and is not at all motivated to help us.","M17B","n"},


			{"label","M17B"},
			-- scorec:-MD
			 {"fun",incfailed},
			 {"ns","That doesn’t sound right.  I’ll trust you on this, but that doesn’t seem correct to me.","VS_T1toT2PX_01.ogg"},
			 {"pg","I appreciate that Ms. Mayor, but I’ve looked around, and I believe this is true.","M18A"},


			{"label","M17C"},
			-- scoreb:+MD
			 {"ns","That’s seems like a good reason to me!  You’ve done your research, haven’t you? Good job.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M18A"},


		{"label","M18A"}, -- Chose Nina Ojeda
		{"if","vendor","==",2,"M19A"}, 
		{"if","vendor","==",3,"M110A"}, 
		{"if","vendor","==",4,"M111A"}, 
		 {"ns","Right then, so now that I know why you chose against all those vendors, tell me -- why did you end up choosing Eco-Tech?","VS_T1P4M1_06.ogg"},
		 {"pgs","Wailer is known as an environmental advocacy which makes him the most likely choice.","M18B","o"},
		 {"pgs","Eco-Tech will deliver complete but concise reports and present findings both clearly and effectively.","M18C","p"},
		 {"pgs","Wailer is a local legend, famous for previous successes cleaning up the old waterfront –it makes sense to hire him.","M18B","q"},
		 

			{"label","M18B"},
			-- scoreb:-MD
			{"fun",incfailed},
			 {"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
			 {"pg","I believe this is the right choice to make, Your Honor.","M112A"},


			{"label","M18C"},
			-- scoreb:+MD
			 {"ns","That seems like good reason to me. It appears you have done thorough research.  Well done.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  What else do you need to know?","M112A"},



		{"label","M19A"}, --Chose Gabe Vine
		 {"ns","So now that I know why everyone else didn’t make it, tell me why Ypoforo Ecosystems struck you as the right choice for this.","VS_T1P4M1_07.ogg"},
		 {"pgs","I think Economou will be able to present his findings clearly and convincingly.","M19B","r"},
		 {"pgs","Ypoforo has equipment that will allow effective monitoring of contamination and supervision of progress.","M19C","s"},
		 {"pgs","I am not sure Jannis has been in the disaster assessment field long enough to be of any use to us for this.","M19B","t"},


			{"label","M19B"},
			-- scorea:-MD
			{"fun",incfailed},
			 {"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
			 {"pg","I’ve looked around, and I believe that is the right choice to make.","M112A"},


			{"label","M19C"},
			-- scoreb:+MD
			 {"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
			 {"pg","I am happy that you are satisfied, Ms. Mayor.","M112A"},


		{"label","M110A"}, -- Chose Bjorn Egan
		 {"ns","Right then, now that I know why you didn’t choose the other vendors, tell me why you ended up choosing Ramblin’ Rose?","VS_T1P4M1_08.ogg"},
		 {"pgs","I am impressed by Ramblin’ Rose’s cutting-edge monitoring rig.","M110B","u"},
		 {"pgs","Rose has a proven track record of providing accurate, unbiased reports for their clients.","M110C","v"},
		 {"pgs","Rose has amazing communication skills and her presentation reports are out of this world.","M110B","w"},

			{"label","M110B"},
			-- scorea:-MD
			{"fun",incfailed},
			 {"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
			 {"pg","I’ve looked around, and I believe that this is the right choice to make.","M112A"},

			{"label","M110C"},
			 -- scoreb:+MD
			 {"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
			 {"pg","Thank you, Ms. Mayor.  I am happy that you are satisfied.","M112A"},


		{"label","M111A"},  --Chose Marvin Moneymaker
		 {"ns","So before I let you go, you have to  tell me -- why in the world did you choose Enviro-X  Consulting?","VS_T1P4M1_09.ogg"},
		 {"pgs","I have confidence that the team at Enviro-X has up-to-date equipment – and the know-how to use it effectively.","M111B","x"},
		 {"pgs","I think that Skeeter has the kind of vigor and enthusiasm that we would like from our assessment consultant.","M111C","y"},
		 {"pgs","I think we can count on Skeeter to provide an accurate and unbiased report.","M111B","z"},


			{"label","M111B"},
			-- scorea:-MD
			{"fun",incfailed},
			 {"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
			 {"pg","That may be – but I stand by it, Your Honor.","M112A"},

			{"label","M111C"},
			-- scoreb:+MD
			 {"ns","That’s a good reason as any, I guess. At least you’ve done your research. Now, I really hope this works out….","VS_T1toT2PX_04.ogg"},
			 {"pg","Thank you, Ms. Mayor.  I am happy that you are satisfied.","M112A"},


	{"label","M112A"},
	{"if","failed","<=",1,"M112B"},
	 {"ns1","To be truthful, I am unsettled. I don’t think you have researched your choices thoroughly, because you don’t seem to have your facts straight. Well, we’re under pressure here – so it’s too late to find someone else now. Just go negotiate a contract price with %s.","VS_T1toT2PXM1_05.ogg","vendorx"},
	 {"pg","I am sorry to have disappointed you.  I will pay closer attention to the research for my next task.","END"},


	{"label","M112B"},
	 {"ns1","Before we finish, I must say I am impressed with your thoroughness!  You seem informed, and that tells me your choice is well-researched.  The next step is to go back and negotiate a price. After that, you will get a contract and hire %s.","VS_T1toT2PXM1_06.ogg","vendorx"},
	 {"pg","I am honored by the sentiment.  Thank you kindly, Ms. Mayor.","END"},

--*************************
--NEED TO NEGOTIATE PRICE
--*************************

	{"label","M1ATD1"},
	 {"ns","Now, you’ll have to excuse me and show yourself out. I am sure you understand that I have a lot of work to do. If you have negotiated a price with the consultant that will help us assess and monitor the extent of the disaster, see Will and let him know.","VS_T1P4M1_10.ogg"},
	 {"pg","Yes, Ms. Mayor. Take care.","END"},

--**********************
--NEED TO GET CONTRACT
--**********************

	{"label","M2ASD1"},
	 {"ns","You’re the consultant on Stan’s team right? What are you doing here?  I am very busy right now.  Don’t come back until you have a contract for me to sign.","VS_T1PXM2_09.ogg"},
	 {"pg","Yes, Ms. Mayor.  I am sorry to have disturbed you.","END"},
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
	{"goto","M21C"},

		{"label","M21B"},
		 {"ns","Welcome back!  I am happy you made it; we certainly have to get everything straightened away.  Before we begin, though, I notice you’ve dressed up. I find it very reassuring when people show up to City Hall looking their best. Thanks - I appreciate it.","VS_T1PXM2_02.ogg"},
		 {"pgs","Yes, of course Ms. Mayor. Thank you.","M22A","b"},
		 -- scorea:+MA

		{"label","M21C"},
		 {"ns","Hello again.  I am happy you made it, and we need to move forward – but before we start I must remind you that I personal appearance counts in business. If you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM2_01.ogg"},
		 {"pgs","I’m sorry, Ms. Mayor.  It won’t happen again.","M22A","a"},
		 -- scorea:-MA


	{"label","M22A"},
	 {"if","vendorcontract","==",true,"M22B"},
	 {"ns","Okay, so, let’s get started.  We really need to move ahead effectively with our tasks in order to successfully steer the City through this crisis.  You brought a contract back for me to countersign?","VS_T1PXM2_03.ogg"},
	 {"pg","Yes, here you go.","M23X"},

			{"label","M22B"}, --Vendor Contract
			 {"ns","Okay, so, let’s get started.  We really need to move ahead effectively with our tasks in order to successfully steer the City through this crisis.  You brought a contract back for me to countersign?","VS_T1PXM2_03.ogg"},
			 {"pg","I actually have a contract from the vendor here, and it is awaiting your signature.", "M22C"},

			{"label","M22C"}, --Vendor Contract
			 {"ns","What do you mean you have a contract from the vendor?? I am appalled.  You should never accept a contract from a service provider! Especially not now! We write contracts because we have terms we need included. As it stands, we may have been locked into a bad deal.  I am disappointed.","VS_T1PXM2_04.ogg"},
			 {"pgs","I am sorry, Ms. Mayor.  It won’t happen again.","M23X","c"},
			 -- scorea:-SG

		{"label","M23X"},
		{"fun",startingcostplus10perc},
		{"if","cost","<=","testcost","M23A"},
		{"fun",startingcostplus30perc},
		{"if","cost","<=","testcost","M23B"},
		{"goto","M23C"},
		 
		 {"label","M23A"},
		 {"ns3","Okay, lets have a look…okay… super! This vendor typically charges between $%d and $%d and we’re paying $%d. That shows you did a great job negotiating.  I will be sure to communicate that to your boss, Stan.","VS_T1PXM2_05.ogg","min","max","cost"},
		 {"pgs","Thanks!  That’s fantastic news, Ms. Mayor, I am happy you are pleased.","M24","d"},
		 -- scorea:+SG


		{"label","M23B"},
		 {"ns3","Okay, so let’s take a look here…yes, I see.  This vendor typically charges between $%d and $%d and we’re paying $%d. Not too bad – but make sure you get all the information you can about a vendor before you negotiate and you’ll do even better.","VS_T1PXM2_06.ogg","min","max","cost"},
		 {"pg","Thank you, Ms. Mayor.","M24"},


		{"label","M23C"},
		 {"ns3","So let’s take a look…hmm…uh-oh.  This is troubling. It says here we’re paying $%d, which is quite high. This should run between $%d and $%d.  Next time, prepare yourself with research before you negotiate with a vendor – otherwise we’ll end up overspending drastically.","VS_T1PXM2_07.ogg","cost","min","max"},
		 {"pgs","Ok, Ms. Mayor.  I will do a better job next week.","M24","e"},
		 -- scorea:-SG


	{"label","M24"},
	{"fun3",setvar,"invcontract",nil},
	{"fun3",setvar,"vendorcontract",nil},
	{"fun3",setvar,"signedcontract",true},
	{"fun",storecost},
	{"fun2",incvars,"journalprogress"},
	 {"ns","Okay, then – that’s done!  Now, take the contract to Will Standon.  He will give you further instructions.  I hope you found your first task challenging and rewarding.  I hope to see you soon – there is much work to be done on this crisis -- and not much time!","VS_T1PXM2_08.ogg"},
	 {"pg","I understand, Ms. Mayor.  I am sure we will meet again when I am assigned my next task.","END"},


--***********************
--NEED TO TALK TO WILL
--***********************

	{"label","M2ATD1"},
	 {"ns","What are you still doing here with that contract in your hands? We need to start on this immediately!  Bring that document to Will Standon’s office right away!","VS_T1PXM2_10.ogg"},
	 {"pg","Yes, Ms. Mayor","END"},

--*******************
--END
--*******************
	
	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
		}
return dialogtext
