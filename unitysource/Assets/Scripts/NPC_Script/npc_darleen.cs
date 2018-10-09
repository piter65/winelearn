using UnityEngine;
using System.Collections;
// note-Darleen is Dweebs Girfriend



public class npc_darleen : npc_Base
{
	protected override string GetLuaFileName()
	{


// peter grabbed from original sandy script...
		if (   GLOBAL.Player.progress["week"] == 3
			&& GLOBAL.Player.progress["playernum"] == 4)
		{
			return "darleen/t3p4_l2r_darleen.lua";
		}

		else 
		{
			return "darleen/rnd_darleen.lua";
		}
	}


}
