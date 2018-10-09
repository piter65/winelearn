using UnityEngine;
using System.Collections;

public class Pickup_Trash : Subtext_item
{
	void Start()
	{

	}
	
	void OnMouseUpAsButton()
	{
		if (Vector3.Distance(targetPlayer.position, transform.position) <= 5)
		{
			//UI_Inventory.Player_AddItemWithName(itemName);
			UI_Inventory.Player_AddItemWithKey("trash1");
			enabled = false;
			UI_Inventory.SubText_Hide();

			GLOBAL.Player.progress["trash"] = GLOBAL.Player.progress["trash"] + 1;
			
			GLOBAL.Player.Log(string.Format
			(
				"Trash Picked Up - Current Trash Count: {0}", 
				GLOBAL.Player.progress["trash"].i
			));

			// Update and save the inventory data.
			UI_Inventory.Player_UpdateInventoryData();

			Destroy(gameObject);
		}
	}
}
