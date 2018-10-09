using UnityEngine;
using System.Collections;
// note-Wayne Scotting used to be Carpenter

public class npc_wayne : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Wayne/t3p1_l1w2_wayne.lua";
		}

		else 
		{
			return "Wayne/rnd_wayne.lua";
		}
	}


}
