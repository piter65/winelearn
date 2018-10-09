local dialogtext = {

{"if","evelynprogress","==",0,"t1start"},
{"if","evelynprogress","==",1,"t1atd1"},
{"if","evelynprogress","==",2,"t1atd2"},
{"if","evelynprogress","==",3,"busy"},

{"label","busy"},
	{"n","Hi there."},
	{"pg","You look busy.  I'll come back later.","end"},

{"label","t1start"},
	{"ns","Welcome to New City!  I am happy you made it.  My name is Evelyn Hu, and I'm the office assistant here at Professional Services, Inc. I am here to get you acquainted with the Virtual Team Challenge Program, which takes place here in New City. Before we get started, please move your mouse over a response choice below, and left-click.","VS_WOT1_01.wav"},--audio
	{"p","Are you here to give me a tutorial on the program?  Great, let's get started."},
	{"p","Nice to meet you Evelyn."},
	
	{"ns","Well done!  Whenever characters speak to you in New City, you have to click on a response just like now in order to continue.  Now, before I tell you all about the Virtual Team Challenge, I want to show you something important - how to use the 'camera controls'.  In simulations, the camera determines what you are looking at.  Here, let me show you.","VS_WOT1_02.wav"},--audio
	{"p","Okay..."},
	
	{"ns","Move your mouse from left to right and up and down (click and hold the right mouse button).  Do you notice what that does?  You are moving a virtual camera behind the character that determines what you can see on your screen.  Now move your mouse so that you can see me, and left-click on me with your cursor.  Whenever you want to talk to anyone it New City, that's all you have to do - left-click on them with your cursor.","VS_WOT1_03.wav"},--audio
	{"p","I got it.  So I click on this response right here to continue, right?"},
	
	{"ns","That's right!  Something else cool about your virtual camera is that the right mouse button holds the camera in place - so you can turnaround using the directional arrows or A' and 'D' keys to look at yourself.  Also, you can zoom in and out using a scroll wheel, if you have one.  Go ahead and play around - just click on the response below when you're done.","VS_WOT1_04.wav"},--audio
	{"p","I got it.  So I now I click on this response to continue..."},
	
	{"ns","Exactly!  Now you are here at the headquarters of Professional Services, Inc. to get a feel for the Virtual Team Challenge and what participation within the program entails. The VTC takes place over a pre-specified time period. In this time, students will be engaged in a specialized in-class business curriculum reinforced by an interactive simulation.","VS_WOT1_05.wav"},--audio
	{"p","OK.  Sounds interesting.  So do I also take part in this simulation?"},
	
	{"ns","While students are engaged in the virtual component of the program, teachers do not participate in the computerized simulation. This exercise is meant to give an overview of the functionality within the simulation so that you are familiar with in-game activity.","VS_WOT1_06.wav"},--audio
	{"p","Okay, I get it."},
	
	{"ns","The virtual team challenge is a competition where teams of up to four students, working together, compete to raise the most money for charity.  In the meantime, you will teach a series of topics in class that are then reinforced through assignments within the simulation.","VS_WOT1_07.wav"},--audio
	{"p","That's interesting.  So what do you mean by, competition?"},
	
	{"ns","For each topic, a simulated professional assignment is given to each team player inside of the Virtual Team Challenge that requires the student to make decisions for an upcoming charity event.  The team whose event raises the most money for charity -- wins the competition.","VS_WOT1_08.wav"},--audio
	{"p","Okay then - so what exactly do the students learn, and how?"},
	
	{"ns","In this version of the Virtual Team Challenge, there are four in class topics that comprise of short lectures, group exercises, and in-class activities.  Students then log into the simulation and experience content engineered to test and reinforce what has been taught in class.","VS_WOT1_09.wav"},--audio
	{"p","Okay then - so what exactly do kids learn, and how?"},
	
	{"ns","I won't take up any more of your time. Actually, the New City Tourism board has sent tour guides to show you around downtown New City.  They are waiting for you outside - and they have plans for you! Are you ready to try walking around town?","VS_WOT1_10.wav"},--audio
	{"p","Sure!  How do I do that?"},
	
	{"ns","You are going to start by learning how to control your character. To move around, use the W or 'Up Arrow' key to move forward, and the S or 'Down Arrow' key to move backwards.","VS_WOT1_11.wav"},--audio-- Try that now -- when you are done, move your mouse over me and left-click.
	{"p","Okay, ready!"},
	
	{"ns","Good! Now press the A and D (Or Left/Right Arrow) keys to turn left or right. Go ahead and try to walk around now. When you are done, move close to the sliding doors and left-click with your mouse over the doormat in front to exit the building into New City. See you soon! (click the response to end the conversation and move around)","VS_WOT1_12.wav"},--audio
	{"fun",incevelyn},
	{"fun2",incvars,"tourguide"},
	{"fun3",setvar,"tgcantrap",1},
	{"pg","Goodbye, Evelyn.","end"},
	
{"label","t1atd1"},
	{"ns","Are you having trouble finding the door?  It's okay. We've all been there.  So you know, the doormats in New City indicate entrances or exits from buildings.  Once you are done talking to me, move your mouse so that your cursor hovers on top of the virtual 'doormat' in front of the front door and left-click.","VS_WOT1_ATD1.wav"},--audio
	{"fun",talkedtoevelyn},
	{"pg","Okay, I'll try and hurry it back here.","end"},
	
{"label","t1atd2"},
	{"ns","Hey, you're back!  It's very nice of you to come and say hi.  During the Virtual Team Challenge, players can always come back and ask me what to do next.  This, however, is just the pre-game tutorial for educators - so perhaps you should go outside and let the lady in the blue suit show you around!","VS_WOT1_ATD2.wav"},--audio
	{"pg","Oh, okay then.  I'll be seeing you around.","end"},
	
{"label","end"},
}
 return dialogtext
