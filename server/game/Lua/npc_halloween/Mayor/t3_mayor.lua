local dialogtext = {
{"if","mayorprogress","==",0,"MASD1"},
{"if","mayorprogress","==",1,"M1"},
{"if","mayorprogress","==",2,"MATD1"},
{"if","mayorprogress","==",3,"MATD2"},
{"if","mayorprogress","==",4,"MATD3"},
--******************
--MAYOR NOT SUSPECT
--******************

	{"label","MASD1"},
	{"ns","Well, hello again!  I assume Stan, your CEO, briefed you on our latest crisis.  As if we needed more trouble in our time of need! At any rate, I wish you the best of luck with your investigation.  If you’ll excuse me, I have work that I must attend to.","VS_T3PXM1_01.ogg"},
	{"pg","I am sorry for the intrusion, Your Honor.  I am off to resume my investigation.","END"},

--******************
--MAYOR SUSPECT
--******************

	{"label","M1"},
	{"fun3",setvar,"scoreconvo","m1"},
	{"ns","It’s always nice to see you again, but don’t you have an investigation to conduct?  We need to get to the bottom of this scheme before our relief and recovery effort is jeopardized – so you should get back to work immediately.","VS_T3PXM1_02.ogg"},
	{"pgs","Enough of these shenanigans, your Honor.  I think it is you who has been siphoning funds from the recovery! ","M2","a"},
	{"pg","Excuse the interruption, I was actually only passing through.  ","END"},	

	{"label","M2"},
	{"ns","Oh my!  You think I am behind this fraudulent scheme?  I admire your inventiveness – after all no one is above the law – especially our public officials!  However, I believe your presumption is based on a misunderstanding.  Are you sure that the clues you found indicate I am the culprit?","VS_T3PXM1_03.ogg"},
	{"pgs","Yes, Ms. Mayor, I believe that you are behind this fraud!","M3","b"},
	{"pg","No, Ms. Mayor.  I am greatly mistaken.  Please pardon the intrusion. ","END"},

	{"label","M3"},
	{"fun",incsheriff},
	{"fun",incsheriff},
	{"fun",incmayor},
	{"ns","Your enthusiasm is laudable, but you have made a grave mistake. I distribute official credentials to volunteers, so how could I be responsible? Does Stan know that you came here to have me arrested for this?  I am calling him now to tell him about this outrage! Now please leave, immediately!","VS_T3PXM1_04.ogg"},
	{"pg","My apologies, Ms. Mayor.  I am off to find our culprit.","END"},

--******************
--TRIED TO ARREST MAYOR
--******************
	
	{"label","MATD1"},
	{"ns","Your conduct has been shameful – but I am willing to overlook the shortcomings of your performance if you find the party responsible for all this.  Now get back to your investigation – and get out of my sight!","VS_T3PXM1_05.ogg"},
	{"pg","Sorry for the interruption, Ms Mayor.  I am on my way to find the culprit.","END"},

--******************
--TRIED TO ARREST MAYOR AND ARRESTED VENDOR
--******************
	
	{"label","MATD2"},
	{"ns","Oh, it’s you.  I am relieved to hear you’ve made an arrest and that this ordeal is finally over.  It’s just a pity you didn’t reach this conclusion earlier! As promised, I am willing to overlook your gross incompetence – and I won’t have you arrested.  Thank you for your service, and good day!","VS_T3PXM1_07.ogg"},
	{"pg","I’m glad I could help, and I am sorry about the misunderstanding. Goodbye.","END"},

--******************
--ARRESTED VENDOR
--******************
	
	{"label","MATD3"},
	{"ns","Well, I’m happy to see you again!  Congratulations on your investigation.  I heard you made an arrest!  Hopefully, you arrested the right suspect so that our relief and recovery effort can proceed as planned.  I would like to thank you for your service. We are honored to have had you aboard!","VS_T3PXM1_08.ogg"},
	{"pg","Well, I am happy to have helped, your honor.  Thank you for your kind thoughts.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
