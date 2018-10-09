local dialogtext = {


{"label","1"},
	{"ns","Welcome back to New City!  I am glad you could make it back to see me for our final appointment.  I called you back for this one last meeting so I could show you first-hand the results of your team's effort to manage the relief and recovery effort after the disastrous oil spill.  Are you curious to know how your team did in your assigned tasks?","P1P1.ogg"},
	{"pg","Yes, I am curious.  How did my team do in our tasks?","2"},

{"label","2"},
	{"ns","Well, if you look behind me, you'll see the relief effort did not succeed.  In the time that has passed since your team joined us, conditions in the river have worsened significantly. Foul-smelling sludge now oozes along where water once flowed, and many residents are starting to leave the City.  We had experts flown in who all agree that it will take years to clean the river -- and that its surrounding ecosystems can never be completely restored to their pre-spill conditions.","P3P2.ogg"},
	{"pg","Gee, Will, that's awful.  I'm terribly sorry...","3"},

{"label","3"},
	{"if","teamtotalcost",">",76600,"3B"},
	
	{"label","3A"},
		{"ns","Even though your team wasn't able to manage an effective recovery, your team did manage an efficient operation from a financial standpoint.  The City was also able to manage its spending on the relief and recovery efficiently, even though it was ineffective and the City's coffers were not as hard-hit as some feared they would be.  City officials lament that the River is still a mess, but are somewhat comforted by the fact that they did not go bankrupt in the process. ","P3P3.ogg"},
		{"pg","Well, at least something good came out of all this…","4"},
	{"label","3B"},
		{"ns","Well, that's not all.  In addition to failing in your attempts at an effective environmental recovery – the cleanup effort your team planned also bankrupted New City.  With the City treasury depleted, Mayor Gonzalez will be forced to raise taxes, cut many popular City programs, and even issue municipal bonds to help pay for the ongoing recovery and the residents of New City will likely vote her out of office. ","P3P4.ogg"},
		{"pg","Wow. Ouch.","4"},

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