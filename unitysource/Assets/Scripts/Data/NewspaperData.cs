using System;

namespace Assets.Scripts.Data
{
    /// <summary>
    /// Contain all data from newspapers, which stored into "lua_scripts\data\application\showinventory.lua"
    ///{"examiner",examinerfunc,"gui","iit_midmisc_006.tga"},--new city examiner newspaper
    ///{"crier",crierfunc,"gui","iit_midmisc_016.tga"},--elliot county crier newspaper
    ///{"today",todayfunc,"gui","iit_midmisc_016.tga"},--elliot county today newspaper
    ///{"libbook",libfunc,"gui","iit_book_002.tga"},
    ///{"magazine1",libfunc,"gui","iit_book_004.tga"},
    /// </summary>
    public static class NewspaperData
    {
        public interface INewspaper
        {
            string Week1 { get; }
            string Week2 { get; }
            string Week3 { get; }
        }

        public enum NewspapersEnum
        {
            NewCityExaminer,
            ElliotCountyCrier,
            ElliotCountyToday
        }

        public static INewspaper GetNewspaper(NewspapersEnum newspaperEnum)
        {
            switch (newspaperEnum)
            {
                case NewspapersEnum.NewCityExaminer:
                    return new NewCityExaminer();
                case NewspapersEnum.ElliotCountyCrier:
                    return new ElliotCountyCrier();
                default:
                    throw new ArgumentOutOfRangeException(newspaperEnum.ToString(), newspaperEnum, null);
            }
        }

        //private static NewCityExaminer _newCityExaminerInstance;

        //public static INewspaper NewCityExaminer
        //{
        //    get
        //    {
        //        if (_newCityExaminerInstance == null)
        //        {
        //            _newCityExaminerInstance = new NewCityExaminer();
        //        }
        //        return _newCityExaminerInstance;
        //    }
        //}


