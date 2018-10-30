using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using System.Text;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using SimpleJSON;

public class UILogin : MonoBehaviour
{
	public Text txt_version;
	public Login LoginInstance;
	public GameObject LoginPanel;
	public string ResName,Res_msg;
	public float alphaValueBg;

	//string str;
	//int Password_Lenth;

	void Awake()
	{
		GLOBAL_old.Init();
	}

	/************************** initialization ******************/
	void Start()
	{
		txt_version.text = "v." + CONFIG_old.VERSION;

		PlayerPrefs.SetInt("posPlay" , 0);
		alphaValueBg = 1;
		// access panel alpha effect
		//InvokeRepeating("PanelBg",3f,0.001f);
		LoginPanel.SetActive(true);
	}

	public void PanelBg()
	{

		if(alphaValueBg <= 0.1 && alphaValueBg >0.085)
		{
			LoginPanel.SetActive(true);
			//StartCoroutine(LoadingScene(0.5f));
		}

		if(alphaValueBg > 0.001f)
		{
			alphaValueBg = alphaValueBg -0.005f;
		}
		if(alphaValueBg<0.001f)
		{
			CancelInvoke("PanelBg");
			LoginInstance.BgPanel.gameObject.SetActive(false);
			//Play();
		}

		LoginInstance.BgPanel.color =new Color(1,1,1,alphaValueBg);
	}

	/******************** Login Action Event ********************/
	public void btn_Login_Click()
	{
		LoginInstance.LoginInfo.text = "";
		validation();
	}

	public void btn_Cancel_Click()
	{
		SceneManager.LoadScene("LandingScreen");
	}

	/******************** update call every frame by frame ********************/
	void Update()
	{
		//Password_Hide();

		// Submit the login info when Enter is pressed.
		if (Input.GetButtonUp("Submit"))
		{
			btn_Login_Click();
		}
		// Return to the previous menu Escape is pressed.
		else if (Input.GetButtonUp("Cancel"))
		{
			btn_Cancel_Click();
		}
		// Allow tabbing between UI elements.
		else if (Input.GetKeyDown(KeyCode.Tab))
		{
			Selectable next;
			if (EventSystem.current.currentSelectedGameObject != null)
			{
				if (Input.GetAxis("Shift") != 0.0f)
				{
					next = EventSystem.current.currentSelectedGameObject.GetComponent<Selectable>().FindSelectableOnUp();
				}
				else
				{
					next = EventSystem.current.currentSelectedGameObject.GetComponent<Selectable>().FindSelectableOnDown();
				}

				if (next != null)
				{
					InputField inputfield = next.GetComponent<InputField>();

					// If it's an input field, also set the text caret
					if (inputfield != null)
						inputfield.OnPointerClick(new PointerEventData(EventSystem.current));

					EventSystem.current.SetSelectedGameObject(next.gameObject, new BaseEventData(EventSystem.current));
				}
			}
		}
	}

	/******************** login validation Action Event ********************/
	public void validation()
	{
		// TODO: Handle login validation.

		//LoginInstance.StrUserName = LoginInstance.UserName.text+"";
		//LoginInstance.StrPassword = LoginInstance.Password.text+"";

		//if(LoginInstance.StrUserName.Length > 0 && LoginInstance.StrPassword.Length > 0)
		//{
		//	if(Application.internetReachability != NetworkReachability.NotReachable)
		//	{
		//		StartCoroutine(ResponseWaiting());
		//	}
		//	else
		//	{
		//		LoginInstance.LoginInfo.text = "network error...";
		//	}
		//	LoginInstance.LoginInfo.color = Color.white;

		//}
		//else
		//{
		//	LoginInstance.LoginInfo.text = "please enter valid fields";
		//	LoginInstance.LoginInfo.color = Color.red;
		//}
	}

	/********************   login Response Action Event ********************/
	//IEnumerator ResponseWaiting()
	//{
	//	yield return new  WaitForSeconds(0.1f);

	//	//string url = "http://spilltest.com/webservice/webservices.php?action=login&username="+LoginInstance.StrUserName+"&password="+LoginInstance.StrPassword+"&usertype=s";
	//	//string url = "http://www.spillweb.us/webservice/webservices.php?action=login&username="+LoginInstance.StrUserName+"&password="+LoginInstance.StrPassword+"&usertype=s";
	//	//string url = GLOBAL.GetUrl_Database("webservice/webservices.php?action=login&username="+LoginInstance.StrUserName+"&password="+LoginInstance.StrPassword+"&usertype=s");



	//	string url = GLOBAL.GetUrl_Database("webservice/webservices.php");
		
	//	Debug.Log("url: " + url);

	//	//WWW www = new WWW(url);

	//	WWWForm wwwForm = new WWWForm();
		
	//	wwwForm.AddField("action", "login");
	//	wwwForm.AddField("username", LoginInstance.StrUserName);
	//	wwwForm.AddField("password", LoginInstance.StrPassword);
	//	wwwForm.AddField("usertype", "s");

