using UnityEngine;
using System.Collections;
using Assets.Scripts.Data;

public class CardDispenser : Subtext_item
{

	public BusinessCardsData.Business business;

	// Use this for initialization
	void Start ()
	{

	}

	void OnMouseUpAsButton()
	{
		if (Vector3.Distance(targetPlayer.position, transform.position) <= 5)
		{
			// BChance: (016-08-18) - Reworked card dispenser code.
			InventoryHandler.Inventory_Item item = UI_Inventory.GetSourceItemByKey("businesscard" + (int)business);

			if(!UI_Inventory.Player_HasItemWithKey(item.item_key))
			{
				UI_Inventory.Player_AddItem(item, 0);
				UI_Inventory.ToggleOpenClose(true);
				UI_Inventory.SubText_Hide();

				CountCards();
				
				// Update and save the inventory data.
				UI_Inventory.Player_UpdateInventoryData();
			}
		}
	}

	private void CountCards()
	{
		// Increment the 'busicards' field and flag that the business cards need to be tracked.
		GLOBAL.Player.progress["busicards"] = GLOBAL.Player.progress["busicards"].i + 1;
		GLOBAL.Player.progress["tkbusicards"] = true;
	}
}
