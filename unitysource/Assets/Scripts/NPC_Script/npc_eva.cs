using UnityEngine;
using System.Collections;
// note-eva Green - the environmental quiz lady...


public class npc_eva : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 0 )
		{
			return "eva/t0_eva.lua";
		}
		else if (   GLOBAL_old.Player.progress["week"] == 1 )
		{
			return "eva/t1_eva.lua";
		}

		else if (   GLOBAL_old.Player.progress["week"] == 2 )
		{
			return "eva/t2_eva.lua";
		}

		else 
		{
			return "eva/t3_eva.lua";
		}
	}


}
