using UnityEngine;
using System.Collections;


public class FollowTarget : MonoBehaviour {



	[SerializeField] Transform targetTransform ;		// Transform to follow
	[SerializeField] bool faceForward ;		// Match forward vector?
	[SerializeField] private Transform thisTransform ;
	
	[SerializeField] Vector3 offsetLocation ;
	
	void Start()
	{
		thisTransform = transform;
				
	}
	
	void Update () 
	{
		thisTransform.localPosition = targetTransform.localPosition + offsetLocation;		
		if ( faceForward )
			thisTransform.forward = targetTransform.forward;
	}
}
