using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System;

public class CharacterSelect : MonoBehaviour
{

	public UICharacterSelection characterSelect;
	public Characters ch;
	public GameObject AllAcharacters;
	public int df;

	public GameObject HairSetting;
	public Mesh[] Girl_HairMesh;
	public Mesh[] Boy_HairMesh;
	public string gender;

	public bool isMale = true;
	public int index_BodyMale = 0;
	public int index_BodyFemale = 0;
	public int index_HairMale = 0;
	public int index_HairFemale = 0;
	// Use this for initialization
	void Start()
	{
		// Ensure that the indices are within range.
		BoundBodyMaleIndex();
		BoundBodyFemaleIndex();
		BoundHairMaleIndex();
		BoundHairFemaleIndex();

		df = characterSelect.MaleCharacters.Length;
		for (int i = 0; i < characterSelect.MaleCharacters.Length; ++i)
		{
			characterSelect.MaleCharacters[i].SetActive(false);
		}
		for (int i = 0; i < characterSelect.FemaleCharacters.Length; ++i)
		{
			characterSelect.FemaleCharacters[i].SetActive(false);
		}
		characterSelect.CharacterPanel.SetActive(false);
		AllAcharacters.SetActive(false);
	}

	private void BoundBodyMaleIndex()
	{
		// If the index above range, keep decrementing until the index is within range.
		while (index_BodyMale >= characterSelect.MaleCharacters.Length)
		{
			index_BodyMale -= characterSelect.MaleCharacters.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_BodyMale < 0)
		{
			index_BodyMale += characterSelect.MaleCharacters.Length;
		}
	}

	private void BoundBodyFemaleIndex()
	{
		// If the index above range, keep decrementing until the index is within range.
		while (index_BodyFemale >= characterSelect.FemaleCharacters.Length)
		{
			index_BodyFemale -= characterSelect.FemaleCharacters.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_BodyFemale < 0)
		{
			index_BodyFemale += characterSelect.FemaleCharacters.Length;
		}
	}

	private void BoundHairMaleIndex()
	{
		// If the index above range, keep decrementing until the index is within range.
		while (index_HairMale >= Boy_HairMesh.Length)
		{
			index_HairMale -= Boy_HairMesh.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_HairMale < 0)
		{
			index_HairMale += Boy_HairMesh.Length;
		}
	}

	private void BoundHairFemaleIndex()
	{
		// If the index above range, keep decrementing until the index is within range.
		while (index_HairFemale >= Girl_HairMesh.Length)
		{
			index_HairFemale -= Girl_HairMesh.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_HairFemale < 0)
		{
			index_HairFemale += Girl_HairMesh.Length;
		}
	}

	private void ApplyHairToCharacter()
	{
		if (isMale)
		{
			// // Get the hair mesh for the current character.
			// Transform transform_Character = characterSelect.MaleCharacters[index_BodyMale].transform;
			// Mesh mesh_Hair = transform_Character.FindChild("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh;
// 
			// // Set the hair mesh to currently select one.
			// mesh_Hair = Boy_HairMesh[index_HairMale];

			characterSelect.MaleCharacters[index_BodyMale].transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh = Boy_HairMesh[index_HairMale];
		}
		else
		{
			// // Get the hair mesh for the current character.
			// Transform transform_Character = characterSelect.FemaleCharacters[index_BodyFemale].transform;
			// Mesh mesh_Hair = transform_Character.FindChild("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh;
// 
			// // Set the hair mesh to currently select one.
			// mesh_Hair = Girl_HairMesh[index_HairFemale];

			characterSelect.FemaleCharacters[index_BodyFemale].transform.Find("Hair").GetComponent<SkinnedMeshRenderer>().sharedMesh = Girl_HairMesh[index_HairFemale];
		}
	}

	/******************** sellected character enable *************************/
	public void CharactersEnalbe()
	{
		AllAcharacters.SetActive(true);
		for (int i = 0; i < characterSelect.MaleCharacters.Length; ++i)
		{
			characterSelect.MaleCharacters[i].SetActive(false);
		}
		for (int i = 0; i < characterSelect.FemaleCharacters.Length; ++i)
		{
			characterSelect.FemaleCharacters[i].SetActive(false);
		}
		CharCount = 0;

		if (isMale)
			characterSelect.MaleCharacters[index_BodyMale].SetActive(true);
		else
			characterSelect.FemaleCharacters[index_BodyFemale].SetActive(true);

		ApplyHairToCharacter();

		//gender = "male";
		//PlayerPrefs.SetString("Character",gender);

		//CharacterName();
	}
	/*************************** character selection ********************************************/
	public int CharCount;
	// public void NextBtn()
	// {
	// 	characterSelect.MaleCharacters[0].SetActive(false);
	// 	characterSelect.MaleCharacters[1].SetActive(false);
	// 	switch(CharCount)
	// 	{
	// 		case 0: 
	// 			characterSelect.MaleCharacters[0].SetActive(true);
	// 			gender = "male";
	// 			break;
	// 		case 1:
	// 			gender = "female";
	// 			characterSelect.MaleCharacters[1].SetActive(true);
	// 			break;
	// 	}
	// 	CharCount = CharCount +1;
	// 	if(CharCount>1)
	// 	{
	// 		CharCount = 0;
	// 	}
	// 	//	CharacterName();
	// 	PlayerPrefs.SetString("Character",gender);
	// }

