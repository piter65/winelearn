using UnityEngine;
using System.Collections;

public class npc_Heather_Wineheart : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Heather_Winehart/w1p4_ex_heather_winehart.lua";
		}

		return "Heather_Winehart/rnd_heather.lua";
	}
}
