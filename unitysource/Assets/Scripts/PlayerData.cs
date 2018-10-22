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
		if (GLOBAL.Instance != null)
		{
			GLOBAL.Instance.StartCoroutine(Web_Log(text));
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
