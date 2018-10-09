using UnityEngine;
using System.Collections;
// note-Abbie used to be Mary Ellen Vantusio

public class npc_abbie : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "abbie/t2p4_vc_abbie.lua";
		}

		else 
		{
			return "abbie/rnd_abbie.lua";
		}
	}


}
