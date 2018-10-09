local dialogtext = {
{"if","l2rprogress","==",0,"ASD1"},
{"if","l2rprogress","==",1,"1"},
{"if","l2rprogress",">=",2,"1B"},
 
{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},
 
--l2W MEETING 2--
{"label","1B"},
    {"ns","So is that all? Maybe you can be a darling, then, and grab that piece of trash for me outside?  It’s upsetting my sense of cleanliness, but I don’t want to get my hands dirty touching it. It’s hard to ask for donations when you’re upset.","VS_T3P4L2C_02.ogg"},
    {"pg","I am investigating reports that someone has been soliciting donations for the relief efforts and keeping them for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer to accept donations?","3"},
    {"pg","Maybe later.  In the meantime, thanks again for your support. ","END"},
 

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
    {"ns","Hey there, would you be a darling and make a donation to the New City River relief and recovery effort? I’ve been sent to solicit donations…here, if you can believe it! I am liable to get my clothes dirty in a place like this!","VS_T3P4L2C_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations.","2A"},
    {"pg","Have you really?  May I ask who sent you here as a volunteer?","3"},
    {"pg","Maybe some other time, thanks.","END"},
 
{"label","2A"},
    {"ns","Now that you mention it, I feel like some people aren’t being as attentive to me as I’d like. Say, do you think my credentials are legitimate? If I gave you my badge, would you be able to tell?","VS_T3P4L2C_03.ogg"},
    {"pg","Sure. I’ll let you know what I think.","2"},
 
{"label","2"},
    {"ns","Okay, well, here you are - try not to get it dirty. What do you think?","VS_T3P4L2C_04.ogg"},
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
    {"ns","Oh, my! I was tricked into helping someone profit illegally from this disaster? Who would do such a self-centered thing…to me!? ","VS_T3P4L2C_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},

 
{"label","2D"},
    {"ns","Well, of course these credentials are legitimate.  Do I look like the type that would consort with criminals? ","VS_T3P4L2C_06.ogg"},
    {"pg","Of course not.  Well thank you for your support.","1B"},
 
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
    {"ns","Look, to be honest, I never remember anyone’s name…after all; most people are simply beneath me. But, I remember that they refused to pick up the handkerchief I had dropped because they had to respond to a nearby emergency.","VS_T3P4L2C_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere.","1B"},
 
{"label","3B"},
    {"ns","I said earlier that I don’t socialize with people who are beneath me, so I didn’t get the name of the person that signed me up. But, they said they wouldn’t pick up my handkerchief because they had to respond to an area emergency.","VS_T3P4L2C_08.ogg"},
    {"pg","Yes, you mentioned something about responding to a nearby emergency earlier.  I will see where I can find out about that.","1B"},
 
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
