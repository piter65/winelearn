using UnityEngine;
using System.Collections;
// note-Bernie Cook

//  Not used, but exists
//	--dialogtext = require 'Bernie_Cook\\t3p1_l1r_bernice'

public class npc_bernie : npc_Base
{
	protected override string GetLuaFileName()
	{
//
//		if (   GLOBAL.Player.progress["week"] == 3
//			&& GLOBAL.Player.progress["playernum"] == 1)
//		{
//			return "Zeke/t1p2_zeke.lua";
//		}
//		else 
		{
			return "Bernie/rnd_bernie.lua";
		}
	}


}