	//	WWW www = new WWW(url, wwwForm);

	//	LoginInstance.LoginInfo.text = "waiting for server response...";
	//	yield return www;
	//	var N = JSONNode.Parse (www.text);	
	//	if (string.IsNullOrEmpty(www.error))
	//	{
	//		Debug.Log("UILogin.ResponseWaiting() - N['status']: " + N["status"]);
	//		switch(N["status"])
	//		{
	//			case "1" :
	//				LoginInstance.LoginInfo.color = Color.white;
	//				LoginInstance.LoginInfo.text = N["username"]+" "+N["message"]+".";

	//				// BChance: (2016-01-07) - Store the current player's username.
	//				GLOBAL.Player.username = N["username"];
	//				GLOBAL.Player.group = N["group"];
	//				GLOBAL.Player.password = LoginInstance.StrPassword;

	//				//StartCoroutine(LoadingScene(0.0f));

	//				// Retrieve the player data progress.
	//				StartCoroutine(GLOBAL.Player.Web_GetPlayerData_Progress(true, Loaded_PlayerData, Load_PlayerData_Errored));

	//				break;
	//			case "0":
	//				LoginInstance.LoginInfo.color = Color.red;
	//				LoginInstance.LoginInfo.text = ""+N["message"];
	//				break;

	//		}
	//		LoginInstance.StrUserName = "";
	//		LoginInstance.StrPassword = "";
			
	//		Debug.Log("UILogin.ResponseWaiting() - GLOBAL.PlayerUsername: " + GLOBAL.Player.username);
	//	}
	//	else
	//	{
	//		Debug.LogError(string.Format("HTTP ERROR: '{0}'", www.error));

	//		LoginInstance.LoginInfo.text ="No response.";
	//	}
		
	//}

	void Load_PlayerData_Errored(string strResult)
	{
		// Display the error to the user.
		LoginInstance.LoginInfo.color = Color.red;
		LoginInstance.LoginInfo.text = strResult;
	}

	/********************   character selection panel ********************/
	void Loaded_PlayerData(PlayerData player)
	{
		//Debug.Log("Loaded player data- Peter wass here");
		GLOBAL_old.Player.Log("Logged in:  V:"+CONFIG_old.VERSION);

		GLOBAL_old.VStatsLog("Login V:"+CONFIG_old.VERSION+": ");   // peter added

		// If the week has changed, reset the weekly fields.
		if (GLOBAL_old.Player.progress["week_changed"].b)
		{
			// Debug.Log("!!! -- Week Changed --");

			//GLOBAL.Reset_WeeklyFields(GLOBAL.Player);
			GLOBAL_old.Player.progress["week_changed"] = false;

			// // Append 'WEEK [X} STARTED' to the journal notes when the week changes.
			// string str_week_started = string.Format("<br><br>[TASK {0} STARTED]<br><br>", GLOBAL.Player.progress["week"].i);
			// GLOBAL.Player.progress["journal_notes"] = GLOBAL.Player.progress["journal_notes"].str + str_week_started;
			// UI_Journal.SetJournalText();

			GLOBAL_old.Player.Log("Started week " + GLOBAL_old.Player.progress["week"].i + ".");
		}

		// BChance: If we're logging in on a particular week, make 
		//   sure that we have flag that we've started it.
		if (GLOBAL_old.Player.progress["week"].i == 0)
		{
			GLOBAL_old.Player.progress["week_0_started"] = true;
		}
		else if (GLOBAL_old.Player.progress["week"].i == 1)
		{
			GLOBAL_old.Player.progress["week_1_started"] = true;
		}
		else if (GLOBAL_old.Player.progress["week"].i == 2)
		{
			GLOBAL_old.Player.progress["week_2_started"] = true;
		}
		else if (GLOBAL_old.Player.progress["week"].i == 3)
		{
			GLOBAL_old.Player.progress["week_3_started"] = true;
		}


		//StartCoroutine(GLOBAL.Player.Web_GetPlayerData_Avatar(true, Loaded_Avatar));

		Loaded_Avatar(player);
	}

	void Loaded_Avatar(PlayerData player)
	{
		// Increment 'sSessions' every time the player logs in.
		GLOBAL_old.Player.progress["sSessions"] = GLOBAL_old.Player.progress["sSessions"].i + 1;

		// Flag that we want to record the session count.
		GLOBAL_old.Player.progress["tksessions"] = true;

		// // Track the session length in seconds.
		// int new_timestamp = (int)(DateTime.Now.Ticks / 10000000);
		// GLOBAL.Player.progress["starttime"] = new_timestamp;

		//// Update the tracking.
		//PlayerData.SaveTrackingData();

		MemoryWarning();

		Debug.Log("Loading Scene 'character_customizer'");

		SceneManager.LoadScene("character_customizer");
	}

	void MemoryWarning()
	{
		System.GC.Collect();
		Resources.UnloadUnusedAssets();
		System.GC.WaitForPendingFinalizers();
	}
}
