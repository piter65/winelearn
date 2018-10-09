using UnityEngine;
using System.Collections;
// note-Dave_Shortback


public class npc_dave : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Dave/t2p2_vd_dave.lua";
		}


		else 
		{
			return "Dave/rnd_dave.lua";
		}
	}


}
