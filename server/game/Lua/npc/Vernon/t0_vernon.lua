local dialogtext = {

{"if","tourguide","==",0,"tutvern"},
{"if","tourguide","==",30,"tutvern"},
{"if","tourguide",">",39,"generic_lost"},
{"if","expertprogress","==",2,"t5atd1"},

{"label","busy"},
	{"ns","Hello there, young looking youngster.","vern1.wav"},
	{"pg","You look busy.  I'll come back later","end"},


{"label","tutvern"},
	{"ns","Well hello there, youngster!  My name is Vernon Sharpe, and I am president of the United Americans Club here in New City.\n\nThe folks at City Hall asked me if I would tell you a little bit about how you do research in New City.","vern1.wav"},
	{"p","Okay, tell me more."},

	{"ns","When Will gives you the vendor guidelines he will also direct you to an expert like me. Experts give you four vendors to research so you can determine which would be best choice.","vern2.wav"},--audio
	{"p","Okay. Tell me more about this research."},

	{"ns","You will do your research entirely in New City.  You will read through newspapers, look through books in the library and search through the Ickypedia on a computer in the Internet Cafe or the Professional Services office.","vern3.wav"},--audio

	{"p","That’s all there is to it?"},

	{"ns","Well, it’s not all that simple.  All sources have to be read carefully to learn the most you can about each vendor.  Later, the folks at the Mayor’s office, the vendors, and others will respond more favorably to you if you are prepared with the right information. So take notes on paper or in your Journal.","vern4.wav"},--audio
	{"p","Okay, I get it."},

	{"ns","For practice, I'm going to give you the names and locations of two vendors to see today.  The first is Fiona Rudd, right across the street at the Mane Hair Salon.  The second is Wanda at Potty Princess. You can ask the tour guide where to find her.","vern5.wav"},
	{"pg","Got it. First Fiona Rudd and then find Wanda! Thanks for your time and see you around!","end"},

     {"fun3",setvar,"tourguide",40},   --  Time to talk to Fiona


{"label","generic_lost"},
	{"ns","You really must excuse me.  If you are lost, go see the tour guide.
	It was a pleasure meeting you.","vern99.wav"},--audio
	{"pg","The pleasure was all mine. Thanks again.","end"},



{"label","end"},
}
return dialogtext