local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"label","ifs"},
{"if","msq2","==",0,"ASD3"},
{"if","msq2","==",1,"4A"},
{"if","msq2","==",2,"ATD3"},

--******************
--FIRST MEETING
--******************

{"label","4A"},
{"ns","Hey there! Say, you’re the kid from Professional Team Services that Larry sent over, eh? Good thing you’re here because I got this decision I have to make that is giving me more trouble than a shipment of lead-tainted knick-knacks.","VS_T3PXMATHQU_13.ogg"},
{"pg","Okay, then, Manny what seems to be the problem?","4B"},

{"label","4B"},
{"ns","I am trying to decide whether I should get energy saving light bulbs for my business.  I currently use incandescent light bulbs which last about 1250 hours each. The energy-saving bulbs last about 10,000 hours. I leave my lights on for about 5000 hours each year.","VS_T3PXMATHQU_14.ogg"},
{"pg","Okay, so that’s the benefit derived from the different kinds of light bulbs now what are your costs?","4C"},

{"label","4C"},
{"ns","The light bulbs I use now cost $1 apiece, and then cost $.10 to operate for 24 hours.  The energy-saving light bulbs cost $17 each and cost $.02 per 24 hours to operate. Given these facts, which type of light bulb should I buy?","VS_T3PXMATHQU_15.ogg"},
{"pgs","The benefits and costs weigh out to be the same so there is no difference between energy saving bulbs, and the fluorescent bulbs you use now.","4D","d"},  --CM-
{"pgs","The numbers suggest you should purchase the same fluorescent bulbs you use now, because they are cheaper.","4D","e"},  --CM-
{"pgs","Based on a cost-benefit analysis, I suggest you purchase the energy-saving light bulbs.","ADDSCORE","f"},  --CM+
{"pg","You know, I’m not too sure I can answer this fully right now let me get back to you on this.","END"},

{"label","ADDSCORE"},
{"fun",addmqscore},
{"goto","4D"},

{"label","4D"},
{"fun2",incvars,"msq2"},
{"ns","Well, aren’t you clever! That was a fine analysis.  I think that just about wraps up my business with you – so I’ll be sure to let Larry know you were a great help!  I’ll see you around, kid!","VS_T3PXMATHQU_16.ogg"},
{"pg","I am happy you appreciate my analysis. Well, then, good luck!","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD3"},
{"ns","Heya, kid! Welcome to the Tchochke Shop.  Feel free to have a look around – but remember, if you break anything, you buy it!","VS_T3PXMATHQU_30.ogg"},
{"pg","Well best of luck with that!","END"},

--******************
--TALKED ALREADY
--******************

{"label","ATD3"},
{"ns","Heya again, kid! Say, thanks for your help before.  I really appreciate it!  Pop by and say hello any time!","VS_T3PXMATHQU_35.ogg"},
{"pg","Sure thing, Manny. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
