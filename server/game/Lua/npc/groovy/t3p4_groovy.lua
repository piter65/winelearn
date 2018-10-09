local dialogtext = {
{"if","l2w1progress","==",0,"ASD1"},
{"if","l2w1progress","==",1,"1"},
{"if","l2w1progress",">=",2,"1B"},

{"label","ASD1"},
    {"n","Hi there, can I help you with anything?"},
    {"pg","No thanks.","END"},

--l2W MEETING 2--
{"label","1B"},
    {"ns","Well, then, don’t be shy.  Step right up and let me know if there is anything else on your mind!","VS_T3P4L2A_02.ogg"},
    {"pg","I am investigating reports that someone has been soliciting donations for the relief efforts and keeping them  for themselves! May I look at the credentials you were given?","2A"},
    {"pg","Do you mind if I ask who signed you up to volunteer?","3"},
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
	{"fun",incl2w1},
	{"fun",incinterv},
	{"fun3",setvar,"scoreconvo","l2npc2"},
    {"ns","Well, hello there, step right up, step right up. Have a hankering to help out? Care to contribute to a cause? Step right up, folks, and make a certified donation to the recovery effort!","VS_T3P4L2A_01.ogg"},
    {"pg","Do you mind if I have a look at your volunteer credentials? Apparently, someone has set up a fraudulent scheme to siphon support …","2A"},
    {"pg","May I ask who certified you to volunteer?","3"},
    {"pg","Well, I am grateful for your support.  Thanks.","END"},

{"label","2A"},
    {"ns","Someone set up a scheme to siphon support from the City?  What kind of charlatan would do such a thing? Wait - if I gave you my badge, could you tell me if my credentials are legitimate?","VS_T3P4L2A_03.ogg"},
    {"pg","Sure.  I’ll let you know what I think.","2"},

{"label","2"},
    {"ns","Okay, so, here are my credentials.  So what do you think?  Are they legitimate, or not?","VS_T3P4L2A_04.ogg"},
    {"wait","2B"},

{"label","2B"},
    {"if","l2w1progress",">",2,"2BNOSCORE"},
    {"fun",incl2w1},
    {"ns","You are handed a badge with the the following serial number: TAX192638870","null.wav"},
    {"pgs","I think these credentials look legitimate.","2D","a"}, --GM+
    {"pgs","That volunteer identification code on this badge looks funny to me.  I don’t think it’s legitimate. ","2C","b"}, --GM-
    {"pgs","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B","c"},

{"label","2BNOSCORE"},
    {"ns","You are handed a badge with the the following serial number: TAX192638870","null.wav"},
    {"pg","I think this badge looks legitimate.","2D"},
    {"pg","That volunteer identification code looks funny to me.  I don’t think this is a legitimate badge. ","2C"},
    {"pg","I can’t tell yet if this is fake or real.  I have to look around and see what else I can find out.","1B"},
{"label","2C"},
    {"ns","Oh, my! I was bilked into abetting an illegal scheme to profit from this disaster? What kind of crook would do such a thing? We need to find this side-show freak!","VS_T3P4L2A_05.ogg"},
    {"pg","Yes, this is quite a disturbing development.","1B"},


{"label","2D"},
    {"ns","Well, of course these credentials are legitimate!  I would never let myself be defrauded by a side show freak, would I?","VS_T3P4L2A_06.ogg"},
    {"pg","Of course not.  Well thank you for your support.","1B"},

{"label","3"},
	{"if","l2w1obj","==",0,"3A"},
	{"goto","3B"},

{"label","3A"},
	{"fun2",gotclueobj,"l2w1obj"},
	{"fun",incwp3},
    {"ns","Look, I’d like to help, but I didn’t recognize who signed me up to accept donations.  I am just passing through town, so I don’t really know anyone here. But, they did mention something about the Dewey decimal system right before they left.","VS_T3P4L2A_07.ogg"},
    {"pg","Thanks. I’ll write that clue down in my journal. I can also talk to my teammates to find out if it leads me somewhere.","1B"},

{"label","3B"},
    {"ns","Like I said earlier, I didn’t recognize who signed me up to accept donations.  I am just passing through town, so I don’t really know too many people in town by name yet.  But, she did mention something about the Dewey decimal system right before she left.","VS_T3P4L2A_08.ogg"},
    {"pg","Yes, you mentioned the Dewey decimal system earlier.  I will see where I can find out about that.","1B"},

{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
