using UnityEngine;
using System.Collections;
// note-zeke used to be "Dr. Ed Mullen"


public class npc_charlie : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL_old.Player.progress["week"] == 1)
		{
			return "Charlie/t1_edt_charlie.lua";
		}
// peter grabbed from original sandy script...
		else if (GLOBAL_old.Player.progress["week"] == 2)
		{
			return "Charlie/t2_equ_npc5_charlie.lua";
		}
		else if (   GLOBAL_old.Player.progress["week"] == 3
				 && GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Charlie/t3p3_l1r_charlie.lua";
		}
		else 
		{
			return "Charlie/rnd_charlie.lua";
		}
	}


}
