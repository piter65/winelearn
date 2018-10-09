using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;
using System.Linq;
using Assets.Scripts.Data;
using System.Text;

public class UI_Inventory : MonoBehaviour

{
	public static UI_Inventory instance;
	public static bool player_data_loaded = false;
	public static bool is_inventory_setup = false;
	public static string inspect_item_key = null;

	public GameObject canvas;

	// grids
	public RectTransform the_inventory_grid;
	public RectTransform the_shop_grid;


	// money
	public Text money_displaytext;
	public int money_amount = -1;
	//public int money_amount = 100;
	//public static int MoneyBalance
	//{
	//	get
	//	{
	//		return instance.money_amount;
	//	}
	//	set
	//	{
	//		instance.money_amount = value;
	//		instance.money_displaytext.text = "$"+instance.money_amount;
	//	}
	//}

	// shop windows
	public GameObject shop_window;
	public GameObject shop_confirmation_window;
	public Text       shop_confirmation_text;

	private static InventoryHandler.Item_List shop_list_current;

	// text windows
	public GameObject    text_window;
	public RectTransform scroll_contentRect;

	// subText
	public GameObject subtext_parent;

	public Text text_content_element;

	// all items player and shops
	public InventoryHandler inventory = new InventoryHandler();

	public Sprite[] sprites = new Sprite[0];


	#region UI_Manager calls

	public static void Load()
	{
		if (instance == null)
		{
			SceneManager.LoadScene("UI_Inventory", LoadSceneMode.Additive);
		}
	}

	public static void ToggleOpenClose()
	{
		if (instance != null)
		{
			instance.canvas.SetActive(!instance.canvas.activeInHierarchy);

			if(!instance.canvas.activeInHierarchy)
				instance.OnDisable();
			else
				instance.OnEnable();

			Debug.Log("UI_Inventory - ToggleOpenClose() - Active: " + instance.canvas.activeInHierarchy);
		}
	}

	public static void ToggleOpenClose(bool active)
	{
		if (instance != null)
		{
			instance.canvas.SetActive(active);

			if(!active)
				instance.OnDisable();
			else
				instance.OnEnable();

			Debug.Log("UI_Inventory - ToggleOpenClose() - Active: " + active);
		}
	}

	#endregion

	#region Static Calls

	/// <summary>
	/// checks the players inventory for an item with the given name
	/// </summary>
	public static bool Player_HasItemWithName(string item_name)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for (int item_index = 0; item_index < list.list_items.Count; ++item_index)
		{
			if (list.list_items[item_index].item_name.Equals(item_name))
			{
				return true;
			}
		}

