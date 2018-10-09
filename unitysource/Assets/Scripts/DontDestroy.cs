using UnityEngine;
using System.Collections;

public class DontDestroy : MonoBehaviour
{
	void Awake()
	{
		DontDestroyOnLoad(this.gameObject);
	}

	public static void DestroyAll()
	{
		// Loop thru and kill the unkillable.
		DontDestroy[] immortals = FindObjectsOfType(typeof(DontDestroy)) as DontDestroy[];
		for (int index = immortals.Length - 1; index > -1; --index)
		{
			Destroy(immortals[index].gameObject);
		}
	}
}
