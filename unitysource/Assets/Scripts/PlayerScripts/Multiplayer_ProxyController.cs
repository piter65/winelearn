using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class Multiplayer_ProxyController : MonoBehaviour
{
	public static Multiplayer_ProxyController Instance;

	public float UpdatesPerSecond = 8.0f;
	public int ProxyTimeout = 5;

	public Multiplayer_Entity prefab_Character_Player;
	public Multiplayer_Entity currentPlayer;

	public Dictionary<string, Multiplayer_Entity> _dictPlayerProxies = new Dictionary<string, Multiplayer_Entity>();

	private float _fTimeSinceLastUpdate = 0.0f;

	void Awake()
	{
		Instance = this;
	}

	// Use this for initialization 
	void Start()
	{
		currentPlayer = GameObject.FindWithTag("Player").GetComponent<Multiplayer_Entity>();
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
		if (Instance == this)
			Instance = null;
	}

	// Called by Multiplayer_Entity when a proxy's lifespan runs out.
	public void KillProxy(string strUsername)
	{
		// If the proxy is still present, destroy it.
		if (_dictPlayerProxies.ContainsKey(strUsername))
		{
			Multiplayer_Entity proxy = _dictPlayerProxies[strUsername];
			_dictPlayerProxies.Remove(strUsername);

			Destroy(proxy.gameObject);
		}
	}

	private IEnumerator Web_GetPlayerData()
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("get_player_data.php");

		// print("Web_GetPlayerData() - strUrl: " + strUrl);

		WWWForm wwwForm = new WWWForm();

		// print("input_Group: " + input_Group.text);

		wwwForm.AddField("group", GLOBAL.Player.group);
		wwwForm.AddField("timeout", ProxyTimeout);

		// print("-- Set to Update Messages. --");

		WWW www = new WWW(strUrl, wwwForm);
		yield return www;

		// print("-- Web Result Received. --");

		string strResult = www.text;

		// print("get");
		// print(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			if (objJSON["data"] != null)
			{
				// print(objJSON["data"]["player_data"].ToString(true));

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
				if (!GLOBAL.Player.username.Equals(strKey))
				{
					JSONObject objJSON_Player = objJSON_PlayerData[strKey];

					Multiplayer_Entity proxy;

					// If we already have a proxy for the player, retrieve it.
					if (_dictPlayerProxies.ContainsKey(strKey))
					{
						// Debug.Log(string.Format("== Proxy {0} reused. ==", strKey));

						proxy = _dictPlayerProxies[strKey];
					}
					// Otherwise, create a proxy for the player.
					else
					{
						Vector3 position =
							new Vector3
							(
								// BChance: Convert the position values from int to float.
								objJSON_Player["x"].f * 0.001f,
								objJSON_Player["y"].f * 0.001f,
								objJSON_Player["z"].f * 0.001f
							);


// More peter messing around with dual system

				//Quaternion rotation = Quaternion.AngleAxis(objJSON_Player["angle_yaw"].f, Vector3.up);

							Quaternion rotation = Quaternion.AngleAxis(objJSON_Player["yaw"].f, Vector3.up);
	


						bool isMale = true;
						int index_BodyModel = 0;
						int index_HairModel = 0;
						int index_SkinColor = 0;
						int index_HairColor = 0;

						// Retrieve the isMale flag.
						if (objJSON_Player["isMale"] != null)
						{
							isMale = objJSON_Player["isMale"].b;
						}
						// Peter was here.  I'm trying to make these flags a little shorter.
						// For now, using dualing systems.....
						else if (objJSON_Player["boy"] != null)
						{
							isMale = objJSON_Player["boy"].b;
						}


						// Retrieve the index_BodyModel index.
						if (objJSON_Player["index_BodyModel"] != null)
						{
							index_BodyModel = (int)objJSON_Player["index_BodyModel"].i;
						}

						// Peter was here.  I'm trying to make these flags a little shorter.
						// For now, using dualing systems.....
						else if (objJSON_Player["i_BM"] != null)
						{
							index_BodyModel = (int)objJSON_Player["i_BM"].i;
						}

						// Retrieve the index_HairModel index.
						if (objJSON_Player["index_HairModel"] != null)
						{
							index_HairModel = (int)objJSON_Player["index_HairModel"].i;
						}
						// Peter was here.  I'm trying to make these flags a little shorter.
						// For now, using dualing systems.....
						else if (objJSON_Player["i_HM"] != null)
						{
							index_HairModel = (int)objJSON_Player["i_HM"].i;
						}

						// Retrieve the index_SkinColor index.
						if (objJSON_Player["index_SkinColor"] != null)
						{
							index_SkinColor = (int)objJSON_Player["index_SkinColor"].i;
						}
						// Peter trying shorter tokens...      Skin Color
						else if (objJSON_Player["i_SC"] != null)
						{
							index_SkinColor = (int)objJSON_Player["i_SC"].i;
						}

						// Retrieve the index_HairColor index.
						if (objJSON_Player["index_HairColor"] != null)
						{
							index_HairColor = (int)objJSON_Player["index_HairColor"].i;
						}
						// Peter making things shorter, and less clear.
						else if (objJSON_Player["i_HC"] != null)
						{
							index_HairColor = (int)objJSON_Player["i_HC"].i;
						}


						//Debug.LogError("position: " + position);

						proxy = SpawnProxy
							(
								strKey,
								position,
								rotation,
								isMale,
								index_BodyModel,
								index_HairModel,
								index_SkinColor,
								index_HairColor
							);
					}

					// Update the proxy's position.
					proxy.proxy_PrevPosition = proxy.transform.position;
			
					proxy.proxy_TargetPosition =
						new Vector3
						(
							// BChance: Convert the position values from int to float.
							objJSON_Player["x"].f * 0.001f,
							objJSON_Player["y"].f * 0.001f,
							objJSON_Player["z"].f * 0.001f
						);
					
					// Update the proxy's rotation.
					proxy.proxy_PrevRotation = proxy.transform.rotation;
					proxy.proxy_TargetRotation = Quaternion.AngleAxis(objJSON_Player["angle_yaw"].f, Vector3.up);

					proxy.timeSinceLastProxyUpdate = 0.0f;
				}
			}
		}
		
		
	}

	public Multiplayer_Entity SpawnProxy
	(
		string strKey,
		Vector3 position,
		Quaternion rotation,
		bool isMale = true,
		int index_BodyModel = 0,
		int index_HairModel = 0,
		int index_SkinColor = 0,
		int index_HairColor = 0
	)
	{
		Multiplayer_Entity proxy;

		proxy = Instantiate(prefab_Character_Player);
		proxy.isProxy = true;
		proxy.username = strKey;

		// Set the proxy's position.
		proxy.transform.position = position;

		// Update the proxy's rotation.
		proxy.transform.rotation = rotation;
		proxy.proxy_TargetRotation = proxy.transform.rotation;

		// Set the appearance settings.
		proxy.isMale = isMale;
		proxy.index_BodyModel = index_BodyModel;
		proxy.index_HairModel = index_HairModel;
		proxy.index_SkinColor = index_SkinColor;
		proxy.index_HairColor = index_HairColor;

		Debug.Log("-- Added Proxy: '" + strKey + "' --");

		_dictPlayerProxies.Add(strKey, proxy);

		return proxy;
	}
}
