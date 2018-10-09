local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1"},
{"if","uway","==",1,"atd"},
{"label","atd"},
    {"ns","Yo, what's up? I'm out of United Way questions for this week. Come back next week, though, and I'll have more questions you can try.","vs_nl_wxpxuw_05.wav"},
    {"pg","Sounds good. See you around!","end"},
{"label","1"},
    {"ns","Yo! My name is Bless. I'm only 16 years old but I have a record contract with 3HC Records and I play Hip Hop shows all over the country. One thing is for sure I would never miss a day of school and I intend to graduate. The United Way has a program to help kids stay in school, do you know about it?","vs_nl_w1pxuw_01.wav"},
    {"pg","Yes, I've been to the United Way website. I'm ready for this week's United Way trivia questions. Let's get started.","1q1"}, --jared changed from '1a' to '1q1'
    {"pg","Actually, I need more time to visit the United Way website at www.unitedway.org to learn more. Then, I'll get back to you.","end"},
{"label","1q1"},
    {"ns","Approximately, how many people volunteer with United Way every year?","vs_nl_w1pxuw_02.wav"},
    {"pgs","1 Million.","1q1a","a"},
    {"pg","500,000.","1q1b"},
    {"pg","100,000.","1q1b"},
    {"pg","10,000.","1q1b"},

