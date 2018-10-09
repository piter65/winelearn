local dialogtext = {
{"if","l2w2progress","==",0,"ASD1"},
{"if","l2w2progress","==",1,"1"},
{"if","l2w2progress","==",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","I hope I have been of service to your investigation.  Are you in any need of further assistance, then?","VS_T3P3L2B_02.ogg"},
    {"pg","There have been reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to accept donations on behalf of the recovery effort?","3"},
    {"pg","No, that’ll be all, Marcos.  Thanks again for your support. ","END"},

--l2W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl2w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc3"},
    {"ns","Hello, my name is Marcos Mendes! Welcome to Lindo Equipment. Feel free to look around – but due to the recent disaster, we are not selling to the general public this week. We have volunteered to accept contributions, though, if you care to donate.","VS_T3P3L2B_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Are you really?  May I ask who signed you up to accept donations on behalf of the recovery effort?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Someone has been diverting relief funds away from the recovery effort?  Why that is disgraceful! If it isn’t too much trouble, may I ask that you have a look at my credentials and tell me if they are legitimate, or not?","VS_T3P3L2B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here is my volunteer badge, then. What is your assessment?","VS_T3P3L2B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w2progress",">",2,"2BNOSCORE"},
    {"fun",incl2w2},
    {"ns","You are handed a badge with the following serial number: DTTC192644490","null.wav"},
    {"pgs","I think these credentials are legitimate.","2D","a"}, --GM+
    {"pgs","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the following serial number: DTTC192644490","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Are you telling me I fell for a scam, and I have been unwittingly diverting funds? That is the kind of corruption I’d expect from a Mesoamerican junta – not a resident of New City! I am gravely disappointed!","VS_T3P3L2B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","You bet your burritos these credentials are legitimate! Do you think I would be party to such corruption? I am a legitimate businessman! ","VS_T3P3L2B_06.ogg"},
    {"pg","Of course not. Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w2obj"},
	{"fun",incwp4},
    {"ns","Look, I’d really like to help, but I did not recognize who signed me up because I was on a ladder, taking inventory at the time.  However, I do remember that she would not stop talking about the upcoming summer blockbuster movies. Hopefully that helps!","VS_T3P3L2B_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere...","1B"},

{"label","3B"},
    {"ns","Like I said earlier, I was taking inventory up on a ladder the time, so I didn’t get a good look at who gave me the badge.  However, I remember she kept talking about the upcoming summer blockbuster movies.","VS_T3P3L2B_08.ogg"},
    {"pg","Yes, you mentioned something about blockbuster movies.  I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
