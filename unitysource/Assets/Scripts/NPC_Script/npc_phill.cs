using UnityEngine;
using System.Collections;
// note- phil burrows used to be phil gastrow

public class npc_phill : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Phil/t1p3_vc_phil.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Phil/t3p1_va_phil.lua";
		}

		else 
		{
			return "Phil/rnd_phil.lua";
		}
	}


}
