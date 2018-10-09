using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class PlayerControl_1 : MonoBehaviour
{

	public float walkSpeed = 0.15f;
	public float runSpeed = 1.0f;
	public float sprintSpeed = 2.0f;
	public float flySpeed = 4.0f;

	public float turnSmoothing = 3.0f;
	public float aimTurnSmoothing = 15.0f;
	public float speedDampTime = 0.1f;

	public float jumpHeight = 5.0f;
	public float jumpCooldown = 1.0f;

	private float timeToNextJump = 0;
	
	private float speed;

	private Vector3 lastDirection;

	private Animator anim;
	private int speedFloat;
	private int jumpBool;
	private int hFloat;
	private int vFloat;
	private int aimBool;
	private int flyBool;
	private int groundedBool;
	private Transform cameraTransform;

	private float h;
	private float v;

	private bool aim = false;

	private bool run;
	private bool sprint;

	private bool isMoving;

	// fly
	private bool fly = false;
	private float distToGround;
	private float sprintFactor;

	[SerializeField] GameObject MapViewCam ;

	public GameObject MultiProxyObj;

	void Awake()
	{
		//MultiProxyObj = Instantiate(Resources.Load("Prefabs/Multiplayer_ProxyController")) as GameObject;
		//MultiProxyObj.name = MultiProxyObj.name.Substring(0,(MultiProxyObj.name.Length-7));

		if(GameObject.Find("TopViewCamera") != null)
			MapViewCam = GameObject.Find("TopViewCamera");


		anim = GetComponent<Animator> ();
		cameraTransform = Camera.main.transform;

		speedFloat = Animator.StringToHash("Speed");
		jumpBool = Animator.StringToHash("Jump");
		hFloat = Animator.StringToHash("H");
		vFloat = Animator.StringToHash("V");
		aimBool = Animator.StringToHash("Aim");
		// fly
		flyBool = Animator.StringToHash ("Fly");
		groundedBool = Animator.StringToHash("Grounded");
		distToGround = GetComponent<Collider>().bounds.extents.y;
		sprintFactor = sprintSpeed / runSpeed;

		isCity = false;
		isTeam = false;
		if (PlayerPrefs.GetInt("posPlay") == 1)
		{
			if (SceneManager.GetActiveScene().name == "Outside")
			{
				this.gameObject.transform.position = new Vector3(PlayerPrefs.GetFloat("posX"),PlayerPrefs.GetFloat("posY"),PlayerPrefs.GetFloat("posZ"));
				this.gameObject.transform.eulerAngles = new Vector3(PlayerPrefs.GetFloat("posXeuler"),PlayerPrefs.GetFloat("posYeuler"),PlayerPrefs.GetFloat("posZeuler"));
				PlayerPrefs.SetInt("posPlay" , 0);
			}
		}

		if(GameObject.Find("ScriptManager") != null)
			GameObject.Find("ScriptManager").GetComponent<UIManager>().loadTopCam();

	}

	void Start(){
		if(GameObject.Find("NPC_values")!= null)
		{
			//Debug.LogError("sliders");
			GameObject.Find("NPC_values/DialogueDemo/Canvas/Panel").SendMessage("EnalbeSliders",SendMessageOptions.DontRequireReceiver);
		}
	}
	bool IsGrounded() {
		return Physics.Raycast(transform.position, -Vector3.up, distToGround + 0.1f);
	}

	//void RandomLevel(int levelNO){
//
	//	Debug.Log(levelNO+"\t\t\tkamla");
	//	switch(levelNO){
	//		case 1 :
	//		SceneManager.LoadScene("The Mane Hair Salon");
	//		break;
	//		case 2 :
	//		SceneManager.LoadScene("internet_cafe");
	//		break;
	//		case  3:
	//		SceneManager.LoadScene("burells_brothers");
	//		break;
	//		case  4:
	//		SceneManager.LoadScene("boltrights_garage");
	//		break;
	//		case  5:
	//		SceneManager.LoadScene("ForceOne");
	//		break;
	//		case  6:
	//		SceneManager.LoadScene("city_hall");
	//		break;
	//		case  7:
	//		SceneManager.LoadScene("library");
	//		break;
	//		case  8:
	//		SceneManager.LoadScene("mayors_office");
	//		break;
	//		case  9:
	//		SceneManager.LoadScene("Westren Logistics");
	//		break;
	//		case  10:
	//		SceneManager.LoadScene("Tchotchke");
	//		break;
	//		case  11:
	//		SceneManager.LoadScene("United Americans Club");
	//		break;
//
	//	}
	//}
	bool isRunfast ,isMapview;
	bool isTeam , isCity;
	void Update()
	{

		if (UI_ChatApp.isSelectInput == true)
			return;

		#if UNITY_EDITOR
		
			if (Input.GetButton("Alt"))
			{
				if(SceneManager.GetActiveScene().name != "Outside")
				{
					if (Input.GetKeyUp (KeyCode.X))
					{
						if (isCity == false)
							SceneManager.LoadScene("Outside");
						isCity = true;
					}
				}
				if(SceneManager.GetActiveScene().name != "team_office")
				{
					if (Input.GetKeyUp (KeyCode.O))
					{
						if (isTeam == false)
							SceneManager.LoadScene("team_office");
						isTeam = true;
					}
				}
				if(SceneManager.GetActiveScene().name != "jump_room")
				{
					if ( Input.GetKeyUp (KeyCode.R)  )
					{
						SceneManager.LoadScene("jump_room");
						isTeam = false;
					}

				}
				//if (Input.GetKeyUp (KeyCode.Z))
				//{
				//	// Load a random interior from task 1, which at this time are level indices ranging from 6-22.
				//	int iLevelIndex = Random.Range(6, 37);
				//	SceneManager.LoadScene(iLevelIndex);
				//	isCity = false;
				//}
			}

		#endif

		// fly
		if(Input.GetButtonDown ("Fly"))
			fly = !fly;
		fly = false;
		//aim = Input.GetButton("Aim");
		h = Input.GetAxis("Horizontal");
		v = Input.GetAxis("Vertical");
		run = Input.GetButton ("Run");
		sprint = Input.GetButton ("Sprint");
		if (Input.GetKeyUp (KeyCode.F)) {
			if(SceneManager.GetActiveScene().name == "Outside")
			{	
				if(isZoom == false)
				{
					isZoom = true;
				}
				else if(isZoom == true)
				{
					isZoom = false;
				}
			}
		}
		// -------------------------------------- map view -------------
		if (Input.GetKeyUp (KeyCode.M))
		{
			if(SceneManager.GetActiveScene().name == "Outside")
			{
				if(isMapview == false)
				{
					MapViewCam.SetActive(true);
					isMapview = true;
				}
				else if(isMapview == true)
				{
					MapViewCam.SetActive(false);				
					isMapview = false;
				}
			}
		}

//		Debug.LogError(run+"\t"+sprint);
		isMoving = Mathf.Abs(h) > 0.1 || Mathf.Abs(v) > 0.1;
	}

	void FixedUpdate()
	{
		if (UI_ChatApp.isSelectInput == true)
			return;

		anim.SetBool (aimBool, IsAiming());
		anim.SetFloat(hFloat, h);
		anim.SetFloat(vFloat, v);
		
		// Fly
		fly = false;
		anim.SetBool (flyBool, fly);
		GetComponent<Rigidbody>().useGravity = !fly;
		anim.SetBool (groundedBool, IsGrounded ());
		if(fly){
		//	FlyManagement(h,v);

		}else
		{
			MovementManagement (h, v, run, sprint);
			//JumpManagement ();
		}
	}

	// fly
	void FlyManagement(float horizontal, float vertical)
	{
		Vector3 direction = Rotating(horizontal, vertical);
		GetComponent<Rigidbody>().AddForce(direction * flySpeed * 100 * (sprint?sprintFactor:1));
	}

	void JumpManagement()
	{
		if (GetComponent<Rigidbody>().velocity.y < 10) // already jumped
		{
			anim.SetBool (jumpBool, false);
			if(timeToNextJump > 0)
				timeToNextJump -= Time.deltaTime;
		}
		if (Input.GetButtonDown ("Jump"))
		{
			anim.SetBool(jumpBool, true);
			if(speed > 0 && timeToNextJump <= 0 && !aim)
			{
				GetComponent<Rigidbody>().velocity = new Vector3(0, jumpHeight, 0);
				timeToNextJump = jumpCooldown;
			}
		}
	}

	void MovementManagement(float horizontal, float vertical, bool running, bool sprinting)
	{
		Rotating(horizontal, vertical);

		if(isMoving)
		{
			if(sprinting)
			{
				speed = sprintSpeed;
			}
			else if (running)
			{
				speed = runSpeed;
			}
			else
			{
				speed = walkSpeed;
			}

			anim.SetFloat(speedFloat, speed, speedDampTime, Time.deltaTime);
		}
		else
		{
			speed = 0f;
			anim.SetFloat(speedFloat, 0f);
		}
		GetComponent<Rigidbody>().AddForce(Vector3.forward*speed);
	}

	Vector3 Rotating(float horizontal, float vertical)
	{
		Vector3 forward = cameraTransform.TransformDirection(Vector3.forward);
		if (!fly)
			forward.y = 0.0f;
		forward = forward.normalized;

		Vector3 right = new Vector3(forward.z, 0, -forward.x);

		Vector3 targetDirection;

		float finalTurnSmoothing;

		if(IsAiming())
		{
			targetDirection = forward;
			finalTurnSmoothing = aimTurnSmoothing;
		}
		else
		{
			targetDirection = forward * vertical + right * horizontal;
			finalTurnSmoothing = turnSmoothing;
		}

		if((isMoving && targetDirection != Vector3.zero) || IsAiming())
		{
			Quaternion targetRotation = Quaternion.LookRotation (targetDirection, Vector3.up);
			// fly
			if (fly)
				targetRotation *= Quaternion.Euler (90, 0, 0);

			Quaternion newRotation = Quaternion.Slerp(GetComponent<Rigidbody>().rotation, targetRotation, finalTurnSmoothing * Time.deltaTime);
			GetComponent<Rigidbody>().MoveRotation (newRotation);
			lastDirection = targetDirection;
		}
		//idle - fly or grounded
		if(!(Mathf.Abs(h) > 0.9 || Mathf.Abs(v) > 0.9))
		{
			Repositioning();
		}

		return targetDirection;
	}	

	private void Repositioning()
	{
		Vector3 repositioning = lastDirection;
		if(repositioning != Vector3.zero)
		{
			repositioning.y = 0;
			Quaternion targetRotation = Quaternion.LookRotation (repositioning, Vector3.up);
			Quaternion newRotation = Quaternion.Slerp(GetComponent<Rigidbody>().rotation, targetRotation, turnSmoothing * Time.deltaTime);
			GetComponent<Rigidbody>().MoveRotation (newRotation);
		}
	}

	public bool IsFlying()
	{
		return fly;
	}

	public bool IsAiming()
	{
		return aim && !fly;
	}

	bool isZoom;
	public bool isSprinting()
	{
		return isZoom && !aim && (isMoving);
	}
}
