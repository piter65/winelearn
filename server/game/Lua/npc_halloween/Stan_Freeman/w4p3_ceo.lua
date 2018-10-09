local dialogtext = {
{"if","ceoprogress","==",0,"c10"},
{"if","ceoprogress","==",1,"c1atd1a"},
{"if","ceoprogress","==",2,"c1atd1b"},
{"if","ceoprogress","==",3,"c21"},
{"if","ceoprogress","==",4,"c2atd1"},
{"if","ceoprogress","==",5,"c31"},
{"if","ceoprogress","==",6,"c32"},

{"label","c31"},
    {"ns1","There you are! Just the person I've been looking for! I just got the news about the arrest. If %s was indeed the culprit, it means that the counterfeit tickets should disappear -- and our client's festival will be profitable. All thanks to you! Good work!","vs_w4pxc3_01.wav","vendorx"},
    {"pg1","All the facts point to %s as the culprit, and I'm happy to have helped.","c32","vendorx"},

{"label","c32"},
    {"ns","Now you should take some time in New City to see what other opportunities you can find. Next week we will see how successful our festival planning has been!","vs_w4pxc3_02.wav"},
    {"pg","Okay. It has been a pleasure working for you.","end"},

{"label","c2atd1"},
    {"ns","A key skill in business is being able to assemble and evaluate facts and use them to make a smart plan of action. Do this so you can avoid mistakes like accusing your client of stealing on the basis of flimsy evidence. Be more careful with your research - and with your allegations.","vs_w4pxc2_04.wav"},
    {"pg","Yes, sir. I wasn't paying attention to details.","end"},

{"label","c21"},
	{"fun3",setvar,"scoreconvo","c2"},
    {"ns","Hello again. How's everything going so far? Do you have anything to report about your investigation?","vs_w4pxc2_01.wav"},
    {"pgs","I have received some reliable information that the Mayor is behind the counterfeit tickets.","c21b","a"},
    {"pgs","I think I'm stuck, and I don't know how to proceed. Can you give me some advice?","c21c","b"},
    {"pg","I am actually just passing through. Sorry to trouble you.","end"},

{"label","c21b"},
    {"ns","If all the facts point to the Mayor, we will not hesitate to hold her accountable but I just can't imagine that that's the case. Mayor Gonzalez has the most to lose if something goes wrong at the festival! I think you should get back to your investigation and focus on other leads.","vs_w4pxc2_02.wav"},
    {"pg","Okay. Thanks for your help.","end"},

{"label","c21c"},
    {"ns","I'm sorry I can't help you right now. Aren't there people in New City you can turn to for guidance? Think back over the last three weeks.","vs_w4pxc2_03.wav"},
    {"pg","Okay, thanks.","end"},

--POST CEO MEETING 1--
{"label","c1atd1b"},
    {"ns","Are you still here? We need to find out who is behind the tickets and bring that person to justice! Go to Luisa's at once and see what you can find – but stop by City Hall first to find out what Will Standon has to say about all this!","vs_w4pxc1_11.wav"},
    {"pg","Okay, I'm on it.","end"},

{"label","c1atd1a"},
    {"ns","Well? You'd better get moving!  We need to get to the bottom of this or the festival is doomed! We need to find out who is behind the phony tickets and bring that person to justice! Go to Luisa's at once and see what you can find out!","vs_w4pxc1_10.wav"},
    {"pg","OK! I'm on it!","end"},

--CEO MEETING 1--
{"label","c10"},
	{"fun3",setvar,"scoreconvo","c1"},
    {"ns","I appreciate all the hard work you've been doing on the United Way festival so far. As it turns out we have a bit of a problem on our hands that needs be addressed immediately. Do you have a minute?","vs_w4pxc1_01.wav"},
    {"pg","Sure!","c11"},

{"label","c11"},
    {"ns","There have been reports that ticket sales are lower than we've anticipated. As a matter of fact, we are not selling very many tickets at all! We may be in some serious trouble if we don't figure out why and do something about it. Do you know what happens if festival attendance is low?","vs_w4pxc1_02.wav"},
    {"pgs","Of course. It means we don't get paid.","c11b","a"},
    {"pgs","Yes. It means our client won't meet their objectives.","c11c","b"},
    {"pgs","Well, I'd imagine that means you'd fire me.","c11b","c"},

{"label","c11b"},
    {"ns","No, that's not the point. Actually, it would mean we have failed our client! In professional services, our job is to enhance our client's business by helping them reach their objectives. In this case, one of our client's objectives is to have a high turnout and to sell many tickets!","vs_w4pxc1_03.wav"},
    {"pg","Okay, Mr. Freeman. I understand.","c12a"},

{"label","c11c"},
    {"ns","You are absolutely right. In professional services, our job is to enhance our client's business by helping them reach their objectives. In this case, one of our client's objectives is to have a high turnout and to sell many tickets!  If we fail to do that it means we ourselves have failed.","vs_w4pxc1_04.wav"},
    {"pg","Yes, I agree.","c12a"},

{"label","c12a"},
    {"ns","Okay, so... Oh, wait, I'm getting a call. If you'll excuse me, I have to take this...","vs_w4pxc1_05.wav"},
    {"pg","Please, go ahead.","c13a"},

{"label","c13a"},
    {"ns","Hello? Yes? This is Stan... Excuse me? What!!?? Uh-huh... Okay... Well, I'm on it! Good bye! That was Lusia Del Castillo, from right here in town. Now we know why ticket sales are down. Someone is selling counterfeit tickets!! Apparently, there is somebody selling them at Luisa's!","vs_w4pxc1_06.wav"},
    {"pgs","Mr. Freeman, I am sure our client has people that will be looking into this.","c13b","d"},
    {"pgs","Well, Mr. Freeman, I think we should figure out how we can help our client get out of this mess!","c13c","e"},

{"label","c13b"},
    {"ns","No! Taking ownership of a problem is an important first step towards finding a solution. This is an important opportunity to serve our client and you may learn something that will make you better at your job. Our client has someone looking into this as we speak. Your job is to help them, not pass the buck!","vs_w4pxc1_07.wav"},
    {"pg","Yes, sir. Point taken.","c14a"},

{"label","c13c"},
    {"ns","Yes! Taking ownership of a problem is an important first step towards finding a solution. Our client has someone looking into this as we speak. Your job is to help them. This is an important opportunity to serve our client and you may learn something that will make you better at your job.","vs_w4pxc1_08.wav"},
    {"pg","OK, Stan.","c14a"},

{"label","c14a"},
    {"ns","You should free yourself up to fully concentrate on this issue. Solving this problem will be critical to the success of our festival! You need to find out who is behind this and help turn them in! If you go to City Hall and find Will Standon, he will tell you how you can help.","vs_w4pxc1_09.wav"},
    {"pg","Yes, I understand.","c15a"},

{"label","c15a"},
	{"fun",incceo},
	{"fun",talkedtostan},
	{"fun",incl1w1},
	{"fun",incl1w2},
	{"fun",incl1r},
	{"fun",incstandon},
	{"fun",incmayor},
	{"fun",incevelyn},
	{"fun3",setvar,"cantrap",1},
	{"fun3",setvar,"francotrap",1},
    {"ns","Okay. Now, you should go ahead to Luisa's and see what you can find out. But, before you go, go see Will Standon at City Hall.  If you can't find the counterfeiter right away, speak with your team mates to see if they can help make sense of the clues that you find.","vs_w4p3c1_01.wav"},
    {"pg","Okay, Stan. I'll look for things that have worked before.","end"},

{"label","end"},
	{"fun3",storescore,scoreconvo,scorestr},
}
 return dialogtext
