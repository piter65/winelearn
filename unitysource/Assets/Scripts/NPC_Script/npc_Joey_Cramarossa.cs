using UnityEngine;
using System.Collections;

public class npc_Joey_Cramarossa : npc_Base
{
	protected override string GetLuaFileName()
	{
		switch (GLOBAL_old.Player.progress["week"].i)
		{
			case 0:				
				return "Joey_Cramarossa/rnd_joey.lua";
			case 1:
				switch (GLOBAL_old.Player.progress["playnum"].i)
				{					
					case 2:
						return "Joey_Cramarossa/t1p2_utt_joey.lua";
					default :
						return "Joey_Cramarossa/rnd_joey.lua";
				}
			case 2:
				return "Joey_Cramarossa/rnd_joey.lua";
			case 3:
				switch(GLOBAL_old.Player.progress["playnum"].i)
				{
					case 3:
						return "Joey_Cramarossa/t3p3_l1w1_joey.lua";
					default :
						return "Joey_Cramarossa/t1p2_utt_joey.lua";
				}
			case 9:
				return "Joey_Cramarossa/task9_joey.lua";
			default:
				return "Joey_Cramarossa/rnd_joey.lua";
		}
	}
}
