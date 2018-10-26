using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using System.Collections.Generic;

public class DisableHotkeysOnFocus : MonoBehaviour
{
	private InputField _input;

	void Start()
	{
		// Register this input field with the disable hotkeys list.
		_input = GetComponent<InputField>();
		if (_input != null)
		{
			GLOBAL_old.lst_disable_hotkeys_on_focus.Add(_input);
		}
	}

	void Update()
	{
		// If the input is null, try again.
		if (_input == null)
		{
			Debug.LogError(string.Format("== DisableHotkeysOnFocus Input not regiestered for '{0}'. Trying again... ==", name));

			// Register this input field with the disable hotkeys list.
			_input = GetComponent<InputField>();
			if (_input != null)
			{
				GLOBAL_old.lst_disable_hotkeys_on_focus.Add(_input);
				Debug.Log(string.Format("== DisableHotkeysOnFocus Input successfully regiestered for '{0}'. ==", name));
			}
		}
	}
	
	void OnDestroy()
	{
		// Unregister this input field from the disable hotkeys list.
		InputField _input = GetComponent<InputField>();
		if (_input != null)
		{
			GLOBAL_old.lst_disable_hotkeys_on_focus.Remove(_input);
		}
	}
}