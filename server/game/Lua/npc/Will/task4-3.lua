local dialogtext = {


{"label","1"},
	{"ns","Welcome back to New City!  I am glad you could make it back to see me for our final appointment.  I called you back for this one last meeting so I could show you first-hand the results of your team's effort to manage the relief and recovery effort after the disastrous oil spill.  Are you curious to know how your team did in your assigned tasks?","P1P1.ogg"},
	{"pg","Yes, I am curious.  How did my team do in our tasks?","2"},

{"label","2"},
	{"ns","Well, if you look behind me, you'll see the relief effort didn't go as well as hoped.  Despite the efforts of you and your team, the cleanup of the New City River was largely ineffective – and it will take more time to clean the river and restore its environs to their pre-spill conditions.  The residents of New City are disappointed that the river is still months away from recovery!","P2P4.ogg"},
	{"pg","I am sorry to hear it, Will.","3"},

{"label","3"},
	{"if","teamtotalcost",">",76600,"3B"},
	
	{"label","3A"},
		{"ns","Despite your failings environmentally, your team's effort was managed well from a financial standpoint.  The City was able to manage its spending on the relief and recovery efficiently, ineffective as it was – and the City's coffers were not as hard-hit as some feared they would be.  City officials lament that the River is still on the mend – but are overjoyed that they will not need to raise taxes anytime soon.","P2P5.ogg"},
		{"pg","That's also great news, Will.  I am happy that everything worked out for the City.","4"},
	{"label","3B"},
		{"ns","In addition to failing at managing an effective recovery – the cleanup effort your team planned also nearly bankrupted New City.  With the City treasury now depleted, Mayor Gonzalez will be forced to raise taxes – and cut some popular City programs.","P3P1.ogg"},
		{"pg","I am sorry to have disappointed you, Will.","4"},

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
