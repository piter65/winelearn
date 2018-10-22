using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class UI_Manager_New : MonoBehaviour
{
	private static UI_Manager_New _instance;

	void Awake()
	{
		//Debug.LogError("== UI_Manager_New.Awake() ==");

		_instance = this;

		// BChance: (2016-01-07) - Ensure GLOBALs are setup.
		GLOBAL.Init();

		// BChance: (2016-01-30) - Ensure UI_Instruction is setup.
		UI_Instruction.Load();

		// BChance: (2016-01-08) - Ensure UI_Journal is setup.
		UI_Journal.Load();

		// BChance: (2016-08-27) - Ensure UI_Character_Sheet is setup.
		UI_Character_Sheet.Load();

		//// Dustin: (2016-04-02) - Ensure UI_Inventory is setup.
		//UI_Inventory.Load();

		// Dustin: (2016-05-02) - Ensure UI_MiniMap is setup.
		UI_MiniMap.Load();

		//// BChance: (2016-06-03) - Ensure UI_ChatApp is setup.
		//if (GLOBAL.Player.progress["week"].i != 0)
		//	UI_ChatApp.Load();

		// BChance: (2016-08-27) - Ensure UI_Character_Sheet is setup.
		UI_Game_Options.Load();
	}

	void Start()
	{
		int index_role = GLOBAL.Player.progress["playernum"].i - 1;

		GameObject.Find("ImgRoleIcon").transform.GetChild(index_role).gameObject.SetActive(true);
	}
	
	void Update()
	{
		if (GLOBAL.HotkeysEnabled)
		{
			if (Input.GetKeyUp(KeyCode.Q))
			{
				btn_options_Click();
			}

			if (Input.GetKeyUp(KeyCode.P))
			{
				btn_progress_Click();
			}

			if (Input.GetKeyUp(KeyCode.I))
			{
				btn_inventory_Click();
			}

			if (Input.GetKeyUp(KeyCode.J))
			{
				btn_journal_Click();
			}

			if (Input.GetKeyUp(KeyCode.M))
			{
				btn_map_Click();
			}
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
			// Debug.LogError("== UI_Manager_New.Load() ==");

			SceneManager.LoadScene("UI_Manager", LoadSceneMode.Additive);
		}
	}

	public void btn_map_Click()
	{
		UI_MiniMap.ToggleOpenClose();
		//UI_Inventory.ToggleOpenClose(false);
		UI_Journal.Close();
		UI_Character_Sheet.Close();
		UI_Game_Options.Close();
	}

	public void btn_inventory_Click()
	{
		UI_MiniMap.ToggleOpenClose(false);
		//UI_Inventory.ToggleOpenClose();
		UI_Journal.Close();
		UI_Character_Sheet.Close();
		UI_Game_Options.Close();
	}

	public void btn_journal_Click()
	{
		UI_MiniMap.ToggleOpenClose(false);
		//UI_Inventory.ToggleOpenClose(false);
		UI_Journal.ToggleOpenClose();
		UI_Character_Sheet.Close();
		UI_Game_Options.Close();
	}

	public void btn_progress_Click()
	{
		UI_MiniMap.ToggleOpenClose(false);
		//UI_Inventory.ToggleOpenClose(false);
		UI_Journal.Close();
		UI_Character_Sheet.ToggleOpenClose();
		UI_Game_Options.Close();
	}

	public void btn_options_Click()
	{
		UI_MiniMap.ToggleOpenClose(false);
		//UI_Inventory.ToggleOpenClose(false);
		UI_Journal.Close();
		UI_Character_Sheet.Close();
		UI_Game_Options.ToggleOpenClose();
	}
}
