using UnityEngine;
using System.Collections;

public class CharacterFollow : MonoBehaviour {
	[SerializeField]
	private Transform player;
	[SerializeField]
	float deadZone = 0.15f;
	[SerializeField]
	float speed = 1.5f;
	[SerializeField]
	private bool isReachChar = false;
		
	void Update () {
		var v3 = player.position;
		v3.z = transform.position.z;
		if (Vector3.Distance (v3, player.position) < deadZone) {
			transform.position = Vector3.Lerp (transform.position, v3, speed * Time.deltaTime);
			isReachChar = true;
			transform.LookAt(player.transform);
		} else {
			isReachChar = false;
		}

	}

	bool anim(GameObject obj){
		if (isReachChar && obj.GetComponent<Animation> ().isPlaying) {
			obj.GetComponent<Animation> ().Stop();
			isReachChar = false;
		}else if(!isReachChar && !obj.GetComponent<Animation> ().isPlaying) {
			obj.GetComponent<Animation> ().Play();
		}
		return isReachChar;
	}
}
