using UnityEngine;
using System.Collections;
// note-zeke used to be "Dr. Ed Mullen"


public class npc_ketchum : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Ketchum/t2p2_ex_ketchum.lua";
		}

// All Ketchum task 3 script
		else if (   GLOBAL.Player.progress["week"] == 3)
		{
			return "Ketchum/t3_ketchum.lua";
		}

		else 
		{
			return "Ketchum/rnd_ketchum.lua";
		}
	}


}
