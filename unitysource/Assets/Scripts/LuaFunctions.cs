using UnityEngine;
using System.Collections;

public static class LuaFunctions
{
	public static void Process_DiaEntry_Function(DiaEntry_Function func)
	{
		switch (func.name)
		{
			case "closethegame":
				closethegame();
			break;
			case "setvar":
				setvar(func.arg1.str, func.arg2);
			break;
			case "incvars":
				incvars(func.arg1.str);
			break;
			case "talkedtostan":
				talkedtostan();
			break;
			case "talkedtomayor":
				talkedtomayor();
			break;
			case "talkedtowill":
				talkedtowill();
			break;
			case "talkedtoexpert":
				talkedtoexpert();
				GLOBAL.Player.Log("Talked to Expert");

			break;
			case "talkedtoevelyn":
				talkedtoevelyn();
			break;
			case "incfailed":
				incfailed();
			break;
			case "startingcostplus10perc":
				startingcostplus10perc();
			break;
			case "startingcostplus30perc":
				startingcostplus30perc();
			break;
			case "clearreneg":
				clearreneg();
			break;
			case "increneg":
				increneg();
			break;
			case "incceo":
				incceo();
			break;
			case "incevelyn":
				incevelyn();
			break;
			case "incstandon":
				incstandon();
			break;
			case "incmayor":
				incmayor();

// Peter was here again...
				GLOBAL.Player.Log("Mayor Inc:#"+
				GLOBAL.Player.progress["mayorprogress"].ToString()
				);


			break;
			case "incexpert":
				incexpert();
			break;
			case "incvendor1":
				incvendor1();
			break;
			case "incvendor2":
				incvendor2();
			break;
			case "incvendor3":
				incvendor3();
			break;
			case "incvendor4":
				incvendor4();
			break;
			case "talkedtovendor1":
				talkedtovendor1();
			break;
			case "talkedtovendor2":
				talkedtovendor2();
			break;
			case "talkedtovendor3":
				talkedtovendor3();
			break;
			case "talkedtovendor4":
				talkedtovendor4();
			break;
			case "incvendorsvisited":
				incvendorsvisited();
			break;
			case "vendorto1":
				vendorto1();
			break;
			case "vendorto2":
				vendorto2();
			break;
			case "vendorto3":
				vendorto3();
			break;
			case "vendorto4":
				vendorto4();
			break;
			case "pickedvendor1":
				pickedvendor1();
				logvendorchoice();	// Write vendor to log file - below
			break;

			case "pickedvendor2":
				pickedvendor2();
				logvendorchoice();	// Write vendor to log file - below
			break;


			case "pickedvendor3":
				pickedvendor3();
				logvendorchoice();	// Write vendor to log file - below
			break;

			case "pickedvendor4":
				pickedvendor4();
				logvendorchoice();	// Write vendor to log file - below
			break;

			case "incpickedvendor":
				incpickedvendor();
			break;
			case "setpickedvendor":
				setpickedvendor();
			break;
			case "incl1w1":
				incl1w1();
			break;
			case "incl1w2":
				incl1w2();
			break;
			case "incl1r":
				incl1r();
			break;
			case "incl2w1":
				incl2w1();
			break;
			case "incl2w2":
				incl2w2();
			break;
			case "incl2r":
				incl2r();
			break;
			case "incsheriff":
				incsheriff();
			break;
			case "incwp1":
				incwp1();
			break;
			case "incwp2":
				incwp2();
			break;
			case "incwp3":
				incwp3();
			break;
			case "incwp4":
				incwp4();
			break;
			case "gotclueobj":
				gotclueobj(func.arg1.str);
			break;
			case "arrestme":
				arrestme(func.arg1.str);
			break;
			case "foundcrim":
				foundcrim();
			break;
			case "getcheck":
				getcheck();
			break;
			case "checkop":
				checkop();
			break;
			case "setexp":
				setexp();
			break;
			case "setbaseprofit":
				setbaseprofit();
			break;
			case "incprofit":
				incprofit(func.arg1.i);
			break;
			case "decprofit":
				decprofit(func.arg1.i);
			break;
			case "calccost":
				calccost();
			break;
			case "calccostinc":
				calccostinc(func.arg1.i, func.arg2.i);
			break;
			case "calccostdec":
				calccostdec(func.arg1.i, func.arg2.i);
			break;
			case "halfcost":
				halfcost();
			break;
			case "threequartercost":
				threequartercost();
			break;
			case "addexpense":
				addexpense(func.arg1.i);
			break;
			case "subexpense":
				subexpense(func.arg1.i);
			break;
			case "wrongprice":
				wrongprice();
			break;
			case "getvendorcontract":
				getvendorcontract();
			break;
			case "getcontractcost":
				getcontractcost();
			break;
			case "arrestscene":
				arrestscene(func.arg1.str, func.arg2.str);
			break;
			case "setcontractcost":
				setcontractcost(func.arg1.i);
			break;
			case "takemarkup":
				takemarkup();
			break;
			case "storecost":
				storecost();
			break;


			case "incexplored":
				incexplored(func.arg1.i);
			break;
			case "incplayercash":
				incplayercash(func.arg1.i);
			break;
			case "decplayercash":
				decplayercash(func.arg1.i);
			break;
			case "purchase":
				purchase(func.arg1.i);
			break;
			case "dropcash":
				dropcash();
			break;
			case "incinterv":
				incinterv();
			break;
			case "incsq":
				incsq();
			break;
			case "incceostate":
				incceostate();
			break;
			case "decceostate":
				decceostate();
			break;
			case "storescore":
				storescore(func.arg1.str, func.arg2.str);
			break;
			case "storenlcscore":
				storenlcscore(func.arg1.str, func.arg2.str);
			break;
			case "storemsq":
				storemsq(func.arg1.str, func.arg1.str);
			break;
			case "incoldlady":
				incoldlady();
			break;
			case "incol2":
				incol2();
			break;
			case "incol3":
				incol3();
			break;
			case "addboxofhotdogs":
				addboxofhotdogs();
			break;
			case "inchotdog":
				inchotdog();
			break;
			case "bingoto1":
				bingoto1();
			break;
			case "bingoto2":
				bingoto2();
			break;
			case "bingoto3":
				bingoto3();
			break;
			case "organto1":
				organto1();
			break;
			case "organto2":
				organto2();
			break;
			case "organto3":
				organto3();
			break;
			case "incedt":
				incedt();
			break;
			case "incmickey":
				incmickey();
			break;
			case "mickeyto2":
				mickeyto2();
			break;
			case "mickeyto3":
				mickeyto3();
			break;
			case "incmickeycost":
				incmickeycost();
			break;
			case "mickeytext":
				mickeytext();
			break;
			case "mickeydeductcash":
				mickeydeductcash();
			break;
			case "suzieto1":
				suzieto1();
			break;
			case "suzieto2":
				suzieto2();
			break;
			case "suzieto3":
				suzieto3();
			break;
			case "calctourcash":
				calctourcash();
			break;
			case "addtouristscore":
				addtouristscore();
			break;
			case "tourguideto1":
				tourguideto1();
			break;
			case "tourguideto2":
				tourguideto2();
			break;
			case "tourguideto3":
				tourguideto3();
			break;
			case "addwtqscore":
				addwtqscore();
			break;
			case "incwtq":
				incwtq();
			break;
			case "addmqscore":
				addmqscore();
			break;
			case "addmathcash":
				addmathcash();
			break;
			case "incresult":
				incresult();
			break;
			case "incmath":
				incmath();
			break;
			case "keesterto1":
				keesterto1();
			break;
			case "keesterto2":
				keesterto2();
			break;
			case "keesterto3":
				keesterto3();
			break;
			case "adduwayscore":
				adduwayscore();
			break;
			case "incuway":
				incuway();
			break;
			case "incticket":
				incticket();
			break;
			case "decvars":
				decvars(func.arg1.str);
			break;
			case "ettto5":
				ettto5();
			break;
			case "ettfailed":
				ettfailed();
			break;
			case "olett":
				olett();
			break;
			case "francodeduct":
				francodeduct();
			break;
			case "takebook":
				takebook();
			break;
			case "givebook":
				givebook(func.arg1.str);
			break;
			case "buycrier":
				buycrier();
			break;
			case "buyexaminer":
				buyexaminer();
			break;
			case "buytoday":
				buytoday();
			break;
			case "buymickeyclothes":
				buymickeyclothes(func.arg1.i);
			break;
			// BChance: (2016-07-25) - Function 'buyoutfit' not called by NPC lua scripts and 
			//                           has too many arguments for current lua parser.
			//case "buyoutfit":
			//	buyoutfit(int arg, string gvar, string mb, int arg2);
			//break;


			case "appendscore":
				appendscore(func.arg1.str);
			break;
			case "flagvendorinfo":
				flagvendorinfo(func.arg1.i);
			break;
			case "vendorinfoscore":
				vendorinfoscore();
			break;
			case "willclothingscore3":
				willclothingscore3(func.arg1.str, func.arg2.str);
			break;
			case "willclothingscore":
				willclothingscore();
			break;
			case "willclothingscore2":
				willclothingscore2();
			break;


			default:
				Debug.LogError("!!! ERROR - LuaFunctions.Process_DiaEntry_Function - Function '" + func.name + "' not recognized.");
			break;
		}

		// Update the UI (particularly the Inventory) based on any state changes.
		GLOBAL.RefreshUIBasedOnProgress();
	}

