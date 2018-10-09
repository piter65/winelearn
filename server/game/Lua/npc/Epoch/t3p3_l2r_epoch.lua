local dialogtext = {
{"if","l2rprogress","==",0,"ASD1"},
{"if","l2rprogress","==",1,"1"},
{"if","l2rprogress",">=",2,"1B"},
 
{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},
 
--l2W MEETING 2--
{"label","1B"},
    {"ns","So is that all you need to know? Or would you like to make a donation to the City’s relief and recovery effort?","VS_T3P3L2C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","No, that’ll be all.  Thanks again for your support. ","END"},
 

--L2W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"goto","1_inc"},   -- pa

{"label","1_inc"},      -- pa

{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},    -- Peter was here


{"label","1A"},
	{"fun",incl2r},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc1"},
    {"ns","Hey…you’re from the Professional Services team working on the oil spill, right?  I think I have seen you around. You know, you all inspired me to volunteer and solicit donations for the relief effort.","VS_T3P3L2C_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Did we really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},
 
{"label","2A"},
    {"ns","A scheme to divert donations? What kind of trickster would do such a thing? Wait…if I gave you my badge, could you tell me if my credentials are legitimate? ","VS_T3P3L2C_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},
 
{"label","2"},
    {"ns","Okay, here you go – take a look at my badge for me.  What do you think?","VS_T3P3L2C_04.ogg"},
    {"wait","2B"},
 
{"label","2B"},
    {"if","l2rprogress",">",2,"2BNOSCORE"},
    {"fun",incl2r},
    {"ns","You are handed a badge with the the following serial number: TOW155944490","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM-
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM+
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},
 
{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: TOW155944490","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Wait -  I was tricked into helping someone profit illegally from this disaster? Who would do something evil like that!? ","VS_T3P3L2C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},

 
{"label","2D"},
    {"ns","Well, of course these credentials are legitimate.  Otherwise, I would never have accepted them! I’m not some kind of jokester, you know.","VS_T3P3L2C_06.ogg"},
    {"pg","Of course.  Well thank you for your support.","1B"},
 
{"label","3"},
	{"if","l2robj","==",0,"3A"},
	{"goto","3B"},
 
{"label","3A"},
	{"fun2",gotclueobj,"l2robj"},
	{"fun",incedt},
	{"fun3",setvar,"shorttrap",1},
	{"fun",incvendor1},
	{"fun",incvendor2},
	{"fun",incvendor3},
	{"fun",incvendor4},
	{"fun3",setvar,"journalprogress",6},
    {"ns","I’d love to tell you who signed me up to volunteer, but I was composing a limerick at the time. But I remember they said something about having to prepare someone for an interview. I hope that helps you!","VS_T3P3L2C_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere.","1B"},
 
{"label","3B"},
    {"ns","Like I said before, I was composing a limerick when I signed up, so I wouldn’t be able to recognize who signed me up. I remember, however, that they said something about having to prepare a client for a press interview.","VS_T3P3L2C_08.ogg"},
    {"pg","Yes, you mentioned something about preparing someone for a press interview.  I will see where I can find out about that.","1B"},
 
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
