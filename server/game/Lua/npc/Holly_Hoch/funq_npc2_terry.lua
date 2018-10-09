local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"if","msq2","==",0,"ASD2"},
{"if","msq2","==",1,"3A"},
{"if","msq2","==",2,"3C"},
{"if","msq2","==",3,"3D"},
{"if","msq2","==",4,"ATD2"},

--******************
--DIDN'T RETURN ITEM
--******************

	{"label","ASD2"},
	{"ns","Welcome to the New City Preservation Society! My name’s Terry. I would normally welcome you in and ask you to take your shoes off - but you’ll have to excuse me right now. I am busy gathering supplies for the City’s relief and recovery effort for the folks at the command center by the docks. ","VS_T1PXFUNQU_27.ogg"},
	{"pg","Right then, Terry.","END"},

--******************
--FIRST NPC
--******************

	{"label","3A"},
	{"ns","Hello, there! Come in, come in. Take off your shoes! Welcome to the New City Preservation Society. I’m Terry Winkle! I was about to go downstairs and practice a little yoga while my tea is brewing. Would you like join me?","VS_T1PXFUNQU_08.ogg"},
	{"pg","Not just now, Terry – Mack sent me here to pick up some water sample kits from you.","3B"},
	{"pg","Oh, no thanks. I’m just poking around.","END"},

	{"label","3B"},
	{"fun3",setvar,"watersample",true},
	{"fun2",incvars,"msq1"},
	{"fun2",incvars,"msq2"},
	{"ns","Oh, far out! Mack said someone would be coming by. Here, have the sample collection kits. You can collect samples with these and use them to measure levels of contamination. That should help in our remediation efforts that is, cleaning, restoring and otherwise reversing environmental damage to the local water supply.","VS_T1PXFUNQU_09.ogg"},
	{"pg","Great! I’ll bring these back to Mack right now.  Thanks!","END"},

--******************
--DIDN'T RETURN ITEM
--******************

	{"label","3C"},
	{"ns","Whoa! What are you doing here? You have to get those sample collection kits back to Mack right away! Unless did you, like, lose them? That is not cool…look, you can have more if you need them…but you should hurry back and give those to Mack before you misplace them again…","VS_T1PXFUNQU_10.ogg"},
	{"pg","Yes, of course. I was just on my way to do that.","END"},

--******************
--RETURNED ITEM BUT QUEST NOT DONE
--******************

	{"label","3D"},
	{"ns","Whoa, like, what are you doing back here? Mack has been looking for you all over the place! I don’t think he’s going to chill out until you go and see him again – I think he has more stuff for you to do.","VS_T1PXFUNQU_11.ogg"},
	{"pg","Yes, of course. I was just on my way to see him now.","END"},

--******************
--DONE WITH QUEST
--******************

	{"label","ATD2"},
	{"ns","There you are! Come in, come in! Take off your shoes. Would you like some tea? I am like, totally amazed that you helped out like that! This world needs more people to volunteer to help preservation efforts!","VS_T1PXFUNQU_31.ogg"},
	{"pg","I’m happy you think so Terry….the feeling is mutual, I guess. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
