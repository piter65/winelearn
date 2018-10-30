using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class UI_Task_Picker : MonoBehaviour
{
	public Text txt_version;
	public ToggleGroup roles_group;
	public ToggleGroup tasks_group;

	// Use this for initialization
	void Start()
	{

		txt_version.text = "v." + CONFIG_old.VERSION;

		GLOBAL_old.Init();


		//Set_Task(2, true);
		//Set_Role(2, true);

	}

	public void Update()
	{
		bool is_alt_down = Input.GetButton("Alt");

		//// Loop thru and only allow role selection if Alt key is down.
		//for (int index_role = 0; index_role < roles_group.transform.childCount; ++index_role)
		//{
		//	roles_group.transform.GetChild(index_role).GetComponent<Toggle>().interactable = is_alt_down;
		//}
		// Loop thru and only allow task selection if Alt key is down.
		for (int index_task = 0; index_task < tasks_group.transform.childCount; ++index_task)
		{
			tasks_group.transform.GetChild(index_task).GetComponent<Toggle>().interactable = is_alt_down;
		}
	}

	public void Set_Role(int role, bool lockIt)
	{

		roles_group.SetAllTogglesOff();
		roles_group.transform.GetChild(role-1).GetComponent<Toggle>().isOn = true;

		for(int i=0; i<roles_group.transform.childCount; i++)
			roles_group.transform.GetChild(i).GetComponent<Toggle>().interactable = !lockIt;

	}

	public void Set_Task(int task, bool lockIt)
	{

		tasks_group.SetAllTogglesOff();
		tasks_group.transform.GetChild(task-1).GetComponent<Toggle>().isOn = true;

		for(int i=0; i<tasks_group.transform.childCount; i++)
			tasks_group.transform.GetChild(i).GetComponent<Toggle>().interactable = !lockIt;

	}


	public void Button_Ok()
	{

		foreach (var item in roles_group.ActiveToggles()) 
		{
			GLOBAL_old.Player.progress["playernum"] = int.Parse(item.name);
		}

		foreach (var item in tasks_group.ActiveToggles()) 
		{
			GLOBAL_old.Player.progress["week"] = int.Parse(item.name);
		}

		Debug.Log("OK Button role: "+ GLOBAL_old.Player.progress["playernum"].i + "  task: "+ GLOBAL_old.Player.progress["week"].i);

		SceneManager.LoadScene("character_customizer");

	}

	public void Button_Cancel()
	{
		SceneManager.LoadScene("LandingScreen");
	}

}
