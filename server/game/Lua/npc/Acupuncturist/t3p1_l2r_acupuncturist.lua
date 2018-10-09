local dialogtext = {
{"if","l2rprogress","==",0,"ASD1"},
{"if","l2rprogress","==",1,"1"},
{"if","l2rprogress",">=",2,"1B"},
 
{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},
 
--l2W MEETING 2--
{"label","1B"},
    {"ns","Is that all? This may sound odd, but somehow I feel that your energy centers are misaligned – if you like, you can make a donation to the City’s relief and recovery effort.  It’s good for the ‘chi’.","VS_T3P1L2C_02.ogg"},
    {"pg","I am actually investigating reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer to accept donations?","3"},
    {"pg","No, that’s it for now.  Thanks again for your support. ","END"},
 




--l2W MEETING 1--
{"label","1"},
{"if","standonprogress",">",4,"1A"},
{"goto","1_inc"},    -- Peter was here


{"label","1_inc"},      -- pa
{"fun",incstandon},
{"fun",incevelyn},
{"goto","1A"},      -- pa



{"label","1A"},
	{"fun",incl2r},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc1"},
    {"ns","Well hello there! If you forgive my saying so, your ‘chi’ energy needs healing.  Perhaps you’d like to make a recuperative donation to the City’s relief and recovery effort? I’m certified both in reiki and as an official relief worker.","VS_T3P1L2C_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations …","2A"},
    {"pg","Are you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Maybe some other time,  thanks.","END"},
 
{"label","2A"},
    {"ns","Now that you mention it, I did feel some negative tension in the air. Wait…if I give you my badge, can you tell me if my credentials are legitimate? ","VS_T3P1L2C_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},
 
{"label","2"},
    {"ns","Okay, well, here they are.  What do you think?","VS_T3P1L2C_04.ogg"},
    {"wait","2B"},
 
{"label","2B"},
    {"if","l2rprogress",">",2,"2BNOSCORE"},
    {"fun",incl2r},
    {"ns","You are hand a badge with the the following serial number: FORM196238870","null.wav"},
    {"pgs","I think these credentials  look legitimate.","2D","a"}, --GM-
    {"pgs","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM+
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},
 
{"label","2BNOSCORE"},
    {"ns","You are hand a badge with the the following serial number: FORM196238870","null.wav"},
    {"pg","I think these credentials  look legitimate.","2D"},
    {"pg","The volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C"}, 
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Oh, my! I was tricked into helping someone profit illegally from this disaster? Who would do such a thing? This is going to create some seriously negative karma!","VS_T3P1L2C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},

 
{"label","2D"},
    {"ns","Well, of course these credentials are legitimate.  Otherwise, I would have felt a strong negative energy emanating from them.  ","VS_T3P1L2C_06.ogg"},
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
    {"ns","Look, to be honest, I am new in town, and I don’t really know the person who signed me up.  But, I remember that they said they had no time for an acupuncture session because they had to attend to a leaky containment drum.","VS_T3P1L2C_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere...","1B"},
 
{"label","3B"},
    {"ns","Like I said before, I am new in town, and I don’t know the person that signed me up.  But, they said they had no time for an acupuncture session because they had to attend to a leaky containment drum.","VS_T3P1L2C_08.ogg"},
    {"pg","Yes, you mentioned something about a leaky containment drum earlier.  I will see where I can find out about that.","1B"},
 
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
