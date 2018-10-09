using System;

using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[Serializable]
public class NPCTarget
{
	public Transform[] NPCTargetObj;
};


public class NavMesh : MonoBehaviour
{
	public NPCTarget NPCTarget;

	[SerializeField] UnityEngine.AI.NavMeshAgent agent;
	[SerializeField] Transform Target;
	[SerializeField] public static bool isZoomFalse;
	[SerializeField] Animation AnimObj;
	[SerializeField] string animStr1,animStr2;
	[SerializeField] bool boolAnimIdle;

	void Awake()
	{
		NPCTarget.NPCTargetObj = new Transform[15];
		for(int i = 0;i<15;i++)
		{
			NPCTarget.NPCTargetObj[i] = GameObject.Find("City/npc_crowd"+(i+1).ToString("00")).transform;
			NPCTarget.NPCTargetObj[i].gameObject.GetComponent<MeshRenderer>().enabled = false;

			//NPCTarget.NPCTargetObj[i] = GameObject.Find("Player_Character").transform;

		}	
		NPCTarget.NPCTargetObj[8] = GameObject.Find("Player_Character").transform;
		//NPCTarget.NPCTargetObj[11] = GameObject.Find("Player_Character").transform;
		NPCTarget.NPCTargetObj[5] = GameObject.Find("Player_Character").transform;

		Target = NPCTarget.NPCTargetObj[UnityEngine.Random.Range(0,13)];
		//animStr2 = "male_idle";
		//animStr1 = "walk";
		if (gameObject.tag  == "male")
		{
			animStr2 = "idle_male";
			animStr1 = "walk_male";
		}
		else if (gameObject.tag == "female")
		{
			animStr2 = "idle_female";
			animStr1 = "walk_female";
		}

		AnimObj = GetComponent<Animation>();	

		agent = GetComponent<UnityEngine.AI.NavMeshAgent>();
		CurrentAnim(animStr1);

	}

	public static bool isReachAI;
	void FixedUpdate()
	{
		if (Target != null)
			agent.SetDestination (Target.transform.position);
		if (Vector3.Distance(agent.transform.position, Target.transform.position) <= agent.stoppingDistance)
		{
			CurrentAnim(animStr2);
			if(boolAnimIdle == false)
			{
				StartCoroutine(NPCTargetChange());
			}

		}
		else
		{
			CurrentAnim(animStr1);
		}	

	}

	private string prevAnim;
	void CurrentAnim(string AnimStr)
	{
		AnimObj.CrossFade(AnimStr);
	}

	IEnumerator NPCTargetChange()
	{
		boolAnimIdle = true;
		yield return new WaitForSeconds(1.5f);
		Target = NPCTarget.NPCTargetObj[UnityEngine.Random.Range(0,13)];
		boolAnimIdle = false;
	}
};
