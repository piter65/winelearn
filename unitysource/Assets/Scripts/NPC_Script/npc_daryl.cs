using UnityEngine;
using System.Collections;
// note-Daryl is ... in buona fortuna for task 3


public class npc_daryl : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Daryl/t3p2_l1w2_daryl.lua";
		}

		else 
		{
			return "Daryl/rnd_daryl.lua";
		}
	}


}
