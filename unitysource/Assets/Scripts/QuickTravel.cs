using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class QuickTravel : MonoBehaviour
{

	// Use this for initialization
	void Start()
	{

	}
	
	// Update is called once per frame
	void Update()
	{
		#if UNITY_EDITOR

			if (GLOBAL_old.HotkeysEnabled)
			{
				if (Input.GetButton("Alt"))
				{
					// Alt + X to exit to outside.
					if (SceneManager.GetActiveScene().name != "Outside")
					{
						if (Input.GetKeyUp(KeyCode.X))
						{
							SceneManager.LoadScene("Outside");
							Debug.Log("== Quick Traveled to 'Outside' ==");
						}
					}
					// Alt + O to warp to the team office.
					if (SceneManager.GetActiveScene().name != "team_office")
					{
						if (Input.GetKeyUp(KeyCode.O))
						{
							SceneManager.LoadScene("team_office");
							Debug.Log("== Quick Traveled to 'team_office' ==");
						}
					}
					// Alt + R to warp to the team office.
					if (SceneManager.GetActiveScene().name != "Jumproom")
					{
						if (Input.GetKeyUp(KeyCode.R))
						{
							SceneManager.LoadScene("Jumproom");
							Debug.Log("== Quick Traveled to 'Jumproom' ==");
						}
					}
					//// Alt + Z to warp to random interior scene.
					//if (Input.GetKeyUp(KeyCode.Z))
					//{
					//	// Load a random interior from task 1, which at this time are level indices ranging from 8-36.
					//	int iLevelIndex = Random.Range(8, 36);
					//	SceneManager.LoadScene(iLevelIndex);
					//	Debug.Log("== Quick Traveled to scene " + iLevelIndex + " ==");
					//}
				}
			}

		#endif
	}
}
