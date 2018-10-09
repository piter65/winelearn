local dialogtext = {
{"if","l2w2progress","==",0,"ASD1"},
{"if","l2w2progress","==",1,"1"},
{"if","l2w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","So like, is that all, or would you like to donate to the City’s relief and recovery effort?","VS_T3P1L2B_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief effort and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer to accept donations?","3"},
    {"pg","No, that’s it for now.  Thanks again for your support. ","END"},

--l2W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl2w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc3"},
    {"ns","Like, hey there! Welcome to Needles & Threads!  My name is Allison Rigby.  Just so you know, nothing is for sale this week. We have decided to join in solidarity with our river and we’ve volunteered to collect donations for the relief and recovery effort!","VS_T3P1L2B_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Did you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Whoa, that’s like, a total bummer! Who would do something like that? Wait…if I give you my badge, can you tell me if my credentials are legitimate? Boy, I really hope I haven’t been participating in anything illegal.","VS_T3P1L2B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Well, here you go then.  What do you think?","VS_T3P1L2B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w2progress",">",2,"2BNOSCORE"},
    {"fun",incl2w2},
    {"ns","You are hand a badge with the the following serial number: DTTC192644490","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM+
    {"pgs","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are hand a badge with the the following serial number: DTTC192644490","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Whoa! Are you serious?  I was duped into helping someone profit illegally from this disaster? Who would do such a thing? This is like, totally shameful. ","VS_T3P1L2B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course!  You bet your embroidered britches my credentials are legitimate! No one could ever fool me, man.","VS_T3P1L2B_06.ogg"},
    {"pg","Clearly that is true.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w2obj"},
	{"fun",incwp4},
    {"ns","Like,  I’ll be honest – I really don’t  remember who gave me my credentials because my short term memory is like totally gone.  But, I do recall someone saying something about having to hurry back and change the reel on a movie projector.","VS_T3P1L2B_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere.","1B"},

{"label","3B"},
    {"ns","I really don’t remember who gave me my credentials because my short term memory is like totally gone. Like I said earlier, I do recall someone saying something about having to hurry back and change the reel on a movie projector.","VS_T3P1L2B_08.ogg"},
    {"pg","Yes, you mentioned something about a movie projector.  I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
