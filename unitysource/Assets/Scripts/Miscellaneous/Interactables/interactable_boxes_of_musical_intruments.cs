using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using System.Collections.Generic;

public class interactable_boxes_of_musical_intruments : interactable
{
	public override void Interact()
	{
		// Add a guitar to the player's inventory.
		GLOBAL.Player.progress["guitar"] = true;
		UI_Inventory.inspect_item_key = "guitar";
		GLOBAL.RefreshUIBasedOnProgress();
	}
}