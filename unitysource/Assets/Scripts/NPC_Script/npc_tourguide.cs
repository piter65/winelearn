using UnityEngine;
using System.Collections;

// peter was here
public class npc_tourguide : npc_Base
{
	protected override string GetLuaFileName()
	{
		switch (GLOBAL_old.Player.progress["week"].i)
		{
			case 0:
				return "tourguide/w0_tourguide.lua";
			case 1:
				return "tourguide/nlc_tourguide1.lua";	
			case 2:
				return "tourguide/nlc_tourguide2.lua";	
			case 3:
				return "tourguide/nlc_tourguide3.lua";	
			case 4:
				return "tourguide/nlc_tourguide4.lua";	
			default:
				return "tourguide/w0_tourguide.lua";
		}
	}
}
