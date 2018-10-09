local dialogtext = {
    {"if","wtq","==",0,"1a"},
    {"if","wtq","==",1,"atd"},

{"label","1a"},
	{"fun3",setvar,"scoreconvo","nlc_wtq"},
    	{"ns","Hi again! I hope you are moving ahead with your most recent task assignment.  Stan Freeman asked me to check in with you one last time and ask you review questions from the previous challenges on business and ethics, and then some new questions about decision-making. Do you have a moment? ","VS_T3PXTHEME_01.ogg"},
	{"pg","Okay, sure. I think I am ready to answer questions about decision-making.  Let’s begin.","2a"},
	{"pg","Not right now, Vanessa. I’ll check in with you later.","end"},

{"label","2a"},
    {"ns","Okay, then, let’s start with an easy question:  Which of the following would be included in a business plan?","VS_T3PXTHEME_02.ogg"},
    {"pg","An executive summary","2b"},
    {"pg","Market research","2b"},
    {"pgs","All of these would be included in a business plan.","2ascore","a"}, --TI+
    {"pg","A mission statement","2b"},
	{"label","2ascore"},
    	{"fun",addwtqscore},
    	{"goto","2b"},

{"label","2b"},
    {"ns","Now, here’s a hypothetical situation: Acme Widgets reports the following information for the 2007 fiscal year:  Sales, $320,000.  Rent expense, $42,000. Salaries expense, $198,000.  Raw materials used in production, $6,000. Supplies needed $17,000.  Given this information, which of the following would be true?","VS_T3PXTHEME_03.ogg"},
    {"pg","Acme widgets reported revenues of $320,000 and $246,000 of expenses for fiscal year 2007.","2c"},
    {"pg","Acme widgets reported revenues of $320,000 and $240,000 of expenses for fiscal year 2007.","2c"},
    {"pgs","Acme widgets reported revenues of $320,000 and $263,000 of expenses for fiscal year 2007.","2bscore","b"}, --TI+
    {"pg","None of these statements are accurate.","2c"},
	{"label","2bscore"},
    	{"fun",addwtqscore},
    	{"goto","2c"},

{"label","2c"},
    {"ns","Great. So before we move on to the questions about decision-making, I have a couple of questions about ethics. Here’s one: The ‘moral rights rule’ states that the ‘best’ decision is one that:","VS_T3PXTHEME_04.ogg"},
    {"pg","Grants moral rights to participants making the decision","2d"},
    {"pg","Everyone would be morally comfortable with","2d"},
    {"pg","These statements all describe the moral rights rule.","2d"},
    {"pgs","Does not infringe upon the basic freedoms and rights of those affected.","2cscore","c"}, --TI+
	{"label","2cscore"},
    	{"fun",addwtqscore},
    	{"goto","2d"},

{"label","2d"},
    {"ns","Okay – here’s one more about ethics.  The ‘utilitarian rule’ states that the ‘best’ decision is:","VS_T3PXTHEME_05.ogg"},
    {"pg","Is the most useful","2e"},
    {"pg","Does not infringe upon the basic rights of life, liberty, and happiness","2e"},
    {"pg","These statements all describe the ‘utilitarian rule’.","2e"},
    {"pgs","Maximizes the benefit, and minimizes costs or harms, for all those involved and affected.","2dscore","d"}, --TI+
	{"label","2dscore"},
    	{"fun",addwtqscore},
    	{"goto","2e"},

{"label","2e"},
    {"ns","I see! So, let’s move on then, I have a half dozen or so questions about decision-making, then. Say, can you define decision-making?","VS_T3PXTHEME_06.ogg"},
    {"pg","The process by which one decides if a determination is necessary to pursue.","2f"},
    {"pgs","The process by which one analyzes options and makes determinations about courses of action.","2escore","e"}, --TI+
    {"pg","The process by which one decides if a solution is agreeable.","2f"},
    {"pg","The process by which one makes determinations about goals and courses of action to pursue based on careful research.","2f"},
	{"label","2escore"},
    	{"fun",addwtqscore},
    	{"goto","2f"},

{"label","2f"},
    {"ns","Alright! Now, here is an easy one: What is cost-benefit analysis?","VS_T3PXTHEME_07.ogg"},
    {"pg","A tool that tells decision-makers which option they should pursue","2g"},
    {"pg","An ethical guideline for decision-making","2g"},
    {"pg","None of these statements describe cost-benefit analysis","2g"},
    {"pgs","A process used to quantify the costs and benefits of a decision.","2fscore","f"}, --TI+
	{"label","2fscore"},
    	{"fun",addwtqscore},
    	{"goto","2g"},

{"label","2g"},
    {"ns","Okay, here’s another: Which of the following is not necessarily performed in a cost-benefit analysis?","VS_T3PXTHEME_08.ogg"},
    {"pg","Quantifying the costs associated with a decision","2h"},
    {"pg","Quantifying the benefits associated with a decision","2h"},
    {"pg","Determining the payback period and/or break-even point","2h"},
    {"pgs","Determining which decision offers the most benefit, and which offers the least cost","2gscore","g"}, --TI+
	{"label","2gscore"},
    	{"fun",addwtqscore},
    	{"goto","2h"},

{"label","2h"},
    {"ns","Great! Let’s continue: What statement is not true about the benefits of a decision?","VS_T3PXTHEME_09.ogg"},
    {"pg","They are usually one-time occurrences","2i"},
    {"pg","They can always be measured in dollar-terms","2i"},
    {"pgs","The benefits of an ethical decision are always equal or greater than the costs","2hscore","h"}, --TI+
    {"pg","They usually accrue over time","2i"},
	{"label","2hscore"},
    	{"fun",addwtqscore},
    	{"goto","2i"},

{"label","2i"},
    {"ns","Now, what statement is true about the costs of a decision?","VS_T3PXTHEME_10.ogg"},
    {"pg","They can be one-time occurrences, or they can occur periodically","2j"},
    {"pg","They usually accrue over time","2j"},
    {"pgs","The costs of an ethical decision are always equal or less than the benefits","2iscore","i"}, --TI+
    {"pg","They can always be measured in dollar-terms","2j"},
	{"label","2iscore"},
    	{"fun",addwtqscore},
    	{"goto","2j"},

{"label","2j"},
    {"ns","Alright, then! We are almost done.  Just one more thing: The break even point is always equal in value to which of the following?","VS_T3PXTHEME_11.ogg"},
    {"pg","The benefits associated with pursuing a decision alternative","3"},
    {"pgs","The costs associated with pursuing a decision alternative","2jscore","j"}, --TI+
    {"pg","The costs associated with pursuing a decision alternative, minus its benefits","3"},
    {"pg","The benefits associated with pursuing a decision alternative, minus the costs","3"},
	{"label","2jscore"},
    	{"fun",addwtqscore},
    	{"goto","3"},

{"label","3"},
    {"if","wtqscore","<",5,"score1"},
    {"if","wtqscore","<",7,"score2"},
    {"if","wtqscore",">=",7,"score3"},

{"label","score1"},
    {"ns","Well, that’s it for my challenge! You certainly showed what you know about decision-making – for better or for worse! Would you like to know how many answers you got right?","VS_T3PXTHEME_12.ogg"},
    {"pg","Alright, I’m ready for it.  How did I do?","4a"},

	{"label","4a"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions – which is disappointing. Pay closer attention to what you learn during your next task here in New City.","VS_TXPXTHEME_01.ogg","wtqscore"},
    	   {"pg","Well, don’t feel too bad.  I may look into the material later.  ","5"},

{"label","score2"},
    {"ns","Well, that’s it for my challenge! You certainly showed what you know about decision-making – for better or for worse! Would you like to know how many answers you got right?","VS_T3PXTHEME_12.ogg"},
    {"pg","Sure. How did I do?","4b"},

	{"label","4b"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions, which shows you were paying attention. You could still use some study time, though. With a little more work, you could be an expert!   ","VS_TXPXTHEME_02.ogg","wtqscore"},
    	   {"pg","Okay, Vanessa I am sorry I couldn’t ace this last challenge! ","5"},

{"label","score3"},
    {"ns","Well, that’s it for my challenge! You certainly showed what you know about decision-making – for better or for worse! Would you like to know how many answers you got right?","VS_T3PXTHEME_12.ogg"},
    {"pg","Please, go ahead and tell me how I did.","4c"},

	{"label","4c"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions which is outstanding! You’ve done great work here, and you should certainly be proud of yourself. It’s quite impressive!","VS_TXPXTHEME_03.ogg","wtqscore"},
    	   {"pg","Thanks for the kind words, Vanessa. I am happy I was able to ace this last challenge! ","5"},

{"label","5"},
    -- {"fun",incwtq},
    {"fun3",setvar,"wtq",1}, -- BChance: Replaceing 'incwtq'.
    {"fun",incsq},
    {"ns","That does it for my challenge. This is your last task, though, so I will not see you again.   Everyone here in New City is really grateful for all of your help, though. And, I’ve had fun getting your answers to my questions! I hope we meet again. It’s been great working with you! ","VS_T3PXTHEME_13.ogg"},
    {"pg","Well it was nice meeting you, Vanessa.  Take care!","end"},


{"label","atd"},
    {"ns","We all owe you a debt of gratitude for your work here – and I’ve had a really great time working with you.  Hopefully, we’ll see each other again sometime!","VS_T3PXTHEME_14.ogg"},
    {"pg","Thanks for that, Vanessa.  See you around!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
