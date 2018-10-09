using UnityEngine;
using System.Collections;
// note-Debra Geffen



public class npc_debra : npc_Base
{

	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "Debra/t2p4_ex_debra.lua";
		}


		else 
		{
			return "Debra/rnd_debra.lua";
		}
	}


}
