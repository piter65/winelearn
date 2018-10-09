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
		if (GLOBAL.IsLeftMouseDown())
		{
			txt_message.text = "LEFT MOUSE DOWN";
		}
		else if (GLOBAL.IsLeftMouseUp())
		{
			txt_message.text = "LEFT MOUSE UP";
		}
		else if (GLOBAL.IsLeftMousePressed())
		{
			txt_message.text = "LEFT MOUSE PRESSED";
		}
		else if (GLOBAL.IsRightMouseDown())
		{
			txt_message.text = "RIGHT MOUSE DOWN";
		}
		else if (GLOBAL.IsRightMouseUp())
		{
			txt_message.text = "RIGHT MOUSE UP";
		}
		else if (GLOBAL.IsRightMousePressed())
		{
			txt_message.text = "RIGHT MOUSE PRESSED";
		}
		else
		{
			txt_message.text = "NO MOUSE BUTTON PRESSED";
		}
	}
}
