using UnityEngine;
using System.Collections;

public class npc_PhilGastrow : MonoBehaviour {

	void Start(){
		standonprogress = -1;
	}
	int standonprogress = 0;
	string strPath;
	public void StartDialogue()
	{

		strPath = Application.dataPath + "/../Lua/npc/";
		switch(GLOBAL_old.Player.progress["week"].i)
		{
			case 1:
			//if(GLOBAL.Player.progress["vendor3progress"] <=10)
				switch(GLOBAL_old.Player.progress["playnum"].i)
				{
					case 3:
						strPath += "Phil_Gastrow/t1p3_vc_phil.lua";
						break;
					default :
						strPath += "Phil_Gastrow/t1p3_vc_phil.lua";
						break;
				}
				break;
			case 3:
			//if(GLOBAL.Player.progress["vendor1progress"] <=3)
					switch(GLOBAL_old.Player.progress["playnum"].i)
					{
						case 1:
							strPath += "Phil_Gastrow/t3p1_va_burrels.lua";
							break;
						default :
							strPath += "Phil_Gastrow/t3p1_va_burrels.lua";
							break;
					}
				break;
			default :				
				strPath += "Phil_Gastrow/rnd_pgastrow.lua";
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
