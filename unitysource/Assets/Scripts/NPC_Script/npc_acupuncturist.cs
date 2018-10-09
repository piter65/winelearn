using UnityEngine;
using System.Collections;
// note-Acupuncturist has one c!

public class npc_acupuncturist : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 1)
		{
			return "Acupuncturist/t3p1_l2r_acupuncturist.lua";
		}


		else 
		{
			return "Acupuncturist/rnd_acupuncturist.lua";
		}
	}


}
