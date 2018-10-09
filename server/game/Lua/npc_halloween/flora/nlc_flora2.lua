local dialogtext = {
{"fun3",setvar,"scoreconvo","nlc_math"},
    {"if","mathtest","==",0,"1a"},
    {"if","mathtest",">",0,"atd"},

{"label","1a"},
    {"ns","Hey! You seem familiar.  Did you come back here to help me with my new homework assignment? Thank goodness, because I'm having an even harder time with these problems! I have four problems, but these may take a little longer to solve than the last set.","VS_T2PXMATH_01.ogg"},
    {"pg","Sure, I am up for a challenge. Let's do it.","2a"},
    {"pg","I'm not sure I can spare the time. We all have our math problems, you know? I may be back, though!","end"},

{"label","2a"},
    {"ns","Okay, here is the first problem: The relationship between average sales price per unit (p), units sold (n) and revenues ('R') may be described using which of the following equations:","VS_T2PXMATH_02.ogg"}, 
    {"pgs","R/n = p","2ascore","a"}, --CM+
    {"pg","R – p = n ","2b"},
    {"pg","R = p/n ","2b"},
    {"pg","p = n*R","2b"},
	
{"label","2ascore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2b"},

{"label","2b"},
    {"ns","Alright, now the second question asks which of the following equations expresses variable costs?","VS_T2PXMATH_03.ogg"}, 
    {"pg","Profits, plus costs.","2c"},
    {"pg","Sales price per unit, times number of units produced.","2c"},
    {"pgs","Production cost per unit, times number of units sold.","2bscore","b"}, --CM+
    {"pg","Production cost per unit, times number of units produced.","2c"},
	
{"label","2bscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2c"},

{"label","2c"},
    {"ns","Here's the next one: A ticket to the Formal costs $176.50. In order to save enough to buy one, Linda decides to mow lawns. She earns $20 every time she mows a lawn, but must spend $5 on lawnmower fuel to mow each lawn.   Linda decided she will rent a lawnmower for $50 and start next Saturday.  What equation describes Linda's lawnmower operation?","VS_T2PXMATH_04.ogg"}, 
    {"pg","(20n) – (5n + 50) > 176.50","2d"},
    {"pgs","20n – (5n + 50) = Profit or Loss","2cscore","c"}, --CM+
    {"pg"," (5n) – [20n+ 50] = Profit or Loss","2d"},
    {"pg","(20n) – (5n + 50) = Revenues or Expenses","2d"},
	
{"label","2cscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "2d"},

{"label","2d"},
    {"ns","There is one last problem: A student bake sale has lost money each of the last three years, and the school is threatening to stop the long-standing tradition if it does not make at least $300 this year. The bake sale only has three goods for sale: apple pies (a) that cost $3, brownies (b) that cost $2, and cakes (c) that cost $5, which inequality describes the amount the bake sale must raise?","VS_T2PXMATH_05.ogg"}, 
    {"pg","3a + 2b + 5c - 300 = 0","3"},
    {"pgs","3a + 2b + 5c <= 300","2dscore","d"}, --CM+
    {"pg","3a + 2b + 5c >= 300 ","3"},
    {"pg","Can not be determined","3"},
	
{"label","2dscore"},
	{"fun",incresult},
	{"fun2",incplayercash,5},
    {"goto", "3"},

{"label","3"},
    {"if","mathresult","<",2,"math2bad"},
    {"if","mathresult","<",3,"math2ok"},
    {"if","mathresult",">=",3,"math2good"},

{"label","math2bad"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder each time! These problems were really tough.","VS_T2PXMATH_06.ogg"},
    {"pg","I agree.  ","4a"},

	{"label","4a"},
    	{"ns","Didn't you say you were good at math? I don't really know about these problems but I am pretty sure I shouldn't hand this in. Come to think of it, I don't feel so well...","VS_T2PXMATH_07.ogg"}, 
    	{"pg","Well, now, Flora, I'm sure it's not as bad as all that.","5"},

{"label","math2ok"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder each time! These problems were really tough.","VS_T2PXMATH_06.ogg"},
    {"pg","They were pretty difficult. And you do seem young for such difficult math homework.","4b"},

	{"label","4b"},
    	{"ns","I sure hope you are right about all of those answers you gave me! I don't want to get half of them wrong. That happened to me once in the past! Otherwise, I am going to be embarrassed in class again.","VS_T2PXMATH_08.ogg"}, 
    	{"pg","Well, I wish you the best of luck!","5"},

{"label","math2good"},
    {"ns","Well, that does it! We're done. You know, it seems as if my homework gets harder each time! These problems were really tough.","VS_T2PXMATH_06.ogg"},
    {"pg","Nah, those problems were no sweat.","4c"},

	{"label","4c"},
    	{"ns","Wow! That was amazing.  You really are good at math! I learned a lot just now. My teacher is going to be really proud!","VS_T2PXMATH_09.ogg"}, 
    	{"pg","I am happy that you are pleased.","5"},

{"label","5"},
    {"fun",incmath},
    {"fun",incsq},
    {"ns","At any rate, thanks for taking time to help me! I am really glad someone came by, because I was having a hard time.  I may be here with another homework assignment later on  so come and look for me some time. I always come here when I am having trouble with math homework!","VS_T2PXMATH_10.ogg"}, 
    {"pg","Alright then Flora, I may see you around, then. Good luck!","end"},


{"label","atd"},
    {"ns","I don't have any more math homework to challenge you with just yet. I may have more homework soon, though. I always come here when I get stuck on the problems they assign us at school!","VS_T2PXMATH_11.ogg"},
    {"pg","Okay then. I'll come back later.  In the mean time, good luck!","end"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
