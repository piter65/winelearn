using UnityEngine;
using System.Collections;
// note-Freida West, West Disposal


public class npc_freida : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 2
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Freida/t2p3_vc_freida.lua";
		}

		else 
		{
			return "Freida/rnd_freida.lua";
		}
	}


}
