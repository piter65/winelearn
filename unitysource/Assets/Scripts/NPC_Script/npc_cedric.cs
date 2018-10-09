using UnityEngine;
using System.Collections;
// note-cedric maxwell"

public class npc_cedric : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Cedric/t2p2_vb_cedric.lua";
		}


		else 
		{
			return "Cedric/rnd_cedric.lua";
		}
	}


}
