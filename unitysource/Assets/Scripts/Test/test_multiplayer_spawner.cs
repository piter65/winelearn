using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class test_multiplayer_spawner : MonoBehaviour
{
	public Multiplayer_ProxyController proxy_controller;

	public Multiplayer_Entity prefab_proxy;

	public Transform target;
	public Vector3[] spawn_points = new Vector3[0];

	private List<Multiplayer_Entity> _lst_proxies = new List<Multiplayer_Entity>();

	// Use this for initialization
	void Start()
	{
		for (int index_spawn_point = 0; index_spawn_point < spawn_points.Length; ++index_spawn_point)
		{
			Vector3 spawn_point = spawn_points[index_spawn_point];
			Multiplayer_Entity proxy = proxy_controller.SpawnProxy("Proxy " + index_spawn_point, spawn_point, Quaternion.identity);
			//Multiplayer_Entity proxy = Instantiate(prefab_proxy);
			//proxy.isProxy = true;
			//proxy.GetComponent<Rigidbody>().useGravity = false;
			//proxy.GetComponent<Collider>().isTrigger = true;
			//proxy.transform.position = spawn_point;
			//proxy.transform.rotation = Quaternion.identity;
			proxy.proxy_TargetPosition = target.position;

			_lst_proxies.Add(proxy);
		}
	}
	
	// Update is called once per frame
	void Update()
	{
		foreach (Multiplayer_Entity proxy in _lst_proxies)
		{
			proxy.proxy_TargetPosition = target.position;
		}
	}
}
