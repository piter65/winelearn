using UnityEngine;
using System.Collections;
// note-Grandmaster G used to be Q-tip

public class npc_grandmaster : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 2
			&& GLOBAL_old.Player.progress["playernum"] == 1)
		{
			return "grandmaster/t2p1_vc_grandmaster.lua";
		}

		else 
		{
			return "grandmaster/rnd_grandmaster.lua";
		}
	}

}
