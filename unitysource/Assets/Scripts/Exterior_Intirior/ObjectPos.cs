using UnityEngine;
using System.Collections;

namespace CharacterPos{
public class ObjectPos : MonoBehaviour {

		public	static void CharacterPos(Vector3 vector , Vector3 euler  ){

			PlayerPrefs.SetFloat("posX",vector.x);
			PlayerPrefs.SetFloat("posY",vector.y);
			PlayerPrefs.SetFloat("posZ",vector.z);

			PlayerPrefs.SetFloat("posXeuler",euler.x);
			PlayerPrefs.SetFloat("posYeuler",euler.y);
			PlayerPrefs.SetFloat("posZeuler",euler.z);

			PlayerPrefs.SetInt("posPlay" , 1);

//			PlayerPrefs.SetFloat("posXCam",CamVector.x);
//			PlayerPrefs.SetFloat("posYCam",CamVector.y);
//			PlayerPrefs.SetFloat("posZCam",CamVector.z);
//			
//			PlayerPrefs.SetFloat("posXeulerCam",CamEuler.x);
//			PlayerPrefs.SetFloat("posYeulerCam",CamEuler.y);
//			PlayerPrefs.SetFloat("posZeulerCam",CamEuler.z);



		}
	}
}
