using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

public class GLOBAL_old : MonoBehaviour
{
	public AudioClip clip_doormat;

	private static GLOBAL_old _instance;

	public static GLOBAL_old Instance { get { return _instance; } }

	private static bool _initialized = false;
	private static AudioSource _audio_source;

	public static PlayerData Player;
	public static Multiplayer_Entity player_entity;
	public static string target_spawn = null;
	public static OrbitCamera OrbitCam;
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

	//public static string GetUrl_Multiplayer(string url_end)
	//{
	//	return CONFIG.URL_MULTIPLAYER + url_end;
	//}

	//public static string GetUrl_Database(string url_end)
	//{
	//	return CONFIG.URL_DATABASE + url_end;
	//}

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
		if (   GLOBAL_old.Player == null
			|| GLOBAL_old.Player.progress["journal_notes_" + week].str == null)
			return 0;
		else
			return GLOBAL_old.Player.progress["journal_notes_" + week].str.Length;
	}

	public static void VStatsLog(string infostring)
	{
		// This will be a generic hi-info log info - peter was here
		GLOBAL_old.Player.Log
		(
			infostring +
			"  VStats:" +

			"  wk: " + GLOBAL_old.Player.progress["week"].ToString() +
			"  jrnprg: " + GLOBAL_old.Player.progress["journalprogress"].ToString() +
			"  jrnsz_1: " + GLOBAL_old.JSize(1).ToString() +
			"  jrnsz_2: " + GLOBAL_old.JSize(2).ToString() +
			"  jrnsz_3: " + GLOBAL_old.JSize(3).ToString() +
			"  jrnstate: " + (UI_Journal.IsOpen() ? "Open" : "Closed") +

			// BChance: Wrap the values in quotes if they're actually strings. Don't wrap otherwise.
			"  wk_set: " + (GLOBAL_old.Player.progress["php_week_isset"].IsString ? ("'" + GLOBAL_old.Player.progress["php_week_isset"].str + "'") : GLOBAL_old.Player.progress["php_week_isset"].str) +
			"  wk_no_eq: " + (GLOBAL_old.Player.progress["php_week_not_equal"].IsString ? "'" + GLOBAL_old.Player.progress["php_week_not_equal"].str + "'" : GLOBAL_old.Player.progress["php_week_not_equal"].str) +
			"  wk_data: " + (GLOBAL_old.Player.progress["php_week_data"].IsString ? "'" + GLOBAL_old.Player.progress["php_week_data"].str + "'" : GLOBAL_old.Player.progress["php_week_data"].str) +
			"  wk_db: " + (GLOBAL_old.Player.progress["php_week_db"].IsString ? "'" + GLOBAL_old.Player.progress["php_week_db"].str + "'" : GLOBAL_old.Player.progress["php_week_db"].str) +
			"  dta_len: " + (GLOBAL_old.Player.progress["php_data_length"].IsString ? "'" + GLOBAL_old.Player.progress["php_data_length"].str + "'" : GLOBAL_old.Player.progress["php_data_length"].str) +

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
			
			// TODO: Save player data...

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

		GLOBAL_old.Player.Log("Logged out-going to Landing Screen");

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

			// TODO: Default player data.

			//Default_PlayerProgressData(Player);
		}
	}

	void Update()
	{
		// Don't interact with 3D objects while dialogue is open.
		if (!DialogueOverlay.is_open)
		{
			if (GLOBAL_old.IsLeftMouseDown())
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
				GLOBAL_old.Player.Log("Idle Logout");
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

		// TODO: Save player data...

		if (GLOBAL_old.Player != null)
		{
			VStatsLog("App Quitting");
		}

		Debug.Log("== APPLICATION QUIT ==");
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
}
