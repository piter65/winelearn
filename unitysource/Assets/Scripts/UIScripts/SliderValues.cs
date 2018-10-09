using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class SliderValues : MonoBehaviour {

	public GameObject teamOffice,thirdperson,CityHall,Library,Internet,Crammarosas,Burells_Brothers ,Tied_dyed;
	public GameObject BoltrightsGarage ,eco_tech ,powerdisplay;


	void Disable(){
		thirdperson.SetActive(false);
		teamOffice.SetActive(false);
		CityHall.SetActive(false);
		Library.SetActive(false);
		Internet.SetActive(false);
		Crammarosas.SetActive(false);
		Burells_Brothers.SetActive(false);
		Tied_dyed.SetActive(false);
		BoltrightsGarage.SetActive(false);
		eco_tech.SetActive(false);
		powerdisplay.SetActive(false);
	}
	void Awake(){
		EnalbeSliders();
	}

	public void EnalbeSliders(){
		Disable();
		if (SceneManager.GetActiveScene().name == "Outside"){
			thirdperson.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "team_office"){
			teamOffice.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "city_hall"){
			CityHall.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "library"){
			Library.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "internet_cafe"){
			Internet.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "crammarosas"){
			Crammarosas.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "burells_brothers"){
			Burells_Brothers.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "Tied_dyed"){
			Tied_dyed.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "boltrights_garage"){
			BoltrightsGarage.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "eco_tech_ja_sounds"){
			eco_tech.SetActive(true);
		}
		else if (SceneManager.GetActiveScene().name == "power_displays"){
			powerdisplay.SetActive(true);
		}

		Debug.LogError("sliders enter");
	}
}
