using UnityEngine;
using System.Collections;

public class npc_Ramblin_Rose : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Rose/w1p4_vc_rose.lua";
//			return "Rose/rnd_rose.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 3
				 && GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Rose/t3p2_va_rose.lua";
		}

		return "Rose/rnd_rose.lua";
	}
}
