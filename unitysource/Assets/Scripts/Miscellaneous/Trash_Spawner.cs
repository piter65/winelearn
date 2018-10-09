using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Trash_Spawner : MonoBehaviour 
{


	public GameObject trash_pfb;
	public int           numSpawnAtStart = 1;
	public float         spawnrateInSeconds = 60.0f;
	private static float _spawnrateTracker = 0.0f;

	private Transform[] _zones;

	public bool showGizmo = true;

	private static bool          _isFirstTime = true;
	private static List<int>     _persistentIndices;
	private static List<Vector3> _persistentLocations;

	public static void ClearStaticFields()
	{
		_spawnrateTracker = 0.0f;
		_isFirstTime = true;
		_persistentIndices = null;
		_persistentLocations = null;
	}

	// Use this for initialization
	void Start () 
	{
		_zones = new Transform[transform.childCount];
		for(int i=0; i< transform.childCount; i++)
		{
			_zones[i] = transform.GetChild(i);
			_zones[i].gameObject.name = "zone " + i;
			_zones[i].rotation = Quaternion.identity;
		}

		if(_isFirstTime)
		{
			InitTrash();
			_spawnrateTracker = Time.time + spawnrateInSeconds;
			_isFirstTime = false;
		}else
		{
			PersistantTrash();
		}
	
	}

	void Update()
	{
		// need some trash
		if(Time.time > _spawnrateTracker)
		{
			// how many times
			int num = Mathf.CeilToInt((Time.time-_spawnrateTracker)/spawnrateInSeconds);
			for(int i=0; i<num; i++)
				SpawnNewTrash();

			// reset
			_spawnrateTracker = Time.time + spawnrateInSeconds;
		}

	}

	private void InitTrash()
	{
		for(int i=0; i<numSpawnAtStart; i++)
			SpawnNewTrash();
	}

	private void SpawnNewTrash()
	{
		Vector3 pos = Vector3.zero;
		RaycastHit rayHit;
		// new trash
		// 1 get zone, 2 get position, 3 make it and put it there
		int     zone_i = Random.Range(0, _zones.Length);

		// look for vaccancy
		for(int i=0; i<_zones.Length; i++)
		{
			if(_zones[(zone_i + i) % _zones.Length].childCount == 0)
			{
				zone_i = (zone_i + i) % _zones.Length;
				break;
			}
		}

		// 2
		pos = new Vector3(
			_zones[zone_i].position.x + Random.Range(0, _zones[zone_i].localScale.x),
			0,
			_zones[zone_i].position.z + Random.Range(0, _zones[zone_i].localScale.z));
		pos -= new Vector3(
			_zones[zone_i].localScale.x * 0.5f,
			0,
			_zones[zone_i].localScale.z * 0.5f); // adjust

		// y Pos
		if(Physics.Raycast(pos + Vector3.up, Vector3.down, out rayHit))
			pos.y = rayHit.point.y;

		// 3
		GameObject trash_new = Instantiate(trash_pfb, pos, Quaternion.identity) as GameObject;

		trash_new.transform.SetParent(_zones[zone_i], true);

	}

	private void PersistantTrash()
	{
		// 1 get zone index, 2 get pos, 3 make it
	
		for(int i=0; i<_persistentIndices.Count; i++)
		{
			// 1
			int zone_i = _persistentIndices[i];
			// 2
			Vector3 pos = _persistentLocations[i];
			// 3
			GameObject trash_new = Instantiate(trash_pfb, pos, Quaternion.identity) as GameObject;
			trash_new.transform.SetParent(_zones[zone_i], true);

		}

	}

	// Mono
	private void OnDestroy()
	{
		// save it 
		_persistentIndices = new List<int>();
		_persistentLocations = new List<Vector3>();

		// 1 go through the zones, 2 find children, 3 store their locations

		// 1
		for(int i=0; i<_zones.Length; i++)
		{
			// 2
			for(int j=0; j<_zones[i].childCount; j++)
			{ // 3
				_persistentIndices.Add(i);
				_persistentLocations.Add(_zones[i].GetChild(j).position);
			}
		}

	}
	
	#region Gizmo

	private void OnDrawGizmos()	
	{
		DrawGizmos(false);
	}


//	private void OnDrawGizmosSelected()
//	{
//		DrawGizmos(true);
//	}
		
	private void DrawGizmos(bool selected)	
	{
		if(!showGizmo)
			return;

		//Gizmos.color = selected ? new Color(1,1,1,1) : new Color(1,1,1,0.5f);
		Gizmos.color = Color.white;

		_zones = new Transform[transform.childCount];
		for(int i=0; i< transform.childCount; i++)
		{
			_zones[i] = transform.GetChild(i);
			_zones[i].gameObject.name = "zone " + i;
			_zones[i].rotation = Quaternion.identity;
			Gizmos.DrawCube(_zones[i].position, _zones[i].localScale);
		}

	}

	#endregion
}
