local dialogtext = {




{"if","tourguide","==",0,"will_0"},
{"if","tourguide","==",10,"will_0"},   -- evelyn
{"if","tourguide","==",20,"will_20"},   -- will
{"if","tourguide","==",30,"will_30"},   -- vernon

{"if","tourguide","==",50,"will_50"},
{"if","tourguide",">",99,"will_done"},   -- will


{"label","default"},
	{"n","I wonder if I can get on the National Idol TV show? \n\n Oh.  Hi again. \n\n You should probably talk to Evelyn at the team office or a tourguide to see where you should go next."},
	{"pg","Okay.","end"},



{"label","will_0"},
	{"n","Welcome to City Hall, but you should probably check in with Evelyn at the Professional Services office.  It's just down Main Street, on the left side, across from the Cinema.  Oh, my name is Will Standon.  And thank you for helping!"},--audio
	{"pg","I guess I should go meet with her.","end"},


{"label","will_20"},

	{"ns","WELCOME to New City!\n\nMy name is Will Standon and I am the direct assistant to the Mayor. \n\nSince you've made it this far, you already know the basics, so let me quickly explain the game.","will1.wav"},
	{"p","Great, tell me more."},

	{"ns","In the game, you will help us deal with the oil spill on the New City River. It's a real mess and we need to hire a number of different vendors for the clean up. The game consists of three big missions, which we call Tasks and in each Task I will ask you to recommend a vendor for a specific part of the clean up effort. Oh, just to be clear, this tutorial doesn't count as a Task.","will2.wav"},
	{"p","Makes sense!"},
	

	{"ns","Now some advice.  I will give you guidelines for hiring the optimal vendor. Keep them in mind and do careful research on vendors, keeping good notes so you make the best choice.  Thorough research can take a while, but that is the way to do well in the game.","will3.wav"},
	{"p","Got it, take my time, make a good recommendation."},


	{"ns","That's about all I have to say, but you should go talk to Vernon Sharpe for more advice. He knows New City well and understands how things work. He's at the United Americans Club, near the fountain.","will4.wav"},
	{"p","Got it Mr. Standon.  I'll meet Vernon Sharpe at the United Americans Club."},

	{"fun3",setvar,"tourguide",30},   --  Time to talk to Vernon


	{"ns","Oh, one more thing.  The mayor's office is upstairs.  She's got a lot on her mind, so don't bother her unless you check with me first.  She doesn't like surprises or unprofessional behavior.  Good luck!","will5.wav"},

	{"pg","Understoon Mr. Standon.  I'm off to meet Vernon Sharpe at the United Americans Club.","end"},


{"label","will_30"},
	{"n","Have you talked to Vernon Sharpe at the United Americans Club?  It near the corner of the fountain."},
	{"pg","Okay, I'll go meet with him.","end"},


{"label","will_50"},
	{"n","Maybe I should give up on my singing career."},--audio
	{"pg","That might be pragmatic.","end"},

{"label","will_done"},
	{"n","You know, I've always thought about being an entertainer.  I'm a pretty good singer.\n\nDo you want to hear me sing?"},
	{"pg","Um. Thanks.  Maybe later!","end"},


{"label","end"},
}
 return dialogtext
