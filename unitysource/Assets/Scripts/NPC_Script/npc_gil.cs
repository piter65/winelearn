using UnityEngine;
using System.Collections;
// note-Gil Fermin


public class npc_gil : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Gil/t1p2_v1_gil.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "Gil/t3p4_vb_gil.lua";
		}

		else 
		{
			return "Gil/rnd_gil.lua";
		}
	}


}
