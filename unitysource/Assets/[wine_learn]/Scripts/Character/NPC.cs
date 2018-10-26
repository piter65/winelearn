using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NPC : MonoBehaviour
{
	public string script_dialogue = "default";

	bool _mouse_down = false;
	
	public virtual void StartDialogue()
	{
		string path = Application.dataPath + "/../../game/npc_scripts/";

		path += script_dialogue + ".json";

#if UNITY_EDITOR
		path = "file:///" + path;
#endif

		GLOBAL.ui_dialogue_overlay.character = GetComponent<CharacterType>();
		GLOBAL.ui_dialogue_overlay.DialogueStart(path);
	}

	public void OnMouseDown()
	{
		_mouse_down = true;
	}

	public void OnMouseUp()
	{
		if (_mouse_down)
		{
			_mouse_down = false;

			StartDialogue();
		}
	}
}
