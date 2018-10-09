local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1A"},
{"if","uway","==",1,"ATD"},

	{"label","1A"},
	{"ns","That’s some oil slick out there, huh? That’s an example of how concerned we all should be about water as an earth system. Oh, I’m sorry - my name is Eva Greene, and I am an environmental advocate.  I’m here with a challenge that will teach people in town all about the environment.  Do you have a moment to answer some questions?","VS_T1PXGREEN_01.ogg"},
	{"pg","I’ve actually looked at some materials about the earth’s water system. I think I know a thing or two about it, too, and I’m up for a challenge.","2A"},
	{"pg","I don’t think I’m up for the challenge of demonstrating my knowledge about the earth’s water system. I should look around for materials first.","END"},


	{"label","2A"},
	{"ns","Great! I am glad that you are up for the challenge. So here is how it works: I have five questions for you. You can answer each only once -- and as always, you can not take any answers back! Let’s start with an easy one: What percentage of the earth’s water is contained its oceans?","VS_T1PXGREEN_02.ogg"},
	{"pgs","About 97%","2B","a"},
	{"pg","About Three Quarters","2C"},
	{"pg","About Two Thirds","2C"},
	{"pg","About One third","2C"},

		{"label","2B"},
    		{"fun",adduwayscore},
		{"ns","That’s correct! About 97% of the water on earth is contained in the world’s oceans.  Of course, this isn’t water that is fit for human use – it is saltwater.  Freshwater, which we use for agriculture, for industry, and even for drinking water, is found elsewhere.","VS_T1PXGREEN_03.ogg"},
		{"pg","That is interesting. Let’s continue.","3A"},

		{"label","2C"},
		{"ns","Actually, you guessed a little low. You may be surprised, but up to 97% of the water on earth is contained in the world’s oceans! This isn’t water that is fit for human use – it is saltwater or seawater.  Freshwater, which we use for agriculture, for industry, and even for drinking water, is found elsewhere.","VS_T1PXGREEN_04.ogg"},
		{"pg","Well guess I should look more into the way that businesses use energy. Let’s move on.","3A"},

	{"label","3A"},
	{"ns","Okay, so speaking of freshwater, here’s another question: what percentage of the earth’s fresh water is contained in glaciers?","VS_T1PXGREEN_05.ogg"},
	{"pg","About One third","3C"},
	{"pgs","About Two Thirds","3B","b"},
	{"pg","About Three Quarters","3C"},
	{"pg","About 97%","3C"},

		{"label","3B"},
		{"fun",adduwayscore},
		{"ns","That’s correct! Most of the earth’s fresh water is frozen at the poles in large glaciers. Lakes, rivers and streams also have fresh water, but the fact is that about two-thirds of the world’s fresh water is contained in the earth’s glaciers and ice caps.","VS_T1PXGREEN_06.ogg"},
		{"pg","That certainly makes sense. Let’s continue.","4A"},

		{"label","3C"},
		{"ns","No, that’s incorrect. The fact is that about two-thirds of the world’s fresh water is frozen at its poles! Lakes, rivers and streams also have fresh water, but the fact is most of the world’s fresh water is contained in glaciers and ice caps.","VS_T1PXGREEN_07.ogg"},
		{"pg","Oh, I see. Let’s continue.","4A"},

	{"label","4A"},
	{"ns","So, here’s another one: Moisture is released into the atmosphere by trees and plants.  This process is known as:","VS_T1PXGREEN_08.ogg"},
	{"pg","Perspiration","4C"},
	{"pgs","Transpiration","4B","c"},
	{"pg","Respiration","4C"},
	{"pg","Conflagration","4C"},

		{"label","4B"},
		{"fun",adduwayscore},
		{"ns","That’s right!  The water cycle has several processes whereby moisture is introduced into the atmosphere. When plants release moisture, it is known as transpiration. When it is released from bodies of water, is known as evaporation.","VS_T1PXGREEN_09.ogg"},
		{"pg","Yes, let’s move on.","5A"},

		{"label","4C"},
		{"ns","I’m sorry, that just isn’t right. When plants release moisture, it is known as transpiration. In fact, the water cycle has several processes whereby moisture is introduced into the atmosphere. When it is released from bodies of water, is known as evaporation.","VS_T1PXGREEN_10.ogg"},
		{"pg","Oh, I see. I guess I have a bit to learn about water systems, then. Let’s move on, then.","5A"},

	{"label","5A"},
	{"ns","Okay, so now that we have talked about water systems a little bit, here’s my next question: Earth neither loses nor gains much matter from outer space.  This implies that earth may be thought of as:","VS_T1PXGREEN_11.ogg"},
	{"pg","A hybrid system","5C"},
	{"pg","An open system","5C"},
	{"pgs","A closed system","5B","d"},
	{"pg","A solar system.","5C"},

		{"label","5B"},
		{"fun",adduwayscore},
		{"ns","That’s correct - Earth is a closed system, which does not gain much matter from, nor lose much matter to, outer space - including water.  Most of the water on earth has been since eons before humans appeared and is continuously reused.","VS_T1PXGREEN_12.ogg"},
		{"pg","Okay, then. Let’s continue.","6A"},

		{"label","5C"},
		{"ns","No, I’m sorry, that’s just not right. The truth is that Earth is a closed system, which means that it does not gain much matter from, nor lose much matter to, outer space.  This includes water, which is continuously reused in a water cycle.","VS_T1PXGREEN_13.ogg"},
		{"pg","I guess I have to learn a few facts about water. Let’s continue. ","6A"},

	{"label","6A"},
	{"ns","Okay, now here’s one last tricky question, and it is about the way the earth returns water to the oceans during the water cycle.  Approximately how much of earth’s rainfall lands directly in its oceans and water ways?","VS_T1PXGREEN_14.ogg"},
	{"pgs","About Three Quarters","6B","e"},
	{"pg","About Two Thirds","6C"},
	{"pg","About One third","6C"},
	{"pg","About one fourth","6C"},

		{"label","6B"},
		{"fun",adduwayscore},
		{"ns","Amazing! That’s correct. Roughly 75% of the rain that falls on earth every year goes directly back into its oceans.  I am impressed you knew that!","VS_T1PXGREEN_15.ogg"},
		{"pg","Okay, then. So is that it?","7"},

		{"label","6C"},
		{"ns","Not quite – the real number is higher than that. Just as three quarters or the earth’s surface is covered by oceans, about three-quarters of the rain that falls on the planet is returned directly to its oceans and seas. ","VS_T1PXGREEN_16.ogg"},
		{"pg","Oh, well maybe I have a bit to learn about rainfall, and oceans, and the water systm. So that’s it, then?","7"},

	{"label","7"},
    	{"if","uwayscore","<",2,"7A"},
    	{"if","uwayscore","<",4,"7B"},
    	{"if","uwayscore",">=",4,"7C"},

		{"label","7A"},
		{"ns","Well, the challenge is over – and I’m glad.  You really didn’t do very well! You should consider brushing up on your environmental knowledge about the water cycle – especially considering the importance of preserving our natural resources these days!","VS_T1PXGREEN_17.ogg"},
		{"pg","You’re right, that was terrible.  I will be sure to brush up on my knowledge before the next challenge that you give me.","8"},

		{"label","7B"},
		{"ns","You did pretty well with the challenge - but you could do better.  The environment is a crucial concern of ours, especially now - and the world would be better off if everyone understood more about the water cycle.","VS_T1PXGREEN_18.ogg"},
		{"pg","You’re right.  When we meet for the next challenge, I’ll be sure to be well-studied! ","8"},

		{"label","7C"},
		{"ns","You did very well! We’re lucky to have people like you around at a time like this. Keep up the good work!","VS_T1PXGREEN_19.ogg"},
		{"pg","Well, thanks for the compliment. I’m glad you are pleased.","8"},


	{"label","8"},
	{"fun3",setvar,"greencertificate",true},
	{"fun3",setvar,"uway",1}, -- BChance: Added to ensure that the quiz can't be retaken.
	{"ns","Well that does it for my challenge for now.  I hope you learned something about the ways business interacts with the environment - and its role and responsibilities when it comes to conservation and recycling. Come and find me after you start your next task - I’ll have a challenge for you on ways we can responsibly use water!","VS_T1PXGREEN_20.ogg"},
	{"pg","Well thanks for the opportunity to answer your questions. I’ll see you around!","END"},



	{"label","ATD"},
	{"ns","I don’t have any more challenge questions for you on the environment just yet. Come and find me after you start your next task, though, and I’ll have a challenge for you on ways we can responsibly use water!","VS_T1PXGREEN_21.ogg"},
	{"pg","Oh, well, then. See you soon!","END"},

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
