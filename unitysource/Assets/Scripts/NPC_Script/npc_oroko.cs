using UnityEngine;
using System.Collections;
// note-Oroko used to be Suzuku Kiroshi


public class npc_oroko : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Oroko/t1p3_vb_oroko.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "Oroko/t3p1_vd_oroko.lua";
		}

		else 
		{
			return "Oroko/rnd_oroko.lua";
		}
	}


}
