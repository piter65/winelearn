using UnityEngine;
using UnityEngine.SceneManagement; 
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine.UI;

public class DialogueState : MonoBehaviour
{
	public int week = 1;
	public int tourguide = 0;
	public int touristscore = 0;
	public int tourcash = 0;
	public int playnum =1;
	//NPC heather values
	public int expertprogress=0;
	public int rnddialog = 0;
	//NPC evelynprogress
	public int evelynprogress=0;
	public int ceoprogress = 0;

	public int standonprogress = 0;
	public int outcome = 0;
	public int player = 1;

	//internet cafe websterDweeb
	public int mickey= 0;
	//Library
	public int mathtest= 0;
	//Joy_cramarossa 
	public int l1w1progress = 0;
	public int random = 0;

	//w2vendor
	public int w2vendor;
	public int vendor= 1;

	public int vendor2progress= 0;
	public int vendor1progress=0;
	public int pilotstage=0;    // peter was here

	//Tie-Dyed loft ....... Charlie_fogg & Damian_maytal
	public int edt = 0;
	public int msq1 = 0;
	public int msq2 = 0;
	public int msq3 = 0;
	public int msq4 = 0;
	public int msqprogress = 0;
	public int l1rprogress = 0;


	public static Dictionary<string,MultiType> dictStates = new Dictionary<string,MultiType>();
	
	private static bool _bInitialized = false;
	public static bool IsInitialized
	{
		get { return _bInitialized; }
	}

	public static bool isAddedDictionary;

	public int setvar = 0;

	void Awake()
	{

		if (!_bInitialized)
		{
			if(isAddedDictionary == false)
			{
				Debug.Log("-----------------Initialze dictionary---------------");
				// Store the state values in a publicly available dictionary.
					dictStates.Add("week", week);
					dictStates.Add("playnum", playnum);

					dictStates.Add("tourguide", tourguide);
					dictStates.Add("touristscore", touristscore);
					dictStates.Add("tourcash", tourcash);
					dictStates.Add("player", player);
//					dictStates.Add("setvar", setvar);
				/******** stan freeman **********************************************/
					dictStates.Add("ceoprogress", ceoprogress);
					dictStates.Add("rnddialog", rnddialog);
				/******** store the state values of Heather_Winehart ************************************/
					dictStates.Add("expertprogress", expertprogress);
				/******** store the state values of evelyn **********************************************/
					dictStates.Add("evelynprogress", evelynprogress);

				/******* store the state values of will standon **********************************************/
					dictStates.Add("standonprogress", standonprogress);
					dictStates.Add("outcome", outcome);

				/******* internet cafe Webster_Dweeb & peter_boltright **********************************************/
					dictStates.Add("mickey", mickey);
					dictStates.Add("l1w1progress", l1w1progress);
					dictStates.Add("w2vendor", w2vendor);
					dictStates.Add("mathtest", mathtest);
					dictStates.Add("vendor2progress", vendor2progress);
				/*******Tie-Dyed loft ....... Charlie_fogg & Damian_maytal **********************************************/
					dictStates.Add("vendor1progress", vendor1progress);

					dictStates.Add("pilotstage", pilotstage);  // peter was here

				/*** eco - tech  scene , npc Damian_maytal *******************************/
					dictStates.Add("vendor", vendor);





					dictStates.Add("edt", edt);
					dictStates.Add("msq1", msq1);
					dictStates.Add("msq2", msq2);
					dictStates.Add("msq3", msq3);
					dictStates.Add("msq4", msq4);
					dictStates.Add("l1rprogress", l1rprogress);
					dictStates.Add("msqprogress", msqprogress);





				//


				isAddedDictionary = true;
			}

			_bInitialized = true;
		}
		
		// Now that we've initialized, we don't need to keep the DialogueState object around.
		Destroy(gameObject);
	}
	
	public static void Init()
	{
		// Only load the dialogue_state scene to initialize.
		if (!_bInitialized)
		{
			Debug.Log("-----------------DialogueState initialze-----------------");
			SceneManager.LoadScene("dialogue_state", LoadSceneMode.Additive);
		}
	}

	//public static void lua_setvar(DiaEntry_Function func)
	//{
	//	if (dictStates.ContainsKey(func.targetKey))
	//	{
	//		dictStates[func.targetKey] = func.value;
	//		//dictStates[func.targetKey] = (int)(func.value);
	//	}
	//	else
	//	{
	//		Debug.LogError("!!! ERROR - DialogueState.lua_setvar - No state found with key of '" + func.targetKey + "'.");
	//	}
	//}
//
	//public static void lua_incvars(DiaEntry_Function func)
	//{
	//	if (dictStates.ContainsKey(func.targetKey))
	//	{
	//		if (dictStates[func.targetKey].IsInt)
	//		{
	//			dictStates[func.targetKey] = dictStates[func.targetKey].i + 1;
	//		}
	//		else
	//		{
	//			Debug.LogError("!!! ERROR - DialogueState.lua_incvars - State '" + func.targetKey + "' is not a number and cannot be incremented.");
	//		}
	//	}
	//	else
	//	{
	//		Debug.LogError("!!! ERROR - DialogueState.lua_incvars - No state found with key of '" + func.targetKey + "'.");
	//	}
	//}
//
	//public static void lua_incstandon(DiaEntry_Function func)
	//{
	//	if (dictStates.ContainsKey("standonprogress"))
	//	{
	//		if (dictStates["standonprogress"].IsInt)
	//		{
	//			dictStates["standonprogress"] = dictStates["standonprogress"].i + 1;
	//		}
	//		else
	//		{
	//			Debug.LogError("!!! ERROR - DialogueState.lua_incstandon - State 'standonprogress' is not a number and cannot be incremented.");
	//		}
	//	}
	//	else
	//	{
	//		Debug.LogError("!!! ERROR - DialogueState.lua_incstandon - No state found with key of 'standonprogress'.");
	//	}
	//}
//
	//public static void lua_incexpert(DiaEntry_Function func)
	//{
	//	if (dictStates.ContainsKey("expertprogress"))
	//	{
	//		if (dictStates["expertprogress"].IsInt)
	//		{
	//			dictStates["expertprogress"] = dictStates["expertprogress"].i + 1;
	//		}
	//		else
	//		{
	//			Debug.LogError("!!! ERROR - DialogueState.lua_incexpert - State 'expertprogress' is not a number and cannot be incremented.");
	//		}
	//	}
	//	else
	//	{
	//		Debug.LogError("!!! ERROR - DialogueState.lua_incexpert - No state found with key of 'expertprogress'.");
	//	}
	//}
//
	//public static void lua_incvendor2(DiaEntry_Function func)
	//{
	//	if (dictStates.ContainsKey("vendor2progress"))
	//	{
	//		if (dictStates["vendor2progress"].IsInt)
	//		{
	//			dictStates["vendor2progress"] = dictStates["vendor2progress"].i + 1;
	//		}
	//		else
	//		{
	//			Debug.LogError("!!! ERROR - DialogueState.lua_incvendor2 - State 'vendor2progress' is not a number and cannot be incremented.");
	//		}
	//	}
	//	else
	//	{
	//		Debug.LogError("!!! ERROR - DialogueState.lua_incvendor2 - No state found with key of 'vendor2progress'.");
	//	}
	//}
}
