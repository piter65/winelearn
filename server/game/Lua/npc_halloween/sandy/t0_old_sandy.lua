local dialogtext = {

{"if","tourguide","<",20,"tut_sandy"},



{"label","busy"},
	{"n","Hi there."},
	{"pg","You look busy.  I'll come back later.","end"},


--===================================================

{"label","tut_sandy"},

	{"ns","Hi! I'm Rachel and I'm glad you came by to talk to me.  I'm a professor of education at New City University and so the city asked me to talk to teachers about the game.","Sandy1.wav"},

	{"pg","I'm a teacher, and I'm curious about the game and what I can do to help my students succeed.","sandy_start"},
	{"pg","Um, oh, sorry. I'm not really intersted right now.","end"},

{"label","sandy_start"},


	{"ns","Great. That's the kind of attitude that makes this game worthwhile. So, to begin, the game takes place in New City. You see, there's been a terrible oil spill on the river and it is impacting the city's environmnet. The city has hired Professional Services, LLP to help with the recovery effort. That's where your students come in.","Sandy2.wav"},

    {"p","Please continue."},
	 {"pg","This is probably not for me.  Excuse me Rachel!","end"},

	{"ns","Your students will work on teams to identify and hire the right vendors to clean up this spill. The game is divided into three main 'Tasks' and each Task focuses on a different educational topic. You can learn more about this in the handouts on the Teacher Resources page of the game's website.","Sandy3.wav"},

    {"p","I'll be sure to take a look at them."},
	 {"pg","This is probably not for me.  Excuse me Rachel!","end"},


	{"ns","Good. Now, as a teacher, you'll need to create a teacher account on the website. Then you’ll enroll your students and divide your class into teams of four students each.","Sandy4.wav"},
    {"p","Oh, so they play as teams."},


	{"ns","Yes and each team has four distinct roles. You'll assign one student to each role. Each role has unique Tasks in the game.","Sandy5.wav"},

    {"p","Interesting. So the game teaches team work."},

    {"ns","Yes, and it teaches much more. In fact, there is a guided curriculum already created for you to consult. And the game is a self-directed business skill adventure in which the student does research, negotiation, and problem-solving to identify and hire the most appropriate vendors to help fix the oil spill. So, much of the work has already been done for you!","Sandy6.wav"},
    {"p","That's good to know!"},


	{"ns","You'll find the curriculum guides on the Teacher Resources page of the website once you login. When you review them, you’ll see there are three main Tasks for each team to complete. Plan on one class time, about 45 minutes, to follow the curriculum and pre-teach each task before sending your teams off to New City.","Sandy7.wav"},

    {"p","This information will definitely help me to make the most of the Challenge."},

{"ns","Yes, and each task should take one to two hours of computer time. But, don’t worry if your class is shorter than that because all games are automatically saved, so teams can pick up where they left off.","Sandy8.wav"},

    {"p","Sounds very well planned out."},

{"ns","Yes, it is. And both you and your students will appreciate the game because it teaches business skills, environmental awareness, ethics, and professionalism within an engaging and sophisticated computer sim. You are welcome to play the tutorial as a student if you want to understand more. Just go talk to Evelyn and tell her you are a student."},
    {"p","Okay, thanks. I might just do that.","Sandy9.wav"},

{"ns","So just to be clear, except for you being here in the Tutorial, teachers do not play the game. Only students play the game. And when your teams complete a Task you must advance each team to the next Task. This is very important: if you don't advance them, they won't be able to move forward in the game.","Sandy10.wav"},
{"p","Wow, that's important to know. How do I do that?"},

{"ns","When you login to the website, click on the Task Advance tab. On that page, you can track your teams' status and move them ahead when the time is right. Just make sure all players on the team are done because you can't move them backwards, only forwards.",
"Sandy11.wav"},
    {"p","Okay, I'll keep all that in mind. Where else can I find all this information about the game?"},

{"ns","When you login to the website, click on the Teacher Resources tab. Download the Teacher Handbook. It contains everything you need to know to successfully participate in the Challenge.","Sandy12.wav"},
    {"p","Great. You've been really helpful. So what is the next step in the process?"},

{"ns","Well, if you haven't already done it, you should register on the website, then enroll your students, create teams and assign roles. You can do all that on the teacher portion of the website once you log in. Good Luck and thanks for your interest!","Sandy13.wav"},
    {"pg","Thanks for the insight! It sounds like a great program for both my students and me.","end"},


	
{"label","end"},
}
 return dialogtext
