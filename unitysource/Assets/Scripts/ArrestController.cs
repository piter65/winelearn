using UnityEngine;
using System.Collections;

public class ArrestController : MonoBehaviour
{
	public enum ArrestState
	{
		NO_ARREST,
		WILLIE_APPROACHING,
		ARRESTEE_FLEEING,
		ARRESTEE_LEAVING,
		WILLIE_LEAVING,
		ARREST_COMPLETE,
	};

	private static ArrestController _instance;

	public ArrestState arrest_state;

	public CharacterNavAgent character_willie;
	public CharacterNavAgent character_arrestee;
	public Transform exit_target;

	void Start()
	{
		_instance = this;

		character_willie.gameObject.SetActive(false);
	}
	
	void Update()
	{
		#if UNITY_EDITOR
			if (Input.GetKeyUp(KeyCode.P))
			{
				StartArrest();
			}
		#endif

		if (arrest_state == ArrestState.WILLIE_APPROACHING)
		{
			if (character_willie.isWaitingAtTarget)
			{
				Arrest_ArresteeFlees();
			}
		}
		else if (arrest_state == ArrestState.ARRESTEE_FLEEING)
		{
			Arrest_ArresteeLeaves();
		}
		else if (arrest_state == ArrestState.ARRESTEE_LEAVING)
		{
			if (character_arrestee.isWaitingAtTarget)
			{
				Arrest_WillieLeaves();

				//Debug.LogError("Arrestee Waiting...");
			}
		}
		else if (arrest_state == ArrestState.WILLIE_LEAVING)
		{
			if (character_willie.isWaitingAtTarget)
			{
				Arrest_Complete();
			}
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	public static void MakeArrest()
	{
		if (_instance != null)
			_instance.StartArrest();
		else
			Debug.LogError("!!! ERROR - No instance of ArrestController found. Cannot make arrest.");
	}

	private void StartArrest()
	{
		Arrest_WillieApproaches();
	}

	private void Arrest_WillieApproaches()
	{
		arrest_state = ArrestState.WILLIE_APPROACHING;

		character_willie.gameObject.SetActive(true);
		character_willie.transform.position = exit_target.position;

		GLOBAL.OrbitCam.OrbitLookAt(character_willie.transform.position);

		character_willie.agent.stoppingDistance = 1.0f;
		character_willie.SetTarget(character_arrestee.transform);
	}

	private void Arrest_ArresteeFlees()
	{
		arrest_state = ArrestState.ARRESTEE_FLEEING;

		GLOBAL.OrbitCam.OrbitLookAt(character_willie.transform.position);

		// TODO.
	}

	private void Arrest_ArresteeLeaves()
	{
		arrest_state = ArrestState.ARRESTEE_LEAVING;

		character_arrestee.agent.stoppingDistance = 0.1f;
		character_arrestee.SetTarget(exit_target);

		character_willie.agent.stoppingDistance = 0.6f;
		character_willie.SetTarget(character_arrestee.transform);
	}

	private void Arrest_WillieLeaves()
	{
		arrest_state = ArrestState.WILLIE_LEAVING;

		character_arrestee.gameObject.SetActive(false);

		character_willie.agent.stoppingDistance = 0.1f;
		character_willie.SetTarget(exit_target);
	}

	private void Arrest_Complete()
	{
		arrest_state = ArrestState.ARREST_COMPLETE;

		character_willie.gameObject.SetActive(false);
	}
}
