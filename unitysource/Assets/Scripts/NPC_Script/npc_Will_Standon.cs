using UnityEngine;
using System.Collections;

public class npc_Will_Standon : npc_Base
{
	protected override string GetLuaFileName()
	{
		//switch (GLOBAL.Player.progress["week"].i)
		//{
		//	case 0:				
		//		if (GLOBAL.Player.progress["standonprogress"].i <= 2)
		//			return "Will/w0_succup.lua";
		//		}
		//		else
		//		{
		//			return "Will/rnd_succup.lua";
		//	case 1:
		//		switch (GLOBAL.Player.progress["playernum"].i)
		//		{
		//			case 1:
		//				if(GLOBAL.Player.progress["standonprogress"].i <= 12)
		//					return "Will/w1p1_s.lua";
		//				}
		//				else
		//				{
		//					return "Will/rnd_succup.lua";
		//			case 2:
		//				if (GLOBAL.Player.progress["standonprogress"].i <= 12)
		//					return "Will/w1p2_s.lua";
		//				}
		//				else
		//				{
		//					return "Will/rnd_succup.lua";
		//			case 3:
		//				if (GLOBAL.Player.progress["standonprogress"].i <= 12)
		//					return "Will/w1p3_s.lua";
		//				}
		//				else
		//				{
		//					return "Will/rnd_succup.lua";
		//			case 4:
		//				if (GLOBAL.Player.progress["standonprogress"].i <= 12)
		//					return "Will/w1p4_s.lua";
		//				}
		//				else
		//				{
		//					return "Will/rnd_succup.lua";
		//			default :
		//				if (GLOBAL.Player.progress["standonprogress"].i <= 2)
		//					return "Will/w0_succup.lua";
		//				}
		//				else
		//				{
		//					return "Will/rnd_succup.lua";
		//		}
		//	case 2:				
		//		switch(GLOBAL.Player.progress["playernum"].i)
		//		{
		//			case 1:
		//				return "Will/w2p1_s.lua";
		//			case 2:
		//				return "Will/w2p2_s.lua";
		//			case 3:
		//				return "Will/w2p3_s.lua";
		//			case 4:
		//				return "Will/w2p4_s.lua";
		//			default :
		//				return "Will/w0_succup.lua";
		//		}
		//	case 3:
		//		return "Will/t3_will.lua";
		//	case 4:
		//		switch(GLOBAL.Player.progress["outcome"].i)
		//		{
		//			case 1:
		//				return "Will/task4-1.lua";
		//			case 2:
		//				return "Will/task4-2.lua";
		//			case 3:
		//				return "Will/task4-3.lua";
		//			case 4:
		//				return "Will/task4-1.lua";
		//			default :
		//				return "Will/w0_succup.lua";
		//		}
		//	case 9:
		//		return "Will/task9_will.lua";
		//	default:
		//		return "Will/rnd_succup.lua";
		//}


		GLOBAL_old.Player.progress["outcome"] =
			  GLOBAL_old.Player.progress["tm_3_w1vendor"]
			+ GLOBAL_old.Player.progress["tm_3_w2vendor"]
			- GLOBAL_old.Player.progress["tm_3_w3vendor"]
			+ GLOBAL_old.Player.progress["tm_4_w1vendor"]
			+ GLOBAL_old.Player.progress["tm_4_w2vendor"]
			- GLOBAL_old.Player.progress["tm_4_w3vendor"]
			+ GLOBAL_old.Player.progress["tm_5_w1vendor"]
			+ GLOBAL_old.Player.progress["tm_5_w2vendor"]
			- GLOBAL_old.Player.progress["tm_5_w3vendor"]
			+ GLOBAL_old.Player.progress["tm_6_w1vendor"]
			+ GLOBAL_old.Player.progress["tm_6_w2vendor"]
			- GLOBAL_old.Player.progress["tm_6_w3vendor"];

		if (GLOBAL_old.Player.progress["outcome"] < 1)
		{
			GLOBAL_old.Player.progress["outcome"] = 1;
		}
		else if (GLOBAL_old.Player.progress["outcome"] < 10)
		{
			GLOBAL_old.Player.progress["outcome"] = 2;
		}
		else if (GLOBAL_old.Player.progress["outcome"] < 19)
		{
			GLOBAL_old.Player.progress["outcome"] = 3;
		}
		else
		{
			GLOBAL_old.Player.progress["outcome"] = 4;
		}


		if (GLOBAL_old.Player.progress["tm_3_w1cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_3_w1cost"] = 7760;
		}
		if (GLOBAL_old.Player.progress["tm_3_w2cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_3_w2cost"] = 17900;
		}
		if (GLOBAL_old.Player.progress["tm_4_w1cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_4_w1cost"] = 7760;
		}
		if (GLOBAL_old.Player.progress["tm_4_w2cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_4_w2cost"] = 17900;
		}
		if (GLOBAL_old.Player.progress["tm_5_w1cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_5_w1cost"] = 7760;
		}
		if (GLOBAL_old.Player.progress["tm_5_w2cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_5_w2cost"] = 17900;
		}
		if (GLOBAL_old.Player.progress["tm_6_w1cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_6_w1cost"] = 7760;
		}
		if (GLOBAL_old.Player.progress["tm_6_w2cost"] == 0)
		{
			GLOBAL_old.Player.progress["tm_6_w2cost"] = 17900;
		}

		GLOBAL_old.Player.progress["teamtotalcost"] =
			  GLOBAL_old.Player.progress["tm_3_w1cost"]
			+ GLOBAL_old.Player.progress["tm_3_w2cost"]
			+ GLOBAL_old.Player.progress["tm_4_w1cost"]
			+ GLOBAL_old.Player.progress["tm_4_w2cost"]
			+ GLOBAL_old.Player.progress["tm_5_w1cost"]
			+ GLOBAL_old.Player.progress["tm_5_w2cost"]
			+ GLOBAL_old.Player.progress["tm_6_w1cost"]
			+ GLOBAL_old.Player.progress["tm_6_w2cost"];

		GLOBAL_old.Player.progress["vendorsarrested"] = 0;

		if (GLOBAL_old.Player.progress["tm_3_w1vendor"] == 1)
		{
			GLOBAL_old.Player.progress["vendorsarrested"] = GLOBAL_old.Player.progress["vendorsarrested"] + 1;
		}
		if (GLOBAL_old.Player.progress["tm_4_w1vendor"] == 1)
		{
			GLOBAL_old.Player.progress["vendorsarrested"] = GLOBAL_old.Player.progress["vendorsarrested"] + 1;
		}
		if (GLOBAL_old.Player.progress["tm_5_w1vendor"] == 1)
		{
			GLOBAL_old.Player.progress["vendorsarrested"] = GLOBAL_old.Player.progress["vendorsarrested"] + 1;
		}
		if (GLOBAL_old.Player.progress["tm_6_w1vendor"] == 1)
		{
			GLOBAL_old.Player.progress["vendorsarrested"] = GLOBAL_old.Player.progress["vendorsarrested"] + 1;
		}

		if (GLOBAL_old.Player.progress["week"] == 1)
		{
			if (GLOBAL_old.Player.progress["playernum"] == 1)
			{
				return "Will/w1p1_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 2)
			{
				return "Will/w1p2_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 3)
			{
				return "Will/w1p3_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 4)
			{
				return "Will/w1p4_s.lua";
			}
		}
		else if (GLOBAL_old.Player.progress["week"] == 2)
		{
			if (GLOBAL_old.Player.progress["playernum"] == 1)
			{
				return "Will/w2p1_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 2)
			{
				return "Will/w2p2_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 3)
			{
				return "Will/w2p3_s.lua";
			}
			else if (GLOBAL_old.Player.progress["playernum"] == 4)
			{
				return "Will/w2p4_s.lua";
			}
		}
		else if (GLOBAL_old.Player.progress["week"] == 3)
		{
			return "Will/t3_will.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 4)
		{
			if (GLOBAL_old.Player.progress["outcome"] == 1)
			{
				return "Will/task4-1.lua";
			}
			else if (GLOBAL_old.Player.progress["outcome"] == 2)
			{
				return "Will/task4-2.lua";
			}
			else if (GLOBAL_old.Player.progress["outcome"] == 3)
			{
				return "Will/task4-3.lua";
			}
			else
			{
				return "Will/task4-4.lua";
			} 
		}
		else if (GLOBAL_old.Player.progress["week"] == 9)
		{
			return "Will/task9_will.lua";
		}
		else if (GLOBAL_old.Player.progress["week"] == 0)
		{
			return "Will/task0_will.lua";
		}

		return "Will/w0_succup.lua";
	}
}
