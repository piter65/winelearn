local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"if","edt","==",0,"asd"},
    {"if","edt","==",1,"1"},
    {"if","edt","==",2,"atd"},
{"label","atd"},
    {"ns","Hey again, kid! Say, thanks again for helping me with that pickle earlier.  I will be sure to come and find you again if I need more advice!  So long!","VS_T3PXEC_07.ogg"},
    {"pg","I am always happy to help, Mickey. Until next time!","end"},

{"label","1"},
	{"fun3",setvar,"scoreconvo","nlc_edt"},
    {"ns","Heya, kid! You remember me, don’t ya? You know Mickey, Mickey Jones! How are ya?  Look, I noticed you’ve helped some people around town with some ethical decisions. You see, there is a situation that is troubling me, and I’m thinking you’d be a good person to talk to. Can I have your opinion on it?","VS_T3PXEC_01.ogg"},
    {"pg","Of course. What’s on your mind?","2"},

{"label","2"},
    {"ns","Well, you see, kid - I have a story about this guy I know who is a manager at a local factory.  I want you to hear it, and then tell me what you would have done if you were in that same situation. ","VS_T3PXEC_02.ogg"},
    {"pg","Alright, then  go ahead and tell me the decision you want me to consider.","3"},

{"label","3"},
    {"ns","The other day, this friend of mine told me an engineer at the plant found a leak in one of the old vats behind the factory, and it was leaking chemicals into a nearby pond. He has to repair the leak if he wants to stop it, or else, the leak may cause damage to the pond – and the factory will have to pay a fine.","VS_T3PXEC_03.ogg"},
    {"pg","Okay, so what’s the problem?","4"},

{"label","4"},
    {"fun",incedt},
    {"fun",incsq},
    {"ns","The problem is that my friend doesn’t have any budget left this year for repairs! So, if he fixes the leak, it may reduce his yearly bonus, which is a lot of money. If he waits, the vats will keep spewing waste – but the plant will only pay a small fine, and it won’t affect his bonus. That’s some pickle, ain’t it, kid? Whaddya think?","VS_T3PXEC_04.ogg"},
    {"pgs","Your friend should get those vats fixed. Stopping the leak is more important than a year-end bonus.","5","a"}, --EA+
    {"pgs","I think your friend should tell the higher-ups at the factory before he does anything.","5","b"}, --EA+
    {"pg","I think someone better make sure that engineer who found the leak is telling the truth!","5"},
    {"pgs","He should wait until he gets his bonus before reporting the leak. That way he keeps the bonus, and the company may not even have to pay a fine!","5","c"}, --EA-

{"label","5"},
    {"ns","That’s funny – that’s exactly what I said! Well, thank you for your time - I will keep you in mind if I need any advice in the future! See you ‘round, kid!","VS_T3PXEC_05.ogg"},
    {"pg","It was my pleasure, Mickey - I am happy to help. See you around!","end"},

{"label","asd"},
    {"ns","Heya, kid! How’s things?","VS_T3PXEC_06.ogg"},
    {"pg","Pardon me. I was just passing through.","end"},
    {"pg","Hey, you’re Mickey Jones! I’ve heard of you!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
