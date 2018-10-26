using UnityEngine;
using System.Collections;
// note-Sam Shortback

public class npc_vanessa_wu : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL_old.Player.progress["week"] == 1)
		{
			return "Vanessa_Wu/nlc_wtq.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 2)
		{
			return "Vanessa_Wu/nlc_wtq2.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 3)
		{
			return "Vanessa_Wu/nlc_wtq3.lua";
		}
		else
		{
			return "Vanessa_Wu/rnd_vanessa.lua";
		}
	}
}
