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
		
		{"label","S11"},
			{"fun",setbaseprofit},
			{"fun3",setvar,"scoreconvo","s1"},
			{"ns","There you are, I am glad you're here.  My name is Will  Standon, and I am the Mayor's right hand man here at City Hall. I am sure Stan gave you some background about our crisis – so you know the ecological future of New City is in our hands.","VS_TXPXS1_01.ogg"},
			{"pg","Yes, he did. Please continue.","S12A"},
		
		{"label","S12A"},
			{"ns"," As the Media Relations Coordinator, you have several critical tasks to perform that are related to your role.. Your first task is to choose a media relations firm that will help us manage the press's coverage of this disaster. I will give you several guidelines that you will use when deciding which vendor to select.","VS_T1P1S1_01.ogg"},
			{"pg","Okay, I see.  I'm supposed to hire a media relations firm.","S12B"},
		
		{"label","S12B"},
			{"ns","Once you've made a choice, come and let me know.  Afterwards, you will get approval to hire the vendor.  Next, during your negotiations, try to keep your vendor costs down as much as possible.  So, tell me, will your understanding of public relations will help guide your decision-making for this task?","VS_T1P1S1_02.ogg"},
			{"pgs","That might help, but more importantly, I'll base my decision on the guidelines and the research facts.","S12GOOD","a"},
			{"pgs","I'm going for it, sir, and my previous knowledge will definitely help.","S12C","b"},
				
				{"label","S12C"},
				-- scoreb:-EM
					{"ns","I appreciate your enthusiasm, but what may seem like the best choice to you may not necessarily the right choice to help us through this crisis.  To determine the firm that best suits our purposes, you will have to conduct thorough research.","VS_T1P1S1_03.ogg"},
					{"pg","Oh, okay.  I understand now, Mr. Standon.","S13A"},
		
				{"label","S12GOOD"},
				 -- scorea:+EM
				{"goto", "S13A"},


		{"label","S13A"},
			{"ns","Are you ready now for the vendor selection guidelines for this task?  Or, would you like some advice first?","VS_T1toT2PXS1_01.ogg"},
			{"pgs","Yes, please, any advice would be helpful.","S13B","c"},
			 {"pgs","I don't need any advice, just the guidelines. Everything else seems clear.","S13BAD","d"},
			 -- costb:-LA 
		
				{"label","S13B"},
					-- scorea:+LA
					{"ns","Well, here is one valuable piece of advice:  Pay close attention to the guidelines that I give you.  Do as much research as you can, and be sure to take notes in your journal as you read about each vendor. You can then refer to your notes as you interview and negotiate with vendors.","VS_T1toT2PXS1_02.ogg"},
					{"pg","Thanks for the advice.  May I have the guidelines now?","S14"},

				{"label","S13BAD"},
				-- scoreb:-LA
				{"goto","S14"},
				
		{"label","S14"},
			{"ns","The media relations firm you choose must meet the following three criteria: First, they must be skilled at interpreting and communicating complicated data about the ecology in a clear, concise way.  Next, the firm must be skilled at getting the word out both locally and state-wide. Finally, we need to ensure peace and calm, so the firm must be able to convey balanced messages to the press and the public.","VS_T1P1S1_04.ogg"},
			{"pgs","Thanks for the guidelines. I will go ahead and use them to help me to make my choice.","S14GOOD","e"},
			{"pgs","Perfect. I will take it from here - I am sure I can figure the rest out by myself.","S14BAD","f"},

				{"label","S14GOOD"},
				 -- scorea:+EM
				{"goto", "S15A"},

				{"label","S14BAD"},
				 -- scorea:-EM
				{"goto", "S15A"},
		
		{"label","S15A"},
			{"ns","I have someone in mind who can point you to to different media relations firms here in New City. Her name is Sandy Carlson, and she is the owner of the New City Cinemas.  She has a lot of contacts in publicity and marketing, so she will definitely be able to tell you who is available here in town.","VS_T1P1S1_05.ogg"},
			{"pg","Okay, where can I find this ‘expert'?","S16A"},
		
		{"label","S16A"},
			{"ns","Sandy is working at the New City Cinemas right now.  As you exit City Hall, check your map and see if you can locate it  – or ‘chat' with your team mates and see if anyone has seen it and can tell you where it is  When you find her, she will tell you more about local media relations firms.","VS_T1P1S1_06.ogg"},
			{"pgs","Thanks, Mr. Standon.  Is there anything else you'd like to tell me?","S16B","g"},
			{"pgs","I'm on it, Mr. Standon, I will see you later.","S16BAD","h"},
		
				{"label","S16B"},
					-- scorea:+LA
					{"ns","I'm glad you asked!  While you're here, I should remind you not to hire any services or vendors to assist in the crisis without first running it by me. Getting approval from the Mayor is critical for everything we do here. Do you understand?","VS_T1toT2PXS1_03.ogg"},
					{"pg","I understand, Will.  Thanks again.","S17A"},
					
				{"label","S16BAD"},
				 -- scorea:-LA
				{"goto", "S17A"},
		
		{"label","S17A"},
			{"ns","I need to update the Mayor on our efforts to deal with this crisis.  I must call her now, and will probably tell her about our meeting.. Would it be fair to tell her that you understand what the next steps are for you to do your job, and that you are on board with her plan?","VS_T1toT2PXS1_04.ogg"},
			{"pgs","Before we do that, Will, can you explain what you mean by ‘her plan'?","S17B","i"},
			{"pgs","One hundred percent, Will. I am ready to do this.","S18","j"},
		
				{"label","S17B"},
					-- scorea:+LA
					{"ns","I'm sorry, things are so hectic I was probably unclear just now.  I need to make sure you understand that Sandy, who you will soon meet, will give you four media relations firms to choose from. Research and interview them all to see which vendor best fits our selection guidelines.","VS_T1P1S1_07.ogg"},
					{"pg","Okay, then.  Yes, Will, we have a game plan!","S18"},
				
				
				{"label","S17BAD"},
				 -- scorea:-LA
				{"goto", "S18"},
		
		{"label","S18"},
			{"fun",incexpert},
			{"fun",incevelyn},
			{"fun",incevelyn},	-- peter added to cover up problem
			{"fun",incstandon},
			{"fun",talkedtowill},
			{"fun2",incvars,"journalprogress"},
			{"ns","Now, go see Sandy at the New City Cinemas to get started.  But, remember: This is your first assignment, so take it slow and pay attention to details!  People who take the time to do things right tend to do much better in business – and in life.","VS_T1P1S1_08.ogg"},
			{"pg","I will keep that in mind, Will.  Thanks for the instructions, I'll see you later.","END"},
		
