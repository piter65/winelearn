local dialogtext = {

{"if","sheriffprogress","==",4,"SASD"},

{"label","ifs"},
{"if","standonprogress","==",0,"NOTYET"},
{"if","standonprogress","==",1,"S1"},
{"if","standonprogress","==",2,"SATD1"},
{"if","standonprogress","==",3,"SATD2"},
{"if","standonprogress","==",4,"SATD3"},
{"if","standonprogress","==",5,"SATD4"},
{"if","standonprogress",">=",6,"SATD5"},

{"label","NOTYET"},
{"n","Please go and talk to Evelyn at the Team Office"},
{"pg","I'll do that right away, sir.","END"},

--*************
--FIRST MEETING
--*************

	{"label","S1"},
	{"fun",incstandon},
	{"fun",incevelyn},
	{"fun",incsheriff},
	{"fun3",setvar,"scoreconvo","s1"},
	{"fun3",setvar,"wutrap",1},
	{"fun2",incvars,"journalprogress"},
	{"ns","I am happy you are here – because we don't have much time. You've heard that someone has been diverting our much needed relief and recovery funds.  It is your task to find out who is responsible and bring them to justice!","VS_T3PXS1_01.ogg"},
	{"pg","I understand.  Where do we start?","S2"},

	{"label","S2"},
	{"ns","In order to help us find out who is responsible for this criminal activity, we called in the State Bureau of Investigation.  They developed a criminal profile for us that will help guide our search for the culprits.","VS_T3PXS1_02.ogg"},
	{"pg","Okay – a profile? How does that work?","S3"},

	{"label","S3"},
	{"ns","The profile describes the person responsible for this fraud. If you follow the right clues, your investigation should lead to several suspects.  When you encounter the suspect, you will be given the opportunity to ask questions based on  the profile to determine which suspect is the guilty party.","VS_T3PXS1_03.ogg"},
	{"pg","I see, Will.  This profile will serve as ‘guidelines' to determine the culprit.","S4"},

	{"label","S4"},
	{"ns","Exactly! So, as it turns out, the person we are looking for knows nothing about business, ethics, or decision-making. When you find a suspect, ask them  questions on these topics. The guilty party is the one who answers all of the profile questions incorrectly.","VS_T3PXS1_04.ogg"},
	{"pg","I see – so we are looking for whoever knows the least about the three topics we covered in class!","S5"},

	{"label","S5"},
	{"ns","Remember, your task is to search for clues around New City that lead to the suspects. When you find a suspect, you'll ask questions in an interrogation to determine if your suspect is the guilty party.","VS_T3PXS1_05.ogg"},
	{"pg","Okay Will – I got it.  So, how do we get started?","S6"},

	{"label","S6"},
	{"ns","Excellent. The next thing for you to do is go see Willie Ketchum, the security guard here at City Hall.  He will go through the details of the profile, and let you know where you should go to begin your investigation.  Good luck – and remember, the entire City is counting on you!","VS_T3PXS1_06.ogg"},
	{"pg","Yes, Will.  If that's all, I will go and see Will Ketchum now.","END"},



--*************
--HAVEN'T TALKED TO KETCHUM
--*************

	{"label","SATD1"},
	{"ns","Well?  What are you waiting for?  We need to uncover the person responsible for this fraud before the recovery and relief efforts are irreparably compromised! Now hurry over to Willie Ketchum, the security guard here at City Hall, so he can give you more information about the investigation.  The future of our City is at stake! ","VS_T3PXS1_07.ogg"},
	{"pg","Of course, Will.  Thanks for the reminder.","END"},

--******************
--TALKED TO KETCHUM
--******************

	{"label","SATD2"},
	{"ns","I hear your investigation is underway – that's great news.  See what you can find, and where it leads you.  Remember, the City's relief and recovery effort is in peril – and we are counting on you to save it!","VS_T3PXS1_08.ogg"},
	{"pg","I understand, Will.  I'll see you soon.","END"},

--******************
--TALKED TO SOMEONE IN LOC1
--******************

	{"label","SATD3"},
	{"ns","I understand your investigation is now in full swing!  That's great news.  Remember, we are all relying on you to find out who is responsible for this fraud and bring him or her to justice!  ","VS_T3PXS1_09.ogg"},
	{"pg","I understand, Will.  I'll see you soon.","END"},

--*********************
--TALKED TO SOMEONE IN LOC2
--*********************

	{"label","SATD4"},
	{"ns","Hey there!  I hear you've made a breakthrough in your investigation! As you try to follow up on your next clues, remember the profile that you were given – but also, check in with your teammates to see if their experience in New City can help you.  Now get to the bottom of this – we're counting on you!","VS_T3PXS1_10.ogg"},
	{"pg","Understood, Will. I'll see you soon.","END"},

--**********************
--MADE ARREST
--**********************

	{"label","SATD5"},
	{"ns","Well, there you are! I heard you had the perpetrator of this whole fraud arrested! New City truly owes you a debt of gratitude – and I owe you my personal thanks for all your work. I hope you join us on some future project – we need people like you in New City! ","VS_T3PXS1_11.ogg"},
	{"pg","Thanks for the complement, Will.  It's been a pleasure working with you.","END"},

--**********************
--ARRESTED MAYOR
--**********************

	{"label","SASD"},
	{"ns","There you are!  What were you thinking when you tried to have the Mayor arrested?  Look, I am going to keep you on this job – but you have to straighten up and fly right!  We have a criminal to catch!","VS_T3PXS1_12.ogg"},
	{"pg","I know I was wrong, Will.  I am sorry, and I have learned my lesson.","ifs"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
