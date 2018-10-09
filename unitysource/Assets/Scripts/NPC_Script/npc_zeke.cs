using UnityEngine;
using System.Collections;
// note-zeke used to be "Dr. Ed Mullen"


public class npc_zeke : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Zeke/t1p2_zeke.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Zeke/t3p4_va_zeke.lua";
		}

		else 
		{
			return "Zeke/rnd_zeke.lua";
		}
	}


}
