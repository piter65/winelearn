using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class CONFIG
{
	public static string VERSION = "wine.learn.2018.oct.19";
#if UNITY_EDITOR
	public static string URL_GAME = "file:///" + Application.dataPath + "/../../game/";
#else
	public static string URL_GAME = Application.dataPath + "/../game/";
#endif

	public static string GamePath(string path_end)
	{
		return URL_GAME + path_end;
	}
}
