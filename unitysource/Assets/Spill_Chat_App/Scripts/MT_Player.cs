using UnityEngine;
using System;
using System.Collections;

public class MT_Player : MonoBehaviour
{
	public string PlayerName;
	public float UpdatesPerSecond = 4.0f;

	public bool isProxy = true;

	public float speed = 7.0f;

	private Rigidbody _rigidbody;

	private float _fTimeSinceLastUpdate = 0.0f;
	private bool _bDestroying = false;

	// Use this for initialization
	void Start()
	{
		System.Random rand = new System.Random();
		PlayerName = "player_" + rand.Next(1, 100000).ToString();

		_rigidbody = GetComponent<Rigidbody>();
	}
	
	// Update is called once per frame
	void Update()
	{
		if (!_bDestroying)
		{
			if (!isProxy)
			{
				_fTimeSinceLastUpdate += Time.deltaTime;

				if (_fTimeSinceLastUpdate >= 1.0f / UpdatesPerSecond)
				{
					_fTimeSinceLastUpdate = 0.0f;

					// Send the player data to the server.
					JSONObject objJSON_PlayerData = new JSONObject();

					objJSON_PlayerData.AddField("last_update_time", DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss"));
					objJSON_PlayerData.AddField("x", transform.position.x);
					objJSON_PlayerData.AddField("y", transform.position.y);
					objJSON_PlayerData.AddField("z", transform.position.z);
					objJSON_PlayerData.AddField("angle_yaw", 0.0f);

					StartCoroutine(Web_SendData(objJSON_PlayerData.ToString()));
				}
			}
		}
	}

	void FixedUpdate()
	{
		if (!isProxy)
		{
			float fInputX = Input.GetAxis("Horizontal");
			float fInputZ = Input.GetAxis("Vertical");

			Vector3 vInputDir = new Vector3(fInputX, 0.0f, fInputZ);
			if (vInputDir.magnitude > 1.0f)
				vInputDir.Normalize();

			Vector3 vVelocity = vInputDir * speed;
			vVelocity.y = _rigidbody.velocity.y;

			_rigidbody.velocity = vVelocity;
		}
	}

	void OnDestroy()
	{
		if (!isProxy)
		{
			_bDestroying = true;

			// Send the player data to the server.
			JSONObject objJSON_PlayerData = new JSONObject();

			// Notify the server that the player has disconnected.
			objJSON_PlayerData.AddField("connected", false);
			objJSON_PlayerData.AddField("x", transform.position.x);
			objJSON_PlayerData.AddField("y", transform.position.y);
			objJSON_PlayerData.AddField("z", transform.position.z);
			objJSON_PlayerData.AddField("angle_yaw", 0.0f);

			// Send the data without yielding.
			Web_SendData(objJSON_PlayerData.ToString(), false);
		}
	}

	private IEnumerator Web_SendData(string strPlayerData, bool bYield = true)
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("set_player_data.php");

		WWWForm wwwForm = new WWWForm();
		wwwForm.AddField("player_data", strPlayerData);
		wwwForm.AddField("key", PlayerName);
		wwwForm.AddField("group", MT_PlayerProxyController.INSTANCE.PlayerGroup);

		// print("-- Set to Send Message. --");

		WWW www = new WWW(strUrl, wwwForm);

		if (bYield)
		{
			yield return www;
		}

		// print("-- Web Result Received. --");

		string strResult = www.text;

		print(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			// print("-- Send Complete. --");
		}
		else
		{
			print(objJSON["error"].str);
		}
	}
}
