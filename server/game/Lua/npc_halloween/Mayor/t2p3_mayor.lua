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
	{"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go let Will Standon know so he can draw up a contract. Now if you’ll please excuse me, these are very trying times. I have urgent matters to attend to…","VS_T1toT2PXM1_07.ogg"},
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
		{"ns","Ah, yes, you are with Stan Freeman’s team at Professional Services, correct? Welcome back!  You are right on time. Now, we are both very busy, so let’s get to work, shall we?","VS_T2PXM1_01.ogg"},
		{"pg","Nice to meet with you again, Ms Mayor. Let’s please begin.","M12"},
		{"label","M12"},
		 {"if","clothingscore","==",0,"M12A"},
		 {"goto","M12B"},
	
			{"label","M12A"}, -- Bad clothes
				-- scorea:-MA
				{"ns","Yes, now before we start, let me just thank you for everything you have done for the City to help us through this crisis. Regardless of the outcome, we are honored to have you participating in our relief and recovery. We all owe you a debt of gratitude.","VS_T2PXM1_02.ogg"},
				{"pgs","Thanks for the thought, Ms. Mayor. It has been my pleasure.","M13","a"},
			{"label","M12B"}, -- Good clothes
			
				{"ns","Yes, now before we start, let me just thank you for everything you have done for the City to help us through this crisis. Regardless of the outcome, we are honored to have you participating in our relief and recovery. We all owe you a debt of gratitude.","VS_T2PXM1_02.ogg"},
				{"pgs","Thanks for the thought, Ms. Mayor. It has been my pleasure.","M13","b"},
				 -- scoreb:+MA

	{"label","M13"},
		{"fun",setpickedvendor},
		{"ns","So, let’s get to business, then, shall we? Who do you think should be the waste recovery and disposal provider to help us through this second stage of the crisis? I have been anxiously awaiting your recommendation.","VS_T2P3M1_01.ogg"},
		{"pg1","I think we should go with %s, Ms. Mayor.","M14A","vendorx"},
		
	{"label","M14A"}, -- Not Nina Ojeda
	{"if","vendor","==",1,"M15A"},
		{"ns","I see. So, I know a little about who is available and I am curious. Why didn’t you choose Clean Green Machinery?","VS_T2P3M1_02.ogg"},
		{"pgs","I am not sure Dapper has the equipment to effectively perform an oil spill recovery.","M14B","c"},
		{"pgs","I am concerned that Dapper may be more concerned about his self-image than he is about providing disposal services.","M14C","d"},
		{"pgs","I didn’t think Dapper would want to get his hands dirty with a job like this.","M14B","e"},

			{"label","M14B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Oh. Really? Are you sure you have your facts straight? I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I believe this is true. I think I remember seeing it in the research.","M15A"},


			{"label","M14C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me! It sounds like you’ve done your homework! Very good. ","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor. Is there anything else you’d like to know?","M15A"},


	{"label","M15A"}, -- Not Gabe Vine
		{"if","vendor","==",2,"M16A"},
		{"ns","I see. So, I know a little about who is available and I am curious. Why didn’t you choose Potty Princess?","VS_T2P3M1_03.ogg"},
		{"pgs","It seems that Wanda Rown is a little overbearing, and people find her very difficult to work with.","M15B","f"},
		{"pgs","I think that Potty Princess will not be able to safely dispose of the septic matter from the oil spill.","M15C","g"},
		{"pgs","I don’t think Wanda has access to recovery equipment that is environmentally friendly.","M15B","h"},

			{"label","M15B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Are you sure you have your facts straight? I’ll trust you on this, but that doesn’t seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","There is research around town that supports this… I think.","M16A"},

			{"label","M15C"},
				-- scoreb:+MD
				{"ns","Well, that sounds like a good reason to me! It sounds like you’ve done your research! Well done. ","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor. Is there anything else you’d like to know?","M16A"},


	{"label","M16A"},
		{"if","vendor","==",3,"M17A"}, -- Not Bjorn Egan
		{"ns","I see. I am still curious, so please tell me... why did you decide not to recommend West Disposal Services?","VS_T2P3M1_04.ogg"},
		{"pgs","I think Freida West is too concerned with acquiring area businesses to build his empire to take on the responsibility of the assignment.","M16B","i"},
		{"pgs","I am pretty sure West Disposal won’t be able to provide the level of safety and eco-friendliness we are looking for.","M16C","j"},
		{"pgs","I am concerned that West Disposal will have trouble arranging for effective and efficient recovery equipment.","M16B","k"},


			{"label","M16B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","I’m not sure you have your facts straight… but I am going to trust you on this, although that does not seem likely to me.","VS_T1toT2PX_01.ogg"},
				{"pg","I’ve read up on this, and I am pretty sure that’s true, actually… ","M17A"},


			{"label","M16C"},
				-- scoreb:+MD
				{"ns","That makes total sense to me. I see you are in control of the facts related to your task! Nice job.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor. Is there anything else you’d like to know?","M17A"},


	{"label","M17A"}, -- Not Marvin Moneymaker
		{"if","vendor","==",4,"M18A"}, 
		{"ns","I see. So, before we move on, tell me why you decided against Dis-Po Corp.","VS_T2P3M1_05.ogg"},
		{"pgs","I understand that Adam Baum doesn’t really enjoy the outdoors and isn’t known for being a conservationist.","M17B","l"},
		{"pgs","I am not sure Dis-Po Corp has recovery and disposal methods that are appropriate for this particular job. ","M17C","m"},
		{"pgs","I am concerned that Baum isn’t able to perform hands-on hazard cleanups.","M17B","n"},


			{"label","M17B"},
				-- scorec:-MD
				{"fun",incfailed},
				{"ns","Are you sure about that? I’ll trust you on this, but that doesn’t seem accurate.","VS_T1toT2PX_01.ogg"},
				{"pg","I appreciate that Ms. Mayor, but I’ve looked around, and I believe this is true.","M18A"},


			{"label","M17C"},
				-- scoreb:+MD
				{"ns","That seems like a good reason to me! You seem to have really looked around!  Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor.  Is there anything else you’d like to know?","M18A"},


	{"label","M18A"}, -- Chose Nina Ojeda
		{"if","vendor","==",2,"M19A"}, 
		{"if","vendor","==",3,"M110A"}, 
		{"if","vendor","==",4,"M111A"},
		{"ns","Right then, so now that I know why you decided against those other vendors, tell me... why did you end up choosing Clean Green Machinery?","VS_T2P3M1_06.ogg"},
		{"pgs","I think that Dapper cares so much about his professional success that he’s perfect for this job. ","M18B","o"},
		{"pgs","Well Clean Green Machinery has a track record of safe and environmentally friendly waste disposal, so they should be able to handle the job.","M18C","p"},
		{"pgs","I’ve read about how Clean Green Machinery has revolutionized the recovery industry.","M18B","q"},


			{"label","M18B"},
				-- scoreb:-MD
				{"fun",incfailed},
				{"ns","Really? Are you sure you looked into this? That sounds… unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I believe this is the right choice to make, Your Honor.","M112A"}, 


			{"label","M18C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you’ve had a thorough look around. Well done.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor. What else do you need to know?","M112A"},
				


	{"label","M19A"}, --Chose Gabe Vine
		{"ns","So now that I know why no one else made it, tell me why Potty Princess struck you as the right choice for this.","VS_T2P3M1_07.ogg"},
		{"pgs","I believe that Potty Princess has been recognized by the City many times for her practices of disposing of septic matter.","M19B","r"},
		{"pgs","I think Potty Princess has equipment that can recover contaminants at the spill site in an environmentally friendly manner.","M19C","s"},
		{"pgs","I believe that Potty Princess is one of the most well-known and respected members of the waste disposal and recovery industry.","M19B","t"},


		{"label","M19B"},
			-- scorea:-MD
			{"fun",incfailed},
			{"ns","Really? Are you sure you looked into this? That sounds… unlikely.","VS_T1toT2PX_03.ogg"},
			{"pg","I’ve looked around, and I believe this is the right choice to make.","M112A"},  


		{"label","M19C"},
			-- scoreb:+MD
			{"ns","That seems like good reason to me. It appears you have really looked into this. Good job.","VS_T1toT3PX_03.ogg"},
			{"pg","I am happy that you are satisfied, Ms. Mayor.","M112A"}, 
			

	{"label","M110A"}, -- Chose Bjorn Egan
		{"ns","Right then, so now that I know why you didn’t choose the other vendors, tell me why you ended up choosing West Disposal Services?","VS_T2P3M1_08.ogg"},
		{"pgs","West Disposal Services is a legendary waste recovery and disposal provider and has the experience we need for this.","M110B","u"},
		{"pgs","I believe West Disposal Services will be able to efficiently and effectively dispose of the waste at the spill site.","M110C","v"},
		{"pgs","I’ve read about how West Disposal Services has a small list of clients allowing them time to handle our account.","M110B","w"},

			{"label","M110B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really? Are you sure you looked into this? That sounds…unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","I’ve looked around, and I believe that this is the right choice to make.","M112A"},  

			{"label","M110C"},
				-- scoreb:+MD
				{"ns","That seems like good reason to me. It appears you have really looked into this. Good job.","VS_T1toT3PX_03.ogg"},
				{"pg","Thank you, Ms. Mayor. I am happy that you are satisfied.","M112A"},  


	{"label","M111A"},  --Chose Marvin Moneymaker
		{"ns","So before I let you go, you have to tell me... why ever did you choose Dis-Po Corp?","VS_T2P3M1_09.ogg"},
		{"pgs","I understand that Dis-Po Corp provides recovery services that are consistently safe and environmentally friendly.","M111B","x"},
		{"pgs","I understand that an accident left Baum immune to all sorts of toxic waste, so he can really get close up and provide a hands-on effort.","M111C","y"},
		{"pgs","I’ve read that Baum has a vast network of recovery specialists he can draw upon in support of any large-scale projects.","M111B","z"},


			{"label","M111B"},
				-- scorea:-MD
				{"fun",incfailed},
				{"ns","Really?  Are you sure you looked into this?  That sounds…unlikely.","VS_T1toT2PX_03.ogg"},
				{"pg","That may be, but I stand by it, Your Honor.","M112A"},  

			{"label","M111C"},
				-- scoreb:+MD
				{"ns","That’s a good reason as any, I guess. At least you’ve looked around and figured that much out. Now, I really hope this works out…","VS_T1toT2PX_04.ogg"},
				{"pg","Thank you, Ms. Mayor. I am happy that you are satisfied.","M112A"},  


	{"label","M112A"},
		{"if","failed","<=",1,"M112B"},
		{"ns1","To be truthful, I am unsettled. I don’t think you have researched your choices thoroughly, because you don’t seems to have your facts straight. Well, we’re under pressure here, so it’s too late to find someone else now. Just go negotiate a contract price with %s.","VS_T1toT2PXM1_05.ogg","vendorx"},
		{"pg","I am sorry to have disappointed you. I will pay closer attention to the research for my next task.","END"},


	{"label","M112B"},
		{"ns1","Before we finish, I must say I am impressed with your thoroughness! You seem informed, and that tells me your choice is well-researched. The next step now is to go back and negotiate a cost for providing services. After that, get a contract from Will to hire %s.","VS_T1toT2PXM1_06.ogg","vendorx"},
		{"pg","I am honored by the sentiment. Thank you kindly, Ms. Mayor.","END"},

