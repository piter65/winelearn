local dialogtext = {
{"fun3",setvar,"scoreconvo","nlc_math"},
    {"if","mathtest","==",0,"1a"},
    {"if","mathtest",">",0,"atd"},

{"label","1a"},
    {"ns","Hey! Did someone send you by here to help me with my math homework? Thank goodness, because I am having a hard time with these problems. You seem older than me, so you must be good at math! Can you help me? I have four problems, so it may take a few minutes.","VS_T1PXMATH_01.ogg"},
    {"pg","Sure, I am up for a challenge. Let's do it.","2a"},
    {"pg","I'm not sure I can spare the time. I have math problems of my own! I may be back, though.","end"},

{"label","2a"},
    {"ns","Okay, here is the first problem: The relationship between profit or 'pr', expenses ('e'), and revenues ('r') may be described using which of the following equations:","VS_T1PXMATH_02.ogg"}, 
    {"pgs","R – E = P ","2ascore","a"}, --CM+
    {"pg","P – R = E","2b"},
    {"pg","R + E= P","2b"},
    {"pg","R – E = P + E","2b"},

{"label","2ascore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2b"},

{"label","2b"},
    {"ns","Alright, here's another: Cheryl decides to make lemonade and sell it to earn spare cash.  She decides to purchase $50 worth of lemons, water, and sugar to make it.  She borrows a lemonade stand from her friend's older brother to use, which is worth about $300, and sells $437 worth of lemonade. What equation best describes Cheryl's lemonade selling activity?","VS_T1PXMATH_03.ogg"}, 
    {"pg","Cheryl's profit is $87","2c"},
    {"pg","Cheryl's revenues are $137","2c"},
    {"pgs","Cheryl's profit is $387","2bscore","b"}, --CM+
    {"pg","Cheryl's expenses are $350","2c"},
	
{"label","2bscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2c"},

{"label","2c"},
    {"ns","Okay.  The next problem says Acme widgets had profits of $1,524,635.21 on revenues of $5,834,529.44.  What were its expenses?","VS_T1PXMATH_04.ogg"}, 
    {"pg","$5,834,529.44","2d"},
    {"pgs","$4,309,894.23","2cscore","c"}, --CM+
    {"pg","$2,785,259.02 ","2d"},
    {"pg","Cannot be determined","2d"},

{"label","2cscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2d"},

{"label","2d"},
    {"ns","There is one last problem: It says that Dawn washes cars each weekend to earn lunch money.  She earns $5 per car that she washes.  She has to spend $2 on soap for every car that she washes though, and has to spend $3 to take the bus to the neighborhood where washes cars.  If she washes 50 cars, how much profit would Dawn make?","VS_T1PXMATH_05.ogg"}, 
    {"pg","Dawn wouldn't make any profit.","3"},
    {"pgs","$103","2dscore","d"}, --CM+
    {"pg","$147","3"},
    {"pg","$250","3"},

{"label","2dscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "3"},

{"label","3"},
    {"if","mathresult","<",2,"math2bad"},
    {"if","mathresult","<",3,"math2ok"},
    {"if","mathresult",">=",3,"math2good"},

{"label","math2bad"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder on every assignment – and it takes me longer each time to do it!","VS_T1PXMATH_06.ogg"},
    {"pg","We're both too young to be assigned math homework that hard.","4a"},

	{"label","4a"},
    	{"ns","So did you say you were good at math? I don't really know about these problems. I'm actually not so sure I should even hand this in...","VS_T1PXMATH_07.ogg"}, 
    	{"pg","Well, now, Flora, I'm sure it's not as bad as all that...I hope...","5"},

{"label","math2ok"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder on every assignment – and it takes me longer each time to do it!","VS_T1PXMATH_06.ogg"},
    {"pg","They were pretty difficult. You're too young to be assigned math homework that hard.","4b"},

	{"label","4b"},
    	{"ns","I have to hand that homework in later on – so I sure hope you are right about all of those answers you gave me! Otherwise, the kids are all going to make fun of me, again...","VS_T1PXMATH_08.ogg"}, 
    	{"pg","Well, I wish you the best of luck!","5"},

{"label","math2good"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder on every assignment – and it takes me longer each time to do it!","VS_T1PXMATH_06.ogg"},
    {"pg","Nah, those problems were no sweat.","4c"},

	{"label","4c"},
    	{"ns","Wow! That was amazing.  You sure are good at math – that was really helpful for me! My teacher is going to be really proud!","VS_T1PXMATH_09.ogg"}, 
    	{"pg","I am happy you are pleased.","5"},

{"label","5"},
    {"fun",incmath},
    {"fun",incsq},
    {"ns","Well, thanks for taking time to help me with my math homework, at any rate! I am really glad someone cam e by, because I was having a really hard time.  If you come back later, I may be here with another homework assignment – I always come here when I am stuck on a math problem. ","VS_T1PXMATH_10.ogg"}, 
    {"pg","Alright then Flora, I may see you around, then. Good luck!","end"},


{"label","atd"},
    {"ns","I don't have any more math homework to challenge you with just yet. I may be back again soon with more homework, though. I always come here when I get stuck on the problems they assign us at school!","VS_T1PXMATH_11.ogg"},
    {"pg","Okay then. I'll come back later.  In the mean time, good luck!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
