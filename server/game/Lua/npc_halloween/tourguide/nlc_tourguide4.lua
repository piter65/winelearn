local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_tg"},
--{"if","tourguide","==",0,"asd1"},
{"if","tourguide","==",0,"tour1a"},
{"if","tourguide","==",1,"atd1"},
{"if","tourguide","==",2,"atd2"},

{"label","atd2"},
    {"ns","Hey, I don't have any new questions to ask you, though. Enjoy the rest of your stay here with us!","vs_nl_w4pxfun06.wav"},
    {"pg","Ok, I'll check back with you another time. Bye.","end"},

{"label","atd1"},
    {"ns","If you aren't busy right now, I have some trivia questions about New City to ask you. I will give you a reward for each answer you get right. Would you like to try and answer them now?","vs_nl_wxpxfun04.wav"},
    {"pg","Okay, that sounds fun!","tour2a"},
    {"pg","Thanks for the offer - but I was just passing through.","end"},

{"label","tour1a"},
    {"ns","Welcome to New City! I bet you've learned some interesting things while being \nhere. As the City's local tour guide I know a lot of interesting things about our city. If you'd like to test your knowledge about New City, you can answer some questions that I have. If you do a good job, you'll get a reward.","vs_nl_w1pxfun01.wav"},
    {"pg","Sure, why not?","tour2a"},
    {"pg","I haven't had time to look around the city much yet. I don't think I'm ready to test my New City knowledge.","postponed"},

{"label","tour2a"},
    {"ns","Please start by telling me the name of your team assistant.","vs_nl_w4pxfun01.wav"},
    {"pg","Our assistant's name is Judy.","tour3a"},
    {"pg","Our assistant's name is Maria.","tour3a"},
    {"pgs","Our assistant's name is Evelyn.","2score","a"},
    {"pg","Our assistant's name is Lucero.","tour3a"},

{"label","2score"},
	{"fun",addtouristscore},
	{"goto","tour3a"},

{"label","tour3a"},
    {"ns","Okay. Next, what is Sheriff Sam Shortback's twin brother's name?","vs_nl_w4pxfun02.wav"},
    {"pg","Billy .","tour4a"},
    {"pgs","Dave.","3score","b"},
    {"pg","Javier.","tour4a"},
    {"pg","Heschel.","tour4a"},

{"label","3score"},
	{"fun",addtouristscore},
	{"goto","tour4a"},
	
{"label","tour4a"},
    {"ns","Okay, now here is a tough one: What color is Will Standon's suit?","vs_nl_w4pxfun03.wav"},
    {"pgs","Navy Blue.","4score","c"},
    {"pg","Gray.","tour5a"},
    {"pg","Black.","tour5a"},

{"label","4score"},
	{"fun",addtouristscore},
	{"goto","tour5a"},

{"label","tour5a"},
    {"ns","Great! Now, this is the last question I will ask you about New City: What is the name of the New City High School football team?","vs_nl_w4pxfun04.wav"},
    {"pg","The Controllers.","tour6a"},
    {"pgs","The Joysticks.","5score","d"},
    {"pg","The Polygons.","tour6a"},
    {"pg","The Pleathernecks.","tour6a"},

{"label","5score"},
	{"fun",addtouristscore},
	{"goto","tour6a"},

{"label","tour6a"},
	{"fun",incsq},
	{"if","touristscore","==",0,"tour6b"},
	{"fun",calctourcash},
    {"ns2","Okay, well that's it for my questions! I think it's great that you care enough about New City to answer my trivia questions! You know, you answered %d of my 4 questions correctly. Please, take $%d. You earned it.","vs_nl_wxpxfun01.wav","touristscore","tourcash"},
    {"pg","Great! Thanks.","tour7a"},

{"label","tour6b"},
    {"ns","Okay, well that's it for my questions! I think its great that you care enough about New City to answer my trivia questions!","vs_nl_wxpxfun01.wav"},
    {"pg","Great! Thanks.","tour7a"},

{"label","tour7a"},
	{"fun3",setvar,"tourguide",2},
    {"ns","I hope you had fun answering my questions - and also, that you had a good time in New City these last few weeks. It was nice meeting you!","vs_nl_w4pxfun05.wav"},
    {"pg","Okay, great! See you around, maybe!","end"},

{"label","postponed"},
	{"fun3",setvar,"tourguide",1},
	{"goto","end"},

--{"label","asd1"},
    --{"n","Hi. Come back later if you'd like to answer some questions about New City."},
    --{"pg","Okay.","end"},
--
--{"label","asd2"},
    --{"ns","Hi! I am a New City tour guide, and I am here to answer any questions you may have about how to get around. Are you here to ask questions about New City?","vs_nl_wxpxfun03.wav"},
    --{"pg","I was just stopping to say hi.","end"},
    --{"pg","Actually, I am looking for a way to make some personal money. Do you have any ideas?","atd1"},

{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