	// public void PrevBtn()
	// {
	// 	characterSelect.MaleCharacters[0].SetActive(false);
	// 	characterSelect.MaleCharacters[1].SetActive(false);
	// 	switch(CharCount)
	// 	{
	// 		case 0: 
	// 			characterSelect.MaleCharacters[0].SetActive(true);
	// 			gender = "male";
	// 			break;
	// 		case 1:
	// 			characterSelect.MaleCharacters[1].SetActive(true);
	// 			gender = "female";
	// 			break;
	// 	}
	// 	CharCount = CharCount +1;
	// 	if(CharCount>1)
	// 	{
	// 		CharCount = 0;
	// 	}
	// 	//	CharacterName();
	// 	PlayerPrefs.SetString("Character",gender);
	// }

	public void btn_Gender_Click()
	{
		// Toggle the isMale flag.
		isMale = !isMale;

		// Toggle the male and female characters based on the isMale flag.
		characterSelect.MaleCharacters[index_BodyMale].SetActive(isMale);
		characterSelect.FemaleCharacters[index_BodyFemale].SetActive(!isMale);
	}

	public void btn_HairNext_Click()
	{
		if (isMale)
		{
			// Increment to the next hair mesh.
			++index_HairMale;
			BoundHairMaleIndex();
		}
		else
		{
			// Increment to the next hair mesh.
			++index_HairFemale;
			BoundHairFemaleIndex();
		}

		// Apply the new hair mesh.
		ApplyHairToCharacter();
	}

	public void btn_HairPrev_Click()
	{
		if (isMale)
		{
			// Increment to the prev hair mesh.
			--index_HairMale;
			BoundHairMaleIndex();
		}
		else
		{
			// Decrement to the prev hair mesh.
			--index_HairFemale;
			BoundHairFemaleIndex();
		}

		// Apply the new hair mesh.
		ApplyHairToCharacter();
	}

	public void btn_BodyNext_Click()
	{
		if (isMale)
		{
			// Hide the previous character.
			characterSelect.MaleCharacters[index_BodyMale].SetActive(false);

			// Increment to the next character.
			++index_BodyMale;
			BoundBodyMaleIndex();

			// Show the next character.
			characterSelect.MaleCharacters[index_BodyMale].SetActive(true);
		}
		else
		{
			// Hide the previous character.
			characterSelect.FemaleCharacters[index_BodyFemale].SetActive(false);

			// Increment to the next character.
			++index_BodyFemale;
			BoundBodyFemaleIndex();

			// Show the next character.
			characterSelect.FemaleCharacters[index_BodyFemale].SetActive(true);
		}
	}

	public void btn_BodyPrev_Click()
	{
		if (isMale)
		{
			// Hide the next character.
			characterSelect.MaleCharacters[index_BodyMale].SetActive(false);

			// Decrement to the previous character.
			--index_BodyMale;
			BoundBodyMaleIndex();

			// Show the previous character.
			characterSelect.MaleCharacters[index_BodyMale].SetActive(true);
		}
		else
		{
			// Hide the next character.
			characterSelect.FemaleCharacters[index_BodyFemale].SetActive(false);

			// Decrement to the previous character.
			--index_BodyFemale;
			BoundBodyFemaleIndex();

			// Show the previous character.
			characterSelect.FemaleCharacters[index_BodyFemale].SetActive(true);
		}
	}

	void CharacterName()
	{
		characterSelect.CharacterName.text = characterSelect.MaleCharacters[CharCount].name.ToString();
	}
	/*************************** end character selection ********************************************/

	/*************************** character Hair selection ********************************************/
	public int HairCountmale,HairCountfemale;

	public void SaveData()
	{
		// TODO: Save character select.

		//StartCoroutine(Web_SendData());
	}
	

	public void HairColor(GameObject obj)
	{
		//if (isMale)
		//{
		//	characterSelect.MaleCharacters[index_BodyMale].transform.FindChild("Hair").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = obj.GetComponent<Image>().color;
		//}
		//else
		//{
		//	characterSelect.FemaleCharacters[index_BodyFemale].transform.FindChild("Hair").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = obj.GetComponent<Image>().color;
		//}
	}
	public void SkinColor(GameObject obj)
	{
		//if (isMale)
		//{
		//	characterSelect.MaleCharacters[index_BodyMale].transform.FindChild("Body").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = obj.GetComponent<Image>().color;
		//}
		//else
		//{
		//	characterSelect.FemaleCharacters[index_BodyFemale].transform.FindChild("Body").GetComponent<SkinnedMeshRenderer>().sharedMaterials[0].color = obj.GetComponent<Image>().color;
		//}
	}

	private string GetAndSetPlayerData()
	{
		// Setup the player data to send to the server.
		JSONObject objJSON_PlayerData = new JSONObject();

		objJSON_PlayerData.AddField("last_update_time", DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss"));
		objJSON_PlayerData.AddField("isMale", isMale);

		// Store the player's global settings.
		GLOBAL.Player.progress["isMale"] = isMale;

		if (isMale)
		{
			objJSON_PlayerData.AddField("index_BodyModel", index_BodyMale);
			objJSON_PlayerData.AddField("index_HairModel", index_HairMale);

			// Store the player's global settings.
			GLOBAL.Player.progress["index_BodyModel"] = index_BodyMale;
			GLOBAL.Player.progress["index_HairModel"] = index_HairMale;
		}
		else
		{
			objJSON_PlayerData.AddField("index_BodyModel", index_BodyFemale);
			objJSON_PlayerData.AddField("index_HairModel", index_HairFemale);

			// Store the player's global settings.
			GLOBAL.Player.progress["index_BodyModel"] = index_BodyFemale;
			GLOBAL.Player.progress["index_HairModel"] = index_HairFemale;
		}

		return objJSON_PlayerData.ToString();
	}
}
