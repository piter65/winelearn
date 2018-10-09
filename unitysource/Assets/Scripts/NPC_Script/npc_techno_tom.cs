using UnityEngine;
using System.Collections;

public class npc_techno_tom : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (GLOBAL.Player.progress["week"] == 3)
		{
			return "Raveboy/t3_ett_tom.lua";
		}
		else
		{
			return "Raveboy/rnd_raver.lua";
		}
	}
}
