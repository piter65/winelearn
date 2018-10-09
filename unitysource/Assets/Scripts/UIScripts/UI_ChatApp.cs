using UnityEngine;
using System;
using System.Text;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using System.Text.RegularExpressions;

public class UI_ChatApp : MonoBehaviour
{
	private static UI_ChatApp _instance;

	public Text txt_Messages;
	public InputField input_Username;
	public InputField input_Room;
	public InputField input_MessageText;
	public ScrollRect scrollrect;
	public float UpdatesPerSecond = 4.0f;

	private StringBuilder _strbMessages = new StringBuilder();
	private DateTime _timestamp_LastMessageRecieved = DateTime.MinValue;

	private string _strLastUpdateTimestamp = null;

	private float _fTimeSinceLastUpdate = 0.0f;

	private float _time_typing = 0.0f;

	private static bool _bGettingMessages = false;
	private static bool _bSendingMessage = false;

	private bool _bStarted = false;

	private AudioSource _audioSource;
	public GameObject chatPanel;

	public static bool isSelectInput = false;

	void Awake()
	{
		_instance = this;
		
		// Ensure GLOBALs are setup.
		GLOBAL.Init();
	}

	void Start()
	{
		_audioSource = GetComponent<AudioSource>();

		System.Random rand = new System.Random();
		// input_Username.text = rand.Next(1, 1000).ToString();
		// input_Room.text = "7";

		input_Username.text = GLOBAL.Player.username;
		//input_Room.text = GLOBAL.PlayerGroup;

		//_strbMessages.AppendLine("ROOM " + input_Room.text);
		_strbMessages.AppendLine("ROOM " + GLOBAL.Player.group);
		scrollrect.verticalNormalizedPosition = 0;
		txt_Messages.GetComponent<RectTransform>().sizeDelta = new Vector2(0,40);
		StartCoroutine(Web_GetMessages(false));

		_bStarted = true;
	}

