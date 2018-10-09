using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class test_switch : MonoBehaviour
{
	public string target_scene = "";

	void Start()
	{
		Debug.Log("Scene '" + SceneManager.GetActiveScene().name + "' loaded.");
	}
	
	void Update()
	{
	
	}

	public void btn_Switch_Click()
	{
		SceneManager.LoadScene(target_scene);
	}
}
