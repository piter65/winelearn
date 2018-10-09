using UnityEngine;
using System.Collections;

public class npc_tourguideold : MonoBehaviour
{
	// Use this for initialization
	void Start()
	{
		
	}
	

	
	public void StartDialogue()
	{
		string strPath = Application.dataPath + "/../Lua/npc/";
		//string strPath = Application.dataPath+"/Lua/npc/";
		
		switch(GLOBAL.Player.progress["week"].i)
		{
			case 1:
				//if(GLOBAL.Player.progress["tourguide"] <=3)
				strPath += "Tour_Guide/nlc_tourguide.lua";
				break;
			case 2: 
				if(GLOBAL.Player.progress["tourguide"].i <= 3)
					strPath += "Tour_Guide/nlc_tourguide2.lua";
				break;
			case 3:
				if(GLOBAL.Player.progress["tourguide"].i <= 3)
					strPath += "Tour_Guide/nlc_tourguide3.lua";
				break;
			case 4:
				if(GLOBAL.Player.progress["tourguide"].i <= 2)
					strPath += "Tour_Guide/nlc_tourguide4.lua";
				break;
			default:
				if(GLOBAL.Player.progress["tourguide"].i <= 12)
					strPath += "Tour_Guide/w0_tourguide.lua";
				break;
		}





		
		#if UNITY_EDITOR
		strPath = "file:///" + strPath;
		#endif
		
		// Start a dialogue with the npc using the selected file.
		DialogueOverlay.strFilePath_Dialogue = strPath;
		DialogueOverlay.Load();
	}
}
