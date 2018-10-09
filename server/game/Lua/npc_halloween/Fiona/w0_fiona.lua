local dialogtext = {

{"if","tourguide","==",0,"fionatut"},   -- cheat

{"if","tourguide","==",40,"fionatut"},

{"if","vendor2progress","==",0,"busy"},

{"if","vendor2progress","==",2,"t7atd1"},
{"if","vendor2progress","==",3,"t7atd2"},

{"label","busy"},
	{"n","Well, Hey there, sugar."},
	{"pg","You look busy.  I'll come back later.","end"},

{"label","fionatut"},
	{"ns","Why, hello there, sugar!  I'm Fiona Rudd and I'm pleased as pie to finally meet you! I'm going to tell you a trick or two about the game so let's get started.",
	"Fiona1.wav"},--audio
	{"p","What should I do?"},

	-- BChance: This adds the Fiona book to the inventory.
	{"fun3",setvar,"w2b4",true},

	{"ns","First, let's open up your inventory. Press 'I' or click the 'Inventory' icon on the bottom left side of the screen. When your inventory opens, you should have a book. And it's about me!  Click on the book, then take some time to read it.","Fiona2.wav"},--audio
	{"p","OK I’ll give it a try."},

	{"ns","Now, if you read any of those articles about me, tell me: What is my nickname in the Country Music press?","Fiona3.wav"},--audio
	{"pg","\"The Bag Lady of Country Music\"","t73a"},
	{"pg","\"The First Lady of Dixie\"","t73b"},
	{"pg","\"The Last Lady of Song\"","t73b"},
	{"pg","\"Stuck between a Rudd and a Hard Place\"","t73b"},
	
{"label","t73a"},
	{"ns","Very good!  That’s an example of a research question you might be asked here in New City.  If you were playing for real, and you got that wrong, I might get angry and not agree to help you. Want to try another question?","Fiona4.wav"},
	{"pg","Sure.  Let’s do another one.","t74"},

{"label","t73b"},
	{"ns","I’m sorry sugar, that’s just plum wrong.  If you were playing for real, that answer might offend me, and I may not agree to help you! That’s an example of a research question you might be asked here in New City. Want to try another question?","Fiona5.wav"},
	{"pg","Sure.","t74"},

{"label","t74"},
	{"ns","Okay, this one is not from that book. This is from the material your teacher might share with you.  In accounting, how is profit measured?","Fiona6.wav"},--audio
	{"pg","Profit is measured by gross sales.","t75b"},
	{"pg","Profit is an economics concept, not an accounting concept.","t75b"},
	{"pg","Profit is measured by subtracting revenues from expenses.","t75b"},
	{"pg","Profit is measured by subtracting expenses from revenues.","t75a"},

{"label","t75a"},
	{"ns","Very good!  That’s an example of a business question you might be asked here in New City.  That pretty much gives you an idea of how the in-class curriculum is reinforced in the game.","Fiona7.wav"},
	{"pg","Interesting.","t76"},
{"label","t75b"},
	{"ns","I’m sorry sugar, that’s just plum wrong.  If we were playing for real, you would have gotten points off of your score report for that answer! Well, no matter, that’s just an example of a business curriculum question you might be asked here in New City.","Fiona8.wav"},--audio
	{"pg","I see, then.","t76"},

{"label","t76"},

	{"ns","Make sure your team gets all the handouts. You can ask your teacher for them. They will prepare you for questions like these.","Fiona9.wav"}
	{"p","Ok, good to know."},

	{"ns","And as you may already know, the three teams that raise the most money for charity in the game will win the competition. You should see the website for all the details like the prize amounts.","Fiona10.wav"},--audio
	{"p","Oh, well, that means that the Deloitte Virtual Team Challenge is a competition!"},

	{"ns","That’s right, darling! Things can get very competitive in classrooms nationwide. That’s why we ask that teams do not help one another, and that the teachers do all they can to discourage cheating of any kind. Those caught cheating can be disqualified.","Fiona11.wav"},--audio

	{"p","That’s interesting. So I have to do my part and make sure teams don’t share information with other teams."},

	{"ns","Yes. Well darlin', that just about does it for me.  Now if you’ll excuse me, I have to get my hair done!  There is a class coming in shortly and I can’t disappoint my audience!","Fiona12.wav"},

	{"p","Okay, Fiona.  It was nice to meet you."},

	{"ns","I believe Vernon wanted you to visit Wanda Rown next.  The tour guide can help you to find her.  I must go now. The pleasure was all mine, sugar!  Toodles!","Fiona13.wav"},

	{"fun3",setvar,"tourguide",50},
	{"pg","Bye!","end"},

{"label","t7atd1"},
	{"ns","You really must excuse me.  I have to do my hair before the next group of students comes in – and I need my privacy!  I never get my hair done in front of company.","VS_WOT7_ATD1.wav"},--audio
	{"fun",talkedtovendor2},
	{"pg","I’ll be seeing you then!  Goodbye.","end"},

{"label","t7atd2"},
	{"ns","Now look, sugar, I have to get ready and I don’t have that much time.  Why don’t you be a doll and go ahead and talk to that tour guide while I get ready... okay, hun?","VS_WOT7_ATD2.wav"},--audio
	{"pg","Oh, okay then.  I’ll be seeing you around.","end"},

{"label","end"},
}
 return dialogtext
