using UnityEngine;
using System.Collections;
// note-Eddie Epoch!

public class npc_epoch : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Epoch/t3p3_l2r_epoch.lua";
		}

		else 
		{
			return "Epoch/rnd_epoch.lua";
		}
	}


}
