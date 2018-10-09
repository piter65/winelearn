using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

public class GLOBAL : MonoBehaviour
{
	public AudioClip clip_doormat;

	private static GLOBAL _instance;

	public static GLOBAL Instance { get { return _instance; } }

	private static bool _initialized = false;
	private static AudioSource _audio_source;

	public static PlayerData Player;
	public static Multiplayer_Entity player_entity;
	public static string target_spawn = null;
	public static UnityStandardAssets.Cameras.OrbitCam OrbitCam;
	public static bool debug_show_progress = false;
	public static List<InputField> lst_disable_hotkeys_on_focus = new List<InputField>();
	public static List<TMP_InputField> lst_disable_hotkeys_on_focus_tmp = new List<TMP_InputField>();

	public static float idle_time = 0.0f;


	public static bool debug_run = false;
	public static bool debug_room = false;


	public static void ResetIdleTimer()
	{
		idle_time = 0.0f;
	}

	public static bool IsPlayerIdle
	{
		get
		{
			return 
				   // The player is idle if we're not in a game scene.
				   OrbitCam == null
				|| idle_time >= CONFIG.TIME_UNTIL_IDLE;
		}
	}

	private static void TrackIdling()
	{
		// Make sure we're in a game scene.
		if (OrbitCam != null)
		{
			idle_time += Time.deltaTime;
		}
	}

	public static bool HotkeysEnabled
	{
		get
		{
			// Loop thru the disable hotkeys list and say hotkeys 
			//   are disabled if any of them have focus.
			foreach (InputField input in lst_disable_hotkeys_on_focus)
			{
				if (input.isFocused)
					return false;
			}
			foreach (TMP_InputField input in lst_disable_hotkeys_on_focus_tmp)
			{
				if (input.isFocused)
					return false;
			}

			return true;
		}
	}

	public static string GetUrl_Assets(string url_end)
	{
		#if UNITY_EDITOR
			return "file:///" + Application.dataPath + "/../../spillgame.us/game/" + url_end;
		#else
			return Application.dataPath + "/../" + url_end;
		#endif

		//return CONFIG.URL_ASSETS + url_end;
	}

	public static string GetUrl_Game(string url_end)
	{
		return CONFIG.URL_GAME + url_end;
	}

	public static string GetUrl_Multiplayer(string url_end)
	{
		return CONFIG.URL_MULTIPLAYER + url_end;
	}

	public static string GetUrl_Database(string url_end)
	{
		return CONFIG.URL_DATABASE + url_end;
	}

	public static string GetUrl_Benchmark(string url_end)
	{
		#if UNITY_EDITOR
			return CONFIG.URL_BENCHMARK + url_end;
		#else
			return Application.dataPath + "/../../benchmark/" + url_end;
		#endif
	}


	public static int JSize(int week)
	{
		if (   GLOBAL.Player == null
			|| GLOBAL.Player.progress["journal_notes_" + week].str == null)
			return 0;
		else
			return GLOBAL.Player.progress["journal_notes_" + week].str.Length;
	}

	public static void VStatsLog(string infostring)
	{
		// This will be a generic hi-info log info - peter was here
		GLOBAL.Player.Log
		(
			infostring +
			"  VStats:" +

			"  wk: " + GLOBAL.Player.progress["week"].ToString() +
			"  jrnprg: " + GLOBAL.Player.progress["journalprogress"].ToString() +
			"  jrnsz_1: " + GLOBAL.JSize(1).ToString() +
			"  jrnsz_2: " + GLOBAL.JSize(2).ToString() +
			"  jrnsz_3: " + GLOBAL.JSize(3).ToString() +
			"  jrnstate: " + (UI_Journal.IsOpen() ? "Open" : "Closed") +

			// BChance: Wrap the values in quotes if they're actually strings. Don't wrap otherwise.
			"  wk_set: " + (GLOBAL.Player.progress["php_week_isset"].IsString ? ("'" + GLOBAL.Player.progress["php_week_isset"].str + "'") : GLOBAL.Player.progress["php_week_isset"].str) +
			"  wk_no_eq: " + (GLOBAL.Player.progress["php_week_not_equal"].IsString ? "'" + GLOBAL.Player.progress["php_week_not_equal"].str + "'" : GLOBAL.Player.progress["php_week_not_equal"].str) +
			"  wk_data: " + (GLOBAL.Player.progress["php_week_data"].IsString ? "'" + GLOBAL.Player.progress["php_week_data"].str + "'" : GLOBAL.Player.progress["php_week_data"].str) +
			"  wk_db: " + (GLOBAL.Player.progress["php_week_db"].IsString ? "'" + GLOBAL.Player.progress["php_week_db"].str + "'" : GLOBAL.Player.progress["php_week_db"].str) +
			"  dta_len: " + (GLOBAL.Player.progress["php_data_length"].IsString ? "'" + GLOBAL.Player.progress["php_data_length"].str + "'" : GLOBAL.Player.progress["php_data_length"].str) +

			" !"
		);

	}


