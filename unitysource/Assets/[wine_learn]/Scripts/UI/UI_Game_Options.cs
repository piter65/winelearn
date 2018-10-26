using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using UnityEngine.UI;

public class UI_Game_Options : MonoBehaviour
{
	public GameObject canvas;
	public Button btn_Quit;
	public Toggle tgl_LoadAudio;

	private static UI_Game_Options _instance;

	void Awake()
	{
		_instance = this;

		// BChance: (2016-01-07) - Ensure GLOBALs are setup.
		GLOBAL_old.Init();
	}

	void Start()
	{
		tgl_LoadAudio.isOn = DialogueOverlay.disable_dialogue_audio_loading;

		// Hide by default.
		UI_Game_Options.Close();
	}

	void Update()
	{
		// Don't allow quitting the game while dialogue is open.
		btn_Quit.gameObject.SetActive(!DialogueOverlay.is_open);
	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	public void btn_Close_Click()
	{
		UI_Game_Options.Close();
	}

	public void btn_Quit_Click()
	{
		Debug.Log("== btn_Quit_Click()");

		GLOBAL_old.QuitGame();
	}

	public void tgl_LoadAudio_ValueChanged(bool is_on)
	{
		DialogueOverlay.disable_dialogue_audio_loading = is_on;
	}

	public static void Load()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_Game_Options", LoadSceneMode.Additive);
		}
	}

	public static void Open()
	{
		_instance.canvas.SetActive(true);
	}

	public static void Close()
	{
		_instance.canvas.SetActive(false);
	}

	public static void ToggleOpenClose()
	{
		// Toggle the visibility of the Journal UI.
		_instance.canvas.SetActive(!_instance.canvas.activeSelf);

		Debug.Log("UI_Game_Options - ToggleOpenClose() - Active: " + _instance.canvas.activeSelf);
	}
}
