using UnityEngine;
using System.Collections;

public class npc_Base : MonoBehaviour
{
	public AudioClip[] audioClips;

	public virtual void StartDialogue()
	{
//		string strPath = Application.dataPath + "/../Lua/npc/";
//		
//		strPath += GetLuaFileName();
//		
//	#if UNITY_EDITOR
//		strPath = "file:///" + strPath;
//	#endif

		string strPath = GLOBAL.GetUrl_Assets("Lua/npc/" + GetLuaFileName());
		
		// Start a dialogue with the npc using the selected file.
		DialogueOverlay.strFilePath_Dialogue = strPath;

		// Start a dialogue with the npc using the preset audio.
		DialogueOverlay.arrAudioClips = audioClips;

		CharacterType character = GetComponent<CharacterType>();

		if (character == null)
			Debug.LogError("CharacterType component not found on NPC '" + gameObject.name + "'");

		DialogueOverlay.character = character;

		DialogueOverlay.Load();
	}

	protected virtual string GetLuaFileName()
	{
		return "Test/empty.lua";
	}
}