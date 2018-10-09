using UnityEngine;
using System.Collections;
// note-Wineharts Astrologist


public class npc_astrologist : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Astrologist/t3p2_l1r_astrologist.lua";
		}

		else if (   GLOBAL.Player.progress["week"] == 2)
		{
			return "Astrologist/t2_equ_npc3_astrologist.lua";
		}

		else 
		{
			return "Astrologist/rnd_astrologist.lua";
		}
	}


}