	public static void QuitGame()
	{
		// Don't allow quitting the game while dialogue is open.
		if (!DialogueOverlay.is_open)
		{
			Debug.Log("==QuitGame()==");

			VStatsLog("Pre-Quit:"); // Peter added this to log stats on exit

			if (!string.IsNullOrEmpty(GLOBAL.Player.password))
				_instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress(true, QuitGame_DataSaved, QuitGame_DataSaved));
			else
				ClearAssetsAndResetGame();
		}
	}

	private static void QuitGame_DataSaved(PlayerData data)
	{
		ClearAssetsAndResetGame();
	}

	private static void ClearAssetsAndResetGame()
	{
		Debug.Log("==ClearAssetsAndResetGame()==");

		GLOBAL.Player.Log("Logged out-going to Landing Screen");

		VStatsLog("Logout#2");  // vital stats

		Debug.Log("-- Clearing trash spawner...");

		Trash_Spawner.ClearStaticFields();

		Debug.Log("-- Trash spawner cleared.");

		Debug.Log("-- Loading scene LandingScreen...");

		// Return to the Landing Screen.
		SceneManager.LoadScene("LandingScreen");

		Debug.Log("-- Scene Landing Screen Loaded.");
	}

	private static void Debug_JumpToNegotiations()
	{
		if (Player.progress["week"].i == 1)
		{
			Player.progress["w1vendor"]        = 3;
			Player.progress["silentscore"]     = 1;
			Player.progress["tm_3_w1cost"]     = 7760;
			Player.progress["tm_3_w2cost"]     = 17900;
			Player.progress["tm_4_w1cost"]     = 7760;
			Player.progress["tm_4_w2cost"]     = 17900;
			Player.progress["tm_5_w1cost"]     = 7760;
			Player.progress["tm_5_w2cost"]     = 17900;
			Player.progress["tm_6_w1cost"]     = 7760;
			Player.progress["tm_6_w2cost"]     = 17900;
			Player.progress["teamtotalcost"]   = 102640;
			Player.progress["outcome"]         = 1;
			Player.progress["lastvendor"]      = 3;
			Player.progress["journalprogress"] = 7;
			Player.progress["cost"]            = 4440;
			Player.progress["vendorsvisited"]  = 4;
			Player.progress["vendor"]          = 3;
			Player.progress["vendorx"]         = "Bjorn Egan";
			Player.progress["evelynprogress"]  = 7;
			Player.progress["standonprogress"] = 7;
			Player.progress["expertprogress"]  = 2;
			Player.progress["mayorprogress"]   = 2;
			Player.progress["vendor1progress"] = 5;
			Player.progress["vendor2progress"] = 5;
			Player.progress["vendor3progress"] = 5;
			Player.progress["vendor4progress"] = 5;
			Player.progress["talked_vendor1"]  = 1;
			Player.progress["talked_vendor2"]  = 1;
			Player.progress["talked_vendor3"]  = 1;
			Player.progress["talked_vendor4"]  = 1;
			Player.progress["talked_mayor"]    = 1;
			Player.progress["talked_will"]     = 1;
			Player.progress["talked_expert"]   = 1;
			Player.progress["talked_evelyn"]   = 1;
			Player.progress["startingcost"]    = 4000;
			Player.progress["initexp"]         = 4000;
			Player.progress["curexp"]          = 4000;
			Player.progress["profit"]          = 11;
			Player.progress["exp"]             = 4000;
			Player.progress["interviewed"]     = 4;
			Player.progress["tourguide"]       = 1;
			Player.progress["ett"]             = 1;
			Player.progress["etttrap"]         = 1;
			Player.progress["msq1"]            = 1;
			Player.progress["wutrap"]          = 2;
			Player.progress["va"]              = 0;
			Player.progress["vb"]              = 1;
			Player.progress["vc"]              = 0;
			Player.progress["vd"]              = 1;
			Player.progress["tksave"]          = true;
			Player.progress["tkscorestr"]      = true;
			Player.progress["tkvendor"]        = true;
			Player.progress["min"]             = 3540;
			Player.progress["max"]             = 7760;
			Player.progress["tkvendorx"]       = true;
			Player.progress["tkinterviewed"]   = true;

			UI_Instruction.Notify("Progress Jumped to Week 1 Negotiations");
		}
	}

	private static void Debug_JumpToVendorInterviews()
	{
		if (Player.progress["week"].i == 2)
		{
			Player.progress["tm_3_w1cost"] = 7760;
			Player.progress["tm_3_w2cost"] = 17900;
			Player.progress["tm_4_w1cost"] = 7760;
			Player.progress["tm_4_w2cost"] = 17900;
			Player.progress["tm_5_w1cost"] = 7760;
			Player.progress["tm_5_w2cost"] = 17900;
			Player.progress["tm_6_w1cost"] = 7760;
			Player.progress["tm_6_w2cost"] = 17900;
			Player.progress["teamtotalcost"] = 102640;
			Player.progress["outcome"] = 1;
			Player.progress["lastvendor"] = 4;
			Player.progress["journalprogress"] = 4;
			Player.progress["evelynprogress"] = 4;
			Player.progress["standonprogress"] = 2;
			Player.progress["expertprogress"] = 2;
			Player.progress["vendor1progress"] = 1;
			Player.progress["vendor2progress"] = 1;
			Player.progress["vendor3progress"] = 1;
			Player.progress["vendor4progress"] = 1;
			Player.progress["talked_will"] = 1;
			Player.progress["talked_expert"] = 1;
			Player.progress["talked_evelyn"] = 1;
			Player.progress["profit"] = 35;
			Player.progress["tourguide"] = 1;
			Player.progress["msqprogress"] = 1;
			Player.progress["va"] = 1;
			Player.progress["vb"] = 1;
			Player.progress["vc"] = 1;
			Player.progress["vd"] = 1;
			Player.progress["tkplayercash"] = true;
			Player.progress["tkearnedplayercash"] = true;
			Player.progress["tksave"] = true;
			Player.progress["tkscorestr"] = true;

			UI_Instruction.Notify("Progress Jumped to Week 2 Vendor Interviews");
		}
		else if (Player.progress["week"].i == 3)
		{
			Player.progress["earnedplayercash"] = 50;
			Player.progress["playercash"] = 75;
			Player.progress["tm_3_w1cost"] = 7760;
			Player.progress["tm_3_w2cost"] = 17900;
			Player.progress["tm_4_w1cost"] = 7760;
			Player.progress["tm_4_w2cost"] = 17900;
			Player.progress["tm_5_w1cost"] = 7760;
			Player.progress["tm_5_w2cost"] = 17900;
			Player.progress["tm_6_w1cost"] = 7760;
			Player.progress["tm_6_w2cost"] = 17900;
			Player.progress["teamtotalcost"] = 102640;
			Player.progress["outcome"] = 1;
			Player.progress["journalprogress"] = 4;
			Player.progress["evelynprogress"] = 3;
			Player.progress["standonprogress"] = 3;
			Player.progress["talked_expert"] = 1;
			Player.progress["l1w1progress"] = 1;
			Player.progress["l1w2progress"] = 1;
			Player.progress["l1rprogress"] = 1;
			Player.progress["sheriffprogress"] = 2;
			Player.progress["tourguide"] = 1;
			Player.progress["msqprogress"] = 1;
			Player.progress["wutrap"] = 2;
			Player.progress["tkplayercash"] = true;
			Player.progress["tkearnedplayercash"] = true;

			UI_Instruction.Notify("Progress Jumped to Week 3 Investigation");
		}
	}


	void Awake()
	{
		_instance = this;

		_audio_source = GetComponent<AudioSource>();

		if (Player == null)
		{
			Player = new PlayerData();

			#if UNITY_EDITOR
				// Set a test player username if we don't already have one.
				Player.username = "player_test_0";
			#else
				// Generate a temporary player username if we don't already have one.
				System.Random rand = new System.Random();
				Player.username = "player_test_" + rand.Next(1, 100000).ToString();
			#endif

			Player.group = "group_8";

			Default_PlayerProgressData(Player);

			//StartCoroutine(Player.Web_GetPlayerData_All());
		}
	}

	void Update()
	{
		// Don't interact with 3D objects while dialogue is open.
		if (!DialogueOverlay.is_open)
		{
			if (GLOBAL.IsLeftMouseDown())
			{
				if (Camera.main != null)
				{
					Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
					RaycastHit[] hits = Physics.RaycastAll(ray);

					// Loop thru the hits and try to find one with 'enter_' or 'exit_' prefix.
					foreach (RaycastHit hit in hits)
					{
						//Debug.LogError("=== Hit '" + hit.transform.name + "' ===");

						string hit_name = hit.transform.name.ToLower();

						string target_scene_name = null;

						if (hit_name.StartsWith("enter_"))
						{
							target_scene_name = hit_name.Substring(6);
							Debug.Log(String.Format("target_scene_name: '{0}'", target_scene_name));
						}
						else if (hit_name.StartsWith("exit_"))
						{
							target_scene_name = hit_name.Substring(5);
							Debug.Log(String.Format("target_scene_name: '{0}'", target_scene_name));
						}
						
						if (!String.IsNullOrEmpty(target_scene_name))
						{
							Debug.Log("=== Hit doormat '" + hit.transform.name + "' ===");

							if (Vector3.Distance(hit.transform.position, player_entity.transform.position) < 10.0f)
							{
								Newmat doormat = hit.transform.GetComponent<Newmat>();

								if (doormat != null)
								{
									// Flag the target spawn name.
									target_spawn = doormat.target_spawn;
								}

								_audio_source.clip = clip_doormat;
								_audio_source.Play();

								SceneManager.LoadScene(target_scene_name);
							}

							return;
						}

						// Handle clicking on a NPC.
						if (hit.transform.tag == "npc")
						{
							// Ensure we're not clicking on an NPC out in the ether.
							if (Vector3.Distance(hit.transform.position, player_entity.transform.position) <= 5.0f)
							{
								Debug.Log("Clicked on " + hit.transform.name);

								// Ensure we don't have an active dialogue.
								if (GameObject.Find("DialogueOverlay") == null)
								{
									npc_Base npc_Script = hit.transform.GetComponent<npc_Base>();

									if (npc_Script != null)
									{
										npc_Script.StartDialogue();

										return;
									}
									else
									{
										Debug.LogError("No 'npc_script' found on character.");
									}
								}
							}
						}
						// Handle clicking on an interactable object.
						else if (hit.transform.tag == "interactable")
						{
							// Ensure we're not clicking on an object out in the ether.
							if (Vector3.Distance(hit.transform.position, player_entity.transform.position) <= 5.0f)
							{
								Debug.Log("Clicked on " + hit.transform.name);

								// Ensure we don't have an active dialogue.
								if (GameObject.Find("DialogueOverlay") == null)
								{
									interactable interactable = hit.transform.GetComponent<interactable>();

									if (interactable != null)
									{
										interactable.Interact();

										return;
									}
									else
									{
										Debug.LogError("No 'interactable' found on object.");
									}
								}
							}
						}
					}
				}
			}

			#if UNITY_EDITOR

				if (Input.GetButton("Alt"))
				{
					if (   Input.GetKey(KeyCode.Keypad5)
						|| Input.GetKey(KeyCode.Alpha5))
					{
						// Alt + 5 triggers the debug progress field report.
						debug_show_progress = true;
					}
					if (   Input.GetKey(KeyCode.Keypad4)
						|| Input.GetKey(KeyCode.Alpha4))
					{
						// Alt + 4 jumps the progress to the vendor negotiation phase.
						Debug_JumpToNegotiations();
					}
					if (   Input.GetKey(KeyCode.Keypad3)
						|| Input.GetKey(KeyCode.Alpha3))
					{
						// Alt + 3 jumps the progress to the vendor interviews phase.
						Debug_JumpToVendorInterviews();
					}
					if (Input.GetKey(KeyCode.L))
					{
						// Alt+L logs the player data to the console.
						Player.LogPlayerData();
					}
					if (Input.GetKey(KeyCode.F7))
					{
						// BChance: Shortcut to aquire clothes for testing.
						if (Player.progress["isMale"].b)
						{
							Player.progress["moutfit8"]  = true;
							Player.progress["moutfit17"] = true;
							Player.progress["moutfit18"] = true;
							Player.progress["moutfit23"] = true;
							Player.progress["moutfit27"] = true;
						}
						else
						{
							Player.progress["foutfit3"]  = true;
							Player.progress["foutfit11"] = true;
							Player.progress["foutfit13"] = true;
							Player.progress["foutfit21"] = true;
							Player.progress["foutfit22"] = true;
						}

						RefreshUIBasedOnProgress();
					}
				}

			#else

				if (Input.GetButton("Alt"))
				{
					if (Input.GetButton("Shift"))
					{
						if (   Input.GetKey(KeyCode.Keypad0)
							|| Input.GetKey(KeyCode.Alpha0))
						{
							if (   Input.GetKey(KeyCode.Keypad5)
								|| Input.GetKey(KeyCode.Alpha5))
							{
								// Shift + Alt + 0 + 5 triggers the debug progress field report.
								debug_show_progress = true;
							}
							if (   Input.GetKey(KeyCode.Keypad4)
								|| Input.GetKey(KeyCode.Alpha4))
							{
								// Shift + Alt + 0 + 4 jumps the progress to the vendor negotiation phase.
								Debug_JumpToNegotiations();
							}
							if (   Input.GetKey(KeyCode.Keypad3)
								|| Input.GetKey(KeyCode.Alpha3))
							{
								// Shift + Alt + 0 + 3 jumps the progress to the vendor interviews phase.
								Debug_JumpToVendorInterviews();
							}

							
						}
					}
					if (Input.GetKey(KeyCode.L))
					{
						// Alt+L logs the player data to the console.
						Player.LogPlayerData();
					}
				}
				
			#endif

			// Update the progress report if it's visible.
			if (debug_show_progress)
			{
				UI_Debug_Progress.Open();
			}

			if (Input.GetButton("Alt"))
			{
				if (Input.GetKey(KeyCode.U))
				{
					if (Input.GetKey(KeyCode.J))
					{
						// Toggle the debug run flag if Alt + U + H is pressed.
						debug_run = !debug_run;
					}
				}
			}

			// Track the idling of the player.
			TrackIdling();

			// If there's any input or we're debug running, reset the idle timer.
			if (   Input.anyKey
				|| debug_run)
			{
				ResetIdleTimer();
			}

			// Track play time when we're not idling.
			if (!IsPlayerIdle)
			{
				Player.play_time += Time.deltaTime;
			}

			// Log the user out if they're idle for longer than the logout timeout.
			if (idle_time >= CONFIG.IDLE_LOGOUT_TIMEOUT)
			{
				GLOBAL.Player.Log("Idle Logout");
				QuitGame();
			}
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
		{
			_instance = null;
			_initialized = false;
			_audio_source = null;

			// Clear static fields.
			Player = null;
			player_entity = null;
			target_spawn = null;
			OrbitCam = null;
			debug_show_progress = false;
			lst_disable_hotkeys_on_focus.Clear();
			idle_time = 0.0f;
		}
	}





	void OnApplicationQuit()
	{
		Debug.Log("== APPLICATION QUITTING... ==");

		// Save player data. We must yield for it to work properly.
		StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress(true));

		if (GLOBAL.Player != null)
		{
			VStatsLog("App Quitting");
		}

		Debug.Log("== APPLICATION QUIT ==");
	}

	public static void Reset_WeeklyFields(PlayerData player)
	{
		// BChance: Taken from field 'weekchangevars' in '/application/globals.lua'.
		player.progress["journalprogress"]     = 1;
		player.progress["reneg"]               = 0;
		player.progress["cost"]                = 0;
		player.progress["vendorcost"]          = 0;
		player.progress["vendorsvisited"]      = 0;
		player.progress["contractcost"]        = 0;
		player.progress["vendor"]              = 0;
		player.progress["vendorx"]             = null;
		player.progress["evelynprogress"]      = 0;
		player.progress["standonprogress"]     = 0;
		player.progress["expertprogress"]      = 0;
		player.progress["mayorprogress"]       = 0;
		player.progress["vendor1progress"]     = 0;
		player.progress["vendor2progress"]     = 0;
		player.progress["vendor3progress"]     = 0;
		player.progress["vendor4progress"]     = 0;
		player.progress["ceoprogress"]         = 0;
		player.progress["talked_stan"]         = 0;
		player.progress["talked_vendor1"]      = 0;
		player.progress["talked_vendor2"]      = 0;
		player.progress["talked_vendor3"]      = 0;
		player.progress["talked_vendor4"]      = 0;
		player.progress["talked_mayor"]        = 0;
		player.progress["talked_will"]         = 0;
		player.progress["talked_expert"]       = 0;
		player.progress["talked_evelyn"]       = 0;
		player.progress["talked_tourguide"]    = 0;
		player.progress["startingcost"]        = 0;
		player.progress["failed"]              = 0;
		player.progress["l1"]                  = 0;
		player.progress["l2"]                  = 0;
		player.progress["l1w1progress"]        = 0;
		player.progress["l1w2progress"]        = 0;
		player.progress["l1rprogress"]         = 0;
		player.progress["l2w1progress"]        = 0;
		player.progress["l2w2progress"]        = 0;
		player.progress["l2rprogress"]         = 0;
		player.progress["sheriffprogress"]     = 0;
		player.progress["wp1progress"]         = 0;
		player.progress["wp2progress"]         = 0;
		player.progress["wp3progress"]         = 0;
		player.progress["wp4progress"]         = 0;
		player.progress["arrested"]            = 0;
		player.progress["spawnarrest"]         = 0;
		player.progress["arrestedvendor"]      = null;
		player.progress["arrest_ceo"]          = null;
		player.progress["arrest_sam"]          = null;
		player.progress["check"]               = 0;
		player.progress["l1w1obj"]             = 0;
		player.progress["l1w2obj"]             = 0;
		player.progress["l1robj"]              = 0;
		player.progress["l2w1obj"]             = 0;
		player.progress["l2w2obj"]             = 0;
		player.progress["l2robj"]              = 0;
		player.progress["initexp"]             = 0;
		player.progress["curexp"]              = 0;
		player.progress["profit"]              = 0;
		player.progress["stantrap"]            = 0;
		player.progress["exp"]                 = 0;
		player.progress["deal"]                = 0;
		player.progress["con1"]                = 0;
		player.progress["con2"]                = 0;
		player.progress["con3"]                = 0;
		player.progress["con4"]                = 0;
		player.progress["interviewed"]         = 0;
		player.progress["busicards"]           = 0;
		player.progress["lastweeksbusicards"]  = 0;
		player.progress["sidequests"]          = 0;
		player.progress["sVendInt"]            = 0;
		player.progress["jrnl_nlc"]            = 0;
		player.progress["jrnl_lc"]             = 0;
		player.progress["old_lady"]            = 0;
		player.progress["ol2"]                 = 0;
		player.progress["ol3"]                 = 0;
		player.progress["hotdog"]              = 0;
		player.progress["keester"]             = 0;
		player.progress["bingo"]               = 0;
		player.progress["organ"]               = 0;
		player.progress["edt"]                 = 0;
		player.progress["mickey"]              = 0;
		player.progress["mickeycost"]          = 0; // BChance: Might want to default to something other than 0.
		player.progress["mickeyinc"]           = 0; // BChance: Might want to default to something other than 0.
		player.progress["mickeysuitcost"]      = 0; // BChance: Might want to default to something other than 0.
		player.progress["suzie"]               = 0;
		player.progress["tourguide"]           = 0;
		player.progress["tourcash"]            = 0;
		player.progress["touristscore"]        = 0;
		player.progress["wtq"]                 = 0;
		player.progress["wtqscore"]            = 0;
		player.progress["mqscore"]             = 0;
		player.progress["mathtest"]            = 0;
		player.progress["mathresult"]          = 0;
		player.progress["uwayscore"]           = 0;
		player.progress["uway"]                = 0;
		player.progress["ticketprice"]         = 0; // BChance: Might want to default to something other than 0.
		player.progress["ticket"]              = 0;
		player.progress["esq1"]                = 0;
		player.progress["esq2"]                = 0;
		player.progress["esq3"]                = 0;
		player.progress["esq4"]                = 0;
		player.progress["esq5"]                = 0;
		player.progress["parts"]               = 0;
		player.progress["rightparts"]          = 0;
		player.progress["ett"]                 = 0;
		player.progress["etttrap"]             = 0;
		player.progress["oletttrap"]           = 0;
		player.progress["msq1"]                = 0;
		player.progress["msq2"]                = 0;
		player.progress["msq3"]                = 0;
		player.progress["msq4"]                = 0;
		player.progress["msqprogress"]         = 0;
		player.progress["franco"]              = 0;
		player.progress["francoobj"]           = 0;
		player.progress["vbclue"]              = 0;
		player.progress["wutrap"]              = 0;
		player.progress["shorttrap"]           = 0;
		player.progress["mickeytrap"]          = 0;
		player.progress["keestertrap"]         = 0;
		player.progress["suzietrap"]           = 0;
		player.progress["bingotrap"]           = 0;
		player.progress["groovytrap"]          = 0;
		player.progress["francotrap"]          = 0;
		player.progress["grannytrap"]          = 0;
		player.progress["cwgtrap"]             = 0;
		player.progress["ravetrap"]            = 0;
		player.progress["tgtrap"]              = 0;
		player.progress["evetrap"]             = 0;
		player.progress["tut_start"]           = 0; // BChance: Might want to default to something other than 0.
		player.progress["tgcantrap"]           = 0; // BChance: Might want to default to something other than 0.
		player.progress["scoreconvo"]          = "";
		player.progress["va"]                  = 0;
		player.progress["vb"]                  = 0;
		player.progress["vc"]                  = 0;
		player.progress["vd"]                  = 0;
		player.progress["issigned"]            = false;
		player.progress["invcontract"]         = false;
		player.progress["vendorcontract"]      = false;
		player.progress["signedcontract"]      = false;
		player.progress["playedweeklymovie"]   = false;

		// BChance: Remove any newspapers that we have at week start.
		player.progress["w1crier"]             = false;
		player.progress["w2crier"]             = false;
		player.progress["w3crier"]             = false;
		player.progress["w1examiner"]          = false;
		player.progress["w2examiner"]          = false;
		player.progress["w3examiner"]          = false;
		player.progress["w1today"]             = false;
		player.progress["w2today"]             = false;
		player.progress["w3today"]             = false;

		// BChance: Clear the 'ett' trap vendor location.
		player.progress["ett_vendor"]          = 0;


		RefreshUIBasedOnProgress();
	}

	public static void Default_PlayerProgressData(PlayerData player)
	{
		player.progress["week"]                = 0;
		player.progress["playernum"]           = 4;
		player.progress["rnddialog"]           = 0;
		player.progress["random"]              = 0;
		player.progress["pilotstage"]          = 0;
		player.progress["curoutfit"]           = 1;
		player.progress["charcreated"]         = true;
		player.progress["w1vendor"]            = 0;
		player.progress["w2vendor"]            = 0;
		player.progress["w3vendor"]            = 0;
		player.progress["w4vendor"]            = 0;
		player.progress["clothingscore"]       = 0;
		player.progress["explored"]            = 0;
		player.progress["earnedplayercash"]    = 0;
		player.progress["trashcash"]           = 0;
		player.progress["ceostate"]            = 0;
		player.progress["playercash"]          = 25;
		player.progress["sSessions"]           = 0;
		player.progress["sTimePlayed"]         = 0;
		player.progress["sChatTime"]           = 0;
		player.progress["sChatChars"]          = 0;
		player.progress["sJournalTime"]        = 0;
		player.progress["sNotePadTime"]        = 0;
		player.progress["sIckyTime"]           = 0;
		player.progress["sIckyEntries"]        = 0;
		player.progress["sLibArt"]             = 0;
		player.progress["sNewsArt"]            = 0;
		player.progress["notestring"]          = "";
		player.progress["trash"]               = 0;
		player.progress["silentscore"]         = 0;
		player.progress["playerskin_r"]        = 255;
		player.progress["playerskin_g"]        = 255;
		player.progress["playerskin_b"]        = 255;
		player.progress["playerhair_r"]        = 255;
		player.progress["playerhair_g"]        = 255;
		player.progress["playerhair_b"]        = 255;
		player.progress["gender"]              = 0;
		player.progress["bodytype"]            = 0;
		player.progress["head"]                = 1;
		player.progress["firstname"]           = null;
		player.progress["lastname"]            = null;
		player.progress["tm_3_w1vendor"]       = 0;
		player.progress["tm_3_w2vendor"]       = 0;
		player.progress["tm_3_w3vendor"]       = 0;
		player.progress["tm_4_w1vendor"]       = 0;
		player.progress["tm_4_w2vendor"]       = 0;
		player.progress["tm_4_w3vendor"]       = 0;
		player.progress["tm_5_w1vendor"]       = 0;
		player.progress["tm_5_w2vendor"]       = 0;
		player.progress["tm_5_w3vendor"]       = 0;
		player.progress["tm_6_w1vendor"]       = 0;
		player.progress["tm_6_w2vendor"]       = 0;
		player.progress["tm_6_w3vendor"]       = 0;
		player.progress["tm_3_w1cost"]         = 0;
		player.progress["tm_3_w2cost"]         = 0;
		player.progress["tm_4_w1cost"]         = 0;
		player.progress["tm_4_w2cost"]         = 0;
		player.progress["tm_5_w1cost"]         = 0;
		player.progress["tm_5_w2cost"]         = 0;
		player.progress["tm_6_w1cost"]         = 0;
		player.progress["tm_6_w2cost"]         = 0;
		player.progress["teamtotalcost"]       = 0;


		// BChance: (2016-07-25) - Taken from 'storvars.lua'. May overwrite 
		//                           above values if there are duplicate entries.
		player.progress["outcome"]             = 0;
		player.progress["vendorsarrested"]     = 0;
		player.progress["tm_3_w4vendor"]       = 0;
		player.progress["tm_3_w3cost"]         = 0;
		player.progress["tm_4_w4vendor"]       = 0;
		player.progress["tm_4_w3cost"]         = 0;
		player.progress["tm_5_w4vendor"]       = 0;
		player.progress["tm_5_w3cost"]         = 0;
		player.progress["tm_6_w4vendor"]       = 0;
		player.progress["tm_6_w3cost"]         = 0;
		player.progress["trapspawn"]           = "";
		player.progress["lastvendor"]          = 0;
		player.progress["trapper"]             = 0;
		player.progress["testcost"]            = 0;
		player.progress["infotext"]            = null;
		player.progress["biginfo"]             = false;
		player.progress["articletext"]         = null;
		player.progress["ickypname"]           = "";
		player.progress["lvlchks_0"]           = false;
		player.progress["lvlchks_1"]           = false;
		player.progress["lvlchks_2"]           = false;
		player.progress["lvlchks_3"]           = false;
		player.progress["lvlchks_4"]           = false;
		player.progress["lvlchks_5"]           = false;
		player.progress["lvlchks_6"]           = false;
		player.progress["lvlchks_7"]           = false;
		player.progress["lvlchks_8"]           = false;
		player.progress["lvlchks_9"]           = false;
		player.progress["lvlchks_10"]          = false;
		player.progress["lvlchks_11"]          = false;
		player.progress["lvlchks_12"]          = false;
		player.progress["lvlchks_13"]          = false;
		player.progress["lvlchks_14"]          = false;
		player.progress["lvlchks_15"]          = false;
		player.progress["lvlchks_16"]          = false;
		player.progress["lvlchks_17"]          = false;
		player.progress["lvlchks_18"]          = false;
		player.progress["lvlchks_19"]          = false;
		player.progress["lvlchks_20"]          = false;
		player.progress["lvlchks_21"]          = false;
		player.progress["lvlchks_22"]          = false;
		player.progress["lvlchks_23"]          = false;
		player.progress["lvlchks_24"]          = false;
		player.progress["lvlchks_25"]          = false;
		player.progress["lvlchks_26"]          = false;
		player.progress["lvlchks_27"]          = false;
		player.progress["lvlchks_28"]          = false;
		player.progress["lvlchks_29"]          = false;
		player.progress["lvlchks_30"]          = false;
		player.progress["lvlchks_31"]          = false;
		player.progress["lvlchks_32"]          = false;
		player.progress["lvlchks_33"]          = false;
		player.progress["lvlchks_34"]          = false;
		player.progress["lvlchks_35"]          = false;
		player.progress["lvlchks_36"]          = false;
		player.progress["lvlchks_37"]          = false;
		player.progress["lvlchks_38"]          = false;
		player.progress["lvlchks_39"]          = false;
		player.progress["lvlchks_40"]          = false;
		player.progress["lvlchks_41"]          = false;
		player.progress["lvlchks_42"]          = false;
		player.progress["lvlchks_43"]          = false;
		player.progress["lvlchks_44"]          = false;
		player.progress["lvlchks_45"]          = false;
		player.progress["lvlchks_46"]          = false;
		player.progress["lvlchks_47"]          = false;
		player.progress["lvlchks_48"]          = false;
		player.progress["lvlchks_49"]          = false;
		player.progress["lvlchks_50"]          = false;
		player.progress["lvlchks_51"]          = false;
		player.progress["lvlchks_52"]          = false;
		player.progress["lvlchks_53"]          = false;
		player.progress["lvlchks_54"]          = false;
		player.progress["lvlchks_55"]          = false;
		player.progress["lvlchks_56"]          = false;
		player.progress["lvlchks_57"]          = false;
		player.progress["lvlchks_58"]          = false;
		player.progress["lvlchks_59"]          = false;
		player.progress["lvlchks_60"]          = false;
		player.progress["filledtubes"]         = 0; //FIN added 8/25/08
		player.progress["paulines"]            = null;
		player.progress["hotdogprice"]         = 7;
		player.progress["roll"]                = "";
		player.progress["event"]               = "";
		player.progress["mickeyspawn"]         = 0;
		player.progress["ettspawn"]            = 0;
		player.progress["shortspawn"]          = 0;
		player.progress["wuspawn"]             = 0;
		player.progress["cantrap"]             = 0;
		player.progress["scorestr"]            = "";
		player.progress["nlcscorestr"]         = "";
		player.progress["nlcscoreconvo"]       = "";
		player.progress["lcscorestr"]          = "";
		player.progress["lcscoreconvo"]        = "";
		player.progress["msqstr"]              = "";

		// BChance: (2016-08-23) - Added inventory slots.
		player.progress["inv_slot_0"]          = "";
		player.progress["inv_slot_1"]          = "";
		player.progress["inv_slot_2"]          = "";
		player.progress["inv_slot_3"]          = "";
		player.progress["inv_slot_4"]          = "";
		player.progress["inv_slot_5"]          = "";
		player.progress["inv_slot_6"]          = "";
		player.progress["inv_slot_7"]          = "";
		player.progress["inv_slot_8"]          = "";
		player.progress["inv_slot_9"]          = "";
		player.progress["inv_slot_10"]         = "";
		player.progress["inv_slot_11"]         = "";
		player.progress["inv_slot_12"]         = "";
		player.progress["inv_slot_13"]         = "";
		player.progress["inv_slot_14"]         = "";
		player.progress["inv_slot_15"]         = "";
		player.progress["inv_slot_16"]         = "";
		player.progress["inv_slot_17"]         = "";
		player.progress["inv_slot_18"]         = "";
		player.progress["inv_slot_19"]         = "";
		player.progress["inv_slot_20"]         = "";
		player.progress["inv_slot_21"]         = "";
		player.progress["inv_slot_22"]         = "";
		player.progress["inv_slot_23"]         = "";
		player.progress["inv_slot_24"]         = "";
		player.progress["inv_slot_25"]         = "";
		player.progress["inv_slot_26"]         = "";
		player.progress["inv_slot_27"]         = "";
		player.progress["inv_slot_28"]         = "";
		player.progress["inv_slot_29"]         = "";
		player.progress["inv_slot_30"]         = "";
		player.progress["inv_slot_31"]         = "";
		player.progress["inv_slot_32"]         = "";
		player.progress["inv_slot_33"]         = "";
		player.progress["inv_slot_34"]         = "";
		player.progress["inv_slot_35"]         = "";
		player.progress["inv_slot_36"]         = "";
		player.progress["inv_slot_37"]         = "";
		player.progress["inv_slot_38"]         = "";
		player.progress["inv_slot_39"]         = "";
		player.progress["inv_slot_40"]         = "";
		player.progress["inv_slot_41"]         = "";
		player.progress["inv_slot_42"]         = "";
		player.progress["inv_slot_43"]         = "";
		player.progress["inv_slot_44"]         = "";
		player.progress["inv_slot_45"]         = "";
		player.progress["inv_slot_46"]         = "";
		player.progress["inv_slot_47"]         = "";
		player.progress["inv_slot_48"]         = "";
		player.progress["inv_slot_49"]         = "";

		// BChance: Set the avatar data defaults.
		player.progress["isMale"] = true;
		player.progress["index_BodyModel"] = 0;
		player.progress["index_HairModel"] = 1;
		player.progress["index_SkinColor"] = 1;
		player.progress["index_HairColor"] = 0;
		player.progress["is_avatar_set"] = false;

		// BChance: Set started and finished flag defaults.
		player.progress["week_0_started"]  = false;
		player.progress["week_0_finished"] = false;
		player.progress["week_1_started"]  = false;
		player.progress["week_1_finished"] = false;
		player.progress["week_2_started"]  = false;
		player.progress["week_2_finished"] = false;
		player.progress["week_3_started"]  = false;
		player.progress["week_3_finished"] = false;

		// Ensure that the player can revert to their default outfit.
		if (player.progress["isMale"].b)
		{
			player.progress["moutfit1"]        = true;
			player.progress["foutfit1"]        = false;
		}
		else
		{
			player.progress["moutfit1"]        = false;
			player.progress["foutfit1"]        = true;
		}


		Reset_WeeklyFields(player);
	}

	public static void RefreshUIBasedOnProgress()
	{
		if (UI_Inventory.instance != null)
		{
			// If the player is flagged to have an item, ensure that they have it.
			//   Otherwise, ensure that they don't have it.
			if (Player != null)
			{
				bool update_inventory_data = false;

				if (Player.progress["bobblehead"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("bobblehead"))
					{
						UI_Inventory.Player_AddItemWithKey("bobblehead");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("bobblehead"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("bobblehead");
						update_inventory_data = true;
					}
				}
				if (Player.progress["capacitor"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("capacitor"))
					{
						UI_Inventory.Player_AddItemWithKey("capacitor");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("capacitor"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("capacitor");
						update_inventory_data = true;
					}
				}
				if (Player.progress["acctcert"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("acctcert"))
					{
						UI_Inventory.Player_AddItemWithKey("acctcert");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("acctcert"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("acctcert");
						update_inventory_data = true;
					}
				}
				if (Player.progress["circuitboard"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("circuitboard"))
					{
						UI_Inventory.Player_AddItemWithKey("circuitboard");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("circuitboard"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("circuitboard");
						update_inventory_data = true;
					}
				}
				if (Player.progress["invcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("invcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("invcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("invcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("invcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["vendorcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("vendorcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("vendorcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("vendorcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("vendorcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["signedcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("signedcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("signedcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("signedcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("signedcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["cottoncandy"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("cottoncandy"))
					{
						UI_Inventory.Player_AddItemWithKey("cottoncandy");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("cottoncandy"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("cottoncandy");
						update_inventory_data = true;
					}
				}
				if (Player.progress["digitalis"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("digitalis"))
					{
						UI_Inventory.Player_AddItemWithKey("digitalis");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("digitalis"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("digitalis");
						update_inventory_data = true;
					}
				}
				if (Player.progress["helixsw"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("helixsw"))
					{
						UI_Inventory.Player_AddItemWithKey("helixsw");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("helixsw"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("helixsw");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hotdog1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hotdog1"))
					{
						UI_Inventory.Player_AddItemWithKey("hotdog1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hotdog1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hotdog1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hotdog2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hotdog2"))
					{
						UI_Inventory.Player_AddItemWithKey("hotdog2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hotdog2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hotdog2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hotdog3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hotdog3"))
					{
						UI_Inventory.Player_AddItemWithKey("hotdog3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hotdog3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hotdog3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hotdogbox"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hotdogbox"))
					{
						UI_Inventory.Player_AddItemWithKey("hotdogbox");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hotdogbox"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hotdogbox");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hotdogbun"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hotdogbun"))
					{
						UI_Inventory.Player_AddItemWithKey("hotdogbun");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hotdogbun"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hotdogbun");
						update_inventory_data = true;
					}
				}
				if (Player.progress["magazine"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("magazine"))
					{
						UI_Inventory.Player_AddItemWithKey("magazine");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("magazine"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("magazine");
						update_inventory_data = true;
					}
				}
				if (Player.progress["mustard"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("mustard"))
					{
						UI_Inventory.Player_AddItemWithKey("mustard");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("mustard"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("mustard");
						update_inventory_data = true;
					}
				}
				if (Player.progress["newspaper"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("newspaper"))
					{
						UI_Inventory.Player_AddItemWithKey("newspaper");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("newspaper"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("newspaper");
						update_inventory_data = true;
					}
				}
				if (Player.progress["newsraffle"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("newsraffle"))
					{
						UI_Inventory.Player_AddItemWithKey("newsraffle");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("newsraffle"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("newsraffle");
						update_inventory_data = true;
					}
				}
				if (Player.progress["postagestamps"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("postagestamps"))
					{
						UI_Inventory.Player_AddItemWithKey("postagestamps");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("postagestamps"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("postagestamps");
						update_inventory_data = true;
					}
				}
				if (Player.progress["recyclables"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("recyclables"))
					{
						UI_Inventory.Player_AddItemWithKey("recyclables");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("recyclables"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("recyclables");
						update_inventory_data = true;
					}
				}
				if (Player.progress["novelleraffle"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("novelleraffle"))
					{
						UI_Inventory.Player_AddItemWithKey("novelleraffle");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("novelleraffle"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("novelleraffle");
						update_inventory_data = true;
					}
				}
				if (Player.progress["speakerwire"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("speakerwire"))
					{
						UI_Inventory.Player_AddItemWithKey("speakerwire");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("speakerwire"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("speakerwire");
						update_inventory_data = true;
					}
				}
				if (Player.progress["stethoscope"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("stethoscope"))
					{
						UI_Inventory.Player_AddItemWithKey("stethoscope");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("stethoscope"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("stethoscope");
						update_inventory_data = true;
					}
				}
				if (Player.progress["transistor"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("transistor"))
					{
						UI_Inventory.Player_AddItemWithKey("transistor");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("transistor"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("transistor");
						update_inventory_data = true;
					}
				}
				if (Player.progress["trash1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("trash1"))
					{
						UI_Inventory.Player_AddItemWithKey("trash1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("trash1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("trash1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["trash2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("trash2"))
					{
						UI_Inventory.Player_AddItemWithKey("trash2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("trash2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("trash2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["slobraffle"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("slobraffle"))
					{
						UI_Inventory.Player_AddItemWithKey("slobraffle");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("slobraffle"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("slobraffle");
						update_inventory_data = true;
					}
				}
				if (Player.progress["raveticket"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("raveticket"))
					{
						UI_Inventory.Player_AddItemWithKey("raveticket");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("raveticket"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("raveticket");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit1"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit3"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit4"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit5"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit6"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit7"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit8"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit9"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit11"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit11"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit11");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit11"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit11");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit12"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit12"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit12");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit12"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit12");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit13"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit13"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit13");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit13"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit13");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit15"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit15"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit15");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit15"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit15");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit17"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit17"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit17");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit17"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit17");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit18"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit18"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit18");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit18"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit18");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit21"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit21"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit21");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit21"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit21");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit22"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit22"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit22");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit22"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit22");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit23"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit23"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit23");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit23"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit23");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit24"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit24"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit24");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit24"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit24");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit27"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit27"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit27");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit27"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit27");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit28"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit28"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit28");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit28"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit28");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moutfit31"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moutfit31"))
					{
						UI_Inventory.Player_AddItemWithKey("moutfit31");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moutfit31"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moutfit31");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit1"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit3"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit4"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit5"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit6"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit8"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit9"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit10"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit11"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit11"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit11");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit11"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit11");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit12"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit12"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit12");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit12"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit12");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit13"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit13"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit13");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit13"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit13");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit14"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit14"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit14");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit14"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit14");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit15"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit15"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit15");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit15"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit15");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit16"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit16"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit16");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit16"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit16");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit17"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit17"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit17");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit17"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit17");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit21"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit21"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit21");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit21"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit21");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit22"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit22"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit22");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit22"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit22");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit23"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit23"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit23");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit23"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit23");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit24"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit24"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit24");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit24"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit24");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit25"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit25"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit25");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit25"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit25");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit27"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit27"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit27");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit27"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit27");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit28"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit28"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit28");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit28"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit28");
						update_inventory_data = true;
					}
				}
				if (Player.progress["foutfit31"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("foutfit31"))
					{
						UI_Inventory.Player_AddItemWithKey("foutfit31");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("foutfit31"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("foutfit31");
						update_inventory_data = true;
					}
				}
				if (Player.progress["goodbadge"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("goodbadge"))
					{
						UI_Inventory.Player_AddItemWithKey("goodbadge");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("goodbadge"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("goodbadge");
						update_inventory_data = true;
					}
				}
				if (Player.progress["fakebadge"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("fakebadge"))
					{
						UI_Inventory.Player_AddItemWithKey("fakebadge");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("fakebadge"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("fakebadge");
						update_inventory_data = true;
					}
				}
				if (Player.progress["apron"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("apron"))
					{
						UI_Inventory.Player_AddItemWithKey("apron");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("apron"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("apron");
						update_inventory_data = true;
					}
				}
				if (Player.progress["beef"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("beef"))
					{
						UI_Inventory.Player_AddItemWithKey("beef");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("beef"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("beef");
						update_inventory_data = true;
					}
				}
				if (Player.progress["blitzocontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("blitzocontract"))
					{
						UI_Inventory.Player_AddItemWithKey("blitzocontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("blitzocontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("blitzocontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["certificate"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("certificate"))
					{
						UI_Inventory.Player_AddItemWithKey("certificate");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("certificate"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("certificate");
						update_inventory_data = true;
					}
				}
				if (Player.progress["check"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("check"))
					{
						UI_Inventory.Player_AddItemWithKey("check");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("check"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("check");
						update_inventory_data = true;
					}
				}
				if (Player.progress["issigned"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("issigned"))
					{
						UI_Inventory.Player_AddItemWithKey("issigned");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("issigned"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("issigned");
						update_inventory_data = true;
					}
				}
				if (Player.progress["cityhallcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("cityhallcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("cityhallcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("cityhallcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("cityhallcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["cleaver"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("cleaver"))
					{
						UI_Inventory.Player_AddItemWithKey("cleaver");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("cleaver"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("cleaver");
						update_inventory_data = true;
					}
				}
				if (Player.progress["coffeecontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("coffeecontract"))
					{
						UI_Inventory.Player_AddItemWithKey("coffeecontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("coffeecontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("coffeecontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["coldcuts"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("coldcuts"))
					{
						UI_Inventory.Player_AddItemWithKey("coldcuts");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("coldcuts"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("coldcuts");
						update_inventory_data = true;
					}
				}
				if (Player.progress["dustcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("dustcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("dustcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("dustcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("dustcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_1"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_2"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_3"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_4"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_5"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_6"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_7"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_8"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_9"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["emptycollectkits_10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("emptycollectkits_10"))
					{
						UI_Inventory.Player_AddItemWithKey("emptycollectkits_10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("emptycollectkits_10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("emptycollectkits_10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["frozendogs"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("frozendogs"))
					{
						UI_Inventory.Player_AddItemWithKey("frozendogs");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("frozendogs"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("frozendogs");
						update_inventory_data = true;
					}
				}
				if (Player.progress["guitar"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("guitar"))
					{
						UI_Inventory.Player_AddItemWithKey("guitar");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("guitar"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("guitar");
						update_inventory_data = true;
					}
				}
				if (Player.progress["mustardcontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("mustardcontract"))
					{
						UI_Inventory.Player_AddItemWithKey("mustardcontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("mustardcontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("mustardcontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["package"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("package"))
					{
						UI_Inventory.Player_AddItemWithKey("package");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("package"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("package");
						update_inventory_data = true;
					}
				}
				if (Player.progress["pamphlet"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("pamphlet"))
					{
						UI_Inventory.Player_AddItemWithKey("pamphlet");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("pamphlet"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("pamphlet");
						update_inventory_data = true;
					}
				}
				if (Player.progress["recyclables"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("recyclables"))
					{
						UI_Inventory.Player_AddItemWithKey("recyclables");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("recyclables"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("recyclables");
						update_inventory_data = true;
					}
				}
				if (Player.progress["sauerkraut"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("sauerkraut"))
					{
						UI_Inventory.Player_AddItemWithKey("sauerkraut");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("sauerkraut"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("sauerkraut");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_1"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_2"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_3"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_4"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_5"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_6"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_7"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_8"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_9"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["scollectkits_10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("scollectkits_10"))
					{
						UI_Inventory.Player_AddItemWithKey("scollectkits_10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("scollectkits_10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("scollectkits_10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["startermotor"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("startermotor"))
					{
						UI_Inventory.Player_AddItemWithKey("startermotor");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("startermotor"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("startermotor");
						update_inventory_data = true;
					}
				}
				if (Player.progress["tiedyeshirt"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("tiedyeshirt"))
					{
						UI_Inventory.Player_AddItemWithKey("tiedyeshirt");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("tiedyeshirt"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("tiedyeshirt");
						update_inventory_data = true;
					}
				}
				if (Player.progress["volttest"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("volttest"))
					{
						UI_Inventory.Player_AddItemWithKey("volttest");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("volttest"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("volttest");
						update_inventory_data = true;
					}
				}
				if (Player.progress["watersample"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("watersample"))
					{
						UI_Inventory.Player_AddItemWithKey("watersample");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("watersample"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("watersample");
						update_inventory_data = true;
					}
				}
				if (Player.progress["suit"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("suit"))
					{
						UI_Inventory.Player_AddItemWithKey("suit");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("suit"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("suit");
						update_inventory_data = true;
					}
				}
				if (Player.progress["webstercontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("webstercontract"))
					{
						UI_Inventory.Player_AddItemWithKey("webstercontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("webstercontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("webstercontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["demetercontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("demetercontract"))
					{
						UI_Inventory.Player_AddItemWithKey("demetercontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("demetercontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("demetercontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["marcoscontract"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("marcoscontract"))
					{
						UI_Inventory.Player_AddItemWithKey("marcoscontract");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("marcoscontract"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("marcoscontract");
						update_inventory_data = true;
					}
				}
				if (Player.progress["greencertificate"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("greencertificate"))
					{
						UI_Inventory.Player_AddItemWithKey("greencertificate");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("greencertificate"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("greencertificate");
						update_inventory_data = true;
					}
				}
				if (Player.progress["hammer"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("hammer"))
					{
						UI_Inventory.Player_AddItemWithKey("hammer");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("hammer"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("hammer");
						update_inventory_data = true;
					}
				}
				if (Player.progress["moneybag"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("moneybag"))
					{
						UI_Inventory.Player_AddItemWithKey("moneybag");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("moneybag"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("moneybag");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard1"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard2"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard3"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard4"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard5"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard6"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard7"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard8"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard9"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard10"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard11"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard11"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard11");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard11"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard11");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard12"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard12"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard12");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard12"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard12");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard13"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard13"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard13");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard13"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard13");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard14"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard14"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard14");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard14"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard14");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard15"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard15"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard15");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard15"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard15");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard16"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard16"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard16");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard16"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard16");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard17"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard17"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard17");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard17"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard17");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard18"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard18"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard18");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard18"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard18");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard19"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard19"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard19");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard19"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard19");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard20"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard20"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard20");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard20"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard20");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard21"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard21"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard21");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard21"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard21");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard22"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard22"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard22");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard22"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard22");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard23"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard23"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard23");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard23"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard23");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard24"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard24"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard24");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard24"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard24");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard25"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard25"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard25");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard25"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard25");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard26"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard26"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard26");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard26"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard26");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard27"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard27"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard27");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard27"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard27");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard28"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard28"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard28");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard28"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard28");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard29"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard29"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard29");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard29"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard29");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard30"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard30"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard30");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard30"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard30");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard31"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard31"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard31");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard31"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard31");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard32"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard32"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard32");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard32"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard32");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard33"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard33"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard33");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard33"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard33");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard34"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard34"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard34");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard34"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard34");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard35"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard35"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard35");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard35"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard35");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard36"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard36"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard36");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard36"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard36");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard37"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard37"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard37");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard37"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard37");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard38"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard38"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard38");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard38"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard38");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard39"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard39"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard39");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard39"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard39");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard40"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard40"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard40");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard40"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard40");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard41"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard41"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard41");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard41"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard41");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard42"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard42"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard42");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard42"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard42");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard43"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard43"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard43");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard43"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard43");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard44"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard44"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard44");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard44"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard44");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard45"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard45"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard45");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard45"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard45");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard46"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard46"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard46");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard46"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard46");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard47"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard47"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard47");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard47"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard47");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard48"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard48"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard48");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard48"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard48");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard49"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard49"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard49");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard49"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard49");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard50"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard50"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard50");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard50"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard50");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard51"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard51"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard51");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard51"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard51");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard52"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard52"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard52");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard52"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard52");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard53"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard53"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard53");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard53"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard53");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard54"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard54"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard54");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard54"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard54");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard55"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard55"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard55");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard55"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard55");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard56"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard56"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard56");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard56"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard56");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard57"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard57"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard57");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard57"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard57");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard58"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard58"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard58");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard58"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard58");
						update_inventory_data = true;
					}
				}
				if (Player.progress["businesscard59"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("businesscard59"))
					{
						UI_Inventory.Player_AddItemWithKey("businesscard59");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("businesscard59"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("businesscard59");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1crier"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1crier"))
					{
						UI_Inventory.Player_AddItemWithKey("w1crier");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1crier"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1crier");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2crier"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2crier"))
					{
						UI_Inventory.Player_AddItemWithKey("w2crier");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2crier"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2crier");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w3crier"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w3crier"))
					{
						UI_Inventory.Player_AddItemWithKey("w3crier");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w3crier"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w3crier");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1examiner"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1examiner"))
					{
						UI_Inventory.Player_AddItemWithKey("w1examiner");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1examiner"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1examiner");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2examiner"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2examiner"))
					{
						UI_Inventory.Player_AddItemWithKey("w2examiner");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2examiner"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2examiner");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w3examiner"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w3examiner"))
					{
						UI_Inventory.Player_AddItemWithKey("w3examiner");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w3examiner"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w3examiner");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1today"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1today"))
					{
						UI_Inventory.Player_AddItemWithKey("w1today");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1today"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1today");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2today"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2today"))
					{
						UI_Inventory.Player_AddItemWithKey("w2today");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2today"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2today");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w3today"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w3today"))
					{
						UI_Inventory.Player_AddItemWithKey("w3today");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w3today"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w3today");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b1"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b2"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b3"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b4"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b5"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b6"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b7"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b8"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b9"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b10"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b11"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b11"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b11");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b11"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b11");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b12"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b12"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b12");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b12"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b12");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b13"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b13"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b13");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b13"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b13");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b14"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b14"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b14");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b14"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b14");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b15"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b15"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b15");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b15"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b15");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w1b16"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w1b16"))
					{
						UI_Inventory.Player_AddItemWithKey("w1b16");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w1b16"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w1b16");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b1"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b1"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b1");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b1"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b1");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b2"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b2"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b2");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b2"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b2");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b3"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b3"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b3");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b3"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b3");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b4"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b4"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b4");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b4"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b4");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b5"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b5"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b5");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b5"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b5");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b6"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b6"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b6");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b6"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b6");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b7"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b7"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b7");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b7"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b7");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b8"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b8"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b8");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b8"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b8");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b9"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b9"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b9");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b9"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b9");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b10"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b10"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b10");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b10"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b10");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b11"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b11"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b11");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b11"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b11");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b12"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b12"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b12");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b12"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b12");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b13"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b13"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b13");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b13"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b13");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b14"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b14"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b14");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b14"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b14");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b15"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b15"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b15");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b15"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b15");
						update_inventory_data = true;
					}
				}
				if (Player.progress["w2b16"].b == true)
				{
					if (!UI_Inventory.Player_HasItemWithKey("w2b16"))
					{
						UI_Inventory.Player_AddItemWithKey("w2b16");
						update_inventory_data = true;
					}
				}
				else
				{
					if (UI_Inventory.Player_HasItemWithKey("w2b16"))
					{	
						UI_Inventory.Player_RemoveItemWithKey("w2b16");
						update_inventory_data = true;
					}
				}

				// Update and save the inventory data.
				if (update_inventory_data)
					UI_Inventory.Player_UpdateInventoryData();
			}
		}
	}

	public static void Init()
	{
		if (   _instance == null
			&& !_initialized)
		{
			Debug.Log("GLOBAL.Init()");
			SceneManager.LoadScene("GLOBAL", LoadSceneMode.Additive);

			_initialized = true;
		}
	}

	public static bool IsLeftMouseDown()
	{
		// Left-click with no Shift modifier.
		return 
			   !Input.GetButton("Shift")
			&& Input.GetMouseButtonDown(0);
	}

	public static bool IsLeftMouseUp()
	{
		// Left-click with no Shift modifier.
		return 
			   !Input.GetButton("Shift")
			&& Input.GetMouseButtonUp(0);
	}

	public static bool IsLeftMousePressed()
	{
		// Left-click with no Shift modifier.
		return 
			   !Input.GetButton("Shift")
			&& Input.GetMouseButton(0);
	}

	public static bool IsRightMouseDown()
	{
		// Right-click or Shift + Left-click.
		return 
			Input.GetMouseButtonDown(1)
			|| (   Input.GetButton("Shift")
				&& Input.GetMouseButtonDown(0));
	}

	public static bool IsRightMouseUp()
	{
		// Right-click or Shift + Left-click.
		return 
			Input.GetMouseButtonUp(1)
			|| (   Input.GetButton("Shift")
				&& Input.GetMouseButtonUp(0));
	}

	public static bool IsRightMousePressed()
	{
		// Right-click or Shift + Left-click.
		return 
			Input.GetMouseButton(1)
			|| (   Input.GetButton("Shift")
				&& Input.GetMouseButton(0));
	}

	public static void Send_DB_Request(string url)
	{
		_instance.StartCoroutine(Web_DB_SendRequest(url));
	}

	private static IEnumerator Web_DB_SendRequest(string url)
	{
		url = GLOBAL.GetUrl_Database(url);
		
		Debug.Log("GLOBAL.Web_DB_SendRequest() - url: " + url);

		WWW www = new WWW(url);

		yield return www;

		if (string.IsNullOrEmpty(www.error))
		{
			string strResult = www.text;

			//Debug.Log("RESULT:\r\n" + strResult);

			if (!strResult.Contains("0 OK"))
			{
				Debug.LogError("GLOBAL.Web_DB_SendRequest() - SCRIPT ERROR:\n" + strResult);
			}
		}
		else
		{
			Debug.LogError("GLOBAL.Web_DB_SendRequest() - WEB ERROR:\n" + www.error);
		}
	}
}
