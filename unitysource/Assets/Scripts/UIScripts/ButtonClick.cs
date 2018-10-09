using UnityEngine;
using System.Collections;

public class ButtonClick : MonoBehaviour {


	void OnClick(){
		Debug.Log (this.gameObject.name);
	}

	void OnMouseDown(){
		Debug.Log (this.gameObject.name);
	}
}
