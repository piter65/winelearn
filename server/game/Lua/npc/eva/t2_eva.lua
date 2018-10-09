local dialogtext = {

{"fun3",setvar,"scoreconvo","nlc_uw"},
{"if","uway","==",0,"1A"},
{"if","uway","==",1,"ATD"},

	{"label","1A"},
	{"ns","Welcome back! Are you ready for your next ecological awareness challenge? I have five more questions for you – this time, they are about personal responsibility when it comes to the environment – and in particular, about water conservation. Are you ready to answer them?","VS_T2PXGREEN_01.ogg"},
	{"pg","I’ve actually looked at some materials about responsibility and the environment. I think I know a thing or two about it. Sure, I’m up for a challenge.","2A"},
	{"pg","I don’t think I’m up for the challenge of demonstrating my knowledge about responsibility and the environment. I should look around for materials first.","END"},


	{"label","2A"},
	{"ns","Great! So here is the first question: What is the primary use for drinking water in the typical North American home?","VS_T2PXGREEN_02.ogg"},
	{"pgs","Flushing the toilet","2B","a"},
	{"pg","Cleaning dishes and floors","2C"},
	{"pg","Taking showers and baths","2C"},
	{"pg","For drinking purposes","2C"},

		{"label","2B"},
    		{"fun",adduwayscore},
		{"ns","That’s correct! Surprisingly enough, of the water that is used in the home, flushing the toilet is the biggest single use of water. Dishwashers, showers, and even baths don’t use as much water per day as the average toilet – or worse – a leaky toilet!","VS_T2PXGREEN_03.ogg"},
		{"pg","That is interesting. Shall we continue?","3A"},

		{"label","2C"},
		{"ns","No, that’s not right. Believe it or not, of the water used in an average home in North America, the leading water use activity is flushing the toilet.  Contrary to what you may think, toilets use much more drinking water than dishwashers or even showers and baths!","VS_T2PXGREEN_04.ogg"},
		{"pg","Well I guess I should look more into the way that we use water in the home. Let’s move on, then, shall we?","3A"},

	{"label","3A"},
	{"ns","Okay, so speaking of water usage, tell me this:  How many gallons of drinking water does the average American use per day?","VS_T2PXGREEN_05.ogg"},
	{"pg","About 10","3C"},
	{"pgs","About 100","3B","b"},
	{"pg","About 50","3C"},
	{"pg","About 25","3C"},

		{"label","3B"},
		{"fun",adduwayscore},
		{"ns","That’s correct! If you can believe it, the average American home uses around 100m gallons of water per day.  The average home uses about 100 gallons when indoor and outdoor water usage activities are combined.","VS_T2PXGREEN_06.ogg"},
		{"pg","That certainly is a concern. Let’s continue.","4A"},

		{"label","3C"},
		{"ns","No, that’s wrong – the answer is higher than that, if you can believe it! American homes use around 100m gallons of water per day.  The average home uses about 100 gallons when indoor and outdoor water usage activities are combined.","VS_T2PXGREEN_07.ogg"},
		{"pg","Oh, I see. Well, let’s just move on. ","4A"},

	{"label","4A"},
	{"ns","So now that we’re on the topic of wasting water in the home -- older toilets are much less efficient than newer toilets, using up to almost 5 gallons more water, per flush.  How can you tell if your toilet is a less efficient, pre-1992 model?","VS_T2PXGREEN_08.ogg"},
	{"pg","Cutting it open and counting the rings","4C"},
	{"pgs","Uninstalling the toilet to look at the back, at the manufacturer’s imprint","4B","c"},
	{"pg","By the shape of the flush handle","4C"},
	{"pg","Asking your parents or legal guardian","4C"},

		{"label","4B"},
		{"fun",adduwayscore},
		{"ns","That’s right!  Efficient toilets built in the last ten years average 1.1 gallons per flush.  Before 1992, toilets used between 5 and 6 gallons! You can check the date stamp inside the toilet by lifting the lid and looking underneath, at the back of the toilet, to find the manufacturer's imprint of the make, model and date of manufacture of the appliance. ","VS_T2PXGREEN_09.ogg"},
		{"pg","Incredible, isn’t it. Now,  let’s continue.","5A"},

		{"label","4C"},
		{"ns","That’s a clever guess, but that’s not right. You can check the date stamp inside the toilet by lifting the lid and looking underneath, at the back of the toilet, to find the manufacturer's imprint of the make, model and date of manufacture of the appliance. ","VS_T2PXGREEN_10.ogg"},
		{"pg","I guess I have a thing or two to learn about toilets! Let’s move on, then.","5A"},

	{"label","5A"},
	{"ns","Okay, so now that we have talked about water wasting appliances, do you know how much of its overall water usage does the average American home lose to silent or slow leaks?","VS_T2PXGREEN_11.ogg"},
	{"pg","About 5%","5C"},
	{"pgs","About 10%","5B","d"},
	{"pg","Less than 1%","5C"},
	{"pg","About 2%","5C"},

		{"label","5B"},
		{"fun",adduwayscore},
		{"ns","That’s correct. Silent and slow leaks around the house can add up. Studies show that homes can waste up to 10% of the water they use to leaks, which cost both families and the environment!","VS_T2PXGREEN_12.ogg"},
		{"pg","That’s a pretty big number, isn’t it?","6A"},

		{"label","5C"},
		{"ns","No, I’m sorry – the answer is actually higher than that. Studies show that homes can waste up to 10% of the water they use to leaks, which costs both American families -- and the global environment!","VS_T2PXGREEN_13.ogg"},
		{"pg","I guess I have a bit to learn about how efficiently we use water in this country! Well, let’s move on. ","6A"},

	{"label","6A"},
	{"ns","Okay, so I have one last question – How much water can personal water conservation efforts like fixing leaks and replacing older appliances save?","VS_T2PXGREEN_14.ogg"},
	{"pg","Scores of gallons per week","6C"},
	{"pgs","All of these represent potential water savings accrued from conservation efforts","6B","e"},
	{"pg","Hundreds of gallons per month","6C"},
	{"pg","Thousands of gallons per year","6C"},

		{"label","6B"},
		{"fun",adduwayscore},
		{"ns","That’s right ! It often makes a great deal of ecological – and economic - sense to conserve water. Leaks can add up to scores of gallons per day, hundreds per month, or thousands per year.  In fact, if we repaired the leaks in 1 of every 100 homes across America, we could still save billions gallons of water each year!","VS_T2PXGREEN_15.ogg"},
		{"pg","Okay, then. So is that it?","7"},

		{"label","6C"},
		{"ns","I am sorry, but that’s wrong.  The math must have confused you! Leaks can add up to scores of gallons per day, hundreds per month, or thousands per year.  All of these answers are correct.","VS_T2PXGREEN_16.ogg"},
		{"pg","Oh, well maybe I have a bit to learn about water usage. So that’s it, then?","7"},

	{"label","7"},
    	{"if","uwayscore","<",2,"7A"},
    	{"if","uwayscore","<",4,"7B"},
    	{"if","uwayscore",">=",4,"7C"},

		{"label","7A"},
		{"ns","Well, the challenge is over – and you didn’t do well.  You should really consider brushing up on your environmental knowledge – especially considering how important water conservation will become in the near future!","VS_T2PXGREEN_17.ogg"},
		{"pg","You’re right, that was terrible.  I will be sure to brush up on my knowledge about the environment before the next challenge that you give me.","8"},

		{"label","7B"},
		{"ns","You did pretty well with the challenge - but you could do better.  The environment is a crucial concern of ours, especially now - and the world would be better off if everyone understood more about their household impact on the environment.","VS_T2PXGREEN_18.ogg"},
		{"pg","You’re right.  When we meet for the next challenge, I’ll be sure to be well-studied! ","8"},

		{"label","7C"},
		{"ns","You did very well! We’re lucky to have people like you around at a time like this. Keep up the good work!","VS_T2PXGREEN_19.ogg"},
		{"pg","Well, thanks for the compliment. I’m glad you are pleased.","8"},


	{"label","8"},
	{"fun3",setvar,"greencertificate",true},
	{"fun3",setvar,"uway",1}, -- BChance: Added to ensure that the quiz can't be retaken.
	{"ns","Well that does it for my challenge for now.  I hope you learned something about the impact we have on the environment in our day-to-day lives – especially where water is concerned. Come and find me after you start your next task - I’ll have a challenge for you about issues related to business, its water usage, and the environment!","VS_T2PXGREEN_20.ogg"},
	{"pg","Well thanks for the opportunity to answer your challenge. I’ll see you around!","END"},



	{"label","ATD"},
	{"ns","I don’t have any more challenge questions for you on the environment just yet. Come and find me after you start your next task and I’ll have a challenge for you on issues related to business, its water usage, and the environment!","VS_T2PXGREEN_21.ogg"},
	{"pg","Oh, well, then. See you soon!","END"},

{"label","END"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
 return dialogtext
