local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"if","msq3","==",0,"ASD3"},
{"if","msq3","==",1,"5A"},
{"if","msq3","==",2,"5C"},
{"if","msq3","==",3,"5D"},
{"if","msq3","==",4,"ATD3"},

--******************
--DIDN'T RETURN ITEM
--******************

	{"label","ASD3"},
	{"ns","Hello! Welcome to Critical Point Consulting. My name is Leslie Chang. I am sorry, I can’t see anyone right now without an appointment - I am extremely busy helping coordinate efforts for the City.","VS_T1PXFUNQU_28.ogg"},
	{"pg","I am sorry for the interruption, Leslie. Maybe we’ll catch up some other time!","END"},

--******************
--FIRST NPC
--******************

	{"label","5A"},
	{"ns","Greetings! Welcome to Critical Point Consulting. I am afraid that with this environmental crisis, we are awfully busy around here. It’s not every day that an Interstate tanker runs aground here in New City!","VS_T1PXFUNQU_16.ogg"},
	{"pg","I am sorry to intrude, Leslie – Mack sent me here to pick up a device from you.","5B"},
	{"pg","Oh, no thanks. I’m just poking around.","END"},

	{"label","5B"},
	{"fun3",setvar,"volttest",true},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq3"},
	{"ns","Okay, then! Mack said someone would be coming by.  Here, take the device – but don’t lose it! The City put a deposit on it, you know. Perhaps we can catch up again soon, when we are both less busy.","VS_T1PXFUNQU_17.ogg"},
	{"pg","Great! I’ll bring that device back to the waterfront now. Thanks!","END"},

--******************
--DIDN'T RETURN ITEM
--******************

	{"label","5C"},
	{"ns","It was a pleasure meeting you – but we’re both busy, and I don’t want to keep you.  Take the device I gave you back to Mack, immediately – unless - you didn’t lose it did you? You can have another if you did – but Mack is not getting his deposit back!","VS_T1PXFUNQU_18.ogg"},
	{"pg","Yes, of course. I am on my way to see him now.","END"},

--******************
--RETURNED ITEM BUT QUEST NOT DONE
--******************

	{"label","5D"},
	{"ns","What are you doing here! Haven’t you heard? The engineer hired to test samples from the river never showed up at the waterfront! Mack has been looking all over for you to give you the news – so you should head back to him ASAP!","VS_T1PXFUNQU_19.ogg"},
	{"pg","Yes, of course. I was just on my way to do that.","END"},

--******************
--DONE WITH QUEST
--******************

	{"label","ATD3"},
	{"ns","Hello, again! I am impressed with your service to the City! Terry, Mack and I owe you our thanks – and the City owes you a debt of gratitude! This world needs more people to volunteer to help respond to environmental crises! ","VS_T1PXFUNQU_32.ogg"},
	{"pg","I’m happy you think so Leslie.  See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
