using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using System.Collections.Generic;

public class Room : MonoBehaviour
{
	[Range(0, 60)]
	public int room_index = -1;

	void Start()
	{
		Debug.Log("Room.Start() - room_index: " + room_index);

		// If we have a valid room num, increment the 'explored' field.
		if (room_index > -1)
		{
			//LuaFunctions.incexplored(room_index);
		}
	}
}