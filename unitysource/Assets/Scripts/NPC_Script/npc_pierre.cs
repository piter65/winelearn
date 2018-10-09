using UnityEngine;
using System.Collections;
// note-pierre torque was serge?


public class npc_pierre : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "pierre/edt_serge.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 3)
		{
			return "pierre/t3_mq_npc5_serge.lua";
		}

		else 
		{
			return "pierre/rnd_pierre.lua";
		}
	}


}
