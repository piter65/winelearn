using UnityEngine;
using System.Collections;
// note-Lakeisha at Can''t get enough media!

public class npc_lakeisha : npc_Base
{
	protected override string GetLuaFileName()
	{

		if (   GLOBAL_old.Player.progress["week"] == 2
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Lakeisha/t2p1_vb_lakeisha.lua";
		}

		else 
		{
			return "Lakeisha/rnd_lakeisha.lua";
		}
	}


}
