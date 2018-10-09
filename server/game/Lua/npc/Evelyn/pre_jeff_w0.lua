local dialogtext = {

{"if","evelynprogress","==",0,"t1start"},

{"if","evelynprogress","==",1,"ev_tut1"},
{"if","evelynprogress","==",2,"ev_tut2"},
{"if","evelynprogress","==",3,"ev_tut3"},


{"if","tourguide","==",20,"tut20"},
{"if","tourguide","==",30,"tut30"},
{"if","tourguide","==",40,"tut40"},
{"if","tourguide","==",50,"tut50"},
{"if","tourguide","==",60,"tut60"},
{"if","tourguide","==",100,"tut100"},


{"label","busy"},
	{"n","Hi there."},
	{"pg","You look busy.  I'll come back later.","end"},


--===================================================

{"label","t1start"},

	{"n","Welcome to New City!  I am so happy you made it.  My name is Evelyn Hu, and I'm the  office assistant here at Professional Services, Inc. I am here to get you acquainted with the Virtual Team Challenge Program, which takes place here in New City. Can you tell me why you're here?."},--audio

	{"pg","I'm a student, and I wanted to play the tutorial.","student"},
	{"pg","I am an educator, and I want to understand the overall game.","educator"},
	{"pg","I'm just here checking out how this works.","itperson"},




{"label","itperson"},
	{"n","If you were just doing a compatiblity test, things are already looking pretty good!!!\n\nIf you can see your character, you can hear audio, the tech stuff is working! If you have a problem, I suggest you check the website FAQS at www.virtualteamchallenge.com.\n\nYou are also welcome to walk around town and see people.  It was nice meeting you."},

    {"pg","Great!  Thanks for your time.","end"},


{"label","educator"},

	{"n","Well, if you are an educator, you probably want to talk to Sandy, she's over there by the white board.  She can help explain the entire process.  Just use the arrow keys to walk and click on Sandy!  Thank you!!"},
	{"pg","Ok, I'll go talk to her.","end"},


--============================================================
{"label","student"},

	{"n","Then lets get this tutorial started!\n\n  I want to show you something important - how to use the 'camera controls'. Here, let me show you."},
	{"p","Okay. What do I do?"},
	
	{"n","Hold the right mouse button down, and move the mouse.  On a single button device, such as a mac, you can hold the shift button, the mouse button and move the mouse.  Do you notice what that does?  You are moving a virtual camera around the character that determines what you can see on your screen."},
	{"p","I got it.  Mouse button and mouse moves the camera, right?"},
	
	{"n","Exactly. \nWhile students play the game portion of the game, teachers do directly participate in the 3d game.  A teacher can give guidance, provide support materials, and is responsible for advancing students when a team finishes a task. This is important to be competitive in the Challenge."},
	{"p","Gameplay is for the students, teachers manage other stuff. Got it!"},
	
	{"n","So, back to the game.  In order to control your character, use the arrows or WASD keys.  It's easy, you can try it now, when you are finished, come talk to me again!"},
	{"p","Okay, ready!"},

	{"fun",incevelyn},

	{"label","ev_tut1"},

--===================================================

	{"n","Good! Go ahead and try to walk over and say 'Hello' to Mr. Stan Freeman, he's the field office executive from Professional Services Corporate Headquarters.  Just walk over, and click on his character."},--audio
	{"pg","Ok, I'll try that Evelyn.  Thank you!","end"},


--===================================================

	{"label","ev_tut2"},
	
	{"n","You're doing great!  I won't take up any more of your time. The New City Tourism board has sent a tour guide to show you around downtown New City.  She is waiting for you outside, near the fountain.  The way to leave the room is walk to the doormat, and click on the doormat."},--audio
	{"p","Click on a doormat to leave or enter a room.  Got it."},

	{"fun",incevelyn},
	{"fun2",incvars,"tourguide"},
	

	{"label","ev_tut3"},

	{"n","The fountain is in the center north of town, it's easy to find, and a good landmark to keep in mind. Just step out the door, turn right, and walk towards it!  The tourguide will be waiting for you with more information."},--audio
	{"pg","Thank You, Evelyn, bye for now!","end"},

--===================================================

--========================================================================
{"label","tut20"},

	{"n","Will Standon is waiting for you inside City Hall!"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut30"},

	{"n","Look for Vernon Sharpe in the United Americans building!"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut40"},

	{"n","Fiona Rudd is in her shop called 'Remember The Mane'"},

	{"pg","Thank you, I'll go right now!","end"},

{"label","tut50"},

	{"n","Wanda Rown is at the Potty Princess, the tourguide can give you directions."},

	{"pg","Ok.","end"},


{"label","tut60"},

	{"n","Eva Greene is always looking at the water."},

	{"pg","Oh. I'll look for her.","end"},

{"label","tut100"},

	{"n","This tutorial is done!  Thank you so much for playing, we hope to see you back when the  real challenge starts!"},

	{"pg","You are welcome, I appreciate your help!","end"},


--=======================================================





	
{"label","end"},
}
 return dialogtext
