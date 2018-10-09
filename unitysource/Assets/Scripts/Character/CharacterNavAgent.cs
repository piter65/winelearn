using UnityEngine;
using System.Collections;

public class CharacterNavAgent : MonoBehaviour
{
	public bool needsNewTarget = true;
	public bool isWaitingAtTarget = false;
	[SerializeField] float _updateFrequency = 4;
	[SerializeField] float _patienceAtTarget = 2.0f;
	[SerializeField] float _runSpeed = 5.0f;
	[SerializeField] float _movingTurnSpeed = 360;
	[SerializeField] float _stationaryTurnSpeed = 180;
	[SerializeField] float _animSpeedMultiplier = 1f;

	private Transform _target;
	[HideInInspector] public UnityEngine.AI.NavMeshAgent agent;
	private Animator _animator;
	private float _turnAmount;
	private float _forwardAmount;
	private float _timeSinceLastUpdate = 0.0f;
	private float _timeSpentWaiting = 0.0f;

	void Awake()
	{
		agent = GetComponent<UnityEngine.AI.NavMeshAgent>();
		_animator = GetComponent<Animator>();
	}

	void Start()
	{
		needsNewTarget = _target == null;
	}

	void Update()
	{
		_timeSinceLastUpdate += Time.deltaTime;

		if (_target != null)
		{
			if (isWaitingAtTarget)
			{
				_timeSpentWaiting += Time.deltaTime;

				if (_timeSpentWaiting >= _patienceAtTarget)
				{
					needsNewTarget = true;
				}
			}

			float step = 1.0f / _updateFrequency;

			if (_timeSinceLastUpdate >= step)
			{
				_timeSinceLastUpdate = 0;

				agent.SetDestination(_target.position);
			}

			Move(Vector3.Normalize(agent.desiredVelocity));

#if UNITY_EDITOR
			// Helper to visualise agent and their target.
			Debug.DrawLine(transform.position + Vector3.up, _target.position + Vector3.up);
#endif
		}

		//RaycastHit hit;
		//if (Input.GetMouseButtonDown(0))
		//{
		//	Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
		//	if (Physics.Raycast(ray, out hit))
		//	{
		//		agent.SetDestination(hit.point);
//
		//		if (target_indicator != null)
		//			target_indicator.position = hit.point;
		//	}
		//}
//
		//Move(agent.destination - transform.position);
	}

	public void SetTarget(Transform target)
	{
		_target = target;

		needsNewTarget = false;

		isWaitingAtTarget = false;

		_timeSinceLastUpdate = 0.0f;
		_timeSpentWaiting = 0.0f;

		agent.SetDestination(_target.position);

		//Move(Vector3.Normalize(agent.desiredVelocity));
	}

	private void Move(Vector3 move)
	{
		if (!agent.pathPending)
		{
			if (agent.remainingDistance > agent.stoppingDistance)
			{
				// convert the world relative moveInput vector into a local-relative
				// turn amount and forward amount required to head in the desired
				// direction.
				if (move.magnitude > 1f)
					move.Normalize();
				
				move = transform.InverseTransformDirection(move);
				
				_turnAmount = Mathf.Atan2(move.x, move.z);
				_forwardAmount = move.z;
	
				ApplyExtraTurnRotation();
	
				// send input and other state parameters to the animator
				UpdateAnimator(move);
			}
			else
			{
				_animator.SetFloat("Forward", 0.0f);
				_animator.SetFloat("Turn", 0.0f);
	
				// Wait at the target for a bit before requesting a new target.
				isWaitingAtTarget = true;
			}
	
			//Debug.LogError(gameObject.name + ": [remainingDistance: " + agent.remainingDistance + ", stoppingDistance: " + agent.stoppingDistance);
		}
	}

	private void UpdateAnimator(Vector3 move)
	{
		float speedAdjust = agent.speed / _runSpeed;

		// update the animator parameters
		_animator.SetFloat("Forward", _forwardAmount * speedAdjust, 0.1f, Time.deltaTime);
		_animator.SetFloat("Turn", _turnAmount, 0.1f, Time.deltaTime);
		_animator.SetBool("Crouch", false);
		_animator.SetBool("OnGround", true);
		
		// the anim speed multiplier allows the overall speed of walking/running to be tweaked in the inspector,
		// which affects the movement speed because of the root motion.
		if (move.magnitude > 0)
		{
			_animator.speed = _animSpeedMultiplier;
		}
		else
		{
			// don't use that while airborne
			_animator.speed = 1;
		}
	}

	private void ApplyExtraTurnRotation()
	{
		// help the character turn faster (this is in addition to root rotation in the animation)
		float turnSpeed = Mathf.Lerp(_stationaryTurnSpeed, _movingTurnSpeed, _forwardAmount);
		transform.Rotate(0, _turnAmount * turnSpeed * Time.deltaTime, 0);
	}
}
