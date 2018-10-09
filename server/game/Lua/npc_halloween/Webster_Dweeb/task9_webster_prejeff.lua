local dialogtext = {


{"if","pilotstage","==",0,"web_30"},    -- fix, short term cheat
{"if","pilotstage","==",10,"web_10"},  -- evelyn
{"if","pilotstage","==",20,"web_10"},	 -- will
{"if","pilotstage","==",30,"web_30"},	 -- webster
{"if","pilotstage","==",40,"default"},	 -- webster
{"if","pilotstage","==",50,"web_50"},	 -- webster



{"label","default"},
	{"ns","Hey!  I'm glad you can help, why not check with Evelyn at the office to see what you should do next!!","web9_0.ogg"},
	{"pg","Ok then...","end"},
	


{"label","web_10"},
	{"ns","You're here early!!  I'm glad you can help, why not check with Evelyn at the office to see what you should do next!!","web9_1.ogg"},
	{"pg","Ok then...","end"},




{"label","web_30"},
-- Huh????
--	{"ns","This is simple dweebish text","web9_0.ogg"},--audio
--	{"p","Yes it is."},
-- Huh????

	{"ns","Welcome!  Everyone in New City is so excited that you can help.  A big thank you from the entire town . \n  You can call me Webster.\nI'm working with the developers to make this game a good experience for you, and for those in the future.  I'm going to ask you some questions on performance of the game in your browser.  If you're curious, the developers are using the Unity Engine, and compiling for it HTMl5 and using Webgl for 3d.  So far, I'm pretty impressed.  I'm thinking of changing my last name to Webgl.\n  Any way, let's get to work.","web9_3.ogg"},
	{"p","Nice to meet you.  What do I do?"},

-- Huh????
--	{"ns","This is simple dweebish text","web9_1.ogg"},--audio
--	{"p","Yes it is."},
-- Huh????

	{"ns","Open up your Journal.  Enter #7.  Write something, anything really, about the experience walking around Newcity.  Was it choppy or slow, or did it feel smooth and nice.  Did you try runing with the 'shift' key?\n\n A typical entry might look like this:\n\n#7. Walking was smooth, it felt ok on my system.","web9_4.ogg"},--audio
	{"p","Ok, I added a comment for #7.  What next?"},

	{"ns","Let's do #8 now. Tell me about initial load time. \n\n Was it too long?  Was it more than 5 minutes? \n\n Just give us an idea.","web9_5.ogg"},--audio
	{"p","OK, comments on initial load time are in."},
 

	{"ns","Great. You can always go back and add a note if you experience something bad.  Now how about load times enterring rooms, or exiting to the city? Let's make that #9.  You know the drill.","web9_6.ogg"},--audio
	{"p","Done!  Next?."},


	{"ns","Ok, Anything else you can think of that's technical, please enter as #10.  Anything good, bad, or ugly.\n\nIf you got nothing to say, it's ok to leave it blank.","web9_7.ogg"},--audio
	{"p","#9 is done!"},


--	{"ns","Grate.  Some the next steps have to do with multi-player.  That means it's best if your team mates are logged in as well, at the same time.  If not, it's ok.  But if possible, get them ready.  Meanwhile, check out the Ickypedia.  Just click on a computer here. Look up 'Lonely Guy Dreaming' in the Ickypedia.","web9_8.ogg"},--audio
--	{"p","Ok.  Lonely Guy Dreaming.  Got it."},


	{"ns","Great.  Some the next steps have to do with multi-player.  That means it's best if your team mates are logged in as well, at the same time.  If not, it's ok.  But if possible, get them ready.\n\n  For the next set of tasks, talk to Joey Cramarossa who is waiting on the docks.  That's in the South East of New City.","web9_9.ogg"},

	{"p","Ok.  Joey, at the docks in the South East."},


	{"fun3",setvar,"pilotstage",40},   --  Time to talk to 

	{"ns","That's it Dawg.  Move on to the next dude...","web9_10.ogg"},--audio
	{"pg","Moving on....","end"},


{"label","web_50"},
	{"n","We're done!  Thanks for helping."},
	{"pg","Ok then...","end"},


{"label","end"},
}
 return dialogtext
