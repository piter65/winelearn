using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class test_dynamic_audio : MonoBehaviour
{
	public Text txt_message;
	public InputField input_url;

	private AudioSource _source;
	private string _url = null;

	void Awake()
	{
		//_url = Application.dataPath + "/../sounds/VC_T1P4E1_01.ogg";
//
		//#if UNITY_EDITOR
		//	_url = "http://www.spilldemo.com/sounds/VC_T1P4E1_01.ogg";
		//#endif

		_source = GetComponent<AudioSource>();

		//input_url.text = "http://spilldemo.com/sounds/90802__mickel11__ding-drum.mp3";
		input_url.text = "http://www.spilltest.com/get_file.php?file_name=./game/sounds/amb_billards1.ogg";
	}
	
	void Update()
	{
		txt_message.text = "AWAITING INPUT.";

		if (_url != null)
		{
			txt_message.text = "LOADING...";

			if (_source.clip != null)
			{
				txt_message.text = "LOADED.";

				if (_source.clip.isReadyToPlay)
				{
					if (_source.isPlaying)
					{
						txt_message.text = "PLAYING.";
					}
				}
			}
		}
	}

	private IEnumerator DownloadAudio()
	{
		_url = input_url.text;

	//#if !UNITY_EDITOR
	//	_url = _url.Replace("http://www.spilldemo.com", Application.dataPath + "/..");
	//#endif

		Debug.Log("_url: " + _url);

		yield return new WaitForSeconds(0.5f);

		WWW www = new WWW(_url);
		yield return www;

		string extension = _url.Substring(_url.Length - 4);
		Debug.Log("extension: " + extension);

		if (extension.Equals(".ogg"))
			_source.clip = www.GetAudioClip(false, false, AudioType.OGGVORBIS);
		else if (extension.Equals(".mp3"))
			_source.clip = www.GetAudioClip(false, false, AudioType.MPEG);
		else if (extension.Equals(".wav"))
			_source.clip = www.GetAudioClip(false, false, AudioType.WAV);
		else
			_source.clip = www.GetAudioClip(false, false, AudioType.UNKNOWN);

		yield return new WaitForSeconds(0.5f);
		
		_source.Play();
	}

	public void btn_Play_Click()
	{
		StartCoroutine(DownloadAudio());
	}
}
