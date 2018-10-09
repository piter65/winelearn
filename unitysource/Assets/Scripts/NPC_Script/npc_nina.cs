using UnityEngine;
using System.Collections;
// note- nina used to be Leslie TannenBaum

public class npc_nina : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Nina_Ojeda/t1p1_va_nina.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Nina_Ojeda/t3p3_vb_nina.lua";
		}

		else 
		{
			return "Nina_Ojeda/rnd_nina.lua";
		}
	}


}
