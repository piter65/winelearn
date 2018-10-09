local dialogtext = {


--{"if","evelynprogress","==",0,"tut199"},

{"if","evelynprogress","==",0,"t1start"},

{"if","evelynprogress","==",1,"ev_tut1"},


{"if","tourguide","==",20,"tut20"},
{"if","tourguide","==",30,"tut30"},
{"if","tourguide","==",40,"tut40"},
{"if","tourguide","==",50,"tut50"},
{"if","tourguide","==",60,"tut60"},
{"if","tourguide","==",100,"tut100"},

{"if","evelynprogress",">",1,"tut199"},



{"label","busy"},
	{"n","Hi there."},
	{"pg","You look busy.  I'll come back later.","end"},


--===================================================

{"label","t1start"},

	-- BChance: Flag that we've talked to Evelyn so that we can avoid seeing the HUD display.
	{"fun3",setvar,"talked_to_evelyn", true},

	{"ns","Welcome to New City!  I'm so happy you made it.  My name is Evelyn Hu, and I'm the  office assistant here at Professional Services, LLP. Can you tell me why you're here?","Evelyn1.wav"},--audio


	{"pg","I'm a student, and I want to play the tutorial.","student"},
	{"pg","I'm a teacher, and I want to understand the overall program.","educator"},
	{"pg","I'm just here to see if the game runs on my computer setup.","itperson"},




{"label","itperson"},
	{"ns","If you were doing a compatibility test, things are looking pretty good!\n\nIf you can see your character and hear my voice, the tech stuff is working! If you have a problem, check the FAQs at www.virtualteamchallenge.com.\n\nYou are also welcome to walk around town and see people. Just click on the mat near the door to exit this room. It was nice meeting you.","Evelyn2.wav"},

    {"pg","Great!  Thanks for your time.","end"},


{"label","educator"},

	{"ns","If you're a teacher, you probably want to talk to Rachel. She's over there by the white board and can explain the entire program.  Just use the arrow keys to walk to her and then click on her!  Thank you!!","Evelyn3.wav"},
	{"pg","Ok, I'll go talk to her.","end"},


--============================================================
{"label","student"},

	{"ns","Great. First I'll show you how to control the camera so you can look around without moving your avatar.","Evelyn4.wav"},
	{"p","Okay. What do I do?"},
	
	{"ns","Hold the right mouse button down while you move the mouse.  On a single button device, such as a Mac, hold the shift button and the mouse button while you move the mouse.  You will be able to look all around without moving your avatar. If you do move your avatar, you'll move in the direction that you're looking.","Evelyn5.wav"},
	{"p","I got it."},
	
	{"ns", "Oh, one thing I want to tell you: students play the game, teachers don't. Teachers can give you guidance and provide support materials, and they are responsible for advancing students when a team finishes a Task.","Evelyn6.wav"},
	{"p","Students play the game. Teachers move teams forward when they finish a Task. Got it!"},
	
	{"ns","So, back to the game.  Use the arrow or WASD keys to move your avatar around. Try it now. When you're finished, come back and click on me again.","Evelyn7.wav"},
	{"p","Okay, I'll try moving around and then click on you again!"},

	{"fun",incevelyn},

{"label","ev_tut1"},

	{"ns","You're doing really well! By the way, in the game feel free to check in with me if you aren't sure what you are supposed to do next.  It is my job to help you to succeed, so I usually know what to do next.","Evelyn8.wav"},--audio
	{"p","Okay. Check in with you if I am not sure what to do next in the game.  Got it."},

	{"ns","Okay, I won't take up any more of your time. The New City Tourism board has sent a tour guide to tell you more about New City.  She is waiting for you outside near the fountain. To leave this room, or any room, walk to the doormat with the arrow and click on it.","Evelyn9.wav"},--audio
	{"p","Click on a doormat to leave or enter a room.  Got it."},

	{"fun",incevelyn},
	{"fun2",incvars,"tourguide"},
	
	{"ns","Turn right when you get outside and walk towards the fountain.  The tour guide is waiting there. Click on her for more information.","Evelyn10.wav"},--audio
	{"pg","Thank You, Evelyn. Bye for now!","end"},

--===================================================
-- Peter is bypasing mystery fault
{"label","tut199"},

	{"n","I believe the tourguide is waiting for you at the fountain!"},

	{"pg","Thank you. I'll go right now!","end"},

--========================================================================
{"label","tut20"},

	{"n","Will Standon is waiting for you inside City Hall!"},

	{"pg","Thank you. I'll go right now!","end"},

{"label","tut30"},

	{"n","Look for Vernon Sharpe in the United Americans building!"},

	{"pg","Thank you. I'll go right now!","end"},

{"label","tut40"},

	{"n","Fiona Rudd is in her shop called 'Remember The Mane.'"},

	{"pg","Thank you. I'll go right now!","end"},

{"label","tut50"},

	{"n","Wanda Rown is at the Potty Princess. The tourguide can give you directions."},

	{"pg","Ok.","end"},


{"label","tut60"},

	{"n","Eva Greene is standing by the water."},

	{"pg","Okay, thanks. I'll look for her.","end"},

{"label","tut100"},

	{"n","This tutorial is done!  Thank you so much for playing. We'll see you when the challenge starts!"},

	{"pg","You're welcome. I appreciate your help!","end"},


--=======================================================





	
{"label","end"},
}
 return dialogtext
