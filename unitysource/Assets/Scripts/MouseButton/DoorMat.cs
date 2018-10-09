using UnityEngine;
using System.Collections;


public class DoorMat : MonoBehaviour {

	public enum DoAction{

		Nothing,
		Enter,
		Exit,
		Jumproom

	}
		
	public DoAction editorAction = DoAction.Jumproom;
	public DoAction playerAction = DoAction.Enter;
		

}
