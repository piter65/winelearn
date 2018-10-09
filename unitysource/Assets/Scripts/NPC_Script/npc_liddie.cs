using UnityEngine;
using System.Collections;
// note-Liddie Gates used to be Madeline Kutsch

public class npc_liddie : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Liddie/t2p4_vd_liddie.lua";
		}


		else 
		{
			return "Liddie/rnd_liddie.lua";
		}
	}


}
