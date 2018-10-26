using UnityEngine;
using System.Collections;
// note-nathan broome used to be dan lee

public class npc_nathan_broome : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Nathan/t1p3_utt_nathan.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "Nathan/t3p4_l2w2_nathan.lua";
		}

		else 
		{
			return "Nathan/rnd_nathan.lua";
		}
	}


}
