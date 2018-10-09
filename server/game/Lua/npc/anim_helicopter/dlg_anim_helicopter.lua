local dialogtext = {
 	{"if","tamaleprogress","==",2,"lilg1"},
 	{"if","tamaleprogress","==",3,"lilg2"},
 	{"if","tamaleprogress","==",4,"lilg3"},	
 
 --random dialog
 
 {"label","lilg1"},
 	{"fun",camconvo},
     	{"n","I love the beach!  I just wish my stupid little brother didn’t follow me around all the time."},
 	{"pg","[END]","cam"},
 
 
 --progress 3
 
 {"label","lilg2"},
 	{"fun",camconvo},
     	{"n","Piggy is cute! Piggy run with something in mouth.. What is it??"},
 	{"pg","[END]","cam"}, 
 
 
 --progress 4
 
 {"label","lilg3"},
 	{"fun",camconvo},
     	{"n","Farmer is looking for sythe?  What is sythe?"},
 	{"pg","[END]","cam"},  
 
 
 
 -- CamConvo Off	
 	{"label","cam"},
 		{"fun",camoff},
			{"goto","end"},
   
{"label","end"},
}
return dialogtext