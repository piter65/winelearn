using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class CONFIG
{
	public static bool OFFLINE = true;


	public static string VERSION         = "wine.learn.2018.oct.19";
	
	public static string URL_GAME        = "http://spilldata.us/game/";
	public static string URL_BENCHMARK   = "http://spilldata.us/benchmark/";
	
    public static string CFG_GETTER   = "config/get_config_game_server.php";




	public static bool TROUBLESHOOT_ONLY = false;
	public static bool LOW_BANDWIDTH = false;

	public static float TIME_UNTIL_IDLE                 =  15.0f;
	public static float IDLE_LOGOUT_TIMEOUT             = 600.0f;
	public static float AUDIO_DOWNLOAD_TIMEOUT          =   5.0f;
	public static float MULTIPLAYER_UPDATES_PER_SECOND  =   4.0f;

	private static bool _getting_config_data = false;
	public static IEnumerator Web_GetConfigData
	(
		 bool bYield = true
		,Action<string> callback_finished = null
	)
	{
		if (   OFFLINE
			|| _getting_config_data)
		{
			// Exit if we're already getting player data.
			yield return false;
		}
		else
		{
			// Flag that we're getting player data.
			_getting_config_data = true;

			Debug.Log("== CONFIG - Retrieving Config Data");

// Peter was here
//			string strUrl = GLOBAL.GetUrl_Game("config/get_config_game_server.php");
			string strUrl = GLOBAL_old.GetUrl_Game(CFG_GETTER);


			WWWForm wwwForm = new WWWForm();

			// wwwForm.AddField("action", "gameload_json");
			// wwwForm.AddField("username", username);
			// wwwForm.AddField("password", password);

			WWW www = new WWW(strUrl, wwwForm);

			if (bYield)
			{
				yield return www;
			}

			string strResult = www.text;

			Debug.Log("== CONFIG - Result:\n" + strResult);

			JSONObject objJSON = new JSONObject(strResult);
			if (   objJSON["error"] == null
				|| objJSON["error"].type == JSONObject.Type.NULL)
			{
				if (objJSON["data"] != null)
				{
					JSONObject objJSON_Config = objJSON["data"];

					// VERSION         = objJSON_Config["VERSION"].str;
					URL_BENCHMARK   = objJSON_Config["URL_BENCHMARK"].str;

					TROUBLESHOOT_ONLY = objJSON_Config["TROUBLESHOOT_ONLY"].b;
					LOW_BANDWIDTH     = objJSON_Config["LOW_BANDWIDTH"].b;

					TIME_UNTIL_IDLE                = objJSON_Config["TIME_UNTIL_IDLE"].f;
					IDLE_LOGOUT_TIMEOUT            = objJSON_Config["IDLE_LOGOUT_TIMEOUT"].f;
					AUDIO_DOWNLOAD_TIMEOUT         = objJSON_Config["AUDIO_DOWNLOAD_TIMEOUT"].f;
					MULTIPLAYER_UPDATES_PER_SECOND = objJSON_Config["MULTIPLAYER_UPDATES_PER_SECOND"].f;
					
					// If we have a callback for when data 
					//   retrieval is finished, call it now.
					if (callback_finished != null)
					{
						callback_finished(null);
					}
				}
				else
				{
					string error = "No 'data' JSON object found.";
					Debug.LogError(error);

					// If we have a callback for when data 
					//   retrieval is finished, call it now.
					if (callback_finished != null)
					{
						callback_finished(error);
					}
				}
			}
			else
			{
				string error = objJSON["error"].str;
				Debug.LogError("ERROR - CONFIG.Web_GetPlayerData():\r\n" + error);

				// If we have a callback for when data 
				//   retrieval is finished, call it now.
				if (callback_finished != null)
				{
					callback_finished(error);
				}
			}

			// Unflag that we're getting player data.
			_getting_config_data = false;
		}
	}
}