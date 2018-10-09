using UnityEngine;
using System.Collections;

public enum CharacterTypeEnum
{
	generic_male,
	generic_female
};
public enum IdleType
{
	standing,
	sitting,
	looking_at_watch
};

public class CharacterType : MonoBehaviour
{
	public bool is_npc = true;
	public float orientation_speed = 180.0f;
	public CharacterTypeEnum type;
	public IdleType idle_type;
	public bool is_talking = false;
	private Animator _animator;
	private float _blend_is_talking = 0.0f;

	// Use this for initialization
	void Start()
	{
		_animator = GetComponent<Animator>();

		UpdateAnimator();

	}
	
	// Update is called once per frame
	void Update()
	{
		if (is_npc)
		{
			if (is_talking)
				_blend_is_talking = Mathf.Min(1.0f, _blend_is_talking + Time.deltaTime);
			else
				_blend_is_talking = Mathf.Max(0.0f, _blend_is_talking - Time.deltaTime);

			_animator.SetFloat("Blend_IsTalking", _blend_is_talking);

			if (   is_talking
				&& idle_type != IdleType.sitting)
			{
				OrientTowardPlayer();
			}
		}
	}

	private void OrientTowardPlayer()
	{
		Vector3 offset = GLOBAL.player_entity.transform.position - transform.position;
		offset.y = 0.0f;
		Vector3 direction = Vector3.Normalize(offset);
        Quaternion taget_rotation = Quaternion.LookRotation(direction);
        transform.rotation = Quaternion.RotateTowards(transform.rotation, taget_rotation, orientation_speed * Time.deltaTime);
	}

	public void UpdateAnimator()
	{
		float blend_is_male = 0.0f;
		float blend_is_sitting = 0.0f;
		float blend_idle_type = 0.0f;

		if (type == CharacterTypeEnum.generic_male)
		{
			blend_is_male = 0.0f;
		}
		else if (type == CharacterTypeEnum.generic_female)
		{
			blend_is_male = 1.0f;
		}

		if (idle_type == IdleType.standing)
		{
			blend_idle_type = 0.0f;
		}
		else if (idle_type == IdleType.sitting)
		{
			blend_is_sitting = 1.0f;
		}
		else if (idle_type == IdleType.looking_at_watch)
		{
			blend_idle_type = 1.0f;
		}

		if (_animator != null)
		{
			_animator.SetFloat("Blend_IsMale", blend_is_male);
			_animator.SetFloat("Blend_IsSitting", blend_is_sitting);
			_animator.SetFloat("Blend_IdleType", blend_idle_type);
		}

		//Debug.Log("_animator: " + _animator);
	}
}
