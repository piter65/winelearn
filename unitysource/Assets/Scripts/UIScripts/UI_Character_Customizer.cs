using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using UnityEngine.UI;

public class UI_Character_Customizer : MonoBehaviour
{
	public Text txt_version;
	public Multiplayer_Entity player;

	void Awake()
	{
		// If the avatar is set, skip character customization.
		if (GLOBAL.Player.progress["is_avatar_set"].b)
		{
			SceneManager.LoadScene("team_office");
		}
	}

	void Start()
	{
		txt_version.text = "v." + CONFIG.VERSION;
	}
	
	void Update()
	{
	
	}

	public void ui_adjust_gender()
	{
		player.isMale = !player.isMale;

		player.ApplyPlayerModel();
	}

	public void ui_adjust_body_model(int increment)
	{
		player.index_BodyModel += increment;

		player.ApplyPlayerModel();
	}

	public void ui_adjust_hair_model(int increment)
	{
		player.index_HairModel += increment;

		player.ApplyPlayerModel();
	}

	public void ui_set_skin_color(int index)
	{
		player.index_SkinColor = index;

		player.ApplyPlayerModel();
	}

	public void ui_set_hair_color(int index)
	{
		player.index_HairColor = index;

		player.ApplyPlayerModel();
	}

	public void ui_Ok()
	{
		GLOBAL.Player.progress["isMale"] = player.isMale;
		GLOBAL.Player.progress["index_BodyModel"] = player.index_BodyModel;
		GLOBAL.Player.progress["index_HairModel"] = player.index_HairModel;
		GLOBAL.Player.progress["index_SkinColor"] = player.index_SkinColor;
		GLOBAL.Player.progress["index_HairColor"] = player.index_HairColor;
		GLOBAL.Player.progress["is_avatar_set"] = true;


		if (player.isMale)
			{GLOBAL.Player.Log("Male Avatar chosen.");}
		else
			{GLOBAL.Player.Log("Female Avatar chosen.");}


		SceneManager.LoadScene("team_office");
	}

	public void ui_Cancel()
	{
		SceneManager.LoadScene("login"); // - why cancel?pa
	}
}
