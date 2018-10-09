local dialogtext = {

{"if","tourguide","<",20,"tut_sandy"},



{"label","busy"},
	{"n","Hi there."},
	{"pg","You look busy.  I'll come back later.","end"},


--===================================================

{"label","tut_sandy"},

	{"n","Hi, I'm Sandy and I'm glad you came by to talk to me.  In the game, I run the movie theater accross the street.  But I'm also a professor of education at New City University and so the city asked me to talk to teachers about the game."},

	{"pg","I'm a teacher, and I'm curious about the game and what I can do to help my students succeed.","sandy_start"},
	{"pg","Um, oh, sorry. I'm not really intersted right now.","end"},

{"label","sandy_start"},


	{"n","Great. That's the kind of attitude that makes this game worthwhile. So, to begin, the game takes place in New City. You see, there's been a terrible oil spill on the river and it is impacting the city's environmnet. The city has hired Professional Serivces, LLP to help with the recovery effort. That's where your students come in."},

    {"p","Please continue..."},
	 {"pg","This is probably not for me.  Excuse me Sandy!","end"},

	{"n","Your students will work on teams to identify and hire the right vendors to clean up this spill. The game is divided into three main Tasks and each task focuses on a different educational topic. You can learn more about this in the handouts on the Teacher Resources page of the game's website."},

    {"p","I'll be sure to take a look at them."},
	 {"pg","This is probably not for me.  Excuse me Sandy!","end"},


	{"n","Good. Now, as a teacher, you'll need to create a teacher account on the website and then enroll your studennts. You'll then divide your class into teams of four students each."},
    {"p","Oh, so they play as teams."},


	{"n","Yes and each team has four distinct roles. You'll assign one student to each role. Each role has unique Tasks in the game."},

    {"p","Interesting. So the game teaches team work."},

    {"n","Yes, and it teaches much more. In fact, there is a guided curriculum already created for you to consult. However, this game is a self-directed business skill adventure which calls on student research, negotiation, and problem-solving skills to identify, hire, and utilize the most appropriate vendors to help fix the oil spill. So, much of the work has been done for you!"},
    {"p","Thats good to know!"},


	{"n","After you review the curriculum guides, which you'll find on the Teacher Resources page of the website once you login, you’ll see there are three main Tasks for each team to complete. Plan on one class time, about 45 minutes, to follow the curriculum and pre-teach each task before sending your teams off to New City."},

    {"p","This information will definitely help me make the most of the Challenge."},

{"n","Yes, and each task should take one to two hours of computer time. But, don’t worry if your class is shorter than that because all games are automatically saved, so teams can pick up where they left off."},

    {"p","Sounds very well planned out."},

	{"n","Yes, it is. Well, that's all for now. You are welcome to play the tutorial as a student if you want to understand more. Just go talk to Evelyn, tell her you are a student, and she can get you started.  Otherwise, create a teacher account on the website and take a look at the materials available. Good Luck and thanks for your interest!"},
    {"pg","Ok, thanks for the insight!","end"},





	
{"label","end"},
}
 return dialogtext
