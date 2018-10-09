using UnityEngine;
using System.Collections;
// note-Tom Barrier




public class npc_tom : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Tom/t1p2_tom.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Tom/t3p4_tom.lua";
		}

		else 
		{
			return "Tom/rnd_tom.lua";
		}
	}


}
