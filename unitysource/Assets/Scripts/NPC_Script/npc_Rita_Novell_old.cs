using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class npc_Rita_Novell_old : MonoBehaviour 
{
	public Canvas     tempVar_canvas;
	public Text[]     tempVar_Text_ReadingMaterial_options; // 0-3

	/// <summary>
	/// [week-1, ((role-1) * 4) + i] from files w1_res_lib.lua and w2_res_lib.lua
	/// </summary>
	private string[,] readingMaterials = new string[,]
	{
		// week 1
		{
			"Nina Ojeda","Gabe Vine","Bjorn Egan","Marvin Moneymaker",               // role 1
			"Gil Fermin","John Gray","Tom Barrier","Dr. Zeke Mullen",                // role 2
			"Peter Boltright","Oroko Nakashima","Phil Burells","Anthony Wexler",     // role 3
			"Nathaniel Wailer","Jannis Economou","Ramblin' Rose","Skeeter McBragg"   // role 4
		}, 
		// week 2
		{
			"Wes Berlin","Lakeisha","Grandmaster G.","Fiona Rudd.",            // role 1
			"Dave Shortback","Cedric Maxwell","Sam Shortback","Margret Wong",  // role 2
			"Ashley Dapper","Wanda Rown","Freida West","Adam Baum",            // role 3	
			"Avanish Singh","Anthony Dewey","Abbie S. Korpis","Liddy Gates"    // role 4
		}

	};

	// Use this for initialization
	void Start () 
	{

	}
	
	// Update is called once per frame
	void Update () 
	{
	
	}

	void OnMouseUpAsButton()
	{
		tempVar_canvas.gameObject.SetActive(true);
	}

	// reading materials

	private string[] readingMaterial_options;

	public void Load_readingMaterial_options()
	{
		int week = GLOBAL.Player.progress["week"].i;
		int role = GLOBAL.Player.progress["playernum"].i;

		Debug.Log(string.Format("Load_readingMaterial_options() - week: {0}, role: {1}", week, role));

		if(week > 2) // there is no w3_res_lib.lua
			return;

		if (week < 1)
			return;

		readingMaterial_options = new string[]
		{
			readingMaterials[week-1, ((role-1) * 4)],
			readingMaterials[week-1, ((role-1) * 4) + 1],
			readingMaterials[week-1, ((role-1) * 4) + 2],
			readingMaterials[week-1, ((role-1) * 4) + 3]

		};

		for(int i=0; i<readingMaterial_options.Length; i++)
			tempVar_Text_ReadingMaterial_options[i].text = "I need materials regarding "+readingMaterial_options[i];

	}

	private static string lastBook = "Nina Ojeda";

	public void Button_ReadingMaterialOption(int option)
	{
		//// going custom
		//InventoryHandler.Inventory_Item customItem = new InventoryHandler.Inventory_Item(); // value, not instance
//
		//customItem.item_name =       "Book on " + readingMaterial_options[option];
		//customItem.item_attributes = "READ="+readingMaterial_options[option]+",";
		//
		//// this is really to get the icon
		//InventoryHandler.Item_List sourceItems = UI_Inventory.GetList("Source_Items");
		//for(int i=0; i< sourceItems.list_items.Count; i++)
		//{
		//	if(sourceItems.list_items[i].item_name == "ReadingMaterial_Book")
		//	{
		//		customItem.item_iconSprite = sourceItems.list_items[i].item_iconSprite;
		//		break; 
		//	}
		//}
//
		//// out with the old
		//UI_Inventory.Player_RemoveItemWithName(lastBook);
		//// in with the new
		//UI_Inventory.Player_AddItem(customItem, 0);
//
		//lastBook = customItem.item_name;
		
		// out with the old
		UI_Inventory.Player_RemoveItemsWithAttribute("LIBRARY_BOOK");

		InventoryHandler.Inventory_Item item = UI_Inventory.GetSourceItemByName("Library Book on " + readingMaterial_options[option]);

		// in with the new
		UI_Inventory.Player_AddItem(item, 0);

		// Update and save the inventory data.
		UI_Inventory.Player_UpdateInventoryData();

		//// show Inventory
		//if(!UI_Inventory.instance.canvas.activeInHierarchy)
		//	GameObject.FindObjectOfType<UIManager>().InventoryAction();

		// show Inventory
		UI_Inventory.ToggleOpenClose(true);
	}
		

	public void Button_ReturnBook()
	{
		UI_Inventory.Player_RemoveItemWithName(lastBook);

		// show Inventory
		if(!UI_Inventory.instance.canvas.activeInHierarchy)
			GameObject.FindObjectOfType<UIManager>().InventoryAction();

	}

}
