using UnityEngine;
using System.Collections;

// Peter brutalized original...

public class npc_charlie_2016 : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 1)
		{
			return "Charlie/t1_edt_charlie.lua";
		}
		else if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "Charlie/t2_equ_npc5_charlie.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 3)
		{
//			return "Charlie/t3p3_l1r+charlie.lua";
			return "Charlie/t3p3_l1r_charlie.lua";
		}

		else
		{
			return "Charlie/rnd_charlie.lua";
		}
	}


}

