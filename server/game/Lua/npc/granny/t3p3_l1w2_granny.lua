local dialogtext = {

{"if","l1w2progress","==",0,"ASD1"},
{"if","l1w2progress","==",1,"1"},
{"if","l1w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","So where were we? Oh yes. I hope I’ve helped you with your investigation, youngster.  Is there anything else you’d like to know? If you don’t mind, though, I need to start working for the recovery right away. ","VS_T3P3L1B_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! May I look at the badge  you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","That will be all. Thanks again for your support. ","END"},

--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"goto","1_inc"},

{"label","1_inc"},      -- pa


{"fun",incstandon},
{"fun",incevelyn},

{"goto","1A"},


{"label","1A"},
	{"fun",incl1w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc3"},
    {"ns","Well, hello, yougster! Do I know you? Oh, not like I’d remember, anyway. At any rate, I should report to the waterfront for volunteer duty. They just approved my volunteer application a moment ago. Now, I can officially solicit donations for the recovery effort!","VS_T3P3L1B_01.ogg"},
    {"pg","Really? Did they give you a temporary badge or something? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","Did they really?  May I ask who the volunteer was that took your application?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? Well, times sure have changed.  In the good old days, towns like ours were never held hostage by bands of thieves!  Say, youngster, if I gave you the temporary badge they gave me, could you tell me if it’s legitimate?","VS_T3P3L1B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Have a look, and take your time.  Then, tell me – does it look right to you? ","VS_T3P3L1B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1w2progress",">",2,"2BNOSCORE"},
    {"fun",incl1w2},
    {"n","You are handed a badge with the following serial number: FAS192639380"},
    {"pgs","I think this badge looks legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don’t think this badge is legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"n","You are handed a badge with the following serial number: FAS192639380"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Oh, my! I can’t believe someone would illegally profit from an environmental disaster – and use me to do it!  That’s the trouble with people these days! They have no standards.  How shameful.","VS_T3P3L1B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Oh, what did you say? Oh, yes - of course it’s legitimate!  Do I look like the kind of person people can just take advantage of?","VS_T3P3L1B_06.ogg"},
    {"pg","Of course not, Ms. Smith – and thank you for your support.","1B"},

{"label","3"},
	{"if","l1w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w2obj"},
	{"fun",incwp2},
-- {"label","cluetest"}, -- BChance: Merged this label with the above label so logic flows.
    {"fun3",setvar,"beef",true},
    {"ns","I’d really like to help, but I have a really hard time seeing. I wouldn’t be able to tell you who signed me up. Oh, but they did drop this side of beef on their way out. I was going to throw it in the trash later. Do you want it?","VS_T3P3L1B_07.ogg"},
    {"pg","Yes, thanks. I’ll examine this side of beef and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I didn’t recognize the person who signed me up. They collected applications from everyone here at the time, but like I said, I have a hard time seeing anything these days. They did drop that side of beef I gave you before, though.  I hope that helps! ","VS_T3P3L1B_08.ogg"},
    {"pg","Yes, you gave me that side of beef earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