	public static void closethegame()
	{
		// App.Close();

		Debug.LogError("LuaFunctions.closethegame() not implemented.");
	}

	public static void setvar(string key, MultiType value)
	{
		GLOBAL.Player.progress[key] = value;

		if (key.Equals("journalprogress"))		// peter
		{
			// BChance: Track the progress for the current week.
			int journalprogress = GLOBAL.Player.progress["journalprogress"].i;
			int week = GLOBAL.Player.progress["week"].i;
			string key_prog = string.Format("w{0}prog", week);
			GLOBAL.Player.progress[key_prog] = journalprogress;

			GLOBAL.Player.Log(string.Format("Journal Progress SET: {0}", journalprogress));

			if (   ((week == 1 || week == 2) && journalprogress == 12)
				|| (week == 3 && journalprogress == 7))
			{
				int cost = GLOBAL.Player.progress["cost"].i;
				GLOBAL.Player.Log(string.Format("CONTRACT DONE!  at...${0}!!!!!!", cost));
			}
		}
	}

	public static void incvars(string key)
	{
		GLOBAL.Player.progress[key] = GLOBAL.Player.progress[key] + 1;

		if (key.Equals("journalprogress"))		// peter
		{
			// BChance: Track the progress for the current week.
			int journalprogress = GLOBAL.Player.progress["journalprogress"].i;
			int week = GLOBAL.Player.progress["week"].i;
			string key_prog = string.Format("w{0}prog", week);
			GLOBAL.Player.progress[key_prog] = journalprogress;

			GLOBAL.Player.Log(string.Format
			(
				"Journal Progress Bumped: {0}  week: {1}!", 
				journalprogress, 
				week
			));
		}
	}

	public static void talkedtostan()
	{
		GLOBAL.Player.progress["talked_stan"] = 1;
	}

	public static void talkedtomayor()
	{
		GLOBAL.Player.progress["talked_mayor"] = 1;
	}

	public static void talkedtowill()
	{
		GLOBAL.Player.progress["talked_will"] = 1;
	}

	public static void talkedtoexpert()
	{
		GLOBAL.Player.progress["talked_expert"] = 1;
		if (GLOBAL.Player.progress["tourguide"] == 0)
		{
			GLOBAL.Player.progress["tourguide"] = 1;
		}
		if (GLOBAL.Player.progress["week"] == 1 && GLOBAL.Player.progress["msq1"] == 0)
		{
			GLOBAL.Player.progress["msq1"] = 1;
		}
		else if ((GLOBAL.Player.progress["week"] == 2 || GLOBAL.Player.progress["week"] == 3) && GLOBAL.Player.progress["msqprogress"] == 0)
		{
			GLOBAL.Player.progress["msqprogress"] = 1;
		} 
	}

	public static void talkedtoevelyn()
	{
		GLOBAL.Player.progress["talked_evelyn"] = 1;
	}

	public static void incfailed()
	{
		GLOBAL.Player.progress["failed"] = GLOBAL.Player.progress["failed"] + 1;
	}
			
	public static void startingcostplus10perc()
	{
		GLOBAL.Player.progress["testcost"] = Mathf.RoundToInt(GLOBAL.Player.progress["startingcost"].i * 1.1f);
	}

	public static void startingcostplus30perc()
	{
		GLOBAL.Player.progress["testcost"] = Mathf.RoundToInt(GLOBAL.Player.progress["startingcost"].i * 1.3f);
	}

	public static void clearreneg()
	{
		GLOBAL.Player.progress["reneg"] = 0;
	}

	public static void increneg()
	{
		GLOBAL.Player.progress["reneg"] = GLOBAL.Player.progress["reneg"] + 1;
	}

	public static void incceo()
	{
		GLOBAL.Player.progress["ceoprogress"] = GLOBAL.Player.progress["ceoprogress"] + 1;
	}

	public static void incevelyn()
	{
		GLOBAL.Player.progress["evelynprogress"] = GLOBAL.Player.progress["evelynprogress"] + 1;
	}

	public static void incstandon()
	{
		GLOBAL.Player.progress["standonprogress"] = GLOBAL.Player.progress["standonprogress"] + 1;
	}

	public static void incmayor()
	{
		GLOBAL.Player.progress["mayorprogress"] = GLOBAL.Player.progress["mayorprogress"] + 1;
	}

	public static void incexpert()
	{
		GLOBAL.Player.progress["expertprogress"] = GLOBAL.Player.progress["expertprogress"] + 1;
	}

	public static void incvendor1()
	{
		GLOBAL.Player.progress["vendor1progress"] = GLOBAL.Player.progress["vendor1progress"] + 1;
		GLOBAL.Player.progress["lastvendor"] = 1;
		if (GLOBAL.Player.progress["week"] == 3 && GLOBAL.Player.progress["vendor1progress"] == 2)
		{
			GLOBAL.Player.progress["mickeytrap"] = 1;
			GLOBAL.Player.progress["mickey"] = 1;
		}
	}

