using UnityEngine;
using System.Collections;

namespace Assets.Scripts.Data
{
	public class BusinessCardsData 
	{

		public enum Business
		{  
			
			MarvinMoneymakerBusinessCard                    = 01,
			NinaOjedaBusinessCard                           = 02,
			SandyCarlsonBusinessCard                        = 03,
			GabeVineBusinessCard                            = 04,
			BjornEganBusinessCard                           = 05,
			NurseJohnGrayBusinessCard                       = 06,
			TomBarrierBusinessCardAtMedicInc                = 07,
			DrZekeMullenBusinessCard                        = 08,
			GilFerminBusinessCard                           = 09,
			DennisMcCarthyBusinessCard                      = 10,
			MarkCarpenterBusinessCard                       = 11,
			BillBurellsBusinessCard                         = 12,
			PhilBurellsBusinessCard                         = 13,
			AnthonyWexlerBusinessCard                       = 14,
			PeterBoltrightBusinessCardAtPremiereContainment = 15,
			OrokoNakashimaBusinessCard                      = 16,
			NathanielWailerBusinessCard                     = 17,
			SkeeterMcBraggBusinessCard                      = 18,
			HeatherWinehartBusinessCard                     = 19,
			JannisEconomouBusinessCard                      = 20,
			RamblinRoseBusinessCard                         = 21,
			//HeatherWinehartBusinessCard2                  = 22, DUPE Below
			WesBerlinBusinessCardAtMomsBasement             = 23,
			LakeishaBusinessCard                            = 24,
			GrandmasterGBusinessCard                        = 25,
			FionaRuddBusinessCard                           = 26,
			DVerbBusinessCard                               = 27,
			MargaretWongBusinessCard                        = 28,
			CedricMaxwellBusinessCard                       = 29,
			SamShortbackBusinessCard                        = 30,
			DaveShortbackBusinessCard                       = 31,
			WillieKetchumBusinessCard                       = 32,
			AshleyDapperBusinessCard                        = 33,
			WandaRownBusinessCard                           = 34,
			FreidaWestBusinessCard                          = 35,
			AdamBaumBusinessCard                            = 36,
			CountdeMonetBusinessCard                        = 37,
			AvanishSinghBusinessCard                        = 38,
			AnthonyDeweyBusinessCard                        = 39,
			AbbieSKorpisBusinessCard                        = 40,
			LiddyGatesBusinessCard                          = 41,
			DebraGeffenBusinessCard                         = 42,
			PeterBoltrightBusinessCardAtBoltrightsGarage    = 43,
			PhilGastrowBusinessCard                         = 44,
			PierreTorqueBusinessCard                        = 45,
			RoseanneBellagiornoBusinessCard                 = 46,
			SamanthaKimBusinessCard                         = 47,
			//SandyCarlsonBusinessCard2                     = 48, DUPE Below
			SeanKwertyBusinessCard                          = 49,
			NathanBroomeBusinessCard                        = 50,
			BurningManTicket		                        = 51,
			TerrellDouglasBusinessCard                      = 52,
			TomBarrierBusinessCardAtOB3MedicInc             = 53,
			VernonSharpeBusinessCard                        = 54,
			VladimirSloboloaschBusinessCard                 = 55,
			//WandaRownBusinessCard2                        = 56,  DUPE Below
			WebsterDweebBusinessCard                        = 57,
			WesBerlinBusinessCardAtMothersHouse             = 58,
			DanceLesson				                        = 59
		}

		public static string[] GetCard(Business card)
		{

			int i = (int) card;

			return new string[]
			{
				data[i,0],
				data[i,1]
			};
		}