--**********************
--DONE WITH INSTRUCTIONS
--**********************		
		
		{"label","S1ATD1"},
			{"ns","Well, that does it for us, then.  I'll see you again soon when you have decided on a vendor.  Remember everything I've told you and you'll do just fine.   Now, if you'll excuse me – we have a crisis on our hands and I have to brief the Mayor.","VS_T1toT2PXS1_05.ogg"},
			{"pg","I understand, Will.  I will come back when I know who my choices are for a media relations firm and have done some research on them.","END"},
		
--**********************
--NEED TO INTERVIEW VENDORS
--**********************		
		
		{"label","S1ATD2A"},
			{"ns","Oh, it's you – I'm extremely busy, and I wasn't expecting you.  Is everything going smoothly?","VS_T1toT2PXS1_06.ogg"},
			{"pg","Sure Will. I'll see you later.","END"},
			{"pg","Before I go, could you run those selection guidelines by me one more time?","S1ATD2B"},
			{"label","S1ATD2B"},
			{"ns","Of course!  The guidelines are that first, the media relations firm you choose must be skilled at interpreting complicated data about the ecology in a clear, concise way.   .Next,     the firm must be skilled at getting the word out both locally and state-wide. Finally, we need to ensure peace and calm, so the firm must be able to convey balanced messages to the press and the public.","VS_T1P1S1_09.ogg"},
			{"pg","Thanks Will.  I'll proceed immediately with my vendor research,","END"},
	

