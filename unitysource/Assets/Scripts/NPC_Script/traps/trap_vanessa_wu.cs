using UnityEngine;
using System.Collections;

public class trap_vanessa_wu : MonoBehaviour
{
	public npc_Base npc;

	void Start()
	{
		if (GLOBAL.Player.progress["wutrap"] > 0)
		{
			// Make the trap NPC visible.
			npc.gameObject.SetActive(true);

			// Talk to the trap NPC if we haven't talked to them yet.
			if (GLOBAL.Player.progress["wutrap"] == 1)
			{
				// Frame the camera on the trap NPC.
				GLOBAL.OrbitCam.OrbitLookAt(transform.position);

				// Start dialogue with the trap NPC.
				npc.StartDialogue();

				// Flag that we've talked to the trap NPC.
				GLOBAL.Player.progress["wutrap"] = 2;
			}
		}
		else
		{
			// Make the trap NPC invisible and disabled.
			npc.gameObject.SetActive(false);
		}
	}
}
