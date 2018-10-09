local dialogtext = {


{"if","pilotstage","==",0,"joey_40"},		-- 10 is entry ....

{"if","pilotstage","==",10,"joey_10"},
{"if","pilotstage","==",20,"joey_10"},
{"if","pilotstage","==",30,"joey_10"},
{"if","pilotstage","==",40,"joey_40"},
{"if","pilotstage","==",50,"joey_50"},

{"label","joey_10"},
	{"ns","Hey dude, wouldn't it be great if we all could just get along.","joey9_0.ogg"},--audio
	{"p","Sure. And I am glad to help."},


-- ev9 11
{"label","joey_40"},
	{"ns","Sometimes I dream of the whole world working together.\n\nHey dude, I'm Joey.  I'm supposed to test out if team work is working.  Or something like that.  I get confused sometimes.","joey9_40.ogg"},--audio
	{"p","I brought my team."},
	{"p","I came alone."},


-- Huh????
--	{"ns","This is simple joey text","joey9_0.ogg"},--audio
--	{"p","Yes it is."},
-- Huh????

	{"ns","The more the merrier.  Just test what you can.  Go ahead and start the journal again.\n\nWe should be at #...12,13?  Something like that.  At this point, I just want everyone to get along.",
	"joey9_42.ogg"},
	{"p","I am ready to test something."},
	

	{"ns","The sky looks nice today.  So dudes, test out the chat feature.\n\nCan you talk to your team mates?  Do you see your own chats? Are you being excellent to each other?\n\nHave you seen Bill and Ted's Excellent Adventure?","joey9_43.ogg"},
	{"p","Journal updated."},




	{"ns","Now look at each other.  Can you see your teammates ok?  Are they even there?  Are they in the right position, or are they floating on the water?  Just add something in your journal.  We should be at like 19?  23?  Something like that.  The sky looks really nice today. ","joey9_45.ogg"},
	{"p","Journal updated."},



	{"ns","That's just about it. Hopefully you kept your journal in order, and have all 45 entries.  Or was it 4-5 entries?  Just write down what you think.  Being honest and good to each other is the important thing.","joey9_46.ogg"},
	{"p","Sure."},


	{"ns","Oh, actually, there is one last thing you can do, either by yourself, or as a team.   Have a race.  Yeah, that sounds righteous.  Just all take off, and go to the ...fountain.\n\nFirst one to talk to the tourguide wins.  Or just time yourself.",
		"joey9_47.ogg"},
	{"p","We'll figure something out!"},


{"fun3",setvar,"pilotstage",50},   --  Time to talk to 
	{"ns","And please don't cheat each other.  It would be really cool if you could make it all fair and fun.  I don't like cheaters. I don't like wars either.  Or oil spills for that matter.\n\nJust make up your own rules for starting.  And after you finish, write down in your journal, for entry #157, how the experience was.  \n\n Thank you a lot for your help, now take off!",
		"joey9_48.ogg"},
	{"pg","Off to the races!!","end"},


{"label","joey_50"},
	{"ns","How did it go?  Did you make an entry in your journal?\n\nAnyway, we're officially done.  You're welcome to explore New City some more, but the overall assignment is over.\n\nThank you for helping.\n\nWow.  That sky is really cool.\n\nAnd tell your teacher thank you.",
		"joey9_50.ogg"},
	{"pg","Got it.  Tell my teacher thank you.  We're done!","end"},

{"label","joey_51"},
	{"ns","Oh, and tell your teacher thank you!\n\nOk, we're done. Nothing left to do!",
		"joey9_51.ogg"},
	{"pg","Got it.  Tell my teacher thankyou.  We're done!","end"},

{"label","end"},
}
 return dialogtext
