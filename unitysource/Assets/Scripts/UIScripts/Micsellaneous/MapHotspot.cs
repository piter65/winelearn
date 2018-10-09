using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;

public class MapHotspot : MonoBehaviour , IPointerEnterHandler, IPointerExitHandler {

	[Multiline]
	public string hoverText = "";


	public void OnPointerEnter(PointerEventData eventData)
	{
		UI_MiniMap.ShowText(hoverText);
	}

	public void OnPointerExit(PointerEventData eventData)
	{
		UI_MiniMap.HideText();
	}

}
