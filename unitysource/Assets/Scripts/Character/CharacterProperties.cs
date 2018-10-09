using UnityEngine;
using System.Collections;

public class CharacterProperties : MonoBehaviour
{

	public Mesh[] Girl_HairMesh = new Mesh[4];
	public Mesh[] Boy_HairMesh  = new Mesh[2];
	public GameObject[] Characters = new GameObject[2];
	private float hair_red,hair_blue,hair_green,hair_alpha;
	private float skin_red,skin_green,skin_blue,skin_alpha;
	IEnumerator Start()
	{
		yield return new WaitForSeconds(0.5f);
		Debug.Log(PlayerPrefs.GetString("Character")+"\tkamal 1");
		Characters[0].SetActive(false);
		Characters[1].SetActive(false);
		switch(PlayerPrefs.GetString("Character"))
		{
			case "male" :
				Characters[0].SetActive(true);
				Characters[0].transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh = Boy_HairMesh[PlayerPrefs.GetInt("HairMale")];
			//	Hair_Body(Characters[0].gameObject);
				break;
			case "female" :
				Characters[1].SetActive(true);
				if(PlayerPrefs.GetInt("HairFemale") == 0){
					Characters[1].transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh = Girl_HairMesh[3];
				}else{
				Characters[1].transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh = Girl_HairMesh[PlayerPrefs.GetInt("HairFemale")];
				}
				//Hair_Body(Characters[1].gameObject);
				break;
		}
	}
	void Hair_Body(GameObject obj)
	{
		//if(PlayerPrefs.GetFloat("Hair_Red") != 0.0f){
			hair_red = PlayerPrefs.GetFloat("Hair_Red");
			hair_blue = PlayerPrefs.GetFloat("Hair_Blue");
			hair_green = PlayerPrefs.GetFloat("Hair_Green");
			hair_alpha = PlayerPrefs.GetFloat("Hair_Alpha");			
			obj.transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = new Color(hair_red,hair_green,hair_blue,hair_alpha);
		//}
		//if(PlayerPrefs.GetFloat("skin_Red") != 0.0f){
			skin_red = PlayerPrefs.GetFloat("Skin_Red");
			skin_blue = PlayerPrefs.GetFloat("Skin_Blue");
			skin_green = PlayerPrefs.GetFloat("Skin_Green");
			skin_alpha = PlayerPrefs.GetFloat("Skin_Alpha");
			obj.transform.Find("Body").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = new Color(skin_red,skin_green,skin_blue,skin_alpha);
		//}
	}

}
