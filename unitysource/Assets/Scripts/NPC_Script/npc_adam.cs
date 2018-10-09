using UnityEngine;
using System.Collections;
// note-Adam Baum used to be Bill Drier




public class npc_adam : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 2
			&& GLOBAL.Player.progress["playernum"] == 3)
		{
			return "Adam/t2p3_vd_adam.lua";
		}


		else 
		{
			return "Adam/rnd_adam.lua";
		}
	}


}
