using UnityEngine;
using System.Collections;

public class test_text_encoding : MonoBehaviour
{

	// Use this for initialization
	void Start()
	{
		string path =
			@"file:///C:/Work/(Contracting)/Upwork/Zhenuity/Spill4/spill_git/unitysource/Lua/npc/Evelyn/w1p4_as_evelyn.lua";

		StartCoroutine(Web_Parse(path));
	}
	
	// Update is called once per frame
	void Update()
	{
	
	}

	private IEnumerator Web_Parse(string strPath)
	{
		WWW www = new WWW(strPath);
		yield return www;
		
		string strText = www.text;

		Debug.Log(strText);
	}
}
