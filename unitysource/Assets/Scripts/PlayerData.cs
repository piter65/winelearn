using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class PlayerData
{
	public string username;
	public string group;
	public string password;
	public Vector3 position = Vector3.zero;
	public Quaternion rotation = Quaternion.identity;
	public float play_time = 0.0f;
	public EasyDictionary<string, MultiType> progress = new EasyDictionary<string, MultiType>();

	private bool _getting_player_data = false;

	private void Package_PlayerData_Progress(JSONObject objJSON_PlayerData)
	{
		// Loop thru the progress keys
		foreach (string key_progress_element in progress.Keys)
		{
			MultiType value_progress_element = progress[key_progress_element];

			// Set the progress value with the key based on it's type.
			if (value_progress_element.IsInt)
			{
				objJSON_PlayerData.AddField(key_progress_element, value_progress_element.i);
			}
			else if (value_progress_element.IsBool)
			{
				objJSON_PlayerData.AddField(key_progress_element, value_progress_element.b);
			}
			else if (value_progress_element.IsString)
			{
				objJSON_PlayerData.AddField(key_progress_element, value_progress_element.str);
			}
			else
			{
				Debug.LogError(string.Format
					(
						"PlayerData.Package_PlayerData_Progress() - Unable to parse progress element '{0}' of type '{1}'.",
						key_progress_element,
						value_progress_element.type.ToString()
					));
			}
		}
	}
	
	public void LogPlayerData()
	{
		// Send the player data to the server.
		JSONObject objJSON_PlayerData = new JSONObject();

		// Trigger the delegate that handles packaging the data we're sending.
		Package_PlayerData_Progress(objJSON_PlayerData);

		//Debug.LogError(objJSON_PlayerData.ToString());

		string strPlayerData = objJSON_PlayerData.Print(true);

		Debug.LogError("== LOGGING PLAYER DATA ==\n\n" + strPlayerData);
	}

	// BChance: Wrapper for coroutine call.
	public void Log(string text)
	{
		if (GLOBAL_old.Instance != null)
		{
			GLOBAL_old.Instance.StartCoroutine(Web_Log(text));
		}
	}

	// BChance: Logs a message to the server for the given player/user.
	public IEnumerator Web_Log(string text)
	{
		// TODO: Log stuff.

		yield return false;

		//if (   !string.IsNullOrEmpty(username)
		//	&& !string.IsNullOrEmpty(password))
		//{
		//	Debug.Log("== PlayerData - Logging message:\n" + text);

		//	string strUrl = GLOBAL.GetUrl_Database("log.php");

		//	WWWForm wwwForm = new WWWForm();
		//	wwwForm.AddField("username", username);
		//	wwwForm.AddField("text", text);

		//	WWW www = new WWW(strUrl, wwwForm);

		//	yield return www;

		//	string strResult = www.text;

		//	if (strResult.Length > 0)
		//	{
		//		Debug.LogError("Player.Log() - Server Error:\n" + strResult);
		//	}
		//}
		//else
		//{
		//	Debug.LogError("== Unable to log message for player because 'username' or 'password' is unset. ==");
		//}
	}
};
