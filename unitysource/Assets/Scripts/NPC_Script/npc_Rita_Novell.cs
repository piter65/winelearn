using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class npc_Rita_Novell : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL_old.Player.progress["week"] == 1)
		{
			return "Rita_Novell/w1_res_lib.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 2)
		{
			return "Rita_Novell/w2_res_lib.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 3)
		{
			return "Rita_Novell/t3_wp3_rita.lua";
		}
		//else if (GLOBAL.Player.progress["week"] == 4)
		//{
		//	return "Rita_Novell/w4_wp3_librarian.lua";
		//}
		else
		{
			return "Rita_Novell/rnd_librarian.lua";
		}
	}


}
