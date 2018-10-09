local dialogtext = {
{"if","wp1progress","==",0,"WP4ASD1"},
{"if","wp1progress","==",1,"WP41"},
{"if","wp1progress","==",2,"WP44"},
{"if","wp1progress","==",3,"WP4ATD1"},


--*********************
--HAVEN'T GOTTEN CLUE
--*********************

{"label","WP4ASD1"},
    {"ns","Welcome to the New City Cinema! Would you like a movie ticket? They cost $5. We’re sold out for the next few weeks, but we are donating all of the proceeds from ticket sales this week to the New City River Relief and Recovery fund.","VS_T3PXWP4_05.ogg"},
    {"pg","You bet, Sandy! Here’s $5.","buygood"},
    {"pg","Actually, I was just passing through. Sorry to trouble you.","END"},

{"label","buygood"},
    {"if","playercash",">=",5,"getgood"},
    {"n","It doesn't look like you have enough money."},
    {"wait","END"},
{"label","getgood"},
    --{"fun3",setvar,"good",true},
    {"goto","END"},

--***************
--GOT CLUE
--***************

{"label","WP41"},
    {"ns","Welcome to the New City Cinema! Would you like a movie ticket? We’re sold out for the next few weeks, but we are donating all of the proceeds from ticket sales this week to the New City River Relief and Recovery fund. ","VS_T3PXWP4_01.ogg"},
    {"pg","Actually, I am here because I have seen some evidence around town that indicates you may have been fooled into unwittingly accepting fraudulent donations.","incme"},
    {"pg","No, thanks! I was just passing through.","END"},

{"label","incme"},
    {"fun",incwp4},
    {"goto","WP42"},

{"label","WP42"},
    {"ns","Are you sure about that?  I would never take part in a scheme to defraud the City! These credentials are as real as the movies playing in our theater!","VS_T3PXWP4_02.ogg"},
    {"pg","No, those credentials are fakes and you should stop soliciting donations with them immediately - before the Mayor finds out and you get into serious trouble. ","WP43"},
    {"pg","You may be right.  I’ll look into this more – but I may be back.  I wouldn’t leave town if I were you.","END"},

{"label","WP43"},
    {"ns","Before the Mayor finds out?  I think you may be sitting too close to the screen, because you seem a little confused. Are you sure you’ve really looked into this?  The Mayor is the one who gave me these credentials!","VS_T3PXWP4_03.ogg"},
    {"pg","Are you serious?  The Mayor is behind this deception?  Thanks for the information! I must go speak to the Mayor right away. Goodbye!","MAYORINC"},
    {"pg","If the Mayor gave these credentials to you then they probably aren’t fakes. Sorry I bothered you. Goodbye.","END"},

{"label","MAYORINC"},
	{"if","mayorprogress",">",0,"END"},
	{"fun",incmayor},
	{"fun",incwp4},
	{"goto","END"},

--*******************
--BACK AGAIN
--*******************

{"label","WP44"},
    {"ns","Hello again! Are you here for a movie ticket? We’re sold out for quite a while, but we are donating all of the proceeds from ticket sales this week to the New City River Relief and Recovery fund. ","VS_T3PXWP4_04.ogg"},
    {"pg","After looking into the clues I’ve found around town, I am sure of it – your credentials are bogus!","WP42"},
    {"pg","No, I was just passing through.  See you later!","END"},




{"label","WP4ATD1"},
    {"ns","Well, I am just shocked that someone would attempt to defraud the City’ at a time like this – especially considering this disaster could wreak havoc on the movie-going public! I hope you find those responsible and bring them to justice!","VS_T3PXWP4_06.ogg"},
    {"pg","Thank you for your support, Sandy. We’ll do our best!","END"},


--**************
--END
--**************

	
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
