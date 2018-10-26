using UnityEngine;
using System.Collections;

public class npc_Nathaniel_Wailer : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "Damian_Maytal/t1p4_va_nathaniel_wailer.lua";
		}
		else if (   GLOBAL_old.Player.progress["week"] == 3
				 && GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Damian_Maytal/t3p2_vb_nathaniel.lua";
		}

		return "Damian_Maytal/rnd_damian.lua";
	}
}
