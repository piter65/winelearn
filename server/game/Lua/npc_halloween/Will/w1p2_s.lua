local dialogtext = {
	{"if","standonprogress","==",0,"notyet"},
	{"if","standonprogress","==",1,"S11"},
	{"if","standonprogress","==",2,"S1ATD1"},
	{"if","standonprogress","==",3,"S1ATD2A"},
	{"if","standonprogress","==",4,"S21A"},
	{"if","standonprogress","==",5,"S2ATD1A"},
	{"if","standonprogress","==",6,"S2ATD2"},
	{"if","standonprogress","==",7,"S3ASD1"},
	{"if","standonprogress","==",8,"S31A"},
	{"if","standonprogress","==",9,"S3ATD1"},
	{"if","standonprogress","==",10,"S4ASD1"},
	{"if","standonprogress","==",11,"S41AA"},
	{"if","standonprogress",">=",12,"S4ATD1"},

--**************
--HAVEN'T TALKED TO EVELYN
--**************

		{"label","notyet"},
			{"ns","Hello. Please go talk to Evelyn at the Team Office.","null.wav"},
			{"pg","Okay.","END"},

--**************
--FIRST MEETING
--**************

	{"label","s1"},
		
	{"label","S1"},
		
		{"label","S11"},
			{"fun",setbaseprofit},
			{"fun3",setvar,"scoreconvo","s1"},
			{"ns","There you are, I am glad you're here.  My name is Will Standon, and I am the Mayor's right hand man here at City Hall. I am sure Stan gave you some background about our crisis – so you know the future of New City is in our hands, There is no time to waste, so let's get down to business.","VS_TXPXS1_01.ogg"},
			{"pg","Please, go on.","S12A"},
		
		{"label","S12A"},
			{"ns","For the duration of your stay with us, you have several critical tasks to perform that are related to your role as logistics and support services coordinator. Your first task  is to secure an emergency services provider to respond to and secure the disaster site.  You will select the provider that best fits the guidelines I am about to give you..","VS_T1P2S1_01.ogg"},
			{"pg","Okay, I see.  My goal is to hire a vendor that best meets my guidelines.","S12B"},
		
		{"label","S12B"},
			{"ns","Once you've made a choice, come and let me know.  Afterwards, you will get approval to hire the vendor.  During negotiation, try to keep your costs down as much as possible.  Now. do you think that your understanding of emergency management will help guide your decision-making for this task?","VS_T1P2S1_02.ogg"},
			{"pgs","I think I'd rather base my decision on the guidelines and what I can find out about the vendor.","S12GOOD","a"},
			{"pgs","I know what decisions have to be made, sir, and I'm going to go for it!","S12C","b"},
		
				{"label","S12C"},
					-- scoreb:-EM
					{"ns","I appreciate your enthusiasm, but what may seem like the best choice to you may not necessarily be the right choice to help us through this crisis.  To determine the firm that best suits our purposes, you will have to conduct thorough research.","VS_T1P2S1_03.ogg"},
					{"pg","Oh, okay.  I understand now, Mr. Standon.","S13A"},

				{"label","S12GOOD"},
				 -- scorea:+EM
				{"goto", "S13A"},
		

		{"label","S13A"},
			{"ns","Excellent.  So, that's all you need to know for now. Are you ready for the vendor selection guidelines for this task?  Or, would you like some advice first?","VS_T1toT2PXS1_01.ogg"},
			{"pgs","Yes, please, any advice would be helpful.","S13B","c"},
			{"pgs","I don't need any advice, just the guidelines. Everything else seems clear.","S13BAD","d"},
			-- costb:-LA
		
			{"label","S13B"},
				 -- scorea:+LA
				{"ns","Here is a valuable piece of advice:  Pay close attention to the guidelines that I give you.  Do as much research as you can, and be sure to take notes in your journal as you read about each vendor. You can then refer to your notes as you interview and negotiate with vendors.","VS_T1toT2PXS1_02.ogg"},
				{"pg","Thanks for the advice.  Can I have the guidelines now?","S14"},
				
			{"label","S13BAD"},
			-- scoreb:-LA
			{"goto","S14"},	
		
		{"label","S14"},
			{"ns","The emergency response services provider you choose must meet the following three criteria: First, the vendor must have access to up-to-date medical supplies and equipment. Next, the firm must be able to respond in a timely fashion to the disaster. Finally, to ensure peace and calm, the firm must be able to keep control of onlookers and workers at the site and ensure their safety.","VS_T1P2S1_04.ogg"},
			{"pgs","Thanks for the guidelines. I will go ahead and keep your advice in mind.","S14GOOD","e"},
			{"pgs","Perfect.  I will take it from here - I am sure I can figure this out on my own.","S14BAD","f"},

				{"label","S14GOOD"},
				 -- scorea:+EM
				{"goto", "S15A"},

				{"label","S14BAD"},
				 -- scorea:-EM
				{"goto", "S15A"},
		
		{"label","S15A"},
			{"ns","I have someone in mind who is an expert in the field of emergency service providers. His name is Dennis McCarthy, and he has had so much experience with his own personal emergencies that he knows the emergency response  providers here in town better than anyone.","VS_T1P2S1_05.ogg"},
			{"pg","Great, where's the expert?","S16A"},
		
		{"label","S16A"},
			{"ns","Dennis is working at Techtronics, the store he owns. As you exit City Hall, check your map to see if you can locate it  – or ‘chat' with team mates and see if anyone can tell you where it is  Find him and he will tell you more about local emergency service providers.","VS_T1P2S1_06.ogg"},
			{"pgs","Thanks, Mr. Standon.  Is there anything else you'd like to tell me?","S16B","g"},
			{"pgs","I'm on it, Mr. Standon, I will see you later.","S16BAD","h"},
		
				{"label","S16B"},
					-- scorea:+LA
					{"ns","While you're here, I should remind you  not to engage any services or vendors to assist in the crisis without first running it by me. Getting approval from the Mayor is critical for everything we do here. Do you understand?","VS_T1toT2PXS1_03.ogg"},
					{"pg","I understand, Will.  Thanks again.","S17A"},
					
				{"label","S16BAD"},
				 -- scorea:-LA
				{"goto", "S17A"},
		
		{"label","S17A"},
			{"ns","I need to brief the Mayor on our efforts towards dealing with this crisis.  I must call her now, and will probably tell her about our meeting.. Would it fair to tell her that you understand what your next steps are and that you are on board with her game plan?","VS_T1toT2PXS1_04.ogg"},
			{"pgs","Before you do that, Will, can you explain what you mean by ‘game plan'?","S17B","i"},
			{"pgs","One hundred percent, Will. I am ready to do this.","S18","j"},
		
				{"label","S17B"},
					-- scorea:+LA
					{"ns","I'm sorry, things are so hectic I was probably unclear just now.  I need to make sure you understand that Dennis McCarthy, will give you four emergency services providers to choose from. Research and interview tham all to see who best fits our selection guidelines.","VS_T1P2S1_07.ogg"},
					{"pg","Yes, Will, we have a game plan!","S18"},
					

				{"label","S17BAD"},
				 -- scorea:-LA
				{"goto", "S18"},
		
		{"label","S18"},
			{"fun",incexpert},
			{"fun",incevelyn},
					{"fun",incevelyn},  -- peter double to cover issue
			{"fun",incstandon},
			{"fun",talkedtowill},
			{"fun2",incvars,"journalprogress"},
			{"ns","Now, go see Dennis at Techtronics to get started.  But, remember: This is your first assignment, so take it slowly and pay attention to details!  People who take the time to do things right tend to do much better in business – and in life.","VS_T1P2S1_08.ogg"},
			{"pg","I will keep that in mind, Will.  Thanks for the instructions, I'll see you later.","END"},

--**********************
--DONE WITH INSTRUCTIONS
--**********************
		
		{"label","S1ATD1"},
			{"ns","Well, that does it for us, then.  I'll see you again soon when you have decided on a vendor.  Remember everything I've told you and you'll do just fine.   Now, if you'll excuse me – we have a crisis on our hands and I have to brief the Mayor.","VS_T1toT2PXS1_05.ogg"},
			{"pg","I understand, Will.  I will come back when I know who my choices are for emergency responder services and have researched them.","END"},
		
--**********************
--NEED TO INTERVIEW VENDORS
--**********************

		{"label","S1ATD2A"},
			{"ns","Oh, it's you – I'm extremely busy, and I wasn't expecting you.  Is everything going smoothly?","VS_T1toT2PXS1_06.ogg"},
			{"pg","Thanks for the help, Will, I'll see you later.","END"},
			{"pg","Before I go, could you run those selection guidelines by me one more time?","S1ATD2B"},
	{"label","s2"},
		
		{"label","S1ATD2B"},
			{"ns","Of course!  The guidelines are that first,the emergency responders you choose  must have access to up to date medical supplies and equipment.  Next, the firm must be able to respond to the disaster in a timely fashion. Finally, we need to ensure peace and calm, so the provider must be able to ensure safety at the siter for both relief workers and onlookers by the riverside.","VS_T1P2S1_09.ogg"},
			{"pg","Thanks, Will.  I'll proceed immediately with my vendor research,","END"},
		

--**********************
--DECIDED VENDOR
--**********************

	{"label","S2"},
		
		{"label","S21A"},
			{"fun",setexp},
			{"fun",incstandon},
			{"fun3",setvar,"scoreconvo","s2"},
			{"ns","There you are!  I hope we are moving ahead with your task this week. We have an emergency on our hands, and we need to move forward.  Have you come to a decision about which firm you think we should hire to provide emergency response services?","VS_T1P2S2_01.ogg"},
			{"pg","Yes, I have decided which provider I think will best help us in this situation.","S22"},
			{"pg","No, I am sorry.  I don't think I am ready to decide.","S21B"},
			{"pg","Actually, Will, I need to hear those guidelines again","S2ATD-1B"},
		
		{"label","S21B"},
			{"ns","That concerns me,  We need to respond quickly to minimize this disaster. Look into all the available emergency services providers in town.  Do all the research you can and come back after a thorough look at each vendor.","VS_T1P2S2_02.ogg"},
			{"pg","Alright then, Will, sounds great. Thanks for your time.","END"},
		
		{"label","S22"},
			{"ns","So now that you have researched your vendor choices and have conducted your interviews,  we need to move forward. Which emergency services provider do you recommend?","VS_T1P2S2_03.ogg"},
			{"pg","We should go with New City Emergency Medics Association.","S23A"},
			{"pg","Let's go with First Responders!","S23B"},
			{"pg","I think Medic! Inc. is our best choice,","S23C"},
			{"pg","I'd like to go with Mullen Medical Supply.","S23D"},
			{"pgs","I'd like to go with the Elliot County State Militia!","S23E","a"},
			{"pgs","I think the New City Health Professionals Association is our best choice.","S23F","b"},

		{"label","S23A"},
			{"fun",pickedvendor1},
			{"ns","Okay then.  So are you sure you want to go with New City Emergency Medics Association?","VS_T1P2S2_04.ogg"},
			{"pg","Yes, Will, I have talked to Gil Fermin and think he is our best option. How do we get him on board now?","S24"},
			{"pg","Actually, Will, I didn't mean New City Emergency Medics Association.  I'd like to make another choice.","S22"},
			{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},
		
		{"label","S23B"},
			{"fun",pickedvendor2},
			{"ns","First Responders. Okay.  Are you sure that's the best vendor available for the job?","VS_T1P2S2_05.ogg"},
			{"pg","Yes, Will, after my interview  with him, I decided to move forward with Nurse John Gray.  What are our next steps?","S24"},
			{"pg","Actually, Will, I didn't mean First Responders.  Sorry to have wasted your time.","S22"},
			{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},
		
		{"label","S23C"},
			{"fun",pickedvendor3},
			{"ns","Medic! Inc., great.  So are you 100% sure about this?","VS_T1P2S2_06.ogg"},
			{"pg","After talking to Tom Barrier, I decided to go with him.  What do you think I should do next?","S24"},
			{"pg","Actually, I didn't mean I want to go with Medic! Inc.  I'd like to make another choice.","S22"},
			{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},
		
		{"label","S23D"},
			{"fun",pickedvendor4},
			{"ns","Mullen Medical Supply?  Are you absolutely sure that's who you want to choose?","VS_T1P2S2_07.ogg"},
			{"pg","Yes it is.  I think Dr. Zeke Mullen would be perfect.  Now, how do we get him on board?","S24"},
			{"pg","Actually, I've changed my mind about going with Mullen Medical Supply Let me choose someone else.","S22"},
			{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},
		
		{"label","S23E"},
			--{"fun",willclothingscore},
			{"ns","The Elliot County State Militia?? Are you sure they are even around? I have been trying to call them for days now, and I don't even think they are in town.  I think you had better go and do your research to find out who is really available.","VS_T1P2S2_08.ogg"},
			{"pg","Oops, that was dumb. Bye.","END"},
			 -- scorea:-MR
		
		{"label","S23F"},
			--{"fun",willclothingscore},
			{"ns","You can't pick the New City Health Professionals Association! I know for a fact that they don't even do this sort of thing.  I think you had better go and do your research to find out who is actually available.","VS_T1P2S2_09.ogg"},
			{"pg","Oops, that was dumb. Bye.","END"},
			 -- scorea:-MR
		
		{"label","S24"},
			{"fun",willclothingscore},
			{"fun",incpickedvendor},
			{"fun",incevelyn},
			{"fun",incmayor},
			{"fun",incstandon},
			{"fun3",setvar,"wutrap",1},
			{"fun2",incvars,"journalprogress"},
			{"ns","Great.  Now that you've made a final decision, the next step is to go to the Mayor for her approval of your selection.  If she gives you the go-ahead, you should go back and negotiate a fee with the vendor. Remember, prepare yourself with research before you start haggling!","VS_T1toT2PXS2_01.ogg"},
			{"pg","So noted.  I will go and present my vendor choice to Mayor Gonzalez, and make sure I have done research so I am prepared to negotiate.","END"},
		

{"label","S2ATD1A"},
	{"ns","What are you doing back here?  You need to select an emergency response services providers to help us through this critical crisis phase. Please get back to work immediately, and come back only when you are prepared to make a decision!","VS_T1P2S2_10.ogg"},
	{"pg","Sorry to trouble you, Will.  I'll see you soon.","END"},
	{"pg","I understand we are busy, Will, but I need to hear those guidelines again.","S2ATD-1B"},
	{"pg","I have come to a decision about the provider I think will best help us in this situation.","S22"},
		
		{"label","S2ATD-1B"},
			{"ns","Here are your three guidelines, again:  First, the emergency responders you choose  must have access to up to date medical supplies and equipment.  Next, the firm must be able to respond to the disaster in a timely fashion. Finally, we need to ensure peace and calm, so the provider must be able to ensure safety at the site for both relief workers and onlookers on the waterfront..","VS_T1P2S2_11.ogg"},
			{"pg","That's great, Will. Thanks a lot.","END"},
		
--**********************
--MADE DECISION
--**********************
		
	{"label","s3"},
		
		{"label","S2ATD2"},
			{"ns","Now that you have made a decision, there is no time to waste.  Hurry back to the Mayor and let her know who you have selected so that you can get her approval to go ahead and start negotiating.  Remember, she is a stickler for appearance – so dress your best!","VS_T1toT2PXS2_03.ogg"},
			{"pg","I've got to get going then.  Thanks, Will!","END"},
		
--**********************
--NEED TO NEGOTIATE
--**********************

		{"label","S3ASD1"},
			{"ns","What are you doing here? Your task is crucial to the recovery of our city! We need to handle this oil spill crisis immediately, because the future of our entire environment is in peril! There is no time to waste, so go negotiate a deal with the firm you've selected, and hurry back afterwards!","VS_T1toW2PXS3_04.ogg"},
			{"pg","Okay, Will.  Sorry to trouble you.","END"},

--**********************
--CONTRACT
--**********************

	{"label","S3"},
		
		{"label","S31A"},
			{"fun3",setvar,"scoreconvo","s3"},
			{"ns","You're back.  Are you here tell me that you've negotiated a deal and need a contract for the emergency response services provider you‘ve selected?","VS_T1P2S3_01.ogg"},
			{"pg1","Yes. I struck a deal with %s.","S31C","vendorx"},
			{"pg","No, I'm just passing through. See you later.","S31B"},
		
				{"label","S31B"},
					{"ns","Look, this is an emergency and I'm extremely busy.  I was hoping you would have negotiated a deal by now and just need a contract to finish the deal. You must excuse me, then, because we both have work to do. Come back when you've negotiated a deal and are ready to have me work up a contract for you to get signed.","VS_T1toW2PXS3_01.ogg"},
					{"pg","Sure thing, Will. Bye!","END"},
		
		{"label","S31C"},
			{"fun",getcontractcost},
			{"ns","Okay, so I just need to plug in the numbers here, and we can print this contract right up for you.  Did you arrive at a final cost for the services being provided by the firm you chose?","VS_T1toW2PXS3_02.ogg"},
			{"pg2","Yes, Will, %s is going to cost us $%d","S31CA","vendorx","con1"},
			{"pg2","Yes, Will.  %s is going to cost us $%d","S31CB","vendorx","con2"},
			{"pg2","Yes, Will, %s is going to cost us $%d","S31CC","vendorx","con3"},
			{"pg2","%s is going to cost us $%d","S31CD","vendorx","con4"},
		
		{"label","S31CA"},
			{"fun2",setcontractcost,1},
			{"goto","S31D"},
		{"label","S31CB"},
			{"fun2",setcontractcost,2},
			{"goto","S31D"},
		{"label","S31CC"},
			{"fun2",setcontractcost,3},
			{"goto","S31D"},
		{"label","S31CD"},
			{"fun2",setcontractcost,4},
			{"goto","S31D"},
		
	{"label","s4"},

		{"label","S31D"},
			{"fun",incpickedvendor},
			{"fun",incpickedvendor}, -- BChance: Added 2nd call so that vendor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun3",setvar,"invcontract",true},
			{"fun2",incvars,"journalprogress"},
			{"fun",incedt},
			{"fun3",setvar,"shorttrap",1},
			{"ns","Okay, that sounds about right.  Here's a City contract for you to bring to your vendor, which you can now see in your inventory.  The next step is to bring it back to the firm you selected and sign them up!","VS_T1toW2PXS3_03.ogg"},
			{"pg","Okay, I'm on it.  I'll see you later.","END"},
	
		
--**********************
--NEED TO GET CONTRACT SIGNED BY VENDOR
--**********************		


		{"label","S3ATD1"},
			{"ns","Hey there!  Where is that contract?  Have you gotten it signed by both the mayor and your vendor?  Look, we have a crisis on our hands, and I really need that deal signed so that we can all work to save our river.  Go get the vendor to sign that document and then bring it back to the Mayor, immediately!","VS_T1toW2PXS3_05.ogg"},
			{"pg","Yes, sir.  I am on my way!","END"},

--**********************
--NEED TO GET CONTRACT SIGNED BY MAYOR
--**********************

		{"label","S4ASD1"},
			{"ns","What are you doing here?  I am still not sure if you understand the time sensitivity of our response to this disaster! You need to get that contract countersigned by the Mayor right away. Bring it back after she signs it and I'll have further instructions. Are we clear?","VS_T1toT2PXS4_07.ogg"},
			{"pg","Got it - I'll run this contract upstairs to the Mayor and see you back here shortly.","END"},
			
--**********************
--CONTRACT IS SIGNED
--**********************

	{"label","S4"},
		
	{"label","S41AA"},
		{"fun3",setvar,"scoreconvo","s4"},
		{"fun",startingcostplus10perc},
		{"if","cost","<=","testcost","S41A"},
		{"fun",startingcostplus30perc},
		{"if","cost","<=","testcost","S41B"},
		{"goto","S41C"},

		{"label","S41A"}, --GOOD JOB
			{"ns","Well, look who it is! Glad to see you. The Mayor tells me you've done a great job with your task.  I am relieved to hear it, and the people of New City are grateful as well.  Keep up the good work!","VS_T1toT2PXS4_01.ogg"},
			{"pg","Thanks, Will.  Here is the countersigned contract.","S42A"},
		
		{"label","S41B"}, --SATISFACTORY JOB
			{"ns","Well there you are. The Mayor tells me your task has been completed satisfactorily. I'm happy to hear that.  There is always room for improvement, though, so try to pay attention to all the details during your research so that you can be as prepared as possible.","VS_T1toT2PXS4_02.ogg"},
			{"pg","Thanks, Will.  I have that contract for you.","S42A"},
		
		{"label","S41C"}, --BAD JOB
			{"ns","There you are. Look, I wanted to let you know that I heard you had some trouble with your task. Next time, just follow the guidelines closely and base your decisions on facts. Also, use the journal to take notes on research and refer to it when you need it - it can be a big help. I use mine all the time!","VS_T1toT2PXS4_03.ogg"},
			{"pg","Thank you for the advice Will.   I have that contract for you.","S42A"},
		
		{"label","S42A"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun3",setvar,"vendorcontract",nil},
			{"fun3",setvar,"invcontract",nil},
			{"fun3",setvar,"signedcontract",nil},
			{"fun2",incvars,"journalprogress"},
			{"ns","Well, since we are on the same page, I'll take that contract now.  Just remember for next time – when you select a firm, try to keep their costs down by making sure the negotiations run smoothly.","VS_T1toT2PXS4_04.ogg"},
			{"pgs","What do you mean by, “run smoothly”?","S42B","a"},
			-- scorea:+LA
			{"pgs","Understood, Will.  What's next?","S42BAD","b"},
			-- scoreb:-LA
		
				{"label","S42B"},
					-- scorea:+LA
					{"ns","To get negotiations to run smoothly, you have to research everything you can about vendors' costs.  The key to keeping costs down is being able to recall that information during a negotiation.  If you don't have your facts straight, the vendors may try to raise their prices!","VS_T1toT2PXS4_05.ogg"},
					{"pg","That's great advice, Will.  Thanks for that.","S43"},

				{"label","S42BAD"},
				-- scoreb:-LA
				{"goto","S43"},

		{"label","S43"},
			{"ns","That does it for your principal task, but there's plenty more to do here.  There are many ways to learn, help people and make money here in New City, so take some time and have a look around to find as many opportunities as you can.  \n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!","VS_T1toT2PXS4_06.ogg"},
			{"pg","Thanks, Will!  I could use some cash.  I'll have a look around.","END"},
		
--**********************
--DONE WITH TASK
--**********************
		
		{"label","S4ATD1"},
			{"ns","Hello again. Why are you still here?  We'll be meeting again soon enough.  In the meantime, go have a look around New City.  There are opportunities to learn, help people, and make money that you have been told about – maybe you can make enough to buy some appropriate attire!  \n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!","VS_T1toT2PXS4_08.ogg"},
			{"pg","Okay, will do!  I could use some new suits…","END"},

--***************
--END
--***************

		{"label","END"},
			{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
