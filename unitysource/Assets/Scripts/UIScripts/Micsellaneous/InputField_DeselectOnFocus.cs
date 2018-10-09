using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System;
using System.Collections;
using System.Collections.Generic;

public class InputField_DeselectOnFocus : InputField
{
	protected bool _newly_selected = false;
	
	void LateUpdate()
	{
		base.LateUpdate();

		if (_newly_selected)
		{
			Debug.Log("InputField_DeselectOnFocus - Deselecting...");

			MoveTextEnd(false);

			_newly_selected = false;
		}
	}

	void OnSelect(BaseEventData eventData)
	{
		Debug.Log("InputField_DeselectOnFocus.OnSelect()");

		base.OnSelect(eventData);

		_newly_selected = true;
	}
}