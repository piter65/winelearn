local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"bless1"},
{"if","uway","==",1,"atd"},
{"label","atd"},
    {"ns","Yo, what's up? I'm out of United Way questions for this week. Thanks for your help!","vs_nl_wxpxuw_05.wav"},
    {"pg","Sounds good. See you around!","end"},

{"label","bless1"},
    {"ns","Yo! It's good to see you again, my friend. Last week I asked you some questions about the United Way. Would you like to try your hand at a few more?","vs_nl_w2to4pxuw1.wav"},
    {"pg","Yes, I'm ready for this week's United Way trivia questions. Let's get started.","bless2"},
    {"pg","Actually, I need more time to visit the United Way website at www.unitedway.org to learn more. Then, I'll get back to you.","end"},

{"label","bless2"},
    {"ns","What is our country's overall dropout rate?","vs_nl_w4pxuw_01.wav"},
    {"pg","Approximately 2% of all students drop out.","bless2b"},
    {"pg","Approximately 5% of all students drop out.","bless2b"},
    {"pgs","Approximately 10% of all students drop out.","bless2c","a"},
    {"pg","Approximately 40% of all students drop out.","bless2b"},

{"label","bless2b"},
    {"ns","No, sorry that is incorrect. Between 9 and 10 percent of all students withdraw from school.","vs_nl_w1pxuw_04.wav"},
    {"pg","Oh, well. I'll try to get the next one.","bless3"},

{"label","bless2c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Word! You know your stuff. Between 9 and 10 percent of all students withdraw from school.","vs_nl_w1pxuw_03.wav"},
    {"pg","Wow. I'm ready for another question.","bless3"},

{"label","bless3"},
    {"ns","True of False: Trend studies show a steady decrease in the annual number of students who complete their high school education.","vs_nl_w4pxuw_02.wav"},
    {"pg","True.","bless3b"},
    {"pgs","False.","bless3c","b"},

{"label","bless3b"},
    {"ns","Nah, that's not it. The percentage of students completing high school has risen from 75.2 percent in 1990 to 84.1 percent in 2002.","vs_nl_wxpxuw_ir1.wav"},
    {"pg","Oh, well. I'll try and do better next time.","bless4"},

{"label","bless3c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","That's got it! The percentage of students completing high school has risen from 75.2 percent in 1990 to 84.1 percent in 2002.","vs_nl_wxpxuw_cr1.wav"},
    {"pg","That's interesting. I'm ready for another question.","bless4"},

{"label","bless4"},
    {"ns","True or False: Fixing the one broken fragment in a teen's life is enough to make the difference and keep the teen in school and on track.","vs_nl_w4pxuw_03.wav"},
    {"pg","True.","bless4b"},
    {"pgs","False.","bless4c","c"},

{"label","bless4b"},
    {"ns","Nah, that won't do it. Many teens come to school as composites of the many broken pieces in their lives - divorce, homelessness, learning disabilities, drugs, etc. These problems must be addressed comprehensively to deliver the services that will make a lasting change for the teen.","vs_nl_wxpxuw_ir2.wav"},
    {"pg","Okay, thanks.","bless5"},

{"label","bless4c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"n","Right. Many teens come to school as composites of the many broken pieces in their lives - divorce, homelessness, learning disabilities, drugs, etc. These problems must be addressed comprehensively to deliver the services that will make a lasting change for the teen."},
    {"pg","I'm ready for another question!","bless5"},

{"label","bless5"},
    {"ns","Ok, this is your last question about United Way. True or False: Organizations like the United Way spend their resources on broad national programs in the hopes that their services will trickle down to solve individual problems.","vs_nl_w4pxuw_04.wav"},
    {"pg","True.","bless5b"},
    {"pgs","False.","bless5c","d"},

{"label","bless5b"},
    {"ns","Nice guess, but it's like this. The United way often tackles specific issues in communities that are in great need of help. For instance, the United Way works closely with the Burlington (Vermont) School District to tailor a solution to their abnormally high dropout rates.","vs_nl_wxpxuw_ir3.wav"},
    {"pg","I think I'll stay in school. Thanks.","tally"},

{"label","bless5c"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Word, you know that's right. The United way often tackles specific issues in communities that are in great need of help. For instance, the United Way works closely with the Burlington (Vermont) School District to tailor a solution to their abnormally high dropout rates.","vs_nl_w4pxuw_cr1.wav"},
    {"pg","Wow, that's incredible.","tally"},

{"label","tally"},
	{"fun",incuway},
	{"fun",incsq},
    {"if","uwayscore","<",2,"6a"},
    {"if","uwayscore","==",2,"6b"},
    {"if","uwayscore",">=",2,"6c"},

{"label","6a"},
    {"ns","There's a lot to learn on the United Way website. Check it out. Hopefully after learning what the United Way is all about you might have found a cause that'll work for you. Continue to check out The United Way website atwww.unitedway.org.","vs_nl_wxpxuw_01.wav"},
    {"pg","I'll check it out, thanks.","end"},

{"label","6b"},
    {"ns","You did fairly well on your United Way information this week, but you can always do better and there are many people less fortunate than you are who could use your help if you know how to give it. Visit the United Way website at www.unitedway.org to learn important stuff about helping other people.","vs_nl_wxpxuw_02.wav"},
    {"pg","Thanks!","end"},

{"label","6c"},
    {"ns","Nice job! You really know a lot about the United Way. We're always looking for volunteers to help us help others. Keep up the good work!","vs_nl_wxpxuw_03.wav"},
    {"pg","Sure thing. Thanks.","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
