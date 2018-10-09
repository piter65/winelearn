local dialogtext = {
{"if","wp1progress","==",0,"WP3ASD1"},
{"if","wp1progress","==",1,"WP31"},
{"if","wp1progress","==",2,"WP34"},
{"if","wp1progress","==",3,"WP3ATD1"},


--*********************
--HAVEN'T GOTTEN CLUE
--*********************

{"label","WP3ASD1"},
    {"ns","Welcome to the New City Public Library! We are doing a pledge drive this week for the New City River Relief and Recovery fund.  Would you like to give us your support? Our suggested donation is $5 per visitor.","VS_T3PXWP3_05.ogg"},
    {"pg","You bet! Here’s $5.","buygood"},
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

{"label","WP31"},
    {"ns","Welcome to the New City Public Library! We are doing a pledge drive this week for the New City River Relief and Recovery fund.  Would you like to make a donation?","VS_T3PXWP3_01.ogg"},
    {"pg","Actually, I am here because I have seen some evidence around town that indicates you may have been fooled into unwittingly accepting fraudulent donations.","incme"},
    {"pg","No, thanks! I was just passing through.","END"},

{"label","incme"},
    {"fun",incwp3},
    {"goto","WP32"},

{"label","WP32"},
    {"ns","Are you sure about that?  I would never take part in a scheme to defraud the City! These credentials are as legitimate as the Dewey Decimal System!","VS_T3PXWP3_02.ogg"},
    {"pg","No, those credentials are fakes and you should stop soliciting donations with them immediately - before the Mayor finds out and you get into serious trouble. ","WP33"},
    {"pg","You may be right.  I’ll look into this more – but I may be back.  I wouldn’t leave town if I were you.","END"},

{"label","WP33"},
    {"ns","Before the Mayor finds out?  I think you may need to learn how to organize information, since you seem a little confused. Are you sure you’ve really looked into this?  The Mayor is the one who gave me these credentials!","VS_T3PXWP3_03.ogg"},
    {"pg","Are you serious?  The Mayor is behind this deception?  Thanks for the information! I need to go speak to the Mayor right away. Goodbye!","MAYORINC"},
    {"pg","If the Mayor gave these credentials  to you then they probably aren’t fakes. Sorry I bothered you. Goodbye.","END"},

{"label","MAYORINC"},
	{"if","mayorprogress",">",0,"END"},
	{"fun",incmayor},
	{"fun",incwp3},
	{"goto","END"},

--*******************
--BACK AGAIN
--*******************

{"label","WP34"},
    {"ns","Why, hello again!  It’s nice to see out-of-towners so interested in our local library! Are you back to make a donation to New City River Relief and Recovery fund?","VS_T3PXWP3_04.ogg"},
    {"pg","After looking into the clues I’ve found around town, I am sure of it – your credentials are bogus!","WP32"},
    {"pg","No, I was just passing through.  See ya!","END"},




{"label","WP3ATD1"},
    {"ns","Well, I am just shocked that someone would attempt to defraud the City at a time like this – especially considering the impact this disaster could have on our community! I hope you find who is responsible and bring them to justice!","VS_T3PXWP3_06.ogg"},
    {"pg","Thank you for your support, Rita. We’ll do our best!","END"},


--**************
--END
--**************

	
{"label","END"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
