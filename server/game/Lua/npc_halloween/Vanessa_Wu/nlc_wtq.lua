local dialogtext = {
    {"if","wtq","==",0,"1a"},
    {"if","wtq","==",1,"atd"},

{"label","1a"},
	{"fun3",setvar,"scoreconvo","nlc_wtq"},
    	{"ns","Hi! I’m Vanessa Wu. We haven’t met, but I am also a Professional Services employee, like you. Stan, our CEO, asked me to keep an eye on your team as you all carry out assignments in New City. So to check on your progress, I have some questions about business that I’d like to ask you.  Do you think you are prepared to answer them?","VS_T1PXTHEME_01.ogg"},
	{"pg","Okay, sure. I think I am ready to answer questions about business.  Let’s please begin.","1b"},
	{"pg","I don’t know if I am ready yet, Vanessa.  Let me study up a bit and get back to you on that.","end"},

{"label","1b"},
    {"ns","Great! I don’t want to take too much of your time, but this will take some concentration. Here’s how it works: I will ask you a question once, and you must choose an answer.  Now once you select an answer, you can’t change your mind! In exchange for your time, I’ll give you a cash bonus for each correct answer!  So do you have around five minutes to answer my questions?","VS_T1PXTHEME_02.ogg"},
    {"pg","Sure, I have time to answer some questions. Let’s start! ","2a"},
    {"pg","Actually, Vanessa, I am running off to do something and I haven’t much time. Maybe I’ll see you later.","end"},

{"label","2a"},
    {"ns","Very well then! Here’s the first question: why are businesses formed? Remember, you can’t take back any answers! ","VS_T1PXTHEME_03.ogg"},
    {"pg","To manufacture and distribute goods.","2b"},
    {"pg","To create value for its employees, customers, and suppliers.","2b"},
    {"pgs","To pursue owners’ shared economic goals","2ascore","a"}, --TI+
    {"pg","To pursue a mission statement.","2b"},
	{"label","2ascore"},
    	{"fun",addwtqscore},
    	{"goto","2b"},

{"label","2b"},
    {"ns","Okay, let’s continue. Which of the following is a business?","VS_T1PXTHEME_04.ogg"},
    {"pg","Your local church","2c"},
    {"pg","Your local public high school","2c"},
    {"pgs","A professional sports franchise","2bscore","b"}, --TI+
    {"pg","All of these","2c"},
	{"label","2bscore"},
    	{"fun",addwtqscore},
    	{"goto","2c"},

{"label","2c"},
    {"ns","I see. So, let’s see if you can help me with this: Which of the following is an example of an economic goal?","VS_T1PXTHEME_05.ogg"},
    {"pg","Keeping production costs low in order to make a profit","2d"},
    {"pg","Selling higher quality goods for higher prices in order to make a profit","2d"},
    {"pg","Increasing sales to achieve profit growth year over year ","2d"},
    {"pgs","All of these are examples of economic goals","2cscore","c"}, --TI+
	{"label","2cscore"},
    	{"fun",addwtqscore},
    	{"goto","2d"},

{"label","2d"},
    {"ns","Okay, so let’s move on with the next question. When does a business report a profit? ","VS_T1PXTHEME_06.ogg"},
    {"pg","When it receives payments from its customers","2e"},
    {"pg","When a business makes more profit than it incurs expenses","2e"},
    {"pg","When revenues are excessive","2e"},
    {"pgs","When a business’s revenue in a given time period exceeds its expenses","2dscore","d"}, --TI+
	{"label","2dscore"},
    	{"fun",addwtqscore},
    	{"goto","2e"},

{"label","2e"},
    {"ns","Okay, so here’s a good one. Which of the following is an example of a merchandising operation?","VS_T1PXTHEME_07.ogg"},
    {"pg","Your local high school","2f"},
    {"pgs","A supermarket","2escore","e"}, --TI+
    {"pg","A doctor’s office","2f"},
    {"pg","A factory that produces lunchboxes featuring characters from famous movies","2f"},
	{"label","2escore"},
    	{"fun",addwtqscore},
    	{"goto","2f"},

{"label","2f"},
    {"ns","Which of the following is a feature of a merchandising company?","VS_T1PXTHEME_08.ogg"},
    {"pg","Merchandising operations have three or fewer employees","2g"},
    {"pg","Merchandising operations primarily perform activities, jobs or duties for other businesses or individuals","2g"},
    {"pg","Merchandising operations convert raw materials or components into finished products","2g"},
    {"pgs","Merchandising operations have ‘inventories’","2fscore","f"}, --TI+
	{"label","2fscore"},
    	{"fun",addwtqscore},
    	{"goto","2g"},

{"label","2g"},
    {"ns","Okay, so let’s move on. Which of the following is an example of a manufacturing operation?","VS_T1PXTHEME_09.ogg"},
    {"pg","Your high school","2h"},
    {"pg","A supermarket","2h"},
    {"pg","A doctor’s office","2h"},
    {"pgs","A factory that produces lunchboxes featuring characters from famous movies","2gscore","g"}, --TI+
	{"label","2gscore"},
    	{"fun",addwtqscore},
    	{"goto","2h"},

{"label","2h"},
    {"ns","Great.  Now, here’s an easy one: Which of the following is a feature of manufacturing companies?","VS_T1PXTHEME_10.ogg"},
    {"pg","Manufacturing operations have ‘merchandise inventories’","2i"},
    {"pg","Manufacturing operations primarily perform activities, jobs or duties for other businesses or individuals","2i"},
    {"pgs","Manufacturing operations convert raw materials or components into finished products","2hscore","h"}, --TI+
    {"pg","Manufacturing operations have three or fewer employees","2i"},
	{"label","2hscore"},
    	{"fun",addwtqscore},
    	{"goto","2i"},

{"label","2i"},
    {"ns","Okay, well, we’re almost done! Here is another question: Which of the following is an example of a service organization?","VS_T1PXTHEME_11.ogg"},
    {"pg","Your high school","2j"},
    {"pg","A supermarket","2j"},
    {"pgs","A doctor’s office","2iscore","i"}, --TI+
    {"pg","A factory that produces lunchboxes featuring characters from famous movies","2j"},
	{"label","2iscore"},
    	{"fun",addwtqscore},
    	{"goto","2j"},

{"label","2j"},
    {"ns","Okay, so here’s the last question: Which of the following is a feature of service organizations?","VS_T1PXTHEME_12.ogg"},
    {"pg","Service organizations have ‘inventories’","3"},
    {"pgs","Service organizations primarily perform activities, jobs or duties for other businesses or individuals","2jscore","j"}, --TI+
    {"pg","Service organizations convert raw materials or components into finished products","3"},
    {"pg","Service organizations have three or fewer employees","3"},
	{"label","2jscore"},
    	{"fun",addwtqscore},
    	{"goto","3"},

{"label","3"},
    {"if","wtqscore","<",5,"score1"},
    {"if","wtqscore","<",7,"score2"},
    {"if","wtqscore",">=",7,"score3"},

{"label","score1"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about business by answering my questions.  I’ll be sure to pass along the information you gave me!","VS_T1PXTHEME_13.ogg"},
    {"pg","Okay, so you knew all the answers? I’m afraid to ask, did I get any right?","4a"},

	{"label","4a"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions which is disappointing. Pay closer attention to what you learn during your next task here in New City.","VS_TXPXTHEME_01.ogg","wtqscore"},
    	   {"pg","That’s disappointing. I’ll try to prepare for your next challenge. ","5"},

{"label","score2"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about business by answering my questions.  I’ll be sure to pass along the information you gave me!","VS_T1PXTHEME_13.ogg"},
    {"pg","Oh, so you knew the answers all along, eh? How did I do?","4b"},

	{"label","4b"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions – which shows you were paying attention. You could still use some study time, though. With a little more work, you could be an expert! ","VS_TXPXTHEME_02.ogg","wtqscore"},
    	   {"pg","Okay, Vanessa. I may just do a little extra work so I can ace your next challenge!","5"},

{"label","score3"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about business by answering my questions.  I’ll be sure to pass along the information you gave me!","VS_T1PXTHEME_13.ogg"},
    {"pg","Oh, so you knew the answers? Then tell me - how did I do?","4c"},

	{"label","4c"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions which was outstanding! You are clearly able to retain and apply your knowledge, which is very impressive. Keep it up, and you are going to do just fine here in New City!","VS_TXPXTHEME_03.ogg","wtqscore"},
    	   {"pg","Thanks!","5"},

{"label","5"},
    -- {"fun",incwtq},
    {"fun3",setvar,"wtq",1}, -- BChance: Replaceing 'incwtq'.
    {"fun",incsq},
    {"ns","Well that’s it for my challenge!  You can come back when you get your next task assignment, though, and I’ll have another set of questions for you about ethics. Until then, good luck with all your assignments here.  We’re all counting on you!","VS_T1PXTHEME_14.ogg"},
    {"pg","Well it was nice meeting you, Vanessa.  Take care!","end"},


{"label","atd"},
    {"ns","Hi again! Thanks for taking the time to answer my questions earlier. Later, I’ll have another set of questions for you about ethics. Come by after you begin your next task. In the meantime, good luck with your work here in New City!","VS_T1PXTHEME_15.ogg"},
    {"pg","Thanks for that, Vanessa.  See you around!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
