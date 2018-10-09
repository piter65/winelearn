local dialogtext = {

{"if","sheriffprogress","==",0,"KASD"},
{"if","sheriffprogress","==",1,"K1A"},
{"if","sheriffprogress","==",2,"KATD1"},
{"if","sheriffprogress","==",3,"KATD3"},
{"if","sheriffprogress","==",4,"KASDA"},

--***************
--FIRST MEETING
--***************

	{"label","K1A"},
	{"ns","Hello, are you from Professional Services? There isn’t time to waste, so let’s get right to business.  I am sure you took notes on the profile that Mr. Standon gave you. Now, you should probably take open your journal and take more notes, because I am going to make sure you really understand that profile.  Are you ready?","VS_T3PXK1_01.ogg"},
	{"pg","Yes, Willie. Please, let’s start.","K1B"},
	{"pg","Actually, I don’t think I am ready to be tested on the profile.  I’ll come back after I’ve studied up a bit…","END"},

	{"label","K1B"},
	{"ns","The key to finding the guilty suspect lies within the profile.  You’ll know you have your trouble-maker cornered if he answers each of three questions about business, ethics, and decision-making incorrectly.  Now, let’s make sure you know your stuff with the first question: What do you call an entity formed in order to make a profit for its owners?","VS_T3PXK1_02.ogg"},
	{"pg","Well, that’s easy, Will.  That’s called a ‘team’.","K1D"},
	{"pg","I think I have a handle on this.  That entity is called a ‘business’.","K1C"},	
	{"pg","On second thought, I may not be ready for this. I’ll come back when I have my notes on business.","END"},

		{"label","K1C"},
		{"ns","Well, then, now you’re getting off to a solid start! That’s right – a business is formed by a group, or by individuals, in order to make profits for its owners.  I think it’s safe to say we’ve covered that part of our profile.  If you know the rest as well as you do the first part, then you should catch our criminal in no time!","VS_T3PXK1_03.ogg"},
		{"pg","Great, Willie.  Let’s continue, then.","K2A"},

		{"label","K1D"},
		{"ns","That’s not a comforting start! You won’t get us close to the culprit with that kind of recall.  Remember, businesses are entities which may be comprised of individuals, or groups – and they are formed so that their owners can pursue shared economic goals, such as profit.  Now I can’t let you go chasing after troublemakers if you don’t know the profile!","VS_T3PXK1_04.ogg"},
		{"pg","Right then, that makes sense!  Let’s have that question again, then, shall we?","K1B"},


	{"label","K2A"},
	{"ns","So let’s move on.  There are three elements to the profile – so now that you have the first element in hand, let’s move on to the next question. What do you call the morals, values, beliefs or ‘rules’ that guide ethical decision-making? ","VS_T3PXK1_05.ogg"},
	{"pg","I think I have a handle on this.  Those morals, values, beliefs and rules are called “ethical judgments”.","K2C"},
	{"pg","I think I have a handle on this.  Those morals, values, beliefs and rules are called “ethical principles”.","K2B"},	
	{"pg","You know, I am not sure that I am ready for this. I’ll come back when I have my notes on ethics.","END"},

		{"label","K2B"},
		{"ns","That’s correct! Ethical principles refer to commonly-held morals, values and beliefs – or the ‘rules’ that attempt to incorporate these morals, values and beliefs.  Ethical principles serve to guide individuals and groups towards ’right’ decisions. Knowing that should help you catch the culprit!","VS_T3PXK1_06.ogg"},
		{"pg","Okay, great!  Let’s move on.","K3A"},

		{"label","K2C"},
		{"ns","That answer makes me nervous. You aren’t going to bag any bandits like that, cowpoke!  Remember, ethical principles are derived from commonly-held morals, values and beliefs – and are sometimes stated as ‘rules’. Before you start investigating, I am going to have to make sure you’ve mastered the profile.","VS_T3PXK1_07.ogg"},
		{"pg","Okay, then, Willie, I understand.  Let’s have that question again.","K2A"},

	{"label","K3A"},
	{"ns","So let’s move on.  There is one last element to the profile – and once you have it right, I’ll get you started on your investigation.  So here’s the final question: What do you call the process of weighing the positive and negative economic impacts of various decision alternatives? ","VS_T3PXK1_08.ogg"},
	{"pg","Okay, I know this.  That process is called ‘reasoned judgment’.","K3C"},
	{"pg","That’s easy!  That process is called ‘cost-benefit analysis’.","K3B"},	
	{"pg","You know, I am not sure that I am ready for this. I’ll come back when I have my notes on ethics.","END"},

		{"label","K3B"},
		{"ns","That’s correct! Just as the name implies, ‘cost-benefit’ weighs the costs, or negative impacts, along with benefits, or positive impact, of an economic decision! Now with that information, you should be prepared to find the one responsible for this fraud!","VS_T3PXK1_09.ogg"},
		{"pg","I am happy you think I am ready, Willie. So how do I get my investigation started?","K4"},

		{"label","K3C"},
		{"ns","I am so nervous I am getting a headache. You aren’t going to find the defrauders with those facts! Remember, cost-benefit analysis considers the costs or negative impacts, and benefits or positive impacts of an economic decision.  Before you start investigating, I am going to have to make sure you know that fact well.  Are you ready to try again?","VS_T3PXK1_10.ogg"},
		{"pg","Yes, Willie, I am.  I’ll get it this time…","K3A"},

	{"label","K4"},
	{"ns","Okay, now you’re ready to start your task. Your investigation will bring you to the several locations around town.  Clues at each location will lead to several people around town who are soliciting donations.  If you think you’ve found a suspect, interrogate them using the profile. If they fail all of your questions simply call me in, and I will make an arrest!","VS_T3PXK1_11.ogg"},
	{"pg","Okay, I got it. Follow clues from location to location until I find someone I suspect may be guilty –then apply the profile as you just did.","K5"},

	{"label","K5"},
	{"fun",incl1w1},
	{"fun",incl1w2},
	{"fun",incl1r},
	{"fun",incstandon},
	{"fun",incsheriff},
	{"fun",incevelyn},
	{"fun",talkedtoexpert},
	{"fun2",incvars,"journalprogress"},
	{"if","playernum","==",1,"PL1"},
	{"if","playernum","==",2,"PL2"},
	{"if","playernum","==",3,"PL3"},
	{"if","playernum","==",4,"PL4"},

	{"label","PL1"},
	{"ns","That’s right.  Just remember: you can only make one arrest, so choose your suspects carefully, and be sure to ask them all the questions in the profile!  Now, get going to Luisa's Kitchen. We have gotten reports of fraudulent activity there, and we are sending you in to investigate!","VS_T3PXK1_12.ogg"},
	{"pg","Well, thanks for all of your help, Willie.  I’ll see you when I call you in to make an arrest!","END"},


	{"label","PL2"},
	{"ns","That’s right.  Just remember: you can only make one arrest, so choose your suspects carefully, and be sure to ask them all the questions in the profile!  Now, get going to Buona Fortuna. We have gotten reports of fraudulent activity there, and we are sending you in to investigate!","VS_T3PXK1_12.ogg"},
	{"pg","Well, thanks for all of your help, Willie.  I’ll see you when I call you in to make an arrest!","END"},

	{"label","PL3"},
	{"ns","That’s right.  Just remember: you can only make one arrest, so choose your suspects carefully, and be sure to ask them all the questions in the profile!  Now, get going to Cramarossa’s Sandwich Joint. We have gotten reports of fraudulent activity there, and we are sending you in to investigate!","VS_T3PXK1_12.ogg"},
	{"pg","Well, thanks for all of your help, Willie.  I’ll see you when I call you in to make an arrest!","END"},

	{"label","PL4"},
	{"ns","That’s right.  Just remember: you can only make one arrest, so choose your suspects carefully, and be sure to ask them all the questions in the profile!  Now, get going to Markdown Street Diner. We have gotten reports of fraudulent activity there, and we are sending you in to investigate!","VS_T3PXK1_12.ogg"},
	{"pg","Well, thanks for all of your help, Willie.  I’ll see you when I call you in to make an arrest!","END"},

--************************
--NEED TO TALK TO STANDON
--************************

	{"label","KASD"},
	{"ns","Well, hello there!  I hope you’ll excuse me, but I am quite busy.  There are quite a few troublemakers running around New City right now, and it’s making me awfully nervous!","VS_T3PXK1_13.ogg"},
	{"pg","Sorry to disturb you, Willie. ","END"},


--************************
--ALREADY TALKED
--************************

	{"label","KATD1"},
	{"if","playernum","==",1,"PL1B"},
	{"if","playernum","==",2,"PL2B"},
	{"if","playernum","==",3,"PL3B"},
	{"if","playernum","==",4,"PL4B"},


	{"label","PL1B"},
	{"ns","So what brings you back here?  Didja get lost?  Remember, you have to head out to Luisa's Kitchen to investigate the reports we’ve received of fraudulent activity.  Remember to ask around for clues – that’s how you can figure out where to go next. ","VS_T3PXK1_14.ogg"},
	{"pg","Thanks for the reminder, Willie.  I am off!","END"},
	{"pg","Actually Willie, I came by for a bit of help.  Do you have any more advice for me?","KATD2"},

	{"label","PL2B"},
	{"ns","So what brings you back here?  Didja get lost?  Remember, you have to head out to Bon Fortuna to investigate the reports we’ve received of fraudulent activity.  Remember to ask around for clues – that’s how you can figure out where to go next. ","VS_T3PXK1_14.ogg"},
	{"pg","Thanks for the reminder, Willie.  I am off!","END"},
	{"pg","Actually Willie, I came by for a bit of help.  Do you have any more advice for me?","KATD2"},

	{"label","PL3B"},
	{"ns","So what brings you back here?  Didja get lost?  Remember, you have to head out to Cramarossa’s Sandwich Joint to investigate the reports we’ve received of fraudulent activity.  Remember to ask around for clues – that’s how you can figure out where to go next. ","VS_T3PXK1_14.ogg"},
	{"pg","Thanks for the reminder, Willie.  I am off!","END"},
	{"pg","Actually Willie, I came by for a bit of help.  Do you have any more advice for me?","KATD2"},

	{"label","PL4B"},
	{"ns","So what brings you back here?  Didja get lost?  Remember, you have to head out to Markdown Street Diner to investigate the reports we’ve received of fraudulent activity.  Remember to ask around for clues – that’s how you can figure out where to go next. ","VS_T3PXK1_14.ogg"},
	{"pg","Thanks for the reminder, Willie.  I am off!","END"},
	{"pg","Actually Willie, I came by for a bit of help.  Do you have any more advice for me?","KATD2"},

	{"label","KATD2"},
	{"ns","Now that you mention it, here’s a little piece of advice that may come in handy: Try and pay attention to the identification numbers on the credentials you find at each location. The fraudulent badges all seem to have something about them, although we can’t put our finger on what, exactly…","VS_T3PXK1_15.ogg"},
	{"pg","Well that was helpful, Willie – thanks!  I’ll see you when I call you in for the arrest!","END"},

--************************
--MADE ARREST
--************************

	{"label","KATD3"},
	{"ns","Well look who it is - I heard you did a good job on your investigation!  Congratulations on your arrest – your first trouble maker! We all owe you our thanks.  I wish you were staying longer, though, so you could help catch trouble makers full time.  I getting’ a little old for this job…","VS_T3PXK1_16.ogg"},
	{"pg","It’s been my pleasure, Willie. Well, so long!","END"},

--************************
--TRIED TO ARREST MAYOR
--************************

	{"label","KASDA"},
	{"ns","It’s you! Do you have any idea what kind of shenanigans you caused?  What in the world were you thinking when you tried to have me arrest the Mayor? We have enough trouble on our hands!","VS_T3PXK1_17.ogg"},
	{"pg","Yes, Willie.  I am truly sorry – I owe you all an apology.","KATD1"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
