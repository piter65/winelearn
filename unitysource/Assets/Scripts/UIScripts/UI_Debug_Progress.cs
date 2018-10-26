using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System;
using System.Collections;

public class UI_Debug_Progress : MonoBehaviour
{
	private static UI_Debug_Progress _instance;

	void Awake()
	{
		_instance = this;
	}
	
	// Update is called once per frame
	void Update()
	{

	}

	void OnDestroy()
	{
        _instance = null;

        // Stop showing the progress report.
        GLOBAL_old.debug_show_progress = false;
    }

	public void Close()
	{
		Destroy(_instance.gameObject);
	}

	public static void Open()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_Debug_Progress", LoadSceneMode.Additive);
		}
	}
}
