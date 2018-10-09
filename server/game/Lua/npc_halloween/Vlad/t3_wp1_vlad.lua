local dialogtext = {
{"if","wp1progress","==",0,"WP1ASD1"},
{"if","wp1progress","==",1,"WP11"},
{"if","wp1progress","==",2,"WP14"},
{"if","wp1progress","==",3,"WP1ATD1"},


--*********************
--HAVEN'T GOTTEN CLUE
--*********************

{"label","WP1ASD1"},
    {"ns","Hello there!  Would you like to buy a hot dog?  They cost $5, but it’s for a good cause: all of the proceeds this week are being donated to the relief and recovery effort to help save the New City River!","VS_T3PXWP1_05.ogg"},
    {"pg","You bet, Soloboloasch! Let me have one.","buygood"},
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

{"label","WP11"},
    {"ns","Hello there!  Would you like to buy a hot dog?  It’s for a good cause.  All of the proceeds go to the relief and recovery effort to help save the New City River!","VS_T3PXWP1_01.ogg"},
    {"pg","Actually, I am here because I have seen some evidence around town that indicates you may have been fooled into unwittingly accepting fraudulent donations.","incme"},
    {"pg","No, thanks! I was just passing through.","END"},

{"label","incme"},
    {"fun",incwp1},
    {"goto","WP12"},

{"label","WP12"},
    {"ns","Are you sure about that?  I would never take part in a scheme to defraud the City! These credentials are as valid as my certificate from the New City Department of Health!","VS_T3PXWP1_02.ogg"},
    {"pg","No, those credentials are fakes and you should stop soliciting donations with them immediately - before the Mayor finds out and you get into serious trouble. ","WP13"},
    {"pg","You may be right.  I’ll look into this more – but I may be back.  I wouldn’t leave town if I were you.","END"},

{"label","WP13"},
    {"ns","Before the Mayor finds out?  I think you’ve got some serious indigestion, because you seem a little confused. Are you sure you really looked into this?  The Mayor is the one who gave me these credentials!","VS_T3PXWP1_03.ogg"},
    {"pg","Are you serious?  The Mayor is behind this deception?  Thanks for the information!","MAYORINC"},
    {"pg","If the Mayor gave these credentials to you then they probably aren’t fakes. Sorry I bothered you. Goodbye.","END"},

{"label","MAYORINC"},
	{"if","mayorprogress",">",0,"END"},
	{"fun",incmayor},
	{"fun",incwp1},
	{"goto","END"},

--*******************
--BACK AGAIN
--*******************

{"label","WP14"},
    {"ns","Why, hello again!  Would you like to buy a hot dog?  It’s for a good cause!","VS_T3PXWP1_04.ogg"},
    {"pg","After looking into the clues I’ve found around town, I am sure of it – your credentials are bogus!","WP12"},
    {"pg","Oh, no I’m full. I’m just passing through.  See you around!","END"},




{"label","WP1ATD1"},
    {"ns","Well, I am just shocked that someone would attempt to defraud the City at a time like this – especially considering what this disaster could do to our local food supply! I hope you find who is responsible and bring them to justice!","VS_T3PXWP1_06.ogg"},
    {"pg","Thank you for your support, Soloboloasch. We’ll do our best!","END"},


--**************
--END
--**************

	
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
