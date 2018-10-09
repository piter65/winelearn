using UnityEngine;
using System.Collections;
// note-sayles is either manny sayles, or shady sayles


public class npc_sayles : npc_Base
{
	protected override string GetLuaFileName()
	{
		if (   GLOBAL.Player.progress["week"] == 3)
		{
			return "sayles/t3_mq_npc3_manny.lua";
		}


		else 
		{
			return "sayles/rnd_manny.lua";
		}
	}


}
