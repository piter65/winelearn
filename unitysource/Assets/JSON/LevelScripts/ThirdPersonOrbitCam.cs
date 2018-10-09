using UnityEngine;
using System.Collections;

public class ThirdPersonOrbitCam : MonoBehaviour 
{
	public Transform player;
	public Texture2D crosshair;
	
	public Vector3 pivotOffset = new Vector3(0.0f, 1.0f,  0.0f);
	public Vector3 camOffset   = new Vector3(0.0f, 0.7f, -3.0f);

	public float smooth = 10f;

	public Vector3 aimPivotOffset = new Vector3(0.0f, 1.7f,  -0.3f);
	public Vector3 aimCamOffset   = new Vector3(0.8f, 0.0f, -1.0f);

	public float horizontalAimingSpeed = 400f;
	public float verticalAimingSpeed = 400f;
	public float maxVerticalAngle = 30f;
	public float flyMaxVerticalAngle = 60f;
	public float minVerticalAngle = -60f;
	
	public float mouseSensitivity = 0.3f;

	public float sprintFOV = 100f;
	
	private PlayerControl_1 playerControl;
	private float angleH = 0;
	private float angleV = 0;
	private Transform cam;

	private Vector3 relCameraPos;

	private float relCameraPosMag;
	
	private Vector3 smoothPivotOffset;
	private Vector3 smoothCamOffset;
	private Vector3 targetPivotOffset;
	private Vector3 targetCamOffset;

	private float defaultFOV;
	private float targetFOV;

	/*********************** OnLook ***********/
	private Transform _myTransform;
	public float damping = 6.0f;	//to control the rotation 

	public bool smoothOnLook = true;
	public float minDistance = 10.0f;	//How far the target is from the camera
	public string property = "";
	
	private Color color;
//	private float alpha = 1.0f;
	/*********************** end OnLook ***********/

	void Awake()
	{
		/************ OnLook transform ******************/
		_myTransform = transform;

		cam = transform;
		playerControl = player.GetComponent<PlayerControl_1> ();

		relCameraPos = transform.position - player.position;
		relCameraPosMag = relCameraPos.magnitude - 0.5f;

		smoothPivotOffset = pivotOffset;
		smoothCamOffset = camOffset;

		defaultFOV = cam.GetComponent<Camera>().fieldOfView;
		targetCamOffset = camOffset;
	}

