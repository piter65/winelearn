local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1a"},
{"if","uway","==",1,"atd"},

{"label","atd"},
    {"ns","Yo, what's up? I'm all out of United Way questions for this week. Come back next week, though, and I'll have more questions you can try.","vs_nl_wxpxuw_05.wav"},
    {"pg","Sounds good. See you around!","end"},

{"label","1a"},
    {"ns","Yo! It's good to see you again my friend. Last week I asked you some questions about the United Way. Would you like to try your hand at a few more?","vs_nl_w2to4pxuw1.wav"},
    {"pg","Yes, I'm ready for this week's United Way trivia questions. Let's get started.","2a"},
    {"pg","Actually, I need more time to visit the United Way website at www.unitedway.org to learn more. Then, I'll get back to you.","end"},

{"label","2a"},
    {"ns","What is the dollar value of United Way's time?","vs_nl_w2pxuw_01.wav"},
    {"pg","$0.","2c"},
    {"pg","$500,000+.","2c"},
    {"pgs","Between $140 million and $160 million.","2b","a"},
    {"pg","$1 billion+.","2c"},

{"label","2b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Word! You know your stuff. United Way is highly focused on results. That's why they figure out the dollar value of volunteer time. United Way also measures change in community conditions and program results. This helps them to determine which strategies help the most people for the effort.","vs_nl_w1pxuw_03.wav"},
    {"pg","That sounds interesting. I'm ready for another question.","3a"},

{"label","2c"},
    {"ns","No, sorry that is incorrect. United Way is highly focused on results. That's why they figure out the dollar value of volunteer time. United Way also measures change in community conditions and program results. This helps them to determine which strategies help the most people for the effort.","vs_nl_wxpxuw_ir1.wav"},
    {"pg","Oh, well. I'll try to get the next one.","3a"},

{"label","3a"},
    {"ns","True or False... The average annual income of dropouts is about half the income of high school graduates.","vs_nl_w2pxuw_02.wav"},
    {"pgs","True.","3b","b"},
    {"pg","False.","3c"},

{"label","3b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","That's got it! Compared to graduates, high school dropouts typically receive much lower wages and are unemployed for more of  their working careers.","vs_nl_wxpxuw_cr1.wav"},
    {"pg","That makes sense. I'm ready for the next question.","4a"},

{"label","3c"},
	{"ns","Nah, that's not it. Compared to graduates, High School dropouts typically receive much lower wages and are unemployed for more of their working careers.","vs_nl_wxpxuw_ir1.wav"},
	{"pg","Oh, well. I'll try and do better next time.","4a"},

{"label","4a"},
    {"ns","What is the correlation among women between dropping out of high school and pregnancy?","vs_nl_w2pxuw_03.wav"},
    {"pg","Women who drop out of school are less likely to become mothers.","4c"},
    {"pgs","Women who drop out of school are more likely to become pregnant at young ages.","4b","c"},
    {"pg","80% of teens drop out of school when they become pregnant.","4c"},
    {"pg","Dropping out of high school decreases a woman's chance of getting pregnant.","4c"},

{"label","4c"},
    {"ns","Nah, that won't do it. Studies show that a woman who drops out of school is more likely to become pregnant at a young age - resulting in a very difficult family situation. Without a high school diploma, it can be very hard for a woman to earn enough to support herself and her child.","vs_nl_wxpxuw_ir2.wav"},
    {"pg","Okay, thanks.","5a"},

{"label","4b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Bingo!! Studies show that a woman who drops out of school is more likely to become pregnant at a young age - resulting in a very difficult family situation. Without a high school diploma, it can be very hard for a woman to earn enough to support herself and her child.","vs_nl_wxpxuw_cr2.wav"},
    {"pg","I'm ready for another question!","5a"},

{"label","5a"},
    {"ns","Ok, this is your last question for the week. What percentage of dropouts leave because they are failing or simply do not like school?","vs_nl_w2pxuw_04.wav"},
    {"pg","20%.","5c"},
    {"pgs","40%.","5b","d"},
    {"pg","60%.","5c"},
    {"pg","80%.","5c"},

{"label","5c"},
    {"ns","Nice guess, but it's like this. Unfortunately, 40 percent of high school dropouts leave school because they are failing or simply do not like school.","vs_nl_wxpxuw_ir3.wav"},
    {"pg","I think I'll stay in school. Thanks.","tally"},

{"label","5b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","The bad news is, you're right. Unfortunately, 40 percent of high school dropouts leave school because they are failing or simply do not like school.","vs_nl_wxpxuw_cr3.wav"},
    {"pg","Wow, that's a lot of people.","tally"},

{"label","tally"},
    {"if","uwayscore","<",2,"6a"},
    {"if","uwayscore","==",2,"6b"},
    {"if","uwayscore",">=",2,"6c"},

{"label","6a"},
    {"ns","There's a lot to learn on the United Way website. Check it out. You'll do better on next week's questions and you might learn something that changes your life. The United Way website is at www.unitedway.org.","vs_nl_wxpxuw_01.wav"},
    {"pg","I'll check it out, thanks.","7"},

{"label","6b"},
    {"ns","You did fairly well on your United Way information this week, but you can always do better and there are many people less fortunate than you are who could use your help if you know how to give it. Visit the United Way website at www.unitedway.org to be better prepared next week and to learn important stuff about helping other people.","vs_nl_wxpxuw_02.wav"},
    {"pg","Thanks!","7"},

{"label","6c"},
    {"ns","Nice job! You really know a lot about the United Way.  We're always looking for volunteers to help us help others. Keep up the good work - I'll see you next week.","vs_nl_wxpxuw_03.wav"},
    {"pg","Sure thing. Thanks.","7"},

{"label","7"},
	{"fun",incuway},
	{"fun",incsq},
    {"ns","Okay, great! Well that does it for this week. If you come and find me next week, you can take a crack at some more questions about the United Way and what they do to help others.","vs_nl_wxpxuw_04.wav"},
    {"pg","Okay, great! See you soon!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
