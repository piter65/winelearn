using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;
using TMPro;

public class UILandingScreen : MonoBehaviour
{
	public GameObject grp_ui;
	public TMP_Text txt_message_server;

	public Text txt_version;

	public GameObject btn_Login;
	public GameObject btn_Tutorial;
	public GameObject btn_MetricsTest;
	public GameObject btn_TaskPicker;

	private bool is_config_retrieved = false;

	void Start()
	{
		Debug.Log("-- Destroying all...");

		// Kill all the permanent objects.
		DontDestroy.DestroyAll();

		Debug.Log("-- All destroyed.");

		StartCoroutine(CONFIG_old.Web_GetConfigData(true, ServerConfigRecieved));
	}
	
	void Update()
	{
		if (is_config_retrieved)
		{
			if (!CONFIG_old.TROUBLESHOOT_ONLY)
			{
				// Alt + T + S + K triggers showing the task picker button.
				if (   Input.GetButton("Alt")
					&& Input.GetKey(KeyCode.T)
					&& Input.GetKey(KeyCode.S)
					&& Input.GetKey(KeyCode.K))
				{
					if (!btn_TaskPicker.activeSelf)
					{
						btn_TaskPicker.SetActive(true);
					}
				}
			}
		}
	}

	public void ServerConfigRecieved(string error_message)
	{
		if (error_message != null)
		{
			txt_message_server.text = string.Format("Server Error:\n{0}", error_message);
			txt_message_server.color = Color.red;
		}
		else
		{
			txt_message_server.gameObject.SetActive(false);
			grp_ui.SetActive(true);

			is_config_retrieved = true;

			txt_version.text = "v." + CONFIG_old.VERSION;

			// If we're flagged for troubleshoot only, only allow the metrics test.
			if (CONFIG_old.TROUBLESHOOT_ONLY)
			{
				btn_Login.SetActive(false);
				btn_Tutorial.SetActive(false);
			}
			else
			{
				btn_Login.SetActive(true);
				btn_Tutorial.SetActive(true);
			}

			btn_TaskPicker.SetActive(false);
		}
	}

	public void btn_Login_Click()
	{
		SceneManager.LoadScene("Login");
	}

	public void btn_Tutorial_Click()
	{
		StartCoroutine(LoadTutorial());
	}

	public void btn_MetricsTest_Click()
	{
		SceneManager.LoadScene("UIMetricsDialog");
	}

	public void btn_TaskPicker_Click()
	{
		SceneManager.LoadScene("task_picker");
	}

	private IEnumerator LoadTutorial()
	{
		GLOBAL_old.Init();

		yield return new WaitForSeconds(0.1f);

		// Set flags for the tutorial.
		GLOBAL_old.Player.progress["playernum"] = 1;
		GLOBAL_old.Player.progress["week"] = 0;

		SceneManager.LoadScene("character_customizer");
	}
}