	void LateUpdate()
	{
		if (UI_ChatApp.isSelectInput == true)
			return;

		angleH += Mathf.Clamp(Input.GetAxis("Horizontal")*Time.smoothDeltaTime, -1, 1) * horizontalAimingSpeed * Time.deltaTime;

		// BChance: (2016-03-09) - Allowed single button mouse input.
		//if (Input.GetKey ("mouse 1"))
		if (GLOBAL.IsRightMousePressed())
		{
			angleH += Mathf.Clamp(Input.GetAxis("Mouse X"), -1, 1) * horizontalAimingSpeed * Time.deltaTime;
			angleV += Mathf.Clamp(Input.GetAxis("Mouse Y"), -1, 1) * verticalAimingSpeed * Time.deltaTime;
		}

		// fly
		if(playerControl.IsFlying())
		{
			//angleV = Mathf.Clamp(angleV, minVerticalAngle, flyMaxVerticalAngle);
		}
		else
		{
			angleV = Mathf.Clamp(angleV, minVerticalAngle, maxVerticalAngle);
		}


		Quaternion aimRotation = Quaternion.Euler(-angleV, angleH, 0);
		Quaternion camYRotation = Quaternion.Euler(0, angleH, 0);
		cam.rotation = aimRotation;

		if(playerControl.IsAiming())
		{
			targetPivotOffset = aimPivotOffset;
			targetCamOffset = aimCamOffset;
		}
		else
		{
			targetPivotOffset = pivotOffset;
			targetCamOffset = camOffset;

		}

		if(playerControl.isSprinting())
		{
			targetFOV = sprintFOV;
		}
		else
		{
			targetFOV = defaultFOV;
		}

		cam.GetComponent<Camera>().fieldOfView = Mathf.Lerp (cam.GetComponent<Camera>().fieldOfView, targetFOV,  Time.deltaTime);

		// Test for collision
		Vector3 baseTempPosition = player.position + camYRotation * targetPivotOffset;
		Vector3 tempOffset = targetCamOffset;
		for(float zOffset = targetCamOffset.z; zOffset < 0; zOffset += 0.5f)
		{
			tempOffset.z = zOffset;
			if(DoubleViewingPosCheck(baseTempPosition + aimRotation * tempOffset))
			{
				targetCamOffset.z = tempOffset.z;
				break;
			}
		}

		// fly
		if(playerControl.IsFlying())
		{
			targetCamOffset.y = 0;
		}

		smoothPivotOffset = Vector3.Lerp(smoothPivotOffset, targetPivotOffset, smooth * Time.deltaTime);
		smoothCamOffset = Vector3.Lerp(smoothCamOffset, targetCamOffset, smooth * Time.deltaTime);



		cam.position =  player.position + camYRotation * smoothPivotOffset + aimRotation * smoothCamOffset;
//		if (Vector3.Distance (this.gameObject.transform.position, player.transform.position) <6.2f){
//			Debug.LogError(Vector3.Distance (this.gameObject.transform.position, player.transform.position)+"\t if");
//			LateUpdate_OnLook();
//		}else{
//			cam.position =  player.position + camYRotation * smoothPivotOffset + aimRotation * smoothCamOffset;
//			Debug.LogError(Vector3.Distance (this.gameObject.transform.position, player.transform.position)+"\t else");
//		}

	}

	// concave objects doesn't detect hit from outside, so cast in both directions
	bool DoubleViewingPosCheck(Vector3 checkPos)
	{
		return ViewingPosCheck (checkPos) && ReverseViewingPosCheck (checkPos);
	}

	bool ViewingPosCheck (Vector3 checkPos)
	{
		RaycastHit hit;
		
		// If a raycast from the check position to the player hits something...
		if(Physics.Raycast(checkPos, player.position - checkPos, out hit, relCameraPosMag))
		{
			// ... if it is not the player...
			if(hit.transform != player && !hit.transform.GetComponent<Collider>().isTrigger)
			{
				// This position isn't appropriate.
				return false;
			}
		}
		// If we haven't hit anything or we've hit the player, this is an appropriate position.
		return true;
	}

	bool ReverseViewingPosCheck(Vector3 checkPos)
	{
		RaycastHit hit;

		if(Physics.Raycast(player.position, checkPos - player.position, out hit, relCameraPosMag))
		{
			if(hit.transform != transform && !hit.transform.GetComponent<Collider>().isTrigger)
			{
				return false;
			}
		}
		return true;
	}

	/************************ Onlook fun *********************************/
	void LateUpdate_OnLook() {
		
		if(player) {
			//if (Vector3.Distance (this.gameObject.transform.position, player.transform.position) <6.2f)
			if(smoothOnLook) {
				//Look at and dampen the rotation
				Quaternion rotation = Quaternion.LookRotation(player.position - _myTransform.position);
				_myTransform.rotation = Quaternion.Slerp(_myTransform.rotation, rotation, Time.deltaTime * damping);
			}
			else { //Just look at
				_myTransform.rotation = Quaternion.FromToRotation(-Vector3.forward, (new Vector3(player.position.x, player.position.y, player.position.z) - _myTransform.position).normalized);
				
				//float distance = Vector3.Distance(player.position, _myTransform.position);
				
//				if(distance < minDistance) {
//					alpha = Mathf.Lerp(alpha, 0.0f, Time.deltaTime * 2.0f);
//				}
//				else {
//					alpha = Mathf.Lerp(alpha, 1.0f, Time.deltaTime * 2.0f);
//					
//				}
			}
		}
	}
	/************************End Onlook fun *********************************/
}
