﻿using UnityEngine;
using System.Collections;
// note-Wes Berlin



public class npc_wes : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Wes/t2p1_va_wes.lua";
		}

		else 
		{
			return "Wes/rnd_wes.lua";
		}
	}


}
