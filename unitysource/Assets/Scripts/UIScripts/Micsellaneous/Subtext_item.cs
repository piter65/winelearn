using UnityEngine;
using System.Collections;

public class Subtext_item : MonoBehaviour {

	public static Transform targetPlayer;

	public string itemName = "Trash";

	void Awake(){

		if(targetPlayer == null)
			targetPlayer = GameObject.FindGameObjectWithTag("Player").transform;

	}

	void OnMouseOver(){

		if(!enabled)
			return;

		if(Vector3.Distance(targetPlayer.position, transform.position) > 5){
			return;
		}

		Vector3 globalMousePos;
		//if (RectTransformUtility.ScreenPointToWorldPointInRectangle((RectTransform) UI_Inventory.instance.canvas.transform, Input.mousePosition, null, out globalMousePos))
		//{
		//	UI_Inventory.SubText_Show(itemName, globalMousePos, UI_Inventory.instance.canvas.transform.rotation);
		//}
	}

	void OnMouseExit(){

		//UI_Inventory.SubText_Hide();
	}
}
