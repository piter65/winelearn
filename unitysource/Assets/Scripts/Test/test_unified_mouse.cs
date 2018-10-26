using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class test_unified_mouse : MonoBehaviour
{
	public Text txt_message;

	// Use this for initialization
	void Start()
	{
		
	}
	
	// Update is called once per frame
	void Update()
	{
		if (GLOBAL_old.IsLeftMouseDown())
		{
			txt_message.text = "LEFT MOUSE DOWN";
		}
		else if (GLOBAL_old.IsLeftMouseUp())
		{
			txt_message.text = "LEFT MOUSE UP";
		}
		else if (GLOBAL_old.IsLeftMousePressed())
		{
			txt_message.text = "LEFT MOUSE PRESSED";
		}
		else if (GLOBAL_old.IsRightMouseDown())
		{
			txt_message.text = "RIGHT MOUSE DOWN";
		}
		else if (GLOBAL_old.IsRightMouseUp())
		{
			txt_message.text = "RIGHT MOUSE UP";
		}
		else if (GLOBAL_old.IsRightMousePressed())
		{
			txt_message.text = "RIGHT MOUSE PRESSED";
		}
		else
		{
			txt_message.text = "NO MOUSE BUTTON PRESSED";
		}
	}
}
