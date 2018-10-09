using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class Loadeing : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	private void OnGUI(){
		if(GUI.Button(new Rect(10,100,100,50),"BG")){
			SceneManager.LoadScene("boltrights_garage");
		}
		if(GUI.Button(new Rect(10,200,100,50),"BB")){
			SceneManager.LoadScene("burells_brothers");
		}
		if(GUI.Button(new Rect(10,300,100,50),"CS")){
			SceneManager.LoadScene("crammarosas");
		}
		if(GUI.Button(new Rect(10,400,100,50),"Net")){
			SceneManager.LoadScene("internet_cafe");
		}
		if(GUI.Button(new Rect(10,500,100,50),"TDL")){
			SceneManager.LoadScene("tie_dyed_loft");
		}
	}
}
