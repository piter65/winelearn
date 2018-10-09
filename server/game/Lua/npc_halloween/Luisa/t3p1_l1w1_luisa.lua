local dialogtext = {

{"if","l1w1progress","==",0,"ASD1"},
{"if","l1w1progress","==",1,"1"},
{"if","l1w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","I can only hope I’ve paid my debt of gratitude to the City in its time of great need.  Is there anything else that you’d like to know?","VS_T3P1L1A_02.ogg"},
    {"pg","Actually, I’m investigating reports that someone has  been soliciting donations for the relief efforts and keeping the money for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Who asked you to volunteer?","3"},
    {"pg","No, that will be all.  Thanks again for your support. ","END"},

--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl1w1},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc2"},
    {"ns","Hello there! Welcome to Luisa’s kitchen.  We aren’t taking reservations at the moment, because we are busy preparing food for the relief and recovery effort! I only hope our Mesoamerican country cooking can make a difference. I also hope the relief workers like spicy food.","VS_T3P1L1A_01.ogg"},
    {"pg","Really? Do you mind if I have a look at the credentials you were given? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","That’s quite honorable.    May I ask who recruited you to offer your services to the recovery effort?","3"},
    {"pg","Well, the City is grateful for your support.  Thanks!","END"},

{"label","2A"},
    {"ns","A scheme to defraud the relief effort? Oh, my.  Well that sits as well with me as our spicy red snapper on an empty stomach – I am willing to help your investigation! Say, if I gave you my volunteer certificate , would you be able to tell me if it is legitimate?","VS_T3P1L1A_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here it is.  Take a look at it, and let me know what you think.","VS_T3P1L1A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1w1progress",">",2,"2BNOSCORE"},
    {"fun",incl1w1},
    {"ns","You are handed a badge with the the following serial number: AERS192687750","null.wav"},
    {"pgs","I  think these credentials are legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don’t think these are legitimate credentials. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: AERS192687750","null.wav"},
    {"pg","I  think these credentials are legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think these are legitimate credentials. ","2C"}, 
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would illegally profit from an environmental disaster!  What a shame!  What is this world coming to?","VS_T3P1L1A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, I should hope they are legitimate! Otherwise, I’d feel so guilty and when I feel guilty I get terrible indigestion.","VS_T3P1L1A_06.ogg"},
    {"pg","Of course.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l1w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w1obj"},
	{"fun",incwp1},
-- {"label","cluetest"}, -- BChance: Merged this label with the above label so logic flows.
    {"fun3",setvar,"hotdogbun",true},
    {"ns","To be honest, I didn’t recognize the person who dropped it off because I was slicing a habanero pepper – and I got some of it in my eye. But, they did drop this package of stale hotdog buns on their way out.  Here, take it - I hope it helps! ","VS_T3P1L1A_07.ogg"},
    {"pg","Thanks. I’ll examine this package of stale hot dog buns and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I mentioned that I didn’t recognize the person who dropped it off because I was slicing a habanero pepper, and got some in my eye.  But, like I said they, they did drop that package of stale hotdog buns I gave you on their way out. ","VS_T3P1L1A_08.ogg"},
    {"pg","Yes, you gave me that package of stale hot dogs earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
