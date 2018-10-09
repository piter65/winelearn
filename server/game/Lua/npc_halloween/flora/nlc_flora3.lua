local dialogtext = {
{"fun3",setvar,"scoreconvo","nlc_math"},
    {"if","mathtest","==",0,"1a"},
    {"if","mathtest",">",0,"atd"},

{"label","1a"},
    {"ns","Hey! Have you come back here to help me with my next homework assignment? Thank goodness, because these are the hardest math problems I have ever seen! Can you help me? I have four problems to do, but these may take a little longer to solve than any of the last ones I was given....","VS_T3PXMATH_01.ogg"},
    {"pg","Sure, I am up for a challenge. Let's do it.","2a"},
    {"pg","I'm not sure I can spare the time we all have our math problems, you know. I may be back, though!","end"},

{"label","2a"},
    {"ns","Okay, here is the first problem: Return on investment is calculated as: ","VS_T3PXMATH_02.ogg"}, 
    {"pgs","The excess of gains from an investment over its costs, divided by the investment costs.","2ascore","a"}, --CM+
    {"pg","The gains from an investment, minus the investment cost","2b"},
    {"pg","The gains from an investment, divided by the investment cost","2b"},
    {"pg","Investment cost, divided by the excess of gains over the investment cost","2b"},

{"label","2ascore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2b"},

{"label","2b"},
    {"ns","Alright, now here is the second question: A new factory will cost $10mm to set up and operate in its first year, and yield $10,800,000 in new sales.  What is the ROI of the new factory?","VS_T3PXMATH_03.ogg"}, 
    {"pg","18%","2c"},
    {"pg","108%","2c"},
    {"pgs","8%","2bscore","b"}, --CM+
    {"pg","104%","2c"},
	
{"label","2bscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2c"},

{"label","2c"},
    {"ns","Here's a really hard one: It says that an ice-cream franchise is planning a new store.  It spent $150,000 last year in a survey which found a profitable location.  Setting up the new location will cost about $3,000,000 – and it will bring in $5,000,000 in sales.  What is the return on the new store?","VS_T3PXMATH_04.ogg"}, 
    {"pg","5%","2d"},
    {"pgs","6%","2cscore","c"}, --CM+
    {"pg","1%","2d"},
    {"pg","8%","2d"},
	
{"label","2cscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2d"},

{"label","2d"},
    {"ns","There is one last problem, and it looks hard: A company has spent $20,000 on consultants who have arrived at two potential investments.  One is a new factory, which will cost $2,000,000 to set up, and generate about $2,250,000 in revenues.  The other is a mail-order catalog, which will cost $1,500,000, and generate $1,687,500.  Which of the two has the higher return on investment?","VS_T3PXMATH_05.ogg"}, 
    {"pg","The new factory would have a higher return on investment.","3"},
    {"pgs","Both investments have the same return on investment.","2dscore","d"}, --CM+
    {"pg","The mail order catalog would have a higher return on investment","3"},
    {"pg","The rate of return on these investments can not be determined based on the given information.","3"},
	
{"label","2dscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "3"},

{"label","3"},
    {"if","mathresult","<",2,"math2bad"},
    {"if","mathresult","<",3,"math2ok"},
    {"if","mathresult",">=",3,"math2good"},

{"label","math2bad"},
    {"ns","Well, that does it for all my homework! You've been a great help.  These problems were really tough...","VS_T3PXMATH_06.ogg"},
    {"pg","I agree.  That was some seriously hard math homework.","4a"},

	{"label","4a"},
    	{"ns","I don't really know about these problems – and I'm pretty sure I shouldn't hand this in. Come to think of it, I think I suddenly feel dizzy. I should lie down.","VS_T3PXMATH_07.ogg"}, 
    	{"pg","Well, now, Flora, I'm sure it's not as bad as all that...","5"},

{"label","math2ok"},
    {"ns","Well, that does it for all my homework! You've been a great help.  These problems were really tough...","VS_T3PXMATH_06.ogg"},
    {"pg","They were pretty difficult. And you do seem young for such difficult math homework.","4b"},

	{"label","4b"},
    	{"ns","I sure hope you are right about those answers you gave! Those were hard problems, but I'm going to be really embarrassed if I get them wrong.","VS_T3PXMATH_08.ogg"}, 
    	{"pg","Well, I wish you the best of luck!","5"},

{"label","math2good"},
    {"ns","Well, that does it for all my homework! You've been a great help.  These problems were really tough...","VS_T3PXMATH_06.ogg"},
    {"pg","Nah, those problems were no sweat.","4c"},

	{"label","4c"},
    	{"ns","Wow! That was really incredible.  You really are good at math! Boy is my teacher going to be proud of me!","VS_T3PXMATH_09.ogg"}, 
    	{"pg","I am happy you are pleased.","5"},

{"label","5"},
    {"fun",incmath},
    {"fun",incsq},
    {"ns","At any rate, thanks for taking time to help me with all of my homework! I am really glad you've been stopping by – because I really needed the help! Say – maybe I'll see you again sometime soon if you come back to town!","VS_T3PXMATH_10.ogg"}, 
    {"pg","Alright then Flora, I may see you soon, then. Good luck!","end"},


{"label","atd"},
    {"ns","I don't have any more math homework to challenge you with. Well, then – thanks for all of your help - you've been really great!","VS_T3PXMATH_11.ogg"},
    {"pg","Okay then. I'll come back later.  In the mean time, good luck!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
