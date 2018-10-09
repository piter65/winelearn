using UnityEngine;
using System.Collections;
// note-Count = Counts

public class npc_count : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Count/t2p3_ex_count.lua";
		}

		else 
		{
			return "Count/rnd_count.lua";
		}
	}


}
