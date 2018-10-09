using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using UnityEngine.UI;

public class UI_Character_Sheet : MonoBehaviour
{
	public GameObject canvas;
	public Text txt_world_explored;
	public Text txt_dollars_earned;
	public Text txt_weekly_vendors;
	public Text txt_weekly_cards;
	public Text txt_trash_redeemed;
	public Text txt_weekly_opportunities;

	private static UI_Character_Sheet _instance;

	void Awake()
	{
		_instance = this;

		// BChance: (2016-01-07) - Ensure GLOBALs are setup.
		GLOBAL.Init();
	}

	void Start()
	{
		// Hide by default.
		UI_Character_Sheet.Close();
	}

	void Update()
	{

	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	public void btn_Close_Click()
	{
		UI_Character_Sheet.Close();
	}

	public static void Load()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_Character_Sheet", LoadSceneMode.Additive);
		}
	}

	public static void Open()
	{
		// Ensure the fields are up to date.
		UpdateFields();

		_instance.canvas.SetActive(true);
	}

	public static void Close()
	{
		_instance.canvas.SetActive(false);
	}

	public static void ToggleOpenClose()
	{
		// Ensure the fields are up to date.
		UpdateFields();

		// Toggle the visibility of the Journal UI.
		_instance.canvas.SetActive(!_instance.canvas.activeSelf);

		Debug.Log("UI_Character_Sheet - ToggleOpenClose() - Active: " + _instance.canvas.activeSelf);
	}

	public static void UpdateFields()
	{
		Debug.Log("_instance: " + _instance);

		// NOTE: Taken from old code file '/application/showchar.lua':Line 44.
		_instance.txt_world_explored.text       = GLOBAL.Player.progress["explored"].i.ToString() + "/60";
		_instance.txt_dollars_earned.text       = GLOBAL.Player.progress["earnedplayercash"].i.ToString();
		_instance.txt_weekly_vendors.text       = GLOBAL.Player.progress["interviewed"].i.ToString();
		_instance.txt_weekly_cards.text         = GLOBAL.Player.progress["busicards"].i.ToString();
		_instance.txt_trash_redeemed.text       = GLOBAL.Player.progress["trashcash"].i.ToString();
		_instance.txt_weekly_opportunities.text = GLOBAL.Player.progress["sidequests"].i.ToString() + "/8";
	}
}
