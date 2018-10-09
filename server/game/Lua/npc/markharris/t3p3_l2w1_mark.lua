local dialogtext = {
{"if","l2w1progress","==",0,"ASD1"},
{"if","l2w1progress","==",1,"1"},
{"if","l2w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","I hope I can be of further assistance to your investigation.  What else would you like to know?","VS_T3P3L2A_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","That’ll be all.  Thanks again for your support. ","END"},


--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"goto","1_inc"},   -- pa

{"label","1_inc"},      -- pa

{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},    -- Peter was here



{"label","1A"},
	{"fun",incl2w1},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc2"},
    {"ns","Well, hello there.  Are you here looking for help with home repairs, or would you like to make a donation to the New City relief and recovery effort?  Not only am I a card-carrying fix-it man – I am also certified to accept donations.","VS_T3P3L2A_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Are you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","A fraudulent scheme to defraud the relief and recovery effort?  Well, I am interested in fixing things – not breaking them!  If I gave you my credentials, would you be able to tell if they are legitimate or not?","VS_T3P3L2A_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Well, here you go, then.  Have a look at my badge, and please tell me what you think.","VS_T3P3L2A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w1progress",">",2,"2BNOSCORE"},
    {"fun",incl2w1},
    {"ns","You are hand a badge with the the following serial number: TAX192638870","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are hand a badge with the the following serial number: TAX192638870","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would take advantage of us all during our time of need.  What kind of idle ne’er-do-well would do such a thing! And to think I am somehow involved!","VS_T3P3L2A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well of course, these credentials are as real as you or I!  I would never be taken in by a scam. What do you think, I was born last year?","VS_T3P3L2A_06.ogg"},
    {"pg","Of course not. Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w1obj"},
	{"fun",incwp3},
    {"ns","Look, I didn’t recognize who gave me these credentials – I was more focused on finding a job application.  But on their way out, they did mention something about trying to track down an overdue book.  I hope that helps!","VS_T3P3L2A_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere...","1B"},

{"label","3B"},
    {"ns","Like I said earlier, I was more interested in applying for a job here, so I didn’t pay attention to who gave me these credentials. But on their way out, they did mention something about trying to track down an overdue book. ","VS_T3P3L2A_08.ogg"},
    {"pg","Yes, you mentioned something about an overdue book. I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
