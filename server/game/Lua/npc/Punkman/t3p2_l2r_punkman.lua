local dialogtext = {
{"if","l2rprogress","==",0,"ASD1"},
{"if","l2rprogress","==",1,"1"},
{"if","l2rprogress",">=",2,"1B"},
 
{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},
 
--l2W MEETING 2--
{"label","1B"},
    {"ns","So is that all you need to know, mate? Or would you like to make a donation to the City’s relief and recovery effort?","VS_T3P2L2C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
    {"pg","No, that’ll be all.  Thanks again for your support. ","END"},
 


--L2W MEETING 1--  PETER APPROVED!
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"goto","1_inc"},   -- pa

{"label","1_inc"},      -- pa

{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},    -- Peter was here

-- END OF PETER APPROVAL



{"label","1A"},
	{"fun",incl2r},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc1"},
    {"ns","Oi!…you’re from the Professional Services team working on the oil spill, right?  I think I’ve seen you around. You know, I seem like a tough guy - but you all inspired me to volunteer to help bring in donations for the relief effort.","VS_T3P2L2C_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations.","2A"},
    {"pg","Did we really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},
 
{"label","2A"},
    {"ns","A scheme to divert donations? What kind of punk would do something like that? Wait…if I gave you my badge, could you tell me if my credentials are legit? ","VS_T3P2L2C_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},
 
{"label","2"},
    {"ns","Okay, here you go – take a look at my badge for me.  What do you think?","VS_T3P2L2C_04.ogg"},
    {"wait","2B"},
 
{"label","2B"},
    {"if","l2rprogress",">",2,"2BNOSCORE"},
    {"fun",incl2r},
    {"ns","You are handed a badge with the following serial number: TOW155944490","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM-
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM+
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},
 
{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the following serial number: TOW155944490","null.wav"},
    {"pg","I think these credentials look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Oi! I was tricked into helping someone profit illegally from this disaster? That’s right cheeky","VS_T3P2L2C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},

 
{"label","2D"},
    {"ns","Of course my credentials are legitimate.  Otherwise, I would never have accepted them! I’m not some kind of anarchist, you know.","VS_T3P2L2C_06.ogg"},
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
    {"ns","Look mate, I’d love to tell you who signed me up to volunteer, but we were in a crowded mosh pit at the time. However, I remember they said something about having to assess the impact of a recent earthquake. I hope that helps.","VS_T3P2L2C_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere...","1B"},
 
{"label","3B"},
    {"ns","Like I said before mate, we were in a crowded mosh pit when I signed up, so I wouldn’t be able to recognize who signed me up. I remember, however, that they said something about having to assess the impact of a recent earthquake.","VS_T3P2L2C_08.ogg"},
    {"pg","Yes, you mentioned something about assessing ecological impact.  I will see where I can find out about that.","1B"},
 
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
