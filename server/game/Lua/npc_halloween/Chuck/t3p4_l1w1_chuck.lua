local dialogtext = {

{"if","l1w1progress","==",0,"ASD1"},
{"if","l1w1progress","==",1,"1"},
{"if","l1w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","I’m at the City’s service, and if you’ll excuse me, I’ve got some game meat I gotta ground up for the meatloaf surprise. It’s our signature dish.  Is there anything else I can help you with in your investigation?","VS_T3P4L1A_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! Were you given some sort of certification?","2A"},
    {"pg","Do you mind if I ask who solicited your services for the relief effort?","3"},
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
    {"ns","Welcome to the Markdown Street Diner. I’m the owner, Chuck Wagner. You’ll have to forgive me our kitchen is closed to the general public right now. We’re busy working on a special order for the volunteers that are on their way to New City to help with the relief effort!","VS_T3P4L1A_01.ogg"},
    {"pg","Really? Do you mind if I have a look at the credentials you were given? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","That’s quite honorable.    May I ask who recruited you to offer your services to the recovery effort?","3"},
    {"pg","Well, the City is grateful for your support.  Thanks!","END"},

{"label","2A"},
    {"ns","A scheme to defraud the relief effort? Oh, my.  Well that is about as bad as sour coleslaw…and believe me, I would know.  I would like to help your investigation in any way I can.  Say,  if I gave you my certification, would you be able to tell me if it’s legit?","VS_T3P4L1A_03.ogg"},
    {"pg","Sure. I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here is my certification.  Take your time and let me know if you think it’s authentic.","VS_T3P4L1A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1w1progress",">",2,"2BNOSCORE"},
    {"fun",incl1w1},
    {"n","You are handed a badge with the the following serial number: TAX192638870"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don’t think these are legitimate credentials. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if these credentials are fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"n","You are handed a badge with the the following serial number: TAX192638870"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would use me in a scheme to illegally profit from an environmental disaster!  I just don’t have the stomach for this kind of felonious behavior!","VS_T3P4L1A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, you bet your brisket these credentials are legitimate! They’re as legit as anything on our menu – that’s for sure!","VS_T3P4L1A_06.ogg"},
    {"pg","I understand.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l1w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w1obj"},
	{"fun",incwp1},
-- {"label","cluetest"}, -- BChance: Merged this label with the above label so logic flows.
    {"fun3",setvar,"sauerkraut",true},
    {"ns","I wasn’t looking when the volunteer dropped it off because I was concentrating on making my meatloaf surprise for the relief effort.  They did leave this tub of sauerkraut on their way out though.  Here, take it - I don’t need it. I have my own.","VS_T3P4L1A_07.ogg"},
    {"pg","Thanks. I’ll examine this tub of sauerkraut and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","Look, I told you I wasn’t looking when the guy dropped it off because I had my hands full making six hundred servings of meatloaf surprise.  They did leave that tub of sauerkraut on their way out though.  I gave it to you earlier.","VS_T3P4L1A_08.ogg"},
    {"pg","Yes, you gave me that tub of sauerkraut earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
