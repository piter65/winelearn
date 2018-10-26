using UnityEngine;
using System.Collections;
// note-Warren XXX  used to be Sean Kwerty

public class npc_warren : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Warren/t3p2_l2w1_warren.lua";
		}


		else 
		{
			return "Warren/rnd_warren.lua";
		}
	}


}
