using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class OrbitCamera : MonoBehaviour {

		public Transform target;
		public float distance = 5.0f;
		public float xSpeed = 120.0f;
		public float ySpeed = 120.0f;
		
		public float yMinLimit = -20f;
		public float yMaxLimit = 80f;
		
		public float distanceMin = 0.5f;
		public float distanceMax = 15f;
		
		private Rigidbody _rigidbody;

		public static bool NormalViewBool;	

		float x = 0.0f;
		float y = 0.0f;
		
		// Use this for initialization
		void Start() 
		{
			target = GameObject.Find("ThirdPersonController").transform;

			if (GameObject.FindWithTag("Exit") != null)
			{
				GameObject.FindWithTag("Exit").AddComponent<ExitInterior>();
			}

			NormalViewBool = true;
			Vector3 angles = transform.eulerAngles;
			x = angles.y;
			y = angles.x;			
			_rigidbody = GetComponent<Rigidbody>();			
			// Make the rigid body not change rotation
			if (_rigidbody != null)
			{
				_rigidbody.freezeRotation = true;
			}
			if (SceneManager.GetActiveScene().name == "Outside")
			{
				this.gameObject.GetComponent<Camera>().fieldOfView = 50;
				this.gameObject.transform.localPosition = new Vector3(transform.localPosition.x,transform.localPosition.y,-5.66f);
			}
			else
			{
				distance = 3.0f;
				this.gameObject.GetComponent<Camera>().fieldOfView = 45;
				this.gameObject.transform.localPosition = new Vector3(transform.localPosition.x,transform.localPosition.y,-3.0f);
			}
		}
		
		void LateUpdate () 
		{
			if (target) {

			// BChance: (2016-03-09) - Allowed single button mouse input.
			//if(Input.GetKey ("mouse 1"))
			if (GLOBAL.IsRightMousePressed())
			{
				x += Input.GetAxis("Mouse X") * xSpeed * distance * 0.02f;
				y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;
			}
		//	x += Input.GetAxis("Horizontal") * ySpeed * 0.02f;

				y = ClampAngle(y, yMinLimit, yMaxLimit);

				Quaternion rotation = Quaternion.Euler(y, x, 0);	

				Vector3 negDistance = new Vector3(0.0f, 0.0f, -distance);
				Vector3 position= rotation * negDistance + (target.position);;


			if(NormalViewBool == false){
					if(ZoomIn == true){
						position = rotation * negDistance + (target.position - new Vector3(0,-0.25f,0));
						}else if(ZoomIn == false){
						 position = rotation * negDistance + (target.position - new Vector3(0,-0.5f,0));
						}
					}else{
					 position = rotation * negDistance + (target.position - new Vector3(0,-0.8f,0));
				}				
				transform.rotation = rotation;
				transform.position = position;	

			if (SceneManager.GetActiveScene().name == "Outside")
			{
				if (NormalViewBool == false)
				{
					if (ZoomIn == false)
					{ 
						DistanceFun_In();
					}
					else if (ZoomIn == true)
					{
						DistanceFun_ZoomOut();
					}
				}
				else
				{
					NormalView();
				}
			}
			else
			{
				distance = 3.0f;
			}



			}
		}
		public static bool ZoomIn = false;
		public static bool DistanceRist;
		void DistanceFun_In(){	
			yMinLimit = 20;
			yMaxLimit = 75; 
			if((distance >=3 && distance <10)){
				distance += 0.5f;
				
			}			
		}
		void DistanceFun_ZoomOut(){	
		yMinLimit = 20;
		yMaxLimit = 75; 
			if(distance >3.01f){						
						distance -= 0.5f;
				}

		}	
		void NormalView(){
		yMinLimit = 15;
		yMaxLimit = 35; 
			distance = 5f;
//		if(distance >5){
//			distance -= 0.5f;			
//		} else if(distance <5){
//			distance += 0.5f;			
//		}

		}
		public static float ClampAngle(float angle, float min, float max)
		{
			if (angle < -360F)
				angle += 360F;
			if (angle > 360F)
				angle -= 360F;

			return Mathf.Clamp(angle, min, max);
		}
	}