local dialogtext = {
{"if","playernum","~=",1,"ASD1"},
{"if","l1rprogress","==",0,"ASD1"},
{"if","l1rprogress","==",1,"1"},
{"if","l1rprogress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--L1W MEETING 2--
{"label","1B"},
    {"ns","Well, I hope I’ve helped you with your investigation.  Is there anything else you’d like to know?","VS_T3P1L1C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping the money for themselves! May I look at the badge you were given?","2A"},
    {"pg","Do you mind if I ask who asked you to solicit donations?","3"},
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
    {"ns","Well, hello there! Are you here to help Luisa cook for the volunteers?  That’s so sweet of you. You remind me of my son! He’s such a nice boy. I just signed up myself to solicit donations for the recovery effort!","VS_T3P1L1C_01.ogg"},
    {"pg","Really? Did they give you a temporary badge of some sort? Apparently, someone has been soliciting donations and keeping them for themselves!","2A"},
    {"pg","Did you really?  Who asked you to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Fraudulently collecting donations? Well, I am sure my son would like to see those people in a mosh pit!  I hope the volunteer who signed me up was legitimate! If I gave you the temporary badge they gave me, could you tell me if my badge is legitimate? ","VS_T3P1L1C_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Here it is. Have a look at it and tell me, do you think it’s legitimate?","VS_T3P1L1C_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l1rprogress",">",2,"2BNOSCORE"},
    {"fun",incl1r},
    {"ns","@@","null.wav"},
    {"pgs","I think this badge looks legitimate.","2C","a"}, --GM-
    {"pgs","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2D","b"}, --GM+
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","@@","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","I can’t believe someone would actually profit from an environmental disaster – and that I fell into their trap!  Now that’s about as frightening as some of my son’s punk rock records.","VS_T3P1L1C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course it’s legitimate!  I would never participate in anything illegitimate!  Is there anything about me that seems unwholesome?","VS_T3P1L1C_06.ogg"},
    {"pg","Of course not.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l1robj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l1robj"},
	{"fun",incl2w1},
	{"fun",incl2w2},
	{"fun",incl2r},
	{"fun",incevelyn},
	{"fun",incedt},
	{"fun3",setvar,"shorttrap",1},
	{"fun3",setvar,"tiedyeshirt",true},
    {"ns","Look, I’d really like to help, but I didn’t recognize who gave me the badge but here -- they did drop this tie-dyed t-shirt on their way out. Hopefully this helps!","VS_T3P1L1C_07.ogg"},
    {"pg","Thanks. I’ll examine this tie-dyed shirt and see if it leads me to something productive.","1B"},

{"label","3B"},
    {"ns","I didn’t recognize the person who signed me up, as I said before. They solicited donations from everyone here but  like I said, they did drop that tie-dyed t-shirt I gave you earlier. ","VS_T3P1L1C_08.ogg"},
    {"pg","Yes, you gave me that tie-dyed t-shirt earlier.  I will examine it and see if it leads me anywhere. Thanks for that!","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
