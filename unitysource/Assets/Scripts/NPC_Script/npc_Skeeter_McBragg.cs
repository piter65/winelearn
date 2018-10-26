using UnityEngine;
using System.Collections;

public class npc_Skeeter_McBragg : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL_old.Player.progress["week"] == 1
			&& GLOBAL_old.Player.progress["playernum"] == 4)
		{
			return "Willie_Trucks/w1p4_vd_skeeter_mcbragg.lua";
		}
		else if (   GLOBAL_old.Player.progress["week"] == 3
				 && GLOBAL_old.Player.progress["playernum"] == 2)
		{
			return "Willie_Trucks/t3p2_vc_skeeter.lua";
		}

		return "Willie_Trucks/rnd_willie.lua";
	}
}
