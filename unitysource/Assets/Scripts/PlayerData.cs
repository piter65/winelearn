using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public enum MultiTypeType
{
	UNKNOWN,
	STRING,
	INT,
	BOOL
};

public struct MultiType
{
	public MultiTypeType type;
	public string str;
	public int i;
	public bool b;

	private static MultiType _UNKNOWN = new MultiType(MultiTypeType.UNKNOWN);
	public static MultiType UNKNOWN
	{
		get { return _UNKNOWN; }
	}

	public bool IsUnknown
	{
		get { return type == MultiTypeType.UNKNOWN; }
	}
	public bool IsInt
	{
		get { return type == MultiTypeType.INT; }
	}
	public bool IsString
	{
		get { return type == MultiTypeType.STRING; }
	}
	public bool IsBool
	{
		get { return type == MultiTypeType.BOOL; }
	}

	public MultiType(MultiTypeType enType)
	{
		type = enType;
		str = null;
		i = 0;
		b = false;
	}

	public MultiType(int iValue)
	{
		type = MultiTypeType.INT;
		str = iValue.ToString();
		i = iValue;
		b = iValue != 0;
	}

	public MultiType(string strValue)
	{
		i = 0;
		str = strValue;
		b = false;

		// If the string is an integer, set the type to int.
		if (Int32.TryParse(strValue, out i))
		{
			type = MultiTypeType.INT;
			b = i != 0;
		}
		// If the string is a boolean value, set the type to bool
		else if (Boolean.TryParse(strValue, out b))
		{
			type = MultiTypeType.BOOL;
			i = b ? 1 : 0;
		}
		// Otherwise, set the type to string.
		else
		{
			type = MultiTypeType.STRING;
		}
	}

	public MultiType(bool bValue)
	{
		type = MultiTypeType.BOOL;
		str = bValue.ToString();
		i = bValue ? 1 : 0;
		b = bValue;
	}

	public override string ToString()
	{
		if (IsString)
			return str;
		else if (IsInt)
			return i.ToString();
		else if (IsBool)
			return b.ToString();
		else
			return null;
	}

	public override bool Equals(object obj)
	{
		if (obj is int)
			return i == (int)obj;
		else if (obj is bool)
			return b == (bool)obj;
		else if (obj is string)
			return str.Equals((string)obj);
		else if (obj is MultiType)
			return this == (MultiType)obj;
		else if (obj == null)
			return str == null;
		else
			return false;
	}

	public override int GetHashCode() 
	{
		return
			  type.GetHashCode()
			+ i.GetHashCode()
			+ str.GetHashCode()
			+ b.GetHashCode();
	}

	// Allow assignment of integer values.
	public static implicit operator MultiType(int iValue)
	{
		return new MultiType(iValue);
	}

	// Allow assignment of string values.
	public static implicit operator MultiType(string strValue)
	{
		return new MultiType(strValue);
	}

	// Allow assignment of bool values.
	public static implicit operator MultiType(bool bValue)
	{
		return new MultiType(bValue);
	}

