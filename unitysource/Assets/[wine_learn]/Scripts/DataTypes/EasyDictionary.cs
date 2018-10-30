using UnityEngine;
using System;
using System.Collections.Generic;

// Allows dictionary values to be accessed or mutated entirely by indexer, allowing for cleaner code.
public class EasyDictionary<K, V> : Dictionary<K, V>
{
	// Overrides the base dictionary's indexer to allow easier access to values.
	public new V this[K k]
	{
		get
		{
			if (base.ContainsKey(k))
				return base[k];
			else
				return default(V);
		}
		set
		{
			if (base.ContainsKey(k))
				base[k] = value;
			else
				base.Add(k, value);
		}
	}
};