--**********************
--DECIDED VENDOR
--**********************
	
	{"label","s2"},
		
		{"label","S21A"},
			{"fun",setexp},
			{"fun",incstandon},
			{"fun3",setvar,"scoreconvo","s2"},
			{"ns","There you are!  I hope we are moving ahead with your task this week. We have an emergency on our hands, and we need to move forward.  Have you come to decision as to whom you think we should hire as a media relations firm?","VS_T1P1S2_01.ogg"},
			{"pg","Yes, I have come to a decision about the firm that I think will best help us in this situation.","S22"},
			{"pg","No, I'm sorry.  I don't think I am ready to decide.","S21B"},
			{"pg","Actually, Will, I need to hear those guidelines again","S2ATD-1B"},
		
				{"label","S21B"},
					{"ns","That concerns me, because time is of the essence when it comes to disaster response.  This first task is the most important, and we need to respond very quickly to minimize harm. Look into all the available firms in town.  Do all research you can and come back after a thorough look at each vendor.","VS_T1P1S2_02.ogg"},
					{"pg","Alright then, Will, sounds great.  Thanks for your time.","END"},
		
				{"label","S22"},
					{"ns","So now that you have researched your vendor choices and have conducted your interviews,  you're ready to move on in this most critical phase. Let's hear which firm you think should handle our media relations.","VS_T1P1S2_03.ogg"},
					{"pg","We should go with Narravi Associates.","S23A"},
					{"pg","Let's go with New Media Communications!","S23B"},
					{"pg","I think Norse Communications is our best choice,","S23C"},
					{"pg","I'd like to go with Media Relations, Inc.","S23D"},
					{"pgs","I'd like to go with Press Relations Services!","S23E","a"},
					{"pgs","I think Ubik & Wittus Advertising is our best choice.","S23F","b"},
		
				{"label","S23A"},
					{"fun",pickedvendor1},
					{"ns","Okay then.  So are you sure you want to go with Narravi Associates?","VS_T1P1S2_04.ogg"},
					{"pg","Yes, Will, I have talked to Nina Ojeda and think she is our best option. How do we get her on board now?","S24"},
					{"pg","Actually, Will, I didn't mean Narravi Associates.  I'd like to make another choice.","S22"},
					{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},
				
				{"label","S23B"},
					{"fun",pickedvendor2},
					{"ns","New Media Communications, that works.  Are you sure that's the best vendor available for the job?","VS_T1P1S2_05.ogg"},
					{"pg","Yes, Will, after I interviewed Gabe Vine, I decided to move forward with him.  What are our next steps?","S24"},
					{"pg","Actually, Will, I didn't mean New Media Communications.  Sorry to waste your time.","S22"},
					{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to waste your time.","END"},
				
				{"label","S23C"},
					{"fun",pickedvendor3},
					{"ns","Norse Communications, great.  So are you 100% sure about this?","VS_T1P1S2_06.ogg"},
					{"pg","After talking to Bjorn Egan, I decided to go with him.  What do you think I should do next?","S24"},
					{"pg","Actually, I didn't mean I want to go with Norse Communications  I'd like to make another choice.","S22"},
					{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to waste your time.","END"},
				
				{"label","S23D"},
					{"fun",pickedvendor4},
					{"ns","Media Relations, Inc?  Are you absolutely sure that's who you want to choose?","VS_T1P1S2_07.ogg"},
					{"pg","Yes it is.  I think Marvin Moneymaker would be perfect.  Now, how do we get him on board?","S24"},
					{"pg","Actually I've changed my mind about going with Media Relations, Inc. Let me choose someone else.","S22"},
					{"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to waste your time.","END"},
				
				{"label","S23E"},
					--{"fun",willclothingscore},
					{"ns","Press Relations Services? Are you sure they are even around? I have been trying to call them for days now.  You may want to go and do your research to find out who is actually available.","VS_T1P1S2_08.ogg"},
					{"pg","Umm, right... so I guess I'll see you later then.","END"},
					 -- scorea:-MR
				
				{"label","S23F"},
					--{"fun",willclothingscore},
					{"ns","You can't pick Ubik and Wittus! I know for a fact that they don't even do this sort of thing.  I think you had better go and do your research to find out who is actually available.","VS_T1P1S2_09.ogg"},
					{"pg","Umm, right... so I guess I'll see you later then.","END"},
					 -- scorea:-MR
		
		{"label","S24"},
			{"fun",willclothingscore},
			{"fun",incpickedvendor},
			{"fun",incevelyn},
			{"fun",incmayor},
			{"fun",incstandon},
			{"fun3",setvar,"wutrap",1},
			{"fun2",incvars,"journalprogress"},
			{"ns","That's fine, then.  Now that you've made a final decision, the next step is to go to the Mayor for her approval of your selection.  If she gives you the go-ahead, you should then go back and negotiate a fee with the vendor. Remember, prepare yourself with research before you start haggling!","VS_T1toT2PXS2_01.ogg"},
			{"pg","Thanks.  I'll go and present my vendor choice to Mayor Gonzalez, and then make sure I have done research so I am prepared to negotiate.","END"},
	
		
		{"label","S2ATD1A"},
			{"ns","What are you doing back here?  This is an emergency, and time is of the essence!  You need to select a media relations firm to help us through this most critical phase of the crisis. Please get back to work immediately, and come back only when you are prepared to make a decision!","VS_T1P1S2_10.ogg"},
			{"pg","Sorry to trouble you, Will.  I'll see you soon.","END"},
			{"pg","I understand we are busy, Will, but I need to hear those guidelines again.","S2ATD-1B"},
			 {"pg","I have come to a decision about the provider I think will best help us in this situation.","S22"},
		
		{"label","S2ATD-1B"},
			{"ns","Once again, note these three guidelines:  First,the media relations firm you choose  must be skilled at interpreting complicated data about the ecology in a clear, concise way.  Next, the firm must be skilled at getting the word out both locally and state-wide. Finally, we need to ensure peace and calm, so the firm must be able to convey balanced messages to the press and the public.","VS_T1P1S2_11.ogg"},
			{"pg","That's great, Will. Thanks a lot.","END"},

--**********************
--MADE DECISION
--**********************

		{"label","S2ATD2"},
			{"ns","Now that you have made a decision, there is no time to waste.  Hurry back to the Mayor and let her know who you have selected so that you can get her approval to go ahead and start negotiating.  Remember, she is a stickler for appearance – so dress your best!","VS_T1toT2PXS2_03.ogg"},
			{"pg","I've got to get going then.  Thanks, Will!","END"},

--**********************
--NEED TO NEGOTIATE
--**********************

		{"label","S3ASD1"},
			{"ns","What are you doing here? Your task is crucial to the recovery of our city! We need to handle this oil spill crisis immediately., The future of our environment  is at stake! There is no time to waste, so go negotiate a deal with the firm you've selected, and hurry back afterwards!","VS_T1toW2PXS3_04.ogg"},
			{"pg","Okay, Will.  Sorry to trouble you.","END"},

--**********************
--CONTRACT
--**********************

	{"label","s3"},
		
		{"label","S31A"},
			{"fun3",setvar,"scoreconvo","s3"},
			{"ns"," You're back.  Are you here to get a City contract for the media relations firm you selected?","VS_T1P1S3_01.ogg"},
			{"pg1","Yes.  I struck a deal with %s.","S31C","vendorx"},
			{"pg","No, I'm just passing through.  See you later.","S31B"},
		
		{"label","S31B"},
			{"ns","Look, I'm very busy with this crisis.  I was hoping you would have negotiated with your vendor by now and just needed a contract to finish the deal. Please excuse me, but we both have work to do. Come back when you've negotiated a deal and are ready to have me draw up a contract for you to get signed.","VS_T1toW2PXS3_01.ogg"},
			{"pg","I'm sorry I'm not prepared, Will. I will return shortly.","END"},
		
		{"label","S31C"},
			{"fun",getcontractcost},
			{"ns","Okay, so I just need to plug in the numbers here, and we can print a contract up for you right away.  Did the vendor and you agree on a final cost for the services being provided?","VS_T1toW2PXS3_02.ogg"},
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
		
		{"label","S31D"},
			{"fun",incpickedvendor},
			{"fun",incpickedvendor}, -- BChance: Added 2nd call so that vendor is in correct state.
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun3",setvar,"invcontract",true},
			{"fun2",incvars,"journalprogress"},
			{"fun",incedt},
			{"fun3",setvar,"shorttrap",1},
			{"ns","Okay, that sounds about right.  Just give me a second…there! You can now see the contract in your inventory.  The next step is to bring this contract back to the firm you selected and sign them up.","VS_T1toW2PXS3_03.ogg"},
			{"pg","Okay, I'm on it.  I'll see you later.","END"},

		
--**********************
--NEED TO GET CONTRACT SIGNED BY VENDOR
--**********************


		{"label","S3ATD1"},
			{"ns","Are you still here?  What are you waiting for?  Go get your vendor to sign the contract, and then take it to the Mayor for her to countersign it.","VS_T1toW2PXS3_05.ogg"},
			{"pg","Yes, sir.  I am on my way!","END"},

--**********************
--NEED TO GET CONTRACT SIGNED BY MAYOR
--**********************

		{"label","S4ASD1"},
			{"ns","What are you doing here?  We need be very careful not to lose time on unnecessary steps! You need to get that contract countersigned by the Mayor right away. Bring it back here after you are finished with her and I'll have further instructions. Are we clear now?","VS_T1toT2PXS4_07.ogg"},
			{"pg","Got it - I'll run this contract upstairs to the Mayor and see you here shortly.","END"},

--**********************
--CONTRACT IS SIGNED
--**********************

	{"label","s4"},

	{"label","S41AA"},
		{"fun3",setvar,"scoreconvo","s4"},
		{"fun",startingcostplus10perc},
		{"if","cost","<=","testcost","S41A"},
		{"fun",startingcostplus30perc},
		{"if","cost","<=","testcost","S41B"},
		{"goto","S41C"},
		
		{"label","S41A"}, --GOOD JOB
			{"ns","Well, look who it is! Glad to see you. The Mayor tells me you've done a great job with your task.  I am relieved to hear it, and the people of New City truly owe you a debt of gratitude.  Keep up the good work.","VS_T1toT2PXS4_01.ogg"},
			{"pg","Thanks, Will.  Here is the countersigned contract.","S42A"},
		
		{"label","S41B"}, --SATISFACTORY JOB
			{"ns","Well there you are. The Mayor tells me your task has been completed satisfactorily. I'm happy to hear that.  There is always room for improvement, though, so try to pay attention to all the details during your research so that you can be as prepared as possible.","VS_T1toT2PXS4_02.ogg"},
			{"pg","Thanks Will.  I have that contract for you.","S42A"},
		
		{"label","S41C"}, --BAD JOB
			{"ns","There you are.   I heard you had some trouble with your task. Next time, just follow the guidelines closely and base your decisions on the research. Also try and use your  journal to take notes as you do your research and then refer to it when you need to - it can be a big help.","VS_T1toT2PXS4_03.ogg"},
			{"pg","Thank you for the advice, Will.   I have that contract for you.","S42A"},
		
		{"label","S42A"},
			{"fun",incstandon},
			{"fun",incevelyn},
			{"fun3",setvar,"vendorcontract",nil},
			{"fun3",setvar,"invcontract",nil},
			{"fun3",setvar,"signedcontract",nil},
			{"fun2",incvars,"journalprogress"},
			{"ns","Thanks for the contract,  Just remember for next time – when you select a firm, try to keep their costs down by being prepared for the negotiation. ","VS_T1toT2PXS4_04.ogg"},
			{"pgs","What do you mean, ‘being prepared'","S42B","a"},
			 -- scorea:+LA
			{"pgs","Understood, Will.  What's next?","S42BAD","b"},
			 -- scoreb:-LA
		
				{"label","S42B"},
					-- scorea:+LA
					{"ns","To have a successful negotiation, you have to note everything you can about vendor's costs that you find during research.  The key to keeping costs down is being able to recall that information during negotiation.  If you don't have your facts straight, the vendor may try to raise their prices!","VS_T1toT2PXS4_05.ogg"},
					{"pg","That's great advice, Will.  Thanks for that.","S43"},

				{"label","S42BAD"},
				-- scoreb:-LA
				{"goto","S43"},
		
		{"label","S43"},
			{"ns","That does it for your principal task, but there's plenty more to do here in New City.  There are many ways to learn, help people and make money in New City, so take some time and have a look around to find as many opportunities as you can. \n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!","VS_T1toT2PXS4_06.ogg"},
			{"pg","Thanks Will!  I could use some cash.  I'll have a look around.","END"},
			
--**********************
--DONE WITH TASK
--**********************

		{"label","S4ATD1"},
			{"ns","Hello again. Why are you still here?  We'll be meeting again soon enough.  In the meantime, go have a look around New City.  Remember about the opportunities to learn, help people, and make money that you have been told about – maybe you can make enough to buy some appropriate attire!  \n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!","VS_T1toT2PXS4_08.ogg"},
			{"pg","Okay, will do!  I could use a new business outfit.","END"},

--***************
--END
--***************

		{"label","END"},
			{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
