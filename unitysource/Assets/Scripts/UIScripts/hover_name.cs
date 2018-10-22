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
		
		//UI_Inventory.SubText_Show(itemName, Input.mousePosition, Quaternion.identity);
	}

	void OnMouseExit()
	{
		//UI_Inventory.SubText_Hide();
	}
}
