using UnityEngine;
using System.Collections;
// note-dverb in hip-hop house


public class npc_dverb : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "DVerb/t2p1_ex_dverb.lua";
		}

		else 
		{
			return "DVerb/rnd_dverb.lua";
		}
	}


}
