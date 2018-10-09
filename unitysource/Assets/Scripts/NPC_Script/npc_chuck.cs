using UnityEngine;
using System.Collections;
// note-Chuck used to be Gordie Glutton - he looks like a spy now.

public class npc_chuck : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Chuck/t3p4_l1w1_chuck.lua";
		}
		else 
		{
			return "Chuck/rnd_chuck.lua";
		}
	}


}