        /// <summary>
        /// Name in game: "Elliot Country Enquirer"
        /// Data from "lua_scripts\data\application\crier.lua"
        /// </summary>
        private class ElliotCountyCrier : INewspaper
        {
            public string Week1
            {
                get
                {
                    return @"	Local Firm Focused on Growth

Maybe it’s time to test the heavy hitting PR firm Navari Associates for steroids as it prepares for a huge statewide expansion. “It’s phenomenal,” croons Navari president Nina Ojeda with a broad smile, “Bad press is making for great business across the state. We’re hearing from big companies, small businesses and public service clients. We welcome anyone who’s been tragically maligned by the media.” Ojeda attributes Navari’s success to two key principles: Hire top experts who can clearly communicate technical information to the general public; and maintain a positive tone in the face of negative press.  But behind the optimism, there are growing pains. “There’s nowhere to sit!” complains one new employee who asked to remain anonymous. “And there’s static build up everywhere – I don’t even want to tell you where I shocked myself this morning!” But help is on the way. Ojeda announced an investment in extra desks, phone lines, anti-static floor mats and new hires to take on the projects – to the tune of $1800. Is it possible some of that money is going to business steroids?



	Local Press Conference Breaks Record!

It’s official! Local advertising professional Gabe Vine has shattered the world’s record for the longest press conference in history. Three days, four hours and twenty-six minutes was the final count, besting the old record of two hours and ten minutes set back in 1929. Using a combination of herbal stimulants, protein shakes and a catheter, Vine was able to keep going despite a dwindling audience. “We stuck it out for the first two days,” says TV reporter Jim Dust, “but then our camera equipment burned out.” Vine, who heads the PR firm New Media Communications (NMC), called the press conference to discuss the recent collapse of the entrance to the New City tunnel in the hopes of deflecting criticism away from his client, Letsee Construction. The marathon event started with a relatively brief hour long statement, then spun out of control when a reporter asked Vine about the epoxy resin Letsee Construction used to hold ceiling bolts in place. “Vine got a weird look in his eye,” says Dust, “and just went off about adhesion science – molar attraction constants, hydrogen bonding – his knowledge was endless!” After three days, Vine’s voice finally gave out.  He is now billing his client $500 for lozenges, throat spray and homeopathic laryngitis remedies.    
    
	
	
	Local Firm Leaves Mark with International Clients

Where do some of the most prestigious international companies turn when they need media relations services? New City. That’s right, we have a gigantic multinational PR firm in our midst and many of us don’t even know it.  The name? Norse Communications. Bjorn Egan heads the local affiliate of the global powerhouse that specializes in big projects for top international companies. “It is now a 24x7 world where firms like Norse can leverage global resources to fulfill our clients’ needs,” Egan efficiently explains. While this model does give them global reach, it lacks something in local feel. “We never see them, except at softball games,” remarked a PR staffer at a rival local firm, “It’s a little strange.  Come to think of it, so are they.” Another curious trait is the eyebrow raising list of expenses Norse passes along to its clients which include blonde hair dye, techno CDs, fancy herbal teas and sun lamps – the price tag?  $500. While this kind of lavish spending may be overlooked by high profile clients, local businesses have shied away from using Norse. “We prefer to spend money on our brand image,” opined one local business, “Not some freaky Nordic rave.”
    
	
	
	Local Man Named to Fortunate 100!

Marvin Moneymaker has lived up to his name. His company, Media Relations Inc. (MRI) was just named the top grossing PR firm in the county.  What makes the achievement all the more impressive is that MRI handles only local clients. “We know what people around here want,” remarked Moneymaker, “and how to make them pay for it.” His string of recent successes includes getting people to buy Hillford Dairy’s spoiled milk by deeming it “Spoilicious” and deflecting criticism away from a recent shipping disaster by calling it a commemorative re-enactment of a recent disaster in the Rosendale Reservoir. MRI’s local success does have Moneymaker eyeing markets outside of Elliot County. “I’d like to expand statewide,” he explains, “because it would give me more reasons to drive my sports cars.” Moneymaker keeps a collection of fancy, imported cars at a temperature controlled garage out of town. Incredibly, he gets his clients to pay the $500 leases for him. “It’s totally business related,” Moneymaker claims, “The faster I get to press conferences, the quicker I can fix their problems.”
    
	
	
	Area Vendor Overwhelmed!	

You notice something strange the moment you enter the offices of New City Emergency Medics Association – all the clocks have 26 hours on them. “It gives us an advantage,” explains director of NCEM Gil Fermin, “Because for you, it’s already four in the afternoon, but to us it’s only two – and we gain two more hours on you everyday. Since we’ve implemented this we’re actually several days behind!” But this time shift seems to have consequences for Fermin and his staff. “We’re not really sure when to come in,” says one exhausted EMT, “We all have other jobs in the 24-hour world, so making the switch causes a lot of confusion.” It also seems to baffle Fermin himself. “You wouldn’t happen to know the month, would you?” he asks during an interview, “And…the year?” While the method does allow Fermin’s crew to respond quickly to emergency situations – sometimes even before they occur – it does take its toll in terms of organization. The company is known for paying bills late and some say they are too overwhelmed to take on any new assignments. “They’re totally over worked,” says industry insider Rae Darre, “They probably run into themselves coming and going.” To keep his staff on the move, Fermin spends $500 on sugared candies, caffeine drinks and pep pills. He might want to invest some of that money in more traditional timepieces.    
    
	
	
	First Responders Awarded Contract	

Local organization, “Save the Fat”, has awarded the contract to handle all emergency medical services at this year’s charity cook-off event to local company First Responders. The organization, which touts the environmental benefits of recycling all cooking grease, says it made its decision purely on merit. “First Responders constantly trains its staff in the latest response and rescue techniques,” explains Save the Fat’s president, Patti Olean, “They’re particularly up to date on burn treatments.” That’s especially important as the group hopes to fill a 600 gallon glass tank with scalding hot reclaimed cooking oil at the event. First Responders is ready to respond rapidly to any hot oil related mishap. “We charge $2000 in order to have the manpower to handle a situation quickly,” says First Responder’s owner John Grey, “And in this case, we’ll have to move like greased lightning if anything goes wrong.” Grey and team might have their hands full. With no security staff, they might have problems keeping the unattended crowd from jumping in the hot oil for a swim.   
    
	
	
	Medic, Inc! Displays Decorum in Recent Response 

When a tanker of marshmallow spread jack-knifed on I-385 in Rosendale last Wednesday, emergency response team Medic! Inc. didn’t rush in willy nilly – they marched in with dignity and decorum. “The only way to avoid panic,” explains Tom Barrier, head of Medic! Inc., “Is discipline.” A former military man, Barrier takes discipline and procedure very seriously. He even hires a detachment of bugle players – at a cost of $500 - to play drills that keep his medics in line. “Seeing them coming through all that gooey, sugary mess with military precision and gravitas,” explained one crash victim covered in marshmallow goop, “almost makes you glad you’re injured.” Barrier’s fully licensed medical and security unit had the experience to handle a very sticky situation. “But they were slow as molasses,” complained Joyce Quicksilver, “I was stuck in my car for hours!” It isn’t the first time Medic! Inc. has been singled out for slow response, but Barrier chafes at that criticism, “In an emergency it’s not important to count the seconds, it’s making sure every second counts.”
    
	
	
	Mechanized Transportation Enables “Rapid” Response

They call themselves the “silver bullets”. They’re senior citizen EMTs from Mullen Medical Supply Inc. who travel on mechanized scooters- which cost $500 - to provide a rapid response to local emergencies. All over 70 years old, these semi-retired health and security professionals are led by Dr. Zeke Mullen, the celebrated physician who was once given the key to the city for his service to the community. “That was a great day,” recalls Dr. Mullen, still groggy from his mid-day nap, “But I’m having the time of my life right now as a silver bullet!” While the nickname conjures up a lightning fast reaction to a crisis, critics contend these bullets are more like “silver slugs”. Speedologist Dr. Spencer Gonzalez explains, “A 9mm bullet can travel 1500 feet per second – or roughly 1023 miles per hour. The average person runs at about 6 miles an hour. These mechanized scooters top off at around 3 miles per hour – so you can see, the analogy is flawed.” Mullen Medical’s response time is even slower when you factor in their frequent naps, bathroom breaks and occasional dementia. “When you do the math,” remarks Gonzales, “They’re actually moving in reverse.” 
    
	
	
" + LongStringSecretSplitter.SecretSplitter + @"	Known Containment Specialist Answers Questions

With over 2,500 patents to his name, containment specialist Peter Boltright has come under fire recently. Is he using his government contracts to clean up toxic spills as a way to fund the R&D of his own inventions? In question is $1800 for specialized remote controlled boats he designed to clean up a spill in Wexlerberg. “Government monies should never, ever fund private research,” declared New City councilman Rick Fist, “Except in the defense, healthcare, transportation and biotech industries.” And what about allegations of public displays of affection between Boltright and containment equipment? “Sure his company, Premier Containment, is the leading authority on containing toxic spills in rivers and his team of crane operators, machinists and engineers can be quickly deployed to a disaster site, but he’s obviously a nutty, greedy weirdo,” said a passerby in downtown New City. To refute these claims, Boltright held a press conference Wednesday at his machine shop. “I do love machines,” admitted Boltright, “but I’m not in love with them. What people saw between me and that dredger was a routine diagnostic check up.” He also explained that his heart will always belong to the toxin containment process itself. 
    
	
	
	Elliot County Vendor to Speak at Conference  

Next month New City will host “Green Up Politics”, a statewide conference on how local politicians can become more involved in environmental issues – or at least seem to care about them. The keynote address concerns toxic spill containment which has become a hot button issue thanks to hundreds of tragic incidents over the past few years. “Our rivers have become sewers and our lakes have become toilets,” complained Rosenfield Councilman Dirk Wasser, “We have to take control of this problem locally!” With all the emphasis on local solutions, the choice of Oroko Nakashima as the keynote speaker seems somewhat ironic. While Nakashima is undoubtedly an environmental expert and one of the most sought after containment specialists, she has never worked on a local project in the state. “She’s an ocean clean up rock star,” says local conservationist Patti Elm, “But the ocean is a thousand miles away.” Nakashima’s Running Rivers Corporation does have a mix of equipment to handle almost any kind of containment job, but its lack of local contacts could hinder it in an emergency. “Politicians around here want to be looked up to,” says Elm, “Not talked down to.” Nakashima could score political points with her troupe of acupuncturists and herbalist that she contracts for $500 on every job. Politicians like to know up front when they’ll be stabbed in the back. 
	
	
	
	Military-Style Discipline at the Scene of Disaster  

When a landside destroyed a pesticide factory in Mesoamerica, local authorities were overwhelmed with the task of containing hazardous materials. In swooped Burells Brothers, an area company led by former Marines Bill and Phil Burells. “It was shock and awe,” reports the region’s governor, Lester Rhine. “They had personnel storming the beach from amphibious troop carriers. Which scared the heck out our tourists. Maybe it was little much, given that the spill is forty miles from the coast.” Highly educated in the logistics and practices of spill containment, the brothers bring years of military experience to the hazmat business, not to mention years-old, even outdated, semi-serviceable decommissioned military equipment, which some say isn’t sufficient to prevent cross-contamination. But if wars and waste cleanup can be won with sheer military grit and efficiency, the Burells and their team of former military “waste wasters,” as they call them, could conquer the world. Flown in by leveraging military transport connection, the Burells’ army of hazmat warriors work with extraordinary precision to “take out the enemy of waste.” And while transport is cheap, the Burells spend $500 on Video games, DVDs, and informative industrial shorts to entertain its off-duty personnel in the ‘rec tent’ between shifts. “Whatever works,” says Governor Rhine, “as long as they leave.”   
    
	
	
	Green Rivers Alliance to Award Local Vendor!

Dart enthusiast and local entrepreneur Anthony Wexler was honored today by the Green Rivers Alliance for his charitable contributions. The move was questioned by some who point out that Wexler’s attempts at providing hazardous waste containment have often lead to new and unexpected disasters. “Look, his head might be in the clouds, but his heart is in the right place,” explained Drew Ablanc, Awards Committee Chair for the Green River Alliance. “That’s why we chose to honor him with our ‘Guy That Gives a Damn’ award.” The award comes in the form of a large trophy, depicting a bald, anatomically incorrect man with a raised fist. “Wow. The Our Lady of Guancomo statue on my dashboard just got demoted,” Wexler announced upon being handed the award. Included with the award is a cash prize of $1000, and though it’s common practice to donate the check to charity, Wexler indicated that he would be holding on to it by folding the giant check into a small, thick cube and stuffing it into his pocket. It’s assumed that the money will be used to pay the local bar owners who have disclosed the names of dart league participates that Wexler mobilizes for containment efforts.  
    
	
	
	Overworked Consultant Turns to Unusual Places

When stressed and overworked, some seek out massages. Others play golf, read books, hunt neighborhood cats. But for the Busiest Man in the Environmental Consulting Biz, there’s no substitute for soothing reggae music, organic fruits and the solitude of custom built sensory-deprivation chamber. “It’s the closest thing to climbing back into the womb,” explains Nathaniel Wailer, an environmental expert in high demand. “You float in a lightless, soundless void and, after a while, you can almost hear mother breathing around you. It sure beats TV, mon.”  Unconventional, certainly, but it seems to work. Despite his 80-hour work weeks, the Montogan native always appears refreshed, cool-headed and infused with Island-style optimism. With his expertise in using cutting-edge technology that allows him to measure sinkage, spread and cross-contamination at spill sites, he has built a reputation as a leading field consultant and clean-up specialist. Some find his tactics a bit unconventional—like the $500 expense associated with having organic fruits, vegetables and sugar-free candies available to assessment personnel, or his eccentric, handy-man approach to maintaining equipment with duct tape and chewing gum. But everyone agrees always he delivers in high fashion. Could sensory-deprivation be the key to his success? “Maybe,” he ponders. “But it could also have to do with the fact that I meditate every day.” 
    
	
	
	Envrionmental Consultant Called to Reappear Before Committee

He first appeared before the committee last Friday, but the only consensus his visit produced was unanimous confusion. “Mr. Economou has a way of speaking that resembles his manner of wearing jewelry,” says Committee Chair Ben Thardondat, referencing the aging playboy environmentalist’s many layers of gold chain necklaces. “That is, overly ornamental and hopelessly entangled.” Now the committee has reluctantly invited Economou back, urging him to give a more conventional report of his company’s recent analysis of New City river, as well as an explanation for the $2000 fee attributed to onsite staff and administrators to man command and control center. Economou’s first presentation confirmed the widely held impression that he can occasionally be disorganized and unruly in appearance, and sometimes has a hard time clearly and concisely communicating his findings. Indeed, the amateur classicist’s report resembled the recitation of a poorly written epic poem. “The sons of our city in dismay bade the heralds call the people to a council man by man,” Economou began his report, continuing with, “but not to cry the matter aloud; I made haste also myself to call them, and they sat sorry at heart in their assembly.” Why didn’t committee members ask for clarification on the spot? “It sounded good,” explains Thardondat, “and no one wanted to look like an idiot. It took us a few days to decide who the real idiot is.” Mr. Economou will reappear this Wednesday.
    
	
	
	Local Activist’s Report Makes a Stand!

“Mother Earth ain’t a pushover,” says Ramblin’ Rose, the environmental advocate who recently declared the Grayville Eddy waterways uncontaminated after a series of tests. “Humans try to harsh her mellow but she’s bigger than that.” The conclusion came as a surprise to members of the waterway community who believed something was amiss in the Eddy after spotting a slew of dead fish along the banks, as well as a raccoon with five eyes. They put out a call for help and Ramblin’ Rose answered. By tapping her enormous network of supporters and fans of the 90’s jam band The Boys, she was able to quickly assemble an assessment team. She raised some eyebrows when she demanded $500 worth of inks, colorants and three dozen white t-shirts and work pants to create tie-dyed uniforms for assessment personnel.  She also used equipment purchased from online auction houses, which has led to dubious results in the past. But her colorful crew ran a battery of tests to the sounds of Boys bootleg tapes, broadcast via loudspeaker from Rose’s “earth bus”. Local corporations suspected of dumping contaminants into the waterway were pleased with the findings, leading some to wonder if Rose had been bought off. “Don’t even go there,” Rose warned. And what about the five-eyed raccoon? “Just Mother Nature being creative,” Rose offered with a shrug. “I’ve been with plenty of people whose features some might call, well, unnatural—but I call blessed.”
    
	
	
	Local Activist Given Key to the City!

New City leaders honored local legend environmentalist and skater Skeeter McBragg for his firm’s efforts in cleaning up the New City waterfront. McBragg, whose company Enviro-X is comprised of skater activists, hoisted the key over his head to a roar of applause from his youthful followers. It was clearly a moment of comeuppance for a man whose unconventional tactics have plagued his efforts to be taken seriously as a legitimate protector of the area’s environment. Such questionable tactics include a $1000 on-site command areas consisting of a card table and half-pipe and assessment presentations that are more profane rants than they are statistical reports. A known crusader, McBragg is has been accused of strategies more often associated with eco-terrorists than advocates. His verbal attacks are known for their total lack of scientifically acquired evidence, not to mention reason, nor complete sentences. Yet all this seemed to be water under the bridge, so to speak, as McBragg’s efforts were officially recognized by New City officials. “I’m proud to present this tireless advocate with the key to the city,” announced Councilman Will Hustop. “That’s a big key,” McBragg exclaimed, marveling at the prop before adding, “so where’s the door to the city?” The line earned laughter from all assembled—laughter that was quickly silenced when a frowning McBragg asked, “No. Seriously. Where am I supposed to use this thing?”";
                }
            }
            public string Week2 { get; private set; }
            public string Week3 { get; private set; }
        }

