using UnityEngine;
using System.Collections;
// note-Igor Stranglovich


public class npc_igor : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Igor/t2p4_vb_igor.lua";
		}


		else 
		{
			return "Igor/rnd_igor.lua";
		}
	}


}
