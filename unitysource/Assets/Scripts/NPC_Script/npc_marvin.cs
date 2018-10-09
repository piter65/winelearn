using UnityEngine;
using System.Collections;
// note- marvin used to be Jack Cashdollar


public class npc_marvin : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Marvin/t1p1_vd_marvin.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Marvin/t3p3_vc_marvin.lua";
		}

		else 
		{
			return "Marvin/rnd_marvin.lua";
		}
	}


}
