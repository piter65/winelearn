local dialogtext = {
{"if","wp1progress","==",0,"WP2ASD1"},
{"if","wp1progress","==",1,"WP21"},
{"if","wp1progress","==",2,"WP24"},
{"if","wp1progress","==",3,"WP2ATD1"},


--*********************
--HAVEN'T GOTTEN CLUE
--*********************

{"label","WP2ASD1"},
    {"ns","Hello, and welcome to Vitelli’s – New city’s finest purveyor of raw meats and meat byproducts! Can I interest you in something tasty for $5? We are donating the proceeds from our sales this week to the City’s relief and recovery effort – so it’s for a good cause!","VS_T3PXWP2_05.ogg"},
    {"pg","You bet, Alberto! Here’s $5.","buygood"},
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

{"label","WP21"},
    {"ns","Hello, and welcome to Vitelli’s – New city’s finest purveyor of raw meats and meat byproducts! Can I interest you in some cold cuts? The proceeds from our sales this week will be donated to the City’s relief and recovery effort – so it’s for a good cause!","VS_T3PXWP2_01.ogg"},
    {"pg","Actually, I am here because I have seen some evidence around town that indicates you may have been fooled into unwittingly accepting fraudulent donations.","incme"},
    {"pg","No, thanks! I was just passing through.","END"},

{"label","incme"},
    {"fun",incwp2},
    {"goto","WP22"},

{"label","WP22"},
    {"ns","Are you sure about that?  I would never take part in a scheme to defraud the City! My credentials are as genuine as these high-grade hormone-fed, factory-grown reconstituted meat patties! Are you sure you don’t want one?","VS_T3PXWP2_02.ogg"},
    {"pg","No, thanks - and those credentials are fakes and you should stop soliciting donations with them immediately - before the Mayor finds out and you get into serious trouble. ","WP23"},
    {"pg","No, thanks – but you may be right.  I’ll look into this more, but I may be back – so I wouldn’t leave town if I were you.","END"},

{"label","WP23"},
    {"ns","Before the Mayor finds out?  I think you may have had a bad batch of bologna, because you seem a little confused. Are you sure you’ve really looked into this?  The Mayor is the one who gave me these credentials!","VS_T3PXWP2_03.ogg"},
    {"pg","Are you serious?  The Mayor is behind this deception?  Thanks for the information! I need to speak with the Mayor right away, goodbye!","MAYORINC"},
    {"pg","If the Mayor gave these credentials  to you then they probably aren’t fakes. Sorry I bothered you. Goodbye.","END"},

{"label","MAYORINC"},
	{"if","mayorprogress",">",0,"END"},
	{"fun",incmayor},
	{"fun",incwp2},
	{"goto","END"},

--*******************
--BACK AGAIN
--*******************

{"label","WP24"},
    {"ns","Welcome back to Vitelli’s – I assume you came because you are hungry! Can I interest you in some raw ground mixed meat? It’s for a good cause- we are donating the proceeds of our sales this week to the City’s relief and recovery effort.","VS_T3PXWP2_04.ogg"},
    {"pg","After looking into the clues I’ve found around town, I am sure of it – your credentials are bogus!","WP22"},
    {"pg","No, I was just passing through.  See ya!","END"},




{"label","WP2ATD1"},
    {"ns","I am appalled that someone would attempt to defraud the City’ at a time like this – especially considering the impact the disaster could have on local cattle farms! I hope you find who is responsible and bring them to justice!","VS_T3PXWP2_06.ogg"},
    {"pg","Thank you for your support, Alberto. We’ll do our best!","END"},


--**************
--END
--**************

	
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
