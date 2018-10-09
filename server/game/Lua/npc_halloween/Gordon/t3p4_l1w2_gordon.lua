local dialogtext = {

{"if","l1w2progress","==",0,"ASD1"},
{"if","l1w2progress","==",1,"1"},
{"if","l1w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","I hope I’ve helped your investigation.  Is there anything else you’d like to know? I think I should probably get going and try to see if I can help out at the waterfront.  ","VS_T3P4L1B_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! May I look at your credentials?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","That will be all. Thanks again for your support. ","END"},

--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl1w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc3"},
    {"ns","Well, hello! Do I know you? My name is Gordon Hibbert.  It is a pleasure to meet you. Would you like to make a donation to the New City River relief and recovery effort on this fine day?","VS_T3P4L1B_01.ogg"},
    {"pg","Do you have credentials to accept donations? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","No, thanks.  But tell me who asked you to solicit donations for the recovery effort?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? That sits with me about as well as a two year old beef patty. Say, if I gave you the badge they gave me, could you tell me if it’s legitimate?","VS_T3P4L1B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Have a look, and take your time.  Does it look alright to you? ","VS_T3P4L1B_04.ogg"},
    {"wait","2B"},

{"label","2B"},x
    {"if","l1w2progress",">",2,"2BNOSCORE"},
    {"fun",incl1w2},
    {"ns","You are handed a badge with the the following serial number: TOW155944490","null.wav"},
    {"pgs","I think this badge looks legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don’t think this is a badge is legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: TOW155944490","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Oh, my! I can’t believe someone would illegally profit from an environmental disaster – and use me to do it!  I’ve seen some shady customers but that takes the cake!","VS_T3P4L1B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, everything is good  then. I sense that these credentials were as real as my desire to help New City! ","VS_T3P4L1B_06.ogg"},
    {"pg","I bet. At any rate, thank you for your support.","1B"},

{"label","3"},
	{"if","l1w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w2obj"},
	{"fun",incwp2},
-- {"label","cluetest"}, -- BChance: Merged this label with the above label so logic flows.
    {"fun3",setvar,"coldcuts",true},
    {"ns","I’d really like to help, but I am new in town and don’t know too many people here yet. I wouldn’t be able to tell you who signed me up. Oh, but they did drop these cold cuts on their way out. Do you want them? I’m a vegetarian.","VS_T3P4L1B_07.ogg"},
    {"pg","Yes, thanks. I’ll examine these cold cuts and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I didn’t recognize the person who signed me up. They collected applications from everyone here at the time, but like I said, I am new in town and don’t know too many people here yet. They did drop those cold cuts I gave you before, though. I hope they help! ","VS_T3P4L1B_08.ogg"},
    {"pg","Yes, you gave me those cold cuts earlier.  I will examine them and see if they lead me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
