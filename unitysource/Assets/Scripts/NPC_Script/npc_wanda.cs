﻿using UnityEngine;
using System.Collections;
// note-Wanda Rown

public class npc_wanda : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Wanda/t2p3_vb_wanda.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 0 )
		{
			return "Wanda/task0_wanda.lua";
		}

		else 
		{
			return "Wanda/rnd_wanda.lua";
		}
	}


}