		/// <summary>
		/// because some have the same name can't use dictionary
		/// </summary>
		public static string[,] data = new string[,]
		{

			//1  // Task 1 Business Cards    
			{"Marvin Moneymaker's Business Card","Marvin Moneymaker's Business Card.\nLocated at Media Relations, Inc."},
			//2
			{"Nina Ojeda's Business Card","Nina Ojeda's Business Card.\nLocated at Narravi Associates."},
			//3
			{"Sandy Carlson's Business Card","Sandy Carlson's Business Card.\nLocated at New City Cinema."},
			//4
			{"Gabe Vine's Business Card","Gabe Vine's Business Card.\nLocated at New Media Communications."},
			//5
			{"Bjorn Egan's Business Card","Bjorn Egan's Business Card.\nLocated at Norse Communications."},
			//6
			{"Nurse John Gray's Business Card","Nurse John Gray's Business Card.\nLocated at First Responders."},
			//7
			{"Tom Barrier's Business Card","Tom Barrier's Business Card.\nLocated at Medic! Inc."},
			//8
			{"Dr. Zeke Mullen's Business Card","Dr. Zeke Mullen's Business Card.\nLocated at Mullen Medical Supply."},
			//9
			{"Gil Fermin's Business Card","Gil Fermin's Business Card.\nLocated at New City Emergency Medics Association."},
			//10
			{"Dennis McCarthy's Business Card","Dennis McCarthy's Business Card.\nLocated at Techtronics."},
			//11
			{"Mark Carpenter's Business Card","Mark Carpenter's Business Card.\nLocated at Power Displays."},
			//12
			{"Bill Burells's Business Card","Bill Burells's Business Card.\nLocated at Burells Brothers."},
			//13
			{"Phil Burells's Business Card","DJ Synapse's Business Card.\nLocated at Burells Brothers."},
			//14
			{"Anthony Wexler's Business Card","Anthony Wexler's Business Card.\nLocated at Interstate Containment."},
			//15
			{"Peter Boltright's Business Card","Peter Boltright's Business Card.\nLocated at Premiere Containment."},
			//16
			{"Oroko Nakashima's Business Card","Oroko Nakashima's Business Card.\nLocated at Running Rivers Corporation."},
			//17
			{"Nathaniel Wailer's Business Card","Nathaniel Wailer's Business Card.\nLocated at Eco-Tech."},
			//18
			{"Skeeter McBragg's Business Card","Skeeter McBragg's Business Card.\nLocated at Enviro-X."},
			//19
			{"Heather Winehart's Business Card","Heather Winehart's Business Card.\nLocated at Heather Winehart's Loft."},
			//20
			{"Jannis Economou's Business Card","Jannis Economou's Business Card.\nLocated at Ypoforo Ecosystems."},
			//21
			{"Ramblin' Rose's Business Card","Ramblin' Rose's Business Card.\nLocated at park by City Hall."},
			//22 DUPE
			//{"Heather Winehart's Business Card","Heather Winehart's Business Card.\nLocated at Heather Winehart's Loft."},

			//23 //Task 2 Business Cards
			{"Wes Berlin's Business Card","Wes Berlin's Business Card.\nLocated at Wes Berlin's Mom's Basement."},
			//24
			{"Lakeisha's Business Card","Lakeisha's Business Card.\nLocated at Can't Get Enough Media."},
			//25
			{"Grandmaster G's Business Card","Grandmaster G's Business Card.\nLocated at Grandmaster G's Recording Studio."},
			//26
			{"Fiona Rudd's Business Card","Fiona Rudd's Business Card.\nLocated at Remember the Mane Hair Salon."},
			//27
			{"D-Verb's Business Card","D-Verb's Business Card\nLocated at Hip Hop House Loft's"},
			//28
			{"Margaret Wong's Business Card","If it's Wong, it's Right!\nLocated at Phoenix Services Group."},
			//29
			{"Cedric Maxwell's Business Card","Cedric Maxwell's Business Card.\nLocated at Force One Logistics."},
			//30
			{"Sam Shortback's Business Card","Sam Shortback's Business Card.\nLocated at Prairie Services Group."},
			//31
			{"Dave Shortback's Business Card","Dave Shortback's Business Card.\nLocated at Davetern Logistics."},
			//32
			{"Willie Ketchum's Business Card","Willie Ketchum's Business Card.\nLocated at City Hall."},
			//33
			{"Ashley Dapper's Business Card","Ashley Dapper's Business Card.\nLocated at Clean Green Machinery."},
			//34
			{"Wanda Rown's Business Card","Wanda Rown's Business Card.\nLocated at Potty Princess."},
			//35
			{"Freida West's Business Card","Freida West's Business Card.\nLocated at West Disposal Services."},
			//36
			{"Adam Baum's Business Card","Adam Baum's Business Card.\nLocated at Dis-Pos Corporation."},
			//37
			{"Count de Monet's Business Card","Count de Monet's Business Card.\nLocated at Thone Time."},
			//38
			{"Avanish Singh' Business Card","Avanish Singh' Business Card.\nLocated at Eastern Legal."},
			//39
			{"Anthony Dewey's Business Card","Anthony Dewey's Business Card.\nLocated at Dewey, Sewham, and Howe."},
			//40
			{"Abbie S. Korpis's Business Card","Abbie S. Korpis's Business Card.\nLocated at Abbie S. Korpis Associates."},
			//41
			{"Liddy Gates's Business Card","Liddy Gates's Business Card.\nLocated at Gates & Partners."},
			//42
			{"Debra Geffen's Business Card","Debra Geffen's Business Card.\nLocated at Click-Adz."},


			//43
			{"Peter Boltright's Business Card","Peter Boltright's Business Card\nHe is Located at Boltright's Garage"},
			//44
			{"Phil Gastrow's Business Card","Phil Gastrow's Business Card.\nLocated at Hav-A-Seat Facility."},
			//45
			{"Pierre Torque's Business Card","Pierre Torque's Business Card.\nLocated at RideRight Inc."},
			//46
			{"Roseanne Bellagiorno's Business Card","Roseanne Bellagiorno's Business Card.\nShe is located at Buona Fortuna."},
			//47
			{"Samantha Kim's Business Card","Samantha Kim's Business Card.\nLocated at OB2 - Apex Protection Services."},
			//48 DUPE
			//{"Sandy Carlson's Business Card","Sandy Carlson's Business Card.\nLocated at New City Cinema."},
			//49
			{"Sean Kwerty's Business Card","Sean Kwerty's Business Card.\nLocated at OB1 - hiTek Security."},
			//50
			{"Nathan Broome","Nathan Broome's Business Card.\nLocated at New City Tools and Equipment."},
			//51
			{"Burning Man Ticket","Admit one to\nBurning Man Festival 2013"},
			//52
			{"Terrell Douglas' Business Card","Terrell Douglas' Business Card.\nLocated at OB2 - National Audio Visual."},
			//53
			{"Tom Barrier's Business Card","Tom Barrier's Business Card.\nLocated at OB3 - Medic! Inc."},
			//54
			{"Vernon Sharpe's Business Card","Vernon Sharpe's Business Card.\nLocated at United Americans Club."},
			//55
			{"Vladimir Sloboloasch's Business Card","Vladimir Sloboloasch's Business Card.\nLocated at Downtown by City Hall."},
			//56 DUPE
			//{"Wanda Rown's Business Card","Wanda Rown's Business Card.\nLocated at Potty Princess."},
			//57
			{"Webster Dweeb's Business Card","Webster Dweeb's Business Card.\nLocated at the Internet Cafe"},
			//58
			{"Wes Berlin's Business Card","Wes Berlin's Business Card.\nLocated at Wes Berlin's Mother's House."},
			//59
			{"One Free Dance Lesson","One Free Dance Lesson.\nExpires January 31, 1992"}

		};

	}
}