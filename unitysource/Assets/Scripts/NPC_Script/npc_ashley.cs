using UnityEngine;
using System.Collections;
// note-Ashley Dapper

public class npc_ashley : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 2
			&& GLOBAL_old.Player.progress["playernum"] == 3)
		{
			return "Ashley/t2p3_va_ashley.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3)
		{
			return "Ashley/t3_mq_npc2_ashley.lua";
		}

		else 
		{
			return "Ashley/rnd_ashley.lua";
		}
	}


}
