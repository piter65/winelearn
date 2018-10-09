using UnityEngine;
using System.Collections;
// note-Sean Kwerty   (Warren?)




public class npc_kwerty : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Kwerty/t3p2_l2w1_kwerty.lua";
		}


		else 
		{
			return "Kwerty/rnd_kwerty.lua";
		}
	}


}
