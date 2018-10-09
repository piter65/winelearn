using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using UnityEngine.UI;

public class UI_Instruction : MonoBehaviour
{
	private static UI_Instruction _instance;

	public Text txt_TalkToEvelyn;
	public Text txt_Notification;

	private Animator _animator_Notification;

	void Awake()
	{
		_instance = this;
	}

	// Use this for initialization
	void Start()
	{
		_animator_Notification = txt_Notification.GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update()
	{
		// If we're playing the tutorial and haven't talked to Evelyn yet, display the message on the HUD.
		if (   GLOBAL.Player.progress["week"].i == 0
			&& GLOBAL.Player.progress["talked_to_evelyn"].b == false)
		{
			txt_TalkToEvelyn.gameObject.SetActive(true);
		}
		else
		{
			txt_TalkToEvelyn.gameObject.SetActive(false);
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	public static void Load()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_Instruction", LoadSceneMode.Additive);
		}
	}

	public static void Notify(string notification)
	{
		_instance.txt_Notification.text = notification;
		_instance._animator_Notification.SetTrigger("show");
	}
}
