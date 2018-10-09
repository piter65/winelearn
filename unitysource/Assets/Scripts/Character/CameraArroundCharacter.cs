using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

[RequireComponent(typeof(CharacterController))]
public class CameraArroundCharacter : MonoBehaviour {

	public UIEventObject UIEventObject;

	//[SerializeField] Transform cameraPivot ;						// The transform used for camera rotation
	//[SerializeField] Transform cameraTransform ;					// The actual transform of the camera

	[SerializeField] Transform EyeCamera ;
	[SerializeField] GameObject MapViewCam ;



	[SerializeField] float speed  = 5f;								// Ground speed

	[SerializeField] float inAirMultiplier  = 0.25f; 				// Limiter for ground speed while jumping
	[SerializeField] Vector2 rotationSpeed = new Vector2( 50.0f, 25.0f );	// Camera rotation speed for each axis
	
	[SerializeField]  CharacterController character ;
	//private var animationController : AnimationControllerExt;
	[SerializeField]  Vector3 velocity;						// Used for continuing momentum while in air
	public bool ZoomInIn = false;
	public float CameraFV ,ZoomInValue,ZoomOutValue;
	void Start()
	{
		if(SceneManager.GetActiveScene().name == "Outside")
		{
			UIEventObject.HelpText.SetActive(false);
			UIEventObject.MapviewText.SetActive(false);
		

		if(EyeCamera == null)
			EyeCamera = GameObject.Find("EyeCamera").transform;
		EyeCamera.gameObject.SetActive (false);

		MapViewCam.SetActive(false);
		}
		isMapview = false;

		ZoomInIn = false;
		//CameraFV = cameraTransform.GetComponent<Camera> ().fieldOfView;
		ZoomOutValue = CameraFV;
		ZoomInValue = 15;
	}	

	public int ranValue ;
	//	bool NormalView = false ;
	//bool frontView = false;
//	bool RistrictRandom = false;

	public bool isMapview = true;
	private Vector3 movement;
	public float speedP;
	void Update()
	{
		/****************************************Keyboard controls *************************/
		if (Input.GetKeyUp (KeyCode.F))
		{
			if (SceneManager.GetActiveScene().name == "Outside")
			{
				OrbitCamera.NormalViewBool = false;	
				if (OrbitCamera.ZoomIn == false)
				{						
					OrbitCamera.ZoomIn = true;
				}
				else if (OrbitCamera.ZoomIn == true)
				{						
					OrbitCamera.ZoomIn = false;
				}
			}
		}

		if (Input.GetKeyUp (KeyCode.N))
		{									
			OrbitCamera.NormalViewBool = true;				
		}					
		// -------------------------------------- map view -------------
			if (Input.GetKeyUp (KeyCode.M))
			{
				if(SceneManager.GetActiveScene().name == "Outside")
				{
					if(isMapview == false)
					{
						MapViewCam.SetActive(true);
						UIEventObject.MapviewText.SetActive(true);
						isMapview = true;
					}
					else if(isMapview == true)
					{
						MapViewCam.SetActive(false);
						UIEventObject.MapviewText.SetActive(false);
						isMapview = false;
					}
				}
			}
		//----------------- character movement -------------------------
			var horizontal = Input.GetAxis("Horizontal");
			var vertical = Input.GetAxis("Vertical");

			//rotation * negDistance + (target.position);;
		/****************************************end Keyboard controls *************************/

		//movement = cameraTransform.TransformDirection (new Vector3 (Mathf.Sin (horizontal), 0, Mathf.Cos (horizontal)));
	
		// We only want the camera-space horizontal direction
		movement.y = 0;
		movement.Normalize(); // Adjust magnitude after ignoring vertical movement
		

		movement *= speed * (vertical);
	

		if ( !character.isGrounded )
		{	
			// Apply gravity to our velocity to diminish it over time
			velocity.y += Physics.gravity.y * Time.deltaTime;
			
			// Adjust additional movement while in-air
			movement.x *= inAirMultiplier;
			movement.z *= inAirMultiplier;
		}
		
		movement += velocity;
		movement += Physics.gravity;
		movement *= Time.deltaTime;
		
		// Actually move the character
		character.Move( movement );
		
		
		if ( character.isGrounded )
			// Remove any persistent velocity after landing
			velocity = Vector3.zero;
		
		// Face the character to match with where she is moving
			
		var camRotation = new Vector2(Mathf.Sin(horizontal) , Mathf.Cos(horizontal));		
		camRotation.x *= rotationSpeed.x;
		camRotation.y *= -rotationSpeed.y;
		camRotation *= Time.deltaTime;
		
		// Rotate around the character horizontally in world
		//cameraPivot.Rotate( 0, camRotation.x, 0, Space.World );
		//cameraPivot.Rotate( camRotation.y * -5, 0, 0 );	

	}
	public bool Normalzoom = false;

	IEnumerator CameraViewChange(){
		yield return new WaitForSeconds (1.5f);
		ZoomInIn = true;
		yield return new WaitForSeconds (5f);
		ZoomInIn = false;


	}


}