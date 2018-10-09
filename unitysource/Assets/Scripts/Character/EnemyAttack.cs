using UnityEngine;
using System.Collections;

public class EnemyAttack : MonoBehaviour {

	Collider col;
	// Use this for initialization
	void Start () {
		col = this.gameObject.GetComponent<Collider> ();
	}
	float distance;
	RaycastHit hit;
	// Update is called once per frame
	void Update () {
		Ray ray = new Ray(transform.position, Vector3.forward);
		if(col.Raycast(ray, out hit, 100.0F)){
			Debug.Log(hit.transform.name);
		}
	}
}
