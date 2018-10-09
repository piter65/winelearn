using UnityEngine;
using System.Collections;
// note-Marcos Mendes used to be Michael Manducci

public class npc_marcos : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Marcos/t1p4_utt_marcos.lua";
		}
// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
				 && GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Marcos/t3p3_l2w2_marcos.lua";
		}
		else 
		{
			return "Marcos/rnd_marcos.lua";
		}
	}


}
