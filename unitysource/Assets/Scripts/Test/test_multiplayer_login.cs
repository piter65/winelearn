using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class test_multiplayer_login : MonoBehaviour
{
	public InputField input_Username;
	public InputField input_Group;

	// Use this for initialization
	void Start()
	{
		input_Username.text = "Tester " + Random.Range(1, 10);
		input_Group.text = "Test_Group";
	}
	
	// Update is called once per frame
	void Update()
	{
	
	}

	public void btn_Go_Click()
	{
		GLOBAL.Player.username = input_Username.text;
		GLOBAL.Player.group = input_Group.text;
		GLOBAL.Player.progress["isMale"] = false;
		GLOBAL.Player.progress["index_BodyModel"] = Random.Range(0, 4);
		GLOBAL.Player.progress["index_HairModel"] = 0;

		print("-- Sending Data... --");

		StartCoroutine(Web_SendData());
	}

	private string GetAndSetPlayerData()
	{
		// Setup the player data to send to the server.
		JSONObject objJSON_PlayerData = new JSONObject();

		objJSON_PlayerData.AddField("last_update_time", System.DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss"));
		objJSON_PlayerData.AddField("isMale", GLOBAL.Player.progress["isMale"].b);
		objJSON_PlayerData.AddField("index_BodyModel", GLOBAL.Player.progress["index_BodyModel"].i);
		objJSON_PlayerData.AddField("index_HairModel", GLOBAL.Player.progress["index_HairModel"].i);

		return objJSON_PlayerData.ToString();
	}

	private IEnumerator Web_SendData()
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("set_player_data.php");

		WWWForm wwwForm = new WWWForm();
		wwwForm.AddField("player_data", GetAndSetPlayerData());
		wwwForm.AddField("key", GLOBAL.Player.username);
		wwwForm.AddField("group", GLOBAL.Player.group);

		print("-- Set to Send Message. --");

		WWW www = new WWW(strUrl, wwwForm);

		yield return www;

		print("-- Web Result Received. --");

		string strResult = www.text;

		print(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			print("-- Send Complete. --");
		}
		else
		{
			Debug.LogError("ERROR - test_multiplayer_login.Web_SendData():\r\n" + objJSON["error"].str);
		}

		// Start playing the scene.
		SceneManager.LoadScene("test_multiplayer");
	}
}
