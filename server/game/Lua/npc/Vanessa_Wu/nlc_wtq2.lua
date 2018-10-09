local dialogtext = {
    {"if","wtq","==",0,"1a"},
    {"if","wtq","==",1,"atd"},

{"label","1a"},
	{"fun3",setvar,"scoreconvo","nlc_wtq"},
    	{"ns","Hi again! I hope you are moving ahead confidently on your new task assignment.  Just like on your last task, Stan Freeman asked me to check in with you.  This time I have a challenge for you – it’s about ethics. If you have enough time, are you ready to answer about ten questions? ","VS_T2PXTHEME_01.ogg"},
	{"pg","Okay, sure. I think I am ready to answer questions about ethics.  Let’s please begin.","2a"},
	{"pg","Actually, Vanessa, no – at least not at the moment. I’ll check in with you later.","end"},

{"label","1b"},
    {"ns","Great!  Remember, just like always, I only ask each question once - and you can’t take back any answers. So let’s start with some review questions about business before moving on to ethics. Let me begin by asking you a review question: When would a business recognize revenue?","VS_T2PXTHEME_02.ogg"},
    {"pg","Hi again! I hope you are moving ahead confidently on your new task assignment.  Just like on your last task, Stan Freeman asked me to check in with you.  This time I have a challenge for you – it’s about ethics. If you have enough time, are you ready to answer about ten questions? ","2a"},
    {"pg","Okay, sure. I think I am ready to answer questions about ethics.  Let’s please begin.","end"},

{"label","2a"},
    {"ns","Great!  Remember, just like always, I only ask each question once - and you can’t take back any answers. So let’s start with some review questions about business before moving on to ethics. Let me begin by asking you a review question: When would a business recognize revenue?","VS_T2PXTHEME_02.ogg"},
    {"pg","When profits are excessive","2b"},
    {"pg","When the business receives more revenue than it incurs expenses","2b"},
    {"pgs","When the business receives payments from its customers","2ascore","a"}, --TI+
    {"pg","When the business incurs more profit than it does expenses","2b"},
	{"label","2ascore"},
    	{"fun",addwtqscore},
    	{"goto","2b"},

{"label","2b"},
    {"ns","Great! So before we move on to questions about ethics, I have just one more question about business:  Which of the following best describes a mission statement?","VS_T2PXTHEME_03.ogg"},
    {"pg","A one or two sentence statement that summarizes the intent of an organization","2c"},
    {"pg","An overall guideline that serves to guide strategy for the firm","2c"},
    {"pgs","All of these accurately describe a mission statement","2bscore","b"}, --TI+
    {"pg","A short description of the a firm’s high-level goals","2c"},
	{"label","2bscore"},
    	{"fun",addwtqscore},
    	{"goto","2c"},

{"label","2c"},
    {"ns","Okay, that’s enough questions for now about business. Let’s move on to the next part of the challenge, and ask you questions about ethics. Let’s see if you know this one: Which of the following describes the word ethics?","VS_T2PXTHEME_04.ogg"},
    {"pg","Moral standards and guidelines that regulate ‘right’ and ‘wrong’ conduct","2d"},
    {"pg","A discipline in philosophy containing several branches, including normative ethics and meta-ethics.","2d"},
    {"pg","All of these accurately describe the word ethics.","2d"},
    {"pgs","Ideas about what an individual feels is ‘right’ and ‘wrong’ conduct.  ","2cscore","c"}, --TI+
	{"label","2cscore"},
    	{"fun",addwtqscore},
    	{"goto","2d"},

{"label","2d"},
    {"ns","Okay, then. How about this one: Who coined the word “ethics”?","VS_T2PXTHEME_05.ogg"},
    {"pg","Prehistoric cavemen","2e"},
    {"pg","King Hammurabi","2e"},
    {"pg","Enlightenment thinkers","2e"},
    {"pgs","The Ancient Greeks","2dscore","d"}, --TI+
	{"label","2dscore"},
    	{"fun",addwtqscore},
    	{"goto","2e"},

{"label","2e"},
    {"ns","So here’s another related concept: Which of the following best describes ethical principles?","VS_T2PXTHEME_06.ogg"},
    {"pg","Inner beliefs, morals, values, that one turns to when making difficult decisions","2f"},
    {"pgs","All of these are examples of ethical principles.","2escore","e"}, --TI+
    {"pg","Explicit guidelines that people use when deciding which course of action or behavior would be ‘the right thing to do’ in a given situation.","2f"},
    {"pg","Codes of personal conduct derived from the Ten Commandments and the Golden Rule that are intended to govern behavior","2f"},
	{"label","2escore"},
    	{"fun",addwtqscore},
    	{"goto","2f"},

{"label","2f"},
    {"ns","Now, which of the following is an example of an ethical principle?","VS_T2PXTHEME_07.ogg"},
    {"pg","The belief that video games are evil.","2g"},
    {"pg","The belief one should never take ‘no’ for an answer","2g"},
    {"pg","The idea that not everyone should be equal in the eyes of the law","2g"},
    {"pgs","The belief that one should always tell the truth.","2fscore","f"}, --TI+
	{"label","2fscore"},
    	{"fun",addwtqscore},
    	{"goto","2g"},

{"label","2g"},
    {"ns","Which of the following is not an example of an ethical principle?","VS_T2PXTHEME_08.ogg"},
    {"pg","The belief that torture is wrong.","2h"},
    {"pg","The idea that one should always treat others as they’d like to be treated.","2h"},
    {"pg","The belief that one should always do what is in the best interests of everyone involved.","2h"},
    {"pgs","The idea that one should always act the same way as would others, given the same circumstances","2gscore","g"}, --TI+
	{"label","2gscore"},
    	{"fun",addwtqscore},
    	{"goto","2h"},

{"label","2h"},
    {"ns","Which of the following is an example of a positive duty?","VS_T2PXTHEME_09.ogg"},
    {"pg","The obligation to refrain from lying.","2i"},
    {"pg","The obligation to pay for items, rather than steal them.","2i"},
    {"pgs","The duty to treat one’s parents and teachers respectfully.","2hscore","h"}, --TI+
    {"pg","The duty to never cheat on exams.","2i"},
	{"label","2hscore"},
    	{"fun",addwtqscore},
    	{"goto","2i"},

{"label","2i"},
    {"ns","Okay, then, now here’s an important one: Which of the following is an example of a negative duty or right?","VS_T2PXTHEME_10.ogg"},
    {"pg","The obligation to pay taxes.","2j"},
    {"pg","The obligation to clean one’s room and take out the garbage","2j"},
    {"pgs","The obligation to pay for items, rather than steal them.","2iscore","i"}, --TI+
    {"pg","These are all negative duties","2j"},
	{"label","2iscore"},
    	{"fun",addwtqscore},
    	{"goto","2j"},

{"label","2j"},
    {"ns","Okay, then, so one last question, and we’re done: Which of the following statements is true about negative and positive duties and ethical obligations?","VS_T2PXTHEME_11.ogg"},
    {"pg","Negative duties are those that are damaging to the individual","3"},
    {"pgs","Positive duties are those which one wants to perform","2jscore","j"}, --TI+
    {"pg","Positive duties are usually optional","3"},
    {"pg","Negative duties entail that one should refrain from certain actions and behaviors","3"},
	{"label","2jscore"},
    	{"fun",addwtqscore},
    	{"goto","3"},

{"label","3"},
    {"if","wtqscore","<",5,"score1"},
    {"if","wtqscore","<",7,"score2"},
    {"if","wtqscore",">=",7,"score3"},

{"label","score1"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about ethics – for better or for worse! Would you like to know how many answers you got right?","VS_T2PXTHEME_12.ogg"},
    {"pg","Alright, I’m ready for it.  How did I do?","4a"},

	{"label","4a"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions – which concerns me. We want you to get everything you can out of your time here in New City. I hope to see you do a better job on my next challenge…","VS_TXPXTHEME_01.ogg","wtqscore"},
    	   {"pg","That’s disappointing. Next time you have a challenge for me, I’ll put forth more effort into it!","5"},

{"label","score2"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about ethics – for better or for worse! Would you like to know how many answers you got right?","VS_T2PXTHEME_12.ogg"},
    {"pg","Sure. How did I do?","4b"},

	{"label","4b"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions – which shows you are really coming along. We want you to get the most you can out of your time here, though – because with only a little more work, you could be an expert! ","VS_TXPXTHEME_02.ogg","wtqscore"},
    	   {"pg","Okay, Vanessa - I may just do a little extra work so I can ace your next challenge!","5"},

{"label","score3"},
    {"ns","Well, that’s it for my challenge to you! You certainly proved what you know about ethics – for better or for worse! Would you like to know how many answers you got right?","VS_T2PXTHEME_12.ogg"},
    {"pg","Please, go ahead and tell me how I did.","4c"},

	{"label","4c"},
    	   {"ns1","You correctly answered %d out of my ten challenge questions – which was outstanding! You have demonstrated your mastery over the subject… impressive! Keep up the good work!","VS_TXPXTHEME_03.ogg","wtqscore"},
    	   {"pg","I’ll try not to get lazy, Vanessa.  Maybe I’ll ace your next challenge, too!","5"},

{"label","5"},
    -- {"fun",incwtq},
    {"fun3",setvar,"wtq",1}, -- BChance: Replaceing 'incwtq'.
    {"fun",incsq},
    {"ns","Well that’s it for my challenge!  You can come by when you get your next task assignment and I’ll have one last challenge for you about decision-making. Until then, good luck with all your assignments here.  We’re all counting on you!","VS_T2PXTHEME_13.ogg"},
    {"pg","Well it was nice meeting you, Vanessa.  Take care!","end"},


{"label","atd"},
    {"ns","Hi again! Thanks for taking the time earlier to answer my questions. I’ll have another set of questions for you about decision-making when you get your next task assignment, though. In the meantime, study up before your next assignment!","VS_T2PXTHEME_14.ogg"},
    {"pg","Thanks for that, Vanessa.  See you around!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
