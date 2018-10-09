local dialogtext = {
{"if","l2w2progress","==",0,"ASD1"},
{"if","l2w2progress","==",1,"1"},
{"if","l2w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","I hope I have been of service to your investigation, recruit.  Do you have any other standing orders to which I may lend my assistance?","VS_T3P2L2B_02.ogg"},
    {"pg","I am actually investigating reports that someone has fraudulently been soliciting donations for the relief efforts and keeping them for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","No, that’ll be all, Terrell.  Thanks again for your support. ","END"},

--l2W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl2w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc3"},
    {"ns","Well, hello, recruit! Welcome to National Readiness Services. Are you here to earmark funds for the ongoing relief and recovery operation? Here at National Readiness, we are certified to receive appropriations!","VS_T3P2L2B_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations.","2A"},
    {"pg","Are you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","A fraudulent scheme to divert donations?  Why that is disgraceful! If I may ask, could you inspect my credentials and report if you find anything suspicious?","VS_T3P2L2B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here is my volunteer badge, then, recruit.  What is your assessment?","VS_T3P2L2B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w2progress",">",2,"2BNOSCORE"},
    {"fun",incl2w2},
    {"ns","You are handed a badge with the following serial number: AERS192687750","null.wav"},
    {"pgs","I think these credentials are legitimate.","2D","a"}, --GM+
    {"pgs","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the following serial number: AERS192687750","null.wav"},
    {"pg","I think these credentials look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Are you telling me I fell for a decoy – and that I have unwittingly abetted insurgent activity? What kind of maniac would pursue such an objective! I am gravely disappointed!","VS_T3P2L2B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","You bet your bayonet these credentials are legitimate! Do you think I would profiteer in our time of need? I would never display such hubris!","VS_T3P2L2B_06.ogg"},
    {"pg","Of course not, Terrell.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w2obj"},
	{"fun",incwp4},
    {"ns","Look, I’d really like to help, but I didn’t recognize who signed me up because I was face-down, doing push ups at the time.  As she dismissed herself, however, she did mention that she had to make another bushel of buttered popcorn. Hopefully this helps!","VS_T3P2L2B_07.ogg"},
    {"pg","Thanks. I’ll look into someone who makes popcorn.  I will see where I can find out about that.","1B"},

{"label","3B"},
    {"ns","Like I said earlier, I was doing push-ups at the time, so I didn’t get a good look at the face of the person who gave me the badge.  She did declare she had to make another bushel of popcorn before she dismissed herself","VS_T3P2L2B_08.ogg"},
    {"pg","Yes, you mentioned something about making popcorn.  I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
