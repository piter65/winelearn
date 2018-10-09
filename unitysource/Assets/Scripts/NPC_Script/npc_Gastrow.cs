using UnityEngine;
using System.Collections;

public class npc_Gastrow : MonoBehaviour {

	void Start(){
		standonprogress = -1;
	}
	int standonprogress = 0;
	string strPath;
	public void StartDialogue()
	{

		strPath = Application.dataPath + "/../Lua/npc/";
		switch(GLOBAL.Player.progress["rnddialog"].i)
		{
			case 0:	
				strPath += "Bill_Gastrow/rnd_bgastrow.lua";
				break;
			case 1:		
				strPath += "Bill_Gastrow/rnd_bgastrow.lua";
				break;
			case 2:		
				strPath += "Bill_Gastrow/rnd_bgastrow.lua";
				
				break;
			case 3:
				strPath += "Bill_Gastrow/rnd_bgastrow.lua";
				break;
			default : 
				strPath += "Bill_Gastrow/rnd_bgastrow.lua";
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
