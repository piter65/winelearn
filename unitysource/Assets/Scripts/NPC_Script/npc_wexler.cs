using UnityEngine;
using System.Collections;
// note-Anthony Wexler was Jim Rubenstein



public class npc_wexler : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Wexler/t1p3_vd_wexler.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Wexler/t3p1_vc_wexler.lua";
		}

		else 
		{
			return "Wexler/rnd_wexler.lua";
		}
	}


}
