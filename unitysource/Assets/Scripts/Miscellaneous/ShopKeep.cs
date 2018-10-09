using UnityEngine;
using System.Collections;

public class ShopKeep : Subtext_item
{
	public string inventory_name = "npc_Pauline";

	private UIManager uimanager;

	// Use this for initialization
	void Start()
	{
		uimanager = GameObject.FindObjectOfType<UIManager>();

		itemName = "Shop";
	}
	
	// Update is called once per frame
	void Update()
	{
	
	}

	void OnMouseUpAsButton()
	{
		// the list_name should match gameObject.name + "_male" or "_female"

		UI_Inventory.OpenShopWindow(inventory_name + (GLOBAL.Player.progress["isMale"].b ? "_male" : "_female"));
	}
}
