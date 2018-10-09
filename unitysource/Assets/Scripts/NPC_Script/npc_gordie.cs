using UnityEngine;
using System.Collections;
// note-Gordie Glutton


public class npc_gordie : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Gordie/t3p4_l1w1_gordie.lua";
		}

		else 
		{
			return "Gordie/rnd_gordie.lua";
		}
	}


}
