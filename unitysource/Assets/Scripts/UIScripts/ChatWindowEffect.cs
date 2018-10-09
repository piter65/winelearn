using UnityEngine;
using System.Collections;
using UnityEngine.UI;
public class ChatWindowEffect : MonoBehaviour 
{

	public Color colorStart = Color.red;
	public Color colorEnd = Color.green;
	public float duration = 1.0F;
	public GameObject chatPanel;
	public Text txtColor;

	bool isEnabled = false;
	public static bool isChatWindowEnable = false;

	void Start() 
	{
		isChatWindowEnable = false;
		chatPanel.GetComponent<RectTransform>().anchoredPosition = new Vector2(-210,-60.0f);
		//rend = GetComponent<Renderer>();
	}
	void FixedUpdate() 
	{
		if(isChatWindowEnable == true)
		{
			float lerp = Mathf.PingPong(Time.time, duration) / duration;
			txtColor.color = Color.Lerp(colorStart, colorEnd, lerp);
			if(isChatWindowEnable == true && isEnabled == false)
			{
				ChatEnable();
				isEnabled = true;
			}

		}
	}

	public void ChatWindowPopup_Enable()
	{
		if(txtColor.text == "Chat")
		{
			txtColor.text = "Close";
			isChatWindowEnable = false;
			chatPanel.GetComponent<RectTransform>().anchoredPosition = new Vector2(-210,60.0f);
			float color = 50.0f/255.0f;
			txtColor.color = new Color (color,color,color,1);
		}
		else if(txtColor.text == "Close")
		{
			txtColor.text = "Chat";
			isEnabled = false;
			isChatWindowEnable = false;
			float color = 50.0f/255.0f;
			txtColor.color = new Color (color,color,color,1);
			chatPanel.GetComponent<RectTransform>().anchoredPosition = new Vector2(-210,-60.0f);
		}
	}
	public void ChatEnable()
	{
		txtColor.text = "Close";
		isChatWindowEnable = false;
		chatPanel.GetComponent<RectTransform>().anchoredPosition = new Vector2(-210,60.0f);
		float color = 50.0f/255.0f;
		txtColor.color = new Color (color,color,color,1);
	}


}
