using UnityEngine;
using System.Collections;

public class npc_Mayor : npc_Base
{
	protected override string GetLuaFileName()
	{

		if (GLOBAL.Player.progress["week"] == 0)
		{
				return "Mayor/task0_mayor.lua";

		}

		else if (GLOBAL.Player.progress["week"] == 1)
		{
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				return "Mayor/t1p1_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				return "Mayor/t1p2_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				return "Mayor/t1p3_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				return "Mayor/t1p4_mayor.lua";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 2)
		{
			if (GLOBAL.Player.progress["playernum"] == 1)
			{
				return "Mayor/t2p1_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 2)
			{
				return "Mayor/t2p2_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 3)
			{
				return "Mayor/t2p3_mayor.lua";
			}
			else if (GLOBAL.Player.progress["playernum"] == 4)
			{
				return "Mayor/t2p4_mayor.lua";
			}
		}
		else if (GLOBAL.Player.progress["week"] == 3)
		{
			return "Mayor/t3_mayor.lua";
		}
		else if (GLOBAL.Player.progress["week"] == 4)
		{
			//return "Mayor/w4_mayor.lua";
		}

		return "Mayor/rnd_mayor.lua";
	}
}
