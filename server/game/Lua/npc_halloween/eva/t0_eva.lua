local dialogtext = {

{"if","tourguide","==",0,"tuteva"},
{"if","tourguide","==",60,"tuteva"},
{"if","tourguide",">",99,"tut_over"},


{"label","busy"},
	{"ns","It's terrible.  Makes my heart break.","Eva1.wav"},
	{"pg","Yes, it's a mess.","end"},


{"label","tuteva"},
	{"ns","It is heartbreaking.  I loved sitting here and enjoying the view. Now look - all that devastation.  Thousands of gallons of oil contaminating our little bay of New City.","Eva1.wav"},--audio
	{"p","I see.  It is not pretty."},

	{"ns","Well, this oil spill will be all over the news tomorrow.  When people become aware, they will want answers.  My name is Eva, by the way, Eva Greene.","Eva2.wav"},
	{"p","Nice to meet you Ms. Greene."},

	{"ns","When the challenge begins, and your team is assigned the cleanup, come back and check with me.  I can give you quizzes about the environment, clean water, and all the latest research from New City University.","Eva3.wav"},--audio
	{"p","Okay. I will do that."},

	{"ns","Maybe, with a little education and planning, we could avoid disasters like this in the future.","Eva4.wav"},--audio

	{"p","I sure hope so."},

	{"ns","Also, you should know that there are other people in town who will quiz you on business, math, and ethics. So don't be shy about reaching out to people who are not experts or vendors. Some of these quizzes may affect your score, or even your grade in real life.","Eva5.wav"},--audio
	{"p","Oh.  Sounds serious."},

	{"ns","Well, to me, nothing is more serious than damage to the environment.\n\nI'm hoping when your team gets started, your group does the best job possible, using the limited funds from New City wisely.  I also know there are people around town who are willing to cheat the City and harm the environment just to make a buck off this disaster. It's best you avoid those types.","Eva6.wav"},

	{"p","I understand, I'll play the game carefully, reading everything I can find and trying to make wise decisions."},

	{"ns","Thank you, I hope you mean that. \n\n I am the last person for you to meet in the tutorial, so there isn't much more for you to do.  If you are a student, please tell your teacher you completed the tutorial.  You are welcome to walk around and explore New City, but most of the residents are not aware of the spill yet, so you won't make much real progress now.","Eva7.wav"},

	{"p","You are welcome Eva. My team won't disapoint you!"},

	{"ns","Well, good luck to you and your team!\n\nNew City needs a great team to help clean up this mess!\n\nLet your teacher know you completed the tutorial. Click the 'Q' icon below to leave the game. I hope to see you again soon.\n\n","Eva8.wav"},

     {"fun3",setvar,"tourguide",100},   --  Tutorial OVER!
	{"pg","Consider my teacher notified!  I'll see soon!","end"},
	
{"label","generic_lost"},
	{"n","You really must excuse me.  If you are lost ask your tourguide.
	It was a pleasure meeting you."},--audio
	{"pg","Ok, I'll check with her.","end"},

{"label","tut_over"},
	{"n","This just breaks my heart.  This could have been avoided."},--audio
	{"pg","It's a shame.","end"},

{"label","end"},
}
return dialogtext