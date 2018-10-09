using UnityEngine;
using System.Collections;

public class CharAnim : MonoBehaviour {


	// Use this for initialization
	void Start () {
		this.gameObject.transform.localScale = new Vector3(0,0,0);
	}

	float scale;
	// Update is called once per frame
	void Update () {
		if(scale <1.01f){
			scale = scale+0.05f;
		}
		this.gameObject.transform.localScale = new Vector3(scale,scale,scale);
	}

	void OnEnable(){
		scale = 0;
	}
}
