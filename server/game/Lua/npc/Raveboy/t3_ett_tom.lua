local dialogtext = {
	{"fun3",setvar,"scoreconvo","nlc_ett"},


{"label","ifs2"},
{"if","ett","==",0,"asd"},
{"if","ett","==",1,"1a"},
{"if","ett","==",4,"1f"},
{"if","ett","==",5,"atd1"},
{"if","ett","==",2,"atd2"},
{"if","ett","==",3,"atd3"},

{"label","asd"},
    {"ns","Hey there! Nice day, isn’t it?","VS_T3PXET_07.ogg"},
    {"pg","Why, yes – yes it is!","end"},

{"label","1a"},
    {"fun2",incvars,"ett"},
    {"ns","Excuse me, let me introduce myself. They call me Techno Tom. Say, you’re from out of town, aren’t you?  Do you have a second to chat? I have a proposition for you, if you’re interested.","VS_T3PXET_01.ogg"},
    {"pg","Okay, Tom. What do you have in mind?","1c"},
    {"pg","It’s nice to meet you, Tom, but I don’t really have time to talk right now. I may try to find you later.","1b"},

	{"label","1b"},
    	{"ns","Okay, never mind then.  If you change your mind and decide you could use a little cash, you can always come back. I’ll be here.","VS_T3PXET_02.ogg"},
    	{"pg","Okay, Tom. I may see you around, then.","end"},

	{"label","1c"},
    	{"ns","Here’s the deal: This store right behind me, Techtronics, buys used turntables for $200 apiece.  It just so happens that I know where I can pick one up.  The thing is, I need $50 to go get it.  If you could loan me the cash to go get the turntable, I’ll split the profit with you when I sell it!","VS_T3PXET_03.ogg"},
	{"pg","Okay, I could consider that. So how would we do this?","1d"},
	{"pg","Why do you need $50 from me to pick up a turntable","1e"},
    	{"pg","You know, I am not sure I should do this. I may have to check in with my team and see what they think.","1b"},

		{"label","1d"},
		{"fun2",decplayercash,50},
		{"fun2",incvars,"ett"},
		{"fun2",incvars,"ett"},
    		{"ns","Great! I’m happy you can help. All you have to do is loan me $50 and I’ll go pick up a turntable. Because Techtronics buys them for $200, after I sell it and we split the profit, you get $100 back! Just meet me back here in a few minutes, and we can split the loot!","VS_T3PXET_04.ogg"},
    		{"pg","Okay, you got it Tom – here’s $50.  I‘ll see you back here in a moment.","end"},

		{"label","1e"},
    		{"ns","Well, I have to go pick it up from a warehouse nearby, and I need…err…supplies to get inside.  But that shouldn’t concern you if you can use the cash, I could use an investor!","VS_T3PXET_05.ogg"},
    		{"pg","Now that you put it that way that sounds like something I can do! How do we get started?","1d"},
    		{"pgs","I don’t know, Tom, I don’t think that sounds like something I should be doing. Please excuse me.","reject","a"}, --EU+

{"label","1f"},
{"ns","Hey! There you are.  So, I have bad news.  I brought the turntable to Techtronics – but as it turns out, it was scratched, so I could only get $50 for it.  Well, anyway, here’s your share - $25!","VS_T3PXET_06.ogg"},
{"pg","Umm, okay, I guess.","trans"},
	
	{"label","trans"},
	{"fun2",incvars,"ett"},
	{"fun",incsq},
	{"fun2",incplayercash,25},
	{"goto","end"},

{"label","atd1"},
    {"ns","Hey again! Say, thanks for helping me out before.  I’m sorry things didn’t work out, and that you didn’t make all of your money back. Maybe next time we’ll have better luck!","VS_T3PXET_09.ogg"},
    {"pg","Yes,  Tom. Maybe next time. ","end"},

{"label","atd2"},
    {"ns","Heya, kid!  Did you come back because you decided you could use some cash?","VS_T3PXET_10.ogg"},
    {"pg","I have, Tom. So what did you want me to do again?","1d"},
    {"pg","Actually, Tom, I’m not sure I can spare the time just yet. I may see you soon though…","1b"},
    {"pgs","I don’t think I should be running any errand for you, Dennis - and that’s final!","reject","b"}, --EU+

	{"label","reject"},
	{"fun2",incvars,"ett"},
	{"goto","end"},

{"label","atd3"},
    {"ns","Look, if you don’t want to double your money – that’s your business. I am sure I will find people in town who would love to be involved. ","VS_T3PXET_11.ogg"},
    {"pg","Good luck with that Dennis – but I am pretty sure I should not get involved. I’ll see you around.","end"},

	
{"label","end"},
	{"fun3",storenlcscore,scoreconvo,scorestr},
}
return dialogtext
