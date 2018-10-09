local dialogtext = {
{"if","playernum","~=",2,"ASD1"},
{"if","l1rprogress","==",0,"ASD1"},
{"if","l1rprogress","==",1,"1"},
{"if","l1rprogress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","Well, I hope I’ve helped you with your investigation.  If you like, you can come by later and I’ll give you a full reading. Is there anything else you’d like to know?","VS_T3P2L1C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them themselves! May I look at the badge you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","I was just passing through.  Thanks again for your support. ","END"},

--L1W MEETING 1--
{"label","1"},
{"if","standonprogress",">",3,"1A"},
{"fun",incstandon},
{"fun",incevelyn},

{"label","1A"},
	{"fun",incl1r},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l1npc1"},
    {"ns","Well, hello there! Are you looking for a table? They aren’t seating right now. I can sense a meal isn’t in your stars today! But, you can still make a difference and volunteer for the relief effort, like I did!","VS_T3P2L1C_01.ogg"},
    {"pg","Really? Did you get a badge of some sort? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","Did you really?  May I ask who asked you to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? What kind of scam artist would do such a thing?  I hope the volunteer who signed me up was legitimate! If I gave you my badge, could you tell me if it actually comes from the City or not? ","VS_T3P2L1C_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here it is. Have a look at it and tell me, do you think it’s legitimate? ","VS_T3P2L1C_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1rprogress",">",2,"2BNOSCORE"},
    {"fun",incl1r},
    {"ns","You are handed a badge with the the following serial number: TSAE197639380","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM-
    {"pgs","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM+
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: TSAE197639380","null.wav"},
    {"pg","I think these credentials look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would actually profit from an environmental disaster!  I should have seen that in the tea leaves this morning.","VS_T3P2L1C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course it’s legitimate!  I would never participate in any sort of scam!  Certainly you don’t think I am a con artist!?","VS_T3P2L1C_06.ogg"},
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
	{"fun3",setvar,"pamphlet",true},
	{"fun3",setvar,"journalprogress",5},
    {"ns","Look, I’d really like to help, but I didn’t recognize who gave it to me because I was concentrating on the star chart I was doing for Roseanne earlier.  Oh, but here -- they did drop a pamphlet extolling the virtues of local civic involvement on their way out. Here, take it.","VS_T3P2L1C_07.ogg"},
    {"pg","Thanks. I’ll examine this pamphlet  and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I didn’t recognize the person who signed me up, as I said before. They solicited donations from everyone here but I was really concentrating on the star chart I was preparing at the time.  But, like I said they did drop that pamphlet I gave you earlier. ","VS_T3P2L1C_08.ogg"},
    {"pg","Yes, you gave me that pamphlet earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
