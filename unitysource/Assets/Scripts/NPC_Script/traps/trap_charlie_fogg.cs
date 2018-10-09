using UnityEngine;
using System.Collections;

public class trap_charlie_fogg : MonoBehaviour
{
	public npc_Base npc;

	void Start()
	{
		if (GLOBAL.Player.progress["week"].i == 1)
		{
			if (GLOBAL.Player.progress["edt"] > 0)
			{
				// Make the trap NPC visible.
				npc.gameObject.SetActive(true);

				// Talk to the trap NPC if we haven't talked to them yet.
				if (GLOBAL.Player.progress["edt"] == 1)
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
