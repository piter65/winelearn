using UnityEngine;
using System.Collections;

public class test_RemoteAudio : MonoBehaviour
{

	private string _strUrl;
	private AudioSource _source;

	void Awake()
	{
		_strUrl = Application.dataPath + "/../Lua/npc/Evelyn/ev9_22.ogg";

		#if UNITY_EDITOR
			_strUrl = "file:///" + _strUrl;
		#endif

		_strUrl = @"file:///C:/Work/(Contracting)/Upwork/Zhenuity/Spill4/spill_git/unitysource/Assets/../Lua/npc/Evelyn/ev9_00.ogg";
	}

	// Use this for initialization
	void Start()
	{
		WWW www = new WWW(_strUrl);
		_source = GetComponent<AudioSource>();
		_source.clip = www.GetAudioClip();
	}
	
	// Update is called once per frame
	void Update()
	{
		if (!_source.isPlaying && _source.clip.isReadyToPlay)
			_source.Play();
	}
}
