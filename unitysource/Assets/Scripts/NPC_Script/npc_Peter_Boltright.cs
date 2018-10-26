using UnityEngine;
using System.Collections;

public class npc_Peter_Boltright : MonoBehaviour {


	string strPath;
	public void StartDialogue()
	{

		strPath = Application.dataPath + "/../Lua/npc/";
		switch(GLOBAL_old.Player.progress["week"].i)
		{
			
			case 1:
				switch(GLOBAL_old.Player.progress["playnum"].i)
				{				
					case 3:
						if(GLOBAL_old.Player.progress["vendor1progress"].i <= 12)
							strPath += "Peter_Boltright/t1p3_va_peter.lua";
						break;
					default :
							strPath += "Peter_Boltright/rnd_peter.lua";
					break;
				}

				break;
			case 3:
					switch(GLOBAL_old.Player.progress["playnum"].i){
					case 1:
					if(GLOBAL_old.Player.progress["vendor2progress"].i <= 3)
							strPath += "Peter_Boltright/t3p1_va_peter.lua";
						break;
					default :
						strPath += "Peter_Boltright/rnd_peter.lua";
						break;
					}
				break;
			default:	
				strPath += "Peter_Boltright/rnd_peter.lua";
				break;
		}

		Debug.Log(">>>>>>>\t"+GLOBAL_old.Player.progress["week"]+"\t"+GLOBAL_old.Player.progress["playnum"]);
		#if UNITY_EDITOR
		strPath = "file:///" + strPath;
		#endif
		
		// Start a dialogue with the npc using the selected file.
		DialogueOverlay.strFilePath_Dialogue = strPath;
		//DialogueOverlay.Load();

	}


}
