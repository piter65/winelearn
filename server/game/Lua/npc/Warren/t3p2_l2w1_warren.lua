local dialogtext = {
{"if","l2w1progress","==",0,"ASD1"},
{"if","l2w1progress","==",1,"1"},
{"if","l2w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","I hope I can be of further assistance to your investigation.  What else would you like to know?","VS_T3P2L2A_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","That’ll be all.  Thanks again for your support. ","END"},



--L2W MEETING 1--  PETER APPROVED!
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"goto","1_inc"},   -- pa

{"label","1_inc"},      -- pa

{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},    -- Peter was here

-- END OF PETER APPROVAL



{"label","1A"},
	{"fun",incl2w1},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc2"},
    {"ns","Well, hello there.  Are you here to make a donation to the New City relief and recovery effort?  Not only am I a card-carrying paramilitary operative – I am also certified to accept donations, you know.","VS_T3P2L2A_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Are you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","A scheme to siphon support from the relief and recovery effort?  What a flagrant assault against our City! I hope I wasn’t tricked into participating!  Actually, if I gave you my credentials, would you be able to tell if they are legitimate or not?","VS_T3P2L2A_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Well, here you go, then.  Have a look at my badge, and please tell me what you think.","VS_T3P2L2A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w1progress",">",2,"2BNOSCORE"},
    {"fun",incl2w1},
    {"ns","You are handed a badge with the following serial number: TAX192638870","null.wav"},
    {"pgs","I think these credentials  look legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the following serial number: TAX192638870","null.wav"},
    {"pg","I think these credentials look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can not believe someone would try and profit from such a disaster – and that I am implicated!  I consider that an act of aggression – and I am going to stop soliciting donations immediately.","VS_T3P2L2A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well of course these credentials are legitimate! I would never be fooled into supporting a misguided cause!  I’m not some sort of  domestic terrorist, you know.","VS_T3P2L2A_06.ogg"},
    {"pg","Of course not. Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w1obj"},
	{"fun",incwp3},
    {"ns","Look, I didn’t recognize who gave me these credentials - my glasses are way too dark for me to see anything in here!  But on their way out, they did mention something about the Dewey decimal system. I hope that helps you!","VS_T3P2L2A_07.ogg"},
    {"pg","Thanks. I’ll see if I can figure out what the Dewey decimal system means.","1B"},

{"label","3B"},
    {"ns","Like I said earlier, my glasses are way too dark for me to see anything in here so I didn’t recognize who gave me these credentials. But on their way out, they did mention something about the Dewey decimal system. ","VS_T3P2L2A_08.ogg"},
    {"pg","Yes, you mentioned something about the Dewey decimals.  I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
