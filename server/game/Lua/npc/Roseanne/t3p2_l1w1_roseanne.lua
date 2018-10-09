local dialogtext = {


{"if","l1w1progress","==",0,"ASD1"},
{"if","l1w1progress","==",1,"1"},
{"if","l1w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","I can only hope I've paid my debt of gratitude to the City in its time of great need.  Is there anything else that you'd like to know?","VS_T3P2L1A_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them themselves! May I look at the badge you were given?","2A"},
    {"pg","Do you mind if I ask who solicited your services?","3"},
    {"pg","No, I was just passing through.  Thanks again for your support. ","END"},


--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"goto","1_inc"},   -- pa

{"label","1_inc"},      -- pa


{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},    -- Peter was here


{"label","1A"},
	{"fun",incl1w1},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc2"},
    {"ns","Hello there! Welcome to Buona Fortuna. I am Roseanne Bellagiorno. If you are looking for a meal, though, you're out of luck. We aren't seating at the moment because we are busy cooking our homestyle continental cuisine to feed the relief and recovery workers!  I just gave a volunteer an application a moment ago so I can  now officially solicit donations for the recovery effort!","VS_T3P2L1A_01.ogg"},
    {"pg","Really? Do you mind if I have a look at the credentials you were given? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","That's quite honorable.    May I ask who recruited you to offer your services to the recovery effort?","3"},
    {"pg","Well, the City is grateful for your asupport.  Thanks!","END"},

{"label","2A"},
    {"ns","A scheme to defraud the relief effort? Oh, my.  Well that's as bad as a two-week old fish risotto – so I am all too willing to help your investigation! Say, if I gave you my volunteer certificate , would you be able to tell me if it is legitimate?","VS_T3P2L1A_03.ogg"},
    {"pg","Sure.  I'll let you know what I think.","2"},

{"label","2"},
    {"ns","Here it is.  Take a look at it, and take your time.  But please tell me if you think it's authentic.","VS_T3P2L1A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"ns","You are handed a badge with the following serial number: DTTC192644490","null.wav"},
    {"if","l1w1progress",">",2,"2BNOSCORE"},
    {"fun",incl1w1},
    {"pgs","I think this badge looks legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code looks funny to me.  I don't think this is a legitimate badge. ","2C","b"}, --GM-
    {"pgs","I can't tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"pg","I think these credentials look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don't think it's legitimate. ","2C"}, 
    {"pg","I can't tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can't believe someone would illegally profit from an environmental disaster!  And, that they would use me of all people in their ploy! ","VS_T3P2L1A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, I should hope they are legitimate! Otherwise, I won't be able to concentrate on making my special pasta for the voluteers.","VS_T3P2L1A_06.ogg"},
    {"pg","Of course.  Well thank you for your support.","1B"},

{"label","3"},

	{"if","l1w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1w1obj"},
	{"fun",incwp1},
    {"goto","cluetest"},    -- Peter was here

{"label","cluetest"},
{"fun3",setvar,"mustard",true},
    {"ns","I didn't recognize the person who dropped it off because I was busy chopping garlic and my eyes were watering. But, they did drop this bottle of yellow mustard on their way out.  Here, take it - I hope it helps! ","VS_T3P2L1A_07.ogg"},
    {"pg","Thanks. I'll examine this bottle of yellow mustard and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I mentioned that I didn't recognize the person who dropped it off because I was busy chopping garlic and my eyes were watering.  But, like I said they, did drop that bottle of yellow mustard I gave you earlier on their way out. ","VS_T3P2L1A_08.ogg"},
    {"pg","Yes, you gave me that bottle of yellow mustard earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
