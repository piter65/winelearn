using UnityEngine;
using System.Collections;
// note-Wanda Rown

public class npc_wanda : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 2
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Wanda/t2p3_vb_wanda.lua";
		}

		else if (   GLOBAL_old.Player.progress["week"] == 0 )
		{
			return "Wanda/task0_wanda.lua";
		}

		else 
		{
			return "Wanda/rnd_wanda.lua";
		}
	}


}
