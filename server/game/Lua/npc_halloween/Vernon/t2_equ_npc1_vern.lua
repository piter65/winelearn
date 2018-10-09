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
{"if","msqprogress","==",0,"ASD1B"},
{"if","msqprogress","==",1,"1A"},
{"if","msqprogress","==",2,"2D"},
{"if","msqprogress","==",3,"7A"},
{"if","msqprogress","==",4,"ATD1A"},

--******************
--WRONG TASK
--******************

-- Peter is skipping {"label","ASD1A"},
{"ns","Well hello there, youngster! You’ll have to excuse me, but I don’t have time to talk. I am trying to find some last-minute volunteers for the relief and recovery effort!  ","VS_T2PXETHQU_26.ogg"},
{"pg","Pardon the interruption, then, Mr  Sharpe. I’ll see you later.","END"},

--******************
--NOT ACTIVATED
--******************

{"label","ASD1B"},
{"ns","Welcome to the United Americans Club! Feel free to have a look around – but just so you know, we are a bit busy right now trying to help coordinate volunteer workers for the relief and recovery effort. We’ll need help though, so come back later and we may have something for you to do!","VS_T2PXETHQU_27.ogg"},
{"pg","Right, then, Vern – I’ll be sure and check back with you soon to see if you need anything.","END"},

--******************
--FIRST MEETING
--******************

{"label","1A"},
{"ns","Hey there, youngster! My name is Vernon Sharpe, but you can call me Vern. Say, you’re in town helping the City with the oil spill! It’s a good thing you found us! Do you have a few minutes to lend me a hand? I am trying to get some volunteer workers down to the waterfront to help with the relief effort – and I think you may be able to help.","VS_T2PXETHQU_01.ogg"},
{"pg","Okay, then - what seems to be the trouble?","1C"},
{"pg","I am not sure I have time for this right now, Vern. I’ll talk to you later.","1B"},

	{"label","1B"},
	{"ns","Well, alright, then. But please, when you do find time, please hurry back here. I could really use some able bodies!","VS_T2PXETHQU_02.ogg"},
	{"pg","Okay, then, Vern– maybe I’ll see you again soon.","END"},

	{"label","1C"},
	{"ns","Okay, then, youngster, I’m happy you can spare the time! Here’s what I need: There are several volunteers in town who said they would do volunteer work – but they are apparently too busy arguing with each other to show up and get started! If you have a few minutes to help me out, I’d really appreciate it.","VS_T2PXETHQU_03.ogg"},
	{"pg","Okay, what do you need from me? ","2A"},
	{"pg","You know what, Vern? I am not sure I have the time to get into this right now. I may be back later.","1B"},

{"label","2A"},
{"ns","Well here is what I need, youngster: There are four volunteers in particular whom I would like you to go and find. They are arguing with each other about their ethical principles. You have to help them determine which of them have their facts straight so that they stop arguing - and then tell them to come back here!","VS_T2PXETHQU_04.ogg"},
{"pg","Okay, Vern, I think I know a thing or two about ethical principles. How do I get started?","2B"},
{"pg","On second thought, Vern, this sounds a little too involved for me right now. I’ll come back later after I brush up on ethical principles.","1B"},

{"label","2B"},
{"ns","You need to visit National Readiness Services, and after that, the New City Botanical Gardens. At each place, you will find two people who each face unique situations. Each has an idea for the ‘right’ thing to do in the situation, but doesn’t know if the idea is ethical or not.  You have to help them decide which ideas are actually based on ethical principles - so that they stop bickering about it and get started with their volunteer work!","VS_T2PXETHQU_05.ogg"},
{"pg","Sounds good, Vern. So now what?","2C"},

{"label","2C"},
{"fun2",incvars,"msq1"},
{"fun2",incvars,"msq2"},
{"fun2",incvars,"msq3"},
{"fun2",incvars,"msq4"},
{"fun2",incvars,"msqprogress"},
{"ns","You should head out now to the places I’ve told you about and talk to the people you find there.  Once you’ve determined whose ideas or beliefs are based on ethical principles, they will report for volunteer duty!  You should come and find me when you are finished – and I’ll give you something for your time.  I’ll see you back here soon!","VS_T2PXETHQU_06.ogg"},
{"pg","Okay, then, Vern. I’ll see you back here soon.","END"},

--******************
--Not talked to each npc
--******************

{"label","2D"},
{"ns","What are you doing here, youngster? You have to visit National Readiness Services and the New City Botanical Gardens to find the volunteers I am looking for! Remember, you have to settle their arguments and determine which of their decisions are based on ethical principles so that they’ll stop lollygagging and get to work! Go on, now, and I’ll see you back here when you’re done.","VS_T2PXETHQU_07.ogg"},
{"pg","Thanks for the reminder, Vern. I’ll see you back here when I’m done!","END"},

--******************
--Talked to NPC's
--******************

{"label","7A"},
{"ns","Welcome back, youngster!  I hope you have good news for me! Did you talk to everyone and help settle their arguments?","VS_T2PXETHQU_24.ogg"},
{"pg","You bet, Vern.","7B"},

{"label","7B"},
{"fun2",incvars,"msqprogress"},
{"fun2",incplayercash,50},
{"ns","Well that’s fine, then youngster.  I can’t tell you how relieved I am that you’ve taken care of this for me! Now, I find all this exhausting, so I am going to go off and take a nap – but here is the reward I promised you.  Thanks again for your time!","VS_T2PXETHQU_25.ogg"},
{"pg","Thanks for that, Vern.  I’ll leave you to your nap now.  See you around!","END"},

--******************
--COMPLETED QUEST
--******************

{"label","ATD1A"},
{"ns","Well, hello again youngster! Say, thanks for your help before. I could have never done it without you!  I guess I’ll see you around – but you’ll have to excuse me for now. I’m so exhausted from coordinating volunteers for the City! ","VS_T2PXETHQU_38.ogg"},
{"pg","I’m happy you are pleased, Vern. See you around!","END"},


--******************
--END
--******************

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
