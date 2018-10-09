local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"if","edt","==",0,"asd"},
    {"if","edt","==",1,"1"},
    {"if","edt","==",2,"atd"},
{"label","atd"},
    {"ns","Whoa! Hey again, man! Say, thanks for your help before - that was totally awesome, man.  I will be sure to come and find you again if I need more advice!","VS_T1PXEC_07.ogg"},
    {"pg","I am always happy to help! Goodbye, for now.","end"},

{"label","1"},
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"ns","Hey, man! Sorry to just like, barge in on you, but I live in the woods behind Stan Freeman's house - you know, your CEO at Professional Services. My name is Charlie Frogg. Mr. Freeman said you'd be a good person to talk to. You see, there is a situation that is troubling me, and I would like your opinion.","VS_T1PXEC_01.ogg"},
    {"pg","Of course. What's on your mind?","2"},

{"label","2"},
    {"ns","Well, man, my brother is playing at state finals this week with his high school team, and he told me a story about his team captain.  I wanted you to hear about it, and tell me what you would have done if you were in that situation.  ","VS_T1PXEC_02.ogg"},
    {"pg","Alright, then - go ahead and tell me the decision you want me to consider.","3"},

{"label","3"},
    {"ns","My brother's high school team will be playing in a division championship in a few days - but the team captain and star player is on academic probation. He must turn in an essay before he can even play in the championship game! If he doesn't turn it in, my brother's team may lose.","VS_T1PXEC_03.ogg"},
    {"pg","Okay, so what is the problem?","4"},

{"label","4"},
    {"fun",incedt},
    {"fun",incsq},
    {"ns","Well, the team captain asked my brother if he could borrow an essay that he wrote a few semesters ago.  Some situation, huh? It was for a different professor at a different school - so he'll never get caught. So what do you make of that? ","VS_T1PXEC_04.ogg"},
    {"pgs","I think your brother should help his team captain write a new essay so he can pass.","5","a"}, --EA+
    {"pgs","The captain has to live up to his duties, and do his own schoolwork -if he doesn't play, it's his own fault!","5","b"}, --EA+
    {"pg","That student's troubles have nothing to do with your brother. He should ignore the situation until it goes away.","5"},
    {"pgs","With a state championship on the line, the answer is easy - I'd tell your brother to hand over the essay.","5","c"}, --EA-

{"label","5"},
    {"ns","That's funny - that is exactly what I told my brother! If you ask me, the answer is as clear as a 60's song lyric.  Well, thanks for your time. I will keep you in mind if I need any advice again. Later, man!","VS_T1PXEC_05.ogg"},
    {"pg","It was my pleasure, Charlie - I am happy to help. See you around!","end"},

{"label","asd"},
    {"ns","Whoa man, you should slow down. You're moving waaaaaay too fast, man.","VS_T1PXEC_06.ogg"},
    {"pg","Pardon me. I was just passing through.","end"},
    {"pg","Hey, you're Charlie Fogg! I've heard of you!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
