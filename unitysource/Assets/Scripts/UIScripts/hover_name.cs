using UnityEngine;
using System.Collections;

public class hover_name : MonoBehaviour 
{
	public static Transform targetPlayer;

	public string itemName = "Trash";

	void Awake()
	{
		if(targetPlayer == null)
			targetPlayer = GameObject.FindGameObjectWithTag("Player").transform;
	}

	void OnMouseOver()
	{
		if(!enabled)
			return;

		if(Vector3.Distance(targetPlayer.position, transform.position) > 5)
		{
			return;
		}

		Vector3 globalMousePos;
		//if (RectTransformUtility.ScreenPointToWorldPointInRectangle((RectTransform) UI_Inventory.instance.canvas.transform, Input.mousePosition, null, out globalMousePos))
		//{
		//	UI_Inventory.SubText_Show(itemName, globalMousePos, UI_Inventory.instance.canvas.transform.rotation);
			//UI_Inventory.SubText_Show(itemName, Input.mousePosition, UI_Inventory.instance.canvas.transform.rotation);
			UI_Inventory.SubText_Show(itemName, Input.mousePosition, Quaternion.identity);
		//}
	}

	void OnMouseExit()
	{
		UI_Inventory.SubText_Hide();
	}
}
