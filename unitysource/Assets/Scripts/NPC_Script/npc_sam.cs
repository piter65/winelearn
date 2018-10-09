using UnityEngine;
using System.Collections;
// note-Sam Shortback

public class npc_sam : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Sam/t2p2_vc_sam.lua";
		}

		else 
		{
			return "Sam/rnd_sam.lua";
		}
	}


}