{"label","1q1a"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Word! According to yearly surveys of the 1,300 local United Ways across the country, more than 1,000,000 people volunteer for United Way last year.  These individuals serve on United Way boards, assist with fundraising and fund distribution, participate in volunteer days and donate special skills or expertise to United Way and its community partners.  In several communities, United Way offers special volunteer programs for young people.  To find out if the local United Way where you live has programs like this visit unitedway.org and search by zip code.","vs_nl_w1pxuw_03.wav"},
    {"pg","That sounds interesting. May I have another questions?","1q2"},

{"label","1q1b"},
    {"ns","No, sorry that is incorrect. Wow! According to yearly surveys of the 1,300 local United Ways across the country, more than 1,000,000 people volunteer for United Way last year.  These individuals serve on United Way boards, assist with fundraising and fund distribution, participate in volunteer days and donate special skills or expertise to United Way and its community partners.  In several communities, United Way offers special volunteer programs for young people.  To find out if the local United Way where you live has programs like this visit unitedway.org and search by zip code.","vs_nl_w1pxuw_04.wav"},
    {"pg","Oh, well. I'll try to get the next one.","1q2"},

{"label","1q2"},
    {"ns","Storm Corps is a program created by United Way and which of the following organizations?","vs_nl_w1pxuw_05.wav"},
    {"pg","United States Marine Corps.","1q2a"},
    {"pg","National Football League.","1q2a"},
    {"pgs","MTV.","1q2b","b"},
    {"pg","American Red Cross.","1q2a"},
{"label","1q2a"},
    {"ns","Nah, that's not it. In March 2006, young people from across the country participated in Storm Corps, the first United Way / MTV Alternative Spring Break program.   Almost one hundred volunteers ages 18-24 spent the week helping rebuild lives and neighborhoods in Biloxi, Mississippi, and Foley, Alabama, two communities that were badly damaged by hurricanes. In 2007, nearly 400 young people went to Lake Charles, Louisianna to help rebuild Southwest Lousianna.. To see what participants had to say about the experience, visit their blog at www.stormcorps.org","vs_nl_wxpxuw_ir1.wav"},
    {"pg","Oh, well. I'll try and do better next time.","1q3"},

{"label","1q2b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","That's got it! In March 2006, young people from across the country participated in Storm Corps, the first United Way / MTV Alternative Spring Break program.   Almost one hundred volunteers ages 18-24 spent the week helping rebuild lives and neighborhoods in Biloxi, Mississippi, and Foley, Alabama, two communities that were badly damaged by hurricanes. In 2007, nearly 400 young people went to Lake Charles, Louisianna to help rebuild Southwest Lousianna.. To see what participants had to say about the experience, visit their blog at www.stormcorps.org","vs_nl_wxpxuw_cr1.wav"},
    {"pg","That sounds interesting. May I have another question?","1q3"},
{"label","1q3"},
    {"ns","True or False: In order to be a good volunteer, you must have a high school diploma and specific volunteering credentials.","vs_nl_w1pxuw_06.wav"},
    {"pg","TRUE.","1q3a"},
    {"pgs","FALSE.","1q3b","c"},
{"label","1q3a"},
    {"ns","Nah, that won't do it. Anyone can be a volunteer. You can help out by doing something you love: singing, knitting, playing basketball, etc. Think about what matters to you, and be selective about where you spend your time. Choosing opportunities that make you feel good while helping others build stronger communities enriches your own life at the same time.","vs_nl_wxpxuw_ir2.wav"},
    {"pg","Okay, thanks.","1q4"},

{"label","1q3b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","Bingo!! Anyone can be a volunteer. You can help out by doing something you love: singing, knitting, playing basketball, etc. Think about what matters to you, and be selective about where you spend your time. Choosing opportunities that make you feel good while helping others build stronger communities enriches your own life at the same time.","VS_NL_WXPXUW_CR2.ogg"},
    {"pg","I'm ready for another question!","1q4"},

{"label","1q4"},
    {"ns","Ok, this is your last question for the week. According to the National Center for Education Statistics, what percentage of 16-24 year olds drop out of high school without ever receiving a diploma?","vs_nl_w1pxuw_07.wav"},
    {"pg","2 Percent.","1q4a"},
    {"pg","5 percent.","1q4a"},
    {"pgs","10 percent.","1q4b","d"},
    {"pg","30 percent.","1q4a"},
{"label","1q4a"},
    {"ns","Nice guess, but it's like this. 10 percent of 16-24 year old American students drop out of school. That's more than 3 million people a year!","vs_nl_wxpxuw_ir3.wav"},
    {"pg","I think I'll stay in school. Thanks.","tally"},
{"label","1q4b"},
    {"fun",adduwayscore},
    {"fun2",incplayercash,5},
    {"ns","The bad news is, you're right. Unfortunately, 10 percent of 16-24 year old American students drop out of school. That's more than 3 million people!","vs_nl_wxpxuw_cr3.wav"},
    {"pg","Wow, that's a lot of people a year.","tally"},

{"label","tally"},
    {"if","uwayscore","<",2,"tally1"},
    {"if","uwayscore","==",2,"tally2"},
    {"if","uwayscore",">=",2,"tally3"},

{"label","tally1"},
    {"n","There's a lot to learn on the United Way website. Check it out. You'll do better on next week's questions and you might learn something that changes your life. The United Way website is at  www.unitedway.org."},
    {"pg","I'll check it out, thanks.","tallyexit"},

{"label","tally2"},
    {"ns","You did pretty well on your United Way information this week, but you can always do better and there are many people less fortunate than you are who could use your help if you know how to give it.  Visit the United Way website at www.unitedway.org to be better prepared next week and to learn important stuff about helping other people.","vs_nl_wxpxuw_02.wav"},
    {"pg","Thanks!","tallyexit"},

{"label","tally3"},
    {"ns","Nice job! You really know a lot about the United Way. We're always looking for volunteers to help us help others. Keep up the good work - I'll see you next week.","vs_nl_wxpxuw_03.wav"},
    {"pg","Sure thing. Thanks.","tallyexit"},

{"label","tallyexit"},
	{"fun",incuway},
	{"fun",incsq},
    {"ns","Okay, great! Well that does it for this week. If you come and find me next week, you can take a crack at some more questions about the United Way and what they do to help others.","vs_nl_wxpxuw_04.wav"},
    {"pg","Okay, great! See you soon!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
