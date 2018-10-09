using UnityEngine;
using System.Collections;

public class npc_Charlie_Fogg : MonoBehaviour {


	string strPath;
	public void StartDialogue()
	{

		strPath = Application.dataPath + "/../Lua/npc/";
		switch(GLOBAL.Player.progress["week"].i)
		{
			case 1:
				strPath += "Charlie_Fogg/t1_edt_charlie.lua";
				break;
			case 2:				
				strPath += "Charlie_Fogg/t2_equ_npc5_charlie.lua";
				break;
			case 3:				
				strPath += "Charlie_Fogg/t3p3_l1r_charlie.lua";
				break;
			default :
				if(GLOBAL.Player.progress["rnddialog"].i <= 3)				
					strPath += "Charlie_Fogg/rnd_cjguitr.lua";
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
