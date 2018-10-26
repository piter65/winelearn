using UnityEngine;
using System.Collections;
// note-groovy Gary!


public class npc_groovy : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "groovy/t3p4_groovy.lua";
		}


		else 
		{
			return "groovy/rnd_groovy.lua";
		}
	}


}
