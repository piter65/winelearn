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

{"if","w1vendor","==",2,"S11B"},
{"if","w1vendor","==",3,"S11B"},
{"if","w1vendor","==",4,"S11C"},
		{"ns","Welcome back! I am glad to see you. The Mayor and I were speaking about you earlier, and we are thrilled with your work on your last task! If you keep up the outstanding work throughout your assignments here in New City, you will certainly get noticed!","VS_T2PXS1_01.ogg"},
	 	{"pg","I am thrilled you are happy, Will. Please, go on.","S12A"},

		{"label","S11B"},
		{"ns","Welcome back! I am glad to see you. The Mayor and I were speaking about you earlier. We both agree you are doing a fine job. If you keep up the good work throughout your assignments here, New City will have a good shot  at  fully recovering from this crisis.","VS_T2PXS1_02.ogg"},
	 	{"pg","That is good news, Will. Please, continue.","S12A"},

		{"label","S11C"},
		{"ns","Welcome back! Before we begin, I just want you to know I think there is room for improvement in your work. Remember to research your vendors thoroughly and choose which one best fits our selection guidelines. Good decision-making is the key to success for us here, and we are counting on you! ","VS_T2PXS1_03.ogg"},
	 	{"pg","I will take that into consideration and try to do better on this task, Will.","S12A"},



	{"label","S12A"},
	 {"ns","Though our critical first response is behind us, there are still important tasks to complete related to your role as Environmental Consultant. Your next task is to find a legal and compliance services provider who can represent the City in its legal dealings related to the relief and recovery effort. As always, the firm you choose should be the one that best fits the selection guidelines that I will give you.","VS_T2P4S1_01.ogg"},
	 {"pg","Okay, I am to select from among various vendors using the guidelines you give me – just like the last task.","S12B"},


	{"label","S12B"},
	 {"ns","Yes, that's right. Once you've chosen, come and let me know, and you will then get approval to negotiate with the vendor from the Mayor. Now, do you think that you have enough of a feel for New City so that the best decision for the task will be more or less obvious to you?","VS_T2PXS1_04.ogg"},
	 {"pgs","Not really, sir. I don't think the best choice is necessarily the most obvious one.","S12GOOD","a"},
	 {"pgs","Absolutely, sir. I think I can count on my gut instincts.","S12C","b"},

		{"label","S12C"},
		-- scoreb:-EM
		 {"ns","I appreciate your enthusiasm, but what your instincts tell you is not necessarily the right choice to help us through this crisis. To determine the vendor that best suits our purposes, you will have to conduct thorough research.","VS_T2PXS1_05.ogg"},
		 {"pg","Oh, okay. I understand now, Mr. Standon.","S13A"},

		{"label","S12GOOD"},
		 -- scorea:+EM
		{"goto", "S13A"},

	{"label","S13A"},
	 {"ns","Excellent then! That's all you need to know for now. Are you ready for the vendor selection guidelines for this task, or would you like some advice first?","VS_T2PXS1_06.ogg"},
	 {"pgs","Yes, please, any advice would be helpful.","S13B","c"},
	 {"pgs","I think I have the hang of things, especially since I already completed one task successfully.","S13BAD","d"},

		{"label","S13B"},
		 -- scorea:+LA
		 {"ns","Here is a word to the wise: The guidelines that I give you for this task are important because it will become increasingly difficult to see how the various vendors comply with them. Do as much research as you can, and take careful notes as you read about each vendor.","VS_T2PXS1_07.ogg"},
		 {"pg","Thanks for the tip, Will. So what are my guidelines for this task?","S14"},

		{"label","S13BAD"},
		-- scoreb:-LA
		{"goto","S14"},

	{"label","S14"},
	 {"ns","The legal and compliance services firm you choose must meet the following three criteria: First, they must be detail-oriented. Next, they must have a successful track record practicing environmental law. And finally, your choice must have experience dealing with governmental regulatory agencies.","VS_T2P4S1_02.ogg"},
	 {"pgs","Okay then Will, let's go over the rest of the details of the task you have outlined for me. ","S14GOOD","e"},
	 {"pgs","Thanks for the guidelines, Will. I think I can take it from here, See you later!","S14BAD","f"},
		
		{"label","S14GOOD"},
		 -- scorea:+EM
		{"goto", "S15A"},

		{"label","S14BAD"},
		 -- scorea:-EM
		{"goto", "S15A"},

	{"label","S15A"},
	 {"ns","Before we conclude, let me tell you who can point you to the local firms that provide legal and compliance services. Debra Geffen, a long-time Internet entrepreneur, has had to deal with more lawyers than most businesspeople here in town. She can tell you who can help us.","VS_T2P4S1_03.ogg"},
	 {"pg","Okay, where can I find Debra Geffen?","S16A"},


	{"label","S16A"},
	 {"ns","Debra Geffen can be found in the offices of her latest Internet venture, Click-Adz. She will tell you more about local legal and compliance services providers.","VS_T2P4S1_04.ogg"},
	 {"pgs","I'm on it, Mr. Standon. Is there anything else you'd like to tell me?","S16B","g"},
	 {"pgs","Thanks, Mr. Standon. I will see you later.","S16BAD","h"},

		{"label","S16B"},
		-- scorea:+LA
		 {"ns","I'm glad you asked! I should remind you to refrain from engaging any services or vendors to assist in the crisis without explicit authorization from City Hall. Remember, approval from your client is critical for any decisions that you make on their behalf. Do you understand?","VS_T2PXS1_08.ogg"},
		 {"pg","I understand, Will. Thanks again.","S17A"},

		{"label","S16BAD"},
		 -- scorea:-LA
		{"goto", "S17A"},

	{"label","S17A"},
	 {"ns","I need to update the Mayor on our progress now, and will probably tell her about our meeting. Would it be fair to tell her that you understand what the next steps are for you to complete your task, and that everything is set to move ahead?","VS_T2PXS1_09.ogg"},
	 {"pgs","Before we do that, Will, can you explain what you mean by ‘set to move ahead'?","S17B","i"},
	 {"pgs","One hundred percent, Will. I am ready to take the next steps for my task assignment.","S17BAD","j"},

		{"label","S17B"},
		-- scorea:+LA
		 {"ns","I'm sorry, that was unclear. To move ahead, we have to take steps to deal with this crisis. Your next step is to meet with Debra Geffen at Click-Adz and then research and interview the legal and compliance services providers that she directs you to. ","VS_T2P4S1_05.ogg"},
		 {"pg","Okay, then. Yes, Will, we are set to move ahead!","S18"},
		 
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
	 {"ns","Now, go see Debra Geffen at Click-Adz  to get started. Keep in mind, this second assignment doesn't deal with critical response like our earlier task, but the decision you make nonetheless has a long-term impact – so choose carefully!","VS_T2P4S1_06.ogg"},
	 {"pg","I will keep that in mind, Will. Thanks for the instructions, I'll see you later.","END"},


