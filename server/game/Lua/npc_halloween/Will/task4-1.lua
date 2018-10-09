local dialogtext = {


{"label","1"},
	{"ns","Welcome back to New City!  I am glad you could make it back to see me for our final appointment.  I called you back for this one last meeting so I could show you first-hand the results of your team's effort to manage the relief and recovery effort after the disastrous oil spill.  Are you curious to know how your team did in your assigned tasks?","P1P1.ogg"},
	{"pg","Yes, I am curious.  How did my team do in our tasks?","2"},

{"label","2"},
	{"ns","Well, I am happy to tell you this personally.  As you can see behind us the cleanup of the New City River has been an unequivocal success, thanks to you and your team's efforts!  The relief effort was totally effective, and moreover, we were able to completely bring back the River and its environs to their pre-spill conditions.  The residents of New City are overjoyed that their precious river is now completely restored – and has totally recovered from the oil spill!","P1P2.ogg"},
	{"pg","That's great news, Will.","3"},

{"label","3"},
	{"if","teamtotalcost",">",76600,"3B"},
	
	{"label","3A"},
		{"ns","You will also be happy to hear that you helped manage quite an efficient relief and recovery effort!  On top of an extremely effective cleanup, the City was able to manage its spending on the relief and recovery efficiently – and as a result, its coffers were not as hard-hit as some feared they would be.  City officials are overjoyed that they will not need to raise new taxes anytime soon and donations from the public are pouring in.","P1P3.ogg"},
		{"pg","That's also great news, Will.  I am happy that everything worked out for the City.","4"},
	{"label","3B"},
		{"ns","Unfortunately, the relief and recovery effort that you helped plan, while successful on an environmental level, nearly bankrupted New City.  With the City treasury now depleted, Mayor Gonzalez will be forced to raise taxes!","P1P4.ogg"},
		{"pg","Oh, I see.  I am sorry to hear that.","4"},

{"label","4"},
	{"if","vendorsarrested",">",2,"4B"},
		
		{"label","4A"},
		{"ns","Now, as far as the scheme to siphon donations from the City, you should know that your team made little progress in the investigation, and the ring responsible for the fraud is still at large.","P3P5.ogg"},
		{"pg","I'm sorry we let you down.","5"},

		{"label","4B"},
		{"ns","Now, as far as the scheme to siphon donations from the City goes – I'll have you know that your team broke open the investigation.  As a result of your team's decisive actions and fine efforts, the ring responsible for the fraud is now behind bars!  Because your team moved quickly and effectively, the fraud had little effect on the fundraising effort, and only a few donations to the relief and recovery went missing.  Moreover, polls show that the residents of New City gained a lot of confidence in Mayor Gonzalez's leadership as a result of the arrests – which will only help her in the re-election campaign.  Everyone at City Hall is quite impressed with your work on this investigation!","P3P6.ogg"},
		{"pg","Good to hear, Will.","5"},

{"label","5"},
	{"ns","Well, that's about it for now. I hope to see you back in New City someday soon!","P4P1.ogg"},
	{"pg","(Click to exit)","EXIT"},

{"label","EXIT"},
	{"fun",closethegame},
	{"goto","END"},

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
