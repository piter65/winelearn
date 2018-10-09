local dialogtext = {

{"if","tourguide","==",0,"tutcheat"},


{"if","tourguide","==",0,"busy"},
{"if","tourguide","==",1,"tutstart"},
{"if","tourguide","==",20,"tut20"},
{"if","tourguide","==",30,"tut30"},
{"if","tourguide","==",40,"tut40"},
{"if","tourguide","==",50,"tut50"},
{"if","tourguide","==",60,"tut60"},




{"label","busy"},
	{"n","Hi! My name is Shelley! Have we met?"},
	{"pg","You look busy.  I'll come back later.","end"},

{"label","tutcheat"},
	{"n","I think you're supposed to see Evelyn in the team office."},--audio

	{"pg","Oops, I'll go see her.","end"},
-- peter was here

{"label","tutstart"},
	{"ns","On behalf of the New City Board of Tourism, I would like to welcome you to New City! There is so much to do here!  Like those doormats!  Cool, huh? That's how you get into and out of buildings here in New City - just click on the doormat!",
	"TourGuide1.wav"},--audio
	{"p","I am very glad to meet you, Miss... Miss... I am sorry, what's your name?"},
	{"p","Do I know you?"},
	
	{"ns","My name is Shelley.  I am a proud resident of New City and a longtime tour guide!  I'm here to tell you some important things about the game.","TourGuide2.wav"},

	{"p","Oh, so you know how the game works?"},

	{"ns","Yes, I do!\n\nFirst of all, your teacher will create an account for each student in your class and then divide your class into teams of four students. Teams come play the game here in New City and each team member is given a task to do. Most tasks involve selecting a vendor to work on the cleanup effort.","tourGuide3.wav"},--audio
	{"p","What is a vendor?"},

	{"ns","A vendor is a person or organization that performs a specific service, such as cleaning the oil off the river, communicating with the press or crowd control. When you're asked to select a vendor, you'll be given guidelines so you can choose the vendor that best meets those requirements.","TourGuide4.wav"}

	{"p","So how would I choose the best vendor?"},

	{"ns","The first step is to do thorough research on the vendors to see who best meets the requirements. You can do research in the Internet Cafe, you can read the newspapers, and you can visit the library.  The game rewards students who do good research and take detailed notes.","TourGuide5.wav"},--audio
	{"p","I think I understand.  Keep the guidelines in mind, do research, take notes."},

	{"ns","When you need to locate a vendor, your best bet is to hit the 'm' key or the 'Map' icon below to open your map.  Then move your mouse over any building and it will show you that building's name. The green arrowhead on the map is where you are now.",
	"TourGuide6.wav"},,--audio
	{"p","Okay, the map sounds like a very useful tool. Thanks!"},

	{"ns","Now it's time to meet the Mayor's right hand man, Will Standon. In the actual game, Mr. Standon will tell you which vendors you need to select and he'll give you the list of requirements for each vendor. Will is expecting you now in City Hall, which is the large domed building behind me. Go see what he wants.","TourGuide7.wav"},


	{"fun3",setvar,"tourguide",20},   --  Time to talk to Stan

	{"pg","Okay, I will go see Will Standon in City Hall.  Thanks for all the useful information!","end"},


{"label","tut20"},

	{"n","Will Standon is waiting for you at City Hall!  The big building with the dome just behind me!"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut30"},

	{"n","The United Americans Builiding is right here.  Look for Vernon Sharpe there!"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut40"},

	{"n","Fiona Rudd is right there, with the rounded curb. Her shop is called 'Remember The Mane.'"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut50"},

	{"n","Wanda Rown is a bit harder to find.  She is at the Potty Princess, a big pink building in the lower west side. Your best bet is to use your map.  Hit the 'm' key or the map icon.  Hover your cursor over any building to locate a vendor."},

	{"pg","Oh. That will be helpful.","end"},


{"label","tut60"},

	{"n","Eva Greene is always at the Southeast of town, near the water.  You'll probably find her outside, looking at the bay.  If you get confused, use your map - M key. She is near Boater's Paradise!"},

	{"pg","Oh. By the water. Southeast side. Got it.","end"},



{"label","t8atd1"},
	{"ns","Oh, hello again.  The tutorial is over now. I hope you enjoyed learning all about the game! You can go have a look around now if you like. See you when you start the game.","VS_WOT8_ATD1.wav"},--audio
	{"fun2",incvars,"tourguide"},
	{"pg","Oh, okay then.  See you again when I start the game.","end"},

{"label","t8atd2"},
	{"ns","Hey, well aren't you friendly! The tutorial is over now and the tourism board doesn't pay overtime!  Quit the game by pressing the \"Escape\" and then select the \"Quit\" option!","VS_WOT8_ATD2.wav"},--audio
	{"pg","Oh, okay then.  I'll be seeing you around.","end"},

{"label","end"},
}
 return dialogtext
