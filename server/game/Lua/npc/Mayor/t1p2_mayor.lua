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
		{"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go let Will Standon know. Now if you’ll please excuse me, these are very trying times.  I have urgent matters to attend to…","VS_T1toT2PXM1_07.ogg"},
		{"pg","I’m sorry for the interruption, Ms. Mayor.","END"},

--***********************
--EXPLAIN VENDOR CHOICE
--***********************

	{"label","M1"},
		{"label","M11A"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun",incmayor},
			{"fun",talkedtomayor},
			{"fun2",incvars,"journalprogress"},
			{"fun3",setvar,"scoreconvo","m1"},
			{"ns","Hello!  My name is Mayor Judy Gonzales. You work for Stan Freeman, correct? Thank you for meeting with me.  I am really grateful that your team is here to help us through this crisis. As you can imagine, I am very busy – so let’s get right to work, shall we?","VS_T1PXM1_01.ogg"},
			{"pg","Pleased to meet you, Ms Mayor.  Let’s begin.","M12"},
			{"label","M12"},
			 {"if","clothingscore","==",0,"M12A"},
			 {"goto","M12B"},
			
				{"label","M12A"}, -- Bad clothes
					 -- scorea:-MA
					{"ns","Yes, now before we start, let me remind you that now more than ever, we have an image to uphold for the citizens of New City.  In the future, when you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM1_02.ogg"},
					{"pgs","Thank you for letting me know.","M13","a"},
				{"label","M12B"}, -- Good clothes

					{"ns","Okay, so, let’s get started…wait, my…you know, you look very professional.  Thank you for dressing for the occasion. I appreciate it when people show up to City Hall looking their best.","VS_T1PXM1_03.ogg"},
					{"pgs","I understand how important that is, Ms. Mayor.","M13","b"},
					-- scoreb:+MA
					
		{"label","M13"},
			{"fun",setpickedvendor},
			{"ns","So, who do you think should be the emergency response services provider to help us through the first stages of this crisis?  I am have been anxiously  awaiting your recommendation.","VS_T1P2M1_01.ogg"},
			{"pg1","I think we should go with %s, Ms. Mayor.","M14A","vendorx"},

		{"label","M14A"}, -- Not Nina Ojeda
		{"if","vendor","==",1,"M15A"},
			{"ns","I see. So, I know a little about who is available and I am curious.  Why didn’t you choose New City Emergency Medics?","VS_T1P2M1_02.ogg"},
			{"pgs","Fermin has trouble responding to crises in a timely manner, and so I’d rather not recommend him.","M14B","c"},
			{"pgs","I understand that Gil Fermin is extremely disorganized, and that concerns me.","M14C","d"},
			{"pgs","Fermin is simply too busy to handle this job – so I think we should go with someone else.","M14B","e"},
				
				{"label","M14B"},
					-- scorea:-MD
					{"fun",incfailed},
					{"ns","Oh.  Really??   Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
					{"pg","I believe this is true – I think I remember seeing it in the research.","M15A"},
				

				{"label","M14C"},
					-- scoreb:+MD
					{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Very good.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M15A"},


		{"label","M15A"}, -- Not Gabe Vine
			{"if","vendor","==",2,"M16A"},
			{"ns","I am mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with First Responders?","VS_T1P2M1_03.ogg"},
			{"pgs","First Responders doesn’t have the experience for this job, being a second-hand medical equipment wholesaler.","M15B","f"},
			{"pgs","Well I am concerned First Responders will not be able handle crowd control without security staff.","M15C","g"},
			{"pgs","I am concerned their elderly staff won’t be able to keep onlookers safe at the disaster site.","M15B","h"},
		
				{"label","M15B"},
					-- scorea:-MD
					{"fun",incfailed},
					{"ns","Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
					{"pg","I’ve read research around town that supports that….I think.","M16A"},
				
				{"label","M15C"},
					-- scoreb:+MD
					{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Very good.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M16A"},
		

		{"label","M16A"},
		{"if","vendor","==",3,"M17A"}, -- Not Bjorn Egan
			{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Medic, Inc?","VS_T1P2M1_04.ogg"},
			{"pgs","I am concerned about Barrier’s integrity, given his dishonorable discharge from the military.","M16B","i"},
			{"pgs","I think that Medic, Inc.’s crowd control methods are objectionable.","M16C","j"},
			{"pgs","Medic, Inc. doesn’t have up to date training or medical equipment.","M16B","k"},
		

				{"label","M16B"},
					-- scorea:-MD
					{"fun",incfailed},
					{"ns","I’m not sure you have your facts straight…but I am going to trust you, although it does not seem likely to me.","VS_T1toT2PX_01.ogg"},
					{"pg","I’ve read up on this, and I am pretty sure that’s true, actually…","M17A"},
				

				{"label","M16C"},
				-- scoreb:+MD
					{"ns","That sounds right.  You’ve done your research – good job.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M17A"},
		

		{"label","M17A"}, -- Not Marvin Moneymaker
		{"if","vendor","==",4,"M18A"},
			{"ns","I see.  So, before we move on, tell me why you decided against Mullen Medical Supply.","VS_T1P2M1_05.ogg"},
			{"pgs","Mullen is a terrible doctor, and I don’t think we should hire anyone that doesn’t have access to medical equipment.","M17B","l"},
			{"pgs","I don’t think Mullen Medical supply has the capacity to respond to our emergency in a timely fashion.","M17C","m"},
			{"pgs","I don’t think Dr. Mullen isn’t well liked in New City for his previous professional work.","M17B","n"},


				{"label","M17B"},
				-- scorec:-MD
					{"fun",incfailed},
					{"ns","That doesn’t sound right.  I’ll trust you, but that doesn’t seem right to me.","VS_T1toT2PX_01.ogg"},
					{"pg","I appreciate that Ms. Mayor, but I’ve looked around, and I believe this is true.","M18A"},
				

				{"label","M17C"},
					-- scoreb:+MD
					{"ns","That’s seems like a good reason to me!  You’ve done your research – good job.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M18A"},
		

		{"label","M18A"}, -- Chose Nina Ojeda
		{"if","vendor","==",2,"M19A"}, 
		{"if","vendor","==",3,"M110A"}, 
		{"if","vendor","==",4,"M111A"}, 
			{"ns","Right then, so now that I know why you didn’t go with everyone else, tell me why you ended up choosing New City Emergency Medics Association?","VS_T1P2M1_06.ogg"},
			{"pgs","Fermin is detail-oriented and is able to handle the administrative responsibility that comes with the job.","M18B","o"},
			{"pgs","NCEM provides adequate, crowd control and will keep both workers and onlookers safe at the disaster site.","M18C","p"},
			{"pgs","I understand that Fermin hires his personnel from the world-renowned trauma unit at Rosenfield Medical Center.","M18B","q"},


				{"label","M18B"},
				-- scoreb:-MD
					 {"fun",incfailed},
					{"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
					{"pg","I believe this is the right choice for us.","M112A"},
					

				{"label","M18C"},
					-- scoreb:+MD
					{"ns","That seems like a good reason to me. It appears you have done thorough research.  Well done.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  What else do you need to know?","M112A"}, 



		{"label","M19A"}, --Chose Gabe Vine
			{"ns","So now that I know why everyone else didn’t make it, tell me why First Responders struck you as the right choice.","VS_T1P2M1_07.ogg"},
			{"pgs","I think First Responders has the manpower to sufficiently handle crowd control.","M19B","r"},
			{"pgs","I think First Responders has proven they have access to the up-to-date equipment we will need at the site.","M19C","s"},
			{"pgs","Nurse John Gray runs a very successful business providing security services to non-profit clients.","M19B","t"},


				{"label","M19B"},
					 -- scorea:-MD
					 {"fun",incfailed},
					{"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
					{"pg","I’ve looked around, and I believe that this is the right choice to make.","M112A"},
					

				{"label","M19C"},
					-- scoreb:+MD
					{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
					{"pg","I am happy you are satisfied, Ms. Mayor.","M112A"},  


		{"label","M110A"}, -- Chose Bjorn Egan
			{"ns","Right then, so now that I know why you didn’t choose the other vendors, tellme why you ended up choosing Medic! Inc.?","VS_T1P2M1_08.ogg"},
			{"pgs","Barrier is an expert at crowd control methods – which puts me at ease.","M110B","u"},
			{"pgs","Medic, Inc has up to date equipment that the military uses, which means he will be well prepared to respond..","M110C","v"},
			{"pgs","Barrier only provides security and medical support locally in New City, so he knows the area well.","M110B","w"},

				{"label","M110B"},
					 -- scorea:-MD
					 {"fun",incfailed},
					{"ns","Really?  Are you sure you looked into this?  It sounds….unlikely.","VS_T1toT2PX_03.ogg"},
					{"pg","I’ve looked around, and I believe that this is the right choice to make.","M112A"}, 
				
				{"label","M110C"},
					-- scoreb:+MD
					{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","VS_T1toT3PX_03.ogg"},
					{"pg","Thank you, Ms. Mayor.  I am happy you are satisfied.","M112A"},


		{"label","M111A"},  --Chose Marvin Moneymaker
			{"ns","So before I let you go, you have to tell me -- why in the world did you choose Mullen Medical Supply?","VS_T1P2M1_09.ogg"},
			{"pgs","I have confidence in Mullen Medical to keep both workers and onlookers safe at the disaster site.","M111B","x"},
			{"pgs","Mullen is a local hero, and has even earned a key to the city for past successes.","M111C","y"},
			{"pgs","Mullen Medical has the capacity and the personnel to rapidly respond to our crisis.","M111B","z"},


				{"label","M111B"},
					 -- scorea:-MD
					 {"fun",incfailed},
					{"ns","Really?  Are you sure you looked into this?  It sounds….unlikely.","VS_T1toT2PX_03.ogg"},
					{"pg","That may be – but I stand by it, Your Honor.","M112A"},
		
				{"label","M111C"},
					-- scoreb:+MD
					{"ns","That’s a good reason as any, I guess. At least you’ve done your research. Now, I really hope this works out….","VS_T1toT2PX_04.ogg"},
					{"pg","Thank you, Ms. Mayor.  I am happy you are satisfied.","M112A"},


		{"label","M112A"},
		{"if","failed","<=",1,"M112B"},
			{"ns1","To be truthful, I am unsettled. I don’t think you have researched your choices thoroughly, because you don’t seem to have your facts straight. Well, we’re under pressure here – so it’s too late to find someone else now. Just go negotiate a contract price with %s.","VS_T1toT2PXM1_05.ogg","vendorx"},
			{"pg","I am sorry to have disappointed you.  I will pay closer attention to the research for my next task.","END"},
		

		{"label","M112B"},
			{"ns1","Before we finish, I must say I am impressed with your thoroughness!  You seem informed, and that tells me your choice is well-researched.  The next step now is to go back to %s and negotiate a contract. ","VS_T1toT2PXM1_06.ogg","vendorx"},
			{"pg","I am honored by the sentiment.  Thank you kindly, Ms. Mayor.","END"},
		
--*************************
--NEED TO NEGOTIATE PRICE
--*************************

		{"label","M1ATD1"},
			{"ns","Now, you’ll have to excuse me and show yourself out... I am sure you understand that I have a lot of work to do. If you have negotiated a price with the emergency response services provider who will respond to the disaster, see Will and let him know.","VS_T1P2M1_10.ogg"},
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

	{"label","M2"},
		{"label","M21A"},
		{"fun",incmayor},
		{"fun",incstandon},
		{"fun",incevelyn},
		{"fun3",setvar,"scoreconvo","m2"},
		{"if","clothingscore",">",0,"M21B"},
			{"ns","Hello again.  I am happy you made it, and we need to move forward – but before we start I must remind you that I feel appearance counts. If you have an appointment at City Hall, you must dress appropriately.","VS_T1PXM2_01.ogg"},
			{"pgs","I’m sorry, Ms. Mayor.  It won’t happen again.","M22A","a"},
			 -- scorea:-MA


		{"label","M21B"},
			{"ns","Welcome back!  I am happy you made it; we certainly have to get everything straightened away.  Before we begin, though, I notice you’ve dressed up. I find it very reassuring when people show up to City Hall looking their best. Thanks - I appreciate it.","VS_T1PXM2_02.ogg"},
			{"pgs","Yes, of course, Ms. Mayor. Thank you.","M22A","b"},
			 -- scorea:+MA
		

		{"label","M22A"},
			{"ns","Okay, so, let’s get started.  We really need to move ahead effectively with our tasks in order to successfully steer this City through this crisis.  Have you brought a contract back for me to countersign?","VS_T1PXM2_03.ogg"},
			 {"if","vendorcontract","==",true,"M22B"},
			 {"pg","Yes, here you go.","M23X"},
		
				
				{"label","M22B"}, --Vendor Contract
					{"p","I actually have a contract from the vendor and it is awaiting your signature."},
					{"ns","What do you mean you have a contract from the vendor?? You should never accept a contract from a service provider! Especially not now! We write contracts because we have terms we need included. As it stands, we may have been backed into a bad deal.  I am disappointed.","VS_T1PXM2_04.ogg"},
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
					{"ns3","So lets take a look…hmm…uh-oh.  This is troubling. It says here we’re paying $%d, which is quite high. This should run between $%d and $%d.  Next time, prepare yourself with research before you negotiate with a vendor – otherwise we’ll end up overspending drastically..","VS_T1PXM2_07.ogg","cost","min","max"},
					{"pgs","Ok, Ms. Mayor.  I will do better with my next task.","M24","e"},
					 -- scorea:-SG
		

		{"label","M24"},
			{"fun3",setvar,"invcontract",nil},
			{"fun3",setvar,"vendorcontract",nil},
			{"fun3",setvar,"signedcontract",true},
			{"fun",storecost},
			{"fun2",incvars,"journalprogress"},
			{"ns","Okay, then – that’s done!  Now, take the contract downstairs to Will Standon.  He will give you further instructions.  I hope found your first task challenging and rewarding.  I hope to see you soon – there is much work to be done on this crisis -- and not much time!","VS_T1PXM2_08.ogg"},
			{"pg","I understand, Ms. Mayor.  I am sure we will meet again when I am assigned my next task.","END"},
		
		
--***********************
--NEED TO TALK TO WILL
--***********************

		{"label","M2ATD1"},
			{"ns","What are you still doing here with that contract in your hands? We need to start on this immediately! Now bring that document downstairs to Will Standon’s office right away!","VS_T1PXM2_10.ogg"},
			{"pg","Yes, Ms. Mayor","END"},

--*******************
--END
--*******************

		{"label","END"},
			{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
