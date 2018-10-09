using UnityEngine;
using System.Collections;

public class npc_Jannis_Economou : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Pablo_Cruz/w1p4_vb_jannis_economou.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 3
				 && GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Pablo_Cruz/t3p2_vd_jannis.lua";
		}

		return "Pablo_Cruz/rnd_pablo.lua";
	}
}
