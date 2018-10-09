local dialogtext = {


{"if","pilotstage","==",0,"pedro_0"},
{"if","pilotstage","==",10,"pedro_10"},   -- evelyn
{"if","pilotstage","==",20,"pedro_20"},   -- will
{"if","pilotstage","==",30,"pedro_30"},   -- webster
{"if","pilotstage","==",40,"default"},
{"if","pilotstage","==",50,"will_50"},



{"label","default"},
	{"ns","I wonder if I can get on the National Idol TV show? \n\n Oh.  Hi again. \n\n You should probably talk to Evelyn at the team office to see where you should go next.","will9_0.ogg"},--audio
	{"pg","Okay, I'll go check with her.","end"},



{"label","pedro_0"},
	{"ns","Welcome to City Hall, but you should probably check in with Evelyn at the Professional Services office.  It's just down Main Street, on the left side, across from the Cinema.  Oh, my name is Will Standon.  And thank you for helping with our test!","will9_0.ogg"},--audio
	{"pg","I guess I should go meet with her.","end"},


{"label","pedro_20"},


-- Huh????
--	{"ns","This is simple debug text","VS_WOT1_02.wav"},--audio
--	{"p","Yes it is."},
-- Huh????


	{"ns","Glad to meet you!  I'm Will Standon and welcome to New City! \n\nYou've probably noticed much of New City is shut down.  Even the mayor is out today, but she wanted me to personally thank you, and your teacher, for helping us test this thing out.  With your help, we can make this a success!","will9_10.ogg"},
	{"p","You are welcome!  How can I help?"},



	{"ns","We need to test the audio. I assume you've already talked with Evelyn, so you know how to enter notes into the journal.  Start an entry for #4. Please type the nature of the device you are listening with: speaker, headphone, or maybe none. Your entry might look like this:\n\n#4. Headphones","will9_11.ogg"},--audio
	{"p","Entry for #4 is done.  What next?"},

	{"ns","Now let's do entry #5.  Listen to the sound effects of city hall.  Do you hear chatting in the distance?  If so, write something like 'sfx ok'.","will9_12.ogg"},--audio
	{"p","Comments on SFX are done.  What next?"},
 

	{"ns","Next I'm going to .. ahem .. sing a song.  Please write down if you can hear it ok.  And if you think I'm a good singer, it might help my career if you mentioned that as well!  Ready?","will9_13.ogg"},--audio
	{"p","Really?  Do you have to?  It seems a little silly for such a serious person."},


	{"ns","I work for the Mayor, and she's OK. \n\nI'm here every morning, but she's off today.\n\nWhen she returns, we'll get stuff done.\n\nWhile she is gone, I'll sing for fun!\n\n","will9_15.ogg"},--audio
	{"p","Um.  That was .. ehh.. interesting."},


	{"ns","Whatever you think of my singing, the important thing is to write down if you heard the song clearly.\n\nLet's make that #6 in your journal.  Please write down what you heard.","will9_16.ogg"},--audio
	{"p","Done.  I've made a note about the quality of audio."},


	{"fun3",setvar,"pilotstage",30},   --  Time to talk to Stan
	
	{"ns","So the next step is to talk with Webster Dweeb.  The Internet Cafe is on Main Street, kitty corner from the library.  While you're going back, pay attention to performance on your system.  Is your system glitching, or glatching, tiggling, or slow-loading. Webster knows the proper terms for that stuff.","will9_20.ogg"},--audio
	{"pg","Ok.  Will do!  I am going to the Internet Cafe.","end"},



{"label","pedro_30"},
	{"ns","Have you talked to Webster Dweeb at the Internet Cafe?  It's at the other end of Main Street.  Across from the Chinese Laundry, just past your company offices.","will9_30.ogg"},--audio
	{"pg","Okay, I'll go meet with him.","end"},


{"label","will_50"},
	{"ns","Maybe I should give up on my singing career.  \n\nHave you talked to Webster Dweeb at the Internet Cafe?  It's at the other end of Main Street.  Across from the Chinese Laundry, just past your company offices.","will9_30.ogg"},--audio
	{"pg","Okay, I'll go meet with him.","end"},



{"label","end"},
}
 return dialogtext
