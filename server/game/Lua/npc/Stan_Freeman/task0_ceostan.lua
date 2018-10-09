local dialogtext = {


{"if","evelynprogress","==",1,"tutor"},

{"goto","2"},

{"label","tutor"},
    {"n","Hi I am Stan Freeman, from Professional Services Corporate Offices.  I'm pleased you can join the team and that you are taking the time to try this tutorial!"},
      {"p","It is my pleasure, Mr. Freeman."},


    {"n","Since you already know how to walk around, and talk to people, you should probably move on.  Go ask Evelyn what to do next.  By the way, when you play the game, if you are ever confused or lost, Evelyn usually has an idea of what to do next."},
    
    {"fun",incevelyn},
    {"pg","Got it Mr. Freeman, I will talk to Evelyn now.","end"},

	--{"wait","end"},

{"label","2"},
    {"ns","You can do it! Make us proud!","vs_ceo_rdm2.wav"},
     {"pg","Okay, thanks.","end"},

{"label","end"},
}


 return dialogtext