--**********************
--DONE WITH INSTRUCTIONS
--**********************

{"label","S1ATD1"},
 {"ns","That concludes our business for this meeting, but I'll see you again soon when you have decided on a vendor. Just remember everything I've told you and you'll do just fine. Now, if you'll excuse me – I have other matters to attend to.","VS_T2PXS1_10.ogg"},
 {"pg","I understand, Will. I will come back when I have chosen a legal and compliance services provider.","END"},

--**********************
--NEED TO INTERVIEW VENDORS
--**********************

{"label","S1ATD2A"},
 {"ns","Hello, I wasn't expecting you – and I am extremely busy. Just remember to talk to the vendors that your expert told you about and determine which one best meets the selection guidelines before making your choice. Come back here after. you've made a decision.","VS_T2PXS1_11.ogg"},
 {"pg","Thanks for the help, Will, I'll see you later.","END"},
 {"pg","Before I go, could you run those selection guidelines by me one more time?","S1ATD2B"},

	{"label","S1ATD2B"},
	 {"ns","Of course.  Here are your vendor guidelines again: First, the legal and compliance services provider you choose must be detail-oriented. Next, the firm must have a successful track record practicing environmental law. And finally, your choice must have previous experience dealing with governmental regulatory agencies.","VS_T2P4S1_07.ogg"},
	 {"pg","Thanks Will. I'll proceed immediately with my vendor research.","END"},


