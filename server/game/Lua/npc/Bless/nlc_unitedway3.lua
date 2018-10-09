local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1a"},
{"if","uway","==",1,"atd"},
{"label","atd"},
    {"ns","Yo, what's up? I'm out of United Way questions for this week. Come back next week, though, and I'll have more questions you can try.","vs_nl_wxpxuw_05.wav"},
    {"pg","Sounds good. See you around!","end"},

{"label","1a"},
    {"ns","Yo! It's good to see you again my friend. Last week I asked you some questions about the United Way. Would you like to try your hand at a few more?","vs_nl_w2to4pxuw1.wav"},
    {"pg","Yes, I'm ready for this week's United Way trivia questions. Let's get started.","1b"},
    {"pg","Actually, I need more time to visit the United Way website at www.unitedway.org to learn more. Then, I'll get back to you.","end"},

{"label","1b"},
    {"ns","Let's start with an easy one. True or False: 5% of female dropouts quit school because they become parents.","vs_nl_w3pxuw_01.wav"},
    {"pg","True.","2a"},
    {"pgs","False.","2b","a"},

{"label","2a"},
    {"ns","No, sorry that is incorrect. Unfortunately the number is actually much higher. 21% of females report that they dropped out because they became parents. A single parent without a high school diploma will have a very hard time earning the income necessary to support a child.","vs_nl_wxpxuw_ir1.wav"},
    {"pg","Oh, well. I'll try to get the next one.","3a"},

{"label","2b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"n","Word! You know your stuff. Unfortunately though, the number is actually much higher. 21% of females report that they dropped out because they became parents. A single parent without a high school diploma will have a very hard time earning the income necessary to support a child."},
    {"pg","Wow. I'm ready for another question.","3a"},

{"label","3a"},
    {"ns","What percentage of male dropouts quit school because they became parents?","vs_nl_w3pxuw_02.wav"},
    {"pgs","8%.","3b","b"},
    {"pg","2%.","3c"},
    {"pg","20%.","3c"},
    {"pg","1%.","3c"},

{"label","3b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","That's got it! 8% of males dropped out because they became parents. As I told you earlier, this number is much higher for girls.","vs_nl_wxpxuw_cr1.wav"},
    {"pg","That's interesting. I'm ready for another question.","4a"},

{"label","3c"},
	{"ns","Nah, that's not it. 8% of males dropped out because they became parents. As I told you earlier, this number is much higher for girls.","vs_nl_wxpxuw_ir1.wav"},
	{"pg","Oh, well. I'll try and do better next time.","4a"},

{"label","4a"},
    {"ns","More than 25% of dropouts in grades 10-12 cite what as their reason for withdrawing from school?","vs_nl_w3pxuw_03.wav"},
    {"pg","Peer Pressure.","4b"},
    {"pg","Boredom.","4b"},
    {"pg","Family Issues.","4b"},
    {"pgs","Job-related reasons.","4c","c"},

{"label","4b"},
    {"ns","Nah, that won't do it. A large percentage of students decide to dropout because of job-related issues. In the long run, a student's career will be much more successful if they stay in school than if they quit to work more.","vs_nl_wxpxuw_ir2.wav"},
    {"pg","Okay, thanks.","5a"},
{"label","4c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Bingo!! A large percentage of students decide to dropout because of job-related issues. In the long run, a student's career will be much more successful if they stay in school than if they quit to work more.","vs_nl_wxpxuw_cr2.wav"},
    {"pg","I'm ready for another question!","5a"},


{"label","5a"},
    {"ns","Ok, this is your last question for the week. Can you name the two primary predictors of whether a student will drop out of school?","vs_nl_w3pxuw_04.wav"},
    {"pg","Lack of sleep and poor social skills.","5b"},
    {"pg","Use of drugs and alcohol.","5b"},
    {"pgs","Lack of a positive adult role model and poor school attendance.","5c","d"},
    {"pg","Falling grades.","5b"},

{"label","5b"},
    {"ns","Nice guess, but it's like this. Through research, discussions, focus groups and surveys with principals, teachers and counselors, the United Way found that poor school attendance and lack of a positive adult role model were the two primary predictors of dropping out.","vs_nl_wxpxuw_ir3.wav"},
    {"pg","I think I'll stay in school. Thanks.","tally"},
{"label","5c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","The bad news is, you're right. Through research, discussions, focus groups and surveys with principals, teachers and counselors, the United Way found that poor school attendance and lack of a positive adult role model were the two primary predictors of dropping out.","vs_nl_wxpxuw_cr3.wav"},
    {"pg","Wow, that's incredible.","tally"},

{"label","tally"},
    {"if","uwayscore","<",2,"6a"},
    {"if","uwayscore","==",2,"6b"},
    {"if","uwayscore",">=",2,"6c"},

{"label","6a"},
    {"ns","There's a lot to learn on the United Way website. Check it out. You'll do better on next week's questions and you might learn something that changes your life. The United Way website is at www.unitedway.org.","vs_nl_wxpxuw_01.wav"},
    {"pg","I'll check it out, thanks.","7a"},


{"label","6b"},
    {"ns","You did fairly well on your United Way information this week, but you can always do better and there are many people less fortunate than you are who could use your help if you know how to give it. Visit the United Way website at www.unitedway.org to be better prepared next week and to learn important stuff about helping other people.","vs_nl_wxpxuw_02.wav"},
    {"pg","Thanks!","7a"},

{"label","6c"},
    {"ns","Nice job! You really know a lot about the United Way. We're always looking for volunteers to help us help others. Keep up the good work - I'll see you next week.","vs_nl_wxpxuw_03.wav"},
    {"pg","Sure thing. Thanks.","7a"},

{"label","7a"},
	{"fun",incuway},
	{"fun",incsq},
    {"ns","Okay, great! Well that does it for this week. If you come and find me next week, you can take a crack at the last set of questions I have about the United Way and what they do to help others.","vs_nl_wxpxuw_04.wav"},
    {"pg","Okay, great! See you soon!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
