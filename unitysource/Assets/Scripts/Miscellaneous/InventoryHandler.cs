using UnityEngine;
using System.Collections;
using System.Collections.Generic;

[System.Serializable]
public class InventoryHandler
{

	[System.Serializable]
	public struct Inventory_Item
	{

		public string item_key;
		public string item_name;
		public Sprite item_iconSprite;
		//[TextAreaAttribute]
		[HideInInspector]
		public string item_description;
		public int    item_quantity;
		/// <summary>
		/// example "poision,fire,rare"
		/// </summary>
		public string item_attributes;

		// constructor
		public Inventory_Item(string key, string name, Sprite icon, string description, int num, string attributes)
		{
			item_key = key;
			item_name = name;
			item_iconSprite = icon;
			item_description = description;
			item_quantity = num;
			item_attributes = attributes;
		}
	}

	[System.Serializable]
	public class Item_List
	{
		public string list_name = "general items";

		public List<Inventory_Item> list_items = new List<Inventory_Item>();

		// constructor
		public Item_List(string name, Inventory_Item[] items)
		{
			list_name = name;
			list_items = new List<Inventory_Item>(items);
		}
	}


	public List<Item_List> lists = new List<Item_List>();

	public Item_List CreatNewList(string list_name, Inventory_Item[] items)
	{
		// Remove any list with the same name.
		Item_List list_existing = GetList(list_name);
		if (list_existing != null)
			lists.Remove(list_existing);

		// Create a new list with the given name.
		Item_List newList = new Item_List(list_name, items);
		lists.Add(newList);
		return newList;
	}

	/// <summary>
	/// Finds a list by name
	/// </summary>
	/// <returns>The list.</returns>
	/// <param name="list_name">List name.</param>
	public Item_List GetList(string list_name)
	{

		for(int i=0; i<lists.Count; i++)
			if(lists[i].list_name.Equals(list_name))
				return lists[i];

		return null;
	}

}