--**********************
--DECIDED VENDOR
--**********************
{"label","S21A"},
{"fun",setexp},
{"fun",incstandon},
{"fun3",setvar,"scoreconvo","s2"},
 {"ns","There you are! I hope we are moving ahead with your second task. We have a crisis on our hands, and we need to move forward. Have you decided who we should hire as a legal and compliance services provider?","VS_T2P4S2_01.ogg"},
 {"pg","Yes, I have come to a decision about the firm I think will best help us in this situation.","S22"},
 {"pg","No, I am sorry. I don't think I am ready to decide.","S21B"},
 {"pg","Actually, Will, I need to hear those guidelines again.","S2ATD-1B"},


	{"label","S21B"},
	 {"ns","That concerns me, as we need to move ahead confidently. This next task, though not a component of early disaster response, is nonetheless critical to our recovery. Look into all the available providers in town. Come back after you've thoroughly looked into each choice.","VS_T2P4S2_02.ogg"},
	 {"pg","All right then Will, thanks for your time.","END"},


	{"label","S22"},
	 {"ns","So, now that you have researched your vendor choices, please tell me who you recommend for legal and compliance services.","VS_T2P4S2_03.ogg"},
	 {"pg","We should go with Eastern Legal.","S23A"},
	 {"pg","Let's go with Dewey, Sewham, and Howe!","S23B"},
	 {"pg","I think Abbie S. Korpis Associates is our best choice.","S23C"},
	 {"pg","I'd like to go with Gates and Partners.","S23D"},
	 {"pgs","I'd like to go with the Law Offices of Bendham and Breakham!","S23E","a"},
	 {"pgs","I think the Elliot County Legal Aiding and Abetting Society is our best choice.","S23F","b"},


	{"label","S23A"},
	{"fun",pickedvendor1},
	 {"ns","Eastern Legal, okay. Are you sure that's the best vendor available for the job?","VS_T2P4S2_04.ogg"},
	 {"pg","Yes, Will, I have selected Eastern Legal. How do we get them on board now?","S24"},
	 {"pg","Actually, Will, I didn't mean Eastern Legal. I'd like to make another choice.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23B"},
	{"fun",pickedvendor2},
	 {"ns","Dewey, Sewham, and Howe, that works. Are you sure that's the best vendor available for the job?","VS_T2P4S2_05.ogg"},
	 {"pg","Yes, Will, I'd like to move forward with Dewey, Sewham, and Howe. What are our next steps?","S24"},
	 {"pg","Actually, Will, I didn't mean Dewey, Sewham, and Howe. Sorry to have wasted your time.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23C"},
	{"fun",pickedvendor3},
	 {"ns","I see, Abbie S. Korpis Associates. Are you completely sure about this?","VS_T2P4S2_06.ogg"},
	 {"pg","I want to go with Abbie Korpis. What do you think I should do next?","S24"},
	 {"pg","Actually, I didn't mean I want to go with Abbie. I'd like to make another choice.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23D"},
	{"fun",pickedvendor4},
	 {"ns","Gates and Partners? That's who you want to choose?","VS_T2P4S2_07.ogg"},
	 {"pg","Yes it is. I think Gates and Partners could be perfect. Now, how do we get them on board?","S24"},
	 {"pg","Actually I changed my mind about going with Gates and Partners. I'd like to make another choice.","S22"},
	 {"pg","Will, now that I think about it, I'm not really ready to make my final choice. Sorry to have wasted your time.","END"},


	{"label","S23E"},
	-- scoree:-MR
	 {"ns","The Law Offices of Bendham and Breakham? I thought they were on vacation! I have been trying to get them on the phone all week. You had better go and do your research to find out who is actually available.","VS_T2P4S2_08.ogg"},
	 {"pg","Umm, right… so I guess I'll see you later, then.","END"},



	{"label","S23F"},
	-- scorea:-MR
	 {"ns","You can't pick the Elliot County Legal Aiding and Abetting Society! I know for a fact that they don't do this sort of thing. I think you had better go and do your research to find out who is really available.","VS_T2P4S2_09.ogg"},
	 {"pg","Umm, right… so I guess I'll see you later, then.","END"},


	{"label","S24"},
	{"fun",willclothingscore},
	{"fun",incpickedvendor},
	{"fun",incevelyn},
	{"fun",incmayor},
	{"fun",incstandon},
	{"fun3",setvar,"wutrap",1},
	{"fun2",incvars,"journalprogress"},
	 {"ns","That's fine, then. Now that you've made a final decision, the next step is to go to the Mayor for her approval of your selection. If she gives you the go-ahead, you should then go back and negotiate a fee with the vendor. ","VS_T1toT2PXS2_01.ogg"},
	 {"pg","Thanks, Will.  I will go and present my vendor choice to Mayor Gonzalez.","END"},


