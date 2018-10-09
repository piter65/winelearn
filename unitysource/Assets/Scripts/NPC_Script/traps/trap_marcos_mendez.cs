using UnityEngine;
using System.Collections;

public class trap_marcos_mendez : MonoBehaviour
{
	[Range(1, 4)]
	public int vendor_num = 1;
	public npc_Base npc;

	void Start()
	{
		if (   GLOBAL.Player.progress["week"].i == 1
			&& GLOBAL.Player.progress["playernum"].i == 4)
		{
			if (   GLOBAL.Player.progress["mickey"] > 0
				&& GLOBAL.Player.progress["w1vendor"] == vendor_num)
			{
				// Make the trap NPC visible.
				npc.gameObject.SetActive(true);

				// Talk to the trap NPC if we haven't talked to them yet.
				if (GLOBAL.Player.progress["mickey"] == 1)
				{
					// Frame the camera on the trap NPC.
					GLOBAL.OrbitCam.OrbitLookAt(transform.position);

					// Start dialogue with the trap NPC.
					npc.StartDialogue();
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
