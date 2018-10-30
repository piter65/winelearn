using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class User
{
	public bool is_loaded = false;
	public bool is_valid = false;
	public string username = null;
	public string password = null;
	public EasyDictionary<string, MultiType> data = new EasyDictionary<string, MultiType>();

	public void Clear()
	{
		is_loaded = false;
		is_valid = false;
		username = null;
		password = null;
		data.Clear();
	}

	public void Load(string username, string password, Action callback_success = null, Action callback_failure = null)
	{
		Clear();

		this.username = username;
		this.password = password;
	}

	public void LoadDefault(Action callback_success = null, Action callback_failure = null)
	{
		Clear();

		// TODO: Look at 'MEC'/'Timing' docs.

		StartCouroutine(Web_GetUserData(callback_success, callback_failure));
	}



	private IEnumerator Web_GetUserData(Action callback_success, Action callback_failure)
	{
		string filename = "user;pass.json";

		// If we have a username and password, look for their data file.
		if (   !string.IsNullOrEmpty(username)
			&& !string.IsNullOrEmpty(password))
		{
			filename = username + ";" + password + ".json";
		}

		string path = CONFIG.GamePath("data/" + filename);

		WWW www = new WWW(path);
		yield return www;

		string json = www.text;

		if (!string.IsNullOrEmpty(json))
		{
			JsonToData(json);

			// If we have a valid username or password, unflag the user as a guest.
			if (   !string.IsNullOrEmpty(username)
				&& !string.IsNullOrEmpty(password))
			{
				is_valid = true;
			}

			is_loaded = true;

			// Trigger the callback.
			if (callback_success != null)
				callback_success.Invoke();
		}
		else
		{
			Debug.LogErrorFormat("Unable retrieve file '{0}'. Either file does not exist, or it is empty.", path);

			// Trigger the callback.
			if (callback_failure != null)
				callback_failure.Invoke();
		}
	}

	private void JsonToData(string json)
	{
		JSONObject objJSON_data = new JSONObject(json);

		foreach (string key in objJSON_data.keys)
		{
			JSONObject objJSON_value = objJSON_data[key];

			switch (objJSON_value.type)
			{
				case JSONObject.Type.BOOL:
					{
						data[key] = objJSON_value.b;
					}
					break;
				case JSONObject.Type.NUMBER:
					{
						data[key] = (int)objJSON_value.i;
					}
					break;
				case JSONObject.Type.STRING:
				case JSONObject.Type.NULL:
					{
						data[key] = objJSON_value.str;
					}
					break;
				case JSONObject.Type.ARRAY:
					{
						Debug.LogErrorFormat("Array values are not currently supported as user data. Key: '{0}'", key);
						data[key] = new MultiType(MultiTypeType.UNKNOWN);
					}
					break;
				case JSONObject.Type.OBJECT:
				case JSONObject.Type.BAKED:
					{
						Debug.LogErrorFormat("Object values are not currently supported as user data. Key: '{0}'", key);
						data[key] = new MultiType(MultiTypeType.UNKNOWN);
					}
					break;
				default:
					{
						Debug.LogErrorFormat("Unable to identify user data value type. Key: '{0}'.", key);
						data[key] = new MultiType(MultiTypeType.UNKNOWN);
					}
					break;
			}
		}
	}
}
