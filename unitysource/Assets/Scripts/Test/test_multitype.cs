using UnityEngine;
using System.Collections;

public class test_multitype : MonoBehaviour
{

	// Use this for initialization
	void Start()
	{
		MultiType cost;
		MultiType curexp = 4000;
		MultiType profit = 11;
		MultiType initexp = 4000;

		cost = curexp + ((profit * initexp) / 100);

		Debug.LogError(string.Format("cost type: {0}", cost.type));
		Debug.LogError(string.Format("cost value: {0}", cost));
		Debug.LogError(string.Format("cost is_int: {0}", cost.IsInt));
		Debug.LogError(string.Format("cost is_string: {0}", cost.IsString));
		Debug.LogError(string.Format("curexp type: {0}", curexp.type));
		Debug.LogError(string.Format("curexp value: {0}", curexp));
		Debug.LogError(string.Format("curexp is_int: {0}", curexp.IsInt));
		Debug.LogError(string.Format("curexp is_string: {0}", curexp.IsString));
		Debug.LogError(string.Format("profit type: {0}", profit.type));
		Debug.LogError(string.Format("profit value: {0}", profit));
		Debug.LogError(string.Format("profit is_int: {0}", profit.IsInt));
		Debug.LogError(string.Format("profit is_string: {0}", profit.IsString));
		Debug.LogError(string.Format("initexp type: {0}", initexp.type));
		Debug.LogError(string.Format("initexp value: {0}", initexp));
		Debug.LogError(string.Format("initexp is_int: {0}", initexp.IsInt));
		Debug.LogError(string.Format("initexp is_string: {0}", initexp.IsString));
	}
	
	// Update is called once per frame
	void Update()
	{
	
	}
}
