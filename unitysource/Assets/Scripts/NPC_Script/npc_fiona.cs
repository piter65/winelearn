using UnityEngine;
using System.Collections;
// note-Fiona Rudd to be Fiona Judd


public class npc_fiona : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Fiona/t2p1_vd_fiona.lua";
		}

		else if (GLOBAL.Player.progress["week"] == 0)
		{
			return "Fiona/w0_fiona.lua";
		}

		else 
		{
			return "Fiona/rnd_fiona.lua";
		}
	}


}
