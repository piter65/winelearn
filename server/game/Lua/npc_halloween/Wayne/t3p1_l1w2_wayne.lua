local dialogtext = {

{"if","l1w2progress","==",0,"ASD1"},
{"if","l1w2progress","==",1,"1"},
{"if","l1w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","I hope I’ve helped you with your investigation.  If you don’t mind, though, I’d really like to start providing the recovery effort with an elegant finish.  Is there anything else you’d like to know?","VS_T3P1L1B_02.ogg"},
    {"pg","I am actually investigating reports that someone has fraudulently been soliciting donations for the relief efforts and keeping them for themselves! May I look at the badge  you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer? ","3"},
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
    {"ns","Well, hello there! You’re with the Professional services team here in New City, right? I think I’ve seen you around town. You’ve inspired me to make more than a cosmetic difference around here -  I just gave a volunteer an application a moment ago so I can  now officially solicit donations for the recovery effort!","VS_T3P1L1B_01.ogg"},
    {"pg","Really? Did he give you a temporary badge or something? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","Did you really?  May I ask who the volunteer was that took your application?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? Well, that’s about as obnoxious as fake wood panelling!  I hope the volunteer who signed me up was legitimate! As a matter of fact, they did give me a temporary badge.  If I showed it to you, could you tell me if it’s real?","VS_T3P1L1B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Have a look, and take your time.  Then, tell me – is it the real thing?","VS_T3P1L1B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1w2progress",">",2,"2BNOSCORE"},
    {"fun",incl1w2},
    {"ns","You are handed a badge with the the following serial number: TAX192638870","null.wav"},
    {"pgs","I think this badge looks legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: TAX192638870","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"}, 
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would illegally profit from an environmental disaster!  What a shame!  And to think I would be used for such a distasteful endeavor!","VS_T3P1L1B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course it’s legitimate!  I would never let anyone lean on me like that. ","VS_T3P1L1B_06.ogg"},
    {"pg","Of course.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l1w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w2obj"},
	{"fun",incwp2},
-- {"label","cluetest"}, -- BChance: Merged this label with the above label so logic flows.
    {"fun3",setvar,"cleaver",true},
    {"ns","Look, I’d really like to help, but I didn’t recognize who signed me up. Oh, but here -- they did drop this dull meat cleaver on their way out. Hopefully this helps!","VS_T3P1L1B_07.ogg"},
    {"pg","Thanks. I’ll examine this dull meat cleaver and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I didn’t recognize the person who signed me up  They collected applications from everyone who was here at the time, but like I said earlier, they did drop that dull meat cleaver I gave you before, though.  I hope that helps!","VS_T3P1L1B_08.ogg"},
    {"pg","Yes, you gave me that dull meat cleaver earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
