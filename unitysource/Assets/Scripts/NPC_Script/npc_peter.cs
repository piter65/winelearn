﻿using UnityEngine;
using System.Collections;
// note-Peter Boltright


public class npc_peter : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Peter/t1p3_va_peter.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Peter/t3p1_vb_peter.lua";
		}

		else 
		{
			return "Peter/rnd_peter.lua";
		}
	}


}
