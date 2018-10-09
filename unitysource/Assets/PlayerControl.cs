using System;
using System.Collections;
using UnityEngine;


[Serializable]
public class Anim{
	public string anim_idle,anim_jump,anim_walk,anim_left,anim_right;

}
	
public class PlayerControl : MonoBehaviour {		
	public Anim Anim;
	public string CurrentAnim,prevAnim;
	public Animation p_animation;


	/**********************/
	[SerializeField] float m_MovingTurnSpeed = 360;
	[SerializeField] float m_StationaryTurnSpeed = 180;
//	[SerializeField] float m_JumpPower = 12f;
//	[Range(1f, 4f)][SerializeField] float m_GravityMultiplier = 2f;
//	[SerializeField] float m_RunCycleLegOffset = 0.2f; //specific to the character in sample assets, will need to be modified to work with others
//	[SerializeField] float m_MoveSpeedMultiplier = 1f;
	//[SerializeField] float m_AnimSpeedMultiplier = 1f;
	[SerializeField] float m_GroundCheckDistance = 0.1f;

	float m_TurnAmount;
	float m_ForwardAmount;
	Vector3 m_GroundNormal;
	/*********************/

	void Start(){
		p_animation = GetComponent<Animation>();	
		CurrentAnim = Anim.anim_idle;
		CurrentAnimation(CurrentAnim);
	}

	void CurrentAnimation(string animation){
		if(prevAnim != animation){
			p_animation.CrossFade(animation);
		    prevAnim = animation;
		}
		
	}

	public void Move(Vector3 move, bool crouch, bool jump){

		if (move.magnitude > 1f) move.Normalize();
		move = transform.InverseTransformDirection(move);
		//CheckGroundStatus();
		//move = Vector3.ProjectOnPlane(move, m_GroundNormal);
		m_TurnAmount = Mathf.Atan2(move.x, move.z);
		m_ForwardAmount = move.z;
		ApplyExtraTurnRotation();
	}
	void ApplyExtraTurnRotation()
	{
		// help the character turn faster (this is in addition to root rotation in the animation)
		float turnSpeed = Mathf.Lerp(m_StationaryTurnSpeed, m_MovingTurnSpeed, m_ForwardAmount);
		transform.Rotate(0, m_TurnAmount * turnSpeed * Time.deltaTime, 0);
	}

	void Update(){

		var h = Input.GetAxis("Horizontal");
		var v = Input.GetAxis("Vertical");

		if(h == 0 && v == 0)
			CurrentAnim = Anim.anim_idle;

		CurrentAnimation(CurrentAnim);


	}
	void FixedUpdate(){
//		if(Input.GetKey(KeyCode.RightArrow)){
//			CurrentAnim = Anim.anim_right;
//		}
//		if(Input.GetKey(KeyCode.LeftArrow | KeyCode.D )){
//			CurrentAnim = Anim.anim_walk;
//		}
		if(Input.GetKey(KeyCode.UpArrow) | Input.GetKey(KeyCode.W)){		
			CurrentAnim = Anim.anim_walk;
		}
		if(Input.GetKey(KeyCode.DownArrow) | Input.GetKey(KeyCode.S)){
			CurrentAnim = Anim.anim_walk;
		}

	}
	}