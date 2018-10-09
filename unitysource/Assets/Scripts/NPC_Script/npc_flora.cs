using UnityEngine;
using System.Collections;
// note-zeke used to be "Dr. Ed Mullen"


public class npc_flora : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1)
		{
			return "flora/nlc_flora1.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "flora/nlc_flora2.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 3)
		{
			return "flora/nlc_flora3.lua";
		}
		else 
		{
			return "flora/rnd_vgdaught.lua";
		}
	}


}
