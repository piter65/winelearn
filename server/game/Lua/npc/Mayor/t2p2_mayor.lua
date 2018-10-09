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
	{"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go with, let Will Standon know so he can draw up a contract. Now if you’ll please excuse me, these are very trying times.  I have urgent matters to attend to…","VS_T1toT2PXM1_07.ogg"},
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
		{"ns","Ah, yes, you are with Stan Freeman’s team at Professional Services, correct? Welcome back! You are right on time.  Now, we are both very busy – so let’s get to work, shall we?","VS_T2PXM1_01.ogg"},
		{"pg","Nice to meet with again, Ms Mayor.  Let’s please begin.","M12"},
		{"label","M12"},
		 {"if","clothingscore","==",0,"M12A"},
		 {"goto","M12B"},
	
			{"label","M12A"}, -- Bad clothes
				-- scorea:-MA
				{"ns","Yes, now before we start, let me just thank you for everything you have done for the City to help us through this crisis. Regardless of the outcome, we are honored to have you participating in our relief and recovery.  We all owe you a debt of gratitude.","VS_T2PXM1_02.ogg"},
				{"pgs","Thanks for the thought, Ms. Mayor.  It has been my pleasure.","M13","a"},
			{"label","M12B"}, -- Good clothes
			
				{"ns","Yes, now before we start, let me just thank you for everything you have done for the City to help us through this crisis. Regardless of the outcome, we are honored to have you participating in our relief and recovery.  We all owe you a debt of gratitude.","VS_T2PXM1_02.ogg"},
				{"pgs","Thanks for the thought, Ms. Mayor.  It has been my pleasure.","M13","b"},
				 -- scoreb:+MA

	{"label","M13"},
		{"fun",setpickedvendor},
		{"ns","So, let’s get down to business, then, shall we?  Who do you think should be the logistics and support services provider to help us through this second stage of the crisis?  I have been anxiously awaiting your recommendation.","VS_T2P2M1_01.ogg"},
		{"pg1","I think we should go with %s, Ms. Mayor.","M14A","vendorx"},
		
	{"label","M14A"}, -- Not Nina Ojeda
	{"if","vendor","==",1,"M15A"},
		{"ns","I see.  So, I know a little about who is available and I am curious.  Why didn’t you choose Phoenix Services Group?","VS_T2P2M1_02.ogg"},
		{"pgs","I am not sure Margaret Wong has the infrastructure to provide adequate transportation and restoration equipment. ","M14B","c"},
		{"pgs","Well I am concerned that Margaret Wong may be difficult, or else downright impossible, to work with due to her passive-aggressiveness. ","M14C","d"},
		{"pgs","I didn’t think Margaret Wong is emotionally stable enough to really handle the job.","M14B","e"},

			{"label","M14B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Oh.  Really??   Are you sure you have your facts straight?  I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I believe this is true – I think I remember seeing it in the research.","M15A"},


			{"label","M14C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your homework!  Very good. ","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M15A"},


	{"label","M15A"}, -- Not Gabe Vine
		{"if","vendor","==",2,"M16A"},
		{"ns","I see.  So, I know a little about who is available and I am curious.  Why didn’t you choose Force One Logistics?","VS_T2P2M1_03.ogg"},
		{"pgs","It seems that Cedric Maxwell doesn’t employ solid measures for guaranteeing the effectiveness of his offerings.","M15B","f"},
		{"pgs","I am concerned that Force One is a small-scale operation and does not have adequate local facilities for warehousing supplies and equipment.","M15C","g"},
		{"pgs","I think that Force One will not be able to handle most crisis-relief scenarios.","M15B","h"},

			{"label","M15B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Are you sure you have your facts straight?  I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","There is research around town that supports this….I think.","M16A"},

			{"label","M15C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Well done. ","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M16A"},


	{"label","M16A"},
		{"if","vendor","==",3,"M17A"}, -- Not Bjorn Egan
		{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Prairie Fire Services?","VS_T2P2M1_04.ogg"},
		{"pgs","I think Sam Shortback is too busy with his duties as Sheriff of New City to take on the responsibility of the assignment.","M16B","i"},
		{"pgs","I am pretty sure Prairie Fire won’t be able to provide the level of coordination and planning we are looking for.","M16C","j"},
		{"pgs","I am concerned that Prairie Fire Services will have trouble arranging the transportation of inbound supplies and equipment.","M16B","k"},


			{"label","M16B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","I’m not sure you have your facts straight…but I am going to trust you on this, although that does not seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I’ve read up on this, and I am pretty sure that’s true, actually… ","M17A"},


			{"label","M16C"},
				-- scoreb:+MD
				{"ns","That makes total sense to me.  I see you are in control of the facts related to your task!  Good job.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M17A"},


	{"label","M17A"}, -- Not Marvin Moneymaker
		{"if","vendor","==",4,"M18A"}, 
		{"ns","I see.  So, before we move on, tell me why you decided against Western Logistics.","VS_T2P2M1_05.ogg"},
		{"pgs","I understand that Dave Shortback is an incompetent logistics provider.","M17B","l"},
		{"pgs","I am not sure Western Logistics will provide adequate transportation and warehousing of relief supplies and recovery equipment.","M17C","m"},
		{"pgs","I think that Western Logistics has a large enough network of personnel to handle this assignment.","M17B","n"},


			{"label","M17B"},
				-- scorec:-MD
				{"fun",incfailed},
				{"ns","Are you sure about that?  I’ll trust you on this, but that doesn’t seem accurate.","VS_T1toT2PX_01.ogg"},
				{"pg","I appreciate that Ms. Mayor, but I’ve looked around, and I believe this is true.","M18A"},


			{"label","M17C"},
				-- scoreb:+MD
				{"ns","That’s seems like a good reason to me!  You seem to have really looked around! Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M18A"},


	{"label","M18A"}, -- Chose Nina Ojeda
		{"if","vendor","==",2,"M19A"}, 
		{"if","vendor","==",3,"M110A"}, 
		{"if","vendor","==",4,"M111A"},
		{"ns","Right then, so now that I know why you decided against all the other vendors, tell me -- why did you end up choosing Phoenix Services Group?","VS_T2P2M1_06.ogg"},
		{"pgs","I understand that Margaret Wong runs the best operation in town and her staff loves her making it the right choice.","M18B","o"},
		{"pgs"," Well Pheonix seems to have robust amounts of local warehousing, and so I am sure they will be able to do the job.","M18C","p"},
		{"pgs","I’ve read about how Phoenix just completed an acquisition of Axis Transportation – and so their facilities will be more than adequate.","M18B","q"},


			{"label","M18B"},
				-- scoreb:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I believe this is the right choice to make, Your Honor.","M112A"}, 


			{"label","M18C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you’ve had a thorough look around.  Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  What else do you need to know?","M112A"},
				


	{"label","M19A"}, --Chose Gabe Vine
		{"ns","So now that I know why no one else made it, tell me why Force One Logistics struck you as the right choice for this.","VS_T2P2M1_07.ogg"},
		{"pgs","I believe that Force One’s access to local storage is exactly what we need for this crisis.","M19B","r"},
		{"pgs","I think Force One will be able to provide outstanding planning and coordination for the logistics of the relief and recovery effort. ","M19C","s"},
		{"pgs","I believe that Force One is known for being a buttoned up logistics provider making them the right choice.","M19B","t"},


		{"label","M19B"},
			-- scorea:-MD
			{"fun",incfailed},
			{"ns","Really?  Are you sure you looked into this?  That sounds…unlikely.","VS_T1toT2PX_03.ogg"},
			{"pg","I’ve looked around, and I believe this is the right choice to make.","M112A"},  


		{"label","M19C"},
			-- scoreb:+MD
			{"ns","That seems like good reason to me. It appears you have really looked into this.  Good job.","VS_T1toT3PX_03.ogg"},
			{"pg","I am happy that you are satisfied, Ms. Mayor.","M112A"}, 
			

	{"label","M110A"}, -- Chose Bjorn Egan
		{"ns","Right then, so now that I know why you didn’t choose the other vendors, tell me why you ended up choosing Prairie Fire Services Group?","VS_T2P2M1_08.ogg"},
		{"pgs","Prairie Fire is a legendary logistics provider and should lend the experience we need to steer us through the relief and recovery.","M110B","u"},
		{"pgs","I believe Prairie Fire will be able to adequately provide for transportation of relief supplies and recovery equipment.","M110C","v"},
		{"pgs","I’ve read about how Sam Shortback is loved all across the country, so he seemed like a good choice. ","M110B","w"},

			{"label","M110B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I’ve looked around, and I believe that is the right choice to make.","M112A"},  

			{"label","M110C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you have really looked into this.  Good job.","VS_T1toT3PX_03.ogg"},
				{"pg"," Thank you, Ms. Mayor.  I am happy that you are satisfied.","M112A"},  


	{"label","M111A"},  --Chose Marvin Moneymaker
		{"ns","So before I let you go, you have to tell me -- why ever did you choose Western Logistics?","VS_T2P2M1_09.ogg"},
		{"pgs","I understand that Western has access to a large warehouse where they can locally store supplies and equipment.","M111B","x"},
		{"pgs","I’ve read that Dave Shortback has a vast network of personnel he can draw upon in support of large-scale projects.","M111C","y"},
		{"pgs","I understand that Dave is no longer feuding with his brother, and so he should be able to devote his complete attention to the task.","M111B","z"},


			{"label","M111B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds….unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","That may be – but I stand by it, Your Honor.","M112A"},  

			{"label","M111C"},
				-- scoreb:+MD
				{"ns","That’s a good reason as any, I guess. At least you’ve looked around and figured that much out. Now, I really hope this works out…. ","VS_T1toT2PX_04.ogg"},
				{"pg","Thank you, Ms. Mayor.  I am happy that you are satisfied.","M112A"},  


	{"label","M112A"},
		{"if","failed","<=",1,"M112B"},
		{"ns1","To be truthful, I am unsettled. I don’t think you have researched your choices thoroughly, because you don’t seems to have your facts straight. Well, we’re under pressure here – so it’s too late to find someone else now. Just go negotiate a contract price with %s.","VS_T1toT2PXM1_05.ogg","vendorx"},
		{"pg","I am sorry to have disappointed you.  I will pay closer attention to the research for my next task.","END"},


	{"label","M112B"},
		{"ns1","Before we finish, I must say I am impressed with your thoroughness!  You seem informed, and that tells me your choice is well-researched.  The next step now is to go back and negotiate a cost for providing services. After that, get a contract from Will to hire %s.","VS_T1toT2PXM1_06.ogg","vendorx"},
		{"pg","I am honored by the sentiment.  Thank you kindly, Ms. Mayor.","END"},

--*************************
--NEED TO NEGOTIATE PRICE
--*************************

{"label","M1ATD1"},
	{"ns","Now, you’ll have to excuse me and show yourself out. I am sure you understand that I have a lot of work to do. If you have negotiated a price with the logistics provider that will support us through these next stages of the crisis, go see Will and let him know. ","VS_T2P2M1_10.ogg"},
	{"pg","Yes, Ms Mayor. Take care.","END"},

--**********************
--NEED TO GET CONTRACT
--**********************

	{"label","M2ASD1"},
		{"ns","It’s always nice to see you, but what are you doing here?  I am very busy right now.  Please don’t interrupt me again until you have a contract for me to sign.  ","VS_T1PXM2_09.ogg"},
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
		{"pgs","Yes, of course Ms. Mayor. Thank you.","M22A","a"},
		 -- scorea:-MA


	{"label","M21B"},
		{"ns","Welcome back!  I am happy you made it; we certainly have to get everything straightened away.  Before we begin, though, I notice you’ve dressed up. I find it very reassuring when people show up to City Hall looking their best. Thanks - I appreciate it. ","VS_T1PXM2_02.ogg"},
		{"pgs","Yes, of course Ms. Mayor. Thank you.","M22A","b"},
		 -- scorea:+MA


	{"label","M22A"},
		{"ns","Okay, so, let’s get started.  We really need to move ahead effectively with our tasks in order to successfully steer this City through this crisis.  You brought a contract back for me to countersign?","VS_T1PXM2_03.ogg"},
		{"if","vendorcontract","==",true,"M22B"},
		{"pg","Yes, here you go.","M23X"},


			{"label","M22B"}, --Vendor Contract
			{"p","I actually have a contract from the vendor here, and it is awaiting your signature."},
				{"ns","You should never accept a contract from a service provider! Especially not now! We write contracts because we have terms we need included. As it stands, we may have been locked into a bad deal.  I am unhappy about this!  ","VS_T1PXM2_04.ogg"},
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
				{"ns3","So let’s take a look…hmm…uh-oh.  This is troubling. It says here we’re paying $%d, which is quite high. This should run between $%d and $%d.  Next time, prepare yourself with research before you negotiate with a vendor – otherwise we’ll end up overspending.","VS_T1PXM2_07.ogg","cost","min","max"},
				{"pgs","Okay, Ms. Mayor.  I will do a better job in my next task.","M24","e"},
				 -- scorea:-SG


	{"label","M24"},
	{"fun3",setvar,"invcontract",nil},
	{"fun3",setvar,"vendorcontract",nil},
	{"fun3",setvar,"signedcontract",true},
	{"fun",storecost},
	{"fun2",incvars,"journalprogress"},
		{"ns","Okay, then – that’s done!  Now, take the contract to Will Standon.  He will give you further instructions.  I trust that you found this second task challenging and rewarding.  I hope to see you soon – there is much work to be done on this crisis -- and not much time!","VS_T2PXM2_01.ogg"},
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
