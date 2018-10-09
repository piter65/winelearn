using UnityEngine;
using System.Collections;
// note-zeke used to be "Dr. Ed Mullen"


public class npc_avanish : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Avanish/t2p4_va_avanish.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3)
		{
			return "Avanish/t3_mq_npc4_avanish.lua";
		}

		else 
		{
			return "Avanish/rnd_avanish.lua";
		}
	}


}
