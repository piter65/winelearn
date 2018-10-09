using UnityEngine;
using System.Collections;
// note-Joey Cramarossa
// mystery: What's the UTT for week1, player 2?


public class npc_joey : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Joey/t1p2_utt_joey.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 3
				 && GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Joey/t3p3_l1w1_joey.lua";
		}
		else 
		{
			return "Joey/rnd_joey.lua";
		}
	}


}
