﻿using UnityEngine;
using System.Collections;
// note-Allison Rigby


public class npc_allison : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Allison/t3p1_l2w2_allison.lua";
		}

		else 
		{
			return "Allison/rnd_allison.lua";
		}
	}


}
