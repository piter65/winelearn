using UnityEngine;
using System.Collections;
// note-Gordon "Splashy" Hibbert - used to be Splashy

public class npc_gordon : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Gordon/t3p4_l1w2_gordon.lua";
		}

		else 
		{
			return "Gordon/rnd_gordon.lua";
		}
	}


}
