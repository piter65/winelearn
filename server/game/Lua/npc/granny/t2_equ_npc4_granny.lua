local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

-- BChance: Commented below because it was messing up side-quest progress.
-- {"if","msq1","~=",2,"ifs"},
-- {"if","msq2","~=",3,"ifs"},
-- {"if","msq3","~=",2,"ifs"},
-- {"if","msq4","~=",3,"ifs"},
-- {"if","msqprogress","~=",2,"ifs"},
-- {"fun2",incvars,"msq1"},
-- {"fun2",incvars,"msq2"},
-- {"fun2",incvars,"msq3"},
-- {"fun2",incvars,"msq4"},
-- {"fun2",incvars,"msqprogress"},

-- {"label","ifs"},
{"if","msq3","==",0,"ASD4B"},
{"if","msq3","==",1,"5A"},
{"if","msq3","==",2,"5D"},
{"if","msq3","==",3,"ATD4"},

--******************
--WRONG TASK
--******************

-- Peter Skips {"label","ASD4A"},
{"ns","Hello there, child.  Say, you’re from out of town, aren’t you?  Well it’s a shame you have to see us all like this.  Back in the old days, this was a swinging town!","VS_T2PXETHQU_33.ogg"},
{"pg","I sure will, Granny","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD4B"},
{"ns","There’s another young person.  Can you please tell this young man that he is gravely mistaken about ethical principles? And while you’re at it -can you tell him to get a haircut as well?","VS_T2PXETHQU_34.ogg"},
{"pg","Right then, maybe I should leave you two alone.","END"},

--*****************
--FIRST MEETING
--*****************

{"label","5A"},
{"fun2",incvars,"msq3"},
{"fun2",incvars,"msq4"},
{"ns","Just a minute, child - I am in the middle of trying to settle something here with this impetuous young man!  Wait– did Vern Sharpe send you here to come and get us? Well, you’ll have to settle this dispute for us so we can get going!","VS_T2PXETHQU_16.ogg"},
{"pg","Okay, then, What seems to be the problem?","5B"},

{"label","5B"},
{"ns","You see, child, I have a grandson in Wexlerberg that likes to play loud music on his car stereo.  Whenever he’s driving, he has all the windows down, and the music that plays on the car stereo just blares.","VS_T2PXETHQU_17.ogg"},
{"pg","Okay, I see. So, what do you think of that?","5C"},

{"label","5C"},
{"ns","Well I always tell him that driving around with the car stereo playing at a loud volume is wrong because most people don’t do that! I think those are ethical principles – but my friend who needs to get a haircut disagrees.","VS_T2PXETHQU_18.ogg"},
{"pgs","I think you’re right about this one. It sounds like you based your advice on ethical principles.","5D","e"},  --ED-
{"pgs","I’m not saying you’re right or wrong– but I don’t think that your thinking is guided by ethical principles.","5D","f"},  --ED+

{"label","5D"},
{"ns","Well, it’s just fine that you think that way.  We may not all agree with each-other but if it wasn’t for you, we would have been here for hours! Now, child, you can tell our friend Vern I’ll join him as soon as I can.","VS_T2PXETHQU_19.ogg"},
{"pg","Will do, Granny.  Good luck with your volunteer work.  I’ll see you around!","END"},

--******************
--COMPLETED QUEST
--******************

{"label","ATD4"},
{"ns","Well, hello again, youngster!  Say, thanks for your help before.  I’ll get moving along soon I was just admiring these hydrangeas.","VS_T2PXETHQU_41.ogg"},
{"pg","Yes, they sure are beautiful, Ms. Smith. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
