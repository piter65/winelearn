using UnityEngine;
using System.Collections;

public class npc_sandy : npc_Base
{
	protected override string GetLuaFileName()
	{

		if (   GLOBAL_old.Player.progress["week"] == 0 )
		{
			return "sandy/t0_sandy.lua";
		}



		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "sandy/w1p1_ex_sandy.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "sandy/t3_wp4_sandy.lua";
		}

		else 
		{
			return "sandy/rnd_sandy.lua";
		}
	}


}
