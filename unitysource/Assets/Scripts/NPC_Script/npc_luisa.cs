using UnityEngine;
using System.Collections;
// note-Luisa Del Castillo


public class npc_luisa : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Luisa/t3p1_l1w1_luisa.lua";
		}

		else 
		{
			return "Luisa/rnd_luisa.lua";
		}
	}


}
