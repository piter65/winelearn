using UnityEngine;
using System.Collections;

public class CharacterNavAgentDirector : MonoBehaviour
{
	[SerializeField] Transform[] _targets;

	private CharacterNavAgent[] _arrCharacterAgents;

	// Use this for initialization
	void Start()
	{
		_arrCharacterAgents = GetComponentsInChildren<CharacterNavAgent>();
	}
	
	// Update is called once per frame
	void Update()
	{
		foreach (CharacterNavAgent agent in _arrCharacterAgents)
		{
			if (agent.needsNewTarget)
			{
				agent.SetTarget(_targets[Random.Range(0, _targets.Length)]);
			}
		}
	}
}
