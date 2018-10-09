using UnityEngine;
using System.Collections;
// note-mark harris is not the other mark!


public class npc_markharris : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "markharris/t3p3_l2w1_mark.lua";
		}


		else 
		{
			return "markharris/rnd_mharris.lua";
		}
	}


}
