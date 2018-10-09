local dialogtext = {
	--{"if","evelynprogress","==",0,"NOTYET"},

	{"if","sheriffprogress","==",4,"AASD"},	

	{"label","ifs"},
	{"if","evelynprogress","==",0,"A1"},
	{"if","evelynprogress","==",1,"AATD1"},
	{"if","evelynprogress","==",2,"AATD2"},
	{"if","evelynprogress","==",3,"AATD3"},
	{"if","evelynprogress","==",4,"AATD4"},
	{"if","evelynprogress","==",5,"AATD5"},
	{"if","evelynprogress",">=",6,"AATD6"},

{"label","NOTYET"},
{"n1","Please talk to the CEO right away. %d","evelynprogress"},
{"pg","Okay.","END"},


--*****************
--ARRESTED MAYOR
--*****************

{"label","AASD"},
{"ns","There you are!  We have been worried about you!  Are you alright?  We heard you tried to have the Mayor arrested, and so we figured you weren't feeling well. For future reference, you can be assured the culprit does not work at City Hall!  Now go and find out who is actually responsible – and then try to get some rest!","VS_T3PXA1_19.ogg"},
{"pg","I know I was wrong, Evelyn.  I have learned my lesson.","ifs"},

--***************
--FIRST MEETING
--***************

	{"label","A1"},
	{"fun",incevelyn},
	{"fun",incstandon},
	{"ns","Thank goodness you're back! Am I glad to see you!  As if the disaster in the New City River weren't bad enough, someone is siphoning off donations from the relief and recovery effort!  I can't believe it! Well, thank goodness you are here now – did our CEO let you know about your special task assignment?","VS_T3PXA1_01.ogg"},
	{"pg","Yes, Evelyn, I was just briefed by Stan. ","A2"},

	{"label","A2"},
	{"fun",getcheck},
	{"ns","Okay, so let's talk about this special assignment – which is very different than your previous tasks. Oh wait, before we do, I nearly forgot to give you your paycheck. Anyways, as it turns out, as our volunteers have been soliciting donations for New City River relief and recovery effort, an individual or group has managed to siphon off some much needed funds!","VS_T3PXA1_02.ogg"},
	{"pg","Okay, I see.  So let me guess – my team is supposed to find out who is responsible, right? ","A3"},

	{"label","A3"},
	{"ns","That's right! All we know is an individual or group has been printing counterfeit City badges that unknowing relief workers have been using to deposit the money they are raising.  As a result, funds are being diverted away from the relief effort. Your team has to stop them!","VS_T3PXA1_03.ogg"},
	{"pg","I am happy to help! But shouldn't the City be doing something about this?","A4"},

	{"label","A4"},
	{"fun2",incvars,"journalprogress"},
	{"ns","Well, yes. The City has started an investigation, but they've hit a wall. Now, each member of your team will follow a different lead that Standon will tell each of you about when he briefs you at City Hall.  This should hopefully lead to those responsible for this debacle! Maybe you should head over there now.","VS_T3PXA1_04.ogg"},
	{"pg","That makes sense.  I think I know enough to go ahead.  I'll see you soon!","END"},
	{"pg","I see.  Before I go, though, there is some more information I think I need.","A5"},

	--HELP SECTION
	{"label","A5"},
	{"ns"," Because this task is so different than your other tasks, you are wise to seek as much clarification as you can.  Remember, I am here any time you need any help, so don't be afraid to ask!","VS_T3PXA1_05.ogg"},
	{"pg","So what exactly is the object of this task?","A5A"},
	{"pg","So tell me about the badges.  How does one know if they are fake?  ","A5B"},
	{"pg","How does this assignment affect my team score?","A5C"},
	{"pg","How do I know if I am doing well on this assignment?","A5D"},
	{"pg","What do I do if I think I found whoever is responsible?","A5E"},
	{"pg","How do I know I made the right arrest?","A5F"},
	{"pg","Do you have any general advice to help me out?","A5G"},
	{"pg","That's it for now, thanks!","END"},


		{"label","A5A"},
		{"ns","I am happy you asked!  I am sure you noticed this task is a bit different than your previous ones.  The object now is to find out who is responsible for distributing counterfeit badges –because they are diverting much needed funds from the recovery effort! Look for clues around New City and interrogate any suspects - and when you think you've determined who is responsible, have them arrested!","VS_T3PXA1_06.ogg"},
		{"pg","Okay, that makes sense!  I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5B"},
		{"ns","I am happy you asked - you see, that's why the investigation at City Hall ran into a dead end.  No one could figure out exactly how to determine if volunteers' badges are real or not!  We think it has something to do with the identification numbers. Here, I have a couple of badges right here.  One is real, and one is counterfeit.  See if you can tell what makes them different!","VS_T3PXA1_07.ogg"},
		{"wait","A5BA"},
		--{"fun3",setvar,"goodbadge",true},
		--{"fun3",setvar,"fakebadge",true},
		{"label","A5BA"},
		{"ns","You are handed two badges. Each have a serial number: AERS192655540 and RDM177655540","null.wav"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5C"},
		{"ns","The object of your tasks so far has been to ensure an efficient and effective recovery from the oil spill in the New City River.  The fraudulent scheme to divert donations to the recovery effort threatens this goal.  You must find out who is behind this and stop them.  Your team score will be affected by how successfully you and your team mates track down and arrest the guilty parties!","VS_T3PXA1_08.ogg"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5D"},
		{"ns","You can track your progress on this task much as you did your previous ones.  Your journal lists your current objectives, and your score sheet roughly approximates your progress. If you get stuck, just think: Where have you gone?  Who have you seen?  What clues have you gotten? ","VS_T3PXA1_09.ogg"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5E"},
		{"ns","The clues you find will each lead to different people around New City – but those you may find are not necessarily suspects in your investigation.  Anyone who has received their credentials directly from City Hall is probably a suspect.  If you think you found someone who is guilty, see what they have to tell you – and if they fit the profile you received at City Hall, have them arrested!","VS_T3PXA1_10.ogg"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5F"},
		{"ns","We won't know if you've made the right arrest until the results of the relief campaign are in.  If you've arrested the real culprits, donations will be strong, and New City will be in a good position to recover completely. If you've arrested the wrong people, the fraud will continue and we'll have raised a lot less money for the relief effort.  Remember, each person on your team can ask the Sheriff to arrest only one person -- so choose wisely!","VS_T3PXA1_11.ogg"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

		{"label","A5G"},
		{"ns","Here is some advice: Try to figure out how to spot fake credentials. This will help you get to the bottom of the scheme more efficiently.  If you get stuck, just go back to your previous location and make sure you've found all the clues you can. When you find suspects who might be responsible, listen carefully to the answers they give you, and keep the profile that Willie Ketchum gave you in mind!","VS_T3PXA1_12.ogg"},
		{"pg","Okay, I see.  Let‘s continue; I have other questions.","A5"},
		{"pg","Okay, Evelyn, thanks!  That's all I need to know.","END"},

--*****************
--NEED TO TALK TO WILL
--*****************

{"label","AATD1"},
{"ns","Now, I think you have all the information you need from me about your next steps for this task.  Will Standon is waiting for you at City Hall to instruct you on your guidelines for this task. You shouldn't keep him waiting long!","VS_T3PXA1_13.ogg"},
{"pg","Thanks for the reminder!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},

--*****************
--NEED TO TALK TO KETCHUM
--*****************

{"label","AATD2"},
{"ns","Back here already? You must have forgotten that you have a meeting with Will Ketchum, the security guard at City Hall!  He will help you work through the profile, and will give you your first clue on where you can find volunteers unwittingly using fake credentials. You should hurry, because he's waiting for you now!","VS_T3PXA1_14.ogg"},
{"pg","Thanks for the reminder!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},


--*****************
--NEED TO GO TO LOC1
--*****************

{"label","AATD3"},
{"ns","Hey there! I am glad you came back to check in with me.  I hope everything is going well with your investigation.  Just remember, our first step is to talk to all the volunteers at the location that Ketchum indicated – and see if anything turns up that would tell you where you should go next.","VS_T3PXA1_15.ogg"},
{"pg","Thanks for the reminder!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},

--*****************
--NEED TO GO TO LOC2
--*****************

{"label","AATD4"},
{"ns","Hey, I heard you've started uncovering clues in your investigation! I am sure by now you are talking to all of the volunteers you find there to see what you can get. Remember, because some volunteer credentials are real and others are counterfeit, not all volunteers will give you clues that lead to actual suspects! ","VS_T3PXA1_16.ogg"},
{"pg","Thanks, Evelyn.  I will see you back here soon.!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},

--*****************
--NEED TO TALK TO VENDOR
--*****************

{"label","AATD5"},
{"ns","Hey, I heard one of your clues led you somewhere!  I am sure that one of the volunteers at this second location can give you a clue that will lead your investigation to some possible suspects! Perhaps you should check in with your teammates to see if their experience in New City can help you find them.","VS_T3PXA1_17.ogg"},
{"pg","Thanks for the reminder!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},

--*****************
--MADE ARREST
--*****************

{"label","AATD6"},
{"ns","Look who it is! My hero! I heard you found who is responsible for the fraud! New City truly does owe you a debt of gratitude for all of your work here. I know I will miss you, so I hope you join us here on future projects. Now before I get emotional - take the rest of your time here to look around and enjoy yourself!","VS_T3PXA1_18.ogg"},
{"pg","Thanks for the reminder!","END"},
{"pg","Actually, I have other questions I'd like to ask you.","A5"},


--***************
--END
--***************

	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},

}
 return dialogtext
