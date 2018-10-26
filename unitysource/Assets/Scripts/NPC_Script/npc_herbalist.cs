using UnityEngine;
using System.Collections;

// note-Winehart's Herbalist - 

public class npc_herbalist : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Herbalist/t3p1_l2w1_herbalist.lua";
		}

		else 
		{
			return "Herbalist/rnd_herbalist.lua";
		}
	}

}