	public static void incvendor2()
	{
		GLOBAL.Player.progress["vendor2progress"] = GLOBAL.Player.progress["vendor2progress"] + 1;
		GLOBAL.Player.progress["lastvendor"] = 2;
		if (GLOBAL.Player.progress["week"] == 3 && GLOBAL.Player.progress["vendor2progress"] == 2)
		{
			GLOBAL.Player.progress["mickeytrap"] = 1;
			GLOBAL.Player.progress["mickey"] = 1;
		}
	}

	public static void incvendor3()
	{
		GLOBAL.Player.progress["vendor3progress"] = GLOBAL.Player.progress["vendor3progress"] + 1;
		GLOBAL.Player.progress["lastvendor"] = 3;
		if (GLOBAL.Player.progress["week"] == 3 && GLOBAL.Player.progress["vendor3progress"] == 2)
		{
			GLOBAL.Player.progress["mickeytrap"] = 1;
			GLOBAL.Player.progress["mickey"] = 1;
		}
	}

	public static void incvendor4()
	{
		GLOBAL.Player.progress["vendor4progress"] = GLOBAL.Player.progress["vendor4progress"] + 1;
		GLOBAL.Player.progress["lastvendor"] = 4;
		if (GLOBAL.Player.progress["week"] == 3 && GLOBAL.Player.progress["vendor4progress"] == 2)
		{
			GLOBAL.Player.progress["mickeytrap"] = 1;
			GLOBAL.Player.progress["mickey"] = 1;
		}
	}

	public static void talkedtovendor1()
	{
		GLOBAL.Player.progress["talked_vendor1"] = 1;

		// BChance: Compose and flag the v_talked flag for this week and vendor.
		int week = GLOBAL.Player.progress["week"].i;
		string v_talked = string.Format("w{0}v1_talked", week);
		GLOBAL.Player.progress[v_talked] = true;
	}

	public static void talkedtovendor2()
	{
		GLOBAL.Player.progress["talked_vendor2"] = 1;

		// BChance: Compose and flag the v_talked flag for this week and vendor.
		int week = GLOBAL.Player.progress["week"].i;
		string v_talked = string.Format("w{0}v2_talked", week);
		GLOBAL.Player.progress[v_talked] = true;
	}

	public static void talkedtovendor3()
	{
		GLOBAL.Player.progress["talked_vendor3"] = 1;

		// BChance: Compose and flag the v_talked flag for this week and vendor.
		int week = GLOBAL.Player.progress["week"].i;
		string v_talked = string.Format("w{0}v3_talked", week);
		GLOBAL.Player.progress[v_talked] = true;
	}

	public static void talkedtovendor4()
	{
		GLOBAL.Player.progress["talked_vendor4"] = 1;

		// BChance: Compose and flag the v_talked flag for this week and vendor.
		int week = GLOBAL.Player.progress["week"].i;
		string v_talked = string.Format("w{0}v4_talked", week);
		GLOBAL.Player.progress[v_talked] = true;
	}

	public static void incvendorsvisited()
	{
		GLOBAL.Player.progress["vendorsvisited"] = GLOBAL.Player.progress["vendorsvisited"] + 1;
		GLOBAL.Player.progress["tkvendor"] = true;
		if (GLOBAL.Player.progress["vendorsvisited"] >= 2)
		{
			if (GLOBAL.Player.progress["standonprogress"] < 4)
			{
				GLOBAL.Player.progress["standonprogress"] = 4;
				incevelyn();
				incvars("journalprogress");
			}
			if (GLOBAL.Player.progress["vendorsvisited"] == 3)
			{
				GLOBAL.Player.progress["ett"] = 1;
				GLOBAL.Player.progress["etttrap"] = 1;
			} 

		}
	}

	public static void vendorto1()
	{
		GLOBAL.Player.progress["vendor"] = 1;
	}

	public static void vendorto2()
	{
		GLOBAL.Player.progress["vendor"] = 2;
	}

	public static void vendorto3()
	{
		GLOBAL.Player.progress["vendor"] = 3;
	}

	public static void vendorto4()
	{
		GLOBAL.Player.progress["vendor"] = 4;
	}


// Peter added this
	public static void logvendorchoice()
	{


		GLOBAL.Player.Log("Vendor Choice Testing");

		GLOBAL.Player.Log("Vendor Chosen:#"+
		GLOBAL.Player.progress["vendor"].ToString()+
						"   '"+GLOBAL.Player.progress["vendorx"].str+"'"
					);
		
	}



	public static void pickedvendor1()
	{
		if (GLOBAL.Player.progress["week"] == 1)
		{
			GLOBAL.Player.progress["w1vendor"] = 1;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Nina Ojeda";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Gil Fermin";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Peter Boltright";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Nathaniel Wailer";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			GLOBAL.Player.progress["w2vendor"] = 1;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Wes Berlin";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Phoenix Services Group";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Clean Green Machinery";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Eastern Legal";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["w3vendor"] = 1;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Phil and Bill Burrels";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Ramblin’ Rose";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Bjorn Egan";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Zeke Mullen";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 4)
		{
			GLOBAL.Player.progress["w4vendor"] = 1;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Wanda Rown";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Michael Manducci";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "DJ Synapse";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Roseanne Bellagiorno";
			}
		}		
		vendorto1();
		
