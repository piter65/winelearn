using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class MT_PlayerProxyController : MonoBehaviour
{
	public static MT_PlayerProxyController INSTANCE;

	public string PlayerGroup = "group_7";
	public float UpdatesPerSecond = 4.0f;
	public int ProxyTimeout = 60;

	public MT_Player prefab_Character_Player;
	public MT_Player currentPlayer;

	public Dictionary<string, MT_Player> _dictPlayerProxies = new Dictionary<string, MT_Player>();

	private float _fTimeSinceLastUpdate = 0.0f;

	void Awake()
	{
		INSTANCE = this;
	}

	// Use this for initialization
	void Start()
	{
	
	}
	
	// Update is called once per frame
	void Update()
	{
		_fTimeSinceLastUpdate += Time.deltaTime;

		if (_fTimeSinceLastUpdate >= 1.0f / UpdatesPerSecond)
		{
			_fTimeSinceLastUpdate = 0.0f;
			StartCoroutine(Web_GetPlayerData());
		}
	}

	void OnDestroy()
	{
		if (INSTANCE == this)
			INSTANCE = null;
	}

	private IEnumerator Web_GetPlayerData()
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("get_player_data.php"); 

		// print("Web_GetPlayerData() - strUrl: " + strUrl);

		WWWForm wwwForm = new WWWForm();

		// print("input_Group: " + input_Group.text);

		wwwForm.AddField("group", PlayerGroup);

		// print("-- Set to Update Messages. --");

		WWW www = new WWW(strUrl, wwwForm);
		yield return www;

		// print("-- Web Result Received. --");

		string strResult = www.text;

		// print(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			if (objJSON["data"] != null)
			{
				print(objJSON["data"]["player_data"].ToString(true));

				ProcessPlayerData(objJSON["data"]["player_data"]);

				// print("-- Update Complete. --");
			}
			else
			{
				print("No 'data' JSON object found.");
			}
		}
		else
		{
			print(objJSON["error"].str);
		}
	}

	private void ProcessPlayerData(JSONObject objJSON_PlayerData)
	{
		if (objJSON_PlayerData.keys != null)
		{
			for (int iListIndex = 0; iListIndex < objJSON_PlayerData.keys.Count; ++iListIndex)
			{
				string strKey = objJSON_PlayerData.keys[iListIndex];

				// If the player isn't the current player, handle the proxy.
				if (!currentPlayer.PlayerName.Equals(strKey))
				{
					JSONObject objJSON_Player = objJSON_PlayerData[strKey];

					MT_Player proxy;

					if (   objJSON_Player["last_update_time"] != null
						&& objJSON_Player["last_update_time"].type != JSONObject.Type.NULL)
					{
						string strLastUpdateTime = objJSON_Player["last_update_time"].str;
						DateTime dtLastUpdateTime = DateTime.Parse(strLastUpdateTime, null, System.Globalization.DateTimeStyles.RoundtripKind);

						// print("dtLastUpdateTime: " + dtLastUpdateTime.ToString("yyyy-MM-dd HH:mm:ss"));
						// print(" DateTime.UtcNow: " + DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss"));

						TimeSpan tsDiff = DateTime.UtcNow - dtLastUpdateTime;

						// print("tsDiff.TotalSeconds: " + tsDiff.TotalSeconds);

						if (tsDiff.TotalSeconds < ProxyTimeout)
						{
							// If we already have a proxy for the player, retrieve it.
							if (_dictPlayerProxies.ContainsKey(strKey))
							{
								proxy = _dictPlayerProxies[strKey];
							}
							// Otherwise, create a proxy for the player.
							else
							{
								proxy = Instantiate(prefab_Character_Player);
								proxy.GetComponent<Rigidbody>().isKinematic = true;
								proxy.GetComponent<Rigidbody>().useGravity = false;

								_dictPlayerProxies.Add(strKey, proxy);
							}

							// Update the proxy's position.
							proxy.transform.position =
								new Vector3
								(
									objJSON_Player["x"].f,
									objJSON_Player["y"].f,
									objJSON_Player["z"].f
								);
						}
						else
						{
							// If the proxy is still present, destroy it.
							if (_dictPlayerProxies.ContainsKey(strKey))
							{
								proxy = _dictPlayerProxies[strKey];
								_dictPlayerProxies.Remove(strKey);

								Destroy(proxy.gameObject);
							}
						}
					}
				}
			}
		}
		
	}
}
