using UnityEngine;
using System.Collections;

namespace DialogueDispaly{
public class DialoguePopup : MonoBehaviour {

		void Awake(){
			DialogueState.Init();
		}

		public void DialogueStart(string obj){
			switch(obj){
			case "npc_tourguide":

				break;
			}
		}

	}
}