	void Update()
	{

		_fTimeSinceLastUpdate += Time.deltaTime;

		if (!_bGettingMessages)
		{
			if (_fTimeSinceLastUpdate >= 1.0f / UpdatesPerSecond)
			{
				//Debug.Log("Update");

				_fTimeSinceLastUpdate = 0.0f;
				StartCoroutine(Web_GetMessages());
			}
		}

//		Debug.LogError(EventSystem.current.currentSelectedGameObject);

		if (   EventSystem.current == null
			|| EventSystem.current.currentSelectedGameObject == null)
		{
			isSelectInput = false;
		}
		else
		{
			isSelectInput = true;
		}

		if (Input.GetKeyUp(KeyCode.Return))
		{
			if (input_MessageText.gameObject == EventSystem.current.currentSelectedGameObject)
			{
				btn_Send_Click();
			}
		}

		// If the message text is focused, track the time spent typing.
		if (input_MessageText.isFocused)
		{
			// Message that isn't empty indicates typing, so add time.
			if (input_MessageText.text.Length > 0)
			{
				_time_typing += Time.deltaTime;
			}
			// No message indicates no typing, so clear time.
			else
			{
				_time_typing = 0.0f;
			}
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
		{
			_instance = null;
			_bGettingMessages = false;
			_bSendingMessage = false;
			isSelectInput = false;
		}
	}

	public static void Load()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_ChatApp", LoadSceneMode.Additive);
		}
	}

	private IEnumerator Web_GetMessages(bool beep = true)
	{
		_bGettingMessages = true;

		string strUrl = GLOBAL.GetUrl_Multiplayer("get_messages.php");

		//Debug.Log("Web_GetMessages() - strUrl: " + strUrl);

		WWWForm wwwForm = new WWWForm();

		// Debug.Log("input_Room: " + input_Room.text);

		//Debug.Log(string.Format("room: '{0}', timestamp: '{1}'", GLOBAL.Player.group, _strLastUpdateTimestamp));

		//wwwForm.AddField("room", input_Room.text);
		wwwForm.AddField("room", GLOBAL.Player.group);
		if (_strLastUpdateTimestamp != null)
			wwwForm.AddField("timestamp", _strLastUpdateTimestamp);

		// Debug.Log("-- Set to Update Messages. --");

		WWW www = new WWW(strUrl, wwwForm);
		yield return www;

		// Debug.Log("-- Web Result Received. --");

		string strResult = www.text;

		//Debug.Log(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			if (objJSON["data"] != null)
			{				
				//Debug.Log(objJSON["data"].ToString());

				if (objJSON["data"]["message_list"].type == JSONObject.Type.ARRAY)
				{
					//Debug.Log("objJSON_MessageList: " + objJSON["data"]["message_list"] == null);
					List<JSONObject> objJSON_MessageList = objJSON["data"]["message_list"].list;

					for (int iMessageIndex = 0; iMessageIndex < objJSON_MessageList.Count; ++iMessageIndex)
					{
						JSONObject objJSON_Message = objJSON_MessageList[iMessageIndex];

						string strText      = Regex.Unescape(objJSON_Message["text"].str);
						string strUsername  = objJSON_Message["username"].str;
						string strTimestamp = objJSON_Message["timestamp"].str;
						DateTime dtTimestap = Convert.ToDateTime(strTimestamp);
						string strMessage = string.Format("[{0}] ({1}) {2}", dtTimestap.ToString("hh:mm"), strUsername, strText);

						_strbMessages.AppendLine(strMessage);
					}

					if (objJSON_MessageList.Count > 0)
					{
						if (objJSON["data"]["timestamp"] != null)
							_strLastUpdateTimestamp = objJSON["data"]["timestamp"].str;
					}
				}

				// string strMessages = _strbMessages.ToString() + "\n";
				string strMessages = _strbMessages.ToString();

				if (txt_Messages.text.Length != strMessages.Length)
				{
					txt_Messages.text = strMessages;

					yield return new WaitForEndOfFrame();

					scrollrect.verticalNormalizedPosition = 0;

					if (beep)
					{
						_audioSource.Play();
						ChatWindowEffect.isChatWindowEnable = true;
					}
				}

				txt_Messages.GetComponent<RectTransform>().sizeDelta = new Vector2(0,txt_Messages.preferredHeight);


				// Debug.Log("-- Update Complete. --");
			}
			else
			{
				Debug.Log("No 'data' JSON object found.");
			}
		}
		else
		{
			Debug.Log(objJSON["error"].str);
		}

		_bGettingMessages = false;
	}

	private IEnumerator Web_SendMessage()
	{
		if (!_bSendingMessage)
		{
			_bSendingMessage = true;

			string strUrl = GLOBAL.GetUrl_Multiplayer("send_message.php");
			WWWForm wwwForm = new WWWForm();
			wwwForm.AddField("text", input_MessageText.text);
			//wwwForm.AddField("text", GameObject.Find ("Player_Character").transform.position.ToString());
			wwwForm.AddField("username", input_Username.text);
			//wwwForm.AddField("room", input_Room.text);
			wwwForm.AddField("room", GLOBAL.Player.group);

			// Debug.Log("-- Set to Send Message. --");

		

			WWW www = new WWW(strUrl, wwwForm);
			yield return www;

			_bSendingMessage = false;

			// Debug.Log("-- Web Result Received. --"+www.text);

			string strResult = www.text;

			Debug.Log(strResult);

			JSONObject objJSON = new JSONObject(strResult);

			if (   objJSON["error"] == null
				|| objJSON["error"].type == JSONObject.Type.NULL)
			{
				Debug.Log("-- Send Complete. --");

				// BChance: Track the flagged data.
				PlayerData.SaveTrackingData();
			}
			else
			{
				Debug.Log("-- error Complete. --");
				Debug.Log(objJSON["error"].str);
			}
		}
	}

	public void btn_Send_Click()
	{
		if (input_MessageText.text.Length > 0)
		{
			// BChance: Increment the chat chars count and chat time in seconds, and flag the them for tracking.
			GLOBAL.Player.progress["sChatChars"] = GLOBAL.Player.progress["sChatChars"].i + input_MessageText.text.Length;
			GLOBAL.Player.progress["sChatTime"] = GLOBAL.Player.progress["sChatTime"].i + (int)Mathf.Round(_time_typing);
			GLOBAL.Player.progress["tkchattime"] = true;
			GLOBAL.Player.progress["tkchatchars"] = true;

			// Clear the typing time.
			_time_typing = 0.0f;

			StartCoroutine(Web_SendMessage());
			scrollrect.verticalNormalizedPosition = 0;
			input_MessageText.text = "";
			input_MessageText.ActivateInputField();
		}
	}

	public void input_Room_Change(string strValue)
	{
		if (_bStarted)
		{
			if (input_Room.text.Length > 0)
			{
				// Clear the messages.
				_strbMessages.Remove(0, _strbMessages.Length);
				_strbMessages.AppendLine("ROOM " + input_Room.text);
				txt_Messages.text = _strbMessages.ToString();

				_strLastUpdateTimestamp = null;
				scrollrect.verticalNormalizedPosition = 0;
				// Get the messages for the room number.
				_fTimeSinceLastUpdate = 0.0f;
				StartCoroutine(Web_GetMessages(false));
			}
		}
	}
}
