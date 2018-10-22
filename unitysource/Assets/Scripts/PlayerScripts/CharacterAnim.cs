using UnityEngine;
using System.Collections;

public class CharacterAnim : MonoBehaviour {
	public Anim Anim;
	public Animation p_animation;
	public string CurrentAnim,prevAnim;

	public Multiplayer_Entity multiplayer_Entity;

	private string _str_anim_idle;
	private string _str_anim_walk;

	// Use this for initialization
	void Start () {
		p_animation = GetComponent<Animation>();	
		CurrentAnim = _str_anim_idle;
		// CurrentAnim = Anim.anim_idle;
		//CurrentAnimation(CurrentAnim);

		// print("Name: " + name);

		//if (name.Equals("Will_Standon"))
		//{
		//	_str_anim_idle = "idle_male";
		//	_str_anim_walk = "walk_male";
		//}
		//else
		//{
		//	_str_anim_idle = "idle_female";
		//	_str_anim_walk = "walk_female";
		//}

		_str_anim_idle = Anim.anim_idle;
		_str_anim_walk = Anim.anim_walk;
	}
	
	// Update is called once per frame
	void Update () {
		
		// BChance: (2015-11-16) - Special handling for proxies.
		if (multiplayer_Entity != null && multiplayer_Entity.isProxy)
		{
			CurrentAnim = _str_anim_idle;
			// CurrentAnim = Anim.anim_idle;
			//CurrentAnimation(CurrentAnim);
			//Debug.Log(CurrentAnim+"\t"+gameObject.transform.parent.transform.parent.name);
			// If we're close to our target, idle.
			if (Vector3.Distance(multiplayer_Entity.proxy_PrevPosition, multiplayer_Entity.proxy_TargetPosition) < 0.1f)
			{
				CurrentAnim = _str_anim_idle;
				// CurrentAnim = Anim.anim_idle;
			}
			// Otherwise, walk.
			else
			{
				CurrentAnim = _str_anim_walk;
				// CurrentAnim = Anim.anim_walk;
			}

			CurrentAnimation(CurrentAnim);

			// CurrentAnim = _str_anim_walk;
			// CurrentAnim = Anim.anim_walk;
			// CurrentAnimation(CurrentAnim);


			// print("CurrentAnim: " + CurrentAnim);
		}
		else
		{
			var h = Input.GetAxis("Horizontal");
			var v = Input.GetAxis("Vertical");
			
			if(h == 0 && v == 0)
				CurrentAnim = _str_anim_idle;
				// CurrentAnim = Anim.anim_idle;

			CurrentAnimation(CurrentAnim);

			if(Input.GetKey(KeyCode.D) | Input.GetKey(KeyCode.W) | Input.GetKey(KeyCode.A) | Input.GetKey(KeyCode.S)){
				CurrentAnim = _str_anim_walk;
				// CurrentAnim = Anim.anim_walk;
			}
			if(Input.GetKey(KeyCode.LeftArrow) | Input.GetKey(KeyCode.UpArrow) | Input.GetKey(KeyCode.DownArrow) | Input.GetKey(KeyCode.RightArrow)){
				CurrentAnim = _str_anim_walk;
				// CurrentAnim = Anim.anim_walk;
			}
		}
	}

	void CurrentAnimation(string animation){

		if(prevAnim != animation){
			p_animation.CrossFade(animation);
			prevAnim = animation;
		}
		
	}
}
