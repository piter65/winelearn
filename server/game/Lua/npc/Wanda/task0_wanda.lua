local dialogtext = {

{"if","tourguide","==",0,"wandatut"},

{"if","tourguide","==",50,"wandatut"},

{"if","tourguide",">",50,"generic"},


{"label","wandatut"},

	{"ns","Come on in!  My name is Wanda, and I'm going to give you a few tips about playing the game.","Wanda1.wav"},
	{"p","Great, tell me more."},


	{"ns","First off, be sure to use your Journal. Press the J key or the Journal icon to open it. Use it for taking notes when you're researching your vendors. The notes are saved automatically by the way. And there's a glossary of important terms and sometimes the Journal gives you an idea of what you should be doing next. It's a great tool!",
	"Wanda2.wav"},
	{"p","Got it.  Use the Journal"},

	{"ns","Secondly, if you and your teammates are playing at the same time, you can chat with them.  It's completely ok in the Challenge to share ideas and strategy with your teammates.  But of course sharing with other teams is against the rules - and you know what happens then?","Wanda3.wav"},
	{"p","Yep, cheaters can get disqualified!"},

	{"ns","Now, one thing to warn you about.  You'll be talking with experts, negotiating with vendors and interacting with other folks in town. The thing is: don't leave until the conversation is over.  If you quit the game or close the browser during a conversation or negotiation the game may not save your progress correctly.  So, make sure you have ten minutes or so before you start a conversation - don't start one unless you have the time to finish it.","Wanda4.wav"},
	{"p","Ok, never leave a conversation dangling!"},

	{"ns","That's right.  And a few more tips. You can buy clothes at Paulines Clothing Shop, you can make some extra personal money by picking up any trash you see around town, and, while your primary goal is to give your client excellent service, it's ok to take on legitimate, ethical side tasks.","Wanda5.wav"},
	{"p","Ok. So some side tasks are ok."},

	{"ns","Now a word of warning.  Not all vendors and other people that you meet in New City are nice.  Some are just plain crooks and some are lazy, although most are very professional and ethical.  It's a good idea to reserve judgement until you do some research, and if something smells fishy or seems too good to be true, it might be best to avoid it.  Just like the real world, not everyone plays fair in New City.",
	"Wanda6.wav"},
	{"p","Got it. Use good judgement."},

	{"ns","That's a good way to think about it. And that's about it for hints I can give.  There's just one more person you should go meet in this Tutorial. Her name is Eva Green and she'll give you an idea of what you're up against.  She's on the other side of town at the docks - the South East Corner of the map.","Wanda7.wav"},
	{"p","Eva Green near the docks, lower East Side.  Thanks!"},

	{"ns","Most serious vendors in New City have business cards. It's a good idea to get one from each vendor you talk with.\n\nSo before you leave, make sure you get one of mine! Just click on that silver device near the door. You never know when you might need a porta-potty!","Wanda8.wav"},
		{"fun3",setvar,"tourguide",60},   --  Eva Green
	{"pg","I'll grab one on the way out!  Nice meeting you!","end"},


{"label","generic"},

	{"n","You must like it here.  Do you like porta-potties as much as I do?"},
	{"pg","Oh, excuse me, I should get going.","end"},
	


{"label","end"},
}
 return dialogtext