{"label","S2ATD1A"},
 {"ns","What are you doing back here? This is an emergency, and time is of the essence!  You need to select a firm to provide legal and compliance services to help us through this next phase of the crisis. Please get back to work, and return only when you are prepared to make a decision!","VS_T2P4S2_10.ogg"},
 {"pg","Sorry to trouble you, Will. I'll see you soon.","END"},
 {"pg","I understand we are busy, Will, but I need to hear those guidelines again.","S2ATD-1B"},
 {"pg","I have come to a decision about the firm I think will best help us in this situation.","S22"},

{"label","S2ATD-1B"},
 {"ns","Of course. Here are your vendor guidelines again: First, the legal and compliance services provider you choose must be detail-oriented. Next, the firm must have a successful track record practicing environmental law. And finally, your choice must have previous experience dealing with governmental regulatory agencies.","VS_T2P4S2_11.ogg"},
 {"pg","That's great, Will. Thanks a lot.","END"},


--**********************
--MADE DECISION
--**********************
{"label","S2ATD2"},
 {"ns","Now that you have made a decision, there is no time to waste. Hurry back to the Mayor and let her know who you have selected so that you can get her approval and start negotiating.  ","VS_T1toT2PXS2_03.ogg"},
 {"pg","I've got to get going then. Thanks, Will!","END"},

--**********************
--NEED TO NEGOTIATE
--**********************

{"label","S3ASD1"},
 {"ns","What are you still doing here? Your task is critical to the recovery of our city! We need to handle this oil spill crisis confidently, because the future of our entire ecosystem is in danger! Please, hurry back here after you've negotiated a deal with the firm you selected!","VS_T1toW2PXS3_04.ogg"},
 {"pg","Okay, Will. Sorry to trouble you.","END"},
 
 
--**********************
--CONTRACT
--**********************
{"label","S31A"},
{"fun3",setvar,"scoreconvo","s3"},
 {"ns"," You're back. Are you here because you've negotiated a deal and need a contract for the firm you selected to provide legal and compliance services for the City?","VS_T2P4S3_01.ogg"},
 {"pg1","Yes. I struck a deal with %s.","S31C","vendorx"},
 {"pg","No, I'm just passing through. See you later.","S31B"},


	{"label","S31B"},
	 {"ns","We still have a crisis on our hands and there are many things that need my attention. You must excuse me, because we both have work to do. Come back after you've negotiated a deal and are ready to have me draw up a contract for you to get signed.","VS_T1toW2PXS3_01.ogg"},
	 {"pg","Sure thing, Will. Bye!","END"},


{"label","S31C"},
{"fun",getcontractcost},
 {"ns","Okay, so I just need to plug in the numbers, and we can get this contract to you right away. Did you arrive at a final cost for the services being provided with the firm you selected?","VS_T1toW2PXS3_02.ogg"},
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
{"fun",incpickedvendor}, -- BChance: Added 2nd call so that vendor is in correct state.
{"fun",incstandon},
{"fun",incevelyn},
{"fun3",setvar,"invcontract",true},
{"fun2",incvars,"journalprogress"},
{"fun",incedt},
{"fun3",setvar,"shorttrap",1},
 {"ns","Okay, that sounds about right.  Just give me a second to finish this… and… here you go! The next step is to bring this contract back to the firm you selected and sign them up. You can find the contract in your inventory. You're not allowed to lose it!","VS_T1toW2PXS3_03.ogg"},
 {"pg","Okay, I'm on it. I'll see you later.","END"},


