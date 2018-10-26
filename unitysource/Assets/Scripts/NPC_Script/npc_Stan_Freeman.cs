using UnityEngine;
using System.Collections;

public class npc_Stan_Freeman : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL_old.Player.progress["week"].i == 4)
		{
			if (GLOBAL_old.Player.progress["playnum"].i == 1)
			{
				return "Stan_Freeman/w4p1_ceo.lua";
			}
			else if (GLOBAL_old.Player.progress["playnum"].i == 2)
			{
				return "Stan_Freeman/w4p2_ceo.lua";
			}
			else if (GLOBAL_old.Player.progress["playnum"].i == 3)
			{
				return "Stan_Freeman/w4p3_ceo.lua";
			}
			else if (GLOBAL_old.Player.progress["playnum"].i == 4)
			{
				return "Stan_Freeman/w4p4_ceo.lua";
			}
			else
			{
				return "Stan_Freeman/rnd_ceostan.lua";
			}
		}

		else if (GLOBAL_old.Player.progress["week"].i == 9)
		{
			return "Stan_Freeman/task9_ceostan.lua";
		}
		else if (GLOBAL_old.Player.progress["week"].i == 0)
		{
			return "Stan_Freeman/task0_ceostan.lua";
		}



		else
		{
			return "Stan_Freeman/rnd_ceostan.lua";
		}
	}
}