		GLOBAL.Player.progress["tkvendorx"] = true;
		GLOBAL.Player.progress["tkinterviewed"] = true;
	}

	public static void pickedvendor2()
	{
		if (GLOBAL.Player.progress["week"] == 1)
		{
			GLOBAL.Player.progress["w1vendor"] = 2;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Gabe Vine";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Nurse John Gray";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Oroko Nakashima";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Jannis Economou";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			GLOBAL.Player.progress["w2vendor"] = 2;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Lakeisha";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Force One Logistics";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Potty Princess";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Dewey, Sewham, && Howe";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["w3vendor"] = 2;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Peter Boltright";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Nathaniel Wailer";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Nina Ojeda";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Gil Fermin";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 4)
		{
			GLOBAL.Player.progress["w4vendor"] = 2;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Count de Monet";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Mike Carpenter";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Fiona Rudd";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Mack McKinnon";
			}
		}		
		vendorto2();
		
		GLOBAL.Player.progress["tkvendorx"] = true;
		GLOBAL.Player.progress["tkinterviewed"] = true;
	}

	public static void pickedvendor3()
	{
		if (GLOBAL.Player.progress["week"] == 1)
		{
			GLOBAL.Player.progress["w1vendor"] = 3;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Bjorn Egan";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Tom Barrier";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Phil Burells";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Ramblin\' Rose";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			GLOBAL.Player.progress["w2vendor"] = 3;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Grandmaster G";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Prairie Fire Services Corp";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "West Disposal Services";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Abbie S. Korpis Associates";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["w3vendor"] = 3;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Anthony Wexler";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Skeeter McBragg";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Marvin Moneymaker";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Tom Barrier";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 4)
		{
			GLOBAL.Player.progress["w4vendor"] = 3;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Phil Gastrow";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Jack Cashdollar";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Webster Dweeb";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Mary Ellen Vantusio";
			}
		}		
		vendorto3();
		
		GLOBAL.Player.progress["tkvendorx"] = true;
		GLOBAL.Player.progress["tkinterviewed"] = true;
	}

	public static void pickedvendor4()
	{
		if (GLOBAL.Player.progress["week"] == 1)
		{
			GLOBAL.Player.progress["w1vendor"] = 4;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Marvin Moneymaker";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Dr. Zeke Mullen";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Anthony Wexler";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Skeeter McBragg";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			GLOBAL.Player.progress["w2vendor"] = 4;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Fiona Rudd";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Western Logistics";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Dis-Pos Corporation";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Gates & Partners";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["w3vendor"] = 4;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Oroko Nakashima";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Jannis Economou";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Gabe Vine";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "John Gray";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 4)
		{
			GLOBAL.Player.progress["w4vendor"] = 4;
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["vendorx"] = "Holly Hoch";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["vendorx"] = "Bernie Cook";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["vendorx"] = "Blitzo";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["vendorx"] = "Willie Trucks";
			}
		}		
		vendorto4();

		GLOBAL.Player.progress["tkvendorx"] = true;
		GLOBAL.Player.progress["tkinterviewed"] = true;
	}



	public static void incpickedvendor()
	{
		if (GLOBAL.Player.progress["vendor"] == 1)
		{
			incvendor1();
		}
		else if (GLOBAL.Player.progress["vendor"] == 2)
		{
			incvendor2();
		}
		else if (GLOBAL.Player.progress["vendor"] == 3)
		{
			incvendor3();
		}
		else if (GLOBAL.Player.progress["vendor"] == 4)
		{
			incvendor4();
		}
	}

	public static void setpickedvendor()
	{
		if (GLOBAL.Player.progress["vendor"] == 1)
		{
			if (GLOBAL.Player.progress["vendor1progress"] < 5)
			{
				GLOBAL.Player.progress["vendor1progress"] = 5;
			}
		}
		else if (GLOBAL.Player.progress["vendor"] == 2)
		{
			if (GLOBAL.Player.progress["vendor2progress"] < 5)
			{
				GLOBAL.Player.progress["vendor2progress"] = 5;
			}
		}
		else if (GLOBAL.Player.progress["vendor"] == 3)
		{
			if (GLOBAL.Player.progress["vendor3progress"] < 5)
			{
				GLOBAL.Player.progress["vendor3progress"] = 5;
			}
		}
		else if (GLOBAL.Player.progress["vendor"] == 4)
		{
			if (GLOBAL.Player.progress["vendor4progress"] < 5)
			{
				GLOBAL.Player.progress["vendor4progress"] = 5;
			}
		}
	}

	public static void incl1w1()
	{
		GLOBAL.Player.progress["l1w1progress"] = GLOBAL.Player.progress["l1w1progress"] + 1;
	}

	public static void incl1w2()
	{
		GLOBAL.Player.progress["l1w2progress"] = GLOBAL.Player.progress["l1w2progress"] + 1;
	}

	public static void incl1r()
	{
		GLOBAL.Player.progress["l1rprogress"] = GLOBAL.Player.progress["l1rprogress"] + 1;
	}

	public static void incl2w1()
	{
		GLOBAL.Player.progress["l2w1progress"] = GLOBAL.Player.progress["l2w1progress"] + 1;
	}

	public static void incl2w2()
	{
		GLOBAL.Player.progress["l2w2progress"] = GLOBAL.Player.progress["l2w2progress"] + 1;
	}

	public static void incl2r()
	{
		GLOBAL.Player.progress["l2rprogress"] = GLOBAL.Player.progress["l2rprogress"] + 1;
	}

	public static void incsheriff()
	{
		GLOBAL.Player.progress["sheriffprogress"] = GLOBAL.Player.progress["sheriffprogress"] + 1;
	}

	public static void incwp1()
	{
		GLOBAL.Player.progress["wp1progress"] = GLOBAL.Player.progress["wp1progress"] + 1;
	}

	public static void incwp2()
	{
		GLOBAL.Player.progress["wp2progress"] = GLOBAL.Player.progress["wp2progress"] + 1;
	}

	public static void incwp3()
	{
		GLOBAL.Player.progress["wp3progress"] = GLOBAL.Player.progress["wp3progress"] + 1;
	}

	public static void incwp4()
	{
		GLOBAL.Player.progress["wp4progress"] = GLOBAL.Player.progress["wp4progress"] + 1;
	}

	public static void gotclueobj(string obj)
	{
		//GLOBAL.Player.progress["_G_" + obj] = 1;

		// BChance: (2016-10-30) - Tweaked the code to be more inline with lua scripts.
		GLOBAL.Player.progress[obj] = 1;
	}

	public static void arrestme(string v)
	{
		GLOBAL.Player.progress["spawnarrest"] = 1;
		//GLOBAL.Player.progress["_G_" + v] = 4;

		//// BChance: (2016-10-30) - Tweaked the code to be more inline with lua scripts.
		//GLOBAL.Player.progress[v] = 1;
		
		// Peter (nov 6 - wants to add an in jail state!)
		GLOBAL.Player.progress[v] = 4;

		// BChance: Trigger the arrest animation. 
		ArrestController.MakeArrest();
	}

	public static void foundcrim()
	{
		if (GLOBAL.Player.progress["vendor"] == 1)
		{
			GLOBAL.Player.progress["vendor2progress"] = 3;
			GLOBAL.Player.progress["vendor3progress"] = 3;
			GLOBAL.Player.progress["vendor4progress"] = 3;
		}
		else if (GLOBAL.Player.progress["vendor"] == 2)
		{
			GLOBAL.Player.progress["vendor1progress"] = 3;
			GLOBAL.Player.progress["vendor3progress"] = 3;
			GLOBAL.Player.progress["vendor4progress"] = 3;
		}
		else if (GLOBAL.Player.progress["vendor"] == 3)
		{
			GLOBAL.Player.progress["vendor1progress"] = 3;
			GLOBAL.Player.progress["vendor2progress"] = 3;
			GLOBAL.Player.progress["vendor4progress"] = 3;
		}
		else if (GLOBAL.Player.progress["vendor"] == 4)
		{
			GLOBAL.Player.progress["vendor1progress"] = 3;
			GLOBAL.Player.progress["vendor2progress"] = 3;
			GLOBAL.Player.progress["vendor3progress"] = 3;
		}
		if (GLOBAL.Player.progress["mayorprogress"] <= 1)
		{
			GLOBAL.Player.progress["mayorprogress"] = 4;
		}
		else
		{
			GLOBAL.Player.progress["mayorprogress"] = 3;
		}

		GLOBAL.Player.progress["sheriffprogress"] = 3;

		// BChance: Keep tracking intact by using the setvar function.
		setvar("journalprogress", 7);
	}

	public static void getcheck()
	{
		int checkcash;
		checkcash = 50 + (GLOBAL.Player.progress["lastweeksbusicards"].i * 10);
		incplayercash(checkcash);
		// check = 1;
	}

	public static void checkop()
	{
		if (GLOBAL.Player.progress["sheriffprogress"] == 0)
		{
			incevelyn();
		}
		else if (GLOBAL.Player.progress["sheriffprogress"] == 1)
		{
			incevelyn();
			incevelyn();
		}
		else if (GLOBAL.Player.progress["sheriffprogress"] == 2)
		{
			incevelyn();
			incevelyn();
			incevelyn();
		}
	}

	public static void setexp()
	{
		if (GLOBAL.Player.progress["week"] == 1)
		{
			GLOBAL.Player.progress["exp"] = 4000;
			GLOBAL.Player.progress["min"] = 3540;
			GLOBAL.Player.progress["max"] = 7760;
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			GLOBAL.Player.progress["exp"] = 10000;
			GLOBAL.Player.progress["min"] = 9100;
			GLOBAL.Player.progress["max"] = 17900;
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["exp"] = 20000;
			GLOBAL.Player.progress["min"] = 16900;
			GLOBAL.Player.progress["max"] = 42200;
		}
		GLOBAL.Player.progress["initexp"] = GLOBAL.Player.progress["exp"];
		GLOBAL.Player.progress["curexp"] = GLOBAL.Player.progress["exp"];
		calccost();
		GLOBAL.Player.progress["startingcost"] = GLOBAL.Player.progress["exp"];
	}

	public static void setbaseprofit()
	{
		if (GLOBAL.Player.progress["week"] == 3)
		{
			GLOBAL.Player.progress["profit"] = 50;
		}
		else
		{
			GLOBAL.Player.progress["profit"] = 35;
		}
	}

	public static void incprofit(int marg)
	{
		GLOBAL.Player.progress["profit"] = GLOBAL.Player.progress["profit"] + marg;
		calccost();
	}

	public static void decprofit(int marg)
	{
		if (GLOBAL.Player.progress["profit"] >= marg)
		{
			GLOBAL.Player.progress["profit"] = GLOBAL.Player.progress["profit"] - marg;
		}
		else
		{
			GLOBAL.Player.progress["profit"] = 0;
		}
		calccost();
	}

	public static void calccost()
	{
		int debug_before = GLOBAL.Player.progress["cost"].i;

		GLOBAL.Player.progress["cost"] = GLOBAL.Player.progress["curexp"] + ((GLOBAL.Player.progress["profit"] * GLOBAL.Player.progress["initexp"]) / 100);

		int debug_after = GLOBAL.Player.progress["cost"].i;
		Debug.Log(string.Format
		(
			"LuaFunctions.calccost() - cost_before: {0}, cost_after: {1}, curexp: {2}, profit: {3}, initexp: {4}",
			debug_before,
			debug_after,
			GLOBAL.Player.progress["curexp"],
			GLOBAL.Player.progress["profit"],
			GLOBAL.Player.progress["initexp"]
		));
	}

	public static void calccostinc(int iexp, int iprof)
	{
		int debug_before = GLOBAL.Player.progress["cost"].i;

		GLOBAL.Player.progress["cost"] = (GLOBAL.Player.progress["curexp"] + iexp) + (((GLOBAL.Player.progress["profit"] + iprof) * GLOBAL.Player.progress["initexp"]) / 100);
	
		int debug_after = GLOBAL.Player.progress["cost"].i;
		Debug.Log(string.Format("LuaFunctions.calccostinc() - cost_before: {0}, cost_after: {1}", debug_before, debug_after));
	}

	public static void calccostdec(int iexp, int iprof)
	{
		int debug_before = GLOBAL.Player.progress["cost"].i;

		GLOBAL.Player.progress["cost"] = (GLOBAL.Player.progress["curexp"] - iexp) + (((GLOBAL.Player.progress["profit"] - iprof) * GLOBAL.Player.progress["initexp"]) / 100);
	
		int debug_after = GLOBAL.Player.progress["cost"].i;
		Debug.Log(string.Format("LuaFunctions.calccostdec() - cost_before: {0}, cost_after: {1}", debug_before, debug_after));
	}

	public static void halfcost()
	{
		int debug_before = GLOBAL.Player.progress["deal"].i;

		GLOBAL.Player.progress["deal"] = GLOBAL.Player.progress["cost"] / 2;
	
		int debug_after = GLOBAL.Player.progress["deal"].i;
		Debug.Log(string.Format("LuaFunctions.halfcost() - deal_before: {0}, deal_after: {1}", debug_before, debug_after));
	}

	public static void threequartercost()
	{
		int debug_before = GLOBAL.Player.progress["deal"].i;

		GLOBAL.Player.progress["deal"] = GLOBAL.Player.progress["cost"] * 3 / 4;
	
		int debug_after = GLOBAL.Player.progress["deal"].i;
		Debug.Log(string.Format("LuaFunctions.threequartercost() - deal_before: {0}, deal_after: {1}", debug_before, debug_after));
	}

	public static void addexpense(int iexp)
	{
		GLOBAL.Player.progress["curexp"] = GLOBAL.Player.progress["curexp"] + iexp;
		calccost();
	}

	public static void subexpense(int iexp)
	{
		GLOBAL.Player.progress["curexp"] = GLOBAL.Player.progress["curexp"] - iexp;
		calccost();
	}

	public static void wrongprice()
	{
		int debug_before = GLOBAL.Player.progress["cost"].i;

		GLOBAL.Player.progress["cost"] = Mathf.RoundToInt(GLOBAL.Player.progress["cost"].i * 1.1f);
	
		int debug_after = GLOBAL.Player.progress["cost"].i;
		Debug.Log(string.Format("LuaFunctions.wrongprice() - cost_before: {0}, cost_after: {1}", debug_before, debug_after));
	}

	public static void getvendorcontract()
	{
		GLOBAL.Player.progress["vendorcontract"] = true;
		GLOBAL.Player.progress["invcontract"] = null;
		//picksubgui(2);
	}

	public static void getcontractcost()
	{
		GLOBAL.Player.progress["con1"] = Mathf.RoundToInt(GLOBAL.Player.progress["cost"].i * 0.8f);
		GLOBAL.Player.progress["con2"] = Mathf.RoundToInt(GLOBAL.Player.progress["cost"].i * 1.0f);
		GLOBAL.Player.progress["con3"] = Mathf.RoundToInt(GLOBAL.Player.progress["cost"].i * 1.1f);
		GLOBAL.Player.progress["con4"] = Mathf.RoundToInt(GLOBAL.Player.progress["cost"].i * 1.2f);
	}

	public static void arrestscene(string npc_vendor, string vendorlastname)
	{
		if (GLOBAL.Player.progress["spawnarrest"] == 1)
		{
			GLOBAL.Player.progress["arrestedvendor"] = vendorlastname;
			// arrest_ceo = npc_add("Stan_Freeman","NPC_Freeman.bwo");
			Debug.LogError("arrest_sam() not implemented for LuaFunctions.arrestscene()"); //arrest_sam = npc_add("Willie_Ketchum","arrest1.bwo");
			GLOBAL.Player.progress["spawnarrest"] = 2;
		}
		if (GLOBAL.Player.progress["spawnarrest"] == 3)
		{
			Debug.LogError("npc_close() not implemented for LuaFunctions.arrestscene()"); //npc_close(npc_vendor);
			Debug.LogError("npc_close() not implemented for LuaFunctions.arrestscene()"); //npc_close(arrest_sam);		
			GLOBAL.Player.progress["spawnarrest"] = 4;
		}
		if (GLOBAL.Player.progress["spawnarrest"] == 5)
		{
			//npc_close(arrest_ceo);
		}
	}

	public static void setcontractcost(int x)
	{
		if (x == 1)
		{
			GLOBAL.Player.progress["contractcost"] = GLOBAL.Player.progress["con1"];
			wrongprice();
		}
		else if (x == 2)
		{
			GLOBAL.Player.progress["contractcost"] = GLOBAL.Player.progress["con2"];
		}
		else if (x == 3)
		{
			GLOBAL.Player.progress["contractcost"] = GLOBAL.Player.progress["con3"];
		}
		else if (x == 4)
		{
			GLOBAL.Player.progress["contractcost"] = GLOBAL.Player.progress["con4"];
		}
	//	Engine.AddMsg(-1,600,string.Format("contract GLOBAL.Player.progress["cost"] is {0}\n",GLOBAL.Player.progress["contractcost"]););
	}

	public static void takemarkup()
	{
		int debug_before = GLOBAL.Player.progress["cost"].i;

		GLOBAL.Player.progress["cost"] = GLOBAL.Player.progress["contractcost"];

		int debug_after = GLOBAL.Player.progress["cost"].i;
		Debug.Log(string.Format("LuaFunctions.calccost() - cost_before: {0}, cost_after: {1}", debug_before, debug_after));
	}

	//public static void bio()
	//{
	//	biobox = OS.addscript("showbio.lua");
	//	
	//	hideicky = true;
	//}

	//public static void ickyarticle()
	//{
	//	sIckyEntries = sIckyEntries + 1;
	//	
	//	tkickyentries = true;
	//	Debug.Log(string.Format("in ickyarticle"));
	//	local txt = require 'ickipedia3';
	//	
	//	biginfo = true;
	//	articletext = txt[ickyarticleindex];
	//	ickypname = string.Format("po_{0}_m.tga",ickyportraits[ickyindex]);
	//	articlebox = OS.addscript("showarticle.lua");
	//	hidebio = true;
	//}

	public static void storecost()
	{
		GLOBAL.Player.progress["tkcost"] = true;
	}




	//Tracking Functions//
	public static void incexplored(int lvl)
	{
		//Debug.LogError("LuaFunctions.incexplored()");

		if (GLOBAL.Player.progress["lvlchks_" + lvl].b == false)
		{
			GLOBAL.Player.progress["lvlchks_" + lvl] = true;
			GLOBAL.Player.progress["explored"] = GLOBAL.Player.progress["explored"].i + 1;

			Debug.Log("New room visited. Explored: " + GLOBAL.Player.progress["explored"].i);

			// BChance: This function only gets called from 'Room.Start()'. Ensure the server is updated with the changes.
			GLOBAL.Instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
		}
	}

	public static void incplayercash(int cash)
	{
		GLOBAL.Player.progress["playercash"] = GLOBAL.Player.progress["playercash"] + cash;
		GLOBAL.Player.progress["earnedplayercash"] = GLOBAL.Player.progress["earnedplayercash"] + cash;
		GLOBAL.Player.progress["tkplayercash"] = true;
		GLOBAL.Player.progress["tkearnedplayercash"] = true;

		GLOBAL.Player.Log(string.Format
		(
			"Cash Increased: +${0}, Current Cash: ${1}", 
			cash, 
			GLOBAL.Player.progress["playercash"].i
		));
	}

	public static void decplayercash(int cash)
	{
		GLOBAL.Player.progress["playercash"] = GLOBAL.Player.progress["playercash"] - cash;
		GLOBAL.Player.progress["tkplayercash"] = true;

		GLOBAL.Player.Log(string.Format
		(
			"Cash Decreased: -${0}, Current Cash: ${1}", 
			cash, 
			GLOBAL.Player.progress["playercash"].i
		));
	}

	public static int purchase(int cost)
	{
		if (GLOBAL.Player.progress["playercash"] - cost < 0)
		{
			return 0;
		}
		decplayercash(cost);
		return 1;
	}

	public static void dropcash()
	{
		GLOBAL.Player.Log(string.Format
		(
			"Trash Dumped: {0}", 
			GLOBAL.Player.progress["trash"].i
		));

		GLOBAL.Player.progress["trashcash"] = GLOBAL.Player.progress["trashcash"] + GLOBAL.Player.progress["trash"];
		incplayercash(GLOBAL.Player.progress["trash"].i);
		GLOBAL.Player.progress["trash"] = 0;
		if (GLOBAL.Player.progress["trash1"] == true)
		{
			GLOBAL.Player.progress["trash1"] = null;
		}
		if (GLOBAL.Player.progress["trash2"] == true)
		{
			GLOBAL.Player.progress["trash2"] = null;
		}
	}	

	public static void incinterv()
	{
		GLOBAL.Player.progress["interviewed"] = GLOBAL.Player.progress["interviewed"] + 1;
	}

	public static void incsq()
	{
		GLOBAL.Player.progress["sidequests"] = GLOBAL.Player.progress["sidequests"] + 1;
		GLOBAL.Player.progress["tksidequests"] = true;
	}

	public static void incceostate()
	{
		GLOBAL.Player.progress["ceostate"] = GLOBAL.Player.progress["ceostate"] + 1;
	}

	public static void decceostate()
	{
		if (GLOBAL.Player.progress["ceostate"] >= 1)
		{
			GLOBAL.Player.progress["ceostate"] = GLOBAL.Player.progress["ceostate"] - 1;
		}
	}

	public static void storescore(string conversation, string scorestring)
	{
		//Debug.Log(string.Format("lcscoreconvo = {0}\n",GLOBAL.Player.progress["scoreconvo"].str));
		//Debug.Log(string.Format("lcscoreconvo = {0}\n",GLOBAL.Player.progress["scorestr"].str));
		if (   !string.IsNullOrEmpty(GLOBAL.Player.progress["scoreconvo"].str)
			&& !string.IsNullOrEmpty(GLOBAL.Player.progress["scorestr"].str))
		{
			GLOBAL.Player.progress["lcscoreconvo"] = GLOBAL.Player.progress["scoreconvo"];
			GLOBAL.Player.progress["scoreconvo"] = "";
			
			GLOBAL.Player.progress["lcscorestr"] = GLOBAL.Player.progress["scorestr"];
			GLOBAL.Player.progress["scorestr"] = "";
			
			GLOBAL.Player.progress["tksave"] = true;
			GLOBAL.Player.progress["tkscorestr"] = true;
		}
	}

	public static void storenlcscore(string conversation, string scorestring)
	{
		//Debug.Log(string.Format("nlcscoreconvo = {0}\n",GLOBAL.Player.progress["scoreconvo"].str));
		//Debug.Log(string.Format("nlcscoreconvo = {0}\n",GLOBAL.Player.progress["scorestr"].str));
		if (   !string.IsNullOrEmpty(GLOBAL.Player.progress["scoreconvo"].str)
			&& !string.IsNullOrEmpty(GLOBAL.Player.progress["scorestr"].str))
		{		
			GLOBAL.Player.progress["nlcscoreconvo"] = GLOBAL.Player.progress["scoreconvo"];
			GLOBAL.Player.progress["scoreconvo"] = "";
			
			GLOBAL.Player.progress["nlcscorestr"] = GLOBAL.Player.progress["scorestr"];
			GLOBAL.Player.progress["scorestr"] = "";
					
			GLOBAL.Player.progress["tksave"] = true;
			GLOBAL.Player.progress["tknlcscorestr"] = true;
		}	
	}

	public static void storemsq(string convo, string str)
	{
		GLOBAL.Player.progress["msqstr"] = GLOBAL.Player.progress["msqstr"] + str;
		GLOBAL.Player.progress["scoreconvo"] = convo;
		storenlcscore(convo, GLOBAL.Player.progress["msqstr"].str);
	}
	//End Tracking Functions//

	//OLD LADY//
	public static void incoldlady()
	{
		GLOBAL.Player.progress["old_lady"] = GLOBAL.Player.progress["old_lady"] +1;
	}

	public static void incol2()
	{
		GLOBAL.Player.progress["ol2"] = GLOBAL.Player.progress["ol2"] + 1;
	}

	public static void incol3()
	{
		GLOBAL.Player.progress["ol3"] = GLOBAL.Player.progress["ol3"] + 1;
	}

	public static void addboxofhotdogs()
	{
		GLOBAL.Player.progress["hotdogbox"] = true;
		//picksubgui(2);
	}

	public static void inchotdog()
	{
		if (GLOBAL.Player.progress["hotdog1"] == false)
		{
			GLOBAL.Player.progress["hotdog"] = GLOBAL.Player.progress["hotdog"] + 1;
			if (GLOBAL.Player.progress["ol3"] != 3)
			{
				decplayercash(GLOBAL.Player.progress["hotdogprice"].i);
			}
			GLOBAL.Player.progress["hotdog1"] = true;

			GLOBAL.Player.Log(string.Format
			(
				"Recieved Hotdog: 'hotdog1'"
			));
		}
		else if (GLOBAL.Player.progress["hotdog2"] == false)
		{
			GLOBAL.Player.progress["hotdog"] = GLOBAL.Player.progress["hotdog"] + 1;
			if (GLOBAL.Player.progress["ol3"] != 3)
			{
				decplayercash(GLOBAL.Player.progress["hotdogprice"].i);
			}
			GLOBAL.Player.progress["hotdog2"] = true;

			GLOBAL.Player.Log(string.Format
			(
				"Recieved Hotdog: 'hotdog2'"
			));
		}
		else if (GLOBAL.Player.progress["hotdog3"] == false)
		{
			GLOBAL.Player.progress["hotdog"] = GLOBAL.Player.progress["hotdog"] + 1;
			if (GLOBAL.Player.progress["ol3"] != 3)
			{
				decplayercash(GLOBAL.Player.progress["hotdogprice"].i);
			}
			GLOBAL.Player.progress["hotdog3"] = true;

			GLOBAL.Player.Log(string.Format
			(
				"Recieved Hotdog: 'hotdog3'"
			));
		}
		//picksubgui(2);
	}

	//Bingo//
	public static void bingoto1()
	{
		GLOBAL.Player.progress["bingo"] = 1;
	}
	public static void bingoto2()
	{
		GLOBAL.Player.progress["bingo"] = 2;
	}
	public static void bingoto3()
	{
		GLOBAL.Player.progress["bingo"] = 3;
	}
	//Organ Grinder//
	public static void organto1()
	{
	    GLOBAL.Player.progress["organ"] = 1;
	}

	public static void organto2()
	{
	    GLOBAL.Player.progress["organ"] = 2;
	}

	public static void organto3()
	{
	    GLOBAL.Player.progress["organ"] = 3;
	}
	//Sheriff Sam Shortback//
	public static void incedt()
	{
		GLOBAL.Player.progress["edt"] = GLOBAL.Player.progress["edt"] + 1;
	}

	//Mickey Jones//
	public static void incmickey()
	{
		GLOBAL.Player.progress["mickey"] = GLOBAL.Player.progress["mickey"] + 1;
	}
	public static void mickeyto2()
	{
		GLOBAL.Player.progress["mickey"] = 2;
	}
	public static void mickeyto3()
	{
		GLOBAL.Player.progress["mickey"] = 3;
	}
	public static void incmickeycost()
	{
		GLOBAL.Player.progress["mickeycost"] = GLOBAL.Player.progress["mickeycost"] + GLOBAL.Player.progress["mickeyinc"];
	}
	public static void mickeytext()
	{
		if (GLOBAL.Player.progress["week"] == 2)
		{
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["roll"] = "entertainment";
				GLOBAL.Player.progress["event"] = "MC";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["roll"] = "Marketing";
				GLOBAL.Player.progress["event"] = "raffle vendor";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["roll"] = "logistics";
				GLOBAL.Player.progress["event"] = "fleet of port-o-potties";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["roll"] = "amusements and refreshments";
				GLOBAL.Player.progress["event"] = "fireworks display";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				GLOBAL.Player.progress["roll"] = "sound system vendors";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				GLOBAL.Player.progress["roll"] = "merchandise vendors";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				GLOBAL.Player.progress["roll"] = "emergency medical staff";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				GLOBAL.Player.progress["roll"] = "refreshments vendors";
			}
		}
	}
	public static void mickeydeductcash()
	{
		decplayercash(GLOBAL.Player.progress["mickeycost"].i);
	}
	//Suzie Sparkler//
	public static void suzieto1()
	{
		GLOBAL.Player.progress["suzie"] = 1;
	}
	public static void suzieto2()
	{
		GLOBAL.Player.progress["suzie"] = 2;
	}
	public static void suzieto3()
	{
		GLOBAL.Player.progress["suzie"] = 3;
	}
	//Tour Guide//
	public static void calctourcash()
	{
		GLOBAL.Player.progress["tourcash"] = GLOBAL.Player.progress["touristscore"] * 10; //Xaos
		incplayercash(GLOBAL.Player.progress["tourcash"].i);
	}

	public static void addtouristscore()
	{
		GLOBAL.Player.progress["touristscore"] = GLOBAL.Player.progress["touristscore"] + 1;
	}
	public static void tourguideto1()
	{
		GLOBAL.Player.progress["tourguide"] = 1;
	}
	public static void tourguideto2()
	{
		GLOBAL.Player.progress["tourguide"] = 2;
	}
	public static void tourguideto3()
	{
		GLOBAL.Player.progress["tourguide"] = 3;
	}
	//Weekly Theme Question//
	public static void addwtqscore()
	{
		GLOBAL.Player.progress["wtqscore"] = GLOBAL.Player.progress["wtqscore"] + 1;
	}
	public static void incwtq()
	{
		GLOBAL.Player.progress["wtq"] = GLOBAL.Player.progress["wtq"] + 1;
	}
	//Math Quest
	public static void addmqscore()
	{
		GLOBAL.Player.progress["mqscore"] = GLOBAL.Player.progress["mqscore"] + 1;
	}
	public static void addmathcash()
	{
		incplayercash(GLOBAL.Player.progress["mqscore"].i * 10);
		if (GLOBAL.Player.progress["mqscore"] == 0)
		{
			incplayercash(5);
		}
		if (GLOBAL.Player.progress["mqscore"] == 4)
		{
			incplayercash(10);
		}
	} 
	//Flora "Suzie" Sharpe//
	public static void incresult()
	{
		GLOBAL.Player.progress["mathresult"] = GLOBAL.Player.progress["mathresult"] + 1;
	}
	public static void incmath()
	{
		GLOBAL.Player.progress["mathtest"] = GLOBAL.Player.progress["mathtest"] + 1;
	}
	//Keester McClain aka Carpenter//
	public static void keesterto1()
	{
		GLOBAL.Player.progress["keester"] = 1;
	}
	public static void keesterto2()
	{
		GLOBAL.Player.progress["keester"] = 2;
	}
	public static void keesterto3()
	{
		GLOBAL.Player.progress["keester"] = 3;
	}
	//United Way aka Bless//
	public static void adduwayscore()
	{
		GLOBAL.Player.progress["uwayscore"] = GLOBAL.Player.progress["uwayscore"] + 1;
	}
	public static void incuway()
	{
		GLOBAL.Player.progress["uway"] = GLOBAL.Player.progress["uway"] + 1;
	}
	//Week 4 Ticket Vendors//
	public static void incticket()
	{
		GLOBAL.Player.progress["ticket"] = GLOBAL.Player.progress["ticket"] + 1;
		decplayercash(GLOBAL.Player.progress["ticketprice"].i);
	}
	//Generic variable decrementing//
	public static void decvars(string key)
	{
		GLOBAL.Player.progress[key] = GLOBAL.Player.progress[key] - 1;
	}
	//Snakebite Sam//
	public static void ettto5()
	{
		GLOBAL.Player.progress["ett"] = 5;
	}
	public static void ettfailed()
	{
		GLOBAL.Player.progress["etttrap"] = 1; 
	}
	public static void olett()
	{
		GLOBAL.Player.progress["oletttrap"] = 1;
		decplayercash(50);
	}	
	//Franco Manducci//
	public static void francodeduct()
	{
		decplayercash(50);
	}

	public static void takebook()
	{
		for (int i = 1; i <= 3; ++i)
		{
			string str1 = string.Format("w{0}",i);
			for (int j = 1; j <= 16; ++j)
			{
				string str2 = string.Format("b{0}",j);
				GLOBAL.Player.progress[str1 + str2] = null;
			}
		}

		GLOBAL.Player.Log(string.Format
		(
			"All Books Returned to the Library"
		));
	}

	public static void givebook(string arg)
	{
		takebook();
		GLOBAL.Player.progress[arg] = true;

		GLOBAL.Player.Log(string.Format
		(
			"Borrowed Book from the Library: '{0}'",
			arg
		));

		// BChance: Flag that we want to inspect the book as soon as possible.
		UI_Inventory.inspect_item_key = arg;
	}


	public static void buycrier()
	{
		GLOBAL.Player.progress[string.Format("w{0}crier", GLOBAL.Player.progress["week"])] = true;
		decplayercash(1);
		//picksubguilater(2);
	}

	public static void buyexaminer()
	{
		GLOBAL.Player.progress[string.Format("w{0}examiner", GLOBAL.Player.progress["week"])] = true;
		decplayercash(1);
		//picksubguilater(2);
	}

	public static void buytoday()
	{
		GLOBAL.Player.progress[string.Format("w{0}today", GLOBAL.Player.progress["week"])] = true;
		decplayercash(1);
		//picksubguilater(2);
	}

	public static void buymickeyclothes(int price)
	{
		buyoutfit(price,"foutfit31",null,31);
	}

	public static void buyoutfit(int arg, string gvar, string mb, int arg2)
	{
		if (GLOBAL.Player.progress[gvar] == 1)
		{
			return;
		}
		if (purchase(arg) == 0)
		{
			return;
		}
		
		//picksubguilater(2);
		GLOBAL.Player.progress[gvar] = 1;
		
		//curoutfit = arg2;
	}





	// ==
	// == Following functions taken from /application/lualib.lua ==
	// ==

	public static void appendscore(string str)
	{
		GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + str;
	}

	public static void flagvendorinfo(int arg)
	{
		if (arg == 1)
		{
			GLOBAL.Player.progress["va"] = 1;
		}
		else if (arg == 2)
		{
			GLOBAL.Player.progress["vb"] = 1;
		}
		else if (arg == 3)
		{
			GLOBAL.Player.progress["vc"] = 1;
		}
		else if (arg == 4)
		{
			GLOBAL.Player.progress["vd"] = 1;
		}

		// BChance: Compose and flag the v_advice flag for this week and vendor.
		int week = GLOBAL.Player.progress["week"].i;
		string v_advice = string.Format("w{0}v{1}_advice", week, arg);
		GLOBAL.Player.progress[v_advice] = true;
	}

	public static void vendorinfoscore()
	{
		if (GLOBAL.Player.progress["va"] == 1)
		{
			//appendscore("c")
			GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "c";
		}
		if (GLOBAL.Player.progress["vb"] == 1)
		{
			//appendscore("d")
			GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "d";
		}
		if (GLOBAL.Player.progress["vc"] == 1)
		{
			//appendscore("e")
			GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "e";
		}
		if (GLOBAL.Player.progress["vd"] == 1)
		{
			//appendscore("f")
			GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "f";
		}
	}

	public static void willclothingscore3(string x, string y)
	{
		if (GLOBAL.Player.progress["silentscore"] == 0)
		{
			if (GLOBAL.Player.progress["clothingscore"] > 0)
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + x;
			}
			else
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + y;
			}
			GLOBAL.Player.progress["silentscore"] = 1;
		}
	}

	public static void willclothingscore()
	{
		if (GLOBAL.Player.progress["silentscore"] == 0)
		{
			if (GLOBAL.Player.progress["clothingscore"] > 0)
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "c";
			}
			else
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "d";
			}
			GLOBAL.Player.progress["silentscore"] = 1;
		}
	}
	
	public static void willclothingscore2()
	{
		if (GLOBAL.Player.progress["silentscore"] == 0)
		{
			if (GLOBAL.Player.progress["clothingscore"] > 0)
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "a";
			}
			else
			{
				GLOBAL.Player.progress["scorestr"] = GLOBAL.Player.progress["scorestr"].str + "b";
			}
			GLOBAL.Player.progress["silentscore"] = 1;
		}
	}
}




