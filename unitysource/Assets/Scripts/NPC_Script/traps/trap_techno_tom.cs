using UnityEngine;
using System.Collections;

public class trap_techno_tom : MonoBehaviour
{
	[Range(1, 4)]
	public int player_num = 1;
	public npc_Base npc;

	void Start()
	{
		if (   GLOBAL.Player.progress["week"].i == 3
			&& GLOBAL.Player.progress["playernum"].i == player_num)
		{
			if (   GLOBAL.Player.progress["etttrap"] > 0)
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
