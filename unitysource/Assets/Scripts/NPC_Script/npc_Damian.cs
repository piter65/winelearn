using UnityEngine;
using System.Collections;

public class npc_Damian : MonoBehaviour {

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
			Debug.Log("path >>>>><<<<<<<<"+strPath);
				switch(GLOBAL_old.Player.progress["playnum"].i)
				{					
					case 4:
					if(GLOBAL_old.Player.progress["vendor1progress"].i <= 10)
					strPath += "Damian_Maytal/t1p4_va_nathaniel_wailer.lua";

						break;					
				}
				break;
			case 3:				
				switch(GLOBAL_old.Player.progress["playnum"].i)
				{
					case 2:
				if(GLOBAL_old.Player.progress["vendor1progress"].i <= 3)
					strPath += "Damian_Maytal/t3p2_vb_nathaniel.lua";
												
					break;
				}
				break;
			default :
				strPath += "Damian_Maytal/rnd_damian.lua";
					break;				
		}

		Debug.Log(">>>_________>>>>\t"+GLOBAL_old.Player.progress["week"].i+"\t"+GLOBAL_old.Player.progress["playnum"].i);
		#if UNITY_EDITOR
		strPath = "file:///" + strPath;
		#endif
		
		// Start a dialogue with the npc using the selected file.
		DialogueOverlay.strFilePath_Dialogue = strPath;
		//DialogueOverlay.Load();

	}


}
