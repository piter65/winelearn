using UnityEngine;
using System.Collections;
// note- Dennis McCarthy - Expert for task1

public class npc_dennis : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Dennis_McCarthy/t1p2_dennis.lua";
		}
		else 
		{
			return "Dennis_McCarthy/rnd_dennis.lua";
		}
	}


}
