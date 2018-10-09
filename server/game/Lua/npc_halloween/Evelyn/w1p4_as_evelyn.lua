local dialogtext = {
{"if","evelynprogress","==",0,"A11"},
{"if","evelynprogress","==",1,"A1ATD1"},
{"if","evelynprogress","==",2,"A1ATD2"},
{"if","evelynprogress","==",3,"A1ATD3"},
{"if","evelynprogress","==",4,"A1ATD4"},
{"if","evelynprogress","==",5,"A1ATD5"},
{"if","evelynprogress","==",6,"A1ATD6"},
{"if","evelynprogress","==",7,"A1ATD7"},
{"if","evelynprogress","==",8,"A1ATD8"},
{"if","evelynprogress","==",9,"A1ATD9"},
{"if","evelynprogress","==",10,"A1ATD10"},
{"if","evelynprogress","==",11,"A1ATD11"},
{"if","evelynprogress",">=",12,"A1ATD12"},


{"label","T1P4a1"},



{"label","A11"},
{"fun",incevelyn},
{"fun",incstandon},
{"fun",talkedtoevelyn},
{"fun2",incvars,"journalprogress"},
 {"ns","Hi!  Welcome to your team office in downtown New City!  My name is Evelyn Hu, and I'm your team's assistant.  I have a lot of information and I'm here to help you anytime you need it.","VS_T1PXA1_01.ogg"},
 {"pg","Hey Evelyn!  Glad to meet you.","A12"},


{"label","A12"},
 {"ns","As you just learned from your CEO, there has been a massive oil spill in the New City River – and your team is going to be helping the City recover.  Now it's time to walk out the door and go to City Hall.  You have a meeting with Will Standon, who will tell you about your first task!  Don't forget, anytime you need help figuring out what to do next, come back to the office and talk to me!","VS_T1PXA1_02.ogg"},
 {"pg","Okay.  Who is Will Standon?","A13"},


{"label","A13"},
 {"ns","Will Standon is the Mayor's right hand man.  He is your team's client on this job.  For each task, he'll give you an assignment and guidelines for completing the task successfully.  Since Will is the client, you need to always go through him when you have to make a decision on the job.  Now you'd better get going,  He's waiting!","VS_T1PXA1_03.ogg"},
 {"pg","Okay, Thanks!  I am going to see him now.","END"},
 {"pg","Thanks for the information. Before I go, I have some questions about the simulation.","A14"},


{"label","A1ATD1"},
 {"ns","Will Standon, who works for the Mayor of New City -- your client in the assignment -- is waiting for you at City Hall.  He is a busy man, and you shouldn't keep him waiting long!","VS_T1PXA1_04.ogg"},
 {"pg","Thanks Evelyn.","END"},
 {"pg","Thanks for the information. Before I go, I have some questions about the simulation.","A14"},


{"label","A1ATD2"},
 {"ns","Remember, Will Standon is waiting for you at City Hall.  He is a busy man.  You shouldn't leave him waiting!  You can find City Hall by leaving the team office. Once outside walk to your right, to the center of town.","VS_T1PXA1_05.ogg"},
 {"pg","Thanks!","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD3"},
 {"ns","You have an appointment with Heather Winehart at her loft.  You'd better get going!","VS_T1P4A1_01.ogg"},
 {"pg","Great, Evelyn, Thank you.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD4"},
 {"ns","You should go interview the disaster assessment consultants that Heather Winehart told you about.  If you've forgotten where they are located, go see Heather again.  She can remind you where your vendors are located.","VS_T1P4A1_02.ogg"},
 {"pg","Thank you, Evelyn.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD5"},
 {"ns","Have you found out everything you can about the disaster assessment consultants  you were told to research? If you're ready to make a recommendation, go see Will Standon and he will  give you your next step. If want to conduct interviews and need to know where the vendors are located, go see Heather Winehart.","VS_T1P4A1_03.ogg"},
 {"pg","Okay, Evelyn, thanks.  I am on it.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD6"},
 {"ns","Have you informed Will Standon about your choice for a media relations firm?  The next step for you is to finalize your choice with the Mayor Gonzalez at City Hall.  Remember to dress for success!","VS_T1P4A1_04.ogg"},
 {"pg","Thanks for the tip, Evelyn.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD7"},
 {"ns","If you received authorization from the Mayor to negotiate a deal with your vendor choice, the next step is to go back to that vendor and start negotiating.  Make sure you go to the meeting prepared with all the accurate facts you could find.  I hope you wrote them all down somewhere!","VS_T1PXA1_06.ogg"},
 {"pg","Okay, Evelyn! I'll be seeing you around…","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD8"},
 {"ns","You're well on your way! If you negotiated a deal with your vendor, go see Will Standon and get a contract drawn up!  He is waiting for you at City Hall.  Remember to look sharp, you're making good progress!","VS_T1PXA1_07.ogg"},
 {"pg","Thanks, Evelyn.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD9"},
 {"ns","Did you get your chosen disaster assessment consultant to sign the contract?    If not, go back to where you first met the vendor and present them with the contract for signing.","VS_T1P4A1_05.ogg"},
 {"pg","Okay, thanks!","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD10"},
 {"ns","You're moving right along. Did you hire a disaster assessment consultant?  If so, go get the contract counter-signed by Mayor Gonzalez!  She is waiting for you at City Hall.  Remember to wear your business clothes!","VS_T1P4A1_06.ogg"},
 {"pg","Okay, thanks!","END"},
 {"pg","I have some questions about the simulation","A14"},


{"label","A1ATD11"},
 {"ns","Hey!  You're almost done!  To complete your assigned task you will need to take your signed contract back to Will Standon.  He is waiting for you at City Hall.  Remember to dress for the occasion!","VS_T1PXA1_08.ogg"},
 {"pg","Thanks for your help Evelyn.  I'll see you soon.","END"},
 {"pg","I have some questions about the simulation.","A14"},


{"label","A1ATD12"},
 {"ns","Congratulations!  You've successfully hired your first vendor!  You may WANT to look around New City for people who can use your help.  You might find it rewarding!","VS_T1PXA1_09.ogg"},
 {"pg","Okay, great.  I'll see you sometime soon, then, Evelyn.","END"},
 {"pg","I have some questions about the simulation.","A14"},


--HELP SECTION
	
	{"label","A14"},
		{"ns","I'm here to help and I have a lot of information. Can I help you with something?","VS_T1PXA1_10.ogg"},
		{"pg","What is the object of this game?","A15A"},
		{"pg","How do I win the game?","A15B"},
		{"pg","Can I earn money in the game? ","A15C"},
		{"pg","How will I know how I am doing in the game?","A15D"},
		{"pg","Can I kill anyone in this game?","A15E"},
		{"pg","Do You have any general advice to help me out?","A15F"},
		{"pg","That's it for now, thanks!","END"},
	{"label","A15A"},
		{"ns","The object of this game is to guide New City through this current environmental disaster through successful planning and execution of your tasks. The team that gets the best results for the City wins!  Also, the sponsor of this game is going to make a real donation to an environmental advocacy organization on behalf of the winning team, so you can make a difference in the real world if you do a good job!","VS_T1toT2PXA1_11.ogg"},
		{"pg","Got it, thanks. I have another question you maybe able to answer.","A14"},
	{"label","A15B"},
		{"ns","For every task, each member of your team will be asked to hire one vendor from a list of four candidates. Find out as much as you can about each vendor and pick the one who best conforms to the guidelines that Will Standon gives you. The team who identifies the best vendors throughout the four tasks, wins! Your team is then ranked alongside others in your class, school, state and around the nation.","VS_T1toT2PXA1_12.ogg"},
		{"pg","Okay, thanks.  I'll keep that in mind. I have another question you maybe able to answer.","A14"},
	{"label","A15C"},
		{"ns","You can earn money in different ways. You can earn bonuses for finding people around New City who need information or help.  You can also sell and redeem the trash you collect around town.  There are other ways to earn money, too.  Explore the world to find them.","VS_T1toT2PXA1_13.ogg"},
		{"pg","Okay, great! I have another question you maybe able to answer.","A14"},
	{"label","A15D"},
		{"ns","During the game, people you meet will tell you how you are doing with your missions. You can see the personal money you've earned by checking your inventory.  At the end of the game, your teammates and you will find out how well you did overall and how your team ranked against competing schools around the county.","VS_T1toT2PXA1_14.ogg"},
		{"pg","Okay thanks, Evelyn. I have another question you maybe able to answer.","A14"},
	{"label","A15E"},
		{"ns","Just like in real life, violence is not a good way to get things done in New City.  Instead, we use our brains to solve problems and get ahead","VS_T1toT2PXA1_15.ogg"},
		{"pg","Right on, Evelyn. I have another question you maybe able to answer.","A14"},
	{"label","A15F"},
		{"ns","Yes, I do. Pay attention to the guidelines you get from Will Standon, and find as much accurate information as you can before you make decisions. Personally, I suggest writing important information down in your Journal so you can use it when the time comes. Also stay on top of the news and talk to people around town. You never know what you might learn.","VS_T1toT2PXA1_16.ogg"},
		{"pg","Okay, thanks Evelyn! I have another question you maybe able to answer.","A14"},
		

	{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext
