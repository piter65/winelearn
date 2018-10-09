using UnityEngine;
using System.Collections;
// note-Roseanne_Bellagiorno



public class npc_rosanne : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Roseanne/t3p2_l1w1_roseanne.lua";
		}


		else 
		{
			return "Roseanne/rnd_roseanne.lua";
		}
	}


}
