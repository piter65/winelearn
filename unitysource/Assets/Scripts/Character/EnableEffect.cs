using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class EnableEffect : MonoBehaviour {

	//Vector2 rotationSpeed = new Vector2( 50.0f, 0.0f );
	public float refv=0.00f;
	public Transform ThirdPerson;
	public static bool isReachCam = false;
	public static GameObject Target_L,Target_R,Target_F,Target_B;
	public static Vector3 left,back,front,right;
	public static bool isReady = false;

	void Awake(){
		CameraFV = 55;
		if (SceneManager.GetActiveScene().name != "FirstPerson")
			ThirdPerson = GameObject.Find ("ThirdPersonController").transform;

	}

	void OnDisable(){
		if (SceneManager.GetActiveScene().name == "DemoApp")
			if (this.gameObject.name != "Main Camera") 
				this.transform.localPosition = new Vector3 (Random.Range(-10,10),3,Random.Range(-10,10));
	}

	void OnEnable(){
		CameraFV = 55;
		if (this.gameObject.name == "Left") {
			this.gameObject.transform.localPosition = left;
		}
		if (this.gameObject.name == "Right") {
			this.gameObject.transform.localPosition = right;
		}
		if (this.gameObject.name == "Back") {
			this.gameObject.transform.localPosition = back;
		}
		if (this.gameObject.name == "UP") {
			this.gameObject.transform.localPosition = front;
		}
	}

	private float CameraFV ,ZoomInValue,ZoomOutValue;
	void FocalLength(){
		CameraFV = Mathf.Lerp (CameraFV, 40, Time.smoothDeltaTime);
		this.GetComponent<Camera> ().fieldOfView = CameraFV;
	}

	// Update is called once per frame
	void Update () {
		if (this.gameObject.name != "Main Camera") {
			FocalLength ();

			if (CameraEffect.instance.CamLR.CamEnabled == false) {
				if (Vector3.Distance (transform.localPosition, right) >= 0) {
					if (Target_R == null)
						Target_R = GameObject.Find ("Right_Obj");
					transform.localPosition = Vector3.Lerp (transform.localPosition, Target_R.transform.localPosition, 0.5f * Time.deltaTime);
					
				}
			} else if (CameraEffect.instance.CamUP.CamEnabled == false) {
				if (Vector3.Distance (transform.localPosition, back) >= 0) {
					if (Target_B == null)
						Target_B = GameObject.Find ("Back_Obj");
					transform.localPosition = Vector3.Lerp (transform.localPosition, Target_B.transform.localPosition, 0.5f * Time.deltaTime);
				
				}
			} else if (CameraEffect.instance.CamRL.CamEnabled == false) {
				if (Vector3.Distance (transform.localPosition, left) >= 0) {	
					if (Target_L == null)
						Target_L = GameObject.Find ("Left_Obj");
					transform.localPosition = Vector3.Lerp (transform.localPosition, Target_L.transform.localPosition, 0.5f * Time.deltaTime);
			
				}
			}
			transform.LookAt (ThirdPerson);
		} 
//		else {
//			if (this.gameObject.name == "Main Camera") {
//				this.transform.localPosition = new Vector3 (ThirdPerson.transform.position.x,0.7f,ThirdPerson.transform.position.z);
//				this.gameObject.transform.parent = ThirdPerson.transform;
//				this.gameObject.transform.localPosition = new Vector3(0,0.7f,0);
//			}
//		}
	}

}


