using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;
using System;
using System.Collections;
using System.Collections.Generic;

public class DisableHotkeysOnFocus_TMP : MonoBehaviour
{
	private TMP_InputField _input;

	void Start()
	{
		// Register this input field with the disable hotkeys list.
		_input = GetComponent<TMP_InputField>();
		if (_input != null)
		{
			GLOBAL.lst_disable_hotkeys_on_focus_tmp.Add(_input);
		}
	}

	void Update()
	{
		// If the input is null, try again.
		if (_input == null)
		{
			Debug.LogError(string.Format("== DisableHotkeysOnFocus Input not regiestered for '{0}'. Trying again... ==", name));

			// Register this input field with the disable hotkeys list.
			_input = GetComponent<TMP_InputField>();
			if (_input != null)
			{
				GLOBAL.lst_disable_hotkeys_on_focus_tmp.Add(_input);
				Debug.Log(string.Format("== DisableHotkeysOnFocus Input successfully regiestered for '{0}'. ==", name));
			}
		}
	}
	
	void OnDestroy()
	{
		// Unregister this input field from the disable hotkeys list.
		if (_input != null)
		{
			GLOBAL.lst_disable_hotkeys_on_focus_tmp.Remove(_input);
		}
	}
}