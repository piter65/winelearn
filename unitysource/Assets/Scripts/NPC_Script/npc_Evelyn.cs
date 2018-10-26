using UnityEngine;
using System.Collections;

public class npc_Evelyn : npc_Base
{
	protected override string GetLuaFileName()
	{
		//switch (GLOBAL.Player.progress["week"].i)
		//{
		//	case 0:
		//		return "Evelyn/w0_evelyn.lua";
		//	case 1:
		//		return week1_Dialogue();
		//	case 2:
		//		return week2_Dialogue();
		//	case 3:
		//		return "Evelyn/w0_evelyn.lua";
		//	case 9:
		//		return task9_Dialogue();
		//	default:
		//		return "Evelyn/w0_evelyn.lua";
		//}

		if (GLOBAL_old.Player.progress["week"] == 1)
		{
			if (GLOBAL_old.Player.progress["playernum"] == 1)
			{
				return "Evelyn/w1p1_as_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 2)
			{
				return "Evelyn/w1p2_as_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 3)
			{
				return "Evelyn/w1p3_as_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 4)
			{
				return "Evelyn/w1p4_as_evelyn.lua";
			}
		}
		else if (GLOBAL_old.Player.progress["week"] == 2)
		{
			if (GLOBAL_old.Player.progress["playernum"] == 1)
			{
				return "Evelyn/w2p1_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 2)
			{
				return "Evelyn/w2p2_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 3)
			{
				return "Evelyn/w2p3_evelyn.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 4)
			{
				return "Evelyn/w2p4_evelyn.lua";
			}
		}
		else if (GLOBAL_old.Player.progress["week"] == 3)
		{
				return "Evelyn/w3_evelyn.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 4)
		{
			//return "Evelyn/w4_evelyn.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 0)
		{
			return "Evelyn/w0_evelyn.lua";
		}

		return "Evelyn/rnd_evelyn.lua";
	}

	public string week1_Dialogue()
	{
		switch (GLOBAL_old.Player.progress["playernum"].i)
		{
			case 1:
				return "Evelyn/w1p1_as_evelyn.lua";
			case 2:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w1p2_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			case 3:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w1p3_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			case 4:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w1p4_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			default:
				return "Evelyn/rnd_evelyn.lua";
		}
	}

	public string week2_Dialogue()
	{
		switch (GLOBAL_old.Player.progress["playernum"].i)
		{
			case 1:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w2p1_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			case 2:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w2p1_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			case 3:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w2p3_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			case 4:
				if (GLOBAL_old.Player.progress["evelynprogress"].i == 0)
					return "Evelyn/w2p4_as_evelyn.lua";
				else
					return "Evelyn/rnd_evelyn.lua";
			default:
				return "Evelyn/rnd_evelyn.lua";
		}
	}
//	public void week3_Dialogue(){
//		switch(GLOBAL.Player.progress["playernum"]){
//		case 1:
//			if(GLOBAL.Player.progress["evelynprogress"] == 0)
//				strPath += "Evelyn/w2p1_as_evelyn.lua";
//			break;
//		case 2:
//			if(GLOBAL.Player.progress["evelynprogress"] == 0)
//				strPath += "Evelyn/w2p2_as_evelyn.lua";
//			
//			break;
//		case 3:
//			if(GLOBAL.Player.progress["evelynprogress"] == 0)
//				strPath += "Evelyn/w2p3_as_evelyn.lua";
//			break;
//		case 4:
//			if(GLOBAL.Player.progress["evelynprogress"] == 0)
//				strPath += "Evelyn/w2p4_as_evelyn.lua";
//			break;
//		}
//	}

	public string task9_Dialogue()
	{
		return "Evelyn/task9_evelyn.lua";
	}
}
