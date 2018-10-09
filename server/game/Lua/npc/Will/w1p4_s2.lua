local dialogtext = {
{"if","standonprogress","==",0,"NOTYET"},
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
{"if","standonprogress","==",11,"S4ISGOOD"},
{"if","standonprogress",">=",12,"S4ATD1"},

{"label","T1P4s1"},

--**************
--HAVEN'T TALKED TO EVELYN
--**************

	{"label","NOTYET"},
		{"n","Hello. Please go talk to Evelyn at the Team Office."},
		{"pg","Okay.","END"},

--**************
--FIRST MEETING
--**************

	{"label","S11"},
	{"fun",setbaseprofit},
	{"fun3",setvar,"scoreconvo","s1"},
	 {"ns","There you are, I am glad you're here.  My name is Will Standon, and I am the Mayor's right hand man here at City Hall. I am sure that Stan gave you some background about our crisis – so you know the future of New City is in our hands, There is no time to waste, so let's get down to business.","VS_TXPXS1_01.ogg"},
	 {"pg","Please, go on.","S12A"},


	{"label","S12A"},
	 {"ns","For the duration of your stay with us, you have several critical tasks to perform that are related to your role as environmental impact consultant. Your first task is to secure a firm to assess the damage caused by the spill, and monitor contamination at the disaster site. You will select a consultant that does this and that best fits the selection guidelines that I give you.","VS_T1P4S1_01.ogg"},
	 {"pg","Okay, I see.  My task is to research vendors and, using your guidelines, select from the best among them.","S12B"},


	{"label","S12B"},
	 {"ns","Once you've made a choice, come and let me know.  Afterwards, you will get approval to negotiate with  the vendor.  While hiring the vendor, try to keep your costs down as much as possible.  Now. do you think that your understanding of earth science will help guide your decision-making for this task?","VS_T1P4S1_02.ogg"},
	 {"pg","I think I'd rather base my decision on the guidelines and what I can find out about the vendor.","S12GOOD"},
	 {"pg","I know what decisions have to be made, sir, and I'm going to go for it!","S12C"},

		{"label","S12C"},
		-- scoreb:-EM
		 {"ns","I appreciate your enthusiasm, but what may seem like the best choice to you may not necessarily be the right choice to help us through this crisis.  To determine the firm that best suits our purposes, you will have to conduct thorough research.","VS_T1P4S1_03.ogg"},
		 {"pg","Oh, okay.  I understand now, Mr. Standon.","S13A"},

		{"label","S12GOOD"},
		 -- scorea:+EM
		{"goto", "S13A"},

	{"label","S13A"},
	 {"ns","Excellent.  So, that's all you need to know for now. Are you ready for the vendor selection guidelines for this task or would you like some advice first?","VS_T1toT2PXS1_01.ogg"},
	 {"pg","Yes, please, any advice would be helpful.","S13B"},
	 {"pg","I don't need any advice, just the guidelines. Everything else seems clear.","S13BAD"},

		{"label","S13B"},
		 -- scorea:+LA
		 {"ns","Because you asked, here is a valuable piece of advice:  Pay close attention to the guidelines that I give you.  Do as much research as you can, and be sure to take notes in your journal as you read about each vendor. You can then refer to your notes as you interview and negotiate with vendors.","VS_T1toT2PXS1_02.ogg"},
		 {"pg","Thanks for the advice.  Can I have the guidelines now?","S14"},

		{"label","S13BAD"},
		-- scoreb:-LA
		{"goto","S14"},

	{"label","S14"},
	 {"ns","The firm you choose to perform the assessment must meet the following three criteria: First, the vendor must have a track record of providing accurate and unbiased assessments. Next, the firm must have effective monitoring equipment to assess damage to the ecosystem. Finally, the vendor must be able to present clear, concise written reports on their findings.","VS_T1P4S1_04.ogg"},
	 {"pg","Thanks for the guidelines. I will go ahead and keep your advice in mind.","S14GOOD"},
	 {"pg","Perfect. I will take it from here - I am sure I can figure this all out by myself.","S14BAD"},		
		
		{"label","S14GOOD"},
		 -- scorea:+EM
		{"goto", "S15A"},

		{"label","S14BAD"},
		 -- scorea:-EM
		{"goto", "S15A"},

	{"label","S15A"},
	 {"ns","I have someone in mind who is an expert in the field of environmental assessment. Her name is Heather Winehart -- perhaps you've heard of her? She was a big star a few years ago -- and as an active environmentalist, she's had experience working with a consultant or two.  She should be able to tell you who in town can best  perform an envrionemtnal assessment.","VS_T1P4S1_05.ogg"},
	 {"pg","Okay, where can I find this \'expert\'?","S16A"},


	{"label","S16A"},
	 {"ns","Heather lives here in New City at her loft downtown.  As you exit City Hall, check your map to see if you can locate it  – or ‘chat' with team mates to see if anyone can tell you where it is. Find her and she will tell you more about local consultants who provide ecological disaster assessment.","VS_T1P4S1_06.ogg"},
	 {"pg","Thanks, Mr. Standon.  Is there anything else you'd like to tell me?","S16B"},
	 {"pg","I'm on it, Mr. Standon, I will see you later.","S16BAD"},

		{"label","S16B"},
		-- scorea:+LA
		 {"ns","I'm glad you asked!  While you're here, don't engage any services or vendors to assist in the crisis without first running it by me. Getting approval from the Mayor is critical for everything we do here. Do you understand?","VS_T1toT2PXS1_03.ogg"},
		 {"pg","I understand, Will.  Thanks again.","S17A"},

		{"label","S16BAD"},
		 -- scorea:-LA
		{"goto", "S17A"},

	{"label","S17A"},
	 {"ns","I need to brief the Mayor on our efforts to deal with this crisis.  I must call her now, and will probably tell her about our meeting.. Would it fair to tell her that you understand what the next steps are for you to do your job, and that you are on board with her plan?","VS_T1toT2PXS1_04.ogg"},
	 {"pg","Before we do that, Will, can you explain what you mean by \'game plan\'?","S17B"},
	 {"pg","One hundred percent, Will. I am ready to do this.","S17BAD"},

		{"label","S17B"},
		-- scorea:+LA
		 {"ns","I'm sorry, things are so hectic I was probably unclear.  I need to make sure you understand that you need to meet with Heather, who will give you four ecological damage assessment providers.  Research and interview them to determine who best fits our selection guidelines.","VS_T1P4S1_07.ogg"},
		 {"pg","Okay, then.  Yes, Will, we have a game plan!","S18"},
		 
		{"label","S17BAD"},
		 -- scorea:-LA
		{"goto", "S18"},


	{"label","S18"},
		{"fun",incexpert},
		{"fun",incevelyn},
		{"fun",incstandon},
		{"fun",talkedtowill},
	    {"fun2",incvars,"journalprogress"},
	 {"ns","Now, go see Heather at her loft downtown to get started.  Remember, this is your first assignment, so take it slowly and pay attention to details!  People who take the time to do things right tend to do much better in business – and in life.","VS_T1P4S1_08.ogg"},
	 {"pg","I will keep that in mind, Will.  Thanks for the instructions, I'll see you later.","END"},


--**********************
--DONE WITH INSTRUCTIONS
--**********************

{"label","S1ATD1"},
 {"ns","Well, that does it for us, then.  I'll see you again soon when you have decided on a vendor.  Remember everything I've told you and you'll do just fine.   Now, if you'll excuse me – we have a crisis on our hands and I have to brief the Mayor.","VS_T1toT2PXS1_05.ogg"},
 {"pg","I understand, Will.  I will come back when I know who my choice is for ecological damage assessor.","END"},

--**********************
--NEED TO INTERVIEW VENDORS
--**********************

{"label","S1ATD2A"},
 {"ns","Oh, it's you – I'm extremely busy, and I wasn't expecting you.  Remember to talk to the vendors your expert told you about to see which one best meets the guidelines before making your choice.","VS_T1toT2PXS1_06.ogg"},
 {"pg","Thanks for the help, Will, I'll see you later.","END"},
 {"pg","Before I go, could you run those selection guidelines by me one more time?","S1ATD2B"},

	{"label","S1ATD2B"},
	 {"ns","The guidelines are that the ecological damage assessment provider you choose must be able to provide accurate, unbiased assessments. Next, the consultant must have the right equipment to monitor the damage and track our progress during the cleanup.. Finally, we need to make sure the consultant is able to report findings in a clear, concise manner.","VS_T1P4S1_09.ogg"},
	 {"pg","Thanks, Will.  I'll proceed immediately with my vendor research.","END"},


--**********************
--DECIDED VENDOR
--**********************
{"label","S21A"},
{"fun",setexp},
{"fun",incstandon},
{"fun3",setvar,"scoreconvo","s2"},
 {"ns","There you are!  I hope we are moving ahead with your task this week. We have a crisis on our hands, and we need to move forward.  Have you come to a decision as to who you think we should hire to assess the damage the oil spill has caused New City's ecosystem?","VS_T1P4S2_01.ogg"},
 {"pg","Yes, I have come to a decision about the provider I think will best help us in this situation.","S22"},
 {"pg","No, I am sorry.  I don't think I am ready to decide.","S21B"},
 {"pg","Actually, Will, I need to hear those guidelines again.","S2ATD-1B"},


	{"label","S21B"},
	 {"ns","That concerns me, as time is a factor we have to consider we really need to get going.  This first task is important, and we need to respond in order to minimize damage. Look into all the available consultants in town.  Do all research you can and come back after a thorough look at each vendor.","VS_T1P4S2_02.ogg"},
	 {"pg","Alright then, Will, thanks for your time.","END"},


	{"label","S22"},
	 {"ns","So, now that you have researched your vendor choices tell me, which consultant do you recommend assess the ecological damage caused by the oil  spill in the New City river?","VS_T1P4S2_03.ogg"},
	 {"pg","We should go with Eco-Tech.","S23A"},
	 {"pg","Let's go with Ypoforo Ecosystems!","S23B"},
	 {"pg","I think Ramblin' Rose is our best choice,","S23C"},
	 {"pg","I'd like to with Enviro-X Consulting.","S23D"},
	 {"pg","I'd like to go with Nostra Casa Waste Carting!","S23E"},
	 {"pg","I think the New City Department of Sanitation is our best choice.","S23F"},


	{"label","S23A"},
	{"fun",pickedvendor1},
	 {"ns","Okay then.  So are you sure you want to go with Eco-Tech?","VS_T1P4S2_04.ogg"},
	 {"pg","Yes, Will, I have talked to Nathaniel Wailer and think he is our best option. How do we get him on board now?","S24"},
	 {"pg","Actually, Will, I didn't mean Eco-Tech.  I'd like to make another choice.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23B"},
	{"fun",pickedvendor2},
	 {"ns","Ypoforo Ecosystems, that works.  Are you sure that's the best vendor available for the job?","VS_T1P4S2_05.ogg"},
	 {"pg","Yes, Will, after my interview with him, I decided to move forward with Jannis Economou.  What are our next steps?","S24"},
	 {"pg","Actually, Will, I didn't mean Ypoforo Ecosystems.  Sorry to waste your time.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23C"},
	{"fun",pickedvendor3},
	 {"ns","Ramblin' Rose, then, great.  So are you 100% sure about this?","VS_T1P4S2_06.ogg"},
	 {"pg","After talking to Rose, I decided to go with her.  What do you think I should do next?","S24"},
	 {"pg","Actually, I didn't mean I want to go with Ramblin' Rose. I'd like to make another choice.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23D"},
	{"fun",pickedvendor4},
	 {"ns","Enviro-X Consulting Services?  Are you absolutely sure that's who you want to choose?","VS_T1P4S2_07.ogg"},
	 {"pg","Yes it is.  I think Skeeter McBragg would be perfect.  Now, how do we get him on board?","S24"},
	 {"pg","Actually I changed my mind about going with Enviro-X Consulting Let me choose someone else.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23E"},
	-- scoree:-MR
	 {"ns","Nostra Casa Waste Carting?? Are you sure they are even around? I have been trying to call them for days now. I don't think they are in available.  You had better go and do your research to find out who is really available.","VS_T1P4S2_08.ogg"},
	 {"pg","Umm, right…so I guess I'll see you later then.","END"},



	{"label","S23F"},
	-- scorea:-MR
	 {"ns","You can't pick the New City Department of Sanitation! I know for a fact that they don't do this sort of thing.  I think you had better go and do your research to find out who is actually available.","VS_T1P4S2_09.ogg"},
	 {"pg","Umm, right…so I guess I'll see you later then.","END"},


	{"label","S24"},
	{"fun",willclothingscore},
	{"fun",incpickedvendor},
	{"fun",incevelyn},
	{"fun",incmayor},
	{"fun",incstandon},
	{"fun",incedt},
	{"fun2",incvars,"journalprogress"},
	 {"ns","That's fine, then.  Now that you've made a final decision, the next step is to go to the Mayor for her approval of your selection.  If she gives you the go-ahead, you should then go back and negotiate a fee with the vendor. Remember, prepare yourself with research before you start haggling!","VS_T1toT2PXS2_01.ogg"},
	 {"pg","I will go and present my vendor choice to Mayor Gonzalez, and make sure I have done research so I am prepared to negotiate.","END"},


--**********************
--HESITANT WITH VENDORS
--**********************

{"label","S2ATD1A"},
 {"ns","What are you doing here?  This is an emergency!  You need to select a disaster assessment consultant to help us through this most critical phase of the crisis. Please get back to work immediately, and come back only when you are prepared to make a decision!","VS_T1P4S2_10.ogg"},
 {"pg","Sorry to have troubled you, Will.  I'll see you soon.","END"},
 {"pg","I understand we are busy, Will, but I need to hear those guidelines again.","S2ATD-1B"},
 {"pg","I have come to a decision about the provider I think will best help us in this situation.","S22"},

{"label","S2ATD-1B"},
 {"ns","Once again, note these three guidelines: First, the damage assessment consultant you choose must have a proven track record of providing accurate, unbiased assessments.. Next, the firm must have the right equipment to monitor the damage and assess our progress. Finally, make sure the consultant will be able to report and present their findings in a clear and concise manner.","VS_T1P4S2_11.ogg"},
 {"pg","That's great, Will. Thanks a lot.","END"},


--**********************
--MADE DECISION
--**********************
{"label","S2ATD2"},
 {"ns","Now that you have made a decision, there is no time to waste.  Hurry back to the Mayor and let her know who you have selected so that you can get her approval and start negotiating.  Remember, she is a stickler for appearance – so dress your best!","VS_T1toT2PXS2_03.ogg"},
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
{"label","S31A"},
{"fun3",setvar,"scoreconvo","s3"},
 {"ns","You're back!  Are you here because you've negotiated a deal and need a contract for the consultant you selected to perform an ecological damage assessment?","VS_T1P4S3_01.ogg"},
 {"pg1","Yes.  I struck a deal with %s.","S31C","vendorx"},
 {"pg","No, I'm just passing through.  See you later.","S31B"},


	{"label","S31B"},
	 {"ns","Look, this is an emergency and I'm extremely busy.  I was hoping you would have negotiated a deal by now and just need a contract. You must excuse me, because we both have work to do. Come back when you've negotiated a deal and are ready to have me draw up a contract for you to get signed.","VS_T1toW2PXS3_01.ogg"},
	 {"pg","Sure thing, Will. Bye!","END"},


{"label","S31C"},
{"fun",getcontractcost},
 {"ns","Okay, so I just need to plug in the numbers here, and we can print this contract right up for you.  Did you arrive at a final cost for the services being provided with the firm you selected?","VS_T1toW2PXS3_02.ogg"},
 {"pg2","Yes, Will, %s is going to cost us $%d","S31CA","vendorx","con1"},
 {"pg2","Yes, Will. %s is going to cost us $%d","S31CB","vendorx","con2"},
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
{"fun",incstandon},
{"fun",incevelyn},
{"fun3",setvar,"invcontract",true},
{"fun2",incvars,"journalprogress"},
 {"ns","Okay, that sounds about right.  Just give me a second to print this…and…here you go! The next step is to bring this contract back to the firm you selected and sign them up. You can find the contract in your inventory.  You're not allowed to lose it!","VS_T1toW2PXS3_03.ogg"},
 {"pg","Okay, I'm on it.  I'll see you later.","END"},


--**********************
--NEED TO GET CONTRACT SIGNED BY VENDOR
--**********************

{"label","S3ATD1"},
 {"ns","Hey there!  Where is that contract?  Have you gotten it signed by both the Mayor and your chosen vendor?  Look, we have a crisis on our hands, and I really need that contract signed so that we can all save our river.  Go get the vendor to sign that document and then bring it back to the Mayor, immediately!","VS_T1toW2PXS3_05.ogg"},
 {"pg","Yes, sir.  I am on my way!","END"},


--**********************
--NEED TO GET CONTRACT SIGNED BY MAYOR
--**********************

{"label","S4ASD1"},
 {"ns","What are you doing here?  We need to keep moving here! You need to get that contract countersigned by the Mayor this instant. Bring it back here after you are finished with her and I'll have further instructions. Are we clear?","VS_T1toT2PXS4_07.ogg"},
 {"pg","Got it - I'll run this contract upstairs to the Mayor and see you here shortly.","END"},
 

--**********************
--CONTRACT IS SIGNED
--**********************
	{"label","S4ISGOOD"},
		{"fun3",setvar,"scoreconvo","s4"},
		{"fun",startingcostplus10perc},
		{"if","cost","<=","testcost","S41A"},
		{"fun",startingcostplus30perc},
		{"if","cost","<=","testcost","S41B"},
		{"goto","S41C"},
	
	--GOOD JOB
	{"label","S41A"},
	 {"ns","Well, look who it is! Glad to see you. The Mayor tells me you've done a great job with your task.  I am relieved to hear it, and the people of New City truly owe you a debt of gratitude.  Keep up the good work.","VS_T1toT2PXS4_01.ogg"},
	 {"pg","Thanks, Will.  Here is the countersigned contract.","S42A"},


	--SATISFACTORY JOB
	{"label","S41B"},
	 {"ns","Well there you are. The Mayor tells me your task has been completed satisfactorily. I'm happy to hear that.  There is always room for improvement, though, so try and pay attention to all the details during your research so that you can be as prepared as possible.","VS_T1toT2PXS4_02.ogg"},
	 {"pg","Thanks Will.  I have that contract for you.","S42A"},


	--BAD JOB
	{"label","S41C"},
	 {"ns","There you are. Look, I wanted to let you know that I heard that you had some trouble with your task. Next time, just follow the guidelines closely and base your decisions on facts. Also, use the journal to take notes on research and refer to it when you need it - it can be a big help. I use mine all the time!","VS_T1toT2PXS4_03.ogg"},
	 {"pg","Thank you for the advice Will.   I have that contract for you.","S42A"},


	{"label","S42A"},
		{"fun",incstandon},
		{"fun",incevelyn},
		{"fun3",setvar,"vendorcontract",nil},
		{"fun3",setvar,"invcontract",nil},
		{"fun3",setvar,"signedcontract",nil},
		{"fun2",incvars,"journalprogress"},
		{"fun3",setvar,"week_1_finished",true}, -- BChance: Flag that the week is completed.
	 {"ns","Well, since we are on the same page,  I'll take that contract now.  Just remember for next time – when you select a firm, try and keep their costs down by making sure the negotiations run smoothly.","VS_T1toT2PXS4_04.ogg"},
	 {"pg","What do you mean, “run smoothly”?","S42B"},
	 {"pg","Understood, Will.  What's next?","S42BAD"},

		{"label","S42B"},
		 -- scorea:+LA
		 {"ns","To get negotiations to run smoothly, you have to note everything about vendors' costs that you find during research.  The key to keeping costs down is being able to recall that information during negotiation.  If you don't have your facts straight, the vendors may try to raise their prices!","VS_T1toT2PXS4_05.ogg"},
		 {"pg","That's great advice, Will.  Thanks for that.","S43"},

		{"label","S42BAD"},
		-- scoreb:-LA
		{"goto","S43"},


	{"label","S43"},
	 {"ns","That does it for your principal task, but there's plenty more to do here in New City.  There are many ways to learn, help people and make money here in New City. Take some time and have a look around to find as many opportunities as you can.","VS_T1toT2PXS4_06.ogg"},
	 {"pg","Thanks Will!  I could use some cash.  I'll have a look around.","END"},



--**********************
--DONE WITH TASK
--**********************

{"label","S4ATD1"},
 {"ns","Hello again. Why are you still here?  We'll be meeting again soon enough.  In the meantime, go have a look around New City.  Remember about the opportunities to learn, help people, and make money that you have been told about – maybe you can make enough to buy some appropriate attire!","VS_T1toT2PXS4_08.ogg"},
 {"pg","Okay, will do!  I could use some new clothes.","END"},

--***************
--END
--***************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