		return false;
	}

	/// <summary>
	/// checks the players inventory for an item with the given key
	/// </summary>
	public static bool Player_HasItemWithKey(string item_key)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for (int item_index = 0; item_index < list.list_items.Count; ++item_index)
		{
			if (list.list_items[item_index].item_key.Equals(item_key))
			{
				return true;
			}
		}

		return false;
	}

	/// <summary>
	/// Gets the index of the item with the specified key.
	/// </summary>
	public static int Player_IndexOfItemWithKey(string item_key)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for (int item_index = 0; item_index < list.list_items.Count; ++item_index)
		{
			if (list.list_items[item_index].item_key.Equals(item_key))
			{
				return item_index;
			}
		}

		return -1;
	}

	/// <summary>
	/// returns the Inventory_Item if the player has it.
	/// else returns an Inventory_Item with an empty name
	/// (note Inventory_Item is a value not an instance)
	/// </summary>
	public static InventoryHandler.Inventory_Item Player_GetItemWithName(string item_name)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for (int i = 0; i < list.list_items.Count; i++)
		
		{
			if (list.list_items[i].item_name == item_name)
			
			{
				return list.list_items[i];
			}
		}

		return new InventoryHandler.Inventory_Item("", "", null, "", 0, "");
	}

	/// <summary>
	/// Syncs the player inventory data with the player's current inventory.
	/// </summary>
	public static void Player_UpdateInventoryData()
	{
		// Only bother updating the player data if we have loaded it in the first place.
		if (player_data_loaded)
		{
			//Debug.Log("UI_Inventory.Player_UpdateInventoryData()");
//
			//for (int index_item_debug = 0; index_item_debug < instance.inventory.lists[0].list_items.Count; ++index_item_debug)
			//{
			//	// If an inventory slot has a key, retrieve the item data and add it to the inventory.
			//	string item_key = instance.inventory.lists[0].list_items[index_item_debug].item_key;
			//	if (!string.IsNullOrEmpty(item_key))
			//	{
			//		Debug.LogError("inv_slot_" + index_item_debug + ": " + item_key);
			//	}
			//}

			int index_item = 0;

			// Loop thru the player's items and ensure that they're stored.
			for (; index_item < instance.inventory.lists[0].list_items.Count; ++index_item)
			{
				GLOBAL.Player.progress["inv_slot_" + index_item] = instance.inventory.lists[0].list_items[index_item].item_key;
			}
			// Loop thru the remaining slots and ensure that they're empty.
			for (; index_item < 50; ++index_item)
			{
				GLOBAL.Player.progress["inv_slot_" + index_item] = "";
			}

			// Inspect an item if it's been flagged.
			if (inspect_item_key != null)
			{
				int item_index = Player_IndexOfItemWithKey(inspect_item_key);

				// Open the inventory.
				ToggleOpenClose(true);

				// Inspect the item.
				instance.ButtonPressed_inventory_GridItem(item_index);

				inspect_item_key = null;
			}

			// Update the server with the changes.
			instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
		}
	}

	/// <summary>
	/// Retrieves the items saved in the player data from the Source_Items and fills the inventory with them.
	/// </summary>
	public static void Player_RetrieveInventoryFromPlayerData()
	{
		//Debug.LogError("== UI_Inventory.Player_RetrieveInventoryFromPlayerData() called. ==");

		if (   instance != null
			&& GLOBAL.Player != null)
		{
			//Debug.Log("UI_Inventory.Player_RetrieveInventoryFromPlayerData()");

			//Debug.LogError("== UI_Inventory.Player_RetrieveInventoryFromPlayerData() triggered. ==");

			// Empty the inventory of whatever it has.
			instance.inventory.lists[0].list_items.Clear();

			// Loop thru the player invenory data.
			for (int index_item = 0; index_item < 50; ++index_item)
			{
				// If an inventory slot has a key, retrieve the item data and add it to the inventory.
				string item_key = GLOBAL.Player.progress["inv_slot_" + index_item].str;
				if (!string.IsNullOrEmpty(item_key))
				{
					InventoryHandler.Inventory_Item item = GetSourceItemByKey(item_key);
					instance.inventory.lists[0].list_items.Add(item);
				}
			}

			//for (int index_item = 0; index_item < instance.inventory.lists[0].list_items.Count; ++index_item)
			//{
			//	// If an inventory slot has a key, retrieve the item data and add it to the inventory.
			//	string item_key = instance.inventory.lists[0].list_items[index_item].item_key;
			//	if (!string.IsNullOrEmpty(item_key))
			//	{
			//		Debug.LogError("inv_slot_" + index_item + ": " + item_key);
			//	}
			//}

			Fill_The_Grid(instance.inventory.lists[0], false);

			// Flag that the player data has been loaded.
			player_data_loaded = true;

			// Perform inventory setup if necessary.
			Setup_Inventory();
		}
	}

	private static void Setup_Inventory()
	{
		if (   player_data_loaded
			&& !is_inventory_setup)
		{
			Debug.Log("UI_Inventory.Setup_Inventory()");

			//for (int index_item = 0; index_item < instance.inventory.lists[0].list_items.Count; ++index_item)
			//{
			//	// If an inventory slot has a key, retrieve the item data and add it to the inventory.
			//	string item_key = instance.inventory.lists[0].list_items[index_item].item_key;
			//	if (!string.IsNullOrEmpty(item_key))
			//	{
			//		Debug.LogError("inv_slot_" + index_item + ": " + item_key);
			//	}
			//}

			// Ensure that inventory and player data are synced.
			GLOBAL.RefreshUIBasedOnProgress();

			//// Ensure that tutorial players have Fiona's book.
			//if (GLOBAL.Player.progress["week"].i == 0)
			//{
			//	Debug.LogError("has book: " + Player_HasItemWithKey("w2b4"));
//
			//	if (!Player_HasItemWithKey("w2b4"))
			//	{
			//		Player_AddItemWithKey("w2b4");
			//
			//		// Update and save the inventory data.
			//		UI_Inventory.Player_UpdateInventoryData();
			//	}
			//}

			is_inventory_setup = true;
		}
	}

	/// <summary>
	/// Adds an item from Source_Items list to the player's inventory
	/// </summary>
	public static int Player_AddItemWithName(string item_name)
	{
		int index_item = -1;

		InventoryHandler.Item_List list = instance.inventory.GetList("Source_Items");
		for (int i = 0; i < list.list_items.Count; i++)
		{
			if (list.list_items[i].item_name.Equals(item_name))
			{
				index_item = instance.inventory.lists[0].list_items.Count;
				instance.inventory.lists[0].list_items.Add(list.list_items[i]);

				// Ensure that the item is flagged in the player data.
				string item_key = list.list_items[i].item_key;
				if (   GLOBAL.Player != null
					&& !string.IsNullOrEmpty(item_key))
				{
					GLOBAL.Player.progress[item_key] = true;

					GLOBAL.Player.Log(string.Format
					(
						"Item Added to Inventory - Key: '{0}'", 
						item_key
					));
				}

				break;
			}
		}

		Fill_The_Grid(instance.inventory.lists[0], false);

		return index_item;
	}

	/// <summary>
	/// Adds an item from Source_Items list to the player's inventory
	/// </summary>
	public static int Player_AddItemWithKey(string item_key)
	{
		int index_item = -1;

		InventoryHandler.Item_List list = instance.inventory.GetList("Source_Items");
		for (int i = 0; i < list.list_items.Count; i++)
		{
			if (list.list_items[i].item_key.Equals(item_key))
			{
				index_item = instance.inventory.lists[0].list_items.Count;
				instance.inventory.lists[0].list_items.Add(list.list_items[i]);

				// Ensure that the item is flagged in the player data.
				if (   GLOBAL.Player != null
					&& !string.IsNullOrEmpty(item_key))
				{
					GLOBAL.Player.progress[item_key] = true;

					GLOBAL.Player.Log(string.Format
					(
						"Item Added to Inventory - Key: '{0}'", 
						item_key
					));
				}

				break;
			}
		}

		Fill_The_Grid(instance.inventory.lists[0], false);

		return index_item;
	}

	public static void Player_AddItem(InventoryHandler.Inventory_Item customItem, int insertIndex)
	{
		instance.inventory.lists[0].list_items.Insert(insertIndex, customItem);

		// Ensure that the item is flagged in the player data.
		string item_key = customItem.item_key;
		if (   GLOBAL.Player != null
			&& !string.IsNullOrEmpty(item_key))
		{
			GLOBAL.Player.progress[item_key] = true;

			GLOBAL.Player.Log(string.Format
			(
				"Item Added to Inventory - Key: '{0}'", 
				item_key
			));
		}

		Fill_The_Grid(instance.inventory.lists[0], false);
	}


	/// <summary>
	/// Removes an item with the given name from the player's inventory
	/// </summary>
	public static void Player_RemoveItemWithName(string item_name)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for(int index_item = 0; index_item < list.list_items.Count; index_item++)
		{
			if (list.list_items[index_item].item_name.Equals(item_name))
			{
				list.list_items.RemoveAt(index_item);

				// Ensure that the item is flagged in the player data.
				string item_key = list.list_items[index_item].item_key;
				if (   GLOBAL.Player != null
					&& !string.IsNullOrEmpty(item_key))
				{
					GLOBAL.Player.progress[item_key] = false;

					GLOBAL.Player.Log(string.Format
					(
						"Item Removed from Inventory - Key: '{0}'", 
						item_key
					));
				}

				break;
			}
		}

		Fill_The_Grid(instance.inventory.lists[0], false);
	}

	/// <summary>
	/// Removes an item with the given key from the player's inventory
	/// </summary>
	public static void Player_RemoveItemWithKey(string item_key)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for(int item_index = 0; item_index < list.list_items.Count; item_index++)
		{
			if (list.list_items[item_index].item_key.Equals(item_key))
			{
				list.list_items.RemoveAt(item_index);

				// Ensure that the item is unflagged in the player data.
				if (   GLOBAL.Player != null
					&& !string.IsNullOrEmpty(item_key))
				{
					GLOBAL.Player.progress[item_key] = false;

					GLOBAL.Player.Log(string.Format
					(
						"Item Removed from Inventory - Key: '{0}'", 
						item_key
					));
				}

				break;
			}
		}

		Fill_The_Grid(instance.inventory.lists[0], false);
	}

	/// <summary>
	/// Removes an item with the given key from the player's inventory
	/// </summary>
	public static void Player_RemoveItemAtIndex(int item_index)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];

		if (   item_index > -1
			&& item_index < list.list_items.Count)
		{
			string item_key = list.list_items[item_index].item_key;

			list.list_items.RemoveAt(item_index);

			// Ensure that the item is unflagged in the player data.
			if (   GLOBAL.Player != null
				&& !string.IsNullOrEmpty(item_key))
			{
				GLOBAL.Player.progress[item_key] = false;

				GLOBAL.Player.Log(string.Format
				(
					"Item Removed from Inventory - Key: '{0}'", 
					item_key
				));
			}

			Fill_The_Grid(instance.inventory.lists[0], false);
		}
		else
		{
			Debug.LogError(string.Format("UI_Inventory.Player_RemoveItemAtIndex() - item_index: '{0}' out of range.", item_index));
		}
	}

	/// <summary>
	/// removes all items with the given attribute from the player's inventory
	/// </summary>
	public static void Player_RemoveItemsWithAttribute(string item_attribute)
	{
		InventoryHandler.Item_List list = instance.inventory.lists[0];
		for(int index_item = list.list_items.Count - 1; index_item > -1; --index_item)
		{
			string[] attributes = list.list_items[index_item].item_attributes.Split(',');

			for(int attribute_index = 0; attribute_index < attributes.Length; attribute_index++)
			{
				if (attributes[attribute_index].Trim().Equals(item_attribute))
				{
					// Ensure that the item is flagged in the player data.
					string item_key = list.list_items[index_item].item_key;
					if (   GLOBAL.Player != null
						&& !string.IsNullOrEmpty(item_key))
					{
						GLOBAL.Player.progress[item_key] = false;

						GLOBAL.Player.Log(string.Format
						(
							"Item Removed from Inventory - Key: '{0}'", 
							item_key
						));
					}

					list.list_items.RemoveAt(index_item);
					
					break;
				}
			}
		}

		Fill_The_Grid(instance.inventory.lists[0], false);
	}


	/// <summary>
	/// Gets the list by name.
	/// </summary>
	public static InventoryHandler.Item_List GetList(string list_name)
	{
		return instance.inventory.GetList(list_name);
	}


	public static void DragAndDropped(int item_index, Ray ray)
	{
		InventoryHandler.Inventory_Item item = instance.inventory.lists[0].list_items[item_index];

		if(item.item_name == "Trash")
		{
			Dropped_Trash(ray);
		}
		else if (item.item_attributes.Contains("BIZ_CARD"))
		{
			Dropped_BizCard(item_index, ray);
		}
	}

	public static void SubText_Hide()
	{
		if (instance != null)
		{
			instance.subtext_parent.SetActive(false);
		}
	}

	public static void SubText_Show(string text, Vector3 pos, Quaternion rotation)
	{
		if (instance != null)
		{
			instance.subtext_parent.SetActive(true);

			instance.subtext_parent.transform.position = pos;
			instance.subtext_parent.transform.rotation = rotation;

			// text
			instance.subtext_parent.transform.GetChild(0).GetComponent<Text>().text = text;
		}
	}

	public static void SubText_Show(int item_index, string listname, Vector3 pos, Quaternion rotation)
	{
		if (instance != null)
		{
			instance.subtext_parent.SetActive(true);

			instance.subtext_parent.transform.position = pos;
			instance.subtext_parent.transform.rotation = rotation;

			InventoryHandler.Item_List list = instance.inventory.GetList(listname);

			// text
			instance.subtext_parent.transform.GetChild(0).GetComponent<Text>().text = list.list_items[item_index].item_name;
		}
	}

	/// <summary>
	/// Adds a newspaper. returns bool of if it was successful
	/// </summary>
	public static bool BuyNewspaper(NewspaperData.NewspapersEnum newspaper)
	{
		Debug.LogError("== UI_Inventory.BuyNewspaper() ==");

		//// going custom
		//InventoryHandler.Inventory_Item customItem = new InventoryHandler.Inventory_Item(); // value, not instance
		//customItem.item_description = "";
//
		//// rename it and assign the current week
		//if (newspaper == NewspaperData.NewspapersEnum.ElliotCountyCrier)
		//{
		//	customItem.item_name = "Elliot County Crier";
		//	customItem.item_attributes = "NEWS_ElliotCountyCrier=" + GLOBAL.Player.progress["week"].i;
		//}
		//else if (newspaper == NewspaperData.NewspapersEnum.NewCityExaminer)
		//{
		//	customItem.item_name = "New City Examiner";
		//	customItem.item_attributes = "NEWS_NewCityExaminer=" + GLOBAL.Player.progress["week"].i;
		//}
		//else if (newspaper == NewspaperData.NewspapersEnum.ElliotCountyToday)
		//{
		//	customItem.item_name = "Elliot County Today";
		//	customItem.item_attributes = "NEWS_ElliotCountyToday=" + GLOBAL.Player.progress["week"].i;
		//}
//
		//InventoryHandler.Item_List sourceItems = UI_Inventory.GetList("Source_Items");
		//for(int i=0; i< sourceItems.list_items.Count; i++)
		//{
		//	if(sourceItems.list_items[i].item_name == customItem.item_name)
		//	{
		//		customItem.item_iconSprite = sourceItems.list_items[i].item_iconSprite; // this is really to get the icon
		//		break; 
		//	}
		//}

		// Ensure that the week is between 1 and 3.
		int week = GLOBAL.Player.progress["week"].i;
		week = Mathf.Clamp(week, 1, 3);

		// Get this week's newspaper
		InventoryHandler.Inventory_Item item;
		if (newspaper == NewspaperData.NewspapersEnum.ElliotCountyCrier)
		{
			item = GetSourceItemByKey(string.Format("w{0}crier", week));
		}
		else if (newspaper == NewspaperData.NewspapersEnum.NewCityExaminer)
		{
			item = GetSourceItemByKey(string.Format("w{0}examiner", week));
		}
		else // if (newspaper == NewspaperData.NewspapersEnum.ElliotCountyToday)
		{
			item = GetSourceItemByKey(string.Format("w{0}today", week));
		}

		if (!string.IsNullOrEmpty(item.item_key))
		{
			// check if they have one
			if (!UI_Inventory.Player_HasItemWithKey(item.item_key))
			{
				// they don't have one
				UI_Inventory.Player_AddItem(item, 0);

				// Update and save the inventory data.
				UI_Inventory.Player_UpdateInventoryData();

				// Open the inventory.
				ToggleOpenClose(true);

				// Open the newpaper.
				instance.ButtonPressed_inventory_GridItem(0);

				return true;
			}
		}

		return false;
	}


	public static InventoryHandler.Inventory_Item GetSourceItemByKey(string key)
	{
		// Get the item with the matching key.
		InventoryHandler.Inventory_Item item =
			GetList("Source_Items").list_items
			.Where(x => x.item_key.Equals(key))
			.FirstOrDefault();

		// Log if we couldn't find the item.
		if (string.IsNullOrEmpty(item.item_key))
			Debug.LogError(string.Format("Tried to retrieve source item with key '{0}', but item could not be found.", key));

		return item;
	}

	public static InventoryHandler.Inventory_Item GetSourceItemByName(string name)
	{
		// Get the item with the matching key.
		InventoryHandler.Inventory_Item item =
			GetList("Source_Items").list_items
			.Where(x => x.item_name.Equals(name))
			.FirstOrDefault();

		// Log if we couldn't find the item.
		if (string.IsNullOrEmpty(item.item_name))
			Debug.LogError(string.Format("Tried to retrieve source item with name: '{0}', but item could not be found.", name));

		return item;
	}

	#endregion

	#region Dropped Calls

	public static void Dropped_Trash(Ray ray)
	{
		// look for dumpster
		RaycastHit[] hits = Physics.RaycastAll(ray, 10.0f);
		for(int i = 0; i < hits.Length; ++i)
		{
			if (hits[i].transform.name.Contains("dumpster"))
			{
				// Cash in the trash.
				LuaFunctions.dropcash();

				Player_RemoveItemsWithAttribute("TRASH");

				Player_UpdateInventoryData();

				//Player_RemoveItemWithName("Trash");
				//MoneyBalance += 25;
				break;
			}
		}
	}

	public static void Dropped_BizCard(int item_index, Ray ray)
	{
		// look for dumpster
		RaycastHit[] hits = Physics.RaycastAll(ray, 10.0f);
		for(int i = 0; i < hits.Length; ++i)
		{
			if (hits[i].transform.name.Contains("dumpster"))
			{
				Player_RemoveItemAtIndex(item_index);

				Player_UpdateInventoryData();

				break;
			}
		}
	}

	#endregion

	#region MonoBehaviour Calls

	void Awake()
	{
		instance = this;
	}

	// Use this for initialization
	void Start()
	{
		AddSourceItems();
		AddPaulinesMaleItems();
		AddPaulinesFemaleItems();

		money_displaytext.text = "$" + GLOBAL.Player.progress["playercash"].i;
		canvas.SetActive(false);
		OnDisable();

		//BuyNewspaper(NewspaperData.NewspapersEnum.NewCityExaminer);
		//BuyNewspaper(NewspaperData.NewspapersEnum.ElliotCountyCrier);

		Player_RetrieveInventoryFromPlayerData();
	}

	void OnEnable()
	{
		Fill_The_Grid(inventory.lists[0], false);
	}

	void OnDisable()
	{
		shop_window.SetActive(false);
		shop_confirmation_window.SetActive(false);
		shop_list_current = null;

		text_window.SetActive(false);

		SubText_Hide();
	}
	
	// Update is called once per frame
	void Update() 
	{
		// Update the money display if neceesary.
		if (money_amount != GLOBAL.Player.progress["playercash"].i)
		{
			money_amount = GLOBAL.Player.progress["playercash"].i;
			instance.money_displaytext.text = "$" + money_amount;
		}

		//if(Input.GetKeyDown("i"))
		//	ToggleOpenClose();

	}

	void OnDestroy()
	{
		if (instance == this)
		{
			instance = null;
			player_data_loaded = false;
			is_inventory_setup = false;
			shop_list_current = null;
		}
	}

	#endregion

	public static void Fill_The_Grid(InventoryHandler.Item_List item_list = null, bool isShopGrid = false)
	{
		RectTransform theGrid = isShopGrid ? instance.the_shop_grid : instance.the_inventory_grid;

		// go through the grid
		for (int grid_index=0; grid_index < theGrid.childCount; ++grid_index)
		{
			Transform gridItem = theGrid.GetChild(grid_index);
			if (grid_index < item_list.list_items.Count)
			{
				// item
				gridItem.gameObject.SetActive(true);
				gridItem.GetComponent<Image>().sprite = item_list.list_items[grid_index].item_iconSprite;
				gridItem.GetComponent<Image>().type = Image.Type.Simple;

				// show price
				if (isShopGrid)
				{
					string price = GetPrice(item_list.list_items[grid_index].item_attributes);
					gridItem.GetChild(0).GetComponent<Text>().text = (price == "0" ? "free" : "$"+price);
				}
			}
			else
			{ // empty
				gridItem.gameObject.SetActive(false);
			}
		}
	}

	public void ButtonPressed_inventory_GridItem(int itemIndex)
	{
		InventoryHandler.Item_List       itemList = inventory.lists[0];
		InventoryHandler.Inventory_Item  item     = itemList.list_items[itemIndex];

		if(itemIndex >= itemList.list_items.Count)
			return;

		// selling
		if(shop_window.activeInHierarchy)
		{
			// check it out
			string check = CheckWhatYaSelling(item);
			if(check.Length > 1)
			{
				transaction_isGood = false;
				shop_confirmation_window.SetActive(true);
				shop_confirmation_text.text = check;
				return;
			}

			string price = GetPrice(item.item_attributes);
			transaction_isGood = true;
			transaction_pointA = inventory.lists[0];
			transaction_pointB = shop_list_current;
			transaction_itemIndex = itemIndex;
			transaction_moneytransfer = int.Parse(price);

			shop_confirmation_window.SetActive(true);

			shop_confirmation_text.text = "Sell " + item.item_name + 
					" for $"+ transaction_moneytransfer;
		}
		else
		{
			// looking into item
			bool isInspecting = true;

			if(item.item_attributes.Length > 1)
			{
				string[] attributes = item.item_attributes.Split(',');
				for(int a=0; a< attributes.Length; a++)
				{

					// look through the attributes
					if(attributes[a].Contains("TEXT"))
					{ // show text
						string[] split = attributes[a].Split('=');
						ShowText_Resource(split[1]); // file name in Resources/Inventory/TextFiles
						isInspecting = false;
						break;

					}
					else if(attributes[a].Contains("OUTFIT"))
					{
						int clothing_id = 0;
						int clothing_score = 0;
						int.TryParse(attributes[a].Split('=')[1], out clothing_id);
						int.TryParse(attributes[a + 1].Split('=')[1], out clothing_score);

						OutfitItemWasSelected(clothing_id, clothing_score);
						isInspecting = false;
						break;
					}
					else if(attributes[a].Contains("READ"))
					{
						string[] split = attributes[a].Split('=');
						ShowText(MagsAndBooksData.dataDictionary[split[1]]);
						ShowText(item.item_description);
						isInspecting = false;
						break;

					}
					else if(attributes[a].Contains("ICKIBIO"))
					{
						string[] split = attributes[a].Split('=');
						Assets.Scripts.IckipediaDataScripts.IckipediaRootElement info = Assets.Scripts.IckipediaDataScripts.IckipediaData.IckipediaRootLevel[split[1]];
						ShowText(info.Bio);
						isInspecting = false;
						break;

					}
					else if(attributes[a].Contains("NEWS_"))
					{
						ShowText(item.item_description);

						// Only track on weeks after tutorial.
						if (GLOBAL.Player.progress["week"].i > 0)
						{
							// BChance: Which newspaper was read, and flag the datum for tracking.
							if (item.item_key.Equals("w1crier"))
								GLOBAL.Player.progress["w1n1_read"] = true;
							else if (item.item_key.Equals("w2crier"))
								GLOBAL.Player.progress["w2n1_read"] = true;
							else if (item.item_key.Equals("w3crier"))
								GLOBAL.Player.progress["w3n1_read"] = true;
							else if (item.item_key.Equals("w1examiner"))
								GLOBAL.Player.progress["w1n2_read"] = true;
							else if (item.item_key.Equals("w2examiner"))
								GLOBAL.Player.progress["w2n2_read"] = true;
							else if (item.item_key.Equals("w3examiner"))
								GLOBAL.Player.progress["w3n2_read"] = true;
							else if (item.item_key.Equals("w1today"))
								GLOBAL.Player.progress["w1n3_read"] = true;
							else if (item.item_key.Equals("w2today"))
								GLOBAL.Player.progress["w2n3_read"] = true;
							else if (item.item_key.Equals("w3today"))
								GLOBAL.Player.progress["w3n3_read"] = true;

							//GLOBAL.Player.progress["sNewsArt"] = GLOBAL.Player.progress["sNewsArt"].i + 1;
							GLOBAL.Player.progress["tknewsart"] = true;

							// Update the server with the changes.
							instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
						}

						isInspecting = false;
						break;
					}
					else if (attributes[a].Contains("LIBRARY_BOOK"))
					{
						ShowText(item.item_description);

						// Only track on weeks after tutorial.
						if (GLOBAL.Player.progress["week"].i > 0)
						{
							// BChance: Flag which book was read, and flag the datum for tracking.
							if (   item.item_key.Equals("w1b1")
								|| item.item_key.Equals("w1b5")
								|| item.item_key.Equals("w1b9")
								|| item.item_key.Equals("w1b13"))
							{
								GLOBAL.Player.progress["w1b1_read"] = true;
								Debug.LogError("w1b1_read: " + GLOBAL.Player.progress["w1b1_read"].b);
							}
							else if (   item.item_key.Equals("w1b2")
									 || item.item_key.Equals("w1b6")
									 || item.item_key.Equals("w1b10")
									 || item.item_key.Equals("w1b14"))
							{
								GLOBAL.Player.progress["w1b2_read"] = true;
								Debug.LogError("w1b2_read: " + GLOBAL.Player.progress["w1b2_read"].b);
							}
							else if (   item.item_key.Equals("w1b3")
									 || item.item_key.Equals("w1b7")
									 || item.item_key.Equals("w1b11")
									 || item.item_key.Equals("w1b15"))
							{
								GLOBAL.Player.progress["w1b3_read"] = true;
								Debug.LogError("w1b3_read: " + GLOBAL.Player.progress["w1b3_read"].b);
							}
							else if (   item.item_key.Equals("w1b4")
									 || item.item_key.Equals("w1b8")
									 || item.item_key.Equals("w1b12")
									 || item.item_key.Equals("w1b16"))
							{
								GLOBAL.Player.progress["w1b4_read"] = true;
								Debug.LogError("w1b4_read: " + GLOBAL.Player.progress["w1b4_read"].b);
							}
							else if (   item.item_key.Equals("w2b1")
									 || item.item_key.Equals("w2b5")
									 || item.item_key.Equals("w2b9")
									 || item.item_key.Equals("w2b13"))
							{
								GLOBAL.Player.progress["w2b1_read"] = true;
								Debug.LogError("w2b1_read: " + GLOBAL.Player.progress["w2b1_read"].b);
							}
							else if (   item.item_key.Equals("w2b2")
									 || item.item_key.Equals("w2b6")
									 || item.item_key.Equals("w2b10")
									 || item.item_key.Equals("w2b14"))
							{
								GLOBAL.Player.progress["w2b2_read"] = true;
								Debug.LogError("w2b2_read: " + GLOBAL.Player.progress["w2b2_read"].b);
							}
							else if (   item.item_key.Equals("w2b3")
									 || item.item_key.Equals("w2b7")
									 || item.item_key.Equals("w2b11")
									 || item.item_key.Equals("w2b15"))
							{
								GLOBAL.Player.progress["w2b3_read"] = true;
								Debug.LogError("w2b3_read: " + GLOBAL.Player.progress["w2b3_read"].b);
							}
							else if (   item.item_key.Equals("w2b4")
									 || item.item_key.Equals("w2b8")
									 || item.item_key.Equals("w2b12")
									 || item.item_key.Equals("w2b16"))
							{
								GLOBAL.Player.progress["w2b4_read"] = true;
								Debug.LogError("w2b4_read: " + GLOBAL.Player.progress["w2b4_read"].b);
							}
	
							//GLOBAL.Player.progress["sLibArt"] = GLOBAL.Player.progress["sLibArt"].i + 1;
							GLOBAL.Player.progress["tklibart"] = true;
	
							// Update the server with the changes.
							instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
						}

						isInspecting = false;
						break;
					}
				}
			}
			if(isInspecting)
				ShowText(item.item_description);

		}

	}

	public string CheckWhatYaSelling(InventoryHandler.Inventory_Item  item)
	{

		if(item.item_attributes.Length < 1)
			return "no sale";
		
		string[] attributes = item.item_attributes.Split(',');
		int      index_BodyModel = 0;

		// check if it is an outfit
		bool isOutfit = false;
		for(int a=0; a< attributes.Length; a++)
		{
			if(attributes[a].Contains("OUTFIT"))
			{
				string[] split = attributes[a].Split('=');
				int.TryParse(split[1], out index_BodyModel);
				isOutfit = true;
				break;
			}
		}

		if(!isOutfit)
			return "no sale";

		// are you wearing it 
		Multiplayer_Entity player = GameObject.FindGameObjectWithTag("Player").GetComponent<Multiplayer_Entity>();
		if(index_BodyModel == player.index_BodyModel)
			return "you are still wearing it";

		return "";
	}

	public void ButtonPressed_inventory_close()
	{

		//GameObject.FindObjectOfType<UIManager>().InventoryAction(); replaced
		ToggleOpenClose(false);
	}

	/// <summary>
	/// Shows the text of a txt file at Resources/Inventory/TextFiles/filename
	/// </summary>
	/// <param name="fileName">File name.</param>
	private void ShowText_Resource(string fileName)
	{

		Debug.Log("Showing TEXT of "+ fileName);

		text_window.SetActive(true);

		TextAsset textFile = Resources.Load("Inventory/TextFiles/" + fileName) as TextAsset;

		ShowText(textFile.text);

		Resources.UnloadAsset(textFile);

	}

	private void ShowText(string text)
	{
		string text_tmp = text;

		Debug.Log("Showing TEXT of item description");

		text_window.SetActive(true);

		// Clear all children
		for(int index_child = scroll_contentRect.childCount - 1; index_child > -1; --index_child)
		{
			Destroy(scroll_contentRect.GetChild(index_child).gameObject);
		}

		// Split the string on newlines
		Text instance;
		while (text_tmp.Length > LongStringSecretSplitter.MaxStringCharacters)
		{
			int index_newline = text_tmp.LastIndexOf
			(
				'\n',
				LongStringSecretSplitter.MaxStringCharacters - 1,
				LongStringSecretSplitter.MaxStringCharacters
			);

			string sub_text = text_tmp.Substring(0, index_newline + 1);
			text_tmp = text_tmp.Remove(0, index_newline + 1);

			instance = Instantiate(text_content_element);
			instance.transform.SetParent(scroll_contentRect, false); //move to element holder

			instance.text = sub_text;
		}

		instance = Instantiate(text_content_element);
		instance.transform.SetParent(scroll_contentRect, false); //move to element holder

		instance.text = text_tmp;

		scroll_contentRect.parent.GetComponent<ScrollRect>().normalizedPosition = new Vector2(0,1);
	}

	private void OutfitItemWasSelected(int clothing_id, int clothing_score)
	{
		Debug.Log("Outfit item was selected ID: " + clothing_id);

		Multiplayer_Entity player = GameObject.FindGameObjectWithTag("Player").GetComponent<Multiplayer_Entity>();

		if(player == null)
		{
			Debug.LogError("no GameObject with the tag (Player) was found");
			return;
		}

		player.index_BodyModel = clothing_id;
		GLOBAL.Player.progress["index_BodyModel"] = player.index_BodyModel;
		GLOBAL.Player.progress["clothingscore"] = clothing_score;
		player.ApplyPlayerModel();
	}


	#region Shop Methods

	public static void OpenShopWindow(string shopName)
	{

		shop_list_current = instance.inventory.GetList(shopName);

		if(shop_list_current == null)
		{
			Debug.LogError("there is no list named "+ shopName);
			return;
		}

		if(!instance.canvas.activeInHierarchy)
			ToggleOpenClose(true);
			//GameObject.FindObjectOfType<UIManager>().InventoryAction(); replaced

		instance.shop_window.SetActive(true);

		Fill_The_Grid(shop_list_current, true);

	}

	private InventoryHandler.Item_List transaction_pointA; // from
	private InventoryHandler.Item_List transaction_pointB; // to
	private int                        transaction_itemIndex;
	private int                        transaction_moneytransfer; // applied to money
	private bool                       transaction_isGood;

	public void ButtonPressed_shop_GridItem(int itemIndex)
	{

		if(itemIndex >= shop_list_current.list_items.Count)
			return;

		string price = GetPrice(shop_list_current.list_items[itemIndex].item_attributes);

		transaction_pointA = shop_list_current;
		transaction_pointB = inventory.lists[0];
		transaction_itemIndex = itemIndex;
		transaction_moneytransfer = int.Parse(price);


		shop_confirmation_window.SetActive(true);

		if(GLOBAL.Player.progress["playercash"].i - transaction_moneytransfer < 0)
		{
			shop_confirmation_text.text = "insufficient funds";
			transaction_isGood = false;
		}
		else
		{
			shop_confirmation_text.text = "Purchase " + shop_list_current.list_items[itemIndex].item_name + 
				" for $"+ transaction_moneytransfer;
			transaction_isGood = true;
		}

	}

	public void ButtonPressed_confirmTransaction(bool isGood)
	{
		Debug.Log("transaction_isGood: " + transaction_isGood);

		if (!transaction_isGood)
		{
			shop_confirmation_window.SetActive(false);
			return;
		}
			
		// final "are you sure" button
		if (isGood)
		{
			// player buying
			if (transaction_pointB == inventory.lists[0])
			{
				string[] attributes = transaction_pointA.list_items[transaction_itemIndex].item_attributes.Split(',');
				int      index_BodyModel = 0;
				int      clothing_score  = 0;

				// check if it is an outfit
				for (int a = 0; a < attributes.Length; a++)
				{
					if (attributes[a].Contains("OUTFIT"))
					{
						Debug.Log("== attributes: " + string.Join(",", attributes) + ", a: " + 1);

						int.TryParse(attributes[a].Split('=')[1], out index_BodyModel);
						int.TryParse(attributes[a + 1].Split('=')[1], out clothing_score);

						Multiplayer_Entity player = GameObject.FindGameObjectWithTag("Player").GetComponent<Multiplayer_Entity>();
						if (player == null)
						{
							Debug.LogError("no GameObject with the tag (Player) was found");
							return;
						}

						OutfitItemWasSelected(index_BodyModel, clothing_score);
						//player.index_BodyModel = index_BodyModel;
						//GLOBAL.Player.index_BodyModel = player.index_BodyModel;
						//player.ApplyPlayerModel();

						break;
					}
				}

				//MoneyBalance += transaction_moneytransfer;
				LuaFunctions.decplayercash(transaction_moneytransfer);

				//transaction_pointB.list_items.Add(transaction_pointA.list_items[transaction_itemIndex]);

				// BChance: Ensure that the player inventory persists the purchase.
				Player_AddItemWithKey(transaction_pointA.list_items[transaction_itemIndex].item_key);

				transaction_pointA.list_items.RemoveAt(transaction_itemIndex);

				Fill_The_Grid(inventory.lists[0], false);
				Fill_The_Grid(shop_list_current, true);
			}
			// player selling
			else if (transaction_pointB == shop_list_current)
			{
				LuaFunctions.incplayercash(transaction_moneytransfer);

				transaction_pointB.list_items.Add(transaction_pointA.list_items[transaction_itemIndex]);

				// BChance: Ensure that the player inventory persists the sale.
				Player_RemoveItemWithKey(transaction_pointA.list_items[transaction_itemIndex].item_key);

				Fill_The_Grid(inventory.lists[0], false);
				Fill_The_Grid(shop_list_current, true);
			}

		}

		shop_confirmation_window.SetActive(false);

	}

	private static string GetPrice(string item_attributes)
	{

		string[] attributes = item_attributes.Split(",".ToCharArray(), System.StringSplitOptions.None);
		for(int a=0; a< attributes.Length; a++)
		{
			if(attributes[a].Contains("PRICE"))
			{
				string[] split = attributes[a].Split("=".ToCharArray(), System.StringSplitOptions.None);
				return split[1];
			}
		}

		return "0";
	}

	#endregion


	// MonoBehaviour call
	// called when something in the inspector is changed
	void OnValidate()
	{

		//AddSourceItems();
	}

	Sprite GetSprite(string name_sprite)
	{
		return sprites
				.Where(x => x.name.Equals(name_sprite))
				.FirstOrDefault();
	}

	void AddPaulinesMaleItems()
	{
		inventory.CreatNewList("npc_Pauline_male", new InventoryHandler.Inventory_Item[]
		{
			GetSourceItemByKey("moutfit8"),
			GetSourceItemByKey("moutfit17"),
			GetSourceItemByKey("moutfit18"),
			GetSourceItemByKey("moutfit23"),
			GetSourceItemByKey("moutfit27"),
		});
	}

	void AddPaulinesFemaleItems()
	{
		inventory.CreatNewList("npc_Pauline_female", new InventoryHandler.Inventory_Item[]
		{
			GetSourceItemByKey("foutfit3"),
			GetSourceItemByKey("foutfit11"),
			GetSourceItemByKey("foutfit13"),
			GetSourceItemByKey("foutfit21"),
			GetSourceItemByKey("foutfit22"),
		});
	}

	// just in case
	void AddSourceItems()
	{
		inventory.CreatNewList("Source_Items", new InventoryHandler.Inventory_Item[]
		{
			new InventoryHandler.Inventory_Item
			(
				"bobblehead",
				"Bobblehead Doll",
				GetSprite("iit_midmisc_004"), 
				"This limited edition bobblehead doll celebrates a special teams member of the New City High School football team.  Apparently distributed during a game that the High School designated as bobblehead night, this particular model has his bobble head duct taped to the rest of the bobble body.  The base of the doll reads, \"Property of the Tchochke Shop.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"capacitor",
				"Capacitor",
				GetSprite("iit_thnmisc_002"), 
				"High voltage, low impedance parallel-plate capacitor, now with low equivalent series resistance.  Ideal for use in power factor correction, signal coupling, or discharging polychlorinated biphenyls into the local drinking water system.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"acctcert",
				"Certificate of Accounting",
				GetSprite("iit_midmisc_003"), 
				"The bearer of this certificate understands the basics of business taxation in New City, and has demonstrated the ability to calculate accounting profit if given figures for both sales, or revenues, and expenses.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"circuitboard",
				"Circuit Board",
				GetSprite("iit_midmisc_007"), 
				"An insulated board on which circuits and other microcomponents are interconnected by copper pathways.  Although useful for many sorts of electronics applications, this particular rigid fiberglass board looks outdated, and smells of dirty socks.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"invcontract",
				"Standon's Contract",
				GetSprite("iit_midmisc_011"), 
				"This is an official-looking document from City Hall, summarizing an agreement between the City and the vendor to exchange services for the amount you told Will Standon.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"vendorcontract",
				"Vendor's Contract",
				GetSprite("iit_midmisc_011"), 
				"This is a contract drawn up by your vendor that agrees to exchange a performance - in this case, vendor services to help with the oil spill - for a consideration, which in this case is the amount you negotiated with your vendor.  It contains several other inexplicable clauses, however, that you are not sure you understand.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"signedcontract",
				"Festival Services Agreement",
				GetSprite("iit_midmisc_011"), 
				"This is document summarizing an agreement between the City and the vendor to exchange services for the amount negotiated with the vendor.  It has been signed by both the vendor and the Mayor, and should be given to Standon at City Hall so that he may file it away for future reference.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"cottoncandy",
				"Cotton Candy",
				GetSprite("iit_midmisc_005"), 
				"A heaping pink mound of fluffy, stringy spun sugar looks like it would be for sale at a festival.  A close look at the paper cone-like handle reveals \"May induce nasuea in humans and promote extreme hyperactivity in children. Made by Circus Foods Inc. for Big Fun Amusements.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"digitalis",
				"Digitalis",
				GetSprite("iit_smlmisc_003"), 
				"Heart Medication for Seniors.  May cause hot flashes, nausea, inability to cross streets unattended.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"helixsw",
				"Helix Switch",
				GetSprite("iit_midmisc_008"), 
				"Electromagnetic waves traveling strips of metal in this device, wound in a spiral about the path of the beam, so that the wave travels along the tube at a velocity approximately equal to the beam velocity. This device is useful for hobbyists making electron guns.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hotdog1",
				"Hot Dog",
				GetSprite("iit_thnmisc_005"),
				"We Proudly Use 100% Premiere Quality, Grade-AAA Reconstituted Animal Byproducts. Intended for consumption by humans and sub-human primates only.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hotdog2",
				"Hot Dog",
				GetSprite("iit_thnmisc_005"),
				"We Proudly Use 100% Premiere Quality, Grade-AAA Reconstituted Animal Byproducts. Intended for consumption by humans and sub-human primates only.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hotdog3",
				"Hot Dog",
				GetSprite("iit_thnmisc_005"),
				"We Proudly Use 100% Premiere Quality, Grade-AAA Reconstituted Animal Byproducts. Intended for consumption by humans and sub-human primates only.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hotdogbox",
				"Hot Dog Box",
				GetSprite("iit_midmisc_012"), 
				"We Proudly Use 100% Premiere Quality, Grade-AAA Reconstituted Animal Byproducts. Intended for consumption by humans and sub-human primates only.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hotdogbun",
				"Hot Dog Bun",
				GetSprite("hotdogbun"), 
				"The plastic wrapping on these age-old hot dog buns is now fused with its mold-ridden, hardened contents. Barely legibile on the deteriorated packaging, however, is a handwritten note scrawled in permanent marker: \"Property of Sloboloasch's Infamous Hotdogs\".",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"magazine",
				"Magazine",
				GetSprite("iit_midmisc_009"), 
				"This is a magazine that is so old the stories it contains are no longer relevant - although there is an interesting 30 page article on getting the most out of photographing your pet.  A tabbed insert reads, \"Property of New City News Stands, Inc.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"mustard",
				"Mustard",
				GetSprite("mustard"), 
				"You feel dizzy and almost faint as you open this bottle, labeled \"Industrial-Grade Mustard\". You check the expiration date and notice that you were born only months earlier. A stamp on the lid reads \"Property of Sloboloasch's Infamous Hotdogs\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"newspaper",
				"Newspaper",
				GetSprite("iit_midmisc_016"), 
				"This newspaper is so out-of-date is so old it contains mostly useless information ñ although it appears that no one has done the crossword yet.  A tabbed insert reads, \"Property of New City News Stands, Inc.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"newsraffle",
				"Newspaper Raffle Ticket",
				GetSprite("iit_smlmisc_005"), 
				"Raffle Ticket",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"postagestamps",
				"Postage Stamps",
				GetSprite("iit_smlmisc_002"), 
				"Never pay postage in New City again with this roll of stamps commemorating New City's founding fathers, Remmy and Rom Newstein.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"recyclables",
				"Recyclables",
				GetSprite("recyclables"), 
				"100% Recyclable materials, to be redeemed at any New City Department of Sanitation Recycling Bin.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"novelleraffle",
				"Rita Novell's Raffle Ticket",
				GetSprite("iit_smlmisc_005"), 
				"Raffle Ticket",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"speakerwire",
				"Speaker Wire",
				GetSprite("iit_thnmisc_004"), 
				"Premium high-grade speaker wire that is resistance-free, has low capacitance, and zero inductance.  A tag wrapped around the wire makes it known that this particular wire is \"Property of Techtronics\".",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"stethoscope",
				"Stethoscope",
				GetSprite("iit_thnmisc_003"), 
				"Vintage 1960's open chest-piece binaural stethoscope, with a stiff plastic diaphragm and firm tubing with a single lumen bore.  Although it no longer works, a tag wrapped around the base of the left earpiece reads \"Property of First Responders.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"transistor",
				"Transistor",
				GetSprite("iit_thnmisc_007"), 
				"Insulated gate field-effect transistor with three terminals.  This semiconductor device is well suited for amplification, switching and voltage stabilization",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"trash1",
				"Trash",
				GetSprite("iit_midmisc_001"), 
				"You try to examine the contents of this bundle of garbage, but the smell overpowers your curiosity. Perhaps you should just throw it away.",
				0,
				"TRASH"
			),
			new InventoryHandler.Inventory_Item
			(
				"trash2",
				"Trash",
				GetSprite("iit_midmisc_002"), 
				"You try to examine the contents of this bundle of garbage, but the smell overpowers your curiosity. Perhaps you should just throw it away.",
				0,
				"TRASH"
			),
			new InventoryHandler.Inventory_Item
			(
				"slobraffle",
				"Vladimir Sloboloasch's Raffle Ticket",
				GetSprite("iit_smlmisc_005"), 
				"Raffle Ticket",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"raveticket",
				"Raveboy's Raffle Ticket",
				GetSprite("iit_smlmisc_005"), 
				"Raffle Ticket",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit1",
				"Casual Outfit",
				GetSprite("ipm_chest001"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=0,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit3",
				"Casual Outfit",
				GetSprite("ipm_chest003"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=3,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit4",
				"Casual Outfit",
				GetSprite("ipm_chest004"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=4,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit5",
				"Casual Outfit",
				GetSprite("ipm_chest005"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=5,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit6",
				"Casual Outfit",
				GetSprite("ipm_chest006"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=6,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit7",
				"Casual Outfit",
				GetSprite("ipm_chest007"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=7,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit8",
				"Casual Outfit",
				GetSprite("ipm_chest008"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=1,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit9",
				"Casual Outfit",
				GetSprite("ipm_chest009"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=2,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit11",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest011"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=11,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit12",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest012"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=12,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit13",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest013"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=13,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit15",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest015"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=15,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit17",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest017"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=2,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit18",
				"Business-Appropriate Outfit",
				GetSprite("ipm_chest018"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=3,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit21",
				"Spiffy Outfit",
				GetSprite("ipm_chest021"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=21,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit22",
				"Spiffy Outfit",
				GetSprite("ipm_chest022"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=22,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit23",
				"Spiffy Outfit",
				GetSprite("ipm_chest023"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=4,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit24",
				"Spiffy Outfit",
				GetSprite("ipm_chest024"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=24,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit27",
				"Spiffy Outfit",
				GetSprite("ipm_chest027"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=5,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit28",
				"Spiffy Outfit",
				GetSprite("ipm_chest028"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=28,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"moutfit31",
				"Casual Outfit",
				GetSprite("ipm_chest031"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=31,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit1",
				"Casual Outfit",
				GetSprite("ipf_chest001"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=0,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit3",
				"Casual Outfit",
				GetSprite("ipf_chest003"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=1,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit4",
				"Casual Outfit",
				GetSprite("ipf_chest004"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=4,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit5",
				"Casual Outfit",
				GetSprite("ipf_chest005"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=5,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit6",
				"Casual Outfit",
				GetSprite("ipf_chest006"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=6,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit8",
				"Casual Outfit",
				GetSprite("ipf_chest008"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=8,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit9",
				"Casual Outfit",
				GetSprite("ipf_chest009"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=9,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit10",
				"Casual Outfit",
				GetSprite("ipf_chest010"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=10,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit11",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest011"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=2,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit12",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest012"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=12,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit13",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest013"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=3,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit14",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest014"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=14,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit15",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest015"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=15,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit16",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest016"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=16,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit17",
				"Business-Appropriate Outfit",
				GetSprite("ipf_chest017"), 
				"A smart and spiffy suit by noted New City fashion designer and clothier, Pauline.  Ideal for business meetings, or for those who simply would like a professional look.",
				0,
				"PRICE=100,OUTFIT=17,SCORE=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit21",
				"Spiffy Outfit",
				GetSprite("ipf_chest021"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=4,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit22",
				"Spiffy Outfit",
				GetSprite("ipf_chest022"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=5,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit23",
				"Spiffy Outfit",
				GetSprite("ipf_chest023"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=23,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit24",
				"Spiffy Outfit",
				GetSprite("ipf_chest024"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=24,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit25",
				"Spiffy Outfit",
				GetSprite("ipf_chest025"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=25,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit27",
				"Spiffy Outfit",
				GetSprite("ipf_chest027"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=27,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit28",
				"Spiffy Outfit",
				GetSprite("ipf_chest028"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline.  This is a truly versatile outfit, and is at home both at the office, or around the house.",
				0,
				"PRICE=50,OUTFIT=28,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"foutfit31",
				"Casual Outfit",
				GetSprite("ipf_chest031"), 
				"A sporty outfit by noted New City fashion designer and clothier, Pauline.  When dressing well means dressing down, an outfit like this screams \"well dressed.\"",
				0,
				"PRICE=25,OUTFIT=31,SCORE=0"
			),
			new InventoryHandler.Inventory_Item
			(
				"goodbadge",
				"Badge 1",
				GetSprite("badge"), 
				"This is a volunteer badge given to volunteers accepting donations to help with the spill. This badge looks very official. The serial number reads \"RDM177655540\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"fakebadge",
				"Badge 2",
				GetSprite("badge"), 
				"This is a volunteer badge given to volunteers accepting donations to help with the spill. This badge looks like a copy. There's a serial number over some white-out that reads \"TAX192677750\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"apron",
				"Apron",
				GetSprite("apron"), 
				"This apron has seen better days, and is clearly worn through with bloody stains and small tears. The label on it reads \"Warning! Biohazardous Materials. Store safely and do not burn or dispose of in a landfill. Property of Vitelli's Butcher Shop.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"beef",
				"Side of Beef",
				GetSprite("beef"), 
				"The smell of this rarified slab of meat, which is way beyond its intended date of consumption, is nearly unbearable - yet it has a beautiful array of colorful crystalline formations protruding throughout. You can make out a branded mark beneath the layers of deterioration that reads \"Property of Vitelli's Butcher Shop\".",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"blitzocontract",
				"Contract from Blitzo the Clown",
				GetSprite("blitzocontract"), 
				"This is a colorful contract, written by Blitzo the Clown in invisible ink, which is decorated with little pictures of clowns and balloons. It is an agreement to provide a fundraiser for the City to aid the relief and recovery effort in exchange for a set amount. It is signed by both you and Blitzo the Clown.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"certificate",
				"Certificate of Accounting",
				GetSprite("certificate"), 
				"This is an elegant certification, printed on fine parchment, handwritten in stunning calligraphy and adorned with an embossed stamp. It states its bearer understands basic concepts of economic decision-making, and has demonstrated the ability to successfully conduct cost-benefit analyses",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"check",
				"Check",
				GetSprite("check"), 
				"This is a tattered check Jeff Punkman gave you. It is made out to you for $25 and no sense.  It is dated two years ago.  It is probably worthless.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"issigned",
				"Vendor Signed Contract",
				GetSprite("iit_midmisc_011"), 
				"This is an official-looking document from City Hall, summarizing an agreement between the City and CHOICE to exchange services for COST in cash.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"cityhallcontract",
				"City Contract",
				GetSprite("cityhallcontract"), 
				"This is an official-looking document from City Hall, summarizing an agreement between the City and CHOICE to exchange services for COST in cash.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"cleaver",
				"Cleaver",
				GetSprite("cleaver"), 
				"This meat cleaver has seen heavy use, as evidenced by the various nicks and missing chunks from the knife's blade. Worn beyond the point of repair, it clearly has not been serviceable for quite a while - yet its handle is still sticky. A label on the handle reads \"Property of Vitelli's Butcher Shop\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"coffeecontract",
				"Signed Vendor Contract",
				GetSprite("coffeecontract"), 
				"This is a coffee-stained, facsimile copy of the contract that CHOICE's lawyer drafted, that you were forced to accept - for better or for worse. It summarizes an agreement between the City and CHOICE to exchange services for COST in cash. It has been signed by CHOICE and is now awaiting signature by the Mayor. What impresses you most about the six-page, stapled document is that the cursive handwriting is unusually legible.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"coldcuts",
				"Dried out cold-cuts",
				GetSprite("coldcuts"), 
				"You try to unpeel the waxpaper wrapped around these cold cuts, but find that it is stuck together. Banging the package on the ground doesnít help either. As you resign to abandon your struggle to tear off the packaging, you notice a sticker that reads \"Property of Vitelli's Butcher Shop\".",
				0,
				""
			),
			//new InventoryHandler.Inventory_Item
			//(
			//	"[key]",
			//	"Contract",
			//	null, 
			//	"This is an official-looking document from City Hall, summarizing an agreement between the City and CHOICE to exchange services for COST in cash. It has been signed by CHOICE and is now awaiting signature by the Mayor.",
			//	0,
			//	""
			//),
			new InventoryHandler.Inventory_Item
			(
				"dustcontract",
				"Contract from Nathan Broome",
				GetSprite("dustcontract"), 
				"This is a typo-filled contract, written by Nathan Broome, that is covered in grains of sawdust. In it, Broome promises to stage a wildlife rescue effort from the oil spill in the New City River. It is signed by both you and Nathan Broome.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_1",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_2",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_3",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_4",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_5",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_6",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_7",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_8",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_9",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"emptycollectkits_10",
				"Water Sample Kits",
				GetSprite("emptycollectkits"), 
				"Mack has given you these empty sample collection kits to be filled with sample water and tested. Click on any of animated ëbulls-eyesí by the sample collection locations to collect a sample and perform the proper tests.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"frozendogs",
				"Frozen Franfurters",
				GetSprite("frozendogs"), 
				"This is a package of frozen hot dog buns, yet it weighs as much as a stone. Still cold, the package reads \"Package of Five Dozen Frankfurters, made from 100% reconsituted animal byproducts. For consumption by caged bears and sub-human primates only.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"guitar",
				"Electric Guitar",
				GetSprite("guitar"), 
				"This is the guitar that Jeff Punkman asked you to retrieve from behind Can't Get Enough Media. It is a smoking electric guitar adorned with stickers and duct tape, and signed by Punk legend Nick Nasty. It is clearly labeled 'Property of CGEM'",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"mustardcontract",
				"Contract from Joey Cramarossa",
				GetSprite("mustardcontract"), 
				"This is a mustard-stained contract, written by Joey Cramarossa, which smells slightly of pastrami. In it, Joey promises to make sandwiches to feed the relief workers and volunteers for the early stages of the crisis response. It is signed by both you and Joey Cramarossa.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"package",
				"Package from Pauline's",
				GetSprite("package"), 
				"This is the package that Mickey Jones asked you to retrieve from behind Pauline Zeeís clothing shop. It is clearly labeled ìProperty of Pauline Zeeî",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"pamphlet",
				"Pamphlet",
				GetSprite("pamphlet"), 
				"This official-looking pamphlet is decorated with various official-looking logos and insignias. It contains information about volunteering for various civic organizations. The contact information on the back indicates the pamphelet was printed by National Readiness Audio Visual, Inc.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"recyclables",
				"Recyclables",
				GetSprite("recyclables"), 
				"100% Recyclable materials, to be redeemed at any New City Department of Sanitation Recycling Bin.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"sauerkraut",
				"Sauerkraut",
				GetSprite("sauerkraut"), 
				"This is a tub of sauerkraut labeled \"Prison-Grade Pickled Cabbage. Contents may include Aluminum Tetrahydrochlorate\". You notice also that it has several years past expiration - and that it is marked \"Property of Sloboloasch's Hot Dogs\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_1",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_2",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_3",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_4",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_5",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_6",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_7",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_8",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_9",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"scollectkits_10",
				"Sample Collection Kits",
				GetSprite("scollectkits"), 
				"These are 10 individual sample collection kits from New City Preservation Society. They are pre-labeled as follows: \"Samples of New City River, to be Tested for Contaminants. Store in a cool, dry, place. For best results, use in conjunction with the H2T-2000 family of sample testing devices.\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"startermotor",
				"Starter Motor",
				GetSprite("startermotor"), 
				"This is a reconditioned starter motor for a generator - which, judging by the size, would be capable of powering a small stadium. A small sticker reads \"Another Fine Repair by Lindo Equipment, New City, Elliot County. (218) 555-2749\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"tiedyeshirt",
				"Tie-dyed T-Shirt",
				GetSprite("tiedyeshirt"), 
				"This expertly tie-dyed T-Shirt seems like it would be at home in a concert parking lot, an upscale vegan restaurant, or a company picnic. The label on the inside of the collar reads \"Wash in cold water. Drip dry. Do not dry clean. Original design by Needles N' Threads\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"volttest",
				"H2T-2500 Water Sample Testing Device",
				GetSprite("volttest"), 
				"This is a Hydro-Analytics H2T-2500 testing device which can be used to derive important data about contaminants from water samples. It is labeled \"Property of Critical Point Consulting. If found please call (218) 555-3275\"",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"watersample",
				"Sample Test Results",
				GetSprite("watersample"), 
				"This is a water sample that has been collected from the River, which must be brought back to Mack McKinnon at New City Boaterís Paradise. They have been pre-labeled by Mack with orange stickers that read, ëHandle with care. Keep away from children",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"suit",
				"Spiffy Suit from Mickey",
				GetSprite("suit"), 
				"A casual outfit by noted New City fashion designer and clothier, Pauline. This is a truly versatile outfit, and is at home both at the office and around the house.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"webstercontract",
				"Contract from Webster Dweeb",
				GetSprite("contract"), 
				"This is a contract, printed out from a computer at the Internet CafÈ, authored by Webster Dweeb. The contract promises to stage an Internet campaign to help raise awareness for the oil spill and encourage volunteering for the relief effort. It is signed by both you and Webster Dweeb",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"demetercontract",
				"Contract from Demeter McCarthy",
				GetSprite("contract"), 
				"This is a contract, handwritten on Techtronics stationery, written by Demeter McCarthy, in which he promises to provide communications equipment to the vendor. It is signed by both you and Demeter McCarthy.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"marcoscontract",
				"Contract from Marcos Mendes",
				GetSprite("contract"), 
				"This is a contract, immaculately handwritten by Marcos Mendes on the back of napkin, that promises to plan an ecological restoration effort around the New City River and adjoining wetlands. It is signed by both you and Marcos Mendes.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"greencertificate",
				"Certificate of Ecological Awareness",
				GetSprite("certificate"), 
				"Impress your friends and make your team-mates jealous with this 100% recycled-paper certificate claims that its bearer has demonstrated awareness in environmental matters regarding the role of water as an earth system.",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"hammer",
				"Hammer",
				GetSprite("hammer"), 
				"This is a high-end balpeen hammer, probably used by an enthusiast, advanced hobbyist, or government agency - which you can discern by the high purchase price on the sticker.  It reads \"New City Tools & Equipment Store Special - $45\".",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"moneybag",
				"Money Bag",
				GetSprite("iit_midmisc_014"), 
				"[Description Here]",
				0,
				""
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard1",
				"Marvin Moneymaker's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Marvin Moneymaker's Business Card.\nLocated at Media Relations, Inc.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard2",
				"Nina Ojeda's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Nina Ojeda's Business Card.\nLocated at Narravi Associates.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard3",
				"Sandy Carlson's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Sandy Carlson's Business Card.\nLocated at New City Cinema.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard4",
				"Gabe Vine's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Gabe Vine's Business Card.\nLocated at New Media Communications.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard5",
				"Bjorn Egan's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Bjorn Egan's Business Card.\nLocated at Norse Communications.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard6",
				"Nurse John Gray's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Nurse John Gray's Business Card.\nLocated at First Responders.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard7",
				"Tom Barrier's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Tom Barrier's Business Card.\nLocated at Medic! Inc.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard8",
				"Dr. Zeke Mullen's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Dr. Zeke Mullen's Business Card.\nLocated at Mullen Medical Supply.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard9",
				"Gil Fermin's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Gil Fermin's Business Card.\nLocated at New City Emergency Medics Association.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard10",
				"Dennis McCarthy's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Dennis McCarthy's Business Card.\nLocated at Techtronics.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard11",
				"Mark Carpenter's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Mark Carpenter's Business Card.\nLocated at Power Displays.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard12",
				"Bill Burells's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Bill Burells's Business Card.\nLocated at Burells Brothers.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard13",
				"Phil Burells's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"DJ Synapse's Business Card.\nLocated at Burells Brothers.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard14",
				"Anthony Wexler's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Anthony Wexler's Business Card.\nLocated at Interstate Containment.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard15",
				"Peter Boltright's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Peter Boltright's Business Card.\nLocated at Premiere Containment.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard16",
				"Oroko Nakashima's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Oroko Nakashima's Business Card.\nLocated at Running Rivers Corporation.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard17",
				"Nathaniel Wailer's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Nathaniel Wailer's Business Card.\nLocated at Eco-Tech.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard18",
				"Skeeter McBragg's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Skeeter McBragg's Business Card.\nLocated at Enviro-X.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard19",
				"Heather Winehart's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Heather Winehart's Business Card.\nLocated at Heather Winehart's Loft.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard20",
				"Jannis Economou's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Jannis Economou's Business Card.\nLocated at Ypoforo Ecosystems.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard21",
				"Ramblin' Rose's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Ramblin' Rose's Business Card.\nLocated at park by City Hall.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard22",
				"Heather Winehart's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Heather Winehart's Business Card.\nLocated at Heather Winehart's Loft.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard23",
				"Wes Berlin's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Wes Berlin's Business Card.\nLocated at Wes Berlin's Mom's Basement.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard24",
				"Lakeisha's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Lakeisha's Business Card.\nLocated at Can't Get Enough Media.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard25",
				"Grandmaster G's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Grandmaster G's Business Card.\nLocated at Grandmaster G's Recording Studio.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard26",
				"Fiona Rudd's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Fiona Rudd's Business Card.\nLocated at Remember the Mane Hair Salon.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard27",
				"D-Verb's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"D-Verb's Business Card\nLocated at Hip Hop House Loft's",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard28",
				"Margaret Wong's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Margaret Wong's Business Card.\nLocated at Phoenix Services Group.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard29",
				"Cedric Maxwell's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Cedric Maxwell's Business Card.\nLocated at Force One Logistics.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard30",
				"Sam Shortback's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Sam Shortback's Business Card.\nLocated at Prairie Services Group.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard31",
				"Dave Shortback's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Dave Shortback's Business Card.\nLocated at Western Logistics.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard32",
				"Willie Ketchum's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Willie Ketchum's Business Card.\nLocated at City Hall.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard33",
				"Ashley Dapper's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Ashley Dapper's Business Card.\nLocated at Clean Green Machinery.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard34",
				"Wanda Rown's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Wanda Rown's Business Card.\nLocated at Potty Princess.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard35",
				"Freida West's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Freida West's Business Card.\nLocated at West Disposal Services.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard36",
				"Adam Baum's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Adam Baum's Business Card.\nLocated at Dis-Po Corporation.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard37",
				"Count de Monet's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Count de Monet's Business Card.\nLocated at Thone Time.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard38",
				"Avanish Singh' Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Avanish Singh' Business Card.\nLocated at Eastern Legal.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard39",
				"Anthony Dewey's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Anthony Dewey's Business Card.\nLocated at Dewey, Sewham, and Howe.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard40",
				"Abbie S. Korpis's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Abbie S. Korpis's Business Card.\nLocated at Abbie S. Korpis Associates.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard41",
				"Liddy Gates's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Liddy Gates's Business Card.\nLocated at Gates & Partners.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard42",
				"Debra Geffen's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Debra Geffen's Business Card.\nLocated at Click-Adz.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard43",
				"Peter Boltright's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Peter Boltright's Business Card\nHe is Located at Boltright's Garage",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard44",
				"Phil Gastrow's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Phil Gastrow's Business Card.\nLocated at Hav-A-Seat Facility.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard45",
				"Pierre Torque's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Pierre Torque's Business Card.\nLocated at RideRight Inc.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard46",
				"Roseanne Bellagiorno's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Roseanne Bellagiorno's Business Card.\nShe is located at Buona Fortuna.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard47",
				"Samantha Kim's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Samantha Kim's Business Card.\nLocated at Apex Protection Services.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard48",
				"Sandy Carlson's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Sandy Carlson's Business Card.\nLocated at New City Cinema.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard49",
				"Sean Kwerty's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Sean Kwerty's Business Card.\nLocated at hiTek Security.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard50",
				"Tools And Equipment Flyer",
				GetSprite("iit_smlmisc_001"), 
				"We've got all the tools!\nNew City Tools and Equipment",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard51",
				"Burning Man Ticket",
				GetSprite("iit_smlmisc_001"), 
				"Admit one to 2009 Burning Man Festival\n(Bring lots of Water)",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard52",
				"Terrell Douglas' Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Terrell Douglas' Business Card.\nNational Audio Visual.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard53",
				"Tom Barrier's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Tom Barrier's Business Card.\nMedic! Inc.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard54",
				"Vernon Sharpe's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Vernon Sharpe's Business Card.\nLocated at United Americans Club.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard55",
				"Vladimir Sloboloasch's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Vladimir Sloboloasch's Business Card.\nLocated at Downtown by City Hall.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard56",
				"Wanda Rown's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Wanda Rown's Business Card.\nLocated at Potty Princess.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard57",
				"Webster Dweeb's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Webster Dweeb's Business Card.\nLocated at the Internet Cafe",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard58",
				"Wes Berlin's Business Card",
				GetSprite("iit_smlmisc_001"), 
				"Wes Berlin's Business Card.\nLocated at Wes Berlin's Mother's House.",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"businesscard59",
				"Free Dance Lesson Coupon",
				GetSprite("iit_smlmisc_001"), 
				"Bearer Entitled to \n\nOne Free Ballroom Dance Lesson\nExpires 1883",
				0,
				"BIZ_CARD"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1crier",
				"Elliot County Enquirer",
				GetSprite("iit_midmisc_016"), 
				"Local Firm Focused on Growth\n\nMaybe it’s time to test the heavy hitting PR firm Navari Associates for steroids as it prepares for a huge statewide expansion. “It’s phenomenal,” croons Navari president Nina Ojeda with a broad smile, “Bad press is making for great business across the state. We’re hearing from big companies, small businesses and public service clients. We welcome anyone who’s been tragically maligned by the media.” Ojeda attributes Navari’s success to two key principles: Hire top experts who can clearly communicate technical information to the general public; and maintain a positive tone in the face of negative press.  But behind the optimism, there are growing pains. “There’s nowhere to sit!” complains one new employee who asked to remain anonymous. “And there’s static build up everywhere – I don’t even want to tell you where I shocked myself this morning!” But help is on the way. Ojeda announced an investment in extra desks, phone lines, anti-static floor mats and new hires to take on the projects – to the tune of $1800. Is it possible some of that money is going to business steroids?\n\n\n\n\n\n\n\n\nLocal Press Conference Breaks Record!\n\nIt’s official! Local advertising professional Gabe Vine has shattered the world’s record for the longest press conference in history. Three days, four hours and twenty-six minutes was the final count, besting the old record of two hours and ten minutes set back in 1929. Using a combination of herbal stimulants, protein shakes and a catheter, Vine was able to keep going despite a dwindling audience. “We stuck it out for the first two days,” says TV reporter Jim Dust, “but then our camera equipment burned out.” Vine, who heads the PR firm New Media Communications (NMC), called the press conference to discuss the recent collapse of the entrance to the New City tunnel in the hopes of deflecting criticism away from his client, Letsee Construction. The marathon event started with a relatively brief hour long statement, then spun out of control when a reporter asked Vine about the epoxy resin Letsee Construction used to hold ceiling bolts in place. “Vine got a weird look in his eye,” says Dust, “and just went off about adhesion science – molar attraction constants, hydrogen bonding – his knowledge was endless!” After three days, Vine’s voice finally gave out.  He is now billing his client $500 for lozenges, throat spray and homeopathic laryngitis remedies.    \n\n\n\n\n\n\n\n\nLocal Firm Leaves Mark with International Clients\n\nWhere do some of the most prestigious international companies turn when they need media relations services? New City. That’s right, we have a gigantic multinational PR firm in our midst and many of us don’t even know it.  The name? Norse Communications. Bjorn Egan heads the local affiliate of the global powerhouse that specializes in big projects for top international companies. “It is now a 24x7 world where firms like Norse can leverage global resources to fulfill our clients’ needs,” Egan efficiently explains. While this model does give them global reach, it lacks something in local feel. “We never see them, except at softball games,” remarked a PR staffer at a rival local firm, “It’s a little strange.  Come to think of it, so are they.” Another curious trait is the eyebrow raising list of expenses Norse passes along to its clients which include blonde hair dye, techno CDs, fancy herbal teas and sun lamps – the price tag?  $500. While this kind of lavish spending may be overlooked by high profile clients, local businesses have shied away from using Norse. “We prefer to spend money on our brand image,” opined one local business, “Not some freaky Nordic rave.”\n\n\n\n\n\n\n\n\nLocal Man Named to Fortunate 100!\n\nMarvin Moneymaker has lived up to his name. His company, Media Relations Inc. (MRI) was just named the top grossing PR firm in the county.  What makes the achievement all the more impressive is that MRI handles only local clients. “We know what people around here want,” remarked Moneymaker, “and how to make them pay for it.” His string of recent successes includes getting people to buy Hillford Dairy’s spoiled milk by deeming it “Spoilicious” and deflecting criticism away from a recent shipping disaster by calling it a commemorative re-enactment of a recent disaster in the Rosendale Reservoir. MRI’s local success does have Moneymaker eyeing markets outside of Elliot County. “I’d like to expand statewide,” he explains, “because it would give me more reasons to drive my sports cars.” Moneymaker keeps a collection of fancy, imported cars at a temperature controlled garage out of town. Incredibly, he gets his clients to pay the $500 leases for him. “It’s totally business related,” Moneymaker claims, “The faster I get to press conferences, the quicker I can fix their problems.”\n\n\n\n\n\n\n\n\nArea Vendor Overwhelmed!\n\n\nYou notice something strange the moment you enter the offices of New City Emergency Medics Association – all the clocks have 26 hours on them. “It gives us an advantage,” explains director of NCEM Gil Fermin, “Because for you, it’s already four in the afternoon, but to us it’s only two – and we gain two more hours on you everyday. Since we’ve implemented this we’re actually several days behind!” But this time shift seems to have consequences for Fermin and his staff. “We’re not really sure when to come in,” says one exhausted EMT, “We all have other jobs in the 24-hour world, so making the switch causes a lot of confusion.” It also seems to baffle Fermin himself. “You wouldn’t happen to know the month, would you?” he asks during an interview, “And…the year?” While the method does allow Fermin’s crew to respond quickly to emergency situations – sometimes even before they occur – it does take its toll in terms of organization. The company is known for paying bills late and some say they are too overwhelmed to take on any new assignments. “They’re totally over worked,” says industry insider Rae Darre, “They probably run into themselves coming and going.” To keep his staff on the move, Fermin spends $500 on sugared candies, caffeine drinks and pep pills. He might want to invest some of that money in more traditional timepieces.    \n\n\n\n\n\n\n\n\nFirst Responders Awarded Contract\n\n\nLocal organization, “Save the Fat”, has awarded the contract to handle all emergency medical services at this year’s charity cook-off event to local company First Responders. The organization, which touts the environmental benefits of recycling all cooking grease, says it made its decision purely on merit. “First Responders constantly trains its staff in the latest response and rescue techniques,” explains Save the Fat’s president, Patti Olean, “They’re particularly up to date on burn treatments.” That’s especially important as the group hopes to fill a 600 gallon glass tank with scalding hot reclaimed cooking oil at the event. First Responders is ready to respond rapidly to any hot oil related mishap. “We charge $2000 in order to have the manpower to handle a situation quickly,” says First Responder’s owner John Grey, “And in this case, we’ll have to move like greased lightning if anything goes wrong.” Grey and team might have their hands full. With no security staff, they might have problems keeping the unattended crowd from jumping in the hot oil for a swim.   \n\n\n\n\n\n\n\n\nMedic, Inc! Displays Decorum in Recent Response \n\nWhen a tanker of marshmallow spread jack-knifed on I-385 in Rosendale last Wednesday, emergency response team Medic! Inc. didn’t rush in willy nilly – they marched in with dignity and decorum. “The only way to avoid panic,” explains Tom Barrier, head of Medic! Inc., “Is discipline.” A former military man, Barrier takes discipline and procedure very seriously. He even hires a detachment of bugle players – at a cost of $500 - to play drills that keep his medics in line. “Seeing them coming through all that gooey, sugary mess with military precision and gravitas,” explained one crash victim covered in marshmallow goop, “almost makes you glad you’re injured.” Barrier’s fully licensed medical and security unit had the experience to handle a very sticky situation. “But they were slow as molasses,” complained Joyce Quicksilver, “I was stuck in my car for hours!” It isn’t the first time Medic! Inc. has been singled out for slow response, but Barrier chafes at that criticism, “In an emergency it’s not important to count the seconds, it’s making sure every second counts.”\n\n\n\n\n\n\n\n\nMechanized Transportation Enables “Rapid” Response\n\nThey call themselves the “silver bullets”. They’re senior citizen EMTs from Mullen Medical Supply Inc. who travel on mechanized scooters- which cost $500 - to provide a rapid response to local emergencies. All over 70 years old, these semi-retired health and security professionals are led by Dr. Zeke Mullen, the celebrated physician who was once given the key to the city for his service to the community. “That was a great day,” recalls Dr. Mullen, still groggy from his mid-day nap, “But I’m having the time of my life right now as a silver bullet!” While the nickname conjures up a lightning fast reaction to a crisis, critics contend these bullets are more like “silver slugs”. Speedologist Dr. Spencer Gonzalez explains, “A 9mm bullet can travel 1500 feet per second – or roughly 1023 miles per hour. The average person runs at about 6 miles an hour. These mechanized scooters top off at around 3 miles per hour – so you can see, the analogy is flawed.” Mullen Medical’s response time is even slower when you factor in their frequent naps, bathroom breaks and occasional dementia. “When you do the math,” remarks Gonzales, “They’re actually moving in reverse.” \n\n\n\n\n\n\n\n\nKnown Containment Specialist Answers Questions\n\nWith over 2,500 patents to his name, containment specialist Peter Boltright has come under fire recently. Is he using his government contracts to clean up toxic spills as a way to fund the R&D of his own inventions? In question is $1800 for specialized remote controlled boats he designed to clean up a spill in Wexlerberg. “Government monies should never, ever fund private research,” declared New City councilman Rick Fist, “Except in the defense, healthcare, transportation and biotech industries.” And what about allegations of public displays of affection between Boltright and containment equipment? “Sure his company, Premier Containment, is the leading authority on containing toxic spills in rivers and his team of crane operators, machinists and engineers can be quickly deployed to a disaster site, but he’s obviously a nutty, greedy weirdo,” said a passerby in downtown New City. To refute these claims, Boltright held a press conference Wednesday at his machine shop. “I do love machines,” admitted Boltright, “but I’m not in love with them. What people saw between me and that dredger was a routine diagnostic check up.” He also explained that his heart will always belong to the toxin containment process itself. \n\n\n\n\n\n\n\n\nElliot County Vendor to Speak at Conference  \n\nNext month New City will host “Green Up Politics”, a statewide conference on how local politicians can become more involved in environmental issues – or at least seem to care about them. The keynote address concerns toxic spill containment which has become a hot button issue thanks to hundreds of tragic incidents over the past few years. “Our rivers have become sewers and our lakes have become toilets,” complained Rosenfield Councilman Dirk Wasser, “We have to take control of this problem locally!” With all the emphasis on local solutions, the choice of Oroko Nakashima as the keynote speaker seems somewhat ironic. While Nakashima is undoubtedly an environmental expert and one of the most sought after containment specialists, she has never worked on a local project in the state. “She’s an ocean clean up rock star,” says local conservationist Patti Elm, “But the ocean is a thousand miles away.” Nakashima’s Running Rivers Corporation does have a mix of equipment to handle almost any kind of containment job, but its lack of local contacts could hinder it in an emergency. “Politicians around here want to be looked up to,” says Elm, “Not talked down to.” Nakashima could score political points with her troupe of acupuncturists and herbalist that she contracts for $500 on every job. Politicians like to know up front when they’ll be stabbed in the back. \n\n\n\n\n\n\n\n\nMilitary-Style Discipline at the Scene of Disaster  \n\nWhen a landside destroyed a pesticide factory in Mesoamerica, local authorities were overwhelmed with the task of containing hazardous materials. In swooped Burells Brothers, an area company led by former Marines Bill and Phil Burells. “It was shock and awe,” reports the region’s governor, Lester Rhine. “They had personnel storming the beach from amphibious troop carriers. Which scared the heck out our tourists. Maybe it was little much, given that the spill is forty miles from the coast.” Highly educated in the logistics and practices of spill containment, the brothers bring years of military experience to the hazmat business, not to mention years-old, even outdated, semi-serviceable decommissioned military equipment, which some say isn’t sufficient to prevent cross-contamination. But if wars and waste cleanup can be won with sheer military grit and efficiency, the Burells and their team of former military “waste wasters,” as they call them, could conquer the world. Flown in by leveraging military transport connection, the Burells’ army of hazmat warriors work with extraordinary precision to “take out the enemy of waste.” And while transport is cheap, the Burells spend $500 on Video games, DVDs, and informative industrial shorts to entertain its off-duty personnel in the ‘rec tent’ between shifts. “Whatever works,” says Governor Rhine, “as long as they leave.”   \n\n\n\n\n\n\n\n\nGreen Rivers Alliance to Award Local Vendor!\n\nDart enthusiast and local entrepreneur Anthony Wexler was honored today by the Green Rivers Alliance for his charitable contributions. The move was questioned by some who point out that Wexler’s attempts at providing hazardous waste containment have often lead to new and unexpected disasters. “Look, his head might be in the clouds, but his heart is in the right place,” explained Drew Ablanc, Awards Committee Chair for the Green River Alliance. “That’s why we chose to honor him with our ‘Guy That Gives a Damn’ award.” The award comes in the form of a large trophy, depicting a bald, anatomically incorrect man with a raised fist. “Wow. The Our Lady of Guancomo statue on my dashboard just got demoted,” Wexler announced upon being handed the award. Included with the award is a cash prize of $1000, and though it’s common practice to donate the check to charity, Wexler indicated that he would be holding on to it by folding the giant check into a small, thick cube and stuffing it into his pocket. It’s assumed that the money will be used to pay the local bar owners who have disclosed the names of dart league participates that Wexler mobilizes for containment efforts.  \n\n\n\n\n\n\n\n\nOverworked Consultant Turns to Unusual Places\n\nWhen stressed and overworked, some seek out massages. Others play golf, read books, hunt neighborhood cats. But for the Busiest Man in the Environmental Consulting Biz, there’s no substitute for soothing reggae music, organic fruits and the solitude of custom built sensory-deprivation chamber. “It’s the closest thing to climbing back into the womb,” explains Nathaniel Wailer, an environmental expert in high demand. “You float in a lightless, soundless void and, after a while, you can almost hear mother breathing around you. It sure beats TV, mon.”  Unconventional, certainly, but it seems to work. Despite his 80-hour work weeks, the Montogan native always appears refreshed, cool-headed and infused with Island-style optimism. With his expertise in using cutting-edge technology that allows him to measure sinkage, spread and cross-contamination at spill sites, he has built a reputation as a leading field consultant and clean-up specialist. Some find his tactics a bit unconventional—like the $500 expense associated with having organic fruits, vegetables and sugar-free candies available to assessment personnel, or his eccentric, handy-man approach to maintaining equipment with duct tape and chewing gum. But everyone agrees always he delivers in high fashion. Could sensory-deprivation be the key to his success? “Maybe,” he ponders. “But it could also have to do with the fact that I meditate every day.” \n\n\n\n\n\n\n\n\nEnvrionmental Consultant Called to Reappear Before Committee\n\nHe first appeared before the committee last Friday, but the only consensus his visit produced was unanimous confusion. “Mr. Economou has a way of speaking that resembles his manner of wearing jewelry,” says Committee Chair Ben Thardondat, referencing the aging playboy environmentalist’s many layers of gold chain necklaces. “That is, overly ornamental and hopelessly entangled.” Now the committee has reluctantly invited Economou back, urging him to give a more conventional report of his company’s recent analysis of New City river, as well as an explanation for the $2000 fee attributed to onsite staff and administrators to man command and control center. Economou’s first presentation confirmed the widely held impression that he can occasionally be disorganized and unruly in appearance, and sometimes has a hard time clearly and concisely communicating his findings. Indeed, the amateur classicist’s report resembled the recitation of a poorly written epic poem. “The sons of our city in dismay bade the heralds call the people to a council man by man,” Economou began his report, continuing with, “but not to cry the matter aloud; I made haste also myself to call them, and they sat sorry at heart in their assembly.” Why didn’t committee members ask for clarification on the spot? “It sounded good,” explains Thardondat, “and no one wanted to look like an idiot. It took us a few days to decide who the real idiot is.” Mr. Economou will reappear this Wednesday.\n\n\n\n\n\n\n\n\nLocal Activist’s Report Makes a Stand!\n\n“Mother Earth ain’t a pushover,” says Ramblin’ Rose, the environmental advocate who recently declared the Grayville Eddy waterways uncontaminated after a series of tests. “Humans try to harsh her mellow but she’s bigger than that.” The conclusion came as a surprise to members of the waterway community who believed something was amiss in the Eddy after spotting a slew of dead fish along the banks, as well as a raccoon with five eyes. They put out a call for help and Ramblin’ Rose answered. By tapping her enormous network of supporters and fans of the 90’s jam band The Boys, she was able to quickly assemble an assessment team. She raised some eyebrows when she demanded $500 worth of inks, colorants and three dozen white t-shirts and work pants to create tie-dyed uniforms for assessment personnel.  She also used equipment purchased from online auction houses, which has led to dubious results in the past. But her colorful crew ran a battery of tests to the sounds of Boys bootleg tapes, broadcast via loudspeaker from Rose’s “earth bus”. Local corporations suspected of dumping contaminants into the waterway were pleased with the findings, leading some to wonder if Rose had been bought off. “Don’t even go there,” Rose warned. And what about the five-eyed raccoon? “Just Mother Nature being creative,” Rose offered with a shrug. “I’ve been with plenty of people whose features some might call, well, unnatural—but I call blessed.”\n\n\n\n\n\n\n\n\nLocal Activist Given Key to the City!\n\nNew City leaders honored local legend environmentalist and skater Skeeter McBragg for his firm’s efforts in cleaning up the New City waterfront. McBragg, whose company Enviro-X is comprised of skater activists, hoisted the key over his head to a roar of applause from his youthful followers. It was clearly a moment of comeuppance for a man whose unconventional tactics have plagued his efforts to be taken seriously as a legitimate protector of the area’s environment. Such questionable tactics include a $1000 on-site command areas consisting of a card table and half-pipe and assessment presentations that are more profane rants than they are statistical reports. A known crusader, McBragg is has been accused of strategies more often associated with eco-terrorists than advocates. His verbal attacks are known for their total lack of scientifically acquired evidence, not to mention reason, nor complete sentences. Yet all this seemed to be water under the bridge, so to speak, as McBragg’s efforts were officially recognized by New City officials. “I’m proud to present this tireless advocate with the key to the city,” announced Councilman Will Hustop. “That’s a big key,” McBragg exclaimed, marveling at the prop before adding, “so where’s the door to the city?” The line earned laughter from all assembled—laughter that was quickly silenced when a frowning McBragg asked, “No. Seriously. Where am I supposed to use this thing?”\n",
				0,
				"NEWS_ElliotCountyCrier=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2crier",
				"Elliot County Enquirer",
				GetSprite("iit_midmisc_016"), 
				"Don’t Be Messing With Lakeisha\n\nCallers to shock jock Lakeisha’s drive-time radio show know they had better be prepared before dialing those digits. Lakeisha doesn’t take ignorant or misinformed comments lightly. If such a comment does happen to slip out, it’s best to hang up immediately and shut off your radio. You might also want to get under a table or other reinforced structure.  Her wide range of knowledge, covering everything from pop culture to environmental issues, makes it difficult to get something by her. Recently, Lakeisha has parlayed this knowledge, as well as her quick tongue, sharp wit, into a successful side career as environment advocate, especially on behalf of the River Clean-Up project. She’s had support from KNCR, which puts up the $4650 needed for the deejay to pre-record interstitials, buy new records and prepare New City River advocacy segments. Now she’s aiming her well-informed fury at oil industry execs, pro-industry city leaders, and carpetbagging businessmen with snake oil clean-up solutions. One such individual, bogus chemical engineer Kent Beetroo, made the mistake of agreeing to an on-air interview. Lakeisha exposed him as a charlatan by quizzing Beetroo on the Periodic Table of Elements—a chart Lakeisha has committed to memory, and that Beetroo clearly never studied, claiming the Elements were grains, meats, dairy products and fruits and vegetables. “Get your sorry-self outta here,” the shock jock demanded, ending both the interview and Beetroo’s bid for a local contract.\n\n\n\n\n\n\n\n\nIt’s All About the G\n\n“I’m all about giving back,” exclaims hip-hop mogul Grandmaster G, when asked why he’s so active in supporting charitable causes. The statement is somewhat ironic coming from a superstar known to spend $2000 on professional styling, tracksuits and sneakers, in order to prepare for upcoming pubic appearances, not to mention thousands on a full-time legal team. But it’s also a generous response, in terms of word count, for a rapper who is verbose in the recording booth but often stumped and silent before reporters. Perhaps his willingness to speak signals a sincere interest in charitable work—a striking difference from many celebrities whose commitment to trendy causes is short-lived and shallow. Maybe the rapper’s rocky past holds the key to his motivations. Orphaned at an early age, Grandmaster G—whose real name is unknown—was adopted by a family of Scandinavian rappers who failed to find an audience for their awkward, nasal rhymes and cheerleader beats. Poor and often homeless, the dejected family traveled from town to town, only to be run out by law enforcement or simply angry passersby. It’s believed that this life of perpetual rejection and poverty, a life without security, basic dietary needs and a single decent groove, has equipped G with the ability to empathize with the deprivations of others. But don’t expect the standoffish, but highly popular star to agree with this assessment. His explanation is much simpler.  “The ‘G’ stands for ‘giving back’ y’all,” he’s known to say. \n\n\n\n\n\n\n\n\n\nDixie Legend Confronted by Ex-Husbands\n\nDixieland legend Fiona Rudd was prevented from performing her duties as a goodwill ambassador when her ex-husbands crashed a ribbon-cutting ceremony for a new recycling plant. “It was crazy,” said plant manager Red Curry. “She was making her way to the stage when all these ex-husbands showed up, demanding alimony.” Witnesses say that the ex-husbands appeared to be working together to corral Rudd at one end of the hall. The use of hand signals and whistled codes suggest the confrontation was well-planned and highly coordinated—a surprise given that Rudd’s ex-husbands aren’t known to be intellectually competent or good planners. A rattled Rudd was escorted by her staff to a safe location and whisked away just ahead of the mob of angry ex-husbands. Rudd herself is often described as ditsy, lacking the education and skills to understand many of the issues for which she now advocates as a spokesperson. Yet she clearly understood that she was in danger of being fleeced by her ex-husbands. Known to freeze in public when confronted by the press, she delivered an adrenaline-fueled and uncharacteristically articulate explanation to reporters after law enforcement had cleared the area of ex-husbands. “These men have formed an unholy alliance,” she excitedly explained. “They want alimony because they’re no good, lazy losers who can’t hold down jobs. I’d say round ‘em up and throw them in the river, but I’m an environmentalist now and I wouldn’t want to pollute it more than it already is.”\n\n\n\n\n\n\n\n\n\nMaxwell Continues National “Clean-Up” Efforts\n\nA routine shipment of fluorescent light fixtures destined for New City’s recently looted arts district took a rest stop of sorts on Tuesday. Martial arts champion cum logistics expert, Cedric Maxwell, ordered the supplying freight train, which was part of a transportation fleet with a valued rental of $4,650, to halt on a rural highway in the southern region of Allenville. Maxwell was “hitching” a ride back to civilization after a week visiting the Super Mega Martial Arts Convention (the support of the state’s martial arts leagues have earned Maxwell the reputation of a logistics provider able to handle most crisis relief scenarios). Witnesses say Maxwell had spotted a green pick-up truck whose driver failed to comply with a four-way stop sign. Maxwell proceeded to triple back flip his way off the train, remove a throwing star from his trademark gee and heave it at the right rear tire, causing the driver, Wendell Flatbed, to veer into a roadside ditch. Maxwell justified the encounter as “one less thorn in a criminal cactus that will indeed be plucked in full.” The driver was unharmed in the accident and has contacted local Allenville constabularies as to whether he is responsible for paying the citation Maxwell scribbled for him on the back of a taco receipt. The shipment was subsequently deposited at the intersection of Fairfont and Baker in the downtown arts district due to a lack of warehousing capabilities on the part of Maxwell’s firm, Force One Logistics.\n\n\n\n\n\n\n\n\n\nShortback Expands Toy Collection\n\nAsk former New City sheriff Sam Shortback about his brother, shame on you, but mention hearing something about a custom built model train set in his toy room, the Prairie Fire Logistics proprietor will likely smile and invite you over a for a look-see. “I just spent about a grand for the foliage, Wordsworth tunnel and most of downtown New City,” Shortback says proudly, as the lanky, weathered-skin man’s man stands over his model landscape of New City’s train routes – a work in progress. Prairie Fire enjoys a large network of freight train operators and rail line contacts who go out of their way to ensure A+ transportation of the supplies and equipment Shortback handles for his clients. Although the beloved career lawman is admittedly still learning the ins and outs of the logistics trade, his organizational skills as sheriff are primarily credited for the reduction of crime in New City during his tenure as sheriff. Those same organizational skills appear evident after sneaking a peak at Shortback’s train room. Wordsworth tunnel has been replicated down to the color of the graffiti on the outer walls. Each morning, Shortback spends an hour or two manually moving the toy trains along the routes his real trains are supposed to be servicing that day. ‘It’s kind of a drill,” he says, “accounting for weather, traffic, construction issues and such, but more than that, it’s just good clean fun.”\n\n\n\n\n\n\n\n\n\n\n\nTimes They are A’Changin’. For Some. \n\nFrom atop his WestTech RGH-4000 two-ton $1,000 mechanical bull, Western Logistics chairman and rodeo professional Dave Shortback tells us a thing or two about the logistics business. “Way I see it, the key word in ‘logistics’ is ‘logic.’ If that’s true, logic oughtta tell you if you want to be the best in this business, you need horsepower. What’s got more horsepower than horses?” Shortback is referring to his use of horse-and-wagon technology for transporting supplies and messenger services for the crisis relief situation. “My brother’s done seen to it that Dave Shortback’s banned from all the railways, but way I see it, he’s helping me turn this sucker into the best logistics business this side of the Elliot River.” Shortback turns the dial on the rawhide padding, speeding up the bull. He maintains his slow Dixieland drawl as he explains, “I’ve got a bonafide posse of rough riders willing to travel the prairie, traverse the rivers and storm through the canyons to bring folks the supplies they need, and I intend to put all them other logistics out of business doin’ it.” Shortback may be enthusiastic, but he’s better known for his obsession with horses and ranching than his dependability. Nevertheless, he stands by his ‘logic’ steadfastly. “You can keep your planes, trains and mack trucks. What are you gonna do when the machines break down, or the oil stops flowing. Tell you what you’re gonna do. You’re gonna be calling Dave Shortback, only he doesn’t own a telephone.”\n\n\n\n\n\n\n\n\n\n‘Potty Princess’ Messes Up Royally\n\nNot since Marie Antoinette have people been so angry at female royalty. New City’s Potty Princess, a.k.a. waste disposal business owner Wanda Rown, has angered residents with the second sewage spill into the New City River in two weeks. “We should make her swim in it,” cried one angry citizen. “She should have to drink it,” screamed another. Soon, the large mob that had assembled at the river began marching towards the pink, bejeweled offices of Potty Princess. Rown refused to come outside to meet the angry crowd, but did address them from her window. “Anyone can make a teensy, 30,000 gallon mistake,” she explained. But the throng grew even more furious upon hearing the size of the spill. Pitchforks were raised and pink princess dolls were burned in effigy. “You have to let me out if you want me to clean it up,” she reasoned – but had to quickly duck a flying shoe soaked in sewage. Normally, Rown would charge $4650 to rent a small tanker to collect and ferry away spill waste. “I’ll only charge you two thousand,” she called out and was grazed by a fish covered in brown slime, “Alright – I’ll do it for free!” At this, the crowd began to calm down. Rown is well known for her exceptional skills in toxic and human waste recovery, which she usually does in an environmentally friendly way. “Look at it this way, everyone,” she called down from her office window as she prepared to go to the site, “At least I’m getting good practice cleaning the river!” The crowd then pelted the office with four smelling water balloons.\n\n\n\n\n\n\n\n\n\nLocal News Anchor Looks Foolish!\n\nThanks to endless TV infomercials, everyone knows Fuller West of West Disposal Services has a “HUGE!” waste disposal containment area. But is it really big enough to serve his long list of clients that include some of the largest contracts in Elliot County? “It’s just not possible,” claimed News 47’s investigative reporter Gloria Grabber, “He must be hiding waste illegally somewhere!” Rumors have long swirled that West had tunneled out secret caves to store toxic trash beneath the city. So Grabber took her camera crew underground to find out. In a live exposé, Grabber dug beneath West Disposal Service’s headquarters in downtown New City and found…nothing. “Well, perhaps he…uh…hid it,” Grabber backpedaled. West shot back immediately in a new TV commercial that cost $1000 to produce. “And just where would I hide gallons of toxic waste?” West wonders on camera, “Maybe in my HUUUUUUGE waste storage facility!”  While everyone is laughing at Grabber’s ill-conceived report, there are still people who believe West is no sewage saint. “He’s a short cut artist,” says environmentalist Ida Leika-Redwood, “He cares more about providing cheap services than protecting the environment.” But West replies, “If I didn’t care about how I did the job, why would I spend all this money on cool machines to do it?” West does have one of the most impressive arrays of recovery equipment in the state. “Just because he’s got the tools,” says Leika-Redwood, “doesn’t mean he knows what to do with them.” Perhaps someone needs to do another live investigation?\n\n\n\n\n\n\n\n\n\nBAUM, DIS-PO CORP. CLEARED BY AUTHORITIES\n\nAdam Baum, CEO and President of Dis-po Corp. has been cleared of any financial irregularities or mismanagement of corporate monies. The well-known conservationist and outdoorsman was recently accused of purchasing radioactive materials from unidentified sources using corporate funds. He spent $1,000 on the recent acquisition of radioactive isotopes. However, the purchases were for “legitimate research,” according to the agency in charge of the investigation. “Mr.Baum is a highly regarded guardian of the environmental causes. His “collection” is for research and no one can dispute that his cause is just, even if his methods are somewhat reckless.” Baum has been accused of placing his employees and volunteers at risk. “My equipment is simple but effective. I deal with the high-risk facets of any job my company does. I use the highest quality eco-friendly plastics, netting, and simple containers. Several companies have even designed TupperWare-like units for my work.” Anyone working with me” said Baum, “is seldom placed in a hazardous circumstance. According to recent financial statements Baum spent $4,000 on recovery materials and $3,000 more on storage and containers for transportation. Baum is regarded as a “freak of nature” by many. He was exposed to great quantities of toxic and radioactive material during a hunting expedition some years ago. He suffers few ill-effects from his hands-on clean-up techniques. “The only thing that really makes me sick is bad drivers and bad sushi.”  \n\n\n\n\n\n\n\n\n\nTELEVISION AND RADIO ADVERTISING “OUT-OF-BOUNDS” IN NEW CITY \n\nA commission appointed by Mayor Eisell will evaluate the trend of advertising legal services on broadcast and cable television and radio. Some law firms have come under scrutiny because of the content in the advertising. “There are firms in this city that imply that they can win any suit, irregardless of the nature of the case,” said the Mayor. “There have been a significant number of complaints registered with the District Attorney’s Office and the Better Business Bureau.” It seems that the chief offender is the firm of Dewey, Sewham, and Howe. Their ads state that “For a reasonable retainer we will win your case and get you what you deserve.” The Mayor’s contention is based on the fact that no specific outcome is predictable under American juris prudence. Juries cannot be second-guessed according to the regional Bar Association statistics. Lawyers cannot guarantee a win, no matter what their reputation. Dewey’s firm has been known to spend as much as $2,150 on the high-profile case involving a toxic spill at a railroad crossing. “They were soliciting clients through the airwaves. They went as far as assuring a successful outcome for anyone entering as a plaintiff in that single suit,” asserts an A.D.A.. “We can back-up our claim,” shouted Howe, “we’ve won the vast majority of our environmental cases.” \n\n\n\n\n\n\n\n\n\nREPUTATION OF LOCAL LEGAL LEGEND QUESTIONED \n\nAbbie S.Korpis, Esq. is in hot water again. The flamboyant and high-profile attorney is being called before the bar association of Eliot County for an inquiry. It seems that the highly regarded lawyer has exercised some tactics that some regard as “unethical.” She regularly spends exorbitant amounts of money to “present” her clients in court. This is not illegal, in fact is a common tactic in trials. However, several local lawyers have suggested that Korpis employs a psychologist to profile jurors and judges conforming her clients image in the most sympathetic light specifically for an “audience.” This often results in increased alimony or significant awards for child-support payments. “Korpis states that, “I am expected to appear in the most professional manner possible. I work with every detail of my client’s case. Shame on those who represent clients in an effort that is less than 100% committed.” The irony lies in the fact that Korpis herself pays substantial alimony, at least $1,000, to more than one ex-husband. Several former spouses of Korpis has successfully sued the legal eagle for spousal support and won their cases. “I can afford to support a few disgruntled former employees,” said the woman. Her famous sarcasm was evident when she said, “The poor saps were not very good at being men, so I’ll pay for my mis-judgements.” \n\n\n\n\n\n\n\n\n\nMAILING MIX-UP LEADS TO CONFUSION AND COMEDY\n\nWhen a large shipment of health-related goods and medicines landed on the door-step of Katy Grace she was more than a little confused. “I never ordered $1,000 worth of lozenges, antacids, exotic teas, and herbal potions.” The delivery service though, insisted that the package was hers. Across town, in the business district of New City, a secretary signed for a package addressed to Ms.Grace. That package contained a dog collar and some parakeet food. The C.O.D. bill was less than a twenty. The mix-up caused several women more than a little concern. The large package was meant to be delivered to the offices of Liddy Cady Gates, a prominent lawyer who requires constant maintenance for her voice—What she terms her “primary tool.” Ms.Grace was planning to reward her collie dog, Cathy, with a new, sparkly dog collar. The parakeet food was for her feathered friend, Polar Bear. Since the women’s names are not all that similar, the mix-up is very strange. Strange, that is, until one realizes that Grace lives at 1492 Australia Ave. while Ms.Gates’ office is located at 1942 Austria Drive.  “Everyone knows that Americans don’t know the difference between the place where the kangaroos are from and the place that Mozart called home,” explained a supervisor from the U-SEND delivery service. Ms.Grace was able to laugh off the mistake. Ms.Gates was less forgiving. “When I opened the package,” she explained, “I interpreted the contents to mean that someone thought I was should be a singer, not an attorney. I was relieved to find out that it was a mistake.” \n",
				0,
				"NEWS_ElliotCountyCrier=2"
			),
			new InventoryHandler.Inventory_Item
			(
				"w3crier",
				"Elliot County Enquirer",
				GetSprite("iit_midmisc_016"), 
				"Oil Tanker Runs Aground on New City River!\n\nNEW CITY – For years, New City has considered itself lucky.  With a pristine ecosystem, constant sunshine, and a gorgeous river winding right alongside it, New City has always been a destination for City-dwellers and nature lover alike.  Today, however, shortly before 2:38AM County Standard Time, New City’s luck ran out when a river-going tanker operated by Interstate Oil and Gas ran aground on the shallows off the coast of our fair City.\nThe crew of the tanker and its pilot, 51 year old Kent C. Wells, narrowly escaped injury as the crash brought the tanker to a sudden standstill - and caused a power outage on the vessel.  Kent was unavailable for comment.\nInterstate Oil and Gas spokesperson Luke Ewer held a brief press conference in the minutes following the incident, telling reporters that “up to 3500 long tons of oil” may have leaked into the river as a result of the incident.  The messy slick is clearly visible from the New City shoreline, much to the chagrin of area residents and visitors.  “This is truly a disaster” says area conservationist Budo Khan.  “I do hope the river can make a full recovery after this.”\nThe accident has stunned the population of New City, who has never witnesses a disaster of this magnitude off of its shores.  In a statement to the press this morning, a clearly shaken Mayor announced that Professional Services LLP would help manage the relief and recovery effort on behalf of the City. “This is an unprecedented event” said Mayor Gonzalez, answering questions after the press conference.  “and I think everyone is very nervous.  However, we can be reassured that Professional Services is well able to help us through this difficult time.”\n",
				0,
				"NEWS_ElliotCountyCrier=3"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1examiner",
				"New City Examiner",
				GetSprite("iit_midmisc_006"), 
				"Narravi Associates Disappoints!\n\nDespite their successful PR work, the Elliot County Media Professionals’ Association has singled out Narravi Associates -  for finishing in dead last place in the Media Professionals’’ softball league. Setting records for wild pitches and umpires- injured-by-errant-throws, the team looks forward to winning a game for the first time in club history, next season. “Their team captain and Narravi’s President, Nina Ojeda has a talented team of information experts that specialize in encapsulating critical data into effective communication,” said one umpire. “But they couldn’t hit the broadside of a barn with a softball, that’s for sure.” Others are not so happy with Ojeda’s performance, either.  “She sure is controlling.  She really tried the umpires’ patience – and the other team – with her manipulative tactics.” The loss comes as Narravi spent its customary $1200 for posters around town promoting the team. “Oh, well,” said Narravi. “At least our abysmal performance will make headlines.”\n\n\n\n\n\n\n\n\nArea Media Relations Firm “Too Busy”\n\nNormally, PR powerhouse Nina Ojeda would never turn down an interview. As the president of Navari Associates, Ojeda is constantly seeking attention for her clients. So why the sudden drop-off in returned calls? “Busy. All good. Talk soon!” is the only statement Ojeda is willing to make.  Mort Steinbeck, the building’s window washer, reports a 24x7 beehive of activity at the media relations firm. “They’re at it all the time tapping on them there computers – and eating, of course – they’re like pigs with a work ethic!” It’s widely known that Navari bills its clients $500 for take out food and office parties for the duration of a contract. While that explains the food, why the recent flurry of activity? “Scandalmania,” admits business watchdog Jake Fang. “Top companies in New City and around the state have been hit hard in the news - now Navari is snapping up all the lucrative business.” That’s left many smaller clients and public service groups out in the cold. “No matter what she says,” admits Fang, “Ojeda has never cared that much for charity work.”  \n\n\n\n\n\n\n\nNew Developments Heard Through Gabe Vine!\n\nIs beautiful Tamiroff Park about to become the backyard for the rich and famous?  According to Gabe Vine of New Media Communications, the answer is yes. “Well, I really can’t say,” explained Vine after a closed door meeting at the state house, “but my new client, BluCo Construction, will absolutely build 18 huge, luxury compound-style homes on a strip of private land that cuts way into the state park. In fact we just signed the papers and construction begins July 10th.” This startling admission is sure to cause outrage in the community who cherish the park as a natural oasis in the city. And it is an inauspicious start to Vine’s PR relationship with BluCo. “Normally you want to quell controversy in these situations,” said business watchdog, Jake Fang, ‘but Gabe Vine just ignited one.” While a respected local agency, NMC has had trouble in the past handling negative press situations. After another brief closed door meeting, Vine explained that he will set up an on site “war room” next to BluCo’s offices – at a cost of $2000 – to react quickly to any public outcry. \n\n\n\n\n\n\n\n\nNorse Fails to Steer Tricon out of Spotlight\n\nIt just doesn’t add up.  When an accounting scandal ignited at Trifon Enterprises – a large regional cable television provider that spans five states – it hired PR powerhouse Norse Communications to quell the media firestorm.  Instead, Norse fanned the flames of negative press and the company has now filed for bankruptcy. What went wrong? “We hired Norse Communications because they specialize in handling large, interstate clients in high profile cases,” says Trifon CEO Abe Delfia, “But they just had no tact when dealing with the media.” The president of Norse’s local affiliate, Bjorn Egan, disagrees, “Our response was accurate, efficient and mathematically sound.” Norse’s response involved spending $1250 to fly in their accounting experts from around the state to deal with the situation. But their brutal honesty about the scale of the accounting fiasco alarmed investors instead of calming them down. “When the scandal broke I figured – heck, someone raided the kitty for a couple million, no big deal,” explained one very wealthy investor, “But when Norse spokesman showed the real math on TV, I sold my stock fast!”\n\n\n\n\n\n\n\n\nArea Press Relations Guru 'Tells it Like it Is’\n\nHaving “explosive diarrhea” isn’t something you want to announce to the world, but that’s exactly how Media Relations Inc. (MRI) president Marvin Moneymaker described why star pitcher Tom Fry wasn’t available for last night’s playoff game. When Moneymaker was asked why he couldn’t be a bit more delicate about the reason for Fry’s absence, he exclaimed, “Are you kidding?  You wouldn’t believe the mess!” The embarrassment for Fry continued when Moneymaker sent his staff of door-to-door salesmen to media outlets with flyers that illustrated the eruption with the caption, “Thar she blows!” Fry, who is not available for comment, is rumored to be angry about the $1000 cost of spreading around the word of his condition. The whole episode may indeed backfire for Moneymaker whose tremendous success in the media industry could be in jeopardy. “This could lose us the championship,” cried the New City Neutron’s manager Pete Shell, “Fry won’t come out of the clubhouse.” But Moneymaker doesn’t seem worried. He even plans to expand his PR firm – which exclusively services Elliot County - statewide.  “I just call ‘em like I see ‘em.” Moneymaker says.   \n\n\n\n\n\n\nLocal Emergency Response Firm Poised for Growth\n\n\nMaxed out, overworked and chronically disorganized, New City Emergency Medics Association is set to grow. “Who knows more about stressful situations than we do?” asks NCEM director Gil Fermin, “We live on stress – literally.” While some question its bizarre methods, no one can deny that NCEM provides excellent emergency response services thanks to its up-to-date, high tech facilities and expert staff that knows how to manage the aftermath of a disaster. “Oh, they know what they’re doing alright,” says satisfied fire victim Mort Tiffied, “They control crowds and save lives- they’re even pretty good dancers.” NCEM typically charges $1800 for emergency equipment rental and to set up a security perimeter, which is higher than some other providers. “When disaster strikes, you don’t shop around for the lowest price – you want the best people and best equipment,” explains Fermin. He may be right – 8 out of 10 unlucky people say they’d choose NCEM the next time their lives go horribly wrong.  “We’re ready for growth,” says Fermin, “Bring it on!”\n\n\n\n\n\n\n\n\nLocal Provider declared a \"Model Emergency Services Firm\"\n\nThey're rested, ready and well fed. The staff at First Responders is highly regarded as the best trained and most up-to-date of any emergency services provider in New City. It’s all thanks to owner John Gray whose years of working in the world class Rosenfield trauma ward have shown him how to keep his staff ready and motivated. It begins with barbeques. “We do a lot of team building through cookouts,” explains Gray, “It teaches cooperation, efficiency and burn treatment.” The techniques have paid off.  First Responders team is able to respond to emergencies in record time. They also pride themselves on keeping current with latest emergency response and rescue techniques. “We discovered a much more effective Heimlich maneuver,” claims Grey, “Which only requires two fingers.” Grey also keeps his staff loose by hiring massage therapists – at a cost of $500 – to provide deep tissue massage and facial treatments. “You can’t handle a stressful situation if you’re already stressed out,” says Grey. “Our guys know how to kick back and kick butt.”   \n\n\n\n\n\n\n\n\nSupermarket Opening A Success, Despite Hitch\n\n“Clowns are dangerous, destructive and evil,” stated former sheriff Sam Shortback who was on hand for the official opening of the Whole Paycheck supermarket in downtown New City. His anti-prankster announcement came as yet another area event was spoiled by a felonious fool. “The ribbon cutting was just underway,” explains store manager Wier Organic, “when we noticed the clown lighting heritage New Zealand kiwis on fire for juggling.” Soon, the entire produce section was ablaze. That’s when emergency response expert Medic! Inc. arrived on the scene. “We could smell the smoking fruit from our HQ,” recalls Medic! Inc. owner, Tom Barrier, “I knew that smell very well from my tour of duty in Panama.” Barrier’s mobilized his fully licensed and experienced team to the supermarket – at a cost of $1250 – and quickly extinguished the flames. But his security officers couldn’t stop the crowd from feasting on all the roasted fruit and vegetables that littered the aisles. “Since Medic! Inc. couldn’t stop the throng of hungry shoppers,” says Organic, “we turned the whole opening into an impromptu luau!” Clowns may be evil, but this time the lovers of all natural foods got the last laugh.\n\n\n\n\n\n\n\n\nLocal Hero to the Rescue!\n\nWhen the popcorn factory exploded in downtown New City on Tuesday, many workers were trapped inside - unable to escape a delicious smelling, puffy prison. “No one could eat their way out, and we couldn’t eat our way in,” recalls factory owner Red Orvillebacher. That’s when Mullen Medical Supply owner, Dr. Zeke Mullen came to the rescue. “Of course, I remember the great popcorn disaster of 1943,” says Dr. Mullen, “So I knew just what to do.” Dr. Mullen normally charges $1000 to deploy his medical and security detail in case of an emergency, but this time it wasn’t needed – he tackled the problem himself. Knowing that popcorn dissolves in water, Dr. Mullen activated the building’s sprinkler system which turned the confining corn into malleable mush. “It was a miracle,” exclaimed one grateful escapee, “Dr. Mullen should be given the key to the city!” In fact, he already has one for his years of service at New City Community Hospital. When asked why Dr. Mullen didn’t call his medical and security team for backup, he replied, “It was their nap-time – and they’re so old, they’re not really much help anyway.”\n\n\n\nLocal Man Obsessive About Containment!\n\nWalk into Peter Boltright’s machine shop in New City, and you enter a steampunk toy store wonderland. The owner of Premier Containment, Boltright is constantly inventing new, imaginative machines to contain toxic spills. There are robotic crabs, mechanized whirligigs and tanks made out of clear aluminum. With each new job, Boltright spends $500 on drafting supplies, prototyping materials and renting a 3D printer to bring his creations to life. “Every spill is a unique engineering challenge,” says the grease covered Boltright, “So I spend every waking moment tinkering with unique solutions.” “There’s a word for that,” explains industry analyst Nombe Lever, “Crazy.” Boltright’s mechanical obsession was on public display recently, when he was seen inappropriately fondling a next generation oil dredger at an industry tradeshow. But a subsequent psychological profile of Boltright shows that while he’s eccentric and obsessive, he’s pretty much sane. “When insanity is useful,” says New City psychiatrist Dianne Osis, “We call it ‘inspiration’. Boltright appears to be just very, very dedicated to his job. In the DSM IV he’d be considered, 'Alarmingly Dedicated'.” And that’s a good thing if you ask the thousands of people who have benefited over the years from his containment compulsion.\n\n\n\n\n\n\n\n\nElliot County Containment Vendor Still Foreign to Local Disasters\n\nWho is Oroko Nakashima and what is she doing here? Those are the two questions that seem to plague this toxic spill containment specialist every time her name crops up in the media. “She’s an enigma, a riddle,” says environmentalist Tom Post, “She’s like a riddily enigma pie covered in shadowy deceptive frosting.” This seems like harsh, delicious criticism for someone who is world renowned for her expertise in containing ocean spills and other environmental disasters. Her ability to mobilize local fishermen and conservationists to aid in cleanups – at a cost of $1200 – not only provides quick response time but transfers valuable skills to native populations. And Nakashima’s teaching at New City Community College has made its environmental conservation program the best in the state. So why is she so vilified by local groups? “She’s never here!” complains Post, “Every time there’s a disaster in what’s supposed to be her ‘hometown’, she’s off globetrotting to save a bunch of foreigners!” Could it be jealousy? Could it be xenophobia? Could it be concern over Nakashima’s lack of experience with local government officials and river cleanup? Whatever the reason, her global celebrity status has not added up to a lot of good will here in New City.\n\n\n\n\n\n\n\n\nVendor Credits Logistics Know-How for Successes\n\n“Everything that’s true about the U.S. Marines is true about us,” claims Phil Burell of Burell Brothers, the local hazardous waste cleanup firm that is run like a military outfit. Founders Phil and Bill leverage their past as Marines to create a unique corporate culture that is more Semper Fi than suit-and-tie. And the culture extends into their tactical approach to clean up, which conducts deployments modeled after the great Marine assaults of the past. Assault is the right word. The firm is known for shock-and-awe tactics that include beach landings, paratrooper drops and lots of apparently gratuitous explosions. Theirs is a strategy that requires boots on the ground, boots worn by friends in military service and state militias that they often mobilize at a cost of $1250. While some question their tactics, a string of successes confirm that the brothers are highly educated in the logistics and practices of spill containment in a variety of settings, though advocates for New City River point out their lack of experience with rivers. “We’re successful because we see waste as the enemy,” Bill explains. “We throw all our logistical know-how and firepower at spills and leaks like these things personally insulted our mothers.”\n\n\n\n\n\n\n\n\nCharity Darts Tournament Declared a Success!\n\nWho knew that a game of darts could do so much to save the world? Anthony Wexler, founder of Interstate Containment, that’s who. His charity darts tournament, “Have a Heart, Throw a Dart,” surpassed fundraising projections this weekend, prompting Wexler to declare the event an unqualified success. “A lot of people think darts is something to do when you’ve got nothing else to do,” Wexler commented. “But it can save us all!” The several thousands of dollars generated by the event will be donated to environmental groups. Not a bad investment for a function that cost $500 for dartboards, extra felt, darts, tips and a bouncer detail to ensure order. Many agree that the donations can make a difference, including the Green Rivers Alliance who honored Wexler with their annual Guys Who Gives A Damn award for his charity efforts. The award acknowledges the events Wexler organized as well as his recent donation of tournament prize money to a number of environmental charities—money won with a lucky shot that hit the its mark after bouncing off the artificially enhanced breast of a spectator. “This, more so than his actual waste containment company, is how Wexler contributes,” said the Alliance’s Drew Ablanc, “given that he has extremely odd, out-of-date equipment and no clue how contain spills or prevent contamination.” \n\n\n\n\n\nEco-Tech Sends Message to City of Wexlerberg \n\nWho you gonna call, Wexlerburg? If you’re looking for someone to test your waterways for toxic leaks, hazardous wastebuster Nathaniel Wailer claims to be waiting by the phone. This comes as somewhat surprising news, given the expert’s reputation for being overworked and in constant demand. “Rumors of my unavailability are greatly exaggerated, mon,” Wailer tells us, with all the charm built into his Island accent. Should Wexlerburg make that call, they would appear to be in good hands. Wailer has built a solid track record of accuracy and is known to be free of biases.. Inspiring and well-spoken, he delivers his findings in a clear and concise manner. Costs are reasonable since—at a cost of $1800—he rents the monitoring devices he needs to measure and report ecological damage and environmental contamination. His numerous successes in the area speak loudly for his qualifications. But how can this go-to guy be available for Wexlerburg? Perhaps the answer has something to do with his tendency to fly in a team of experts from his island homeland of Montoga. Often arriving by helicopter, they amount to a veritable A-team of ecological experts. Upbeat and spirited, they’ve been known to tackle the ugliest of toxic spills with an optimism and display of cheer that some have called “practically supernatural”. \n\n\n\n\n\n\n\n\nMonitoring Equipment Fails Local Vendor\n\nThe numbers were off. Way off. According to the environmental assessment reports filed by the consultancy of Ypoforo Ecosystems in which toxicity levels suggested the river was a cocktail of battery acid, anti-freeze and runoff from a nuclear plant,. Yet, it didn’t take a high-profile environmental consultant to suspect the findings were inaccurate. After all, anyone could see that fish were still swimming. Frogs and tadpoles thrived along the banks. And human swimmers emerged from the water with their skin largely intact. All good indicators. So what went wrong with the assessment? Jannis Economou, the famous founder of Ypoforo, has suggested that the equipment he used could have been wrongly calibrated and, as a result, gave inaccurate readings. Many experts, however, question this explanation. After all, Ypoforo is known to have up-to-date training and equipment. Instead, many feel the more likely scenario is that Economou himself misread the numbers, due to his purportedly failing eyesight. New City Councilman Pat Down points to a line item that has recently appeared on Ypoforo’s invoices, charging $500 for eyeglasses, magnification lenses, large-print levels, and other aids Economou apparently needs to be able to see the small-size LED readouts on his monitoring equipment. Economou has offered to re-assess the waterway free of charge. “It’s the least he can do,” Down stated. “I’m sure his last report caused everyone in the river at the time to lose control of their bowels which, come to think of it, may throw off his new assessment.”\n\n\n\n\n\n\n\n\nReport Delivered During Candlelight Vigil\n\nAnyone interested in hearing environmental assessment findings by area advocate Ramblin’ Rose last Saturday may have come for the stats on Hurley Marsh, but stayed for the mellow—whether they like it or not. Rose, a former follower of the 90’s jam band The Boys, has her own unique way of disseminating her findings. For this occasion, she chose to hold the press conference at the site of a candlelight vigil commemorating the anniversary of the death of Jimmy Rodriguez, the legendary guitarist for The Boys. Incense, Boys bootleg tapes and unnaturally tasty brownies were distributed beside Rose’s chartered bus, which was used to bring in her team of volunteers to assist with the assessment at a cost of $1250. Rose has an enormous network of supporters and Boys fans she can call on to staff assessment teams. After performing a 20-minute air guitar solo tribute to Rodriguez, Rose attempted to psychically communicate her findings to area reporters. Despite her urgings, reporters failed to “open their minds” and “listen with their most authentic selves,” and Rose was forced to deliver the information more conventionally—that is, with words. It’s widely known that, despite her reputation as an unbiased and scrupulous assessor, Rose is an eccentric who has difficulty communicating her finds in a credible manner. This proved to be the case once again, when Rose summarized her report by saying the state of the Marsh gave her a “heck of a soul ache.”   \n\n\n\n\n\n\n\n\nScathing Report Condemns Local Factory\n\n“Make “em pay,” is the slogan of the environmental consultancy Enviro-X, lead by local legend Skeeter McBragg. And that’s exactly what he intends to do to Plasticorp, whose chemical storage facility recently exploded. “They’re the worst,” McBragg proclaimed at a recent press conference, upon announcing that his group will lead the effort to assess the degree of toxicity released into the environment by the explosion. “They make me burn up,” he added, before distributing a report that was “written” with a Sharpie on napkins from Burrito Bill’s. The group has already set up a command center, complete with half-pipe, and members can be seen patrolling the area on their controversial motorized skateboards, which reportedly cost $500 to retrofit with 130 HP engines. Some locals find their presence alarming and are eager to point out that the Plasticorp explosion has all the characteristics of other eco-terror attacks that Enviro-X has been hired to assess. “It’s their fault,” said one of McBragg’s skate buddies and close coworker, when questioned about the incidents. “They had it coming to them…” Now fully entrenched, McBragg and his skater assessors seem determined to expose Plasticorp as disreputable corporate citizens, even as McBragg’s critics claim Enviro-X is better suited for creating environmental havoc that it is for assessing ecological damage. “Some critics need a good head-butt,” McBragg says in response, before laughing hysterically. \n",
				0,
				"NEWS_NewCityExaminer=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2examiner",
				"New City Examiner",
				GetSprite("iit_midmisc_006"), 
				"Berlin Bullies Baddies\n\nAfter the recent oil spill on the New City River, oil company rent-a-cops probably rolled their eyes when the call came in: some celebrity spokesperson was using the company gates as a backdrop for a charity concert. As they holstered their Tasers and took up their billy clubs, they probably entertained visions of a wispy folksinger and her audience of flower-wielding peaceniks. Ho hum. How could they have known that the call referred to Wes Berlin, his legendary punk band Shrapnel, and hundreds of loyal fans? They found out soon enough, upon arriving at the scene where Shrapnel was pounding through a blistering set under a banner that read “Save the New City River!” As the security team moved in, they were quickly surrounded by the audience and slam-danced into submission. Some personnel were hoisted overhead, crowd-surfed against their will to the stage where Berlin was waiting to administer a spanking with a cricket paddle. The fans cheered each stroke and with each swing of the bat Berlin’s popularity seemed to climb another rung of the popularity ladder. Despite his tough appearance and aggressive tactics, the punk legend has proven to be well-spoken and witty, able to confidently handle himself in situations calling for improvisation. His effectiveness overrides his expenses, which includes a $4150 fee for microphones, PA speakers, cabling and instruments for the band. And who else can get away with literally spanking the anti-environmental forces of the world? \n\n\n\n\n\n\n\n\nHip-Hop Innovator to Collaborate with Symphony \n\nTo raise awareness for No Violin Left Behind, a charity that provides musical instruments to school’s serving underprivileged communities, hip-hop hero Grandmaster G will work with the New City Symphony to produce a charity event this spring. The concert will feature Grandmaster G’s greatest hits with orchestral arrangements. The popular hip-hop luminary will front the world-renowned orchestra, rapping his sometimes-controversial lyrics to a beat provided by timpani and snare, as well as melodies re-configured for strings and brass. Said Symphony conductor and maestro, Will Godeff, “Mr. G’s work is certainly…interesting. I look forward finding the music in it.” Grandmaster G shares the highly-trained, classically-minded maestros enthusiasm, stating, “Classical music needs to get on board, specially for a good cause like this.” Active on behalf of multiple charities, Grandmaster G says this one is particularly close to his heart. “Music saved my life and all because they gave us plastic recorders to play at school. I was the first kid to play hip-hop on that thing. The rest is history, feel me, yo?” To demonstrate his commitment, G has waived all of his usual fees, including the usual $2000 fee for his posse, which provides moral support and personal security services. “Don’t need a posse for an event like this,” explains G. “Ain’t no one going to be there but a bunch of old white people, and they’re only dangerous when they hold public office, know what I’m saying?”  \n\n\n\n\n\n\n\n\n\nRudd a Dud as Spokesperson\n\nThe reviews are in on country star Fiona Rudd. Not for any recent musical effort—after all, Rudd hasn’t released an album since the 70’s. Instead, Rudd is being critiqued as a relief and recovery spokesperson and the reviews aren’t good. This time around, her reviewers are environmental advocates and city officials, not music critics. Yet, the language is strikingly similar to Fiona’s final albums, which most agree represent the low point in her career. Said one advocate, “She’s soulless and clueless. Whatever understanding she once had of harmony is now lost.” Another gave this concise critique: “All filler, no killer.” And yet another advocated noted, “Fiona couldn’t spokesperson her way out of a paper bag.” Many blame her lack of depth and intellect, claiming she has neither the education nor skills to understand anything technical or complicated. Others point to her $2000 speaker and entertainer fees as proof of her cynical perspective on environmental causes. “She’s just in it for the money,” claims Tess Teng, a disappointed former fan. “That’s what happened with the music, too. She’s sold out.” Rudd has declined to comment on the “sell out” accusation, opting instead to let her music speak for her by directing reporters to one of her older b-sides, which is only available through an online music service, at a cost of $2 per download. \n\n\n\n\n\n\n\n\n\nWong’s “Multi-Taskers” Brings Readers to Task\n\nAnother Phoenix Services Group (PSG) employee was committed to the psychiatric ward at Goodness Gracious Mental Hospital yesterday afternoon after being picked up by authorities for disturbing the peace. Twenty-one-year old intern Anthony “Sweet Meat” Nichols walked out of the offices of PSG after only three weeks under the employ of senior proprietor Margaret Wong. Wong, whose PSG is known as one of the top logistics firms in the nation and supplies transportation of relief supplies and restoration equipment, is said to be passive aggressive and controlling to the point that many an employee suffers a nervous breakdown. Case and point, only twenty days after Wong’s $1,000 company orientation, new hire Nichols, known by his co-workers as “the sweetest kid you’d ever want to meet,” hence ‘sweet meat,’ exited PSG offices and drifted into Asiatown. Witnesses heard him state repeatedly, “Mr. Insert Name Here is unavailable at the present moment, should you like to leave a voice message, kindly do so after the tone, and one of our dynamic representatives will return your call as soon as possible.” Ironically, the latter quote is the first sentence of chapter fifty-seven: Phone Etiquette, in Wong’s fifteen-hundred-page company manual, which all PSG employees are required to memorize verbatim. Nichols is currently under heavy sedation and is being observed by Dr. Christoph Mindheim of Berlin, who’s non-fiction study of Margaret Wong’s afflicted employees, ‘What’s Wong with My Noggin,” is forthcoming from Palpitation Press. \n\n\n\n\n\n\n\n\n\nShortback Brings in the Big Guns \n\nHe’s proven he possesses a network of freight train operators and rail line contacts to ensure adequate transportaion of supplies and equipment, but can Sam Shortback and his Prairie Fire Logistics firm shake the law enforcement ethos that seems to accompany him on deliveries and through town en route to the warehouses and various drop-off points? Just ask local gas station attendant Rusty Nozzle, who’s filled up the Prairie Logistics trucks twice this week while Shortback and his team of off-duty officers demanded more speed. “It’s seemed like they were rushing to a crime scene rather than delivering supplies,” Nozzle said, “Shortback kept yelling, ‘Move! Move! Move!’ and I says, ‘I can’t make the pump go any faster, sir,’ and he said back to me, ‘How would you like to me to arrest you for disobeying the order of a police officer,’ and I said, ‘I guess I wouldn’t like that much at all.’” Shortback, whose organization skills are largely credited for the reduction in crime in New City during his tenure as Sheriff, has dropped $2,000 in payments to freight train operators to guarantee adequate transportation and seems to be running a smooth operation. However, the retired New City sheriff himself has claimed that he’s gown weary from the lack of action he sees. “I suppose an old man like me gets carried away sometimes. I’m just an elder cowboy trying not to fall out of my saddle.”\n\n\n\n\n\n\n\n\nShortback’s Cattle Call\n\nEx-rodeo star turned professional logistics coordinator Dave Shortback needs local ranchers and cowboys to help support disaster relief. His Western Logistics firm apparently has $4,000 set aside for staffing. Western, whose network of transportation consists of horse and wagon technology, says they’re looking to redefine the industry and return to an era where logistics and transportation was more about community, country and enjoying the opportunity to traverse through the open prairie. However, sources claim this is a bunch of “malarkey,” saying the real reason has nothing to do with nostalgia or old-time values, but from a lack of access to railways due to the efforts of Shortback’s brother, Sam Shortback, to derail Western Logistics, so to speak. Malarkey or not, ranch hands, cowboys and farmers throughout Elliot County are signing up left and right for the next drive of supplies to support relief efforts in New City, not so much from a desire to aid in the clean-up it seems, but for an opportunity to ride with one of their local heroes. Nevertheless, Dave Shortback remains enthusiastic as ever about his latest venture. When asked if it was true that he aimed to make Western Logistics the finest logistics provider in New City, Shortback started jumping on the sofa in his office, lassoed this reporter, and screamed “Yeeeehaw!”\n\n\n\n\n\n\n\n\n\nNew City Company Cleans Up a Clean Up\n\nWhen the Malarkey River in Rosenfield turned bright pink last month, the town council sprang into action. “We shut down the pig waste factory, cancelled the children’s river swim-a-thon and sent in a toxic waste clean up crew,” recalls Councilman Redda Larm. But the “toxic clean up crew” they used was just a few teenagers Rosenfield employs to scrub the local swimming pools. Soon, the river was a corrosive stew of chlorine, ammonia, lye soap and pig waste. With citizens in an uproar, the council hired Clean Green Machinery – an industry leader in safe and environmentally friendly hazardous waste disposal – from New City. “The animal runoff wasn’t so bad,” explains Ashley Dapper, senior partner of CGM, “It was the spectacularly bad first clean up attempt that posed the real challenge.” CGM immediately rented $4150 worth of berms, pallets and booms from an out of state manufacturer to contain the bleach scented filth. Once contained, Dapper and her team expertly extracted all the contaminants using solar powered vacuums. “We were able to separate all the different foreign substances with a wind-powered centrifuge,” says Dapper, “Then we processed the pig excrement with a portable wetland system. The other chemicals, like the chlorine, are headed back to the municipal pools.” With the clean up all cleaned up, Rosenfield has decided to reinstate the children’s river swim-a-thon. “We want to celebrate the great job we all did,” smiles Councilman Larm, “We fixed two environmental disasters in one week!”\n\n\n\n\n\n\n\n\nBiggest Is Best for Fuller West\n\nFuller West’s waste disposal business is so big it probably affects the tides. At least that’s how it seems. Whether it’s his constant late-night TV ads where he shouts the word “HUGE!” or his rumbling army of dump trucks, drivers and foreman that supervise disposal efforts – at a cost of $2000 per job – West’s company is only short on one thing – subtlety. “It’s weird to see that guy’s big head everywhere,” says local organ grinder Groovy Gary, “Billboards, busses, dump trucks – look, he’s even put a sticker of his face on my monkey!” But West’s saturation approach has earned him the longest list of waste disposal clients in Elliot County, a list that includes some huge exclusive contracts: six cities, fourteen towns, an oil refinery and a laxative manufacturer - just to name a few. “I’m not successful just ‘cause I’m famous,” claims West, “people come for the name recognition – but they stay for the great service.” West does boast one of the most impressive arrays of recovery equipment around – making him one of the few specialists that can handle virtually any kind of spill. But being big does have its challenges. “You try sneaking into a movie theatre – or grabbing an extra pickle at a deli counter,” complains West, “immediately somebody’s always like, ‘Hey it’s that garbage guy!’ and you’re caught.” Luckily for West, his business is doing so well, he can probably pay for that movie ticket or second pickle. That’s one more reason it’s nice to be “HUUUUUUUUGE!”\n\n\n\n\n\n\n\n\n\nADAM BAUM: ECO-SAINT OR RECKLESS SINNER? \n\nAdam Baum is a conservationist. He is an experienced outdoorsman. He is a warrior in the fight to save the Earth from its thoughtless inhabitants. Thousands affirm that Baum is those things. But some, like scientist Dom Neuital, say he is reckless and cares little for those who work with him and for him. Baum responds, “I buy and design the most effective tools possible. His eco-friendly equipment is expensive, $4,000 for recent purchases, but is “eco-designed” specifically for Baum’s approach to toxic waste recovery. “I plan every recovery effort. My company bears the greatest expenses transporting volunteers to and from sites where their help is desperately needed,” the ecologist said. I recently doled out $2,000 for transport bills. Some say that Baum is not entirely ethical. That he takes advantage of resources that he is not entitled to such as convicts from the state prison system. Many of his volunteer workers offer “blind obedience” to the man and his company. The controversial  ecologist continues his work despite criticism. “Mother Earth deserves help with the burden of humanity making unreasonable demands of her. \n\n\n\n\n\n\n\n\n\nEASTERN LEGAL EXPANSION CONTINUES\n\nAvanish Singh announced today that the expansion for his surprisingly successful firm continues. Eastern Legal Services will add members to its staff to meet the demand for low-cost representation in the area of environmental law. The firm is budgeting as much as $4,150 for hiring more staff and training interns. Eastern Legal has become a voice to be reckoned with in New City and Elliot County. “My father was a gargantuan influence on the elaboration of my intentionality,” said Singh, “He embroidered his ethnicity, entwined his embrace of the American Dream. My work is a continuation of that elaboration.” The firm is searching for employees who can focus on research and details, the areas that Singh is a noted master of. “Avanish cannot be the sole carrier of law and legal precedents. We need some more brain-power in this office,” said Butch Wachers, an Eastern Legal associate. Singh has announced plans to sue the New City Water Commission for “failing to meet the required standards of public safety.” Wachers clarified Singh’s intentions, “The bottled water companies are being stigmatized by government environmental agencies because of the impact on empty plastic bottles in the New City City Landfill. The problem originated with the decline in the quality of drinking water in New City.”  This unorthodox approach to environmental law is applauded by many, but treated by suspicion by other environmentally concerned bodies. \n\n\n\n\n\n\n\n\n\nSTYLISH ATTORNEY ROBIN HOOD OR CONTRADICTION?\n\nAbbie S.Korpis is without a doubt a living contradiction. Known as somewhat of a ‘Robin Hood’ for women faced with divorce, she is also somewhat of a lorelei, having been accused of being the “other woman” in more than one divorce proceeding. Korpis has been married an unconfirmed number of times and divorced from each husband. Reportedly most of the men filed for divorce on grounds that Korpis was financially reckless. “She spends money on fashionable clothing and accessories as if it were a duty to be beautiful in public,” said an unnamed judge. A fashion magazine of international repute will feature a story that includes Korpis as an example of a “modern, independent woman with the skills and values of a 17th century courtesan.” Whether this is praise or an indictment remains to be judged by the wider public. “There is no doubt that she is at the cutting edge of the fashion industry,” said Eileen Lefkuss, fashion editor for this paper. Yet she lends her skills to anyone seeking redress in environmental-based conflicts. She has defended landlords facing eminent domain challenges, filed suit against the state for “absorbing” river-front property, and forced the relocation of a water-bottling facility because of the use of PCBs in their water bottles. \n\n\n\n\n\n\n\n\n\nGATES AND KORPIS FEUD IN AND OUT OF COURTROOM \n\nSince attorney Liddy Gates agreed to represent the Goliath Corporation in a suit filed by New City’s legal council Abbie Korpis, a cat fight has broken out in the legal arena. Each lawyer has an impressive record of courtroom victories and each woman is known as somewhat idiosyncratic. Both are fierce opponents in the legal arena. Now, however, there seems to be something personal in each woman’s rhetoric and public statements. “I filed the suit based on an investigation by the District Attorney’s office. Goliath has behaved in a devious manner,” said Korpis. Gates responded.  ”I suspect that the city is guilty of selective prosecution. Goliath has always performed in good faith. Abbie is, as is often the case, in error.”  Korpis quipped, “When she can learn how to dress herself, I’ll take Liddy seriously.” Gates is so determined to triumph that she has hired experts in the field of environmental law. Gates has spent $4,000 for special council and advisors brought in from other cities where large corporations have faced suits and prosecutions in the area of toxic waste management. Since Gates has never lost a case where she was lead attorney, it is difficult to question her strategy. This reported tried to find a neutral party who could discuss the case without emotional involvement, but it seems that everyone has chosen a side in this affair. \n",
				0,
				"NEWS_NewCityExaminer=2"
			),
			new InventoryHandler.Inventory_Item
			(
				"w3examiner",
				"New City Examiner",
				GetSprite("iit_midmisc_006"), 
				"Huge Oil Spill in New City!\n\nNEW CITY – Disaster struck early this morning this morning as a double-hulled oil tanker ran aground in the New City River, oozing tons of oil into the waterway.   The LX-class inland tanker clipped the shoals of the coast of New City shortly after 2:38 AM.  Miraculously, no one on board was hurt. \nInterstate Oil and Gas, a company that owns several area refineries and owns and operates the wrecked tanker, held a brief press conference in the minutes following the incident.  According to spokesperson Luke Ewter, the vessel -- an inland tanker in service since 2004 -- was piloted by experienced river captain Kent C. Wells and was en route to one of its refineries further up the River.  Ewter also mentioned that all five of the storage tanks in the vessel burst when it scraped along the shoals of the New City River, spilling up to 3500 long tons of oil into the channel.\nWitnesses to the event were shocked as they watched the early morning events unfold.  Working late at his waterfront marine craft sales and rental facility, Mack McKinnon said he saw everything.  “It happened all of a sudden.  I could hear the screams of the crew from my shop.  Aye, it gave me a scare, as I imagined they were all plungin’ into the drink!”\n\nResidents are already reporting concern over what the possible effects of the spill may be.  Some are voicing concerns about the long term effects of the spill, and others express trepidation that the ecosystem will ever completely recover.  Already, a putrid smell is wafting ashore – which, according to area conservationist Budo Khan may contain benzene and other volatile compounds.  “We should be concerned about our environment and the river’s ecosystem – but we should also keep in mind that what we smell at the waterfront contains polycyclic aromatic hydrocarbons.”  Others aren’t so scientific about it.  “My main concern,” said New City’s official tour guide, Samantha Walker, “is that it will scare away visitors to New City.  Who would want to come here when there is a giant oil spill in our beautiful river?”\n",
				0,
				"NEWS_NewCityExaminer=3"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1today",
				"Elliot County Today",
				GetSprite("iit_midmisc_016"), 
				"Narravi Associates Disappoints!\n\nDespite their successful PR work, the Elliot County Media Professionals’ Association has singled out Narravi Associates -  for finishing in dead last place in the Media Professionals’’ softball league. Setting records for wild pitches and umpires- injured-by-errant-throws, the team looks forward to winning a game for the first time in club history, next season. “Their team captain and Narravi’s President, Nina Ojeda has a talented team of information experts that specialize in encapsulating critical data into effective communication,” said one umpire. “But they couldn’t hit the broadside of a barn with a softball, that’s for sure.” Others are not so happy with Ojeda’s performance, either.  “She sure is controlling.  She really tried the umpires’ patience – and the other team – with her manipulative tactics.” The loss comes as Narravi spent its customary $1200 for posters around town promoting the team. “Oh, well,” said Narravi. “At least our abysmal performance will make headlines.”\n\n\n\n\n\n\n\n\nLocal Media Relations Professional Honored!\n\n“Gracias,  merci, danke, takk, grazie, dekuji ti, bedankt, dziekuje,obrigado, and thank you!” That’s how Gabe Vine, president of New Media Communications (NMC), wrapped up his marathon two and a half hour acceptance speech last night at the Elliot County Media Professionals Association Banquet.  Attendees stumbled out of the hall bleary-eyed but generally happy for Vine, who has been a fixture in the local media relations industry for years. “I’ve known Gab – I mean, Gabe – for years,” said attendee Laura Genco, “We worked together at Ubik & Wittus way back when.”  The award - known as the “Golden Throaty” – is given out every year to the professional who best demonstrates the ability to communicate complicated information to the general public. “What I can’t believe,” wondered another shell-shocked attendee, “is how he kept going even when his voice was shot – he sounded like a pavement saw by the end.”  What sounded even worse to event organizers, was Vine’s strange request after receiving the award. “He walked off stage and immediately demanded $500 for lozenges, throat sprays and homeopathic laryngitis remedies!” explains organizer Miles Worth,  “Maybe I should send him a bill for earplugs.”\n\n\n\n\n\n\n\n\nMedia Relations Powerhouse \nTriumphs!\n\nProving that Vikings can still conquer, the global PR powerhouse Norse Communications captured this year’s biggest prize - the Elliot County Media Professional Association’s Award - at last night’s gala banquet in New City. The award is given out every year to the PR firm that distinguishes itself as the best team in the annual Media Professionals’ Softball League. Asked how Norse’s team – comprised entirely of foreign born professionals – were so adept at America’s pastime, president Bjorn Egan said, “We swing with Odin’s hammer, and are clever like the trickster Loki.” But some other media firms claim the Norse team was full of “ringers”. Norse often charges its clients $1250 to bring in personnel from around the state to work in its New City HQ and lately there have been a curious number of thick armed staffers in their office. Egan says it is normal for a global firm like his to rotate in experts whenever a “specific situation” arises. However, these recent experts have proven better at swinging bats, than making friends in this local market.  \n\n\n\n\n\n\n\n\nLabor Strike Embarrasses Local Firm  \n\nHow many wipes per gallon do you get? That’s the question that has everyone laughing over a serious labor situation in Elliot County. When the windshield wiper technicians walked off the job last Thursday, the management of Interstate Trucking and Hauling hired local PR firm Media Relations Inc. (MRI) to explain the dispute from their point of view. But the press release MRI sent out was unintentionally hilarious. It claimed that the technicians created too much wind resistance as they clung to the hood of trucks while wiping and severely lowered fuel economy. MRI, which is usually known for inspired, creative work, quickly became a laughing stock for its misunderstanding of what wiper technicians do. “I thought they were like window washers on a building,” said MRI president, Marvin Moneymaker, “So quit laughing!” Some blame MRI’s small staff which lacks technical expertise and others claim Moneymaker was too busy playing with his imported sports cars to pay attention to the facts. Interstate Trucking is suing MRI since it discovered Moneymaker billed them $500 to lease the cars.  \n\n\n\n\n\n\n\n\nNew City Emergency Response \nServices Provider Arrested!\n\nScandal struck the Elliot County business community as Gil Fermin, the owner and director of New City Emergency Medics Association, was led from his offices in handcuffs shortly after lunchtime today – in front of stunned NCEM staff and clients.  “I am shocked,” said Flora Sharpe of United Americans Club, “I just came by to pay him the $1200 I owe him for deploying his staff to a fundraiser I held last month.”  She added “He is the sweetest man in the world. He showed up on time with fancy new medical equipment, and he was so quick to respond to the emergency we unfortunately had. He really was wonderful.”  His lawyer, Brendon N. Breakham, answered questions after the arraignment later that day, claiming Fermin was simply “very disorganized” and had neglected a summons that he received in the mail for putting out his recycling on the wrong day. His staff, however, which is comprised mostly of moonlighting medical professionals volunteering their time, was quick to insist on Fermin’s innocence. “This whole episode shows Gil is guilty of only one thing,” said a coworker, “being totally scatter-brained.”\n\n\n\n\n\n\n\n\nFirst Responders Called into \nQuestion\n\n\n“Pollalopoosa is awesome!” screamed one heavily pierced New City music fan as he dove from the stage during the band Breach Baby’s first set. He suffered broken ribs. Another concert goer broke both his arms while crowd surfing. You’d assume both would head right for the hospital, right? Wrong. “It’s a new craze,” said event organizer Bellie Studs, “Broke dancing.” First Responders, who provided emergency medical services for the three day concert event was mystified. “We’d put casts on the same kids five or six times,” says First Responder’s owner John Gray, “They just wouldn’t stop smashing themselves up.” However, some blame the multiple contusions on First Responders lack of preparedness. “They got the gear – but they don’t got the guts,” barks Terrell Douglas of National Readiness Services Inc. “What good is charging $750 for durable medical equipment if you can’t keep citizens from getting hurt again?” It is true that while Gray’s team was completely trained and equipped to deal with the medical emergencies, they had no security staff to prevent re-injury. But Grey finds that criticism unfair, “I just don’t know how we could’ve anticipated this. I mean, who would’ve imagined that young people would get so rowdy at an outdoor rock concert?”   \n\n\n\n\n\n\n\n\nEmergency Response Gets \nAttention in Statewide Media\n\nThe bride was in tears, but everyone else across the state was laughing when a medical emergency team was called in to save an ice sculpture. The sculpture, a life-sized representation of the bride and groom, began melting soon after it was delivered to the outdoor reception of Alice and Julian Zillah. Horrified by thoughts of her own mortality, Alice Zillah called Medic! Inc. “A hysterical woman was on the line screaming, ‘Save us! Please save us!’” recalls Medic! Inc. owner Tom Barrier, “We mobilized immediately – triangulating her position with GPS.” What happened next has played over and over on news reports and the Internet. Not knowing what to expect, Medic! Inc. loaded up with $750 worth of stun guns, tear gas, rubber bullets, riot shields and twin 3000 watt loudspeakers. When they finally arrive on the scene, they turn the otherwise idyllic reception into a war zone. “Smoke grenades went off and there were camouflaged guys everywhere,” recounts one attendee. But even with their uniforms and medic field kits – which cost $1500 – Medic! Inc. couldn’t save the sculpture. “We blasted it with carbon dioxide fire extinguishers,” says Barrier, “But we were too late.” The ice sculpture was a mere puddle and crowds- drawn by Medic! Inc.’s spectacle - came to gawk and eat all the shrimp cocktail. “They ruined everything,” cried Zillah, “Why is everyone laughing?”  \n\n\n\n\n\n\n\n\nRetired Practitioners Respond \nto Local Alarm!\n\nWhen an alarm bell sounded at New City pet store, Pets Unlimited, last Wednesday evening, 73 year-old Dr. Zeke Mullen sprang into action. “Well, it woke me up from my nap, that’s for sure,” recalls Dr. Mullen, “The shop is right across the street from my office.” Dr. Mullen is no ordinary old person, he’s the owner of Mullen Medical Supply Inc., which not only sells used health care equipment, it puts them to use when emergencies strike. Hearing the call of duty, Dr. Mullen roused his rapid response team. “You have to remember, this was around five in the afternoon – prime nap time, so it took awhile to wake everyone up,” explains Dr. Mullen. Around 8:30PM, Dr. Mullen’s staff of ex-retirees arrived at the pet store with $1000 worth of tarps, folding tables, tents and mosquito nets to build a triage area and another $1000 worth of bandages, rubbing alcohol, iodine, geritol and adult diapers to be prepared for the worst. They let themselves in with the key under the mat and found parakeets flying everywhere. “Someone had forgot to lock their cages and they set off the motion detector,” says Dr. Mullen, “So we opened the door and shooed them out.” Unfortunately, during the operation, several thieves walked off with rare iguanas and an ibex. The store owner blames Mullen Medics for not having any security training or common sense.\n\n\n\n\n\n\n\n\nRC Boats Deployed to Contain\nToxic Leak\n\nA burst pipe sent toxic waste spewing from a local dog food plant in Wexlerberg on Friday threatening the Himahoochie River- the city’s only source for drinking water. “We all know how toxic and disgusting dog food scraps are,” said Wexlerberg Mayor Tucker Meinhoff, “So we needed this contained fast.” Meinhoff turned to toxic spill expert Peter Boltright of Premiere Containment. “The Himahoochie is too small for the boats we normally use,” recalls Boltright, “So we decided to contain the spill with radio controlled boats.” But first, that meant constructing a 200 foot tower – a $500 expense – to monitor, control and supervise the RC operation. “I invented a collapsible tower,” explains Boltright, “So we were up and running quicker than a hobo on a ham sandwich.” The RC boats were able to drag impenetrable liners, berms, pallets and booms to contain the dog food detritus at a cost of $1800. “We’re incredibly grateful to Boltright and his team,” exclaimed Mayor Meinhoff at a press conference, “They’ve demonstrated once again that they are the experts in river spill containment. Thanks to them, we don’t have to worry about a deadly outbreak of Barkinson's disease.”   \n\n\n\n\n\n\n\n\nElliot County Firm Called\nto Far East  \n\nThe latest environmental disaster is more than a drop in the ocean. It is the Great Pacific Garbage Patch – a trash heap twice the size of Texas weighing over 3 million tons- all made out of plastic. “We use plastic for everything,” says environmentalist Jean Piece, “And an awful lot of it ends up out there in a floating landfill.” To figure out what can be done, a UN task force is sending noted containment specialist Oroko Nakashima and her company Running Rivers Corporation to survey this continent of crap. However, Nakshima is skeptical that her usual equipment – oil containment booms, liners and berms that cost $1500, and more traditional bamboo baskets, fishing lines and retrofitting for Far Eastern fishing vessels that cost $750 – will be enough to handle the overwhelming trash-berg. “Even if containment is possible,” notes Nakashima, “Where do you put that much plastic?” But with her reputation of being able to handle any ocean containment disaster – like protecting coral and mangroves from oil spills – the UN is hopeful Nakashima will find a way. “It will be good to be back on the Ocean,” says Nakashima, “I’m much more experienced with the sea than with the rivers around New City.” She hopes her trip will at least raise awareness and provide the world with a message in a – plastic – bottle.  \n\n\n\n\n\n\n\n\nLocal Vendor Leverages \nMilitary Ties  \n\n“Toxic waste is like communism. It has to be contained,” state stone-faced Bill and Phil Burells of Burells Brothers, a local waste containment and cleanup firm that has seen action around the globe. “If we could kill waste with bullets and grenades, we would.” The former Marines are working to parlay their extensive hazardous waste cleanup experience acquired in the military into a successful business. This military background doesn’t just inform their attitudes, it shapes their tactics, which include using decommissioned military spill containment equipment, at a cost of $1500 to maintain and service, and $700 worth of military-grade tent assemblies, motion detectors, and electrified chicken wire for on-site their onsite command center. The Burells have executed a number of “deployments” around the globe, but they insist they are a local company eager to attack regional challenges with their famous jarhead zeal. Though their experience doesn’t include containing an oil spill in a river setting, the brothers say they are at the ready, should New City River need a cleanup. “We haven’t cleaned a river, but we burned one once, which is kind of the same thing,” Bill commented, to which Phil added, without a hint of irony, “We were aiming for a bad guy in a canoe and we ended up frying everything all the way to the ocean. Live and learn, right? Anyway, the guy didn’t know what hit him”—a fact that merited a fist bump from brother Bill.  \n\n\n\n\n\n\n\n\nInterstate Containment Makes \nImpact on Local Pond\n\nFisherman Luke Vorme couldn’t believe his luck last Sunday when he landed a 27-pound rainbow trout on the banks of Beggars Pond. But his victory dance was cut short when he noticed that the fish had six eyes, a few extra fins and something resembling a moustache. “I thought I had me a natural wonder,” said Vorme, “but it turned out to be a freak of nature. It tasted pretty weird, too.” Other oddities have been pulled from the lake, including dozens of similar fish and something resembling a cross between a frog and a centipede. Signs of the impending apocalypse, or just more evidence that the recent hazardous waste clean by Interstate Containment was only semi-successful? Anthony Wexler, founder of Interstate, favors the former possibility. “We cleaned that lake,” he insists, adding, “Maybe we are at the End of Times, but folks should know I had nothing to do with it.” Many area residents think otherwise, noting that Wexler used some extremely odd, out of date equipment for his cleanup work, and appeared to be quite uninformed in methods of containing and preventing hazardous spills. He is known to purchase containment and transportation equipment at online auctions, spending $1000. And records show that Wexler charged $1500 for corrugated cardboard, a square mile of netting, and a shipping container filled with high-quality chicken wire—supplies not normally associated with waste cleanup. His record also speaks for itself; past successes are all attributed to his extraordinary luck, and disasters tend to crop up after his cleanup efforts.\n\n\n\n\n\n\n\n\nEnvironmental Assessor \nDelivers Findings\n\n“The bad news is there is definitely toxic waste present in Bay Coast waters,” announced environmental assessor Nathaniel Wailer at tonight’s results briefing. “The good news? It’s fairly contained between the jetties and we have yet to see a fish with fifteen eyes or a dolphin with fingers.” With that statement, the inspiring and well-spoken Wailer once again found a way to be clear, concise and comforting, even humorous, when delivering difficult news—a comfort to area residents eager to see results. Wailer has already brought in cutting-edge technology that will allow him to measure sinkage, spread and cross-contamination at the spill site, in addition to monitoring devices for measuring and reporting ecological damage and contamination at a cost of $1800. Also in play are his famously inventive maintenance tactics, which involve $500 of duct tape, chewing gum and copper wiring for spot equipment repairs. When asked how the clean-up will work, Wailer paused a moment before responding. Snapping his fingers, he called one of his crew up to the podium and ordered him to take off his sunglasses. “Pretend the redness in this man’s eyes are the toxic elements,” he suggested. Removing a small bottle from his pocket, he tipped back the team member’s head and gently placed a few drops in each eye. “The organic, non-toxic chemicals we will use in the water will breakdown the toxicity and cause the elements to dissipate into the water, like the redness in my friend’s eyes.” Indeed, the redness was gone and so were any doubts about Wailer’s abilities. \n\n\n\n\n\n\n\n\nYpoforo Ecosystems \nDisappoints!\n\nHe came when called. He swiftly found the source of the hazardous waste leak at Stateside Widgets and stopped it. He executed a textbook cleanup and restored services, not to mention confidence in workers. Yet, Jannis Economou, the jet-setting, highly successful environmental assessment consultant, let down at least one Statewide employee. “He was just so disappointing,” said Keisa Tode, a Project Manager at the plant. “Sure, he was great with the hazardous waste and everything, but he had such a nice, young voice on the phone and so I wasn’t expecting a such a gross middle-aged man.  I mean, he’s balding, for crying out loud.  And, what’s up with all that jewelry? What is this, 1975?” A kinder reading of the many gold necklaces could be that they signal the aging playboy’s many successes. After all, Economou’s company, Ypoforo Ecosystems has a hard-earned reputation for being a provider of fully independent, peer-reviewed, accurate and unbiased reports. The company has up-to-date training and equipment to successfully monitor the New City River ecosystem, charging $2000 for its on-site assessment staff and administrators to man the command and control center. Economou’s many high profile clients around the world would certainly attest to the quality of his work. “I wish some of these high profile clients would have called ahead and attested to his ickiness,” said Keisa. “OMG, I just got a horrible mental picture of him in a Speedo! Eww, eww, eww.”  \n\n\n\n\n\n\n\n\nGrayville Eddy Declared Clean!\n\nEnvironmental advocate Ramblin’ Rose has declared Grayville Eddy clean after an assessment of the Eddy’s waters. At an unconventional press conference, Rose gave the water quality in the Eddy a 21-peace sign salute, before launching into a 15-minute air guitar solo. “That water’s clean as tears from a baby angel,” Rose proclaimed.  To demonstrate the water’s purity, Rose waded into the Eddy to take a long drink. “That’s just one way I stand by my assessments,” explained the area’s leading advocate—a woman known not to give in to the demands of “the man” and who prides herself of producing fully independent and accurate findings. The event ended with Rose and her followers—a tie-dye clad team of bus-ins who are often seen at environmental disaster sites—packing up Rose’s psychedelic “earth bus” and driving off into the sunset. However, some are now wishing she had stuck around, believing she could offer an explanation for why biodiversity in the waterway has plummeted since her assessment. Park Manager Justin Thyme suspects that organic compounds found in the tie-dye colorants worn by Rose’s team now may be functioning as contaminants in the waterway. The colorants, inks and three dozen white t-shirts and work pants used to create tie-dyed uniforms were already a disputed line item on Rose’s invoice. Now it seems the true cost of groovy goes well beyond the $500 expense. “Tie-dye? More like tie-dead,” Thyme says. Rose could not be reached for comment; she is presently being hospitalized for a stomach ailment.\n\n\n\n\n\n\n\n\nLocal Consultant Noted \nfor His Energy\n\n“It was like a scene out of Apocalypse Now,” exclaimed Ben Panset in describing the scene at the Cherry Hill playground last Saturday when the skater environmentalist the firm Enviro-X descended on the park riding motorized skateboards, retrofitted with engines at a cost of $500. “They rode in blasting a punked-out version of Wagner’s Ride of the Valkyries and ran over a lot kids and their parents.” While the number of injuries is disputed, it’s clear that the consultants, led by environmentalist Skeeter McBragg, were excessively vigorous in their efforts to determine the environmental status of the playground. This level of aggression is absolutely necessary, according to McBragg, who explains that “you got to fight fire with fire when dealing with these sleazebag corporations, even if that means grinding on the occasional toddler and her nanny, and their poodle.”  And with Enviro-X’s playground assessment completed, McBragg’s famous one-sided contempt for Elliot Counties biggest corporations has a new target: the nearby design firm Webtastic are being labeled “polluters and contaminators” by an enraged McBragg, whose company slogan is “Make ‘em pay”. The firm denies any wrongdoing. Company Spokesperson Ella Menopea states that, “McBragg is misguided to say the least. We don’t produce biological waste. We design websites and it’s not like we secretly bury toxic unused pixels in the playground at night.” \n",
				0,
				"NEWS_ElliotCountyToday=1"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2today",
				"Elliot County Today",
				GetSprite("iit_midmisc_016"), 
				"Celebrity Slam Dance a Success\n\nWho would have thought that major celebrities would pay big money to be jostled, elbowed, kicked and spat upon? But that’s exactly what they lined up to do at Wes Berlin’s charity fundraiser this weekend. The famous frontman of Shrapnel brought his punk sensibility to the fundraising world with his Celebrity Slamdance awareness event, offering A-list celebrities a true, first wave punk experience, plus free t-shirts and CDs that Berlin provided at a cost of $2500. It was  a surreal sight. As the band blasted out their breakneck songs, the rich and famous—including ancient anchormen, movie stars, singers and athletes—churned in tight circles on the floor, swinging elbows, ramming each other with shoulders, occasionally letting a punch or two go. There were black eyes and bloody noses, even a chipped tooth, but no one seemed to mind. On the contrary, they wore their injuries proudly. “It’s like so cathartic,” said one starlette, adding, “AAARRRRRGGGHHH!” The event confirmed Wes Berlin’s status as one of the world’s most successful charity advocates. Some are surprised by his savvy. In his black leather pants, ripped concert t-shirt and spiked dog collar, the singer is often mistaken for a tough guy. But time and time again, Berlin demonstrates a deep-rooted understanding the many complex issues underlying local environmental causes, not too mention the irresistible appeal of raw aggression. AAARRRRGGGHHHH, indeed.\n\n\n\n\n\n\n\n\nShock Jock Denounces \nLocal Cause!\n\nIt seems that some clowns don’t like being accused of clowning around. This is what shock DJ Lakeisha discovered last week, when a random on-air comment regarding the organization Birthday Clowns without Borders angered members of that organization. “And what’s with Birthday Clowns without Borders?” she asked a caller. “That’s about as necessary as a horn on a bicycle.” The comment immediately sparked backlash among her face-painted and red-nosed listeners. “Clearly the woman is clownist,” said the group’s spokesperson, Hardy Arhar. “We encounter it a lot. It’s especially infuriating when someone in the media perpetuates this kind of discriminatory language.” When reached for comment, Lakeisha was stunned. “I thought I’d be hearing from Water Bikers or some group like that,” she told reporters, “but clowns? Who knew?” This isn’t the first time the wildly popular deejay has offended someone with her playful shock humor and pranks. In fact, Lakeisha is considered controversial by some, who point to comments she has made in the past that compromise her trustworthiness as a spokesperson—like the time she said “little people should just get over themselves and grow up.” But her station’s handlers think she’s worth it, paying $4650 in costs for prerecording interstitials, buying new records and preparing New City River advocacy segments. “We don’t care how successful she is,” Arhar said. “Clownism should not be tolerated. We are human beings with feelings. I mean, it’s not like we’re mimes—those people are useless.”\n\n\n\n\n\n\n\n\nIt’s All About the G\n\n“I’m all about giving back,” exclaims hip-hop mogul Grandmaster G, when asked why he’s so active in supporting charitable causes. The statement is somewhat ironic coming from a superstar known to spend $2000 on professional styling, tracksuits and sneakers, in order to prepare for upcoming pubic appearances, not to mention thousands on a full-time legal team. But it’s also a generous response, in terms of word count, for a rapper who is verbose in the recording booth but often stumped and silent before reporters. Perhaps his willingness to speak signals a sincere interest in charitable work—a striking difference from many celebrities whose commitment to trendy causes is short-lived and shallow. Maybe the rapper’s rocky past holds the key to his motivations. Orphaned at an early age, Grandmaster G—whose real name is unknown—was adopted by a family of Scandinavian rappers who failed to find an audience for their awkward, nasal rhymes and cheerleader beats. Poor and often homeless, the dejected family traveled from town to town, only to be run out by law enforcement or simply angry passersby. It’s believed that this life of perpetual rejection and poverty, a life without security, basic dietary needs and a single decent groove, has equipped G with the ability to empathize with the deprivations of others. But don’t expect the standoffish, but highly popular star to agree with this assessment. His explanation is much simpler.  “The ‘G’ stands for ‘giving back’ y’all,” he’s known to say. \n\n\n\n\n\n\n\n\nRudd Astonishes Local \nPress as Spokesperson!\n\nThe role of a spokesperson is to speak, but some things are best left unsaid. Someone should have mentioned this to country star Fiona Rudd as she assumed the role of spokesperson for Foggy Horizons, a nursing home seeking to improve its image and entice elderly clients into the new wing of their facility. The home might be reconsidering their choice of spokesperson, not too mention Rudd’s price tag for lodging, meals and other accommodations—which cost $4000 during her tenure as New City’s spokesperson—after Rudd’s recent performance before the press, during which she inadvertently revealed the Home’s history of serving meals unfit for human consumption to residents. “Have you seen cat food lately?” she responded to a reporter who brought up old allegations. “I mean, some of that stuff smell’s awful good. I’m tempted to try it!”  Then, when asked about the notorious sanitary conditions at Foggy H, Rudd responded with a line from one of her songs, singing, “Thing about smells is you get used them.”  Cheery and friendly, Rudd had been successful earlier this year in presenting the Home as a lively, clean environment for elderly residents. But it seems she was caught off guard at the press event, which was designed to promote her upcoming CD release—her first in years.  Some felt Rudd was curious choice as spokesperson, given her the recent charges brought against her tour bus for illegal dumping, not to mention her past affiliation with oil companies, a history she often explains away by singing her early hit, “Black Gold and White Babies.”\n\n\n\n\n\n\n\n\n“Phoenix Three” File Suit\n\nThree former Phoenix Services Group (PSG) employees filed a joint civil suit recently claiming their former boss, Margaret Wong, has caused them irreparable emotional suffering. Wong is well known for running a tight ship and under her command PSG has developed a strong reputation for its ability to arrange adequate transportation of relief supplies and restoration equipment as well as logistics teams well-suited for any crisis relief scenario. Still, the lawsuits are piling up just as fast as the company’s invoices. Counsel for the plaintiffs, Rob Ensue, delivered the following statement to the press: “Margaret Wong is so passive aggressive and controlling that many of her employees regularly suffer from nervous breakdowns.” When asked if PSG’s $1,000 in-company team of psychologists wasn’t instated for this very reason, Ensue got down to brass tacks. “Look. None of these headshrinkers and psychobabblers know what they’re dealing with. I’ve got a client who can’t sleep at night, and every time she shifts in bed, whispers, ‘Perhaps I should consider reprioritizing my angular habits for the sake of efficacious slumber.’ Ensue added that Wong’s might be an as of yet undiscovered form of passive aggressiveness. “After we filed, she sent each of the clients a giant bouquet of roses, along with a note that read, “I look forward to seeing you in court. That’s just sick.”\n\n\n\n\n\n\n\n\nForce One’s Little Army a \nForce to be Reckoned With\n\n“They came falling out of the sky. I thought we were under attack.” New City taxi driver Won Kul Gy wasn’t the only resident surprised Thursday morning when hundreds of wooden boxes parachuted onto the roof of downtown’s Cheatham Financial Center. Walter Walters, Cheatham’s head of security, describes what transpired next. “Those boxes landed, then some of them burst open and a bunch of nine-year-olds karate chopped their way out wearing Kung Fu uniforms and took some kind of tiger stance at me.” Although the remainder of the boxes were said to contain cigar humidors - a “Christmas bonus” for Cheatham employees - the focus of Force One’s delivery seemed centered on sheer pinache. Walters continues, “One of those little suckers came at me doing spin kicks. I tased him good. That’s when it got ugly.” Force One CEO and martial arts guru Cedric Maxwell, who is known for employing extreme measures to guarantee the effectiveness of his logistics firm’s offerings, was surprisingly not on scene during the spectacle. When informed of the incapacitation of one of his “tiny soldiers” (for whom he’d paid $2,200 to aid in supply chain management for the relief effort), he had this to say: “When you pick premature acorns, the tree suffers all the way down to the root. Thankfully, mine is a tree with a lot of bark.” Walters was rushed to Holy Unity Hospital after enduring a barrage of bites, scratches and noogies, but was released shortly thereafter.  \n\n\n\n\n\n\n\n\nCommunity Reaches Out to \nShorthanded Shortback\n\n“Without the help of the community, I’d be up the creek,” says retired sheriff cum Prairie Fire Logistics owner Sam Shortback, who is no stranger to the citizens of New City. The career lawman seems to have garnered the support of locals, most of whom have pledged their devotion to him in his new venture. “Old Sam called me up the other day,” says landscape artist Bill “Brushy” Plante, “he needed a hand moving some crates of demolition charges to the self-storage spaces he normally uses for supplies and equipment. I think he dropped something like $2,750 on them. We threw some of them in the back of my pick-up. It’s the least I could do. Sam’s good folks.” But self-storage spaces are limited, and Shortback, who is only beginning to accumulate the experience necessary to undertake large operations, was left with his hat literally in his hands. Plante continues, “I told Sam don’t’ sweat it, and we went and stored the rest of the boxes in my shed. That’s what community is all about, you ask me.” Indeed, Shortback’s Prairie Fire Logistics, which caters to offshore drilling operations, remote construction sites, and paramilitary campaigns, seems to be bringing New City together at a time when cohesion is exactly what she needs.\n\n\n\n\n\n\n\n\nFirm Claimed ‘Best Logistics \nProvider in Town’\n\n“When it comes to moving horses, cattle and feed into Elliot County, every respectable rancher knows Dave’s about the best there is,” says Lyle Hayseed, local rancher and retired rodeo trainer. Hayseed is referring to his old friend Dave Shortback, whose. Western Logistics Services recently spent $3,000 for the hiring of cowboys and farmhands to help with disaster relief efforts. Dave’s twin brother, Sam Shortback of Prairie Fire Logistics, could not be reached for comment, but insiders say after their falling out, Sam took all their warehousing contacts with him. Hayseed laughs, “Dave’s got an army of boys waiting for him to cash in on a marker or two, they’ll be more than happy to come on out and lend a hand for larger-scale projects, including this warehousing business.” Dave Shortback himself arrived at the New City Gazzette’s offices on horseback, wearing a ten-gallon hat and a bolo tie for a brief interview, at which point he stated, “All them other logistics firms can kiss my tucus. That goes for Prairie Fire and that traitor brother of mine. They think they can do what I do?” When asked if he thought he’d ever patch things up with Sam, Dave Shortback squinted, stared into the distance and grumbled, “This town ain’t big enough for both of us,” then skinned out. He’d never so much as gotten off his horse. \n\n\n\n\n\n\n\n\nFine Dining In a Toxic Dumpsite?\n\nWould you eat a sumptuous four-course gourmet meal in the middle of a toxic waste site? If you’re Ashley Dapper of the hazardous waste clean up company Clean Green Machinery you would. That’s because every time CGM takes a job, they spend $2350 on a riverside trailer to house hygienists, custodial staff and a specialized physician to make sure Dapper has a sterile environment to oversee the clean up. “Think of it as a pristine eye in a Hurricane of filth,” explains Dapper. But industry insiders think Dapper is giving a black eye to the  entire waste disposal industry. “She looks ridiculous out there with her lily white gloves,” complains one clean up competitor, “She charges all this money just so she can look good. I’d rather look like a hobo and get the job done right.” Dapper claims her high prices aren’t due to her immaculate appearance, but to her environmentally sound methods. “Anyone can get a hazmat suit and a shovel and say they’re a hazardous waste professional,” says Dapper, “We use only environmentally safe methods. By the time we’re done, anyone can have a picnic at our clean up site without a hermetically sealed trailer like mine.” Scalloped potatoes, anyone?\n\n\n\n\n\n\n\n\nPotty Princess ‘Over the Hill!’\n\nWhile waste disposal is a dirty job, there’s usually not a lot of mud-slinging among rival companies - until recently. In an interview for the industry magazine, “Wastin’ Away”, Sue Offal – owner of Rosenfield waste management company Shoveling Sugar – called New City’s Wanda Rown, “An over-the-hill kook who demands to be treated like a princess when she’s really older than the Queen Mother.” Rown, who owns the company Potty Princess, shot back immediately, “I don’t know which smells worse – the garbage coming out of Sue’s accusations or the methane coming out of her dumpsite.” The animosity between the two disposal divas started a month ago when postings on the waste industry blog site “Trash Talk” suggested that Rown over-dramatizes situations in order to increase her prices. The poster, “soo22”, was easily traced back to Offal. One posting read, “Ever notice that every time Potty Princess charges $4650 to rent a small tanker to ferry recovered spill oil, Wanda Rown buys a new diamond necklace? When is she ever going to run out of necks?” While Rown never directly respond to these postings, Offal’s office was suddenly – some say suspiciously – flooded with sewage. When investigators discovered that all of Potty Princess’ septic containment tanks were empty, Rown confessed. “Oh, was that an office? It looked like a pig sty.” Rown was then fined for improper handling of toxic waste. What happens next in this slugefest is anyone’s guess. \n\n\n\n\n\n\n\n\nBiggest Is Best for Fuller West\n\nFuller West’s waste disposal business is so big it probably affects the tides. At least that’s how it seems. Whether it’s his constant late-night TV ads where he shouts the word “HUGE!” or his rumbling army of dump trucks, drivers and foreman that supervise disposal efforts – at a cost of $2000 per job – West’s company is only short on one thing – subtlety. “It’s weird to see that guy’s big head everywhere,” says local organ grinder Groovy Gary, “Billboards, busses, dump trucks – look, he’s even put a sticker of his face on my monkey!” But West’s saturation approach has earned him the longest list of waste disposal clients in Elliot County, a list that includes some huge exclusive contracts: six cities, fourteen towns, an oil refinery and a laxative manufacturer - just to name a few. “I’m not successful just ‘cause I’m famous,” claims West, “people come for the name recognition – but they stay for the great service.” West does boast one of the most impressive arrays of recovery equipment around – making him one of the few specialists that can handle virtually any kind of spill. But being big does have its challenges. “You try sneaking into a movie theatre – or grabbing an extra pickle at a deli counter,” complains West, “immediately somebody’s always like, ‘Hey it’s that garbage guy!’ and you’re caught.” Luckily for West, his business is doing so well, he can probably pay for that movie ticket or second pickle. That’s one more reason it’s nice to be “HUUUUUUUUGE!”\n\n\n\n\n\n\n\n\nEnvironmental Materials \nRecovered After Dis-Po Burglary\n\nLate this afternoon local police announced that they had recovered goods stolen from the DisPo Corporation. Carry Speaks, spokesperson for the police department revealed that a special investigations task force had inadvertently stumbled on the cache of stolen goods while pursuing a car-theft ring. “Our officers, led by Lt.Kerry Gunne, had found a chop-shop that was cutting up new automobiles for insurance replacement scams. In that warehouse lawmen located pallets of eco-specialized materials stolen during a burglary at DisPo Inc.’s facility only last night. O.D. Stank and Gidget Cheepers were arrested and booked on possession of stolen property. Dis-Po Corp., a local toxic waste management and removal service suffered a major loss when burglars broke into the company's storage facility. Recovered today were six pallets of environmental recovery material owned by the company. “I have no idea what kind of bonehead heist this is” said Detective Serge Finditt, “it’s not as if the thieves would be able to fence these goods. It’s plastic dishes and recycled bottles and some plastic fencing.” The cop isn’t the only one confused. Facilities Manager Don Sumpin revealed that the crooks gain was minimal, but the company’s loss would be a financial imposition. “It would’ve cost at least $3,000 to replace these items.” The company’s president, Adam Baum, would not be comment. Detective Finditt had this to say; “The thieves actually stole from our children’s future for a quick buck today.”  \n\n\n\n\n\n\n\n\nIs Singh’s Guru Also A Criminal?\n\nIt was reported that Avanish Singh had employed a personal guru to aid him with decision-making and health enhancement techniques for relaxation and stress reduction. But is this guru, Pradesh Ohnvools qualified in another area? Ohnvools was hired for $1,000 to “perform personal services and guide techniques for better health” for the attorney. However, investigative members of the County Office on Suspicious Characters has found that Ohnvools might have had a different identity in a former incarnation. “We have discovered that an illegal immigrant who went by the name Pradish Sloovnho had been detected up-state. He was connected to shady activities in a money laundering scheme,” revealed Detective Finditt. “The funneling of monies to criminal organizations is a Federal crime,” he reminded. If the young lawyer has inadvertently employed a criminal, he will not be held legally responsible. However, this possibility brings again to the public forum more evidence that the successful young attorney is in need of much more experience. “He may be a winner, but is it really skill? I think luck may play a bigger role in Singh’s legal victories than many are willing to admit,” confided a competing attorney of Singh’s high-profile reputation. \nThe fact that Eastern Legal has seen a rapid rise in reputation has been attributed to the skill of Avanish Singh’s attention to detail and his fantastic memory, recalling even the seemingly most insignificant of facts. \n\n\n\n\n\n\n\n\nHeroes And Villians: \nDewey, Sewham, And Howe\n\nOne moment the partners seem to have compassion for the “little guy” and the underdog. The next they are predators, taking advantage of the naïve, the uneducated, the victims. At a recent mixer to encourage New City businesses to make all planned upgrades environmentally friendly, Gordon Dewey was a featured speaker. His theme was “Making Modest Progress Through Modest Choices.” The concept is based on the best-selling book by Indian environmentalist Dunno Wattamtawkinbouthi. “To be green is to be thoughtful, to demand less, to expect less,” Dewey offered by-way-of clarification. The talk was well received. However, knowing that Dewey’s firm financed his very expensive Italian shoes and embroidered ties, it was difficult for some to take the attorney seriously. “I know that his firm authorized expenditures of $1,000 and more for “tasteful enhancements.” Boyd feels that he must be as fashionable as any modern leader of the community,” revealed Jim Dandy, local haberdasher. Some suggest that these “enhancements” are at the expense of clients who are indebted to Dewey, Sewham, and Howe. There are reportedly hundreds of people making payments to the firm, some for as many as sixty-months. “ said Judge Meenow, “They are reaping the rewards of being both successful and canny.” Peers contend that most of that firm’s wins are based on technicalities, tiny mistakes made by the opposition or in the appeals process. An unnamed attorney said, “These guys are hypocrites, little more than ambulance chasers with a great line.” \n\n\n\n\n\n\n\n\nStaffing Scandal Revealed: \nAttorney Admits Having A \nManicurist On Payroll\n\nIn an unprecedented admission, Abbie S.Korpis, renowned attorney and environmentalist, has confirmed that she has a part-time manicurist on her office payroll. “I need to be in top form at all times” laughed the famous lawyer. “I could never feel that I’m at my best with a broken or chipped nail.” The problem is that the manicurist is paid $4,250 for her services. This revelation has shaken the foundation of the local bar association. “We of the bar are astounded that one attorney could be so vain and irresponsible,” said Boyd Dewey, senior partner of the famous law firm of Dewey, Cheatum, and Howe. “Public perception and stereotypes are reinforced by bad judgement like this,” he continued. \nIt is no secret that Korpis spends enormously on her wardrobe. A recent financial statement revealing an expenditure of $2,000 for fashion accessories was made public recently. “I don’t see why it’s so scandalous for a woman to take pride in her appearance. Men wear expensive tailored suits but they all look alike. My wardrobe changes with each event, each public appearance. It’s a professional obligation for me to create an impression. A woman with graying hair and red suspenders does not have the same effect as a man with those characteristics.” Korpis, no doubt, has a point. Her intense but competent presentations have figured heavily in her many legal victories.\n\n\n\n\n\n\n\n\nLocal Lawyer Pleases the \nCourt, Pleases the Public!\n\nShe is without a doubt a gifted orator.  She is passionate and fiery. She is a pleasure to watch, like a great performer. All of these things have been said about Liddy Gates, the primary partner of Gates and Associates another of this city’s extraordinary law firms. “In praise of Liddy Gates”, Mayor Eisel said, “Were I to find myself in hot water, I would want Liddy Gates representing me to cool things down.” Though some find Gates’ histrionics too theatrical, no one denies her effectiveness as a legal representative.  \nFocussing primarily on criminal proceedings, Liddy Gates has generated an enviable track record. She defended stripper Ivana Doot against murder charges in the death of millionaire Vernon Erratick. Gates later settled a civil suit against the Erratick estate for a six-figure sum. Gates was also the lead attorney on the infamous case of Spize v.Espy. That well-known case was one of industrial theft—Gomer Espy charged with photographing new guitar designs and selling them to an automobile design company upstate. Espy was declared “not guilty” by a jury when Gates pointed out that “Fins on cars are so 1950s. Who’s kidding who?”  \nThere are some who feel that Gates is too dramatic to be treated seriously. “She’s a drama-queen. She appeals to the emotions of the jury, not the facts-in-law,” asserted Abbie Korpis. The rivalry between the two is no secret. Another officer-of-the-court who wished to remain anonymous stated, “I’m no psychologist, but, I suspect she is actually a little off. I know she spent $4,000 hiring individuals to do her paperwork for her newest client. She has no interest in the mundane details.”\n",
				0,
				"NEWS_ElliotCountyToday=2"
			),
			new InventoryHandler.Inventory_Item
			(
				"w3today",
				"Elliot County Today",
				GetSprite("iit_midmisc_016"), 
				"Photo Exhibition Gives Candid Look \nat Hip Hop Star!\n\nNew City Galleries is delighted to announce the exhibition tour of a unique photographic show that faithfully captures Grandmaster G's life on the road. Based upon the book Hip Hop Heaven: Onstage, Off Stage and Backstage, published by Downlow Books, the show is comprised of over 30 pictures taken by photographer Snap Mo over the course of the most successful tour of Grandmaster G's career.  The exhibition is set to visit 12 cities. The original exhibition opened to both public and critical acclaim last autumn. Hip Hop Heaven illustrates Grandmaster G's first solo tour in nearly a year and includes images taken onstage and backstage during a journey which saw sold-out concert performances around the world. Edgy and candid, funny and illuminating, this is a road trip with Grandmaster G like no other. Snap Mo's lens captures the excitement evoked by the hot lighting of stage sets; the heightened energy of the performance; and close-up shots of Grandmaster G relaxing in his trailer (the promoter paid $7,000 for the rental!) in his alligator pants. \" I never, ever miss a gig,\" said Grandmaster G, \"which made things easy for Snap Mo, but you won't see me making off stage appearances.  Snap Mo was with me every minute so fans can get some rare looks at me off stage. It seemed natural when we were approached to put these photos in an exhibit on the road and so we did.\"  Photographer Snap Mo grew up in Grandmaster G's 'hood and had unprecedented on stage, off stage, and back stage access providing dynamic images both of Grandmaster G's public appearances and the quiet one-on-one moments. Exhibition and sale prints will be signed by both Snap Mo and Grandmaster G.\n\n\n\n\n\n\n\n\nTraffic Jam or Music Jam?\n\nAlthough usually associated with progressive folk- rock fusion, jam bands often draw on various musical traditions, including far-flung styles such as funk, progressive rock, folk, bluegrass, blues, country music, rock, and jazz.  Jam bands feature long modal-based improvisations around the chord progressions of existing songs, incorporating variations on recognizable themes, riffs and rhythms, while allowing for unexpected detours of unpredictable duration. The resulting improvisational-based music is considered by some to be the next phase in the evolution of the instrumentalist solo -- a dominant feature of much traditional music.  Some jam bands only perform this type of music - 'jamming' -- but hardly ever truly deviate from the composition as it is written. Others engage in free improvisation, in effect spontaneously composing music that has never been heard before by the audiences or the players themselves.  New City jam band Casey Jones has been plying their own brand of 'jam-band' music for over ten years, adopting the music and lifestyle of the pioneers of the genre who have come before them.  \"Just like the jam bands of the 60's, we travel with all of our friends and family,\" says bandleader Tennessee Ned.  \"Our lifestyle is like our music and we haven't met a promoter yet that wasn't willing to pay the $4,000 we charge to provide refreshments for our touring troupe.\"  Another common component of the jam band lifestyle is our hard core fans.  Many of these fans take months at a time off from their jobs or school to follow certain bands as they travel on tour.  So, in addition to their hard core New City fan base, Casey Jones has pockets of fans around the nation that contact each other when shows are announced.  E-mail, IM and text messaging starts buzzing as soon as dates are announced.  Concert venues have reported traffic jams as fans clog the thoroughfares leading to concert venues.   The true improvisational spirit of the jam community occasionally gets the best of the fans and the performers.  \"I was in a traffic jam trying to get to a Casey Jones show two years ago,\" says fan Willy Bass.  \"We were right behind the band's bus and the traffic wasn't moving so they got out and started playing for us.  Honestly?  Those dudes just love to play live.\"\n\n\n\n\n\n\n\n\nPaternity Suit Filed Against Local \nPunk!\nRosenfield, 2006.\n\nMonica Lydon appeared in Elliot County court today to file a paternity suit against local punk artist Wes Berlin.  \"I've had enough of his excuses,\" said Lydon, \"it's just time for Wes to pay the child support.\"  Lydon is asking Berlin to answer to paternity charges, and in a closed session today - which he reportedly slept through -- court officials heard confusing testimony about the punk rocker.  \"Wes Berlin is single, has no children and has been living with his mother since birth,\" said Berlin's lawyer, Pablo DiFenner, \"and my client is also bewildered by the fact that Lydon has no known children.\"  When asked by court officials to elaborate on her claim, Lydon started crying.  \"He treats me like his instruments, he just doesn't care,\" claimed Lydon.  \"Do you know he charges promoters $3,500 for new instruments every time he plays, even though he just trashes them at the end of the show anyway?  So what if everyone in New City absolutely adores Shrapnel.  What about the poor instruments?\"  Lydon became increasingly upset as she elaborated.  \"And that van of his!  He charges promoters $6,500 to fix the thing and fill it with gas so he can use it - and they don't even let cars into New City.  I guess it's better than asking me to fix the van, but then he turns around and arrives late to his gigs anyway just so he can keep up his punk image!\" But why a paternity suit?  Lydon sat down for a candid discussion with this reporter.  \"I'm in love with that rat, and I know 10 years from now he'll be treating our kids like he treats everything else. He will come late or never show up.  I'm just getting a head start,\" sobbed Ms. Lydon. When asked to comment Berlin retorted, \"Everything she says is true... well, except the part about the child.  I don't have any children and probably never will.  But I'll get around to responding to her, one of these days.\"\n\n\n\n\n\n\n\n\nDie Hard Fans Follow New Age Star\nNew City, 2005.\n\nWhen it comes to music, some people get personal.   Take New City teenager Aleisha Watkins, a die hard Heather Wineheart fan for almost 10 years, for example.  Aleisha first went to see Heather Wineheart at a sold-out show at the Rosenfield Coliseum in 1995.  Wineheart was supporting her My Bleeding Heart album with a tour that included a spectacular sound and light show.  Wineheart herself was famously joined on that tour by her very own entourage of advisors and gurus - who accompanied her at great expense.  Some say that the cost of bringing them along to a single show costs the promoters of the event $7,500.  In retrospect, it was one of the most memorable shows on record, at least for Aleisha.  \"It was the most amazing concert ever,\" says Watkins.  \"It's not like she played all night or anything - I mean, she basically played the Bleeding Heart songs and then repeated two of them in the encore - but the show was totally amazing.\"  Since that night, Watkins has been part of a small but dedicated New City Wineheart following.  \"Lots of people in New City think Heather's music is boring or depressing,\" says the fan, \"but when I go to her shows I come out feeling so uplifted.  It's not the usual flashing lights and special effects.   She actually has something to say in her music.\"  Apparently, many fans agree with Ms. Watkins -- since even now, Wineheart's website gets hundreds of hits every day.\n\n\n\n\n\n\n\n\nManufacturer Claims Increased Sales \ndue to New Look of Product\nNew City, 2002.\n\nLast year, things were bad for Teenage Fans, a company that produces miniature fans for college dorm rooms and high school students.  Marketed with the slogan, \"We'll blow you away!!!!\" sales were sluggish and owner Mick James felt he had to do something.  \"I looked around and saw that practically all the successful ads in New City were done by Ubik & Wittus.  So I decided to go with the flow,\" says James.  The business owner is glad he did.  One month after the U&W campaign hit the streets of New City, sales were up 700%.  \"The first thing we did,\" explains agency head Martin Connelly, \"Was to turn the fan upside down.\"  This simple twist totally changed the fan's image.  Right-side up, the fan looks smiley and happy - upside-down, it looks menacing and aggressive.  \"And then there was the slogan,\" smiled Connelly.   \"When a company like U&W works exclusively in New City, they really understand the New City market,\" said a top ad industry analyst. \"Kids here don't want happy, they want attitude.\"  A blanket campaign - costing $3,350 in paper for posters, flyers and billboards - announced the new look fan, and the rest is history.  \"Ubik & Wittus know how to make money for companies,\" exclaimed a happy Mick James, \"they're the prophets of profit!\"\n\n\n\n\n\n\n\n\nMovie Attendance Up, or Interesting \nTelevision Shows Down?\n\nWhile the movie business has suffered in the last few years, it now seems to be experiencing a sudden comeback.  Film companies nationwide feared that box office numbers had fallen due to interesting TV shows emerging as the new entertainment leaders... but now the tables may be turning.  Mark Harris and Leslie Tannenbaum, Co-Presidents of Vizible Marketing, a company which specializes in nationwide ad campaigns for major entertainment clients, have their own thoughts on the matter. \"Yeah, TV has gotten better over the last few years. And, heck, it's cheaper to stay home and watch the tube while chewing on a drumstick than go to the movies, but advertising is key; it's just as important as the product. A well-marketed movie will out perform any decent TV show any day,\" explained Harris. \"The movie business has suffered because studios have been trying to save their pennies on advertising.  You get what you pay for.  If you put out pennies, don't expect big bucks at the box office,\" added Tannenbaum.  Harris and Tannenbaum's strategic marketing tactics seem to support their argument.  Their innovative ideas have made them renowned for their work with entertainment industry clients.  \"Yeah, we'll charge $2,350 for street-level marketers to put up posters and hand out fliers, but studios see the returns.  We just did the campaign for a film that broke box office records on its opening weekend.  Interesting TV shows aren't down, if you ask me - they're growing.  However, movie attendance is up because studios are putting out some cash for print and ad campaigns...and it's about time those frugal film guys did!\" said Harris.\n\n\n\n\n\n\n\n\nArea Ad Agency Drives Traffic to \nCharity's Website!\nNew City, 2005.\n\nIf you visit online ad agency ClickAdz's website, you'll come across more than their portfolio of work and a-la-cart price list.  As of Monday morning, there is a prominent link to the New City Foodbank.  \"Every time a person clicks on our DonATE button,\" explains ClickAdz's founder Deborah Geffen, \"ClickAdz gives a dollar to the Foodbank.\"  While that doesn't sound like much, industry experts say it could really add up. \"Say they get 1,000 hits a day,\" explains a writer for Ad Weary Magazine, \"by the end of the year - ClickAdz has stocked the Foodbank with a lot of canned tuna!\"  That scenario seems especially daunting considering ClickAdz only charges $3,700 for its design team to produce sophisticated ad campaigns.  And considering the poor track record they have at promoting festivals and events with their Internet-only marketing, they'll need to pick up more national clients to bring in more dollars.  \"We feel this is really important,\" continued Geffen, undaunted, \"and we hope there is a ripple effect beyond our contribution.\" ClickAdz may already be known as the leading provider of Internet-only marketing in the state, but it will now be known for something else - its generosity.\n\n\n\n\n\n\n\n\nGuerilla Marketers Emphasize \nImportance of Good Sneakers; Loose \nFitting Clothing\n\nPostahz has worked marketing wonders yet again.  The scrappy guerilla marketing firm, owned by Jim Rubinstein, brought crowds in by the droves to the new nightclub, Glo.  Rubinstein and his small but dedicated staff were working for months on the advertising and promotion for Glo, postering the city on foot and bicycle to ensure opening night at the club was a success.  And, a success it was!   Rubenstein cites that their footwear and clothing was partly responsible for the success.  \"We wear new sneakers and camouflaged loose fitting clothing worth $3,500 every time we go out to poster.  This makes us fast on our feet, and we cover more ground than most marketers.  There's not an empty wall in New City when we promote an event.  I think it's important to be comfortable when you work, so I make sure my staff has quality threads,\" said Rubinstein.  Glo owner, Frederic Payard, was thrilled at the success of opening night.  \"Postahz was worth the $4,000 they charged me for their team of street-level flyer distributors and graffiti artists. And I'll pay for those sneakers and clothing any day if I know my club will be packed!\" said Payard.  \"Sure, they screwed up the date of the event on their marketing materials, but when I brought it to their attention they quickly fixed it.  Glo has become a household name with young adults because of Jim Rubinstein.  I sent Jim a hot new pair of sneakers as a gift of thanks,\" added Payard.\n\n\n\n\n\n\n\n\nNightclub Credits Success to Tight \nSecurity!\n\nElliot County's newest nightlife hotspot, \"Library\", is quickly becoming what some call the \"hottest and safest club around town.\"  Library packed the house for another successful weekend, distinguishing itself among trendy destinations in New City with a unique feeling of safety and quiet that many feel resembles an actual library. \"We pride ourselves on our talented security staff,\" said Library operator, Rita Novell, \"they really make sure everyone keeps quiet, and stuff like that.  For example, I cough up $4,000 to provide security personnel from the county's best security company, Volunteers of America.  I chose them because they have an extensive staff of off-duty and retired cops who obviously are very well trained.  They are the type of guys I need minding the velvet ropes and reminding everyone to watch their voices.  I want to keep all the seedy characters out of Library.  We want to draw a sophisticated bookish type of crowd,\" explained Novel. Volunteers of America personnel are comprised of the city's best former police officers, and all are trained to provide private security for events and businesses.  Founder Volunteers of America, Jorge Estevez, said, \"I'm glad my staff can keep a nightclub feeling as safe as a library.  That's quite an accomplishment and we're happy to create that atmosphere.\"\n\n\n\n\n\n\n\n\nSecurity Company Credits Cutting \nEdge Surveillance for Success!\nNew City, 2005.\n\nHigh tech gadgets are increasingly taking the \"private\" out of the term \"private eye\".  New Backscatter x-ray devices can actually see through clothes - great for security companies, but a bit embarrassing for the public.  \"If the choice is a little embarrassment versus being threatened with a gun or a bomb,\" explains Samantha Kim, owner of Apex Protection Services, \"I think we'd all choose the x-ray - it's actually much less intrusive than a body pat-down - and far more reliable.\"  Apex is highly trained to provide location-based security to companies and businesses using sci-fi devices like Backscatter x-ray, and even pays up to $4m000 for feeding, kenneling, a pack of feral watchdogs that act as a crime deterrent.   Even so, it lacks licenses to provide private security - or security for events - so not everyone is convinced.  \"Employees at big time firms might get used to it,\" says a public privacy watchdog, \"but you can tell Apex could never handle an event.  The general public won't stand for that kind of peep-show.\"  Apex has tried to branch out into all forms of security throughout the state, but has had little success booking events.  While they have plenty of employees, it's not clear if they're all suited to event work.  Their hope is technology like the Backscatter x-ray will help fill the gaps, but it doesn't sound like the public will give it a fig leaf of a chance.\n\n\n\n\n\n\n\n\nSecurity Firm Provides Outstanding \nPersonal Protection\n\nMillions of dollars worth of rare art was almost stolen from the New City Art Auction this weekend - but Force One, a local security firm licensed to operate in the state and county, saved the day.  \"An intruder was lurking around the warehouse before the auction, and we caught him trying to shove a rare print down his pants,\" said Force One President Cedric Maxwell.  \"Our $3500 worth of brass knuckles, nun chucks, Chinese stars, blow-guns and darts, came in handy then,\" explained Maxwell.  \"I don't think our little friend will ever forget us.\" It could have been the biggest art heist in years if Maxwell and his security personnel hadn't come to the rescue.  Auction Director Helen Tadsen said, \"Thank goodness we paid the $4,000 for security guards, door screeners, and supervisors.  Force One deserved every penny, and they prevented a potential catastrophe.  The art world would have been devastated if this particular print disappeared in the man's trousers.  It also helped that three hundred security guards turned up to work the event.  I thought it was a bit excessive, since I only requested twenty.  But now I'm not complaining!\"  Police are currently investigating the disappearance of the intruder.  Maxwell and his staff apparently can't remember what they did with him.\n\n\n\n\n\n\n\n\nImpressive Force, or Excessive \nForce?\nNew City, 2006.\n\nShock and awe.  That's what two teens faced when they tried to get away with ten dollars worth of comic books from New City Tales.  Jim Savage, owner of the comic shop, said he was just yelling for the kids to stop when, \"Stun grenades and smoke bombs went off in front of the store - and guys with huge guns popped up out of nowhere - it was just like issue 17 of Anthrax Man!\"  The teens were apprehended, the comics were saved, and justice was done.  Or was it?  While vigilantism is celebrated in comic books, it's actually illegal in New City - something Sean Kwerty and his company HiTek Protection should know.  \"Me and my men had just come from buying $7500 worth of tasers, mace, pepper spray, and other stuff when we heard the call\", explained Kwerty,\" you can't fault us for reacting.\"  But did they over-react?  Many question Kwerty's group, whose members have no accredited training and undergo three weeks of paramilitary survival camp to join the group.  \"They go around with all this high tech gear and say they're watching out for us,\" says public safety analyst Ken Jacobs, \"But who's watching them?\"  It's true the group does have an impressive array of metal detectors, communications and surveillance equipment, but just who is hiring them and why they do what they do remains unclear.\n\n\n\n\n\n\n\n\nLocal Festival Rides Vendor \nRecognized for Contribution!\nNew City, 2005.\n\nWhen we think about the term \"cultural heritage\", music, art and quilting spring to mind.  But what about amusement park rides?  Well, if they don't make you think of the words \"cultural\" and \"heritage\", then you are due for a visit to the Elliot County Historical Society.  In a new exhibit open just this past fall, Pierre Torque, owner of RideRight Inc - a local amusement park ride company - has loaned parts from 12 historic rides to an exhibition titled, \"The Ride of Our Lives\".  These rides have been lovingly restored and are actually operational thanks to Torque's team of machinists who operate and maintain the rides at festivals.  \"They are a top-notch team,\" said exhibit curator Dizzy Speeds.  \"They charge $4,000 for any event they do - and just look at the magnificent job they have done with this exhibit.\"  The curator of the show thanked Torque not only for the loan, but for his work keeping these rides around, \"The artistry that went into these kinetic objets d'art, are stunning examples of early to mid-century modern craftsmanship!\"  Torque spoke about the relevance of showing rides at the museum at the opening night gala, \"When we are children, these rides make a big impression on us - and if we keep that child inside us, they can inspire us throughout our adult lives.\"  These are the kind of rides that are appropriate and safe for our children, but still a thrill for us grown up kids.\n\n\n\n\n\n\n\n\nFestival Rides Feature Fun for All\n\nThe New City 4th of July Festival was a huge success this past weekend.  \"It was one of the best attended festivals ever... and the rides were out of this world.  My head is still spinning!\" said the Mayor of New City. Amusement rides were provided by Midway Amusements, which features innovative rides that are safe for all ages.  John Ferris, founder of the company, said, \"It was a pleasure to provide some entertainment on the 4th.  I got a kick out of seeing the Mayor dangling in the air from our new crane sky-ride.\" Ferris is the visionary behind every ride Midway has to offer. He, along with his son Sam, is known to continuously upgrade and maintain his amusements in order to ensure optimal performance. \"We hire temporary works to help with the operation of rides.  But they're not smart enough to maintain them.  That takes real skill and precision,\" said Ferris, who holds a PhD in engineering.  Ferris charges $4,000 to cover the operator's service and equipment rental fees for festival amusement packages.  \"It's a science,\" he added.  \"I want to make sure Elliot County residents and our very own Mayor are safe as they dangle in the air and scream to the top of their lungs.  Our rides are fun for all and safe for all because I test drive every ride myself at least ten times before the public has access to them.  I spend most of the day upside down.  What a terrific job!\" said Ferris.\n\n\n\n\n\n\n\n\nArea Festival Rides Unsuitable for \nYoung Children!\nNew City, 2006.\n\nHow many kids do you know that are over 4'8\" tall?  That's a height usually reserved for the teenage years, but amusement ride maker Eddie Epoch - of Big Fun Entertainment - says that's the safety benchmark for his fleet of \"kiddie\" rides.  \"Not quite five, but larger than four - if you're taller than that, you're peril's ensured!\" claims Big Fun's literature.  However, kids of all ages and sizes under the 4'8\" mark are usually seen enjoying themselves on Epoch's rides since they've become popular choice at Elliot County's most extravagant parties.  \"Big Fun's level of safety is so high,\" mentioned the Mayor at a recent meeting of the City's Safety Council on which Epoch serves, \"that even at half the recommended height, children are totally safe.  Of course, you don't want to go on those things as an adult, because you could kill yourself.\"  What is a bit shaky is Big Fun's reluctance to operate and maintain its own rides.  Now solely a distributor, it leaves maintenance to customers.  It can cost them up to an additional $8,000 to hire and train machinists, technicians and other staff to maintain the strange, yet fanciful, rides.  \"I've never seen nothin' like those rides of his,\" said Jeb Brooder, an area mechanic who regularly works on amusement park rides, \"Are they from outer space - or the Continent?\"  So whether it's the shape of the ride - or the size of the child - Big Fun's designs stir up a lot of intrigue.\n\n\n\n\n\n\n\n\nCreating an Amusements Experience \nfor Adults\n\n\"Adults today are a tough audience.  They're worse than kids.  They're big brats,\" said Jim Wheeler, President of Amusement World International.  Wheeler and AWI offer amusement rides which boast the latest technology - but they are so new and unproven, that they may be cited with safety infractions.  And often they are. Wheeler, a leading wholesaler of amusement rides to amusement parks all over the country, likes to share his secret to amusing adults:  \"Scare the heck out of them.  That's the key.  They won't know what hit them, and they'll feel good, or feel numb... both great outcomes,\" explained Wheeler.  Wheeler and his two strange and silent business partners, who refused to partake in this interview, have been creating amusement experiences for adults for years. \"We charge $7,650 to cover the cost of hiring and training machinists, technicians, and other staff to maintain equipment at festivals...but we're well worth every penny because our rides make adults get back in line and have another go.\"  When Wheeler was asked to name his favorite ride, he replied, \"I don't ride those things.  Are you crazy?!  They're dangerous!\"\n",
				0,
				"NEWS_ElliotCountyToday=3"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b1",
				"Library Book on Nina Ojeda",
				GetSprite("iit_book_002"),
				"\tLocal Firm Focused on Growth\n\n\tMaybe it's time to test the heavy hitting PR firm Navari Associates for steroids as it prepares for a huge statewide expansion. It's phenomenal, croons Navari president Nina Ojeda with a broad smile, Bad press is making for great business across the state. We're hearing from big companies, small businesses and public service clients. We welcome anyone who's been tragically maligned by the media. Ojeda attributes Navari's success to two key principles: Hire top experts who can clearly communicate technical information to the general public; and maintain a positive tone in the face of negative press.  But behind the optimism, there are growing pains. There's nowhere to sit! complains one new employee who asked to remain anonymous. And there's static build up everywhere ñ I don't even want to tell you where I shocked myself this morning! But help is on the way. Ojeda announced an investment in extra desks, phone lines, anti-static floor mats and new hires to take on the projects ñ to the tune of $1800. Is it possible some of that money is going to business steroids?\n",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b2",
				"Library Book on Gabe Vine",
				GetSprite("iit_book_002"),
				"\tLocal Media Relations Professional Honored!\n\n\tGracias,  merci, danke, takk, grazie, d?kuji ti, bedankt, dzi?kuj?,obrigado, and thank you! That's how Gabe Vine, president of New Media Communications (NMC), wrapped up his marathon two and a half hour acceptance speech last night at the Elliot County Media Professionals Association Banquet.  Attendees stumbled out of the hall bleary-eyed but generally happy for Vine, who has been a fixture in the local media relations industry for years. I've known Gab ñ I mean, Gabe ñ for years, said attendee Laura Genco, We worked together at Ubik & Wittus way back when.  The award - known as the Golden Throaty ñ is given out every year to the professional who best demonstrates the ability to communicate complicated information to the general public. What I can't believe, wondered another shell-shocked attendee, is how he kept going even when his voice was shot ñ he sounded like a pavement saw by the end.  What sounded even worse to event organizers, was Vine's strange request after receiving the award. He walked off stage and immediately demanded $500 for lozenges, throat sprays and homeopathic laryngitis remedies! explains organizer Miles Worth,  Maybe I should send him a bill for earplugs.\n\n\n\n\n\n\tLocal Press Conference Breaks Record!\n\n\tIt's official! Local advertising professional Gabe Vine has shattered the world's record for the longest press conference in history. Three days, four hours and twenty-six minutes was the final count, besting the old record of two hours and ten minutes set back in 1929. Using a combination of herbal stimulants, protein shakes and a catheter, Vine was able to keep going despite a dwindling audience. We stuck it out for the first two days, says TV reporter Jim Dust, but then our camera equipment burned out. Vine, who heads the PR firm New Media Communications (NMC), called the press conference to discuss the recent collapse of the entrance to the New City tunnel in the hopes of deflecting criticism away from his client, Letsee Construction. The marathon event started with a relatively brief hour long statement, then spun out of control when a reporter asked Vine about the epoxy resin Letsee Construction used to hold ceiling bolts in place. Vine got a weird look in his eye, says Dust, and just went off about adhesion science ñ molar attraction constants, hydrogen bonding ñ his knowledge was endless! After three days, Vine's voice finally gave out.  He is now billing his client $500 for lozenges, throat spray and homeopathic laryngitis remedies.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b3",
				"Library Book on Bjorn Egan",
				GetSprite("iit_book_002"),
				"\tMedia Relations Powerhouse Triumphs!\n\n\tProving that Vikings can still conquer, the global PR powerhouse Norse Communications captured this year's biggest prize - the Elliot County Media Professional Association's Award - at last night's gala banquet in New City. The award is given out every year to the PR firm that distinguishes itself as the best team in the annual Media Professionals' Softball League. Asked how Norse's team ñ comprised entirely of foreign born professionals ñ were so adept at America's pastime, president Bjorn Egan said, We swing with Odin's hammer, and are clever like the trickster Loki. But some other media firms claim the Norse team was full of ringers. Norse often charges its clients $1250 to bring in personnel from around the state to work in its New City HQ and lately there have been a curious number of thick armed staffers in their office. Egan says it is normal for a global firm like his to rotate in experts whenever a specific situation arises. However, these recent experts have proven better at swinging bats, than making friends in this local market.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b4",
				"Library Book on Marvin Moneymaker",
				GetSprite("iit_book_002"),
				"\tLabor Strike Embarrasses Local Firm\n\n\tHow many wipes per gallon do you get? That's the question that has everyone laughing over a serious labor situation in Elliot County. When the windshield wiper technicians walked off the job last Thursday, the management of Interstate Trucking and Hauling hired local PR firm Media Relations Inc. (MRI) to explain the dispute from their point of view. But the press release MRI sent out was unintentionally hilarious. It claimed that the technicians created too much wind resistance as they clung to the hood of trucks while wiping and severely lowered fuel economy. MRI, which is usually known for inspired, creative work, quickly became a laughing stock for its misunderstanding of what wiper technicians do. I thought they were like window washers on a building, said MRI president, Marvin Moneymaker, So quit laughing! Some blame MRI's small staff which lacks technical expertise and others claim Moneymaker was too busy playing with his imported sports cars to pay attention to the facts. Interstate Trucking is suing MRI since it discovered Moneymaker billed them $500 to lease the cars.  \n\n\n\n\n\n\n\tLocal Man Named to Fortunate 100!\n\n\tMarvin Moneymaker has lived up to his name. His company, Media Relations Inc. (MRI) was just named the top grossing PR firm in the county.  What makes the achievement all the more impressive is that MRI handles only local clients. We know what people around here want, remarked Moneymaker, and how to make them pay for it. His string of recent successes includes getting people to buy Hillford Dairy's spoiled milk by deeming it Spoilicious and deflecting criticism away from a recent shipping disaster by calling it a commemorative re-enactment of a recent disaster in the Rosendale Reservoir. MRI's local success does have Moneymaker eyeing markets outside of Elliot County. I'd like to expand statewide, he explains, because it would give me more reasons to drive my sports cars. Moneymaker keeps a collection of fancy, imported cars at a temperature controlled garage out of town. Incredibly, he gets his clients to pay the $500 leases for him. It's totally business related, Moneymaker claims, The faster I get to press conferences, the quicker I can fix their problems.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b5",
				"Library Book on Gil Fermin",
				GetSprite("iit_book_002"),
				"\tNew City Emergency Response Services Provider Arrested!\n\n\tScandal struck the Elliot County business community as Gil Fermin, the owner and director of New City Emergency Medics Association, was led from his offices in handcuffs shortly after lunchtime today ñ in front of stunned NCEM staff and clients.  I am shocked, said Flora Sharpe of United Americans Club, I just came by to pay him the $1200 I owe him for deploying his staff to a fundraiser I held last month.  She added He is the sweetest man in the world. He showed up on time with fancy new medical equipment, and he was so quick to respond to the emergency we unfortunately had. He really was wonderful.  His lawyer, Brendon N. Breakham, answered questions after the arraignment later that day, claiming Fermin was simply very disorganized and had neglected a summons that he received in the mail for putting out his recycling on the wrong day. His staff, however, which is comprised mostly of moonlighting medical professionals volunteering their time, was quick to insist on Fermin's innocence. This whole episode shows Gil is guilty of only one thing, said a coworker, being totally scatter-brained.\n\n\n\n\n\n\n\tArea Vendor Overwhelmed!\n\t\n\tYou notice something strange the moment you enter the offices of New City Emergency Medics Association ñ all the clocks have 26 hours on them. It gives us an advantage, explains director of NCEM Gil Fermin, Because for you, it's already four in the afternoon, but to us it's only two ñ and we gain two more hours on you everyday. Since we've implemented this we're actually several days behind! But this time shift seems to have consequences for Fermin and his staff. We're not really sure when to come in, says one exhausted EMT, We all have other jobs in the 24-hour world, so making the switch causes a lot of confusion. It also seems to baffle Fermin himself. You wouldn't happen to know the month, would you? he asks during an interview, AndÖthe year? While the method does allow Fermin's crew to respond quickly to emergency situations ñ sometimes even before they occur ñ it does take its toll in terms of organization. The company is known for paying bills late and some say they are too overwhelmed to take on any new assignments. They're totally over worked, says industry insider Rae Darre, They probably run into themselves coming and going. To keep his staff on the move, Fermin spends $500 on sugared candies, caffeine drinks and pep pills. He might want to invest some of that money in more traditional timepieces.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b6",
				"Library Book on John Gray",
				GetSprite("iit_book_002"),
				"\tFirst Responders Called into Question\n\n\tPollalopoosa is awesome! screamed one heavily pierced New City music fan as he dove from the stage during the band Breach Baby's first set. He suffered broken ribs. Another concert goer broke both his arms while crowd surfing. You'd assume both would head right for the hospital, right? Wrong. It's a new craze, said event organizer Bellie Studs, Broke dancing. First Responders, who provided emergency medical services for the three day concert event was mystified. We'd put casts on the same kids five or six times, says First Responder's owner John Gray, They just wouldn't stop smashing themselves up. However, some blame the multiple contusions on First Responders lack of preparedness. They got the gear ñ but they don't got the guts, barks Terrell Douglas of National Readiness Services Inc. What good is charging $750 for durable medical equipment if you can't keep citizens from getting hurt again? It is true that while Gray's team was completely trained and equipped to deal with the medical emergencies, they had no security staff to prevent re-injury. But Grey finds that criticism unfair, I just don't know how we could've anticipated this. I mean, who would've imagined that young people would get so rowdy at an outdoor rock concert?   \n\n\n\n\n\n\n\tFirst Responders Awarded Contract\n\n\tLocal organization, Save the Fat, has awarded the contract to handle all emergency medical services at this year's charity cook-off event to local company First Responders. The organization, which touts the environmental benefits of recycling all cooking grease, says it made its decision purely on merit. First Responders constantly trains its staff in the latest response and rescue techniques, explains Save the Fat's president, Patti Olean, They're particularly up to date on burn treatments. That's especially important as the group hopes to fill a 600 gallon glass tank with scalding hot reclaimed cooking oil at the event. First Responders is ready to respond rapidly to any hot oil related mishap. We charge $2000 in order to have the manpower to handle a situation quickly, says First Responder's owner John Grey, And in this case, we'll have to move like greased lightning if anything goes wrong. Grey and team might have their hands full. With no security staff, they might have problems keeping the unattended crowd from jumping in the hot oil for a swim.   \n",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b7",
				"Library Book on Tom Barrier",
				GetSprite("iit_book_002"),
				"\tEmergency Response Gets Attention in Statewide Media\n\n\tThe bride was in tears, but everyone else across the state was laughing when a medical emergency team was called in to save an ice sculpture. The sculpture, a life-sized representation of the bride and groom, began melting soon after it was delivered to the outdoor reception of Alice and Julian Zillah. Horrified by thoughts of her own mortality, Alice Zillah called Medic! Inc. A hysterical woman was on the line screaming, ëSave us! Please save us!' recalls Medic! Inc. owner Tom Barrier, We mobilized immediately ñ triangulating her position with GPS. What happened next has played over and over on news reports and the Internet. Not knowing what to expect, Medic! Inc. loaded up with $750 worth of stun guns, tear gas, rubber bullets, riot shields and twin 3000 watt loudspeakers. When they finally arrive on the scene, they turn the otherwise idyllic reception into a war zone. Smoke grenades went off and there were camouflaged guys everywhere, recounts one attendee. But even with their uniforms and medic field kits ñ which cost $1500 ñ Medic! Inc. couldn't save the sculpture. We blasted it with carbon dioxide fire extinguishers, says Barrier, But we were too late. The ice sculpture was a mere puddle and crowds- drawn by Medic! Inc.'s spectacle - came to gawk and eat all the shrimp cocktail. They ruined everything, cried Zillah, Why is everyone laughing?  \n\n\n\n\n\n\tMedic, Inc! Displays Decorum in Recent Response \n\n\tWhen a tanker of marshmallow spread jack-knifed on I-385 in Rosendale last Wednesday, emergency response team Medic! Inc. didn't rush in willy nilly ñ they marched in with dignity and decorum. The only way to avoid panic, explains Tom Barrier, head of Medic! Inc., Is discipline. A former military man, Barrier takes discipline and procedure very seriously. He even hires a detachment of bugle players ñ at a cost of $500 - to play drills that keep his medics in line. Seeing them coming through all that gooey, sugary mess with military precision and gravitas, explained one crash victim covered in marshmallow goop, almost makes you glad you're injured. Barrier's fully licensed medical and security unit had the experience to handle a very sticky situation. But they were slow as molasses, complained Joyce Quicksilver, I was stuck in my car for hours! It isn't the first time Medic! Inc. has been singled out for slow response, but Barrier chafes at that criticism, In an emergency it's not important to count the seconds, it's making sure every second counts.\n",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b8",
				"Library Book on Dr. Zeke Mullen",
				GetSprite("iit_book_002"),
				"\tRetired Practitioners Respond to Local Alarm!\n\n\tWhen an alarm bell sounded at New City pet store, Pets Unlimited, last Wednesday evening, 73 year-old Dr. Zeke Mullen sprang into action. Well, it woke me up from my nap, that's for sure, recalls Dr. Mullen, The shop is right across the street from my office. Dr. Mullen is no ordinary old person, he's the owner of Mullen Medical Supply Inc., which not only sells used health care equipment, it puts them to use when emergencies strike. Hearing the call of duty, Dr. Mullen roused his rapid response team. You have to remember, this was around five in the afternoon ñ prime nap time, so it took awhile to wake everyone up, explains Dr. Mullen. Around 8:30PM, Dr. Mullen's staff of ex-retirees arrived at the pet store with $1000 worth of tarps, folding tables, tents and mosquito nets to build a triage area and another $1000 worth of bandages, rubbing alcohol, iodine, geritol and adult diapers to be prepared for the worst. They let themselves in with the key under the mat and found parakeets flying everywhere. Someone had forgot to lock their cages and they set off the motion detector, says Dr. Mullen, So we opened the door and shooed them out. Unfortunately, during the operation, several thieves walked off with rare iguanas and an ibex. The store owner blames Mullen Medics for not having any security training or common sense.\n\n\n\n\n\n\tMechanized Transportation Enables Rapid Response\n\n\tThey call themselves the silver bullets. They're senior citizen EMTs from Mullen Medical Supply Inc. who travel on mechanized scooters- which cost $500 - to provide a rapid response to local emergencies. All over 70 years old, these semi-retired health and security professionals are led by Dr. Zeke Mullen, the celebrated physician who was once given the key to the city for his service to the community. That was a great day, recalls Dr. Mullen, still groggy from his mid-day nap, But I'm having the time of my life right now as a silver bullet! While the nickname conjures up a lightning fast reaction to a crisis, critics contend these bullets are more like silver slugs. Speedologist Dr. Spencer Gonzalez explains, A 9mm bullet can travel 1500 feet per second ñ or roughly 1023 miles per hour. The average person runs at about 6 miles an hour. These mechanized scooters top off at around 3 miles per hour ñ so you can see, the analogy is flawed. Mullen Medical's response time is even slower when you factor in their frequent naps, bathroom breaks and occasional dementia. When you do the math, remarks Gonzales, They're actually moving in reverse.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b9",
				"Library Book on Peter Boltright",
				GetSprite("iit_book_002"),
				"\tRC Boats Deployed to Contain Toxic Leak\n\n\tA burst pipe sent toxic waste spewing from a local dog food plant in Wexlerberg on Friday threatening the Himahoochie River- the city's only source for drinking water. We all know how toxic and disgusting dog food scraps are, said Wexlerberg Mayor Tucker Meinhoff, So we needed this contained fast. Meinhoff turned to toxic spill expert Peter Boltright of Premiere Containment. The Himahoochie is too small for the boats we normally use, recalls Boltright, So we decided to contain the spill with radio controlled boats. But first, that meant constructing a 200 foot tower ñ a $500 expense ñ to monitor, control and supervise the RC operation. I invented a collapsible tower, explains Boltright, So we were up and running quicker than a hobo on a ham sandwich. The RC boats were able to drag impenetrable liners, berms, pallets and booms to contain the dog food detritus at a cost of $1800. We're incredibly grateful to Boltright and his team, exclaimed Mayor Meinhoff at a press conference, They've demonstrated once again that they are the experts in river spill containment. Thanks to them, we don't have to worry about a deadly outbreak of Barkinson's disease.   \n\n\n\n\n\n\tKnown Containment Specialist Answers Questions\n\n\tWith over 2,500 patents to his name, containment specialist Peter Boltright has come under fire recently. Is he using his government contracts to clean up toxic spills as a way to fund the R&D of his own inventions? In question is $1800 for specialized remote controlled boats he designed to clean up a spill in Wexlerberg. Government monies should never, ever fund private research, declared New City councilman Rick Fist, Except in the defense, healthcare, transportation and biotech industries. And what about allegations of public displays of affection between Boltright and containment equipment? Sure his company, Premier Containment, is the leading authority on containing toxic spills in rivers and his team of crane operators, machinists and engineers can be quickly deployed to a disaster site, but he's obviously a nutty, greedy weirdo, said a passerby in downtown New City. To refute these claims, Boltright held a press conference Wednesday at his machine shop. I do love machines, admitted Boltright, but I'm not in love with them. What people saw between me and that dredger was a routine diagnostic check up. He also explained that his heart will always belong to the toxin containment process itself.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b10",
				"Library Book on Oroko Nakashima",
				GetSprite("iit_book_002"),
				"\tElliot County Firm Called to Far East\n\n\tThe latest environmental disaster is more than a drop in the ocean. It is the Great Pacific Garbage Patch ñ a trash heap twice the size of Texas weighing over 3 million tons- all made out of plastic. We use plastic for everything, says environmentalist Jean Piece, And an awful lot of it ends up out there in a floating landfill. To figure out what can be done, a UN task force is sending noted containment specialist Oroko Nakashima and her company Running Rivers Corporation to survey this continent of crap. However, Nakshima is skeptical that her usual equipment ñ oil containment booms, liners and berms that cost $1500, and more traditional bamboo baskets, fishing lines and retrofitting for Far Eastern fishing vessels that cost $750 ñ will be enough to handle the overwhelming trash-berg. Even if containment is possible, notes Nakashima, Where do you put that much plastic? But with her reputation of being able to handle any ocean containment disaster ñ like protecting coral and mangroves from oil spills ñ the UN is hopeful Nakashima will find a way. It will be good to be back on the Ocean, says Nakashima, I'm much more experienced with the sea than with the rivers around New City. She hopes her trip will at least raise awareness and provide the world with a message in a ñ plastic ñ bottle.  \n\n\n\n\n\n\n\tElliot County Vendor to Speak at Conference\n\n\tNext month New City will host Green Up Politics, a statewide conference on how local politicians can become more involved in environmental issues ñ or at least seem to care about them. The keynote address concerns toxic spill containment which has become a hot button issue thanks to hundreds of tragic incidents over the past few years. Our rivers have become sewers and our lakes have become toilets, complained Rosenfield Councilman Dirk Wasser, We have to take control of this problem locally! With all the emphasis on local solutions, the choice of Oroko Nakashima as the keynote speaker seems somewhat ironic. While Nakashima is undoubtedly an environmental expert and one of the most sought after containment specialists, she has never worked on a local project in the state. She's an ocean clean up rock star, says local conservationist Patti Elm, But the ocean is a thousand miles away. Nakashima's Running Rivers Corporation does have a mix of equipment to handle almost any kind of containment job, but its lack of local contacts could hinder it in an emergency. Politicians around here want to be looked up to, says Elm, Not talked down to. Nakashima could score political points with her troupe of acupuncturists and herbalist that she contracts for $500 on every job. Politicians like to know up front when they'll be stabbed in the back.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b11",
				"Library Book on Phil Burells",
				GetSprite("iit_book_002"),
				"\tLocal Vendor Leverages Military Ties\n\n\tToxic waste is like communism. It has to be contained, state stone-faced Bill and Phil Burells of Burells Brothers, a local waste containment and cleanup firm that has seen action around the globe. If we could kill waste with bullets and grenades, we would. The former Marines are working to parlay their extensive hazardous waste cleanup experience acquired in the military into a successful business. This military background doesn't just inform their attitudes, it shapes their tactics, which include using decommissioned military spill containment equipment, at a cost of $1500 to maintain and service, and $700 worth of military-grade tent assemblies, motion detectors, and electrified chicken wire for on-site their onsite command center. The Burells have executed a number of deployments around the globe, but they insist they are a local company eager to attack regional challenges with their famous jarhead zeal. Though their experience doesn't include containing an oil spill in a river setting, the brothers say they are at the ready, should New City River need a cleanup. We haven't cleaned a river, but we burned one once, which is kind of the same thing, Bill commented, to which Phil added, without a hint of irony, We were aiming for a bad guy in a canoe and we ended up frying everything all the way to the ocean. Live and learn, right? Anyway, the guy didn't know what hit himóa fact that merited a fist bump from brother Bill.\n\n\n\n\n\n\n\tMilitary-Style Discipline at the Scene of Disaster\n\n\tWhen a landside destroyed a pesticide factory in Mesoamerica, local authorities were overwhelmed with the task of containing hazardous materials. In swooped Burells Brothers, an area company led by former Marines Bill and Phil Burells. It was shock and awe, reports the region's governor, Lester Rhine. They had personnel storming the beach from amphibious troop carriers. Which scared the heck out our tourists. Maybe it was little much, given that the spill is forty miles from the coast. Highly educated in the logistics and practices of spill containment, the brothers bring years of military experience to the hazmat business, not to mention years-old, even outdated, semi-serviceable decommissioned military equipment, which some say isn't sufficient to prevent cross-contamination. But if wars and waste cleanup can be won with sheer military grit and efficiency, the Burells and their team of former military waste wasters, as they call them, could conquer the world. Flown in by leveraging military transport connection, the Burells' army of hazmat warriors work with extraordinary precision to take out the enemy of waste. And while transport is cheap, the Burells spend $500 on Video games, DVDs, and informative industrial shorts to entertain its off-duty personnel in the ërec tent' between shifts. Whatever works, says Governor Rhine, as long as they leave.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b12",
				"Library Book on Anthony Wexler",
				GetSprite("iit_book_002"),
				"\tInterstate Containment Makes Impact on Local Pond\n\n\tFisherman Luke Vorme couldn't believe his luck last Sunday when he landed a 27-pound rainbow trout on the banks of Beggars Pond. But his victory dance was cut short when he noticed that the fish had six eyes, a few extra fins and something resembling a moustache. I thought I had me a natural wonder, said Vorme, but it turned out to be a freak of nature. It tasted pretty weird, too. Other oddities have been pulled from the lake, including dozens of similar fish and something resembling a cross between a frog and a centipede. Signs of the impending apocalypse, or just more evidence that the recent hazardous waste clean by Interstate Containment was only semi-successful? Anthony Wexler, founder of Interstate, favors the former possibility. We cleaned that lake, he insists, adding, Maybe we are at the End of Times, but folks should know I had nothing to do with it. Many area residents think otherwise, noting that Wexler used some extremely odd, out of date equipment for his cleanup work, and appeared to be quite uninformed in methods of containing and preventing hazardous spills. He is known to purchase containment and transportation equipment at online auctions, spending $1000. And records show that Wexler charged $1500 for corrugated cardboard, a square mile of netting, and a shipping container filled with high-quality chicken wireósupplies not normally associated with waste cleanup. His record also speaks for itself; past successes are all attributed to his extraordinary luck, and disasters tend to crop up after his cleanup efforts.\n\n\n\n\n\n\n\n\tGreen Rivers Alliance to Award Local Vendor!\n\n\tDart enthusiast and local entrepreneur Anthony Wexler was honored today by the Green Rivers Alliance for his charitable contributions. The move was questioned by some who point out that Wexler's attempts at providing hazardous waste containment have often lead to new and unexpected disasters. Look, his head might be in the clouds, but his heart is in the right place, explained Drew Ablanc, Awards Committee Chair for the Green River Alliance. That's why we chose to honor him with our ëGuy That Gives a Damn' award. The award comes in the form of a large trophy, depicting a bald, anatomically incorrect man with a raised fist. Wow. The Our Lady of Guancomo statue on my dashboard just got demoted, Wexler announced upon being handed the award. Included with the award is a cash prize of $1000, and though it's common practice to donate the check to charity, Wexler indicated that he would be holding on to it by folding the giant check into a small, thick cube and stuffing it into his pocket. It's assumed that the money will be used to pay the local bar owners who have disclosed the names of dart league participates that Wexler mobilizes for containment efforts.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b13",
				"Library Book on Nathaniel Wailer",
				GetSprite("iit_book_002"),
				"\tEnvironmental Assessor Delivers Findings\n\n\tThe bad news is there is definitely toxic waste present in Bay Coast waters, announced environmental assessor Nathaniel Wailer at tonight's results briefing. The good news? It's fairly contained between the jetties and we have yet to see a fish with fifteen eyes or a dolphin with fingers. With that statement, the inspiring and well-spoken Wailer once again found a way to be clear, concise and comforting, even humorous, when delivering difficult newsóa comfort to area residents eager to see results. Wailer has already brought in cutting-edge technology that will allow him to measure sinkage, spread and cross-contamination at the spill site, in addition to monitoring devices for measuring and reporting ecological damage and contamination at a cost of $1800. Also in play are his famously inventive maintenance tactics, which involve $500 of duct tape, chewing gum and copper wiring for spot equipment repairs. When asked how the clean-up will work, Wailer paused a moment before responding. Snapping his fingers, he called one of his crew up to the podium and ordered him to take off his sunglasses. Pretend the redness in this man's eyes are the toxic elements, he suggested. Removing a small bottle from his pocket, he tipped back the team member's head and gently placed a few drops in each eye. The organic, non-toxic chemicals we will use in the water will breakdown the toxicity and cause the elements to dissipate into the water, like the redness in my friend's eyes. Indeed, the redness was gone and so were any doubts about Wailer's abilities. \n\n\n\n\n\n\n\tOverworked Consultant Turns to Unusual Places\n\n\tWhen stressed and overworked, some seek out massages. Others play golf, read books, hunt neighborhood cats. But for the Busiest Man in the Environmental Consulting Biz, there's no substitute for soothing reggae music, organic fruits and the solitude of custom built sensory-deprivation chamber. It's the closest thing to climbing back into the womb, explains Nathaniel Wailer, an environmental expert in high demand. You float in a lightless, soundless void and, after a while, you can almost hear mother breathing around you. It sure beats TV, mon.  Unconventional, certainly, but it seems to work. Despite his 80-hour work weeks, the Montogan native always appears refreshed, cool-headed and infused with Island-style optimism. With his expertise in using cutting-edge technology that allows him to measure sinkage, spread and cross-contamination at spill sites, he has built a reputation as a leading field consultant and clean-up specialist. Some find his tactics a bit unconventionalólike the $500 expense associated with having organic fruits, vegetables and sugar-free candies available to assessment personnel, or his eccentric, handy-man approach to maintaining equipment with duct tape and chewing gum. But everyone agrees always he delivers in high fashion. Could sensory-deprivation be the key to his success? Maybe, he ponders. But it could also have to do with the fact that I meditate every day.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b14",
				"Library Book on Jannis Economou",
				GetSprite("iit_book_002"),
				"\tYpoforo Ecosystems Disappoints!\n\n\tHe came when called. He swiftly found the source of the hazardous waste leak at Stateside Widgets and stopped it. He executed a textbook cleanup and restored services, not to mention confidence in workers. Yet, Jannis Economou, the jet-setting, highly successful environmental assessment consultant, let down at least one Statewide employee. He was just so disappointing, said Keisa Tode, a Project Manager at the plant. Sure, he was great with the hazardous waste and everything, but he had such a nice, young voice on the phone and so I wasn't expecting a such a gross middle-aged man.  I mean, he's balding, for crying out loud.  And, what's up with all that jewelry? What is this, 1975? A kinder reading of the many gold necklaces could be that they signal the aging playboy's many successes. After all, Economou's company, Ypoforo Ecosystems has a hard-earned reputation for being a provider of fully independent, peer-reviewed, accurate and unbiased reports. The company has up-to-date training and equipment to successfully monitor the New City River ecosystem, charging $2000 for its on-site assessment staff and administrators to man the command and control center. Economou's many high profile clients around the world would certainly attest to the quality of his work. I wish some of these high profile clients would have called ahead and attested to his ickiness, said Keisa. OMG, I just got a horrible mental picture of him in a Speedo! Eww, eww, eww.  \n\n\n\n\n\n\n\tEnvrionmental Consultant Called to Reappear Before Committee\n\n\tHe first appeared before the committee last Friday, but the only consensus his visit produced was unanimous confusion. Mr. Economou has a way of speaking that resembles his manner of wearing jewelry, says Committee Chair Ben Thardondat, referencing the aging playboy environmentalist's many layers of gold chain necklaces. That is, overly ornamental and hopelessly entangled. Now the committee has reluctantly invited Economou back, urging him to give a more conventional report of his company's recent analysis of New City river, as well as an explanation for the $2000 fee attributed to onsite staff and administrators to man command and control center. Economou's first presentation confirmed the widely held impression that he can occasionally be disorganized and unruly in appearance, and sometimes has a hard time clearly and concisely communicating his findings. Indeed, the amateur classicist's report resembled the recitation of a poorly written epic poem. The sons of our city in dismay bade the heralds call the people to a council man by man, Economou began his report, continuing with, but not to cry the matter aloud; I made haste also myself to call them, and they sat sorry at heart in their assembly. Why didn't committee members ask for clarification on the spot? It sounded good, explains Thardondat, and no one wanted to look like an idiot. It took us a few days to decide who the real idiot is. Mr. Economou will reappear this Wednesday.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b15",
				"Library Book on Ramblin' Rose",
				GetSprite("iit_book_002"),
				"\tGrayville Eddy Declared Clean!\n\n\tEnvironmental advocate Ramblin' Rose has declared Grayville Eddy clean after an assessment of the Eddy's waters. At an unconventional press conference, Rose gave the water quality in the Eddy a 21-peace sign salute, before launching into a 15-minute air guitar solo. That water's clean as tears from a baby angel, Rose proclaimed.  To demonstrate the water's purity, Rose waded into the Eddy to take a long drink. That's just one way I stand by my assessments, explained the area's leading advocateóa woman known not to give in to the demands of the man and who prides herself of producing fully independent and accurate findings. The event ended with Rose and her followersóa tie-dye clad team of bus-ins who are often seen at environmental disaster sitesópacking up Rose's psychedelic earth bus and driving off into the sunset. However, some are now wishing she had stuck around, believing she could offer an explanation for why biodiversity in the waterway has plummeted since her assessment. Park Manager Justin Thyme suspects that organic compounds found in the tie-dye colorants worn by Rose's team now may be functioning as contaminants in the waterway. The colorants, inks and three dozen white t-shirts and work pants used to create tie-dyed uniforms were already a disputed line item on Rose's invoice. Now it seems the true cost of groovy goes well beyond the $500 expense. Tie-dye? More like tie-dead, Thyme says. Rose could not be reached for comment; she is presently being hospitalized for a stomach ailment.\n\n\n\n\n\n\n\tLocal Activist's Report Makes a Stand!\n\n\tMother Earth ain't a pushover, says Ramblin' Rose, the environmental advocate who recently declared the Grayville Eddy waterways uncontaminated after a series of tests. Humans try to harsh her mellow but she's bigger than that. The conclusion came as a surprise to members of the waterway community who believed something was amiss in the Eddy after spotting a slew of dead fish along the banks, as well as a raccoon with five eyes. They put out a call for help and Ramblin' Rose answered. By tapping her enormous network of supporters and fans of the 90's jam band The Boys, she was able to quickly assemble an assessment team. She raised some eyebrows when she demanded $500 worth of inks, colorants and three dozen white t-shirts and work pants to create tie-dyed uniforms for assessment personnel.  She also used equipment purchased from online auction houses, which has led to dubious results in the past. But her colorful crew ran a battery of tests to the sounds of Boys bootleg tapes, broadcast via loudspeaker from Rose's earth bus. Local corporations suspected of dumping contaminants into the waterway were pleased with the findings, leading some to wonder if Rose had been bought off. Don't even go there, Rose warned. And what about the five-eyed raccoon? Just Mother Nature being creative, Rose offered with a shrug. I've been with plenty of people whose features some might call, well, unnaturalóbut I call blessed.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w1b16",
				"Library Book on Skeeter McBragg",
				GetSprite("iit_book_002"),
				"\tLocal Consultant Noted for His Energy\n\n\tIt was like a scene out of Apocalypse Now, exclaimed Ben Panset in describing the scene at the Cherry Hill playground last Saturday when the skater environmentalist the firm Enviro-X descended on the park riding motorized skateboards, retrofitted with engines at a cost of $500. They rode in blasting a punked-out version of Wagner's Ride of the Valkyries and ran over a lot kids and their parents. While the number of injuries is disputed, it's clear that the consultants, led by environmentalist Skeeter McBragg, were excessively vigorous in their efforts to determine the environmental status of the playground. This level of aggression is absolutely necessary, according to McBragg, who explains that you got to fight fire with fire when dealing with these sleazebag corporations, even if that means grinding on the occasional toddler and her nanny, and their poodle.  And with Enviro-X's playground assessment completed, McBragg's famous one-sided contempt for Elliot Counties biggest corporations has a new target: the nearby design firm Webtastic are being labeled polluters and contaminators by an enraged McBragg, whose company slogan is Make ëem pay. The firm denies any wrongdoing. Company Spokesperson Ella Menopea states that, McBragg is misguided to say the least. We don't produce biological waste. We design websites and it's not like we secretly bury toxic unused pixels in the playground at night. \n\n\n\n\n\n\n\tLocal Activist Given Key to the City!\n\n\tNew City leaders honored local legend environmentalist and skater Skeeter McBragg for his firm's efforts in cleaning up the New City waterfront. McBragg, whose company Enviro-X is comprised of skater activists, hoisted the key over his head to a roar of applause from his youthful followers. It was clearly a moment of comeuppance for a man whose unconventional tactics have plagued his efforts to be taken seriously as a legitimate protector of the area's environment. Such questionable tactics include a $1000 on-site command areas consisting of a card table and half-pipe and assessment presentations that are more profane rants that they are statistical reports. A known crusader, McBragg is has been accused of strategies more often associated with eco-terrorists than advocates. His verbal attacks are known for their total lack of scientifically acquired evidence, not to mention reason, nor complete sentences. Yet all this seemed to be water under the bridge, so to speak, as McBragg's efforts were officially recognized by New City officials. I'm proud to present this tireless advocate with the key to the city, announced Councilman Will Hustop. That's a big-ass key, McBragg exclaimed, marveling at the prop before adding, so where's the door to the city? The line earned laughter from all assembledólaughter that was quickly silenced when a frowning McBragg asked, No. Seriously. Where am I supposed to use this thing?",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b1",
				"Library Book on Wes Berlin",
				GetSprite("iit_book_002"),
				"\tAnglophile Activist Pays for Accent\n\n\tA man purporting to be the former accent-coach for punk activist Wes Berlin has gone public with his wrongful termination case against the singer. The claim, which was filed this week, states that the accent coach, Mr. M. Tarde, was fired by Berlin when the singer learned that Mr. Tarde was not authentically English. Rather, Mr. Tarde hails from our very own Elliot County and has never set foot in the United Kingdom. Berlin, who paid $2350 for coaching intended to refine his fake English accent, learned of Mr. Tarde's deception when the tutor let loose with a long stream of curses in perfect American English, after sitting on Berlin's spiked dog collar. It was like the geezer was bloody possessed, explains Berlin. And possessed by a Yank sailor. Mr. Tarde insists he's entitled to damages due to the fact that his accent coach was not only truly English, but a person with direct ties to England's punk royaltyóthe seminal band Joy Division. I was providing Mr. Berlin with insider instruction, resulting in an impeccable approximation of mid-70's, West London, punk dialect, claims Tarde. He was fooling everyone. On the contrary, it seems no one was fooled, but no one cared either. Well-spoken and witty, Berlin's ability to improvise brilliant responses to the press overshadowed his rather clunky Cockney accent. I guess you get what you pay for, Berlin recently admitted, dropping his pose. A fake British accent from a fake British dude.\n\n\n\n\n\n\n\tDiary Reveals Punk Legend's Sensitive Side\n\n\tWith the rise in popularity of Wes Berlin, punk legend turned social activist, artifacts from his early, wilder days have popped up everywhere. There's the now-famous picture of him breaking a guitar over a security guard's head and giving a music critic the business end of his Doc Marten after an unkind CD review. And how about the tour bus recording of Berlin screaming at groupies for waking him up? Then there's the latest item to appear in an online auction: the singer's teen diary, in which he reveals a desire to become a veterinarian, a secret love for musicals and an undying affection for sea otters. Huh? Yes, apparently, Berlin wasn't always the radical punk warrior he is today, though, even now, one can see evidence that Berlin still retains some of that earlier sensitivity. There's his famous love for his mother, which is most evident in the mum tattoo inked into his chest. His love for sea mammals is revealed in the giant $1000 tattoo commemorating the baby seals that were, according to Berlin, lost in the New City oil spill. And perhaps most telling is his ongoing display of a deep-rooted understanding of the area's many complex environmental issues, not to mention his well stated and witty improvised responses to queries from the media. Some fans have argued that the diary is a fake, but Berlin recently confirmed its authenticity by flashing yet another, ill-placed tattoo at reportersóa tattoo of a sea otter in a leather jacket.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b2",
				"Library Book on Lakeisha",
				GetSprite("iit_book_002"),
				"\tShock Jock with a Soft Side\n\n\tWhen you listen to Lakeisha's drive-time radio show, you get the impression that the in-your-face deejay eats kittens for breakfast. Know for her quick tongue and sharp wit, not to mention playful shock humor and pranks, the woman with one name exhibits a take-no-prisoners view of life. But get her away from the mic and you'll see another side. That's right, shock jock Lakeisha is really a softie at heart. Hard to believe? Consider that her idea of the perfect night is nothing more than curling up on the couch with a romance novel. How about the fact that she collects stuffed animals, with a special affection for turtles? Then there's her love for her hometown, New City, which is demonstrated in the many New City River is number one T-shirts, mugs, tote bags and foam fingers she uses for on air promotions and fundraisers at a cost of $2150, along with Mayor Gonzalez bobblehead dolls and New City snow globes. I love this town, Lakeisha admits. It's my home and the home of the greatest people on the planet, as far as I'm concerned. Makes me sad when people don't treat her right. Makes me mad, actually.  But behind that fury there's a highly intelligent, supernaturally knowledgeable woman who can step back and bring on the mellow by writing sonnets in calligraphyóone of her favorite pastimes. However, she claims the most reliable way she has found to relax is to stay away from idiots. \n\n\n\n\n\n\n\tThe Hardest Working Woman In Show Biz Recognized    \n\n\tAnyone new to New City might think we have a clone machine somewhere in the basement, and that the person we've cloned is the omnipresent Lakeishaóshock jock, retailer, small business owner, environmental advocate and spokesperson, and respected media expert. In the mornings, you're likely to hear her on the radio, or see her broadcasting live from the riverside, where she'll pay $1000 to anyone willing to swim to the River's oil slick and back. Mid-day, you could easily encounter her behind the manager's desk at her downtown store, or walking a new clerk through the operational basics. Afternoons will find her researching material for her shows and advocacy segments and evenings bring dinners and fundraisers.  It's not uncommon to spot her checking out clubs, bands, movies and plays every night of the week, as she feeds her insatiable appetite for pop culture.  All this has earned Lakeisha the hardest working woman in show biz title, bestowed upon her by the Women Rock Foundation. Said Foundation chairwoman, Cyn Plenty, Lakeisha is kicking butt and taking names around the clock. Best not to get in her way. Lakeisha will be honored with an award ceremony and dinner at the prestigious New City Media Center, where she will be recognized for her insightful commentary, her well-reasoned entertainment reviews, her quick with and her ability to tackle complex issues on behalf of her audience.  Hopefully, she'll find the time in her busy schedule to attend.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b3",
				"Library Book on Grandmaster G.",
				GetSprite("iit_book_002"),
				"\tBlock Party Blocks Traffic\n\t\n\tThose stuck in traffic around the city center last night were feeling far from charitable. On the contrary, they directed a lot of decidedly uncharitable feelings at hip-hop luminary Grandmaster G and his Give Till It Hurts Block Party. The event, which essentially shut down the city center, causing traffic jams that extended for blocks in all directions, was the mogul's way of bringing awareness to his numerous charitable causes, many of which are promoted in his controversial hip-hop compositions. These good intentions were lost on the hundreds of commuters who, according to one, Just wanted to go home and watch the event on TV. Many of the trapped drivers became incensed when they learned that event featured an above-ground pool, carnival equipment, turntables and speakers, all at cost of  $2750. Super models were also included in the party mix. Reporters on the scene were able to ask Grandmaster G if he was aware his charity event was responsible for raising tempers, not awareness, to which the rapper responded with shrugsóa common response to questions from the media by the stand-offish star. You mean to tell me I'm sitting here, stuck in my car, while a bunch of hip-hoppers frolic with models in a pool, blocking my way? one especially irritable commuter demanded to know. When his assumptions were confirmed, the driver lamented, Why? Why? Why didn't I learn how to bust a rhyme?",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b4",
				"Library Book on Fiona Rudd.",
				GetSprite("iit_book_002"),
				"\tSwag the Dog\n\n\tAnyone who wants a piece of country legend Fiona Rudd need only ask. Once dubbed 'The Bag Lady of Country Music', the singer turned spokesperson for various charities and environmental actions is a walking vending machine of all things Fiona, even when the mission at hand is raising awareness about toxic waste in New City River.  Many call the non-stop selling a conflict of interest, especially when she has charged the city a fee of $3000 to stock up on autographed posters, CDs and other personal memorabilia that she provides to her adoring fans for free. The friendly and cheery Fiona has managed to retain her fan base, and even bring in younger listeners, without having had a hit for years. However a new album is reportedly in the worksóa fact that some connect with Rudd's sudden willingness to gain media attention as a spokesperson for causes she clearly doesn't fully grasp. Recent press conferences, which are meant to serve as info sessions for the river clean-up program, have turned into disorderly events resembling rockstar meet-and-greets. Rudd appears all to pleased with the reaction, stoking the chaos by throwing t-shirts, posters and key chains into the audience. She's only here to promote her upcoming album, one city official exclaimed after the latest info session debacle. The only river she cares about is a river of money flowing into her bank account.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b5",
				"Library Book on Margret Wong",
				GetSprite("iit_book_002"),
				"\tWong Gives New City Something to Gnaw On\n\n\tStatewide toothpick distributor First Pick, is one happy client this week after retaining the services of Phoenix Services Group (PSG) under the command of proprietor Margaret Wong. Teems of trucks made the rounds to local restaurants Wednesday delivering toothpicks in bulk. PSG, the master logistics practitioners with an infrastructure said to be suited for any and every crisis relief scenario, showed First Pick as well as the New City restaurant community exactly why their reputation remains top drawer. Slice of Beef, manager James Burger elaborates, I've never seen anyone take toothpicking so seriously. The trucks were flanked by patrol cars and three helicopters. When they arrived, the PSG employees were accompanied by police officers in riot gear. I was like, ëokay,' but even if their operation is kind of overkill, you have to hand it Wong, that lady runs a sophisticated outfit. PSG employees arrived dressed in sparkling new uniforms and company hats, which ran the company a sum of $2,350 and brandished two-way radios, constantly speaking in code. Burger says, They even set up all the dispensers and handed out toothpicks to patrons. It was a little much, but who can complain? After the daylong distribution, the excess toothpicks were transferred to local PSG warehouses, where they remain under twenty-four-hour armed guard. Hired security guard William Garrison commented, I've been out here for two days guarding a thirty-six hundred square foot warehouse with three boxes of toothpicks inside. But hey, it pays the bills, you know what I'm saying? \n\n\n\n\n\n\tPhoenix Three File Suit\n\n\tThree former Phoenix Services Group (PSG) employees filed a joint civil suit recently claiming their former boss, Margaret Wong, has caused them irreparable emotional suffering. Wong is well known for running a tight ship and under her command PSG has developed a strong reputation for its ability to arrange adequate transportation of relief supplies and restoration equipment as well as logistics teams well-suited for any crisis relief scenario. Still, the lawsuits are piling up just as fast as the company's invoices. Counsel for the plaintiffs, Rob Ensue, delivered the following statement to the press: Margaret Wong is so passive aggressive and controlling that many of her employees regularly suffer from nervous breakdowns. When asked if PSG's $1,000 in-company team of psychologists wasn't instated for this very reason, Ensue got down to brass tacks. Look. None of these headshrinkers and psychobabblers know what they're dealing with. I've got a client who can't sleep at night, and every time she shifts in bed, whispers, ëPerhaps I should consider reprioritizing my angular habits for the sake of efficacious slumber.' Ensue added that Wong's might be an as of yet undiscovered form of passive aggressiveness. After we filed, she sent each of the clients a giant bouquet of roses, along with a note that read, I look forward to seeing you in court. That's just sick.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b6",
				"Library Book on Cedric Maxwell",
				GetSprite("iit_book_002"),
				"\tThe Buck Stops Here as Maxwell Outshines NCPD Once Again\n\n\tTwo as of yet unidentified hoodlums were apprehended this morning for the attempted robbery of the discount chain store, A Buck and Change. The two males stormed in wearing Halloween masks of deceased rap stars Jokey Joke and DJ Kopeck, leading authorities to believe they are likely members of the newfound inner-city crime, We Be Loot'n. The Buck and Change night shift cashier activated the store's alarm moments after the two men fled. First to respond was Force One CEO and flamboyant freelance crime fighter Cedric Maxwell, who is said to have spent $2,150 on police scanners, surveillance equipment and klieg lights to alert Force One members of emerging situations. After radioing fellow martial arts experts Jude O'Chop and Brick Striker, whose league support has enabled his firm to handle most crisis relief scenarios, the three closed in on the perimeter and cornered the thugs in the alley behind Magnet Universe. A very, very brief altercation ensued before patrol cars arrived and arrested the two men, who had made off with six dollars in quarters as well as several bags of paper plates and coasters. Maxwell, known more as a wanna-be action hero than a buttoned-up logistics provider, told the New City Gazette, I exist in the alleys, in the cracks of the pavement, perched atop traffic lights and under the floorboards. Cedric Maxwell is everywhere. And now, he is going to get a taco. At which point the three crime fighters strutted out of the alley as slowly as possible.\n\n\n\n\n\n\tKarate Tournament Goes Goofy Third Week in a Row.\n\n\tThe Knights of Anointed Rivalry and Totally Exceptional Coalition of Heroes and Offensive Practitioners (K.A.R.A.T.E C.H.O.P.) held their weekly Martial Arts tournament at the New City Civic Center this Sunday to massive spectacle. C.H.O.P. president and Force One logistics CEO Cedric Maxwell opened the competition by handing out free throwing stars and nunchucks, part of a cache of martial arts equipment worth $1,000. While Maxwell is known for resorting to extreme measures to protect the interests of his logistics firm's offerings and recently put together a network of karate schools to aid in the transportation of relief supplies, he is better known for his prowess and abilities in the world of martial arts. After distributing the weaponry, Maxwell made his first attempt ever at karate chopping a full-sized SUV in two, but was forced to cease and desist when his friend and co-worker, Brick Striker, president of the New City Nubian Ninja Squad, got wind of a string of burglaries on the southern side of Cassady Canyon. Maxwell, Striker and the five sensei's that constitute the board of K.A.R.A.T.E. C.H.O.P. abruptly piled into the SUV, plowed through the stadium and fishtailed onto McDougle Street and into the night. The tournament continued with youngsters Earling, Lyon and Noppenberg retaining their titles. Witnesses say it was quite a scene, but despite his extremities, Maxwell has the experience and sufficient backing of the martial arts leagues to handle most crisis relief situations.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b7",
				"Library Book on Sam Shortback",
				GetSprite("iit_book_002"),
				"\tCommunity Reaches Out to Shorthanded Shortback\n\n\tWithout the help of the community, I'd be up the creek, says retired sheriff cum Prairie Fire Logistics owner Sam Shortback, who is no stranger to the citizens of New City. The career lawman seems to have garnered the support of locals, most of whom have pledged their devotion to him in his new venture. Old Sam called me up the other day, says landscape artist Bill Brushy Plante, he needed a hand moving some crates of demolition charges to the self-storage spaces he normally uses for supplies and equipment. I think he dropped something like $2,750 on them. We threw some of them in the back of my pick-up. It's the least I could do. Sam's good folks. But self-storage spaces are limited, and Shortback, who is only beginning to accumulate the experience necessary to undertake large operations, was left with his hat literally in his hands. Plante continues, I told Sam don't' sweat it, and we went and stored the rest of the boxes in my shed. That's what community is all about, you ask me. Indeed, Shortback's Prairie Fire Logistics, which caters to offshore drilling operations, remote construction sites, and paramilitary campaigns, seems to be bringing New City together at a time when cohesion is exactly what she needs.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b8",
				"Library Book on Dave Shortback",
				GetSprite("iit_book_002"),
				"\tShortback Stays on Trail\n\n\tWhat started as a laughable venture into the logistics world is still laughable, but only to some. Dave Shortback: rodeo enthusiast, cowboy and now, chairman of Western Logistics Services, has brought things down a notch by employing pony-express style messengers to relay instructions between various points in the supply chain around Elliot County at a cost of $2,000. I resent the term ëthrowback,' says Shortback, I look at this not only as a tribute to one of the greatest eras in this country's history, but as a way of becoming less dependent on fancy gadgets. Plus, guess how much oil my horses require? Indeed, but even with a vast network of personnel he can call on for support on large-scale projects, why would clients pay for to horseback-ride a memo to corporate when a fancy gadget like a mobile phone can do the trick in a matter of seconds. Dave's a character, says rancher Horace Manewer, who uses Shortback's services regularly, He'll get your order where it needs to go, and he'll do it with a smile. A smile goes a long way. Other clients believe Shortback is using the logistics industry as a thin veil to live out his obsession with horses and ranching in general. To the likes of them, Manewer adds, Used to be a man was praised for living out his dream and helping folks at the same time. With all this fuss, man must be doing something right.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b9",
				"Library Book on Ashley Dapper",
				GetSprite("iit_book_002"),
				"\tFine Dining In a Toxic Dumpsite?\n\n\tWould you eat a sumptuous four-course gourmet meal in the middle of a toxic waste site? If you're Ashley Dapper of the hazardous waste clean up company Clean Green Machinery you would. That's because every time CGM takes a job, they spend $2350 on a riverside trailer to house hygienists, custodial staff and a specialized physician to make sure Dapper has a sterile environment to oversee the clean up. Think of it as a pristine eye in a Hurricane of filth, explains Dapper. But industry insiders think Dapper is giving a black eye to the  entire waste disposal industry. She looks ridiculous out there with her lily white gloves, complains one clean up competitor, She charges all this money just so she can look good. I'd rather look like a hobo and get the job done right. Dapper claims her high prices aren't due to her immaculate appearance, but to her environmentally sound methods. Anyone can get a hazmat suit and a shovel and say they're a hazardous waste professional, says Dapper, We use only environmentally safe methods. By the time we're done, anyone can have a picnic at our clean up site without a hermetically sealed trailer like mine. Scalloped potatoes, anyone?\n\n\n\n\n\n\n\tLocal Man Turns Neuroses Into Successful Business\n\n\tWith her $1000 tailor made suits from Pauline's and her obsessive compulsive hand washing, Ashley Dapper would be the last person you'd expect to see at a disgusting toxic spill site. That's exactly what makes her so good, claims environmental expert Ida Leika-Redwood, Her neurotic obsession with cleanliness ensures she won't leave a river site until you can wash a baby in it.  Critics have continually argued that Dapper ñ who is part owner of the company Clean Green Machinery - was too frightened of germs to deal with the repulsive demands of the hazardous waste clean up profession. But Dapper claims she has never been afraid of dirt. I'm angry at it, Dapper smiles, I see dirt everywhere ñ smudges on people's wretched hands, muck on their rotting teeth, sludge on filthy restaurant tables and grimy, oozy, grungy, gunky horrible doorknobs ñ it makes me want to annihilate dirt once and for all. And destroy it, she does. Dapper's company has incredibly effective methods to clean sites and perform spill recovery on rivers and lakes. And her methods are 100% environmentally friendly, explains Leika-Redwood, If Ashley Dapper is crazy ñ I don't want to be sane! ",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b10",
				"Library Book on Wanda Rown",
				GetSprite("iit_book_002"),
				"\tPotty Princess ñ Pretty or Pathetic?\n\t\n\tWhen Wanda Rown started Potty Princess, her waste disposal and containment business, over two decades ago, no one thought it was a glamorous job. People thought the name was a joke, remembers Rown, But I've always believed cleaning up toxins is lovely because you're making something beautiful again. She's turned her passion for pretty into a business that's highly regarded for its environmentally friendly waste recovery expertise. Toxic gorges become gorgeous and rivers of slime become rivers divine. The only thing that may have lost its luster over time is Rown herself. Wanda used to be fun, remembers a rival waste manager Susan Offal, But over the years her ëprincess' routine has become pretty desperate. One specific Offal points to is the $2150 expense Rown charges for muscle bound day laborers to operate and maintain the recovery and disposal equipment. Hiring strong men is fine, says Offal, But Wanda has these himbos around to fan her with palm leaves and cater to her every wish, it's just a bit sick, don't you think? But while detractors say Rown is past her prime, the Potty Princess just shrugs off the criticism. Why not make everything splendid, she says, If our job is to wade around in filth, let's be filthy in style!  As long as Rown's clean up skills continue to make our local rivers and lakes sparkle like diamonds, she'll be royalty to us. \n\n\n\n\n\n\tWhen a train car derailment sent thousands of gallons of ketchup into Crater-Tater Lake near Rosenfield, beach-goers came from miles around to check it out. But they weren't staring at the thick tomato tragedy, they went to see the Potty Princess ñ a.k.a businesswoman Wanda Rown ñ strut her stuff as she orchestrated the clean-up. She's an environmental rockstar, exclaimed one star-struck fan, It's almost like you hope for more toxic spills just to see her work. It's true that Rown is well known for her expertise at recovering waste from spills in an environmentally friendly way ñ but it's her personality that draws in the crowds. And she knows it. Rown charges clients $1000 for a small tent, suntan lotion, chaise lounge chairs and palm fronds that are used to fan her while she supervises the clean-up. She also sports colorful costumes ñ in this case, a ruby encrusted jumpsuit that made her look like a ketchup splashed jewel. The world's most dangerous toxin, explains Rown, Is being dull. That attitude has created problems for Rown in the past. Many have suggested that she over-dramatizes situations in order to drive up her prices. But cost analyses over the past twelve years have shown that Potty Princess is not significantly more expensive than any other waste disposal company. And Rown doesn't just invest in crazy costumes, her equipment is first rate and well maintained. Her professionalism and panache has made her one of the most visible businesses around New City. Some even think she may run for mayor someday, something Rown denies, Why would I take the demotion?",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b11",
				"Library Book on Freida West",
				GetSprite("iit_book_002"),
				"\tOut of Control Clean Up Dries Out River!\n\n\tStanding in the dry, stony bed of the Katscratch River, it's amazing to think that just days ago it was a wide, powerful river teeming with people boating, swimming and fishing. But that was before a small toxic spill brought West Disposal Services to the scene. Last Friday, a casino boat accidentally dumped some kerosene into the river ñ maybe fifty gallons or so, explains Park Ranger Waldo Bears, Since we have a city contract with West Disposal, we called them in to contain it and haul it away ñ but we never expected what happened next. West arrived with an experimental ñ and highly controversial ñ piece of equipment. It's the HK-9000 oil separator, boats West in his promotional late-night television commercials, They're more powerful than a rocket engine and intercontinental ballistic missile combined!  West charges $2750 for the quick clean-up device, but this was the first time it was ever field tested. Within moments of firing it up, the kerosene was gone ñ and so was most of the river water. He'd rather do things cheap than safe, complains Bears. And then he couldn't turn his machine off!  The river was completely dry within a half an hour. Well, you can't say the HK-9000 doesn't work! remarked West, And who else could dispose of so much liquid? My waste capacity is HUUUUUUUUUGE! While West's company is known for his large waste storage capacity, people are not sure what he is talking about in this case. It's not like he hauled the liquid away ñ he evaporated it, explains Bears, It's a complete disaster! But West refuses to admit any wrong doing. I cleaned up the spill, he shrugs, Are you gonna sue a guy ëcause he does a job too well?",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b12",
				"Library Book on Adam Baum",
				GetSprite("iit_book_002"),
				"\tBAUM AND COMPANY SUED BY INTERNS, VOLUNTEERS, CONVICTS\n\n\tA group of former interns and volunteers for Dis-Po Inc. has filed suit against the company and its CEO Adam Baum. Stemming from an incident where Baum elected to get involved with a toxic spill the suit charges that he entered into the situation without regard for his employees and interns. Many of the volunteer persons were, according to the suit, Inadequately trained for an emergency situation of this nature. Baum spent $2,000 to transport his personnel, including interns and trainees.  The attorney for the plaintiff's is Mark Marx. He states further that Baum put at risk dozens of people. The incident occurred last year when a truck loaded with toxic waste collided with a circus train. There were wild animals, snakes, lions, and elephants everywhere said Marx. Not everyone has the tolerance or immunity claimed by Baum, he continued. In defense of Baum, the local sheriff said, It was a crazy moment. Luckily the circus people tended to the animals. Baum, though, secured several damaged drums filled with hazardous materials It was twenty minutes before our own Hazardous Waste Units were on the scene, Baum could not be reached for comment but his self-described right hand man Reilly Volved said that, Adam is not going to respond with a statement for the press. He is a conservationist and did the right thing that day. There was trouble and he contributed to solving the emergency. He would never expect volunteers or employees to put their lives at risk. Attorney Marx though has a different take. Baum was reckless and had little regard for persons under his direction. He will have to compensate these people for risking their lives. Marx is a partner in the famous firm of Dewey, Cheatum, and Howe.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b13",
				"Library Book on Avanish Singh",
				GetSprite("iit_book_002"),
				"\tEASTERN LEGAL IN CIVIL RIGHTS VIOLATION? \n\n\tIs it compassion or paternal nepotism? Avanish Singh, rising star of environmental law in New City and the county has recently hired and trained a squadron of sherpas from his native land to function as messengers and gophers for his firm Eastern Legal Services. The young descendents of a generation of immigrants aided by his father have suddenly become an old school answer to the transfer of information. In this era of the instant-message and digital transfer this is a curious move. Why spend money to use messengers instead of secure digital connections? posed Jack Buttons, local computer authority. It is a curious expense for a modern company. Singh has budgeted $2,350 to employ these young people to serve as messengers and delivery persons. This is perhaps a violation of employment laws, growled civil rights attorney Ben Undher. He continued, Affirmative Action statutes do not apply to whole ethnic groups. Singh is likely in violation of somebody's civil rights. In his own defense Singh said, Though I am relatively new to this venue of legal exposition, my critics should recall that my firm is very successful. My command of statute law is much greater than my command of the required rhetoric of many provincial minds. The invincible nature of my arguments is not as easy as to impugn my eloquence skills. No one doubts the depth of Singh's memory and skills as a researcher. He is a problem when it comes to filing. Understanding what he says, though, can be a lot of work, said a bailiff from a New City court. \n\n\n\n\n\n\tIS SINGH'S GURU ALSO A CRIMINAL?\n\n\tIt was reported that Avanish Singh had employed a personal guru to aid him with decision-making and health enhancement techniques for relaxation and stress reduction. But is this guru, Pradesh Ohnvools qualified in another area? Ohnvools was hired for $1,000 to perform personal services and guide techniques for better health for the attorney. However, investigative members of the County Office on Suspicious Characters has found that Ohnvools might have had a different identity in a former incarnation. We have discovered that an illegal immigrant who went by the name Pradish Sloovnho had been detected up-state. He was connected to shady activities in a money laundering scheme, revealed Detective Finditt. The funneling of monies to criminal organizations is a Federal crime, he reminded. If the young lawyer has inadvertently employed a criminal, he will not be held legally responsible. However, this possibility brings again to the public forum more evidence that the successful young attorney is in need of much more experience. He may be a winner, but is it really skill? I think luck may play a bigger role in Singh's legal victories than many are willing to admit, confided a competing attorney of Singh's high-profile reputation.  The fact that Eastern Legal has seen a rapid rise in reputation has been attributed to the skill of Avanish Singh's attention to detail and his fantastic memory, recalling even the seemingly most insignificant of facts.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b14",
				"Library Book on Anthony Dewey",
				GetSprite("iit_book_002"),
				"\tLAWYERS SUE CITY FOR ENVIRONMENTAL CARELESSNESS\n\n\tThe firm of Dewey, Sewham, and Howe recently filed suit against New City. The grounds of the suit are that the doors on the Senior Center are unnecessarily over-large. This is in conflict with green guidelines adopted by the city council earlier this year. When the doors open automatically, valuable cooling or heating is lost, as these patrons move very slowly. Citing this as architectural irresponsibility the firm has sued on behalf of the school district. The District Attorney's Office has stated that they plan to file against the firm with Bar Commission. Dewey and his cronies are using media advertising hoping to gain support for their suit by appealing to greed and short-sightedness, asserted an assistant District Attorney. The firm has budgeted some $2,150 for a media blitz on local radio and television stations. The ads will also include a lure for persons affected by last year's toxic waste spill, as well. We at D,S,&H have become experts at exploiting government incompetence. We see it as our constitutional duty to be a watch-dog for the environment. says Boyd Dewey, the firm's senior attorney.  There are those in the community who see D,S,&H as thieves who leech away important tax dollars for their personal gain. Three previous lawsuits have netted the lawyers thousands of dollars that was neither given to their clients, nor contributed to environmental works. Anytime this firm is involved, you can be certain that they will guard their own profit first. Does the concept of robbery mean anything to you? This source prefers to remain unidentified. \n\n\n\n\n\n\n\tHEROES AND VILLIANS: DEWEY, SEWHAM, AND HOWE\n\n\tOne moment the partners seem to have compassion for the little guy and the underdog. The next they are predators, taking advantage of the naÔve, the uneducated, the victims. At a recent mixer to encourage New City businesses to make all planned upgrades environmentally friendly, Gordon Dewey was a featured speaker. His theme was Making Modest Progress Through Modest Choices. The concept is based on the best-selling book by Indian environmentalist Dunno Wattamtawkinbouthi. To be green is to be thoughtful, to demand less, to expect less, Dewey offered by-way-of clarification. The talk was well received. However, knowing that Dewey's firm financed his very expensive Italian shoes and embroidered ties, it was difficult for some to take the attorney seriously. I know that his firm authorized expenditures of $1,000 and more for tasteful enhancements. Boyd feels that he must be as fashionable as any modern leader of the community, revealed Jim Dandy, local haberdasher. Some suggest that these enhancements are at the expense of clients who are indebted to Dewey, Sewham, and Howe. There are reportedly hundreds of people making payments to the firm, some for as many as sixty-months.  said Judge Meenow, They are reaping the rewards of being both successful and canny. Peers contend that most of that firm's wins are based on technicalities, tiny mistakes made by the opposition or in the appeals process. An unnamed attorney said, These guys are hypocrites, little more than ambulance chasers with a great line.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b15",
				"Library Book on Abbie S. Korpis",
				GetSprite("iit_book_002"),
				"\tSTAFFING SCANDAL REVEALED:\n\tATTORNEY ADMITS HAVING A MANICURIST ON PAYROLL\n\t\n\tIn an unprecedented admission, Abbie S.Korpis, renowned attorney and environmentalist, has confirmed that she has a part-time manicurist on her office payroll. I need to be in top form at all times laughed the famous lawyer. I could never feel that I'm at my best with a broken or chipped nail. The problem is that the manicurist is paid $4,250 for her services. This revelation has shaken the foundation of the local bar association. We of the bar are astounded that one attorney could be so vain and irresponsible, said Boyd Dewey, senior partner of the famous law firm of Dewey, Cheatum, and Howe. Public perception and stereotypes are reinforced by bad judgement like this, he continued.  It is no secret that Korpis spends enormously on her wardrobe. A recent financial statement revealing an expenditure of $2,000 for fashion accessories was made public recently. I don't see why it's so scandalous for a woman to take pride in her appearance. Men wear expensive tailored suits but they all look alike. My wardrobe changes with each event, each public appearance. It's a professional obligation for me to create an impression. A woman with graying hair and red suspenders does not have the same effect as a man with those characteristics. Korpis, no doubt, has a point. Her intense but competent presentations have figured heavily in her many legal victories.",
				0,
				"LIBRARY_BOOK"
			),
			new InventoryHandler.Inventory_Item
			(
				"w2b16",
				"Library Book on Liddy Gates",
				GetSprite("iit_book_002"),
				"\tKORPIS CHARGES GATES WITH ODD BEHAVIOR \n\n\tAbbie Korpis, representing New City in a lawsuit against Goliath Corporation charged today that Goliath's legal council was unstable and under the influence of a cult leader. Goliath's lawyer, Liddy Gates, said the personal attack was simply a tactic to sway the jury before it was seated. Abbie is just worried that she's about to lose a significant case. Asked about the veracity of the facts, Gates responded, I pay a significant amount of money for therapy.  I, like Avanish Singh and other individuals, have a spiritual counselor.  Of course, my advisor Korla Pandit is not under suspicion of any criminal activity. As far as my therapy goes, it demonstrates my sincere commitment to the principles of law and the dedicated focus I have for my clients. Like an athlete, I train to be in top form at all times. It's my mind and spirit that are in prime shape. Known for her dramatic presentation and histrionics, Gates is nonetheless a major force in the law. She has never been known to lose a case. Her track record is amazing, cites LaWanda Sewham, of Dewey, Sewham, and Howe. I wish we could talk her into joining our firm. Meanwhile, Korpis remains unimpressed. Liddy is unstable and my advice to her clients is to find another lawyer. There is cheaper and better representation in New City she said, all the while smiling. Of course, warned Gates, if Ms.Korpis continues with this slanderous talk, we will have a little sit-down, just the two of us.",
				0,
				"LIBRARY_BOOK"
			),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b1",
			//	"Library Book on Phil Burrels",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b2",
			//	"Library Book on Peter Boltright",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b3",
			//	"Library Book on Anthony Wexler",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b4",
			//	"Library Book on Oroko Nakashima",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b5",
			//	"Library Book on Ramblin' Rose",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b6",
			//	"Library Book on Nathaniel Wailer",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b7",
			//	"Library Book on Skeeter McBragg",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b8",
			//	"Library Book on Jannis Econamu",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b9",
			//	"Library Book on Bjorn Egan",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b10",
			//	"Library Book on Nina Ojeda",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b11",
			//	"Library Book on Marvin Moneymaker",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b12",
			//	"Library Book on Gabe Vine",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b13",
			//	"Library Book on Dr. Zeke Mullen",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b14",
			//	"Library Book on Gil Fermin",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b15",
			//	"Library Book on Tom Barrier",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//),
			//new InventoryHandler.Inventory_Item
			//(
			//	"w3b16",
			//	"Library Book on John Ferris",
			//	GetSprite("iit_book_002"),
			//	"[Description Here]",
			//	0,
			//	"LIBRARY_BOOK"
			//)
		});
	}

}
