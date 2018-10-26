using UnityEngine;
using System.Collections;
using SceneLoad;

using CharacterPos;

public class ExitInterior : MonoBehaviour
{

	public GameObject Character;
	RaycastHit hit;
	public GameObject scriptManage;
	void Awake()
	{
		// if(UIManager.isCanvasLoaded == false)
		// {
		// 	scriptManage = Instantiate(Resources.Load("Prefabs/ScriptManager")) as GameObject;
		// 	scriptManage.name = scriptManage.name.Substring(0,(scriptManage.name.Length-7));
		// }

		UI_Manager_New.Load();
	}

	private void Start()
	{	

		GameObject.FindWithTag("Exit").GetComponent<BoxCollider>().isTrigger = true;
		if(GameObject.Find("Player_Character") != null)
			Character = GameObject.Find("Player_Character");
		else 
			Character = GameObject.Find("Player_Character");
	}
	void Update()
	{
		//// BChance: (2016-03-09) - Allowed single button mouse input.
		////if(Input.GetMouseButtonDown(0)) //left click
		//if (GLOBAL.IsLeftMouseDown())
		//{
		//	Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
		//	if(Physics.Raycast(ray,out hit))
		//	{
		//		//Debug.LogError("=== Hit '" + hit.transform.name + "' ===");
		//		if(hit.transform.tag.Contains("Exit"))
		//		{
		//			if(Vector3.Distance(hit.transform.position,Character.transform.position) <2.5f)
		//			{
		//				// there is a DoorMat comp
		//				if(hit.transform.GetComponent<DoorMat>()){
//
		//					// get what action to take
		//					DoorMat.DoAction action = DoorMat.DoAction.Nothing;
//
		//					if(Application.isEditor){
		//						action = hit.transform.GetComponent<DoorMat>().editorAction;
		//					}else{
		//						action = hit.transform.GetComponent<DoorMat>().playerAction;
		//					}
//
		//					// perform the action
		//					switch(action){
//
		//					case DoorMat.DoAction.Enter:
		//					case DoorMat.DoAction.Exit:
		//						LoadingScene.SceneLoad("Outside");
		//						if (this.gameObject.GetComponent<AudioSource>())
		//						{
		//							gameObject.GetComponent<AudioSource>().Play();
		//						}
		//						ObjectPos.CharacterPos(Character.transform.position,Character.transform.eulerAngles);
		//						break;
		//					case DoorMat.DoAction.Jumproom:
		//						// Load Jumproom
		//						LoadingScene.SceneLoad("Jumproom");
		//						break;
//
		//					case DoorMat.DoAction.Nothing:
		//						break;
//
		//					}
//
		//				}else{ // there is NOT a DoorMat comp
//
		//					LoadingScene.SceneLoad("Outside");
		//					if (this.gameObject.GetComponent<AudioSource>())
		//					{
		//						gameObject.GetComponent<AudioSource>().Play();
		//					}
		//					ObjectPos.CharacterPos(Character.transform.position,Character.transform.eulerAngles);
		//				}
//
		//			}
		//		} 		
//
		//	}
		//	
		//}
		
	}
	public float cout;
	public string RoomStr;
//	public Text RoomName; 
	void RoomId(string str)
	{
		//RoomName.text = str.Substring(6);
		LoadingScene.SceneLoad(str.Substring(6));
	}
}
