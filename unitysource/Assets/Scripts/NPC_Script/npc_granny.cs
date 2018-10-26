using UnityEngine;
using System.Collections;
// note-Granny Smith used to be "Old_Lady"

public class npc_granny : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "granny/t3p3_l1w2_granny.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 2 )
		{
			return "granny/t2_equ_npc4_granny.lua";
		}

		else 
		{
			return "granny/rnd_granny.lua";
		}
	}


}
