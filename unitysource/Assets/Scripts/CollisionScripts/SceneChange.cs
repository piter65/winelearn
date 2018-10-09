using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneChange : MonoBehaviour {

	GameObject exithall;
	public GameObject Parent;
	// Use this for initialization
	void Start () {

		if(GameObject.Find ("ThirdPersonController") != null)
		Parent = GameObject.Find ("ThirdPersonController");
		MemoryWarning ();
		if (GameObject.Find ("Exit_Hall") != null) {
			exithall = GameObject.Find ("Exit_Hall");
			//exithall.SetActive (false);
		}

	}
	void MemoryWarning(){
		System.GC.Collect();
		Resources.UnloadUnusedAssets();
		System.GC.WaitForPendingFinalizers();
	}
	bool exitDoor;

	void OnCollisionEnter(Collision col){
		if (col.gameObject.name == "Door") {
			if(exitDoor == false){
				col.gameObject.SetActive(false);
				StartCoroutine(ExitDoor());
				exitDoor = true;
			}
		}
		if (col.gameObject.name == "Pillers") {
			SceneManager.LoadScene(1);

		}
		if (col.gameObject.name == "Exit_Hall") {
			SceneManager.LoadScene(0);
		}
		if (col.gameObject.tag == "male" | col.gameObject.tag == "female" ) {
			if (gateObj != null)
				gateObj.GetComponent<Collider> ().enabled = true;
			Parent.GetComponent<CameraArroundCharacter> ().ZoomInIn = true;
		}

		if (col.gameObject.name == "Gateview") {
			Parent.GetComponent<CameraArroundCharacter> ().ZoomInIn = true;
			gateObj = col.gameObject;
			gateObj.GetComponent<Collider> ().enabled = false;

		}
	}
	GameObject gateObj;
	IEnumerator ExitDoor(){
		Parent.GetComponent<CameraArroundCharacter> ().ZoomInIn = true;
		yield return new WaitForSeconds (2.0f);
		//this.GetComponent<CameraArroundCharacter> ().ZoomInIn = true;
		exithall.SetActive (true);
		exitDoor = false;
		yield return new WaitForSeconds (5f);
		Parent.GetComponent<CameraArroundCharacter> ().ZoomInIn = false;
	}

}
