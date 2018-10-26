using UnityEngine;
using System.Collections;
// note-Mark Carpenter was Mike Carpenter


public class npc_mark : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Mark/t1p3_ex_mark.lua";
		}

		else 
		{
			return "Mark/rnd_mark.lua";
		}
	}


}
