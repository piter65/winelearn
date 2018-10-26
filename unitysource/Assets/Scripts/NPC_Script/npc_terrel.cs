using UnityEngine;
using System.Collections;
// note-Terrel Douglas


public class npc_terrel : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Terrell/t3p2_l2w2_terrell.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 2)
		{
			return "Terrell/t2_equ_npc2_terrell.lua";
		}

		else 
		{
			return "Terrell/rnd_terrell.lua";
		}
	}


}