--**********************
--NEED TO GET CONTRACT SIGNED BY VENDOR
--**********************


{"label","S3ATD1"},
 {"ns","Hey there! Where is that contract?  Have you gotten it signed by both the Mayor and your chosen vendor?  Look, we have a crisis on our hands, and I really need that contract signed so that we can all save our river. Go get the vendor to sign it and then bring it back to the Mayor, immediately!","VS_T1toW2PXS3_05.ogg"},
 {"pg","Yes, sir. I am on my way!","END"},


--**********************
--NEED TO GET CONTRACT SIGNED BY MAYOR
--**********************

{"label","S4ASD1"},
 {"ns","What are you doing here? We need to keep moving! You need to get that contract countersigned by the Mayor right away. Bring it back here after you are finished with her and I'll have further instructions. Are we clear?","VS_T1toT2PXS4_07.ogg"},
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
	 {"ns","Well, look who it is! Glad to see you. The Mayor tells me you've done a great job with your task. I am relieved to hear it, and the people of New City truly owe you a debt of gratitude. Keep up the good work.","VS_T1toT2PXS4_01.ogg"},
	 {"pg","Thanks, Will. Here is the countersigned contract.","S42A"},


	--SATISFACTORY JOB
	{"label","S41B"},
	 {"ns","Well there you are. The Mayor tells me your task has been completed satisfactorily. I'm happy to hear that. There is always room for improvement, though, so try and pay attention to all the details during your research so that you can be as prepared as possible.","VS_T1toT2PXS4_02.ogg"},
	 {"pg","Thanks Will. I have that contract for you.","S42A"},


	--BAD JOB
	{"label","S41C"},
	 {"ns","There you are. Look, I heard you had some trouble with your task. Next time, just follow the guidelines closely and base your decisions on facts. Also, use the journal to take notes on research and refer to it when you need it – it can be a big help. I use mine all the time! ","VS_T1toT2PXS4_03.ogg"},
	 {"pg","Thank you for the advice Will. I have that contract for you.","S42A"},


	{"label","S42A"},
		{"fun",incstandon},
		{"fun",incevelyn},
		{"fun3",setvar,"vendorcontract",nil},
		{"fun3",setvar,"invcontract",nil},
		{"fun3",setvar,"signedcontract",nil},
		{"fun2",incvars,"journalprogress"},
	 {"ns","Well, since we are on the same page, I'll take that contract now. Just remember for next time – when you select a firm, try and get us the best deal possible by making sure you have your facts straight.","VS_T1toT2PXS4_04.ogg"},
	 {"pgs","What do you mean, “have your facts straight”?","S42B","a"},
	 {"pgs","Understood, Will. What's next?","S42BAD","b"},

		{"label","S42B"},
		 -- scorea:+LA
		 {"ns","To have the facts you need during negotiations, you have to note everything about vendors' costs that you find during your research. Keeping costs down and getting the best deal depends on your recall of that information. ","VS_T1toT2PXS4_05.ogg"},
		 {"pg","That's great advice, Will. Thanks for that.","S43"},

		{"label","S42BAD"},
		-- scoreb:-LA
		{"goto","S43"},


	{"label","S43"},
	 {"ns","That does it for this task, but there's plenty more to do here in New City. There are many ways to learn, help people and make money here in New City. Take some time and have a look around to find as many opportunities as you can. \n\nIf your team members have completed this task as well, inform your teacher that your team is ready for the next Task!","VS_T1toT2PXS4_06.ogg"},
	 {"pg","Thanks Will! I could use some cash. I'll have a look around.","END"},



--**********************
--DONE WITH TASK
--**********************

{"label","S4ATD1"},
 {"ns","Hello again. Why are you still here? We'll be meeting again soon enough.  In the meantime, go have a look around New City. You've been told about lots of opportunities to learn, help people and make money – maybe you can make enough to buy some new clothes.\n\nIf your team members have completed this task as well, inform your teacher that your team is ready for the next Task!","VS_T1toT2PXS4_08.ogg"},
 {"pg","Okay, will do! Or, maybe I can buy a hotdog.","END"},

--***************
--END
--***************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},

}
return dialogtext
