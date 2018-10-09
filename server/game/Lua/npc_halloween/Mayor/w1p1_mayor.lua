local dialogtext = {
	{"if","mayorprogress","==",0,"ASD1"},
	{"if","mayorprogress","==",1,"1A"},
	{"if","mayorprogress","==",2,"ATD1"},
	{"if","mayorprogress","==",3,"M2ASD1"},
	{"if","mayorprogress","==",4,"M22A"},
	{"if","mayorprogress","==",5,"M2ATD1"},

{"label","1A"},
		{"fun",incstandon},
		{"fun",incevelyn},
		{"fun",incmayor},
		{"fun",talkedtomayor},
		{"fun2",incvars,"journalprogress"},
		{"fun3",setvar,"scoreconvo","m1"},
	{"ns","Hello!  My name is Mayor Judy Gonzales. You work for Stan Freeman, correct? Thank you for meeting with me.  I am really grateful that your team is here to help us through this crisis. As you can imagine, I am very busy – so let’s get right to work, shall we?","null.wav"},
	{"pg","Pleased to meet you, Your Honor.  Let’s please begin.","2A"},
	 -- scorea:-MA
	{"pg","Pleasure meeting you, Your Honor. Let’s please begin.","2B"},
	
{"label","2A"},
	{"ns","Yes, now before we start, let me remind you that now more than ever, we have an image to uphold for the citizens of New City.  In the future, when you have an appointment at City Hall, you must dress appropriately.","null.wav"},
	{"pg","I understand, Your Honor.  Thanks for letting me know.","3"},
{"label","2B"},
	{"ns","Okay, so, let’s get started... wait, my... you know, you look very professional.  Thank you for dressing for the occasion. I appreciate it when people show up to City Hall looking their best.  It\'s always best to put your best foot forward.","null.wav"},
	{"pg","Thank you Your Honor, I understand the importance of professionalism.","3"},
	 -- scoreb:+MA
------THIS IS WHERE STUFF STARTS TO GET HARD-------
{"label","3"},
	{"ns","So, who do you think we should hire to be the media relations firm to help us through the first stages of this crisis?  I have anxiously been awaiting your recommendation.","null.wav"},
	{"pg","I think we should go with Narravi Associates, Ms. Mayor.","5AV1"},
	{"pg","I think we should go with New Media Communications, Ms. Mayor.","4AV2"},
	{"pg","I think we should go with Norse Communications, Ms. Mayor.","4AV3"},
	{"pg","I think we should go with Media Relations Inc, Ms. Mayor.","4AV4"},
---KEY---
---4A= No Narravi----
---5A= No New Media---
---6A= No Norse Media---
---7A= No Media Rel---
---8A= Narravi----
---9A= New Media---
---10A= Norse---
---11A= Media Rel---

---START IF PLAYER CHOOSES NARRAVI ASSOCIATES  (**V1)---
{"label","5AV1"},
	{"fun",incvendor1},
	{"ns","I am the Mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with New Media Communications?","null.wav"},
	{"pg","It seems that they are involved with wrongdoing at Idion Energy Associates.  It’s all over the news.","5BV1"},
	 -- scorea:-MD
	{"pg"," Well I am concerned NMC will not be able to position our messages to the public in a positive way.","5CV1"},
	 -- scoreb:+MD
	{"pg","I am concerned NMC can’t communicate messages to the general public clearly and concisely.","5BV1"},
	 -- scorec:-MD

{"label","5BV1"},
	{"ns","Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","There is research around town I’ve read that supports that, I think.","6AV1"},


{"label","5CV1"},
	{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Well done.","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","6AV1"},


{"label","6AV1"},
	{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Norse Communications?","null.wav"},
	{"pg","Norse only handles small scale projects– so I don’t think they are a good bet.","6BV1"},
	 -- scorea:-MD
	{"pg","Because it concentrates on multinational clients, Norse doesn’t have the local press contacts we are looking for.","6CV1"},
	 -- scoreb:+MD
	{"pg","Norse has proven they are unreliable when it comes to clearly communicating technical information.","6BV1"},
	 -- scorec:-MD


{"label","6BV1"},
	{"ns","I’m not sure you have your facts straight.  I am going to trust you, although that does not seem likely to me.","null.wav"},
	{"pg","I’ve read up on this, and I am confident that this is correct. ","7AV1"},


{"label","6CV1"},
	{"ns","That sounds right.  You’ve done your research – good job.","null.wav"},
	{"pg"," Thank you, Your Honor.  Is there anything else you’d like to know?","7AV1"},


{"label","7AV1"},
	{"ns","I see.  So, before we move on, tell me why you decided against Media Relations, Inc..","null.wav"},
	{"pg","Marvin Moneymaker is a terrible businessman, and I don’t think we should hire anyone who is unsuccessful.","7BV1"},
	 -- scorea:-MD
	{"pg","I don’t think Media Relations has the ability to interpret data and communicate clearly to the general public.","7CV1"},
	 -- scoreb:+MD
	{"pg","Marvin Moneymaker doesn’t have enough experience in media relations, or a track record of success.","7BV1"},
	 -- scorec:-MD


{"label","7BV1"},
	{"ns","That doesn’t sound right.  I’ll trust you, but I’m not sure about your decision.","null.wav"},
	{"pg","I appreciate that Your Honor, but I’ve looked around, and I believe this is true.","8AV1"},


{"label","7CV1"},
	{"ns","That’s seems like a good enough reason to me!  You’ve done your research – good job. ","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","8AV1"},


{"label","8AV1"},
	{"ns","Right then, so now that I know why you didn’t pick the other vendors, tell me why you chose Narravi Associates?","null.wav"},
	{"pg","Ojeda is overly laid back and very disorganized – and so I was concerned she wouldn’t be a good fit for us.","8BV1"},
	 -- scorea:-MD
	{"pg","I think Ojeda has proven her ability to make sure our message gets out both here in town and across the state.","8CV1"},
	 -- scoreb:+MD
	{"pg"," I’ve read about how Narravi Associates is just one branch of a large multinational enterprise which is good because they are located here in New City.","8B"},
	 -- scorec:-MD


{"label","8BV1"},
	{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","null.wav"},
	{"pg","I have looked into this and I believe I have made the right choice.","12A"},  --DO 12A/12B LATER


{"label","8CV1"},
	{"ns","That seems like good reason to me. It appears you have done thorough research.  Well done.","null.wav"},
	{"pg","Thank you, Your Honor.  What else do you need to know?","12A"},  --DO 12A/12B LATER
---END IF PLAYER CHOOSES NARRAVI ASSOCIATES---

---START IF PLAYER CHOOSES NEW MEDIA COMMUNICATIONS  (**V2)---
{"fun",incvendor2},
{"label","4AV2"},
	{"ns","I see. So, I know a little about who is available and I am curious, why didn’t you choose Narravi Associates?","null.wav"},
	{"pg","I don’t think Ojeda has enough experience getting complicated messages across to the general public.","4BV2"},
	 -- scorea:-MD
	{"pg","Well I understand that Ms. Ojeda has been known to refuse governments and government agencies as clients.","4CV2"},
	 -- scoreb:+MD
	{"pg","I discovered that Ms. Ojeda probably wouldn’t be interested in the job.","4BV2"},
	 -- scorec:-MD


{"label","4BV2"},
	{"ns","Oh, really??   Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","I believe this is true – I remember seeing it during my research.","6AV2"},


{"label","4CV2"},
	{"ns","Well, that sounds like a good reason to me!  It sounds as though you’ve done your research!  Well done!","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","6AV2"},


{"label","6AV2"},
	{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Norse Communications?","null.wav"},
	{"pg","Norse only handles small scale projects– so I don’t think they are a good bet.","6BV2"},
	 -- scorea:-MD
	{"pg","Because it concentrates on multinational clients, Norse doesn’t have the local press contacts we are looking for.","6CV2"},
	 -- scoreb:+MD
	{"pg","Norse has proven they are unreliable when it comes to clearly communicating technical information.","6BV2"},
	 -- scorec:-MD


{"label","6BV2"},
	{"ns","I’m not sure you have your facts straight.  I am going to trust you, although that does not seem likely to me.","null.wav"},
	{"pg","I’ve read up on this, and I am confident that this is correct. ","7AV2"},


{"label","6CV2"},
	{"ns","That sounds right.  You’ve done your research – good job.","null.wav"},
	{"pg"," Thank you, Your Honor.  Is there anything else you’d like to know?","7AV2"},


{"label","7AV2"},
	{"ns","I see.  So, before we move on, tell me why you decided against Media Relations, Inc..","null.wav"},
	{"pg","Marvin Moneymaker is a terrible businessman, and I don’t think we should hire anyone who is unsuccessful.","7BV2"},
	 -- scorea:-MD
	{"pg","I don’t think Media Relations has the ability to interpret data and communicate clearly to the general public.","7CV2"},
	 -- scoreb:+MD
	{"pg","Marvin Moneymaker doesn’t have enough experience in media relations, or a track record of success.","7BV2"},
	 -- scorec:-MD


{"label","7BV2"},
	{"ns","That doesn’t sound right.  I’ll trust you, but I’m not sure about your decision.","null.wav"},
	{"pg","I appreciate that Your Honor, but I’ve looked around, and I believe this is true.","9AV2"},


{"label","7CV2"},
	{"ns","That’s seems like a good enough reason to me!  You’ve done your research – good job. ","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","9AV2"},


{"label","9AV2"},
	{"ns","So now that I know why the other vendors didn’t make it, please tell me why New Media Communications struck you as the right choice.","null.wav"},
	{"pg","New Media Communications can maintain a positive tone in their messaging, whatever their clients’ crises are.","9BV2"},
	 -- scorea:-MD
	{"pg","I think NMC has proven they can communicate technical information to the public in a clear and concise way.","9CV2"},
	 -- scoreb:+MD
	{"pg","Mr. Vine is new to the media relations business and is eager to do help us during this crisis.","9BV2"},
	 -- scorec:-MD


{"label","9BV2"},
	{"ns","Really?  Are you sure you looked into this?  That sounds....unlikely.","null.wav"},
	{"pg","I have looked into this and I believe I have made the right choice.","12A"},  --DO 12A/12B LATER


{"label","9CV2"},
	{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","null.wav"},
	{"pg","I am happy that you are satisfied, Your Honor.","12A"},  --DO 12A/12B LATER
---END IF PLAYER CHOOSES NEW MEDIA COMMUNICATIONS---


---START IF PLAYER CHOOSES NORSE COMMUNICATIONS (**V3)---
{"label","4AV3"},
{"fun",incvendor3},
	{"ns","I see. So, I know a little about who is available and I am curious, why didn’t you choose Narravi Associates?","null.wav"},
	{"pg","I don’t think Ojeda has enough experience getting complicated messages across to the general public.","4BV3"},
	 -- scorea:-MD
	{"pg","Well I understand that Ms. Ojeda has been known to refuse governments and government agencies as clients.","4CV3"},
	 -- scoreb:+MD
	{"pg","I discovered that Ms. Ojeda probably wouldn’t be interested in the job.","4BV3"},
	 -- scorec:-MD


{"label","4BV3"},
	{"ns","Oh, really??   Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","I believe this is true – I remember seeing it during my research.","5AV3"},


{"label","4CV3"},
	{"ns","Well, that sounds like a good reason to me!  It sounds as though you’ve done your research!  Well done!","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","5AV3"},


{"label","5AV3"},
	{"ns","I am the Mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with New Media Communications?","null.wav"},
	{"pg","It seems that they are involved with wrongdoing at Idion Energy Associates.  It’s all over the news.","5BV3"},
	 -- scorea:-MD
	{"pg"," Well I am concerned NMC will not be able to position our messages to the public in a positive way.","5CV3"},
	 -- scoreb:+MD
	{"pg","I am concerned NMC can’t communicate messages to the general public clearly and concisely.","5BV3"},
	 -- scorec:-MD


{"label","5BV3"},
	{"ns","Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","There is research around town I’ve read that supports that, I think.","7AV3"},


{"label","5CV3"},
	{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Well done.","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","7AV3"},


{"label","7AV3"},
	{"ns","I see.  So, before we move on, tell me why you decided against Media Relations, Inc..","null.wav"},
	{"pg","Marvin Moneymaker is a terrible businessman, and I don’t think we should hire anyone who is unsuccessful.","7BV3"},
	 -- scorea:-MD
	{"pg","I don’t think Media Relations has the ability to interpret data and communicate clearly to the general public.","7CV3"},
	 -- scoreb:+MD
	{"pg","Marvin Moneymaker doesn’t have enough experience in media relations, or a track record of success.","7BV3"},
	 -- scorec:-MD


{"label","7BV3"},
	{"ns","That doesn’t sound right.  I’ll trust you, but I’m not sure about your decision.","null.wav"},
	{"pg","I appreciate that Your Honor, but I’ve looked around, and I believe this is true.","10AV3"},


{"label","7CV3"},
	{"ns","That’s seems like a good enough reason to me!  You’ve done your research – good job. ","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","10AV3"},


{"label","10AV3"},
	{"ns","Right then, so now that I know why you didn’t choose the other vendors, please tell me why you ended up choosing Norse Communications?","null.wav"},
	{"pg","I’ve read that Norse Communications has handled many difficult situations with both care and sensitivity.","10BV3"},
	 -- scorea:-MD
	{"pg","Norse Communications has proven talent when it comes to communicating difficult technical data in a clear and concise way.","10CV3"},
	 -- scoreb:+MD
	{"pg","Norse Communications is an affiliate of one of the strongest media relations powerhouses in the world.","10BV3"},
	 -- scorec:-MD


{"label","10BV3"},
	{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","null.wav"},
	{"pg","I have looked into this and I believe I have made the right choice.","12A"},  --DO 12A/12B LATER


{"label","10CV3"},
	{"ns","That seems like good reason to me. It appears you have done thorough research.  Good job.","null.wav"},
	{"pg"," Thank you, Your Honor.  I am happy you are satisfied.","12A"},  --DO 12A/12B LATER
---END IF PLAYER CHOOSES NORSE COMMUNICATIONS---


---START IF PLAYER CHOOSES MEDIA RELATIONS INC (**V4)---
{"label","4AV4"},
{"fun",incvendor4},
	{"ns","I see. So, I know a little about who is available and I am curious, why didn’t you choose Narravi Associates?","null.wav"},
	{"pg","I don’t think Ojeda has enough experience getting complicated messages across to the general public.","4BV4"},
	 -- scorea:-MD
	{"pg","Well I understand that Ms. Ojeda has been known to refuse governments and government agencies as clients.","4CV4"},
	 -- scoreb:+MD
	{"pg","I discovered that Ms. Ojeda probably wouldn’t be interested in the job.","4BV4"},
	 -- scorec:-MD


{"label","4BV4"},
	{"ns","Oh, really??   Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","I believe this is true – I remember seeing it during my research.","5AV4"},


{"label","4CV4"},
	{"ns","Well, that sounds like a good reason to me!  It sounds as though you’ve done your research!  Well done!","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","5AV4"},


{"label","5AV4"},
	{"ns","I am the Mayor of New City, so I know a lot about my constituents.  So I am curious: why don’t you want to go with New Media Communications?","null.wav"},
	{"pg","It seems that they are involved with wrongdoing at Idion Energy Associates.  It’s all over the news.","5BV4"},
	 -- scorea:-MD
	{"pg"," Well I am concerned NMC will not be able to position our messages to the public in a positive way.","5CV4"},
	 -- scoreb:+MD
	{"pg","I am concerned NMC can’t communicate messages to the general public clearly and concisely.","5BV4"},
	 -- scorec:-MD


{"label","5BV4"},
	{"ns","Are you sure you have your facts straight?  I’ll trust you, but that doesn’t seem likely to me.","null.wav"},
	{"pg","There is research around town I’ve read that supports that, I think.","6AV4"},


{"label","5CV4"},
	{"ns","Well, that sounds like a good reason to me!  It sounds like you’ve done your research!  Well done.","null.wav"},
	{"pg","Thank you, Your Honor.  Is there anything else you’d like to know?","6AV4"},


{"label","6AV4"},
	{"ns","I see.  I am still curious, so please tell me – why did you decide not to recommend Norse Communications?","null.wav"},
	{"pg","Norse only handles small scale projects– so I don’t think they are a good bet.","6BV4"},
	 -- scorea:-MD
	{"pg","Because it concentrates on multinational clients, Norse doesn’t have the local press contacts we are looking for.","6CV4"},
	 -- scoreb:+MD
	{"pg","Norse has proven they are unreliable when it comes to clearly communicating technical information.","6BV4"},
	 -- scorec:-MD


{"label","6BV4"},
	{"ns","I’m not sure you have your facts straight.  I am going to trust you, although that does not seem likely to me.","null.wav"},
	{"pg","I’ve read up on this, and I am confident that this is correct. ","11AV4"},


{"label","6CV4"},
	{"ns","That sounds right.  You’ve done your research – good job.","null.wav"},
	{"pg"," Thank you, Your Honor.  Is there anything else you’d like to know?","11AV4"},


{"label","11AV4"},
	{"ns","So before I let you go, please tell me -- why in the world did you choose Media Relations, Inc.?","null.wav"},
	{"pg","I have confidence in Media Relations because Moneymaker truly understands the finer points of etiquette and is an articulate public speaker.","11BV4"},
	 -- scorea:-MD
	{"pg","Moneymaker has been very successful, and has been behind some sensational client work in the past.","11CV4"},
	 -- scoreb:+MD
	{"pg","Media Relations has had great results handling sensitive press situations in the past. ","11BV4"},
	 -- scorec:-MD


{"label","11BV4"},
	{"ns","Really?  Are you sure you looked into this?  That sounds...unlikely.","null.wav"},
	{"pg","That may be – but I stand by it, Your Honor.","12A"},  --DO 12A/12B LATER


{"label","11CV4"},
	{"ns","That’s a good reason as any, I guess. At least you’ve done your research. Now, I really hope this works out... ","null.wav"},
	{"pg","Thank you, Your Honor I am happy you are satisfied.","12A"},  --DO 12A/12B LATER
---END IF PLAYER CHOOSES MEDIA RELATIONS INC---

{"label","12A"},
	{"ns","To be truthful, I am concerned. I don’t think you have researched your choices thoroughly, because you don’t seem to have your facts straight. We’re under pressure here – so it’s too late to find someone else now. Just go negotiate a contract price with CHOICE.","null.wav"},
	{"pg","I am sorry to have disappointed you.  I will pay closer attention to the research on my next task.","END"},


{"label","12B"},
	{"ns","Before we finish, I must say I am impressed with your thoroughness!  You seem informed, and that tells me your choice is well-researched.  The next step now is to go back to CHOICE and negotiate a contract price. ","null.wav"},
	{"pg","I am honored.  Thank you kindly, Your Honor.","END"},


{"label","ASD1"},
	{"ns","What are you doing here?  We don’t have an appointment. If you’ve decided on a vendor go let Will Standon know. Now if you’ll please excuse me, these are very trying times.  I have urgent matters to attend to...","null.wav"},
	{"pg","I’m sorry for the interruption, Your Honor.","END"},


{"label","ATD1"},
	{"ns","Now, you’ll have to excuse me and show yourself out. I am sure you understand that I have a lot of work to do. If you have negotiated a price with the media relations firm to help us through these early stages of the crisis, go to Will’s office and let him know. ","null.wav"},
	{"pg","Yes, Your Honor. Take care.","END"},

--THE SECOND ONE

{"label","M21A"},
	{"ns","Hello again.  I am happy you made it, and we need to move forward – but before we start I must remind you that in business appearance counts. If you have an appointment at City Hall, you must dress appropriately.","null.wav"},
	{"pg","I’m sorry, Your Honor.  It won’t happen again.","M22A"},
	 -- scorea:-MA


{"label","M21B"},
	{"ns","Welcome back!  I am happy you made it; we certainly have to get everything straightened away.  Before we begin, though, I notice you’ve dressed up. I find it very reassuring when people show up to City Hall looking their best. Thanks - I appreciate it. ","null.wav"},
	{"pg","Yes, of course Your Honor. Thank you.","M22A"},
	 -- scorea:+MA


{"label","M22A"},
			{"fun",incmayor},
			{"fun",incstandon},
			{"fun",incevelyn},
	{"ns","Okay, so, let’s get started.  We really need to move ahead effectively in order to successfully steer New City through this crisis.  Have you returned with a contract for me to countersign?","null.wav"},
	{"pg","Yes, here you go.","M23A"},--,M23B, or M23C"}, Based on scoring
	{"pg","Yes. I have a contract I got from the vendor right here, ready for your signature.","M22B"},


{"label","M22B"},
	{"ns","You have a contract from the vendor?? You should never accept a contract from a service provider! We use City contracts because we have terms we need included. As it stands, we may have been backed into a bad deal.  I am disappointed.","null.wav"},
	{"pg","I am sorry, Your Honor.  It won’t happen again.","M23A"}, -- M23B, or M23C"}, Add later depending on costs
	 -- scorea:-SG


{"label","M23A"},
	{"ns","Okay, lets have a look... okay... super! This vendor typically charges between MIN COST and MAX COST and we’re paying COST. That shows you did a great job negotiating.  I will be sure to communicate that to your boss, Stan.","null.wav"},
	{"pg","Thanks!  That’s fantastic news, Your Honor, I am happy you are pleased.","M24"},
	 -- scorea:+SG


{"label","M23B"},
	{"ns","Okay, so let’s take a look here... yes, I see.  This vendor typically charges between MIN COST and MAX COST and we’re paying COST. Not too bad – but make sure you get all the information you can about a vendor before you negotiate and you’ll do even better.","null.wav"},
	{"pg","Thank you, Your Honor.","M24"},


{"label","M23C"},
	{"ns","So lets take a look... hmm... uh-oh.  This is troubling. It says here we’re paying COST, which is quite high. This should run between MIN COST and MAX COST.  Next time, prepare yourself with research before you negotiate with a vendor – otherwise we’ll end up overspending.","null.wav"},
	{"pg","Ok, Your Honor.  I will do a better job next time.","M24"},
	 -- scorea:-SG


{"label","M24"},
	{"ns","Okay, then – that’s done!  Now, take the contract downstairs to Will Standon.  He will give you further instructions.  Hopefully, you found your first task challenging and rewarding.  I hope to see you soon – there is much work to be done during this crisis -- and not much time!","null.wav"},
	{"pg","I understand, Your Honor.  I am sure we will meet again when I am assigned my next task.","END"},


{"label","M2ASD1"},
	{"ns","You’re the consultant on Stan’s team right? What are you doing here?  I am very busy right now.  Don’t come back until you have a contract for me to sign.","null.wav"},
	{"pg","Yes, Your Honor.  I am sorry to have disturbed you.","END"},
	 -- scorea:-SS


{"label","M2ATD1"},
	{"ns","What are you still doing here with that contract? We need to start on this immediately! You need to bring that document downstairs to Will Standon right away!","null.wav"},
	{"pg","Yes, Your Honor.","END"},
{"label","END"},
		{"fun3",storescore,scoreconvo,scorestr},
}
return dialogtext