--*************************
--NEED TO NEGOTIATE PRICE
--*************************

{"label","M1ATD1"},
	{"ns","Now, you’ll have to excuse me and show yourself out. I am sure you understand that I have a lot of work to do. If you negotiate a price with the waste recovery and disposal provider that will help us through this next stage of the crisis, go see Will and let him know.","VS_T2P3M1_10.ogg"},
	{"pg","Yes, Ms. Mayor. Take care.","END"},

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
				{"ns","Did you say you have a contract from the vendor?  You should never accept a contract from a service provider!  Especially not now!  We write contracts because we have terms we need included.  As it stands, we may have been locked into a bad deal.  I am unhappy about this!  ","VS_T1PXM2_04.ogg"},
				{"pgs","I am sorry, Ms. Mayor.  It won’t happen again.","M23X","c"},
				 -- scorea:-SG

			{"label","M23X"},
			{"fun",startingcostplus10perc},
			{"if","cost","<=","testcost","M23A"},
			{"fun",startingcostplus30perc},
			{"if","cost","<=","testcost","M23B"},
			{"goto","M23C"},

			{"label","M23A"},
				{"ns3","Okay, lets have a look... okay… super!  This vendor typically charges between $%d and $%d and we’re paying $%d.  That shows you did a great job negotiating.  I will be sure to communicate that to your boss, Stan.","VS_T1PXM2_05.ogg","min","max","cost"},
				{"pgs","Thanks!  That’s fantastic news, Ms. Mayor, I am happy that you are pleased.","M24","d"},
				 -- scorea:+SG


			{"label","M23B"},
				{"ns3","Okay, so let’s take a look here…yes, I see.  This vendor typically charges between $%d and $%d and we’re paying $%d.  Not too bad, but make sure you get all the information you can about a vendor before you negotiate and you’ll do even better.","VS_T1PXM2_06.ogg","min","max","cost"},
				{"pg","Thank you, Ms. Mayor.","M24"},


			{"label","M23C"},
				{"ns3","So let’s take a look…hmm…uh-oh.  This is troubling.  It says here we’re paying $%d, which is quite high.  This should run between $%d and $%d.  Next time, prepare yourself with research before you negotiate with a vendor, otherwise we’ll end up overspending.","VS_T1PXM2_07.ogg","cost","min","max"},
				{"pgs","Okay, Ms. Mayor.  I will do a better job in my next task.","M24","e"},
				 -- scorea:-SG


	{"label","M24"},
	{"fun3",setvar,"invcontract",nil},
	{"fun3",setvar,"vendorcontract",nil},
	{"fun3",setvar,"signedcontract",true},
	{"fun",storecost},
	{"fun2",incvars,"journalprogress"},
		{"ns","Okay, then, that’s done!  Now, take the contract to Will Standon.  He will give you further instructions.  I trust that you found this second task challenging and rewarding.  I hope to see you soon, there is much work to be done on this crisis and not much time!","VS_T2PXM2_01.ogg"},
		{"pg","I understand, Ms. Mayor.  I am sure we will meet again when I am assigned my next task.","END"},


--***********************
--NEED TO TALK TO WILL
--***********************

{"label","M2ATD1"},
	{"ns","What are you still doing here with that contract in your hands?  We need to start on this immediately!  Bring that document to Will Standon’s office right away!","VS_T1PXM2_10.ogg"},
	{"pg","Yes, Ms. Mayor","END"},

--*******************
--END
--*******************

{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
