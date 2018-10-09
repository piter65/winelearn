local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_msq"},

{"if","msq1","~=",2,"ifs"},
{"if","msq2","~=",3,"ifs"},
{"if","msq3","~=",2,"ifs"},
{"if","msq4","~=",3,"ifs"},
{"if","msqprogress","~=",2,"ifs"},
{"fun2",incvars,"msq1"},
{"fun2",incvars,"msq2"},
{"fun2",incvars,"msq3"},
{"fun2",incvars,"msq4"},
{"fun2",incvars,"msqprogress"},

{"label","ifs"},
{"if","msq4","==",0,"ASD5B"},
{"if","msq4","==",1,"ASD5C"},
{"if","msq4","==",2,"6A"},
{"if","msq4","==",3,"6D"},
{"if","msq4","==",4,"ATD5"},

--******************
--WRONG TASK
--******************

{"label","ASD5A"},
{"ns","Hey, man! Aren't you here helping the City clean up the oil spill?  That's, like, far out, man.","VS_T2PXETHQU_35.ogg"},
{"pg","Well I'm glad you think so!","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD5B"},
{"ns","Can you please tell this lady here that she knows nothing about ethical principles? Talk about old fashioned!","VS_T2PXETHQU_36.ogg"},
{"pg","Right then, maybe I should leave you two alone.","END"},

--******************
--NOT TALKED TO OTHER NPC
--******************

{"label","ASD5C"},
{"ns","Now look, lady! I know you've been around – but I wasn't born last year! Excuse me, please, but can you tell her that my decision is based on ethical principles – and hers isn't!","VS_T2PXETHQU_37.ogg"},
{"pg","Right then, whatever you say. Let me talk to your friend over here","END"},

--*****************
--FIRST MEETING
--*****************

{"label","6A"},
{"fun2",incvars,"msq4"},
{"ns","Well, what do you think of that crazy lady?  I have to tell you, I think she may be an old-fashioned thinker, because I don't think she was acting on ethical principles. I, on the other hand, always do!","VS_T2PXETHQU_20.ogg"},
{"pg","Is that so?  Please, explain.","6B"},

{"label","6B"},
{"ns","Well, take the other day for example. I was eating a candy bar in the park, and there were no dumpsters anywhere nearby. Instead of littering and throwing the candy bar wrapper on the grass, I held on to it, so I could throw it away later on.","VS_T2PXETHQU_21.ogg"},
{"pg","Okay, I see – so you don't like to litter?","6C"},

{"label","6C"},
{"ns","Yeah, that's right. I never litter because I think that people have a right to clean parks and streets.  Now what do you think of that, man?","VS_T2PXETHQU_22.ogg"},
{"pgs","That sounds like you've based your decision not to litter on ethical principles.","6D","g"},  --ED+
{"pgs","I'm not saying that position is right or wrong decision – but I don't think it's based on ethical principles.","6D","h"},  --ED-

{"label","6D"},
{"ns","Well, that's settled then! Even if we don't all agree, at least we can all get along! You can tell Vern that I'll join the rest of the gang soon.  Thanks for the words of wisdom – that was far out!","VS_T2PXETHQU_23.ogg"},
{"pg","I am happy you appreciate my opinion. Well, then, good luck!","END"},

--******************
--COMPLETED QUEST
--******************

{"label","ATD5"},
{"ns","Hey, man, thanks again for your wisdom.  That was far out!","VS_T2PXETHQU_42.ogg"},
{"pg","I'm happy you are pleased, Charlie. See you around!","END"},

--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
