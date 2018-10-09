using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine.UI;
using CharacterPos;
using SceneLoad;

public class RoomClickEvent : MonoBehaviour
{
	public GameObject Character;
	public GameObject scriptManage;
	IEnumerator Start()
	{
		yield return new WaitForSeconds(0.5f);
		if (UIManager.isCanvasLoaded == false)
		{
			scriptManage = Instantiate(scriptManage);
			DialogueState.Init();
		}
	}

	RaycastHit hit;
	void Update()
	{
		// BChance: (2016-03-09) - Allowed single button mouse input.
		//if (Input.GetMouseButtonDown(0)) //left click
		if (GLOBAL.IsLeftMouseDown())
		{
			Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
			if (Physics.Raycast(ray,out hit))
			{
				//Debug.LogError("=== Hit '" + hit.transform.name + "' ===");
				if((hit.transform.tag == "EnterRoom" ) && (hit.transform.name.Contains("Enter") | hit.transform.name.Contains("ENTER")))
				{
					//Debug.LogError(Vector3.Distance(hit.transform.position,Character.transform.position)+">>>>>>distance<<<<<<<");
					if (Vector3.Distance(hit.transform.position, Character.transform.position) < 5.0f)
					{
						// there is a DoorMat comp
						if(hit.transform.GetComponent<DoorMat>()){

							// get what action to take
							DoorMat.DoAction action = DoorMat.DoAction.Nothing;

							if(Application.isEditor){
								action = hit.transform.GetComponent<DoorMat>().editorAction;
							}else{
								action = hit.transform.GetComponent<DoorMat>().playerAction;
							}

							// perform the action
							switch(action){

							case DoorMat.DoAction.Enter:
								RoomId(hit.transform.name);
								if (this.gameObject.GetComponent<AudioSource>())
								{
									gameObject.GetComponent<AudioSource>().Play();
								}
								ObjectPos.CharacterPos(Character.transform.position,Character.transform.eulerAngles);
								break;

							case DoorMat.DoAction.Exit:
							case DoorMat.DoAction.Jumproom:
								// Load Jumproom
								LoadingScene.SceneLoad("Jumproom");
								break;

							case DoorMat.DoAction.Nothing:
								break;

							}

						}else{ // there is NOT a DoorMat comp

							RoomId(hit.transform.name);
							if (this.gameObject.GetComponent<AudioSource>())
							{
								gameObject.GetComponent<AudioSource>().Play();
							}
							ObjectPos.CharacterPos(Character.transform.position,Character.transform.eulerAngles);
						}
					}
				}
				
			}
		}
	}

	public float cout;
	public string RoomStr;
	void RoomId(string str)
	{
		LoadingScene.SceneLoad(str.Substring(6));
	}
}
