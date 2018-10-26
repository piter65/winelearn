using UnityEngine;
using System.Collections;
// note-Vladimer Slob   is the hotdog guy

public class npc_vlad : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Vlad/t3_wp1_vlad.lua";
		}

		else 
		{
			return "Vlad/rnd_vlad.lua";
		}
	}


}
