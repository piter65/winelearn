local dialogtext = {
{"if","l2w2progress","==",0,"ASD1"},
{"if","l2w2progress","==",1,"1"},
{"if","l2w2progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","So is that all, or did you decide you want to donate to the City’s relief and recovery effort?","VS_T3P4L2B_02.ogg"},
    {"pg","I am investigating reports that someone has been soliciting donations for the relief effort and keeping them for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who gave you credentials to accept donations?","3"},
    {"pg","No, that’s it for now.  Thanks again for your support. ","END"},


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
	{"fun",incl2w2},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc3"},
    {"ns","Welcome to New City Tools and Equipment!  My name is Nathan Broome.  Nothing is for sale this week – everything is reserved for the relief and recovery effort.  We’ve volunteered to accept donations, though, if you wan to donate.","VS_T3P4L2B_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon donations.","2A"},
    {"pg","Did you really?  May I ask who signed you up to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Someone is defrauding the recovery effort? Surely you must have a screw loose to pull off that sort of stunt! Well, if I gave you my badge, could you tell me if my credentials are legitimate? ","VS_T3P4L2B_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Well, here you go then.  What do you think?","VS_T3P4L2B_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w2progress",">",2,"2BNOSCORE"},
    {"fun",incl2w2},
    {"ns","You are handed a badge with the the following serial number: FAS192639380","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: FAS192639380","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"}, 
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Are you serious?  I was tricked into helping someone profit illegally from this disaster? Why, this is more disturbing than a hacksaw accident!","VS_T3P4L2B_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course! You bet your tool belt these credentials are legitimate! No one could ever work me over like that.","VS_T3P4L2B_06.ogg"},
    {"pg","Clearly that is true.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w2obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w2obj"},
	{"fun",incwp4},
    {"ns","I’ll be honest; I really don’t remember who gave me my credentials because I had just gotten a pinch of sawdust in my eye.  But, I do recall they mentioned something about having to sell tickets at a box office. I hope that helps. you.","VS_T3P4L2B_07.ogg"},
    {"pg","I’ll be honest; I really don’t remember who gave me my credentials because I had just gotten a pinch of sawdust in my eye.  But, I do recall they mentioned something about having to sell tickets at a box office. I hope that helps. you.","1B"},

{"label","3B"},
    {"ns","I really don’t remember who gave me my credentials because I had saw dust in my eye at the time. But, like I said earlier, I recall they mentioned something about having to hurry back and sell tickets at a box office.","VS_T3P4L2B_08.ogg"},
    {"pg","You mentioned something earlier about selling tickets at a box office.  I will try and look into that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
