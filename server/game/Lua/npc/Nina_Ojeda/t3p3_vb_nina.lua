local dialogtext = {

{"if","vendor2progress","==",0,"VBASD"},
{"if","vendor2progress","==",1,"VB1"},
{"if","vendor2progress","==",2,"VBATD"},
{"if","vendor2progress","==",3,"VBATD2"},
{"if","vendor2progress",">=",4,"VJAIL"},

--****************
--Peter's adding in a jail dialog
--****************

	{"label","VJAIL"},
	{"ns","I will never speak to you again!","null.wav"},
	{"pg","Fine with me.","END"},

--****************
--NEED TO TALK TO L2R
--****************

	{"label","VBASD"},
	{"ns","Can I help you with anything?","null.wav"},
	{"pg","No thanks.","END"},

--*************
--FIRST MEETING
--*************

	{"label","VB1"},
	{"ns","Welcome to Narravi Associates! My name is Nina Ojeda.  Are you here looking for a media relations specialist?","VS_T3P3VB1_01.ogg"},
	{"pg","I’m investigating a fraudulent scheme to divert funds from the City’s recovery effort. I believe a local media relations consultant is behind it. Would you mind answering a few questions?","VB2"},
	{"pg","Hello, Nina. I was just passing through - sorry to trouble you.","END"},

	--Questions
	{"label","VB2"},
	{"fun",incvendor2},
	{"ns","There are people in town fraudulently soliciting donations – and keeping the money for themselves?  That’s not going to look good in the media. I would be happy to assist you in your investigation, if you feel I can be of any help.  What would you like to know?","VS_T3P3VB1_02.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call ‘rules’ – or the sets of morals, values and beliefs -- that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},

	{"label","VB3"},
	{"ns","Okay, I think I know this one. That’s called a business.","VS_T3P3VB1_03.ogg"},
	{"pg","Okay, I see.  Let’s continue then, shall we?","VB7"},
	{"pg","Is that a fact? I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB4"},
	{"ns","I’m pretty sure I know that!  Those rules are called ethical principles. ","VS_T3P3VB1_04.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that the way you see it? I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB5"},
	{"ns","That’s a tricky question – but I think that’s known as decision-making.","VS_T3P3VB1_05.ogg"},
	{"pg","Okay, I see.  Let’s move on.","VB7"},
	{"pg","Is that so?   I think I need to call in backup and have you arrested.","VB6"},

	{"label","VB6"},
	{"ns","I think that you are making a grave public relations error – because I would never do such a thing. I’m a press woman, not a penal offender! You’re making a big mistake! Are you sure you want to arrest me?","VS_T3P3VB1_06.ogg"},
	{"pg","You’re the one making a mistake, criminal!  Willie, take this woman away!","VBARREST"},
	{"pg","You may be right.  I’m going to go check my facts…but I may be back – so I’d appreciate it if you didn’t leave town!","END"},

	--More questions
	{"label","VB7"},
	{"ns","Well, I am all too happy to make sure the City’s image is upheld despite this crisis.  I hope that my answers can be of use to your investigation!  Is there anything else you would like to know?","VS_T3P3VB1_07.ogg"},
	{"pg","What is another name for an organization formed to perform services or sell goods in order to make a profit for its owners?","VB3"},
	{"pg","What would you call rules’– or sets of morals, values and beliefs -- that help guide decisions?","VB4"},
	{"pg","What do you call the act of selecting from various alternatives based on the economic impact of the trade-offs involved?","VB5"},
	{"pg","I’ve got everything I need for now, but I may be back later to talk to you again.  In the meantime, I’d appreciate it if you didn’t leave town.","END"},

	{"label","VBARREST"},
	{"fun",pickedvendor2},
	{"fun",foundcrim},	
	{"fun",incevelyn},
	{"fun",incstandon},
	{"fun2",arrestme,"vendor2progress"},
	{"fun",incceostate},
	{"goto","END"},




--****************
--ALREADY TALKED
--****************

	{"label","VBATD"},
	{"ns","Welcome back!  Are you here to continue your investigation, or are you here for media advice?  I’m sure the coverage is going to get messy– and soon…","VS_T3P3VB1_08.ogg"},
	{"pg","Maybe some other time, if you don’t mind, I’d like to ask you some questions again.","VB7"},
	{"pg","Actually, I have come because I believe you are responsible for all of this. Willie, arrest this woman!","VB6"},

--*****************
--ARRESTED SOMEONE
--*****************
	{"label","VBATD2"},
    	{"n","I heard they found the person fraudulently solociting donations."},
    	{"pg","Yes. Justice is served.","END"},

--*************
--END
--*************

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
