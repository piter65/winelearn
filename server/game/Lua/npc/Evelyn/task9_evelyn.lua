local dialogtext = {

{"if","pilotstage","==",0,"pedro_00"},		-- 00 is entry ....

{"if","pilotstage","==",10,"pedro_00"},
{"if","pilotstage","==",20,"pedro_20"},
{"if","pilotstage","==",30,"pedro_30"},

{"if","pilotstage","==",40,"eve_41"},
{"if","pilotstage","==",50,"eve_50"},


{"label","default"},
	{"ns","I am so confused.  I should never be saying this, I am Evelyn. I am supposed to know everything, but I don't know what to say right now, except thank you for help us get this thing going.","ev9_00.ogg"},--audio
	{"pg","You are welcome, I am glad to help.","end"},



-- ev9 11
{"label","pedro_00"},
	
	{"fun3",setvar,"pilotstage",10},   --  Evelyn has been talked to

	{"ns","Welcome to New City! I am so happy your school is helping out! \n\nMy name is Evelyn Hu, and I'm the office assistant here at Professional Services, Inc. I want to thank your teacher and school for participating in this prototype. \n\nIt is going to be much different than the regular game and should take about 10 minutes. Before we get started, please move your mouse over a response choice below and left-click.","ev9_11.ogg"},--audio
	{"p","You are welcome. I am glad to help."},
	{"p","Nice to meet you, Evelyn."},

-- ev9 12

	{"ns","I'm guessing you're already familiar with the basic controls, so let's get right to business.  We'll be using the journal to keep notes.  The designers of this game will be reading your journal, so, just like the real world, don't write anything down you don't want others to see! \n\nOpen your Journal, go to the notes section, and type '#1'","ev9_12.ogg"},--audio
	{"p","Okay.  I've typed '#1' into my journal."},
	
-- ev9_13
	{"ns","Great!  Throughout this pilot, we'll ask you to enter things in your journal, usually with a number.  Now, next to #1, type in your school name, team name, and your player ID at the top.  It should look something like this:\n\n#1.George Washington Schoool\nThe Fuzzy Bunnies\nDave8","ev9_13.ogg"},--audio
	{"p","Okay.  I've entered that info into my journal."},



	-- ev9 14
	{"ns","Now, start a new line. Enter #2.  Type in the type of computer you are on and what browser. \n\nFor example, if on a Windows system, in Chrome, type \n'#2. Windows 10, Chrome.'\n\nor you may enter \n'#2. Mac   Safari'\n\nIf you do not know exactly, it is ok.  Make your best guess.","ev9_14.ogg"},--audio

	{"p","I got it. I entered my best guess."},



	-- ev9 15
	{"ns","Great.  One last thing.  Can you do me a favor and test the right mouse button?  It is supposed to move the camera around.  Does it work for you? \n\nType '#3' in your journal and write if the mouse works or does not work.","ev9_15.ogg"},--audio
	{"p","Done.  #3 mouse info entered."},



-- Huh????
--	{"ns","This is simple debug text","VS_WOT1_02.wav"},--audio
--	{"p","Yes it is."},
-- Huh????


	
	{"ns","Great!  I really appreciate your help.  The game designers will be checking your journal to see your results.  So try to keep it clean and readable.  It's ok to add comments, or things you notice, anything that you think the designers should know.  Keep in mind, the game is not finished, and there will probably be problems.","ev9_16.ogg"},--audio
	{"p","Ok.  I'll be clear and polite."},


-- ev9-17

	{"ns","For your next step, go find Will Standon in City Hall.  You'll need to leave the office, turn right, and enter the building with the dome just past that fountain.\n\nRemember, if you get confused, talk to me.\n\nAnd, thank you, your teacher, and your school for your help!","ev9_17.ogg"},--audio
	{"p","You're welcome.  I'm going to city hall."},
	

	{"fun3",setvar,"pilotstage",20},   --  Time to talk to Will

	{"pg","Thank you!  Goodbye, Evelyn.","end"},


-- ev9-21
{"label","pedro_20"},
	{"ns","Mr. Standon is waiting for you at City Hall.  You should leave this room, go right past the fountain, and enter the big city hall with the dome!  Inside is Mr. Standon.  If something is stopping you from doing this, then enter it in your journal so the designers can understand your problem.","ev9_21.ogg"},--audio
	{"pg","Okay, I'll go meet him.","end"},


{"label","pedro_30"},
	{"ns","Thank you again for all your help.  \n\n Have you talked to Webster Dweeb at the Internet Cafe?  It's at the other end of Main Street.  Across from the Chinese Laundry, just past your company office.","ev9_22.ogg"},--audio
	{"pg","Okay, I'll go meet with him.","end"},

	

{"label","eve_40"},
	{"ns","You need to go to the Internet Cafe, find a free computer, and look up 'lonely guy'.","ev9_22.ogg"},--audio
	{"pg","Okay, I'll go meet with him.","end"},


{"label","eve_41"},
	{"ns","The last person to talk to is down by the docks in the south east corner of New City. He wants to test your team, so bring your team mates if possible.",
	 "ev9_thanks.ogg"},--audio
	{"pg","Okay, I'll go meet with him.","end"},

{"label","eve_50"},
	{"ns","That is it!  You are done!  Just make sure your journal has all the info.  Everyone in New City, as well as the developers, want to thank you, your teacher, and your school.  ",
	"ev9_thanks.ogg"},--audio
	{"pg","You are welcome!  Thanks for the opportunity.","end"},

{"label","eve_43"},
	{"ns","Yep. We're done!  The test is over.  Thanks again."
	,"ev9_thanks.ogg"},--audio
	{"pg","You are welcome!","end"},


{"label","eve_44"},
	{"ns","Um, it's a little strange. You keep coming back for praise, but sure.  Thank you so much for helping out.  You can go now.",
	"ev9_thanks.ogg"},
	{"pg","Okay, I'll go.","end"},


{"label","end"},
}
 return dialogtext
