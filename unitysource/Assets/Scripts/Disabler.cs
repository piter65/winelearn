using UnityEngine;
using System.Collections;

public class Disabler : MonoBehaviour
{
	public enum Only
	{
		Enable,
		Disable
	};

	public enum Task
	{
		All   = -1,
		Zero  =  0,
		One   =  1,
		Two   =  2,
		Three =  3
	};

	public enum Player
	{
		All               = 0,
		Fast_Tracker_1    = 1,
		Smooth_Operator_2 = 2,
		Grime_Stopper_3   = 3,
		Green_Machine_4    = 4
	};

	public Only only;
	public Task on_Task;
	public Player for_Player;

	void Start()
	{
		if (only == Only.Enable)
		{
			if (on_Task == Task.All)
			{
				if (for_Player == Player.All)
				{
					// Always enable.
					gameObject.SetActive(true);
				}
				else
				{
					// Only enable for the specified player type.
					gameObject.SetActive
					(
						GLOBAL.Player.progress["playernum"] == (int)for_Player
					);
				}
			}
			else
			{
				if (for_Player == Player.All)
				{
					// Only enable on the specified task.
					gameObject.SetActive
					(
						GLOBAL.Player.progress["week"] == (int)on_Task
					);
				}
				else
				{
					// Only enable on the specified task and for the specified player type.
					gameObject.SetActive
					(
						   GLOBAL.Player.progress["week"] == (int)on_Task
						&& GLOBAL.Player.progress["playernum"] == (int)for_Player
					);
				}
			}
		}
		else if (only == Only.Disable)
		{
			if (on_Task == Task.All)
			{
				if (for_Player == Player.All)
				{
					// Always disable.
					gameObject.SetActive(false);
				}
				else
				{
					// Only disable for the specified player type.
					gameObject.SetActive
					(
						GLOBAL.Player.progress["playernum"] != (int)for_Player
					);
				}
			}
			else
			{
				if (for_Player == Player.All)
				{
					// Only disable on the specified task.
					gameObject.SetActive
					(
						GLOBAL.Player.progress["week"] != (int)on_Task
					);
				}
				else
				{
					// Only disable on the specified task and for the specified player type.
					gameObject.SetActive
					(
						   GLOBAL.Player.progress["week"] != (int)on_Task
						|| GLOBAL.Player.progress["playernum"] != (int)for_Player
					);
				}
			}
		}
	}
}
