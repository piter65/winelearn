local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"if","edt","==",0,"asd"},
    {"if","edt","==",1,"1"},
    {"if","edt","==",2,"atd"},
{"label","atd"},
    {"ns","Bon jour, again, mon ami! Thanks again for your help – I will be sure to come and find you again if I need more advice!","VS_T2PXEC_07.ogg"},
    {"pg","I am always happy to help! Goodbye, for now.","end"},

{"label","1"},
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"ns","Bon jour, mon ami! Please, excusé moi for the interruption, but I am a friend of Stan Freeman, your CEO at Professional Services. My name is Serge Toulouse. Monsieur Freeman said you’d be a good person to talk to. You see, there is a situation that is troubling me, and I would like your opinion.","VS_T2PXEC_01.ogg"},
    {"pg","Of course. What’s on your mind?","2"},

{"label","2"},
    {"ns","Well, mon ami, I have a story about a friend of mine who works at an office, and I want you to tell me what you would have done if you were in that same situation. ","VS_T2PXEC_02.ogg"},
    {"pg","Alright, then - go ahead and tell me the decision you want me to consider.","3"},

{"label","3"},
    {"ns","The other day, my friend’s boss told her that he would be hiring someone to work part-time, alongside her. Her boss then asked her for help deciding who to hire, and gave her two resumes he was considering.","VS_T2PXEC_03.ogg"},
    {"pg","Okay, so then what?","4"},

{"label","4"},
    {"fun",incedt},
    {"fun",incsq},
    {"ns","When my friend looked at the resumes, she noticed that one belonged to someone from out of town – and the other belonged to her math teacher’s teenage son.  Now what do you make of that situation? Hairy, no?","VS_T2PXEC_04.ogg"},
    {"pgs","For full disclosure, I think your friend should tell her boss that one of the applicants was her teacher’s teenage son.","5","a"}, --EA+
    {"pgs","Your friend should probably let her boss know that she can’t give an impartial recommendation, and why.","5","b"}, --EA+
    {"pg","To be honest, I am not sure her boss really needs her help – I don’t think she should recommend anyone.","5"},
    {"pgs","If you ask me, it seems like your friend has a golden opportunity to impress her teacher!","5","c"}, --EA-

{"label","5"},
    {"ns","That’s funny – that is exactly what I told my friend! If you ask me, the answer is as clear as the sky over my great-uncle’s vineyard!  Well, thank you for your time - I will keep you in mind if I need any advice in the future! Au revoir!","VS_T2PXEC_05.ogg"},
    {"pg","It was my pleasure, Serge - I am happy to help. See you around!","end"},

{"label","asd"},
    {"ns","Bon jour! I am not sure I have made your acquaintance. Are you from out of town?","VS_T2PXEC_06.ogg"},
    {"pg","Pardon me. I was just passing through.","end"},
    {"pg","Hey, you’re Serge Toulouse! I’ve heard of you!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
