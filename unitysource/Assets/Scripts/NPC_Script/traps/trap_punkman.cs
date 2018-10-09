using UnityEngine;
using System.Collections;

public class trap_punkman : MonoBehaviour
{
	[Range(1, 4)]
	public int player_num = 1;
	[Range(1, 4)]
	public int vendor_num = 1;
	public npc_Base npc;

	void Start()
	{
		if (   GLOBAL.Player.progress["week"].i == 2
			&& GLOBAL.Player.progress["playernum"].i == player_num)
		{
			if (   GLOBAL.Player.progress["etttrap"] > 0
				&& (   GLOBAL.Player.progress["ett_vendor"] == vendor_num
					|| GLOBAL.Player.progress["lastvendor"] == vendor_num)
				)
			{
				// Make the trap NPC visible.
				npc.gameObject.SetActive(true);

				// Talk to the trap NPC if we haven't talked to them yet.
				if (GLOBAL.Player.progress["etttrap"] == 1)
				{
					// Frame the camera on the trap NPC.
					GLOBAL.OrbitCam.OrbitLookAt(transform.position);

					// Start dialogue with the trap NPC.
					npc.StartDialogue();

					// Flag what vendor the trap is located by.
					GLOBAL.Player.progress["ett_vendor"] = GLOBAL.Player.progress["lastvendor"];

					// Flag that we've talked to the trap NPC.
					GLOBAL.Player.progress["etttrap"] = 2;
				}
			}
			else
			{
				// Make the trap NPC invisible and disabled.
				npc.gameObject.SetActive(false);
			}
		}
		else
		{
			// Make the trap NPC invisible and disabled.
			npc.gameObject.SetActive(false);
		}
	}
}