	public static bool operator ==(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i == b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return a.str.Equals(b.str);
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator !=(MultiType a, MultiType b) 
	{
		return !(a == b);
	}

	public static bool operator ==(MultiType a, int b) 
	{
		if (a.IsInt)
		{
			return a.i == b;
		}

		Debug.LogError(string.Format("Comparing MultiType of type {0} with {1} is not supported.", a.type.ToString(), b.GetType()));
		return false;
	}

	public static bool operator !=(MultiType a, int b) 
	{
		return !(a == b);
	}

	public static bool operator ==(MultiType a, bool b) 
	{
		if (a.IsBool)
		{
			return a.b == b;
		}

		//Debug.LogError(string.Format("Comparing MultiType of type {0} with {1} is not supported.", a.type.ToString(), b.GetType()));
		return false;
	}

	public static bool operator !=(MultiType a, bool b) 
	{
		return !(a == b);
	}

	public static bool operator >(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i > b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) > 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator <(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i < b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) < 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return false;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator >=(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i >= b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) >= 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static bool operator <=(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return a.i <= b.i;
		}
		else if (a.IsString && b.IsString)
		{
			return string.Compare(a.str, b.str) <= 0;
		}
		else if (a.IsBool && b.IsBool)
		{
			return a.b == b.b;
		}
		else if (a.IsUnknown && b.IsUnknown)
		{
			return true;
		}

		Debug.LogError(string.Format("Comparing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
		return false;
	}

	public static MultiType operator +(MultiType a, MultiType b) 
	{
		//Debug.LogError(string.Format("Adding MultiType: {0} and MultiType: {1}", a, b));
		if (a.IsInt && b.IsInt)
		{
			//Debug.LogError(string.Format("Adding MultiTypes as Integers"));
			return new MultiType(a.i + b.i);
		}
		else if (a.IsString && b.IsString)
		{
			//Debug.LogError(string.Format("Adding MultiTypes as Strings"));
			return new MultiType(a.str + b.str);
		}
		else
		{
			Debug.LogError(string.Format("Adding MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator -(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i - b.i);
		}
		else
		{
			Debug.LogError(string.Format("Subtracting MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator *(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i * b.i);
		}
		else
		{
			Debug.LogError(string.Format("Multiplying MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}

	public static MultiType operator /(MultiType a, MultiType b) 
	{
		if (a.IsInt && b.IsInt)
		{
			return new MultiType(a.i / b.i);
		}
		else
		{
			Debug.LogError(string.Format("Dividing MultiTypes of types {0} and {1} is not supported.", a.type.ToString(), b.type.ToString()));
			return MultiType.UNKNOWN;
		}
	}
};

// Allows dictionary values to be accessed or mutated entirely by indexer, allowing for cleaner code.
public class EasyDictionary<K, V> : Dictionary<K, V>
{
	// Overrides the base dictionary's indexer to allow easier access to values.
	public new V this[K k]
	{
		get
		{
			if (base.ContainsKey(k))
				return base[k];
			else
				return default(V);
		}
		set
		{
			if (base.ContainsKey(k))
				base[k] = value;
			else
				base.Add(k, value);
		}
	}
};

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

	private void Retrieve_PlayerData_Progress(JSONObject objJSON_PlayerData)
	{
		//Debug.LogError("Retrieve_PlayerData_Progress()");

		// Retrieve the progress data.
		//if (objJSON_PlayerData["progress"] != null)
		//{
		//	JSONObject objJSON_Progress = objJSON_PlayerData["progress"];
			JSONObject objJSON_Progress = objJSON_PlayerData;

			//Debug.LogError("objJSON_Progress.keys.Count: " + objJSON_Progress.keys.Count);

			// Loop thru the progress keys
			foreach (string key_progress_element in objJSON_Progress.keys)
			{
				JSONObject objJSON_ProgressElement = objJSON_Progress[key_progress_element];

				// Set the progress value with the key based on it's type.
				if (objJSON_ProgressElement.type == JSONObject.Type.NUMBER)
				{
					progress[key_progress_element] = (int)objJSON_ProgressElement.i;
				}
				else if (objJSON_ProgressElement.type == JSONObject.Type.BOOL)
				{
					progress[key_progress_element] = objJSON_ProgressElement.b;
				}
				else if (objJSON_ProgressElement.type == JSONObject.Type.STRING)
				{
					progress[key_progress_element] = objJSON_ProgressElement.str;
				}
				else
				{
					Debug.LogError(string.Format
						(
							"PlayerData.Retrieve_PlayerData_Progress() - Unable to parse progress element '{0}' of type '{1}'.",
							key_progress_element,
							objJSON_ProgressElement.type.ToString()
						));
				}

				//Debug.LogError(string.Format("'{0}': {1} | {2}", key_progress_element, objJSON_Progress[key_progress_element], progress[key_progress_element]));
			}

			UI_Inventory.Player_RetrieveInventoryFromPlayerData();
		//}
	}

	// Base funtion for retrieving player data. What data is retrieved 
	//   is handled by 'func_retrieve_player_data' delegate.
	private IEnumerator Web_GetPlayerData
	(
		Action<JSONObject> func_retrieve_player_data,
		bool bYield = true,
		Action<PlayerData> callback_data_retrieved = null
	)
	{
		//Debug.LogError("Web_GetPlayerData() - Start");

		string strUrl = GLOBAL.GetUrl_Multiplayer("get_player_data.php");

		WWWForm wwwForm = new WWWForm();

		wwwForm.AddField("key", username);
		wwwForm.AddField("group", group);

		WWW www = new WWW(strUrl, wwwForm);

		if (bYield)
		{
			yield return www;
		}

		string strResult = www.text;

		//Debug.LogError("Web_GetPlayerData() - Results");

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			if (objJSON["data"] != null)
			{
				JSONObject objJSON_PlayerData = objJSON["data"]["player_data"];

				//Debug.LogError("Web_GetPlayerData() - Triggering Retrieve Function");

				// Trigger the delegate that handles what data we're retrieving.
				func_retrieve_player_data(objJSON_PlayerData);

				// If we have a callback for when data 
				//   retrieval is finished, call it now.
				if (callback_data_retrieved != null)
				{
					callback_data_retrieved(this);
				}
			}
			else
			{
				Debug.LogError("No 'data' JSON object found.");
			}
		}
		else
		{
			Debug.LogError("ERROR - PlayerData.Web_GetPlayerData():\r\n" + objJSON["error"].str);
		}
	}

	public IEnumerator Web_GetPlayerData_Progress
	(
		 bool bYield = true
		,Action<PlayerData> callback_data_retrieved = null
		,Action<string> callback_error = null
	)
	{
		if (_getting_player_data)
		{
			// Exit if we're already getting player data.
			yield return false;
		}
		else
		{
			// Flag that we're getting player data.
			_getting_player_data = true;

			if (   string.IsNullOrEmpty(username)
				|| string.IsNullOrEmpty(password))
			{
				yield return false;
			}
			else
			{
				Debug.Log("== PlayerData - Retrieving Player Progress Data for '" + username + "'");

				//yield return Web_GetPlayerData(Retrieve_PlayerData_Progress, bYield, callback_data_retrieved);

				string strUrl = GLOBAL.GetUrl_Database("auth.php");

				WWWForm wwwForm = new WWWForm();

				wwwForm.AddField("action", "gameload_json");
				wwwForm.AddField("username", username);
				wwwForm.AddField("password", password);

				WWW www = new WWW(strUrl, wwwForm);

				if (bYield)
				{
					yield return www;
				}

				string strResult = www.text;

				Debug.Log("strResult:\n" + strResult);

				if (strResult.Contains("result fail"))
				{
					Debug.LogError("ERROR - PlayerData.Web_GetPlayerData_Progress():\r\n" + strResult);

					// If we have a callback for when recieve an error, call it now.
					if (callback_error != null)
					{
						callback_error(strResult.Trim());
					}
				}
				else
				{
					JSONObject objJSON = new JSONObject(strResult);

					// Trigger the delegate that handles what data we're retrieving.
					Retrieve_PlayerData_Progress(objJSON);

					// If we have a callback for when data 
					//   retrieval is finished, call it now.
					if (callback_data_retrieved != null)
					{
						callback_data_retrieved(this);
					}
				}

				//Debug.LogError("Web_GetPlayerData() - Results");

				// Unflag that we're getting player data.
				_getting_player_data = false;
			}
		}
	}

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

	private IEnumerator Web_SendPlayerData
	(
		Action<JSONObject> func_package_player_data,
		bool bYield = true,
		Action<PlayerData> callback_data_sent = null
	)
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("set_player_data.php");

		// Send the player data to the server.
		JSONObject objJSON_PlayerData = new JSONObject();

		// Trigger the delegate that handles packaging the data we're sending.
		func_package_player_data(objJSON_PlayerData);

		//Debug.LogError(objJSON_PlayerData.ToString());

		string strPlayerData = objJSON_PlayerData.ToString();

		WWWForm wwwForm = new WWWForm();
		wwwForm.AddField("player_data", strPlayerData);
		wwwForm.AddField("key", username);
		wwwForm.AddField("group", group);

		WWW www = new WWW(strUrl, wwwForm);

		if (bYield)
		{
			yield return www;
		}

		string strResult = www.text;

		JSONObject objJSON_Result = new JSONObject(strResult);

		if (   objJSON_Result["error"] == null
			|| objJSON_Result["error"].type == JSONObject.Type.NULL)
		{
			// If we have a callback for when data 
			//   sending is finished, call it now.
			if (callback_data_sent != null)
			{
				callback_data_sent(this);
			}
		}
		else
		{
			Debug.LogError(objJSON_Result["error"].str);
		}
	}

	public IEnumerator Web_SendPlayerData_Progress
	(
		bool bYield = true,
		Action<PlayerData> callback_success = null,
		Action<PlayerData> callback_failure = null
	)
	{
		// Don't save while dialogue is open.
		if (!DialogueOverlay.is_open)
		{
			int i_play_time = (int)Mathf.Floor(play_time);

			// BChance: Update the time played count in seconds.
			GLOBAL.Player.progress["sTimePlayed"] = GLOBAL.Player.progress["sTimePlayed"].i + i_play_time;
			play_time -= i_play_time;
			GLOBAL.Player.progress["tktimeplayed"] = true;

			// Save the tracking data before saving the progress data.
			SaveTrackingData();

			if (   !string.IsNullOrEmpty(username)
				&& !string.IsNullOrEmpty(password))
			{
				Debug.Log("== PlayerData - Sending Player Progress Data for '" + username + "'");

// Peter says skip for now....		this.Log(string.Format("=LOG_DICT_COUNT= Prepping Data for Server - progress entry count: {0}", progress.Count));

				string strUrl = GLOBAL.GetUrl_Database("auth.php");

				Debug.Log("== URL: " + strUrl);

				// Send the player data to the server.
				JSONObject objJSON_PlayerData = new JSONObject();

				// Trigger the delegate that handles packaging the data we're sending.
				Package_PlayerData_Progress(objJSON_PlayerData);

				// Debug.LogError(objJSON_PlayerData.ToString());

				string strPlayerData = objJSON_PlayerData.ToString();

// Peter says skip for now....		this.Log(string.Format("=LOG_JSON_LENGTH= JSON ready for Server - progress entry count: {0}, progress json string length: {1}", progress.Count, strPlayerData.Length));

				Debug.Log("== strPlayerData: ==\n" + strPlayerData);

				WWWForm wwwForm = new WWWForm();
				wwwForm.AddField("action", "gamesave_json");
				wwwForm.AddField("username", username);
				wwwForm.AddField("password", password);
				wwwForm.AddField("json", strPlayerData);

				Debug.Log("JSON:\r\n" + strPlayerData);

				WWW www = new WWW(strUrl, wwwForm);

				if (bYield)
				{
					yield return www;
				}

				string strResult = www.text;

				Debug.Log("RESULT:\n" + strResult);

				if (strResult.Contains("result fail"))
				{
					Debug.LogError("Player.Web_SendPlayerData_Progress() - Server Error:\n" + strResult);

					// If we have a callback for when data 
					//   sending has failed, call it now.
					if (callback_failure != null)
					{
						callback_failure(this);
					}
				}
				else
				{
					// If we have a callback for when data 
					//   sending has succeeded, call it now.
					if (callback_success != null)
					{
						callback_success(this);
					}
				}

				// Let the journal know that data has been saved.
				UI_Journal.DataSaved();
			}
			else
			{
				Debug.LogError("== Unable to save player data because 'username' or 'password' is unset. ==");
			}
		}
	}

	// Taken from old code '/application/tracker.lua'.
	public static void SaveTrackingData()
	{
		Debug.LogError("== SaveTrackingData() ==");

		// Save the tracking data if the proper flags are set.
		if (   !string.IsNullOrEmpty(GLOBAL.Player.username)
			&& !string.IsNullOrEmpty(GLOBAL.Player.password))
		{
			// BChance: Enabled tracking during tutorial.
			// if (GLOBAL.Player.progress["week"].i > 0)
			{
				if (GLOBAL.Player.progress["tkscorestr"].b)
				{
					if (   !string.IsNullOrEmpty(GLOBAL.Player.progress["lcscoreconvo"].str)
						&& !string.IsNullOrEmpty(GLOBAL.Player.progress["lcscorestr"].str))
					{
						GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=progress&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}{1}",GLOBAL.Player.progress["week"].str,GLOBAL.Player.progress["lcscoreconvo"].str),GLOBAL.Player.progress["lcscorestr"].str));
					}
					GLOBAL.Player.progress["lcscoreconvo"] = "";
					GLOBAL.Player.progress["lcscorestr"] = "";
					// GLOBAL.Player.progress["tkscorestr"] = null;
					GLOBAL.Player.progress.Remove("tkscorestr");
				}
				if (GLOBAL.Player.progress["tknlcscorestr"].b)
				{
					if (   !string.IsNullOrEmpty(GLOBAL.Player.progress["nlcscoreconvo"].str)
						&& !string.IsNullOrEmpty(GLOBAL.Player.progress["nlcscorestr"].str))
					{
						GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=progress&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}{1}",GLOBAL.Player.progress["week"].str,GLOBAL.Player.progress["nlcscoreconvo"].str),GLOBAL.Player.progress["nlcscorestr"].str));
					}
					GLOBAL.Player.progress["nlcscoreconvo"] = "";
					GLOBAL.Player.progress["nlcscorestr"] = "";
					// GLOBAL.Player.progress["tknlcscorestr"] = null;
					GLOBAL.Player.progress.Remove("tknlcscorestr");
				}
				if (GLOBAL.Player.progress["tkvendorx"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}vendor",GLOBAL.Player.progress["week"].str),GLOBAL.Player.progress["vendorx"].str));
					// GLOBAL.Player.progress["tkvendorx"] = null;
					GLOBAL.Player.progress.Remove("tkvendorx");
				}
				if (GLOBAL.Player.progress["tkvendor"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}vint",GLOBAL.Player.progress["week"].str),GLOBAL.Player.progress["vendor"].str));
					// GLOBAL.Player.progress["tkvendor"] = null;
					GLOBAL.Player.progress.Remove("tkvendor");
				}
				if (GLOBAL.Player.progress["tkcost"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}cost",GLOBAL.Player.progress["week"].str),GLOBAL.Player.progress["cost"].str));
					// GLOBAL.Player.progress["tkcost"] = null;
					GLOBAL.Player.progress.Remove("tkcost");
				}
				if (GLOBAL.Player.progress["tksessions"].b)
				{
					Debug.LogError("== Tracking Session Count ==");
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"sessions",GLOBAL.Player.progress["sSessions"].str));
					// GLOBAL.Player.progress["tksessions"] = null;
					GLOBAL.Player.progress.Remove("tksessions");
				}
				if (GLOBAL.Player.progress["tktimeplayed"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"timeplayed",GLOBAL.Player.progress["sTimePlayed"].str));
					// GLOBAL.Player.progress["tktimeplayed"] = null;
					GLOBAL.Player.progress.Remove("tktimeplayed");
				}
				if (GLOBAL.Player.progress["tkbusicards"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}cards",GLOBAL.Player.progress["week"].str),GLOBAL.Player.progress["busicards"].str));
					// GLOBAL.Player.progress["tkbusicards"] = null;
					GLOBAL.Player.progress.Remove("tkbusicards");
				}
				if (GLOBAL.Player.progress["tkchattime"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"chattime",GLOBAL.Player.progress["sChatTime"].str));
					// GLOBAL.Player.progress["tkchattime"] = null;
					GLOBAL.Player.progress.Remove("tkchattime");
				}
				if (GLOBAL.Player.progress["tkchatchars"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"chatchars",GLOBAL.Player.progress["sChatChars"].str));
					// GLOBAL.Player.progress["tkchatchars"] = null;
					GLOBAL.Player.progress.Remove("tkchatchars");
				}
				if (GLOBAL.Player.progress["tkjournaltime"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"journaltime",GLOBAL.Player.progress["sJournalTime"].str));
					// GLOBAL.Player.progress["tkjournaltime"] = null;
					GLOBAL.Player.progress.Remove("tkjournaltime");
				}
				if (GLOBAL.Player.progress["tknotepadtime"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"notepadtime",GLOBAL.Player.progress["sNotePadTime"].str));
					// GLOBAL.Player.progress["tknotepadtime"] = null;
					GLOBAL.Player.progress.Remove("tknotepadtime");
				}
				if (GLOBAL.Player.progress["tkickytime"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"ickytime",GLOBAL.Player.progress["sIckyTime"].str));
					// GLOBAL.Player.progress["tkickytime"] = null;
					GLOBAL.Player.progress.Remove("tkickytime");
				}
				if (GLOBAL.Player.progress["tkickyentries"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"ickyentries",GLOBAL.Player.progress["sIckyEntries"].str));
					// GLOBAL.Player.progress["tkickyentries"] = null;
					GLOBAL.Player.progress.Remove("tkickyentries");
				}
				if (GLOBAL.Player.progress["tklibart"].b)
				{
					// BChance: Count the read books.
					int books_read = 0;
					if (GLOBAL.Player.progress["w1b1_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w1b2_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w1b3_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w1b4_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w2b1_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w2b2_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w2b3_read"].b)
						++books_read;
					if (GLOBAL.Player.progress["w2b4_read"].b)
						++books_read;

					GLOBAL.Player.progress["sLibArt"] = books_read;

					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"libarticles",GLOBAL.Player.progress["sLibArt"].str));
					// GLOBAL.Player.progress["tklibart"] = null;
					GLOBAL.Player.progress.Remove("tklibart");
				}
				if (GLOBAL.Player.progress["tknewsart"].b)
				{
					// BChance: Count the read newspapers.
					int newspapers_read = 0;
					if (GLOBAL.Player.progress["w1n1_read"].b)
						++newspapers_read;
					if (GLOBAL.Player.progress["w2n1_read"].b)
						++newspapers_read;
					if (GLOBAL.Player.progress["w3n1_read"].b)
						++newspapers_read;
					if (GLOBAL.Player.progress["w1n2_read"].b)
						++newspapers_read;
					if (GLOBAL.Player.progress["w2n2_read"].b)
						++newspapers_read;
					if (GLOBAL.Player.progress["w3n2_read"].b)
						++newspapers_read;
					// if (GLOBAL.Player.progress["w1n3_read"].b)
					// 	++newspapers_read;
					// if (GLOBAL.Player.progress["w2n3_read"].b)
					// 	++newspapers_read;
					// if (GLOBAL.Player.progress["w3n3_read"].b)
					// 	++newspapers_read;

					GLOBAL.Player.progress["sNewsArt"] = newspapers_read;

					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"newsarticles",GLOBAL.Player.progress["sNewsArt"].str));
					// GLOBAL.Player.progress["tknewsart"] = null;
					GLOBAL.Player.progress.Remove("tknewsart");
				}
				if (GLOBAL.Player.progress["tkplayercash"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"currentcash",GLOBAL.Player.progress["playercash"].str));
					// GLOBAL.Player.progress["tkplayercash"] = null;
					GLOBAL.Player.progress.Remove("tkplayercash");
				}
				if (GLOBAL.Player.progress["tkearnedplayercash"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,"totalcash",GLOBAL.Player.progress["earnedplayercash"].str));
					// GLOBAL.Player.progress["tkearnedplayercash"] = null;
					GLOBAL.Player.progress.Remove("tkearnedplayercash");
				}
				if (GLOBAL.Player.progress["tksidequests"].b)
				{
					GLOBAL.Send_DB_Request(string.Format("gsq.php?u={0}&p={1}&t=tracking&c={2}&v={3}",GLOBAL.Player.username,GLOBAL.Player.password,string.Format("w{0}missions",GLOBAL.Player.progress["week"].str),GLOBAL.Player.progress["sidequests"].str));
					// GLOBAL.Player.progress["tksidequests"] = null;
					GLOBAL.Player.progress.Remove("tksidequests");
				}
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
		if (GLOBAL.Instance != null)
		{
			GLOBAL.Instance.StartCoroutine(Web_Log(text));
		}
	}

	// BChance: Logs a message to the server for the given player/user.
	public IEnumerator Web_Log(string text)
	{
		if (   !string.IsNullOrEmpty(username)
			&& !string.IsNullOrEmpty(password))
		{
			Debug.Log("== PlayerData - Logging message:\n" + text);

			string strUrl = GLOBAL.GetUrl_Database("log.php");

			WWWForm wwwForm = new WWWForm();
			wwwForm.AddField("username", username);
			wwwForm.AddField("text", text);

			WWW www = new WWW(strUrl, wwwForm);

			yield return www;

			string strResult = www.text;

			if (strResult.Length > 0)
			{
				Debug.LogError("Player.Log() - Server Error:\n" + strResult);
			}
		}
		else
		{
			Debug.LogError("== Unable to log message for player because 'username' or 'password' is unset. ==");
		}
	}
};
