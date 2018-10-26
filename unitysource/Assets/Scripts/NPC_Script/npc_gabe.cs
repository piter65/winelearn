using UnityEngine;
using System.Collections;
// note- gabe used to be djsynapse


public class npc_gabe : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Gabe_Vine/t1p1_vb_gabe.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Gabe_Vine/t3p3_vd_gabe.lua";
		}

		else 
		{
			return "Gabe_Vine/rnd_gabe.lua";
		}
	}


}
