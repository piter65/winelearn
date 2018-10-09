using UnityEngine;
using System.Collections;
// note-Bernice Berlin - mostly in Luisa's Kitchen for Task 3

public class npc_bernice : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Bernice/t3p1_l1r_bernice.lua";
		}

		else 
		{
			return "Bernice/rnd_bernice.lua";
		}
	}


}
