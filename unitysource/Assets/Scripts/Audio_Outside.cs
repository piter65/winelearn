using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class Audio_Outside : MonoBehaviour
{
	private static Audio_Outside _instance;
	private AudioSource _audio_source;
	private float _max_volume;

	private string scene_name = "";

	void Awake()
	{
		_instance = this;
		_audio_source = GetComponent<AudioSource>();
		_max_volume = _audio_source.volume;
	}

	// Use this for initialization
	void Start()
	{
		Debug.Log("=== Audio_Outside Start ===");
	}
	
	// Update is called once per frame
	void Update()
	{
		string current_scene_name = SceneManager.GetActiveScene().name;

		//if (!scene_name.Equals(current_scene_name))
		//{
		//	scene_name = current_scene_name;
//
		//	Debug.LogError("scene_name: " + scene_name);
		//}

		if (current_scene_name.ToLower().Equals("outside"))
		{
			_audio_source.volume = _max_volume;
		}
		else
		{
			_audio_source.volume = 0.0f;
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	public static void Load()
	{
		// Only load if it's not already loaded.
		if (_instance == null)
		{
			SceneManager.LoadScene("Audio_Outside", LoadSceneMode.Additive);
		}
	}
}
