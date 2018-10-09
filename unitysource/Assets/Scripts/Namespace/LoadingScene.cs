using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using System;


namespace SceneLoad
{
	public class LoadingScene : MonoBehaviour
	{



		public static void SceneRandom(int ran)
		{

		}



		public static void SceneLoad(string sceneName)
		{
			try
			{
				SceneManager.LoadScene(sceneName);
			}
			catch (Exception ex)
			{
				Debug.LogError("Unable to load level '" + sceneName + "' because no scene with that name has been added to the build.");
			}

			//Debug.Log(sceneName);
			//switch(sceneName){
			//	/******************************************** 	task 1 *************************/
			//	case "internet_cafe" :	
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "tie_dyed_loft":	
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "crammarosas":		
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "new_city_tools_and_equipment" : 
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "burells_brothers" : 
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "running_rivers_corporation" : 
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "boltrights_garage" : 
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "ForceOne" : 
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "city_hall" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "library" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "mayors_office" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "ob_1_vizible_marketing" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "OB1_Hitech Security" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "ob_1_corporate_displays" : 
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "office_builiding_1" : 
			//		//SceneManager.LoadScene(sceneName);
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "team_office" :
			//			SceneManager.LoadScene(sceneName);
			//		break;
			//	case "techtronics_showroom" :
			//			SceneManager.LoadScene(sceneName);
			//		break;
			//	case "power_displays" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "paulines_clothing" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "new_city_cinema" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "eco_tech_ja_sounds" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "norse_communications_mega_mondo_merch" :
			//		SceneManager.LoadScene("sceneName");
			//		break;
//
//
//
			//	/******************************************** end of task 1 *****************/
//
			//	/******************************************** 	task 2 *************************/
			//	case "Can't Get Enough Media" : 
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//	case "First Responders" :
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//	case "West Disposal Services" :
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//	case "Hip Hop House" :
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//	case "Clean Green Machinery" :
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//	case "Office Building 2" :
			//		SceneManager.LoadScene(sceneName);
			//	break;
			//	case "Office Building 3" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Office Building" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Potty Princess" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Recording Studio" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "The Mane Hair Salon" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Westren Logistics" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Tchotchke" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Throne Time Showroom" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "United Americans Club" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//	case "Wes Bernilin's Mom's House" :
			//		SceneManager.LoadScene(sceneName);
			//		break;
			//
			//	/******************************************** end of task 2 *****************/
//
//
			//	case "Outside":		
			//	SceneManager.LoadScene(sceneName);
			//	break;
			//}

		}
	}
}
