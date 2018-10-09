using UnityEngine;
using System.Collections;
// note-Vernon Sharpe



public class npc_vernon : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 0)
		{
			return "Vernon/t0_vernon.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "Vernon/t2_equ_npc1_vern.lua";
		}

		else 
		{
			return "Vernon/rnd_vernon.lua";
		}
	}


}
