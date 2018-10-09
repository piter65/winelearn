using UnityEngine;
using System.Collections;
// note-demeter used to be "Dennis McCarthy's Nephew"



public class npc_demeter : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Demeter/t3p4_l1r_demeter.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "Demeter/t2_utt_demeter.lua";
		}

		else 
		{
			return "Demeter/rnd_demeter.lua";
		}
	}


}
