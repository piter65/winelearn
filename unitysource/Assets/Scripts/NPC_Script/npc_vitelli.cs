using UnityEngine;
using System.Collections;
// note-Alberto Vitelli

//if week == 3 then
//	dialogtext = require 'Alberto_Vitelli\\t3_wp2_vitelli'
//end

public class npc_vitelli : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 3
			&& GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Vitelli/t3_wp2_vitelli.lua";
		}



		else 
		{
			return "Vitelli/rnd_vitelli.lua";
		}
	}


}