        /// <summary>
        /// Name in game: "New City Examiner"
        /// Data from "lua_scripts\data\application\examiner.lua"
        /// </summary>
        private class NewCityExaminer : INewspaper
        {
            public string Week1
            {
                get { return @"	Narravi Associates Disappoints!

Despite their successful PR work, the Elliot County Media Professionals’ Association has singled out Narravi Associates -  for finishing in dead last place in the Media Professionals’’ softball league. Setting records for wild pitches and umpires- injured-by-errant-throws, the team looks forward to winning a game for the first time in club history, next season. ""Their team captain and Narravi’s President, Nina Ojeda has a talented team of information experts that specialize in encapsulating critical data into effective communication,"" said one umpire. ""But they couldn’t hit the broadside of a barn with a softball, that’s for sure."" Others are not so happy with Ojeda’s performance, either.  ""She sure is controlling.  She really tried the umpires’ patience – and the other team – with her manipulative tactics."" The loss comes as Narravi spent its customary $1200 for posters around town promoting the team. ""Oh, well,"" said Narravi. ""At least our abysmal performance will make headlines.""



	Area Media Relations Firm ""Too Busy""

Normally, PR powerhouse Nina Ojeda would never turn down an interview. As the president of Navari Associates, Ojeda is constantly seeking attention for her clients. So why the sudden drop-off in returned calls? ""Busy. All good. Talk soon!"" is the only statement Ojeda is willing to make.  Mort Steinbeck, the building’s window washer, reports a 24x7 beehive of activity at the media relations firm. ""They’re at it all the time tapping on them there computers – and eating, of course – they’re like pigs with a work ethic!"" It’s widely known that Navari bills its clients $500 for take out food and office parties for the duration of a contract. While that explains the food, why the recent flurry of activity? ""Scandalmania,"" admits business watchdog Jake Fang. ""Top companies in New City and around the state have been hit hard in the news - now Navari is snapping up all the lucrative business."" That’s left many smaller clients and public service groups out in the cold. ""No matter what she says,"" admits Fang, ""Ojeda has never cared that much for charity work.""  



	New Developments Heard Through Gabe Vine!

Is beautiful Tamiroff Park about to become the backyard for the rich and famous?  According to Gabe Vine of New Media Communications, the answer is yes. ""Well, I really can’t say,"" explained Vine after a closed door meeting at the state house, ""but my new client, BluCo Construction, will absolutely build 18 huge, luxury compound-style homes on a strip of private land that cuts way into the state park. In fact we just signed the papers and construction begins July 10th."" This startling admission is sure to cause outrage in the community who cherish the park as a natural oasis in the city. And it is an inauspicious start to Vine’s PR relationship with BluCo. ""Normally you want to quell controversy in these situations,"" said business watchdog, Jake Fang, ‘but Gabe Vine just ignited one."" While a respected local agency, NMC has had trouble in the past handling negative press situations. After another brief closed door meeting, Vine explained that he will set up an on site ""war room"" next to BluCo’s offices – at a cost of $2000 – to react quickly to any public outcry. 



    Norse Fails to Steer Tricon out of Spotlight

It just doesn’t add up.When an accounting scandal ignited at Trifon Enterprises – a large regional cable television provider that spans five states – it hired PR powerhouse Norse Communications to quell the media firestorm.Instead, Norse fanned the flames of negative press and the company has now filed for bankruptcy.What went wrong ? ""We hired Norse Communications because they specialize in handling large, interstate clients in high profile cases, "" says Trifon CEO Abe Delfia, ""But they just had no tact when dealing with the media."" The president of Norse’s local affiliate, Bjorn Egan, disagrees, ""Our response was accurate, efficient and mathematically sound."" Norse’s response involved spending $1250 to fly in their accounting experts from around the state to deal with the situation.But their brutal honesty about the scale of the accounting fiasco alarmed investors instead of calming them down. ""When the scandal broke I figured – heck, someone raided the kitty for a couple million, no big deal, "" explained one very wealthy investor, ""But when Norse spokesman showed the real math on TV, I sold my stock fast!""



Area Press Relations Guru 'Tells it Like it Is’

Having ""explosive diarrhea"" isn’t something you want to announce to the world, but that’s exactly how Media Relations Inc. (MRI) president Marvin Moneymaker described why star pitcher Tom Fry wasn’t available for last night’s playoff game.When Moneymaker was asked why he couldn’t be a bit more delicate about the reason for Fry’s absence, he exclaimed, ""Are you kidding ? You wouldn’t believe the mess!"" The embarrassment for Fry continued when Moneymaker sent his staff of door - to - door salesmen to media outlets with flyers that illustrated the eruption with the caption, ""Thar she blows!"" Fry, who is not available for comment, is rumored to be angry about the $1000 cost of spreading around the word of his condition.The whole episode may indeed backfire for Moneymaker whose tremendous success in the media industry could be in jeopardy. ""This could lose us the championship, "" cried the New City Neutron’s manager Pete Shell, ""Fry won’t come out of the clubhouse."" But Moneymaker doesn’t seem worried.He even plans to expand his PR firm – which exclusively services Elliot County - statewide.  ""I just call ‘em like I see ‘em."" Moneymaker says.



  Local Emergency Response Firm Poised for Growth

Maxed out, overworked and chronically disorganized, New City Emergency Medics Association is set to grow. ""Who knows more about stressful situations than we do? "" asks NCEM director Gil Fermin, ""We live on stress – literally."" While some question its bizarre methods, no one can deny that NCEM provides excellent emergency response services thanks to its up-to - date, high tech facilities and expert staff that knows how to manage the aftermath of a disaster. ""Oh, they know what they’re doing alright,"" says satisfied fire victim Mort Tiffied, ""They control crowds and save lives-they’re even pretty good dancers."" NCEM typically charges $1800 for emergency equipment rental and to set up a security perimeter, which is higher than some other providers. ""When disaster strikes, you don’t shop around for the lowest price – you want the best people and best equipment, "" explains Fermin.He may be right – 8 out of 10 unlucky people say they’d choose NCEM the next time their lives go horribly wrong.  ""We’re ready for growth, "" says Fermin, ""Bring it on!""



    Local Provider declared a ""Model Emergency Services Firm""

They’re rested, ready and well fed.The staff at First Responders is highly regarded as the best trained and most up - to - date of any emergency services provider in New City.It’s all thanks to owner John Gray whose years of working in the world class Rosenfield trauma ward have shown him how to keep his staff ready and motivated.It begins with barbeques. ""We do a lot of team building through cookouts,"" explains Gray, ""It teaches cooperation, efficiency and burn treatment."" The techniques have paid off.First Responders team is able to respond to emergencies in record time. They also pride themselves on keeping current with latest emergency response and rescue techniques. ""We discovered a much more effective Heimlich maneuver,"" claims Grey, ""Which only requires two fingers."" Grey also keeps his staff loose by hiring massage therapists – at a cost of $500 – to provide deep tissue massage and facial treatments. ""You can’t handle a stressful situation if you’re already stressed out,"" says Grey. ""Our guys know how to kick back and kick butt.""   



     Supermarket Opening A Success, Despite Hitch

""Clowns are dangerous, destructive and evil,"" stated former sheriff Sam Shortback who was on hand for the official opening of the Whole Paycheck supermarket in downtown New City.His anti-prankster announcement came as yet another area event was spoiled by a felonious fool. ""The ribbon cutting was just underway,"" explains store manager Wier Organic, ""when we noticed the clown lighting heritage New Zealand kiwis on fire for juggling."" Soon, the entire produce section was ablaze. That’s when emergency response expert Medic! Inc.arrived on the scene. ""We could smell the smoking fruit from our HQ,"" recalls Medic! Inc.owner, Tom Barrier, ""I knew that smell very well from my tour of duty in Panama."" Barrier’s mobilized his fully licensed and experienced team to the supermarket – at a cost of $1250 – and quickly extinguished the flames.But his security officers couldn’t stop the crowd from feasting on all the roasted fruit and vegetables that littered the aisles. ""Since Medic! Inc.couldn’t stop the throng of hungry shoppers,"" says Organic, ""we turned the whole opening into an impromptu luau!"" Clowns may be evil, but this time the lovers of all natural foods got the last laugh.



   Local Hero to the Rescue!

When the popcorn factory exploded in downtown New City on Tuesday, many workers were trapped inside - unable to escape a delicious smelling, puffy prison. ""No one could eat their way out, and we couldn’t eat our way in,"" recalls factory owner Red Orvillebacher.That’s when Mullen Medical Supply owner, Dr.Zeke Mullen came to the rescue. ""Of course, I remember the great popcorn disaster of 1943,"" says Dr. Mullen, ""So I knew just what to do."" Dr.Mullen normally charges $1000 to deploy his medical and security detail in case of an emergency, but this time it wasn’t needed – he tackled the problem himself.Knowing that popcorn dissolves in water, Dr.Mullen activated the building’s sprinkler system which turned the confining corn into malleable mush. ""It was a miracle,"" exclaimed one grateful escapee, ""Dr.Mullen should be given the key to the city!"" In fact, he already has one for his years of service at New City Community Hospital.When asked why Dr. Mullen didn’t call his medical and security team for backup, he replied, ""It was their nap-time – and they’re so old, they’re not really much help anyway.""



" + LongStringSecretSplitter.SecretSplitter + @"   Local Man Obsessive About Containment!

Walk into Peter Boltright’s machine shop in New City, and you enter a steampunk toy store wonderland. The owner of Premier Containment, Boltright is constantly inventing new, imaginative machines to contain toxic spills.There are robotic crabs, mechanized whirligigs and tanks made out of clear aluminum.With each new job, Boltright spends $500 on drafting supplies, prototyping materials and renting a 3D printer to bring his creations to life. ""Every spill is a unique engineering challenge,"" says the grease covered Boltright, ""So I spend every waking moment tinkering with unique solutions."" ""There’s a word for that,"" explains industry analyst Nombe Lever, ""Crazy."" Boltright’s mechanical obsession was on public display recently, when he was seen inappropriately fondling a next generation oil dredger at an industry tradeshow.But a subsequent psychological profile of Boltright shows that while he’s eccentric and obsessive, he’s pretty much sane. ""When insanity is useful,"" says New City psychiatrist Dianne Osis, ""We call it ‘inspiration’. Boltright appears to be just very, very dedicated to his job.In the DSM IV he’d be considered, 'Alarmingly Dedicated'."" And that’s a good thing if you ask the thousands of people who have benefited over the years from his containment compulsion.



 Elliot County Containment Vendor Still Foreign to Local Disasters

Who is Oroko Nakashima and what is she doing here? Those are the two questions that seem to plague this toxic spill containment specialist every time her name crops up in the media. ""She’s an enigma, a riddle,"" says environmentalist Tom Post, ""She’s like a riddily enigma pie covered in shadowy deceptive frosting."" This seems like harsh, delicious criticism for someone who is world renowned for her expertise in containing ocean spills and other environmental disasters.Her ability to mobilize local fishermen and conservationists to aid in cleanups – at a cost of $1200 – not only provides quick response time but transfers valuable skills to native populations.And Nakashima’s teaching at New City Community College has made its environmental conservation program the best in the state. So why is she so vilified by local groups? ""She’s never here!"" complains Post, ""Every time there’s a disaster in what’s supposed to be her ‘hometown’, she’s off globetrotting to save a bunch of foreigners!"" Could it be jealousy? Could it be xenophobia? Could it be concern over Nakashima’s lack of experience with local government officials and river cleanup? Whatever the reason, her global celebrity status has not added up to a lot of good will here in New City.



 Vendor Credits Logistics Know-How for Successes

""Everything that’s true about the U.S.Marines is true about us,"" claims Phil Burell of Burell Brothers, the local hazardous waste cleanup firm that is run like a military outfit.Founders Phil and Bill leverage their past as Marines to create a unique corporate culture that is more Semper Fi than suit-and-tie.And the culture extends into their tactical approach to clean up, which conducts deployments modeled after the great Marine assaults of the past. Assault is the right word.The firm is known for shock-and-awe tactics that include beach landings, paratrooper drops and lots of apparently gratuitous explosions. Theirs is a strategy that requires boots on the ground, boots worn by friends in military service and state militias that they often mobilize at a cost of $1250. While some question their tactics, a string of successes confirm that the brothers are highly educated in the logistics and practices of spill containment in a variety of settings, though advocates for New City River point out their lack of experience with rivers. ""We’re successful because we see waste as the enemy,"" Bill explains. ""We throw all our logistical know-how and firepower at spills and leaks like these things personally insulted our mothers.""



 Charity Darts Tournament Declared a Success!

Who knew that a game of darts could do so much to save the world? Anthony Wexler, founder of Interstate Containment, that’s who. His charity darts tournament, ""Have a Heart, Throw a Dart,"" surpassed fundraising projections this weekend, prompting Wexler to declare the event an unqualified success. ""A lot of people think darts is something to do when you’ve got nothing else to do,"" Wexler commented. ""But it can save us all!"" The several thousands of dollars generated by the event will be donated to environmental groups.Not a bad investment for a function that cost $500 for dartboards, extra felt, darts, tips and a bouncer detail to ensure order. Many agree that the donations can make a difference, including the Green Rivers Alliance who honored Wexler with their annual Guys Who Gives A Damn award for his charity efforts.The award acknowledges the events Wexler organized as well as his recent donation of tournament prize money to a number of environmental charities—money won with a lucky shot that hit the its mark after bouncing off the artificially enhanced breast of a spectator. ""This, more so than his actual waste containment company, is how Wexler contributes,"" said the Alliance’s Drew Ablanc, ""given that he has extremely odd, out-of-date equipment and no clue how contain spills or prevent contamination."" 



 Eco-Tech Sends Message to City of Wexlerberg

Who you gonna call, Wexlerburg? If you’re looking for someone to test your waterways for toxic leaks, hazardous wastebuster Nathaniel Wailer claims to be waiting by the phone.This comes as somewhat surprising news, given the expert’s reputation for being overworked and in constant demand. ""Rumors of my unavailability are greatly exaggerated, mon,"" Wailer tells us, with all the charm built into his Island accent.Should Wexlerburg make that call, they would appear to be in good hands. Wailer has built a solid track record of accuracy and is known to be free of biases.. Inspiring and well-spoken, he delivers his findings in a clear and concise manner.Costs are reasonable since—at a cost of $1800—he rents the monitoring devices he needs to measure and report ecological damage and environmental contamination. His numerous successes in the area speak loudly for his qualifications. But how can this go-to guy be available for Wexlerburg? Perhaps the answer has something to do with his tendency to fly in a team of experts from his island homeland of Montoga. Often arriving by helicopter, they amount to a veritable A-team of ecological experts. Upbeat and spirited, they’ve been known to tackle the ugliest of toxic spills with an optimism and display of cheer that some have called ""practically supernatural"". 



 Monitoring Equipment Fails Local Vendor

The numbers were off.Way off. According to the environmental assessment reports filed by the consultancy of Ypoforo Ecosystems in which toxicity levels suggested the river was a cocktail of battery acid, anti-freeze and runoff from a nuclear plant,. Yet, it didn’t take a high-profile environmental consultant to suspect the findings were inaccurate.After all, anyone could see that fish were still swimming. Frogs and tadpoles thrived along the banks.And human swimmers emerged from the water with their skin largely intact. All good indicators.So what went wrong with the assessment? Jannis Economou, the famous founder of Ypoforo, has suggested that the equipment he used could have been wrongly calibrated and, as a result, gave inaccurate readings.Many experts, however, question this explanation.After all, Ypoforo is known to have up-to-date training and equipment. Instead, many feel the more likely scenario is that Economou himself misread the numbers, due to his purportedly failing eyesight. New City Councilman Pat Down points to a line item that has recently appeared on Ypoforo’s invoices, charging $500 for eyeglasses, magnification lenses, large-print levels, and other aids Economou apparently needs to be able to see the small-size LED readouts on his monitoring equipment.Economou has offered to re-assess the waterway free of charge. ""It’s the least he can do,"" Down stated. ""I’m sure his last report caused everyone in the river at the time to lose control of their bowels which, come to think of it, may throw off his new assessment.""



	Report Delivered During Candlelight Vigil

Anyone interested in hearing environmental assessment findings by area advocate Ramblin’ Rose last Saturday may have come for the stats on Hurley Marsh, but stayed for the mellow—whether they like it or not.Rose, a former follower of the 90’s jam band The Boys, has her own unique way of disseminating her findings.For this occasion, she chose to hold the press conference at the site of a candlelight vigil commemorating the anniversary of the death of Jimmy Rodriguez, the legendary guitarist for The Boys. Incense, Boys bootleg tapes and unnaturally tasty brownies were distributed beside Rose’s chartered bus, which was used to bring in her team of volunteers to assist with the assessment at a cost of $1250. Rose has an enormous network of supporters and Boys fans she can call on to staff assessment teams. After performing a 20-minute air guitar solo tribute to Rodriguez, Rose attempted to psychically communicate her findings to area reporters. Despite her urgings, reporters failed to ""open their minds"" and ""listen with their most authentic selves,"" and Rose was forced to deliver the information more conventionally—that is, with words. It’s widely known that, despite her reputation as an unbiased and scrupulous assessor, Rose is an eccentric who has difficulty communicating her finds in a credible manner.This proved to be the case once again, when Rose summarized her report by saying the state of the Marsh gave her a ""heck of a soul ache.""   



    Scathing Report Condemns Local Factory

""Make ""em pay,"" is the slogan of the environmental consultancy Enviro-X, lead by local legend Skeeter McBragg. And that’s exactly what he intends to do to Plasticorp, whose chemical storage facility recently exploded. ""They’re the worst,"" McBragg proclaimed at a recent press conference, upon announcing that his group will lead the effort to assess the degree of toxicity released into the environment by the explosion. ""They make me burn up,"" he added, before distributing a report that was ""written"" with a Sharpie on napkins from Burrito Bill’s.The group has already set up a command center, complete with half-pipe, and members can be seen patrolling the area on their controversial motorized skateboards, which reportedly cost $500 to retrofit with 130 HP engines. Some locals find their presence alarming and are eager to point out that the Plasticorp explosion has all the characteristics of other eco-terror attacks that Enviro-X has been hired to assess. ""It’s their fault,"" said one of McBragg’s skate buddies and close coworker, when questioned about the incidents. ""They had it coming to them…"" Now fully entrenched, McBragg and his skater assessors seem determined to expose Plasticorp as disreputable corporate citizens, even as McBragg’s critics claim Enviro-X is better suited for creating environmental havoc that it is for assessing ecological damage. ""Some critics need a good head-butt,"" McBragg says in response, before laughing hysterically.
"; }
            }

            public string Week2 { get; private set; }
            public string Week3 { get; private set; }
        }
    }
}