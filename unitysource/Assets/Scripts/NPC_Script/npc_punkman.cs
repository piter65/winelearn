using UnityEngine;
using System.Collections;
// note-Jeff Punkman is also the Shrapnel Fan!


public class npc_punkman : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL_old.Player.progress["week"] == 2)
		{
			return "Punkman/ett_punkman.lua";
		}
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Punkman/t3p2_l2r_punkman.lua";
		}
		else 
		{
			return "Punkman/rnd_punkman.lua";
		}
	}
}
