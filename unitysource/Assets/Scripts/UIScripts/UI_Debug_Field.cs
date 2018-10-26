using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System;
using System.Collections;
using System.Collections.Generic;

public class UI_Debug_Field : MonoBehaviour
{
	public new string name = "[target_field_name]";
	public int min_value = 0;
	public int max_value = 5;
	public Text txt_name;
	public Slider sldr_value;
	public Text txt_value;

	private bool _is_initialized = false;

	void Start()
	{
		txt_name.text = name;
		sldr_value.minValue = min_value;
		sldr_value.maxValue = max_value;
		sldr_value.value = GLOBAL_old.Player.progress[name].i;
		//Debug.LogError(string.Format("GLOBAL.Player.progress[{0}]: {1}, sldr_value.value: {2}", name, GLOBAL.Player.progress[name].i, sldr_value.value));
		txt_value.text = sldr_value.value.ToString();

		_is_initialized = true;
	}

	public void sldr_value_Changed(float f_value)
	{
		if (_is_initialized)
		{
			//Debug.Log("!!! sldr_value_Changed() !!!");

			int i_value = (int)f_value;
			GLOBAL_old.Player.progress[name] = i_value;
			txt_value.text = i_value.ToString();
		}
	}
}