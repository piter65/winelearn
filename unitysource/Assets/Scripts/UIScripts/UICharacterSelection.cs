using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;

[Serializable]
public class UICharacterSelection {


	public Texture[] Head;
	public Texture[] Hand;
	public Texture[] Hair;
	public Texture[] GirlPant;
	public Texture[] BoyPant;

	public Texture[] Jocket;
	public Texture[] bicep;
	public Texture[] fore;


	public GameObject[] MaleCharacters;
	public GameObject[] FemaleCharacters;
	public Texture PlayerTextures;


	/***************	text fileds*********************/
	[SerializeField]
	public Text CharacterName;

	public GameObject CharacterPanel;

	public Button NextBtn,PrevBtn;
	public Button NextBtn_Hair,PrevBtn_Hair;
}
