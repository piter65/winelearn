using UnityEngine;
using System.Collections;

public class npc_WebsterDweeb : npc_Base
{
	protected override string GetLuaFileName()
	{
		if(    GLOBAL.Player.progress["week"].i == 1
			&& GLOBAL.Player.progress["playernum"].i == 1)
		{
			switch (GLOBAL.Player.progress["mickey"].i)
			{
				case 1:
					return "Webster_Dweeb/t1p1_utt_webster.lua";
				case 2:
					return "Webster_Dweeb/t1p1_utt_webster.lua";
				case 3:
					return "Webster_Dweeb/t1p1_utt_webster.lua";
				case 4:
					return "Webster_Dweeb/t1p1_utt_webster.lua";
				default:
					return "Webster_Dweeb/rnd_webster.lua";
			}
		}
		else if (GLOBAL.Player.progress["week"].i == 9)
		{
			return "Webster_Dweeb/task9_webster.lua";
		}
		else
		{
			return "Webster_Dweeb/rnd_webster.lua";
		}
	}
}