using UnityEngine;
using System.Collections;
// note- sven and bjorn are the same person

public class npc_sven : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Sven_Erikson/w1p1_vc_bjorn.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Sven_Erikson/t3p3_va_bjorn.lua";
		}

		else 
		{
			return "Sven_Erikson/rnd_sven.lua";
		}
	}


}
