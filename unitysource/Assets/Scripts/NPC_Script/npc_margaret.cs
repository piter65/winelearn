using UnityEngine;
using System.Collections;
// note-Margarat Wong used to be Samantha_Kim

public class npc_margaret : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 2)
		{
			return "Margaret/t2p2_va_margaret.lua";
		}

		else 
		{
			return "Margaret/rnd_margaret.lua";
		}
	}


}
