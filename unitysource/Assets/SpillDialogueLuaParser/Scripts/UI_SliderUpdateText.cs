using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class UI_SliderUpdateText : MonoBehaviour
{
	public string DialogueStateKey;
	public Slider sldr_Value;
	public Text txt_Value;
	
	// Use this for initialization
	void Start()
	{
		sldr_Value.value = GLOBAL.Player.progress[DialogueStateKey].i;
		txt_Value.text = sldr_Value.value.ToString();
	}
	
	// Update is called once per frame
	void Update()
	{
		if (sldr_Value.value != GLOBAL.Player.progress[DialogueStateKey].i)
		{
			sldr_Value.value = GLOBAL.Player.progress[DialogueStateKey].i;
			txt_Value.text = sldr_Value.value.ToString();
		}
	}
	
	public void OnSliderChanged(float fValue)
	{
		GLOBAL.Player.progress[DialogueStateKey] = (int)sldr_Value.value;
		txt_Value.text = sldr_Value.value.ToString();
	}
}
