using UnityEngine;
using System.Collections;
// note-Nurse John Gray


public class npc_nurse_john : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Nurse_John/t1p2_john.lua";
		}

// peter grabbed from original sandy script...
		else if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "Nurse_John/t3p4_john.lua";
		}

		else 
		{
			return "Nurse_John/rnd_john.lua";
		}
	}


}
