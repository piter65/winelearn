local dialogtext = {
{"if","playernum","~=",3,"ASD1"},
{"if","l1rprogress","==",0,"ASD1"},
{"if","l1rprogress","==",1,"1"},
{"if","l1rprogress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","Well, I hope I've helped you with your investigation.  Is there anything else you'd like to know? I should probably get going and start doing volunteer work for the recovery effort, man, but I just can't seem to get motivated.  ","VS_T3P3L1C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the badge you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","Well, that's it for now.  Thanks again for your support. ","END"},

--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl1r},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc1"},
    {"ns","Like, hey man! They aren't serving sandwiches right now. Isn't that a bummer? There aren't many vegetarian options in town. Anyway, I probably shouldn't be standing around right now, cuz like, I volunteered for the recovery effort.  I should be out, like, soliciting donations or something, man.","VS_T3P3L1C_01.ogg"},
    {"pg","Really? Did you get a badge of some sort? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","Oh really?  You've volunteered for the relief and recovery effort? Who signed you up?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? What kind of lazy, no-good freeloader would do a thing like that, man?  I hope the volunteer who signed me up was legitimate! If I gave you my badge, could you tell me if it actually comes from the City or not? ","VS_T3P3L1C_03.ogg"},
    {"pg","Sure.  I'll let you know what I think.","2"},

{"label","2"},
    {"ns","Then, like, here it is, man. Have a look and tell me what you think.","VS_T3P3L1C_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"ns","You are hand a badge with the the following serial number: TOW155944490","null.wav"},
    {"pgs","I think this badge looks legitimate.","2D","a"}, --GM-
    {"pgs","That volunteer identification code looks funny to me.  I don't think this is a legitimate badge. ","2C","b"}, --GM+
    {"pgs","I can't tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are hand a badge with the the following serial number: TOW155944490","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don't think this is a legitimate badge. ","2C"},
    {"pg","I can't tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can't believe someone would actually profit from an environmental disaster!  And like I am part of their evil ploy! I should have seen that one comin' man. ","VS_T3P3L1C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course it's legitimate!  I would never participate in any sort of scam!  You don't think I am some sort of scrounger, do you?","VS_T3P3L1C_06.ogg"},
    {"pg","Of course not.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l1robj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1robj"},
	{"fun",incl2w1},
	{"fun",incl2w2},
	{"fun",incl2r},
	{"fun3",setvar,"ett",1},
	{"fun3",setvar,"etttrap",1},
	{"fun3",setvar,"startermotor",true},
	{"fun3",setvar,"journalprogress",5},
    {"ns","Look, I'd really like to help, but I don't remember who signed me up because I have a totally terrible short term memory.  Oh, but here -- they did drop a starter motor for a portable generator as they were leaving. Here, take it.","VS_T3P3L1C_07.ogg"},
    {"pg","Thanks. I'll examine this starter motor and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I don't remember the person who signed me up, as I said before. They solicited donations from everyone here but I have a terrible short term memory, and I really have a hard time with names.  But, like I said they did drop that starter motor I gave you earlier. ","VS_T3P3L1C_08.ogg"},
    {"pg","Yes, you gave me that starter motor for a portable power generator earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
