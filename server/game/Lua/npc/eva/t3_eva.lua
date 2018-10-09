local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1A"},
{"if","uway","==",1,"ATD"},

	{"label","1A"},
	{"ns","Welcome back! Are you ready for your next ecological awareness challenge? I have five more questions for you – this time, they are about the ways that businesses interact with the environment– and in particular, the ways businesses use water and sustainability. Are you ready to answer them?","VS_T3PXGREEN_01.ogg"},
	{"pg","I think I know a thing or two about it,  and I’m up for a challenge.","2A"},
	{"pg","I don’t think I’m up for the challenge of demonstrating my knowledge about business’ water usage. I should look around for materials first.","END"},


	{"label","2A"},
	{"ns","Great! So here is the first question: Which of the following parties is the largest single user of water?","VS_T3PXGREEN_02.ogg"},
	{"pgs","Agriculture","2B","a"},
	{"pg","Industry","2C"},
	{"pg","Personal household users","2C"},
	{"pg","People and businesses with swimming pools","2C"},

		{"label","2B"},
    		{"fun",adduwayscore},
		{"ns","You’re right! Around 69% of the earth’s total water usage is by agriculture around the world.  Worryingly, up to 35% of the water used is wasted due to inefficient practices.","VS_T3PXGREEN_03.ogg"},
		{"pg","That is interesting. Shall we continue?","3A"},

		{"label","2C"},
		{"ns","Not quite. In reality, around 69% of human water use is by agriculture around the world.  Worryingly, up to 35% of the water used is wasted due to inefficient practices.  Individual homes and industry each use around 15%, while the share used recreationally is quite small –but growing.","VS_T3PXGREEN_04.ogg"},
		{"pg","Well guess I should know more facts about types of water users. Let’s move on.","3A"},

	{"label","3A"},
	{"ns","Okay, so speaking of water users, tell me: Which of the following are examples of industrial water use?","VS_T3PXGREEN_05.ogg"},
	{"pg","Water used in the chemical processes of a mine","3C"},
	{"pgs","These are all examples of ways that industry uses water.","3B","b"},
	{"pg","Water used as a solvent in a manufacturing plant","3C"},
	{"pg","Water used for power generation","3C"},

		{"label","3B"},
		{"fun",adduwayscore},
		{"ns","That’s correct! Much of the water used by industry is used for power generation, in mines and refineries, and at manufacturing facilities.  A great concern for industry in the future is to meet the challenge of using water in these processes more efficiently.","VS_T3PXGREEN_06.ogg"},
		{"pg","That certainly is interesting. Let’s continue.","4A"},

		{"label","3C"},
		{"ns","No, I’m sorry.  Power generation, refining oil and energy, mining for ores, and manufacturing are all activities that use water.  Much of the water used by industry is used for these activities.","VS_T3PXGREEN_07.ogg"},
		{"pg","Oh, I see. Well, let’s just move on. ","4A"},

	{"label","4A"},
	{"ns","Which of the following statements about agricultural water use is true?","VS_T3PXGREEN_08.ogg"},
	{"pg","Agricultural water users do not care about the environment.","4C"},
	{"pgs","Many in developing countries have a hard time making investments into water-saving technologies because of their limited immediate economic benefit.","4B","c"},
	{"pg","Crop selection does not affect agricultural yield or water usage.","4C"},
	{"pg","Most water usage occurs in developing countries.","4C"},

		{"label","4B"},
		{"fun",adduwayscore},
		{"ns","Sadly, you are correct.  A major concern for the 21st century is that agricultural water users – and the developing world in general – will have to find ways to start using resources more efficiently, even though there may not be clear economic incentives to do so.","VS_T3PXGREEN_09.ogg"},
		{"pg","That’s quite a death toll.  Let’s move on.","5A"},

		{"label","4C"},
		{"ns","Actually, that’s not right. The concern with agricultural water use in the third world is that individual farmers there have a hard time justifying investments into water saving technologies.  They must start to use their resources more efficiently, but there is rarely a clear economic incentive to do so.","VS_T3PXGREEN_10.ogg"},
		{"pg","I guess I have a thing or two to learn about water use in the developing world! Let’s move on, then.","5A"},

	{"label","5A"},
	{"ns","Okay, so before you go, I have two last questions about sustainable development.  To start, what is the principal focus of economic ‘development’? ","VS_T3PXGREEN_11.ogg"},
	{"pg","Economic growth","5C"},
	{"pgs","Using resources more efficiently in order to enhance the quality of life on earth.","5B","d"},
	{"pg","Creating more businesses so we can develop more products","5C"},
	{"pg","Eliminating our reliance on natural resources","5C"},

		{"label","5B"},
		{"fun",adduwayscore},
		{"ns","That’s right! While economic ‘growth’ entails that economy becomes bigger, constantly needing ever more nonrenewable resources such as water, ‘sustainability’ means that the economy becomes better, using finite resources to enhance human quality of life.  ","VS_T3PXGREEN_12.ogg"},
		{"pg","That’s a pretty big number, isn’t it?  That sounds like a terrible tragedy.","6A"},

		{"label","5C"},
		{"ns","You’re a little off the mark. While economic ‘growth’ entails that economy becomes bigger, constantly needing ever more nonrenewable resources such as water, ‘sustainability’ means that the economy becomes better, using finite resources to enhance human quality of life.  ","VS_T3PXGREEN_13.ogg"},
		{"pg","I guess I have a bit to learn about sustainable development. Well, let’s have one more. ","6A"},

	{"label","6A"},
	{"ns","Okay, so I have one last question: Models of sustainable feature: ","VS_T3PXGREEN_14.ogg"},
	{"pg","A stress on converting waste outputs from certain processes into inputs for others.","6C"},
	{"pgs","These are all features of sustainable development.","6B","e"},
	{"pg","An emphasis on providing services, rather than goods, as a way to promote economic development.","6C"},
	{"pg","Ideas on how ‘prudent financial thinking’ can help us ‘live of the interest’ of ‘invested’ natural capital","6C"},

		{"label","6B"},
		{"fun",adduwayscore},
		{"ns","That’s right - those are all tenets of ‘sustainable development’.  Mimicry of biological processes to efficiently use resources,  focusing on services rather than goods, and ‘living off’ of natural capital investments are all facets of the sustainable development model.","VS_T3PXGREEN_15.ogg"},
		{"pg","Okay, then. So is that it?","7"},

		{"label","6C"},
		{"ns","Well, you’re almost right! The truth is that all of these are tenets of sustainable development.  Mimicry of biological processes to efficiently use resources,  focusing on services rather than goods, and ‘living off’ of natural capital investments are all facets of theories of sustainable development.","VS_T3PXGREEN_16.ogg"},
		{"pg","Oh, well maybe I have a bit to learn about sustainable development. So that’s it, then?","7"},

	{"label","7"},
    	{"if","uwayscore","<",2,"7A"},
    	{"if","uwayscore","<",4,"7B"},
    	{"if","uwayscore",">=",4,"7C"},

		{"label","7A"},
		{"ns","Well, the challenge is over.  Unfortunately, you didn’t do well. You should really consider brushing up on your environmental knowledge – especially considering the crucial role of business as a water user in today’s world.","VS_T3PXGREEN_17.ogg"},
		{"pg","You’re right... I will be sure to brush up on my knowledge about the environment —it’s everybody’s concern!","8"},

		{"label","7B"},
		{"ns","You did pretty well with the challenge - but you could do better.  Our earth systems are a crucial concern of ours, especially now - and the world would be better off if everyone understood more about the role of business in the earth’s environment, and about sustainability.","VS_T3PXGREEN_18.ogg"},
		{"pg","You’re right.  I will be sure to keep up my studies on the environment —it’s everybody’s concern!","8"},

		{"label","7C"},
		{"ns","That was very good! We’re lucky to have people like you around at a time like this.  Keep up the good work!","VS_T3PXGREEN_19.ogg"},
		{"pg","Well, thanks for the compliment. I’m glad you are pleased.","8"},


	{"label","8"},
	{"fun3",setvar,"greencertificate",true},
	{"fun3",setvar,"uway",1}, -- BChance: Added to ensure that the quiz can't be retaken.
	{"ns","Well, that’s it for my challenges! I hope that throughout your time here in New City, I helped you learn something about the impact we have on the environment around us – especially where water is concerned. It was really nice talking to you – and who knows? Maybe if you come back to town, we’ll see each other again!","VS_T3PXGREEN_20.ogg"},
	{"pg","Well thanks for the opportunity to answer your challenges. I’ll see you around!","END"},



	{"label","ATD"},
	{"ns","Now that your time here is drawing to a close, I don’t have any more challenge questions for you on the environment. Good luck with the rest of your time here in New City!","VS_T3PXGREEN_21.ogg"},
	{"pg","Well, it was very nice meeting you.  Maybe I’ll see you in a few months!","END"},

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
